unit Unitlocalidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, UnitSqlComboBox;

type
  Tlocalidades = class(TForm)
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
    fil_provincia_nombre: TEdit;
    fil_localidad_id: TEdit;
    fil_localidad_nombre: TEdit;
    Label1: TLabel;
    localidad_id: TEdit;
    Button1: TButton;
    Button6: TButton;
    ZQuery2: TZQuery;
    Label5: TLabel;
    localidad_nombre: TEdit;
    provincia_id: TSqlComboBox;
    Label11: TLabel;
    Label2: TLabel;
    localidad_codigopostal: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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
  localidades: Tlocalidades;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tlocalidades.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from localidades ');
    ZQuery2.SQL.Add('where localidad_id=:localidad_id');
    ZQuery2.ParamByName('localidad_id').AsString:=ZQGrilla.FieldByName('localidad_id').AsString;
    ZQuery2.ExecSQL;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;


end;



procedure Tlocalidades.FormCreate(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

procedure Tlocalidades.modificar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update localidades set ');
    ZQuery2.sql.add('localidad_nombre=:localidad_nombre, ');
    ZQuery2.sql.add('provincia_id=:provincia_id, ');
    ZQuery2.sql.add('localidad_codigopostal=:localidad_codigopostal ');
    ZQuery2.sql.add('where localidad_id=:localidad_id');
    ZQuery2.parambyname('localidad_nombre').asstring:=localidad_nombre.text;
    ZQuery2.parambyname('provincia_id').asstring:=provincia_id.codigo;
    ZQuery2.parambyname('localidad_id').asstring:=localidad_id.text;
    ZQuery2.parambyname('localidad_codigopostal').asstring:=localidad_codigopostal.text;

    ZQuery2.ExecSQL;



    Panelabm.Visible:=false;


end;


procedure Tlocalidades.agregar;
begin

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into localidades (localidad_id, localidad_nombre, ');
    ZQuery2.sql.add('provincia_id, localidad_codigopostal) values (:localidad_id, :localidad_nombre, ');
    ZQuery2.sql.add(':provincia_id, :localidad_codigopostal)');
    ZQuery2.parambyname('localidad_id').asstring:=princ.codigo('localidades','localidad_id');
    ZQuery2.parambyname('localidad_nombre').asstring:=localidad_nombre.text;
    ZQuery2.parambyname('provincia_id').asstring:=provincia_id.codigo;
    ZQuery2.parambyname('localidad_codigopostal').asstring:=localidad_codigopostal.text;

    ZQuery2.ExecSQL;


    Panelabm.Visible:=false;


end;



function Tlocalidades.control:boolean;
var
  error:integer;
begin
    error:=0;

    if localidad_nombre.Text='' then
      error:=1;

    if provincia_id.Text='' then
      error:=2;




    case error of
        1:begin
              MessageDlg('Ingrese nombre de la localidad', mtError, [mbOK], 0);
              localidad_nombre.SetFocus;
          end;

        2:begin
              MessageDlg('Seleccione una provincia', mtError, [mbOK], 0);
              provincia_id.SetFocus;
          end;



    end;

    if error=0 then
      result:=true
    else
      result:=false;

      
end;

procedure Tlocalidades.Button1Click(Sender: TObject);
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

procedure Tlocalidades.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar esta localidad?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;

end;

procedure Tlocalidades.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          localidad_id.Text:=ZQGrilla.FieldByName('localidad_id').AsString;
          localidad_nombre.Text:=ZQGrilla.FieldByName('localidad_nombre').AsString;
          provincia_id.llenarcombo;
          provincia_id.Buscar(ZQGrilla.FieldByName('provincia_id').AsString);
          localidad_codigopostal.Text:=ZQGrilla.FieldByName('localidad_codigopostal').AsString;
          Panelabm.Visible:=true;
          localidad_nombre.SetFocus;

      end;

end;

procedure Tlocalidades.Button4Click(Sender: TObject);
begin
    abm:=1;
    Panelabm.Visible:=true;
    localidad_id.Text:=princ.codigo('localidades','localidad_id');
    localidad_nombre.Text:='';
    localidad_nombre.SetFocus;
    provincia_id.llenarcombo;
//    provincia_id.ItemIndex:=0;

end;

procedure Tlocalidades.Button5Click(Sender: TObject);
begin
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from localidades inner join provincias on localidades.provincia_id=provincias.provincia_id where 1=1';
    if fil_localidad_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_id like "%'+fil_localidad_id.Text+'"';

    if fil_localidad_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_nombre like "%'+fil_localidad_nombre.Text+'%"';

    if fil_provincia_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_nombre like "%'+fil_provincia_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by localidad_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tlocalidades.Button6Click(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

end.
