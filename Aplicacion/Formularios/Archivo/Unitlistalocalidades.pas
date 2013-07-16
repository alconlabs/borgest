unit Unitlistalocalidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel,
  UnitSqlComboBox;

type
  TListaLocalidades = class(Tlistabase)
    fil_localidad_nombre: TEdit;
    fil_provincia_nombre: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    localidad_id: TEdit;
    localidad_nombre: TEdit;
    provincia_id: TSqlComboBox;
    localidad_codigopostal: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  ListaLocalidades: TListaLocalidades;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaLocalidades.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update localidades set ');
    ZQuery2.Sql.Add('provincia_id=:provincia_id, ');
    ZQuery2.Sql.Add('localidad_codigopostal=:localidad_codigopostal, ');
    ZQuery2.Sql.Add('localidad_nombre=:localidad_nombre ');
    ZQuery2.Sql.Add('where localidad_id=:localidad_id ');
    ZQuery2.ParamByName('provincia_id').AsString:=provincia_id.codigo;
    ZQuery2.ParamByName('localidad_codigopostal').AsString:=localidad_codigopostal.Text;
    ZQuery2.ParamByName('localidad_nombre').AsString:=localidad_nombre.Text;
    ZQuery2.ParamByName('localidad_id').AsString:=localidad_id.Text;
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;


end;


procedure TListaLocalidades.agregar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into localidades set ');
    ZQuery2.Sql.Add('provincia_id=:provincia_id, ');
    ZQuery2.Sql.Add('localidad_codigopostal=:localidad_codigopostal, ');
    ZQuery2.Sql.Add('localidad_nombre=:localidad_nombre, ');
    ZQuery2.Sql.Add('localidad_id=:localidad_id ');
    ZQuery2.ParamByName('provincia_id').AsString:=provincia_id.codigo;
    ZQuery2.ParamByName('localidad_codigopostal').AsString:=localidad_codigopostal.Text;
    ZQuery2.ParamByName('localidad_nombre').AsString:=localidad_nombre.Text;
    ZQuery2.ParamByName('localidad_id').AsString:=princ.codigo('localidades','localidad_id');
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;
end;



function TListaLocalidades.control:boolean;
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

procedure TListaLocalidades.eliminar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('delete from localidades ');
    ZQuery2.Sql.Add('where localidad_id=:localidad_id ');
    ZQuery2.ParamByName('localidad_id').AsString:=ZQGrilla.FieldByName('localidad_id').AsString;
    ZQuery2.ExecSql;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;


end;

procedure TListaLocalidades.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar esta localidad?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;
end;

procedure TListaLocalidades.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from localidades inner join provincias on localidades.provincia_id=provincias.provincia_id where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_id like "%'+fil_id.Text+'"';

    if fil_localidad_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_nombre like "%'+fil_localidad_nombre.Text+'%"';

    if fil_provincia_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_nombre like "%'+fil_provincia_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by localidad_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaLocalidades.btnguardarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaLocalidades.btnmodificarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaLocalidades.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    localidad_id.Text:=princ.codigo('localidades','localidad_id');
    localidad_nombre.Text:='';
    localidad_nombre.SetFocus;
    provincia_id.llenarcombo;
end;

end.
