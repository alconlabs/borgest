unit UnitListaSucursales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel, GBTEdit, UnitSqlComboBox;

type
  Tlistasucursales = class(Tlistabase)
    fil_sucursal_nombre: TGTBEdit;
    fil_sucursal_domicilio: TGTBEdit;
    fil_sucursal_telefono: TGTBEdit;
    empresa_id: TSqlComboBox;
    Label11: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    sucursal_id: TGTBEdit;
    sucursal_nombre: TGTBEdit;
    sucursal_domicilio: TGTBEdit;
    Label3: TLabel;
    sucursal_telefono: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
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
  listasucursales: Tlistasucursales;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tlistasucursales.agregar;
begin
    id:=princ.codigo('sucursales','sucursal_id');
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into sucursales (sucursal_id, sucursal_nombre, sucursal_domicilio, ');
    ZQuery2.sql.add('sucursal_telefono, empresa_id) ');
    ZQuery2.sql.add('values (:sucursal_id, :sucursal_nombre, :sucursal_domicilio, ');
    ZQuery2.sql.add(':sucursal_telefono, :empresa_id) ');
    ZQuery2.parambyname('sucursal_id').asstring:=id;
    ZQuery2.parambyname('sucursal_nombre').asstring:=sucursal_nombre.text;
    ZQuery2.parambyname('sucursal_domicilio').asstring:=sucursal_domicilio.text;
    ZQuery2.parambyname('sucursal_telefono').asstring:=sucursal_telefono.text;
    ZQuery2.parambyname('empresa_id').asstring:=empresa_id.codigo;
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;

end;


procedure Tlistasucursales.modificar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('update sucursales set ');
    ZQuery2.sql.add('sucursal_nombre=:sucursal_nombre, ');
    ZQuery2.sql.add('sucursal_domicilio=:sucursal_domicilio, ');
    ZQuery2.sql.add('sucursal_telefono=:sucursal_telefono, ');
    ZQuery2.sql.add('empresa_id=:empresa_id ');
    ZQuery2.sql.add('where sucursal_id=:sucursal_id');
    ZQuery2.parambyname('sucursal_id').asstring:=id;
    ZQuery2.parambyname('sucursal_nombre').asstring:=sucursal_nombre.text;
    ZQuery2.parambyname('sucursal_domicilio').asstring:=sucursal_domicilio.text;
    ZQuery2.parambyname('sucursal_telefono').asstring:=sucursal_telefono.text;
    ZQuery2.parambyname('empresa_id').asstring:=empresa_id.codigo;
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;

procedure Tlistasucursales.eliminar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('delete from sucursales where sucursal_id=:sucursal_id');
    ZQuery2.parambyname('sucursal_id').asstring:=id;
    ZQuery2.ExecSQL;

    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;

function Tlistasucursales.control:boolean;
var
  error:integer;
begin
    error:=0;



    result:=error=0;
end;

procedure Tlistasucursales.btneliminarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar esta sucursal?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      eliminar;
end;

procedure Tlistasucursales.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.SQL.Text:='select * from sucursales where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_id like "%'+fil_id.Text+'%"';

    if fil_sucursal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_nombre like "%'+fil_sucursal_nombre.Text+'%"';

    if fil_sucursal_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_domicilio like "%'+fil_sucursal_domicilio.Text+'%"';

    if fil_sucursal_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_telefono like "%'+fil_sucursal_telefono.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by sucursal_nombre';
    ZQGrilla.Active:=true;

end;

procedure Tlistasucursales.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar esta sucursal?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;

          end;
    end;
end;

procedure Tlistasucursales.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=2;
                Panelabm.Visible:=true;
                sucursal_id.Text:=ZQGrilla.FieldByName('sucursal_id').AsString;
                sucursal_nombre.Text:=ZQGrilla.FieldByName('sucursal_nombre').AsString;
                sucursal_domicilio.Text:=ZQGrilla.FieldByName('sucursal_domicilio').AsString;
                sucursal_telefono.Text:=ZQGrilla.FieldByName('sucursal_telefono').AsString;
                empresa_id.llenarcombo;
                empresa_id.Buscar(ZQGrilla.FieldByName('empresa_id').AsString);
                sucursal_nombre.SetFocus;
            end;

      end;

end;

procedure Tlistasucursales.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    sucursal_id.Text:=princ.codigo('sucursales','sucursal_id');
    sucursal_nombre.Text:='';
    sucursal_domicilio.Text:='';
    sucursal_telefono.Text:='';
    empresa_id.llenarcombo;
    sucursal_nombre.SetFocus;
end;

end.
