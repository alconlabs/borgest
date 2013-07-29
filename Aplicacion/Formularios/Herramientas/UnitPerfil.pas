unit UnitPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ExtCtrls, AdvPanel, CheckLst;

type
  TPerfil = class(TABMbase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    perfil_id: TEdit;
    Label1: TLabel;
    perfil_nombre: TEdit;
    menu: TTreeView;
    permisos: TCheckListBox;
    Label2: TLabel;
    Label4: TLabel;
    ZQPerfiles: TZQuery;
    procedure menuChange(Sender: TObject; Node: TTreeNode);
    procedure permisosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    path:string;
    function obtenerpath(nodo: TTreeNode): string;
    procedure recorrer(pri: TTreeNode; estado: boolean);
    procedure actualizarpermisos(camino:string; estado:boolean);
    procedure CrearArbol;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;

  public
    { Public declarations }
  end;

var
  Perfil: TPerfil;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TPerfil.agregar;
begin
    id:=Princ.codigo('perfiles','perfil_id');

    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('begin');
    ZQExecSQL.ExecSQL;


    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('insert into perfiles (perfil_id, perfil_nombre) ');
    ZQExecSQL.SQL.Add('values (:perfil_id, :perfil_nombre) ');
    ZQExecSQL.ParamByName('perfil_id').AsString:=id;
    ZQExecSQL.ParamByName('perfil_nombre').AsString:=perfil_nombre.Text;
    ZQExecSQL.ExecSQL;


    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('insert into menuperfil (menuperfil_id, menuperfil_habilitado, ');
    ZQExecSQL.SQL.Add('menuperfil_agregar, menuperfil_eliminar, menuperfil_modificar, ');
    ZQExecSQL.SQL.Add('menuperfil_anular, menuperfil_imprimir, menuperfil_ver, menuperfil_clonar, ');
    ZQExecSQL.SQL.Add('menu_id, perfil_id) ');
    ZQExecSQL.SQL.Add('values (:menuperfil_id, :menuperfil_habilitado, ');
    ZQExecSQL.SQL.Add(':menuperfil_agregar, :menuperfil_eliminar, :menuperfil_modificar, ');
    ZQExecSQL.SQL.Add(':menuperfil_anular, :menuperfil_imprimir, :menuperfil_ver, :menuperfil_clonar, ');
    ZQExecSQL.SQL.Add(':menu_id, :perfil_id) ');

    ZQSelect.First;
    while not ZQSelect.Eof do
        begin
            ZQExecSQL.ParamByName('menuperfil_id').AsString:='0';
            ZQExecSQL.ParamByName('menuperfil_habilitado').AsString:=ZQSelect.FieldByName('menuperfil_habilitado').AsString;
            ZQExecSQL.ParamByName('menuperfil_agregar').AsString:=ZQSelect.FieldByName('menuperfil_agregar').AsString;
            ZQExecSQL.ParamByName('menuperfil_eliminar').AsString:=ZQSelect.FieldByName('menuperfil_eliminar').AsString;
            ZQExecSQL.ParamByName('menuperfil_modificar').AsString:=ZQSelect.FieldByName('menuperfil_modificar').AsString;
            ZQExecSQL.ParamByName('menuperfil_anular').AsString:=ZQSelect.FieldByName('menuperfil_anular').AsString;
            ZQExecSQL.ParamByName('menuperfil_imprimir').AsString:=ZQSelect.FieldByName('menuperfil_imprimir').AsString;
            ZQExecSQL.ParamByName('menuperfil_ver').AsString:=ZQSelect.FieldByName('menuperfil_ver').AsString;
            ZQExecSQL.ParamByName('menuperfil_clonar').AsString:=ZQSelect.FieldByName('menuperfil_clonar').AsString;
            ZQExecSQL.ParamByName('menu_id').AsString:=ZQSelect.FieldByName('menu_id').AsString;
            ZQExecSQL.ParamByName('perfil_id').AsString:=id;
            ZQExecSQL.ExecSQL;


            ZQSelect.Next;
        end;

    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('commit');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;


procedure TPerfil.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin
              if control then
                agregar;

          end;
        2:begin
              if control then
                modificar;

          end;
        3:begin
              if (MessageDlg('Seguro desea eliminar este Perfil?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;

          end;
    end;
end;

procedure TPerfil.modificar;
begin
    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('begin');
    ZQExecSQL.ExecSQL;


    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('update perfiles set');
    ZQExecSQL.SQL.Add('perfil_nombre=:perfil_nombre ');
    ZQExecSQL.SQL.Add('where perfil_id=:perfil_id ');
    ZQExecSQL.ParamByName('perfil_id').AsString:=id;
    ZQExecSQL.ParamByName('perfil_nombre').AsString:=perfil_nombre.Text;
    ZQExecSQL.ExecSQL;


    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('update menuperfil set  ');
    ZQExecSQL.SQL.Add('menuperfil_habilitado=:menuperfil_habilitado, ');
    ZQExecSQL.SQL.Add('menuperfil_agregar=:menuperfil_agregar, ');
    ZQExecSQL.SQL.Add('menuperfil_modificar=:menuperfil_modificar, ');
    ZQExecSQL.SQL.Add('menuperfil_eliminar=:menuperfil_eliminar, ');
    ZQExecSQL.SQL.Add('menuperfil_anular=:menuperfil_anular, ');
    ZQExecSQL.SQL.Add('menuperfil_imprimir=:menuperfil_imprimir, ');
    ZQExecSQL.SQL.Add('menuperfil_ver=:menuperfil_ver, ');
    ZQExecSQL.SQL.Add('menuperfil_clonar=:menuperfil_clonar, ');
    ZQExecSQL.SQL.Add('menu_id=:menu_id, ');
    ZQExecSQL.SQL.Add('perfil_id=:perfil_id ');
    ZQExecSQL.SQL.Add('where menuperfil_id=:menuperfil_id ');

    ZQSelect.First;
    while not ZQSelect.Eof do
        begin
            ZQExecSQL.ParamByName('menuperfil_id').AsString:=ZQSelect.FieldByName('menuperfil_id').AsString;
            ZQExecSQL.ParamByName('menuperfil_habilitado').AsString:=ZQSelect.FieldByName('menuperfil_habilitado').AsString;
            ZQExecSQL.ParamByName('menuperfil_agregar').AsString:=ZQSelect.FieldByName('menuperfil_agregar').AsString;
            ZQExecSQL.ParamByName('menuperfil_eliminar').AsString:=ZQSelect.FieldByName('menuperfil_eliminar').AsString;
            ZQExecSQL.ParamByName('menuperfil_modificar').AsString:=ZQSelect.FieldByName('menuperfil_modificar').AsString;
            ZQExecSQL.ParamByName('menuperfil_anular').AsString:=ZQSelect.FieldByName('menuperfil_anular').AsString;
            ZQExecSQL.ParamByName('menuperfil_imprimir').AsString:=ZQSelect.FieldByName('menuperfil_imprimir').AsString;
            ZQExecSQL.ParamByName('menuperfil_ver').AsString:=ZQSelect.FieldByName('menuperfil_ver').AsString;
            ZQExecSQL.ParamByName('menuperfil_clonar').AsString:=ZQSelect.FieldByName('menuperfil_clonar').AsString;
            ZQExecSQL.ParamByName('menu_id').AsString:=ZQSelect.FieldByName('menu_id').AsString;
            ZQExecSQL.ParamByName('perfil_id').AsString:=id;
            ZQExecSQL.ExecSQL;


            ZQSelect.Next;
        end;

    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('commit');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;
end;

procedure TPerfil.eliminar;
begin
    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('begin');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Delete from menuperfil');
    ZQExecSQL.sql.add(' where perfil_id=:perfil_id');
    ZQExecSQL.parambyname('perfil_id').asstring:=id;
    ZQExecSQL.ExecSQL;

    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Delete from perfiles');
    ZQExecSQL.sql.add(' where perfil_id=:perfil_id');
    ZQExecSQL.parambyname('perfil_id').asstring:=id;
    ZQExecSQL.ExecSQL;

    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('commit');
    ZQExecSQL.ExecSQL;

    MessageDlg('El perfil fue eliminado', mtInformation, [mbOK], 0);
    Self.Close;
end;

function TPerfil.control:boolean;
var
  i:integer;
begin
    i:=0;




    result:=i=0;
end;

procedure TPerfil.CrearArbol;
var
  i,itemscount:integer;
begin
    menu.LoadFromFile(extractfilepath(application.ExeName)+'menu.txt');
    menu.FullExpand;
    i:=0;
    while (i <= menu.Items.Count-1) do
      begin
          try
            path:=obtenerpath(menu.Items[i]);
            if not ZQSelect.Locate('menu_path',path,[]) then
              menu.Items[i].Delete
            else
              i:=i+1;
          finally
            menu.Update;
            itemscount:=menu.Items.Count;
          end;

      end;
    menu.FullCollapse;
end;

procedure TPerfil.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
      if abm=1 then
        begin
            perfil_id.Text:=Princ.codigo('perfiles','perfil_id');
            perfil_nombre.Text:='';


            ZQSelect.ParamByName('perfil_id').AsString:='1';

        end
      else
        begin
            ZQPerfiles.Active:=false;
            ZQPerfiles.ParamByName('perfil_id').AsString:=id;
            ZQPerfiles.Active:=true;

            perfil_id.Text:=id;
            perfil_nombre.Text:=ZQPerfiles.FieldByName('perfil_nombre').AsString;

            ZQSelect.ParamByName('perfil_id').AsString:=id;
        end;
    ZQSelect.Active:=true;
end;

procedure TPerfil.menuChange(Sender: TObject; Node: TTreeNode);
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
                permisos.Checked[0]:=strtobool(ZQSelect.FieldByName('menuperfil_habilitado').AsString);
                permisos.Checked[1]:=strtobool(ZQSelect.FieldByName('menuperfil_agregar').AsString);
                permisos.Checked[2]:=strtobool(ZQSelect.FieldByName('menuperfil_modificar').AsString);
                permisos.Checked[3]:=strtobool(ZQSelect.FieldByName('menuperfil_eliminar').AsString);
                permisos.Checked[4]:=strtobool(ZQSelect.FieldByName('menuperfil_anular').AsString);
                permisos.Checked[5]:=strtobool(ZQSelect.FieldByName('menuperfil_imprimir').AsString);
                permisos.Checked[6]:=strtobool(ZQSelect.FieldByName('menuperfil_ver').AsString);
                permisos.Checked[7]:=strtobool(ZQSelect.FieldByName('menuperfil_clonar').AsString);

            end
          else
            begin
                permisos.Enabled:=false;
            end;

      end;

end;
procedure TPerfil.recorrer(pri: TTreeNode; estado: boolean);
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



procedure TPerfil.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;

    CrearArbol;
end;

procedure TPerfil.actualizarpermisos(camino:string; estado:boolean);
begin
    if ZQSelect.Locate('menu_path',camino,[]) then
      begin
          ZQSelect.Edit;
          ZQSelect.FieldByName('menuperfil_habilitado').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_agregar').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_modificar').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_eliminar').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_anular').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_imprimir').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_ver').AsString:=booltostr(estado);
          ZQSelect.FieldByName('menuperfil_clonar').AsString:=booltostr(estado);
          ZQSelect.Post;
      end;




