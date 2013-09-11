unit UnitMenuConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ExtCtrls, AdvPanel, CheckLst;

type
  TMenuConfig = class(TABMbase)
    menu: TTreeView;
    permisos: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure menuChange(Sender: TObject; Node: TTreeNode);
    procedure permisosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure menuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    path:string;
    function obtenerpath(nodo: TTreeNode): string;
    procedure recorrer(pri: TTreeNode; estado: boolean);
    procedure actualizarpermisos(camino:string; estado:boolean);
    procedure GuardarArbolDB;
  public
    { Public declarations }
  end;

var
  MenuConfig: TMenuConfig;

implementation

uses UnitPrinc;

{$R *.dfm}



procedure TMenuConfig.GuardarArbolDB;
var
  nodopadre:TTreeNode;
  i:integer;
  path:string;
  codi:string;
begin
    for i:=0 to menu.Items.Count-1 do
      begin
          path:='>'+menu.Items.Item[i].Text;
          nodopadre:=menu.Items.Item[i].Parent;
          while nodopadre <> nil do
              begin
                  path:='>'+nodopadre.Text+path;

                  nodopadre:=nodopadre.Parent;
              end;

          codi:=princ.Codigo('menu','menu_id');
          ZQExecSQL.sql.clear;
          ZQExecSQL.sql.add('Insert into menu (menu_id, menu_path)');
          ZQExecSQL.sql.add('values (:menu_id, :menu_path)');
          ZQExecSQL.parambyname('menu_id').asstring:=codi;
          ZQExecSQL.parambyname('menu_path').asstring:=path;
          ZQExecSQL.ExecSQL;
      end;

end;

procedure TMenuConfig.actualizarpermisos(camino:string; estado:boolean);
begin
    if ZQSelect.Locate('menu_path',camino,[]) then
      begin
          ZQSelect.Edit;
          ZQSelect.FieldByName('menu_enabled').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menu_visible').AsString:=booltostr(estado);
          ZQSelect.Post;
      end;




end;


procedure TMenuConfig.recorrer(pri: TTreeNode; estado: boolean);
var
 signext, espadre:boolean;
 camino:string;
 aux, ant:TTreeNode;

begin
    signext:=true;
    aux:=pri;
    while aux.HasChildren do
        aux:=aux.getFirstChild;
    while aux<>pri do
        begin
            signext:=true;
            while signext do
                begin
                    try
                      if not espadre then
                       begin
                           while aux.HasChildren do
                               aux:=aux.getFirstChild;
                       end;
                      espadre:=false;
                      camino:=obtenerpath(aux);
                      actualizarpermisos(camino,estado);
                      ant:=aux;
                      aux:=aux.GetNextChild(aux);
                    except
                      signext:=false;
                    end;

                end;

            ant:=ant.Parent;
            aux:=ant;
            espadre:=true;

        end;

end;




procedure TMenuConfig.menuChange(Sender: TObject; Node: TTreeNode);
var
  nodopadre:TTreeNode;
begin
  inherited;
    if menu.Tag=1 then
      begin
          path:=self.obtenerpath(menu.Selected);
          if ZQSelect.Locate('menu_path',path,[]) then
            begin
                permisos.Enabled:=true;
                permisos.Checked[0]:=strtobool(ZQSelect.FieldByName('menu_visible').AsString);
                permisos.Checked[1]:=strtobool(ZQSelect.FieldByName('menu_enabled').AsString);
            end
          else
            begin
                permisos.Enabled:=false;
            end;

      end;

end;

procedure TMenuConfig.menuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  menu_id:string;
  menu_nomb:string;
  menu_form:string;
  menu_lista:string;
