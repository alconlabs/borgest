unit Unitlistafacturascompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tlistafacturascompra = class(TForm)
    panelgrilla: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ZQGrilla: TZQuery;
    DSC: TDataSource;
    panelfiltros: TAdvPanel;
    btnfiltrar: TButton;
    fil_documentocompra_numero: TEdit;
    fil_documentocompra_fecha: TEdit;
    fil_proveedor_nombre: TEdit;
    ZQuery2: TZQuery;
    fil_documentocompra_estado: TEdit;
    fil_documentocompra_total: TEdit;
    CustomizeGrid1: TCustomizeGrid;
    btnanular: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
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
  listafacturascompra: Tlistafacturascompra;

implementation

uses UnitPrinc, Unitfacturasventa;

{$R *.dfm}

procedure Tlistafacturascompra.eliminar;
begin
//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('delete from documentoscompras ');
//    ZQuery2.SQL.Add('where documentocompra_id=:documentocompra_id');
//    ZQuery2.ParamByName('documentocompra_id').AsString:=ZQuery2.FieldByName('proveedor_id').AsString;
//    ZQuery2.ExecSQL;
//
//
//    ZQproveedores.Active:=false;
//    ZQproveedores.Active:=true;
//
//    Panelabm.Visible:=false;


end;



procedure Tlistafacturascompra.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistafacturascompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tlistafacturascompra.FormShow(Sender: TObject);
begin
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tlistafacturascompra.modificar;
begin
//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('update proveedores ');
//    ZQuery2.SQL.Add('set proveedor_nombre=:proveedor_nombre, ');
//    ZQuery2.SQL.Add('proveedor_domicilio=:proveedor_domicilio, ');
//    ZQuery2.SQL.Add('proveedor_telefono=:proveedor_telefono, ');
//    ZQuery2.SQL.Add('proveedor_cuit=:proveedor_cuit ');
//    ZQuery2.SQL.Add('where proveedor_id=:proveedor_id');
//    ZQuery2.ParamByName('proveedor_id').AsString:=proveedor_id.Text;
//    ZQuery2.ParamByName('proveedor_nombre').AsString:=proveedor_nombre.Text;
//    ZQuery2.ParamByName('proveedor_domicilio').AsString:=proveedor_domicilio.Text;
//    ZQuery2.ParamByName('proveedor_telefono').AsString:=proveedor_telefono.Text;
//    ZQuery2.ParamByName('proveedor_cuit').AsString:=proveedor_cuit.Text;
//    ZQuery2.ExecSQL;
//
//    Panelabm.Visible:=false;


end;


procedure Tlistafacturascompra.agregar;
begin

//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('insert into proveedores ');
//    ZQuery2.SQL.Add('values (:proveedor_id, :proveedor_nombre, ');
//    ZQuery2.SQL.Add(':proveedor_domicilio, :proveedor_telefono, :proveedor_cuit)');
//    ZQuery2.ParamByName('proveedor_id').AsString:=princ.codigo('proveedores','proveedor_id');
//    ZQuery2.ParamByName('proveedor_nombre').AsString:=proveedor_nombre.Text;
//    ZQuery2.ParamByName('proveedor_domicilio').AsString:=proveedor_domicilio.Text;
//    ZQuery2.ParamByName('proveedor_telefono').AsString:=proveedor_telefono.Text;
//    ZQuery2.ParamByName('proveedor_cuit').AsString:=proveedor_cuit.Text;
//    ZQuery2.ExecSQL;
//
//    Panelabm.Visible:=false;


end;



function Tlistafacturascompra.control:boolean;
var
  error:integer;
begin
    error:=0;

//    if proveedor_nombre.Text='' then
//      error:=1;
//
//    case error of
//        1:begin
//              MessageDlg('Ingrese el nombre del proveedor', mtError, [mbOK], 0);
//          end;
//
//
//
//
//    end;
//
    if error=0 then
      result:=true
    else
      result:=false;

end;

procedure Tlistafacturascompra.btnanularClick(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,'Factura de Compra',5);
      end;
end;

procedure Tlistafacturascompra.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,'Factura de Compra',3);
      end;
end;

procedure Tlistafacturascompra.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,'Factura de Compra',2);
      end;
end;

procedure Tlistafacturascompra.btnfiltrarClick(Sender: TObject);
begin

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentoscompras '+
                       'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                       ' where tipodocu_nombre="Factura de Compra" '+princ.empresa_where;


    if fil_documentocompra_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_fecha like "'+fil_documentocompra_fecha.Text+'"';

    if fil_documentocompra_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_numero like "'+fil_documentocompra_numero.Text+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedores.proveedor_nombre like "'+fil_proveedor_nombre.Text+'%"';

    if fil_documentocompra_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_total like "'+fil_documentocompra_total.Text+'%"';

    if fil_documentocompra_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_estado like "'+fil_documentocompra_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentocompra_fecha, documentocompra_numero';

    ZQGrilla.Active:=true;
end;

end.