end;

function TPerfil.obtenerpath(nodo: TTreeNode): string;
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



procedure TPerfil.permisosClick(Sender: TObject);
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
                permiso:=strtobool(ZQSelect.FieldByName('menuperfil_habilitado').AsString);
            end;

          if permiso then
            begin
                recorrer(menu.Selected,permisos.Checked[0]);
                ZQSelect.Locate('menu_path',path,[]);

                if strtobool(ZQSelect.FieldByName('menuperfil_habilitado').AsString) <> permisos.Checked[0] then
                  begin
                      for i:=0 to permisos.Items.Count-1 do
                        permisos.Checked[i]:=permisos.Checked[0];
                  end;



                ZQSelect.Edit;
                ZQSelect.FieldByName('menuperfil_habilitado').AsString:=booltostr(permisos.Checked[0]);
                ZQSelect.FieldByName('menuperfil_agregar').AsString:=booltostr(permisos.Checked[1]);
                ZQSelect.FieldByName('menuperfil_modificar').AsString:=booltostr(permisos.Checked[2]);
                ZQSelect.FieldByName('menuperfil_eliminar').AsString:=booltostr(permisos.Checked[3]);
                ZQSelect.FieldByName('menuperfil_anular').AsString:=booltostr(permisos.Checked[4]);
                ZQSelect.FieldByName('menuperfil_imprimir').AsString:=booltostr(permisos.Checked[5]);
                ZQSelect.FieldByName('menuperfil_ver').AsString:=booltostr(permisos.Checked[6]);
                ZQSelect.FieldByName('menuperfil_clonar').AsString:=booltostr(permisos.Checked[7]);
                ZQSelect.Post;

            end;
      end;



    menu.SetFocus;
end;

end.