begin
    if (Shift=[ssShift,ssCtrl]) and (key=VK_F5) then     //INSERTA REGISTRO EN LA TABLA MENUPERFIL, PERO DEBE YA DEBE ESTAR EL REGISTRO EN LA TABLA MENU
      begin
          if not permisos.Enabled then
            begin
                menu_id:=Princ.buscar('select menu_id from menu where menu_path="'+path+'"','menu_id');

                if menu_id='' then
                  begin
                      menu_id:=Princ.Codigo('menu','menu_id');

                      menu_nomb:=InputBox('menu_nomb',menu_nomb, menu_nomb);
                      menu_form:=InputBox('menu_form',menu_form, menu_form);
                      menu_lista:=InputBox('menu_lista',menu_lista, menu_lista);

                      ZQExecSQL.sql.clear;
                      ZQExecSQL.sql.add('Insert into menu (menu_id, menu_path, ');
                      ZQExecSQL.sql.add('menu_tipo, menu_nomb, menu_form, ');
                      ZQExecSQL.sql.add('menu_enabled, menu_visible, menu_lista) ');
                      ZQExecSQL.sql.add('values (:menu_id, :menu_path, ');
                      ZQExecSQL.sql.add(':menu_tipo, :menu_nomb, :menu_form, ');
                      ZQExecSQL.sql.add(':menu_enabled, :menu_visible, :menu_lista) ');
                      ZQExecSQL.parambyname('menu_id').asstring:=menu_id;
                      ZQExecSQL.parambyname('menu_path').asstring:=path;
                      ZQExecSQL.parambyname('menu_tipo').asstring:='0';
                      ZQExecSQL.parambyname('menu_nomb').asstring:=menu_nomb;
                      ZQExecSQL.parambyname('menu_form').asstring:=menu_form;
                      ZQExecSQL.parambyname('menu_lista').asstring:=menu_lista;
                      ZQExecSQL.parambyname('menu_enabled').asstring:='0';
                      ZQExecSQL.parambyname('menu_visible').asstring:='0';
                      ZQExecSQL.ExecSQL;
                  end;


                ZQExecSQL.SQL.Clear;
                ZQExecSQL.SQL.Add('INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,'+menu_id+',perfil_id,-1 from perfiles');
                ZQExecSQL.ExecSQL;

                MessageDlg('Nuevo item de menu agregado correctamente', mtInformation, [mbOK], 0);
            end;


      end;

end;

function TMenuConfig.obtenerpath(nodo: TTreeNode): string;
var
  nodopadre:TTreeNode;
  camino:string;
begin

    camino:='>'+nodo.Text;
    nodopadre:=nodo.Parent;
    while nodopadre <> nil do
        begin
            camino:='>'+nodopadre.Text+camino;


            nodopadre:=nodopadre.Parent;
        end;

    result:=camino;

end;


procedure TMenuConfig.permisosClick(Sender: TObject);
var
  i:integer;
  padre:TTreeNode;
  caminopadre:string;
  permiso:boolean;
begin
    permiso:=true;
    if ZQSelect.Locate('menu_path',path,[]) then
      begin
          padre:=menu.Selected.Parent;
          if padre<>nil then
            begin
                caminopadre:=obtenerpath(padre);
                ZQSelect.Locate('menu_path',caminopadre,[]);
                if strtobool(ZQSelect.FieldByName('menu_visible').AsString) then
                  begin
                      permiso:=true;

                  end
                else
                  begin
                      permiso:=false;

                  end;


            end;

          if permiso then
            begin
                recorrer(menu.Selected,permisos.Checked[0]);
                ZQSelect.Locate('menu_path',path,[]);
                ZQSelect.Edit;
                ZQSelect.FieldByName('menu_visible').AsString:=booltostr(permisos.Checked[0]);
                ZQSelect.FieldByName('menu_enabled').AsString:=booltostr(permisos.Checked[1]);
                ZQSelect.Post;

            end;
      end;



    menu.SetFocus;
end;

procedure TMenuConfig.btnguardarClick(Sender: TObject);
begin
  inherited;
    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('update menu set ');
    ZQExecSQL.SQL.Add('menu_enabled=:menu_enabled, ');
    ZQExecSQL.SQL.Add('menu_visible=:menu_visible ');
    ZQExecSQL.SQL.Add('where menu_id=:menu_id');

    ZQSelect.First;
    while not ZQSelect.Eof do
        begin
            ZQExecSQL.ParamByName('menu_enabled').AsString:=ZQSelect.FieldByName('menu_enabled').AsString;
            ZQExecSQL.ParamByName('menu_visible').AsString:=ZQSelect.FieldByName('menu_visible').AsString;
            ZQExecSQL.ParamByName('menu_id').AsString:=ZQSelect.FieldByName('menu_id').AsString;
            ZQExecSQL.ExecSQL;
            ZQSelect.Next;
        end;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;
end;

procedure TMenuConfig.Button1Click(Sender: TObject);
begin
  inherited;
    GuardarArbolDB;
end;

procedure TMenuConfig.FormCreate(Sender: TObject);
begin
  inherited;
    menu.LoadFromFile(extractfilepath(application.ExeName)+'menu.txt');
    ZQSelect.Active:=true;
end;

end.
