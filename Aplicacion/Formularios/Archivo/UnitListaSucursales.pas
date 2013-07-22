unit UnitListaSucursales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel, GBTEdit, UnitSqlComboBox,
  ComCtrls;

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
    Label4: TLabel;
    sucursal_tipoliquidsucursal: TComboBox;
    Label6: TLabel;
    sucursal_tipoliquidvendedor: TComboBox;
    Label8: TLabel;
    cliente_id: TSqlComboBox;
    Label7: TLabel;
    sucursal_tipodocumentoliquidar: TComboBox;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    ZQuery2.sql.add('sucursal_telefono, empresa_id, sucursal_tipoliquidsucursal, sucursal_tipoliquidvendedor, cliente_id, sucursal_tipodocumentoliquidar) ');
    ZQuery2.sql.add('values (:sucursal_id, :sucursal_nombre, :sucursal_domicilio, ');
    ZQuery2.sql.add(':sucursal_telefono, :empresa_id, :sucursal_tipoliquidsucursal, :sucursal_tipoliquidvendedor, :cliente_id, :sucursal_tipodocumentoliquidar) ');
    ZQuery2.parambyname('sucursal_id').asstring:=id;
    ZQuery2.parambyname('sucursal_nombre').asstring:=sucursal_nombre.text;
    ZQuery2.parambyname('sucursal_domicilio').asstring:=sucursal_domicilio.text;
    ZQuery2.parambyname('sucursal_telefono').asstring:=sucursal_telefono.text;
    ZQuery2.parambyname('empresa_id').asstring:=empresa_id.codigo;
    ZQuery2.parambyname('sucursal_tipoliquidsucursal').asstring:=sucursal_tipoliquidsucursal.text;
    ZQuery2.parambyname('sucursal_tipoliquidvendedor').asstring:=sucursal_tipoliquidvendedor.text;
    ZQuery2.parambyname('cliente_id').asstring:=cliente_id.codigo;
    ZQuery2.parambyname('sucursal_tipodocumentoliquidar').AsInteger:=sucursal_tipodocumentoliquidar.ItemIndex;
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
    ZQuery2.sql.add('empresa_id=:empresa_id, ');
    ZQuery2.sql.add('sucursal_tipoliquidsucursal=:sucursal_tipoliquidsucursal, ');
    ZQuery2.sql.add('sucursal_tipoliquidvendedor=:sucursal_tipoliquidvendedor, ');
    ZQuery2.sql.add('cliente_id=:cliente_id, ');
    ZQuery2.sql.add('sucursal_tipodocumentoliquidar=:sucursal_tipodocumentoliquidar ');
    ZQuery2.sql.add('where sucursal_id=:sucursal_id');
    ZQuery2.parambyname('sucursal_id').asstring:=id;
    ZQuery2.parambyname('sucursal_nombre').asstring:=sucursal_nombre.text;
    ZQuery2.parambyname('sucursal_domicilio').asstring:=sucursal_domicilio.text;
    ZQuery2.parambyname('sucursal_telefono').asstring:=sucursal_telefono.text;
    ZQuery2.parambyname('empresa_id').asstring:=empresa_id.codigo;
    ZQuery2.parambyname('sucursal_tipoliquidsucursal').asstring:=sucursal_tipoliquidsucursal.text;
    ZQuery2.parambyname('sucursal_tipoliquidvendedor').asstring:=sucursal_tipoliquidvendedor.text;
    ZQuery2.parambyname('cliente_id').asstring:=cliente_id.codigo;
    ZQuery2.parambyname('sucursal_tipodocumentoliquidar').AsInteger:=sucursal_tipodocumentoliquidar.ItemIndex;
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

procedure Tlistasucursales.FormShow(Sender: TObject);
begin
  inherited;
    sucursal_tipoliquidsucursal.Visible:=strtobool(Princ.GetConfiguracionMenu('>Comisiones','menu_visible'));
    Label4.Visible:=strtobool(Princ.GetConfiguracionMenu('>Comisiones','menu_visible'));
    sucursal_tipoliquidvendedor.Visible:=strtobool(Princ.GetConfiguracionMenu('>Comisiones','menu_visible'));
    Label6.Visible:=strtobool(Princ.GetConfiguracionMenu('>Comisiones','menu_visible'));

    Label8.Visible:=strtobool(Princ.GetConfiguracionMenu('>Comisiones','menu_visible'));
    cliente_id.Visible:=strtobool(Princ.GetConfiguracionMenu('>Comisiones','menu_visible'));

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
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_id like "'+primercaracter+fil_id.Text+'%"';

    if fil_sucursal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_nombre like "'+primercaracter+fil_sucursal_nombre.Text+'%"';

    if fil_sucursal_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_domicilio like "'+primercaracter+fil_sucursal_domicilio.Text+'%"';

    if fil_sucursal_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_telefono like "'+primercaracter+fil_sucursal_telefono.Text+'%"';

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
                sucursal_tipoliquidsucursal.Text:=ZQGrilla.FieldByName('sucursal_tipoliquidsucursal').AsString;
                sucursal_tipoliquidvendedor.Text:=ZQGrilla.FieldByName('sucursal_tipoliquidvendedor').AsString;
                sucursal_nombre.SetFocus;

                cliente_id.llenarcombo;
                cliente_id.Buscar(ZQGrilla.FieldByName('cliente_id').AsString);
                sucursal_tipodocumentoliquidar.ItemIndex:=ZQGrilla.FieldByName('sucursal_tipodocumentoliquidar').AsInteger;
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
    sucursal_tipoliquidsucursal.ItemIndex:=-1;
    sucursal_tipoliquidvendedor.ItemIndex:=-1;
    sucursal_tipodocumentoliquidar.ItemIndex:=0;
    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=0;
end;

end.
