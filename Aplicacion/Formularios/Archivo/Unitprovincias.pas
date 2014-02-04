unit Unitprovincias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, UnitSqlComboBox;

type
  Tprovincias = class(TForm)
    panelgrilla: TAdvPanel;
    panelabm: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ZQGrilla: TZQuery;
    DSCgrilla: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    fil_pais_nombre: TEdit;
    fil_provincia_id: TEdit;
    fil_provincia_nombre: TEdit;
    Label1: TLabel;
    provincia_id: TEdit;
    Button1: TButton;
    Button6: TButton;
    ZQuery2: TZQuery;
    Label5: TLabel;
    provincia_nombre: TEdit;
    pais_id: TSqlComboBox;
    Label11: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    abm:integer;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  provincias: Tprovincias;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tprovincias.eliminar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('delete from provincias ');
    ZQuery2.Sql.Add('where provincia_id=:provincia_id ');
    ZQuery2.ParamByName('provincia_id').AsString:=provincia_id.Text;
    ZQuery2.ExecSql;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;


end;



procedure Tprovincias.FormCreate(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

procedure Tprovincias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tprovincias.FormShow(Sender: TObject);
begin
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tprovincias.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update provincias set ');
    ZQuery2.Sql.Add('pais_id=:pais_id, ');
    ZQuery2.Sql.Add('provincia_nombre=:provincia_nombre ');
    ZQuery2.Sql.Add('where provincia_id=:provincia_id ');
    ZQuery2.ParamByName('pais_id').AsString:=pais_id.codigo;
    ZQuery2.ParamByName('provincia_nombre').AsString:=provincia_nombre.Text;
    ZQuery2.ParamByName('provincia_id').AsString:=provincia_id.Text;
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;


end;


procedure Tprovincias.agregar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into provincias set ');
    ZQuery2.Sql.Add('pais_id=:pais_id, ');
    ZQuery2.Sql.Add('provincia_nombre=:provincia_nombre, ');
    ZQuery2.Sql.Add('provincia_id=:provincia_id ');
    ZQuery2.ParamByName('pais_id').AsString:=pais_id.codigo;
    ZQuery2.ParamByName('provincia_nombre').AsString:=provincia_nombre.Text;
    ZQuery2.ParamByName('provincia_id').AsString:=princ.codigo('provincias','provincia_id');
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;
end;



function Tprovincias.control:boolean;
var
  error:integer;
begin
    error:=0;

    if provincia_nombre.Text='' then
      error:=1;

    if pais_id.Text='' then
      error:=2;




    case error of
        1:begin
              MessageDlg('Ingrese nombre de la provincia', mtError, [mbOK], 0);
              provincia_nombre.SetFocus;
          end;

        2:begin
              MessageDlg('Seleccione un pais', mtError, [mbOK], 0);
              pais_id.SetFocus;
          end;



    end;

    if error=0 then
      result:=true
    else
      result:=false;

      
end;

procedure Tprovincias.Button1Click(Sender: TObject);
begin
    case abm of
        1:begin  //agregar
              if control then
                begin
                    agregar;
                    abm:=0;
                    ZQGrilla.Active:=false;
                    ZQGrilla.Active:=true;

                    Panelabm.Visible:=false;

                end;


          end;
        2:begin  //modificar
              if control then
                begin
                    modificar;
                    abm:=0;
                    ZQGrilla.Active:=false;
                    ZQGrilla.Active:=true;

                    Panelabm.Visible:=false;

                end;

          end;

        3:begin  //eliminar
              if Application.MessageBox('Seguro desea eliminar este proveedor?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
                eliminar;

          end;


    end;

end;

procedure Tprovincias.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar esta provincia?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;

end;

procedure Tprovincias.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          provincia_id.Text:=ZQGrilla.FieldByName('provincia_id').AsString;
          provincia_nombre.Text:=ZQGrilla.FieldByName('provincia_nombre').AsString;
          pais_id.llenarcombo;
          pais_id.Buscar(ZQGrilla.FieldByName('pais_id').AsString);
          Panelabm.Visible:=true;
          provincia_nombre.SetFocus;

      end;

end;

procedure Tprovincias.Button4Click(Sender: TObject);
begin
    abm:=1;
    Panelabm.Visible:=true;
    provincia_id.Text:=princ.codigo('provincias','provincia_id');
    provincia_nombre.Text:='';
    provincia_nombre.SetFocus;
    pais_id.llenarcombo;
//    provincia_id.ItemIndex:=0;

end;

procedure Tprovincias.Button5Click(Sender: TObject);
begin
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from provincias inner join paises on provincias.pais_id=paises.pais_id where 1=1';
    if fil_provincia_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_id like "%'+fil_provincia_id.Text+'"';

    if fil_provincia_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_nombre like "%'+fil_provincia_nombre.Text+'%"';

    if fil_pais_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and pais_nombre like "%'+fil_pais_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by provincia_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tprovincias.Button6Click(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

end.
