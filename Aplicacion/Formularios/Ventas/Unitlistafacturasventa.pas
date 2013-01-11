unit Unitlistafacturasventa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tlistafacturasventa = class(TForm)
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
    fil_documentoventa_numero: TEdit;
    fil_documentoventa_fecha: TEdit;
    fil_puntoventa_numero: TEdit;
    fil_cliente_nombre: TEdit;
    ZQuery2: TZQuery;
    fil_documentoventa_estado: TEdit;
    fil_documentoventa_total: TEdit;
    CustomizeGrid1: TCustomizeGrid;
    btnanular: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
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
  listafacturasventa: Tlistafacturasventa;

implementation

uses UnitPrinc, Unitfacturasventa;

{$R *.dfm}

procedure Tlistafacturasventa.eliminar;
begin
//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('delete from proveedores ');
//    ZQuery2.SQL.Add('where proveedor_id=:proveedor_id');
//    ZQuery2.ParamByName('proveedor_id').AsString:=ZQproveedores.FieldByName('proveedor_id').AsString;
//    ZQuery2.ExecSQL;
//
//
//    ZQproveedores.Active:=false;
//    ZQproveedores.Active:=true;
//
//    Panelabm.Visible:=false;


end;



procedure Tlistafacturasventa.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistafacturasventa.modificar;
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


procedure Tlistafacturasventa.agregar;
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



function Tlistafacturasventa.control:boolean;
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

procedure Tlistafacturasventa.btnanularClick(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,'Factura de Venta',5);
      end;
end;

procedure Tlistafacturasventa.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,'Factura de Venta',3);
      end;
end;

procedure Tlistafacturasventa.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,'Factura de Venta',2);
      end;
end;

procedure Tlistafacturasventa.Button4Click(Sender: TObject);
begin
    Princ.AbrirDocumentoVenta('','Factura de Venta',1);
end;

procedure Tlistafacturasventa.btnfiltrarClick(Sender: TObject);
begin

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       ' where tipodocu_nombre="Factura de Venta" '+Princ.empresa_where;


    if fil_documentoventa_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_fecha like "%'+fil_documentoventa_fecha.Text+'"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "%'+fil_puntoventa_numero.Text+'%"';

    if fil_documentoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_numero like "%'+fil_documentoventa_numero.Text+'%"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientes.cliente_nombre like "%'+fil_cliente_nombre.Text+'%"';

    if fil_documentoventa_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_total like "%'+fil_documentoventa_total.Text+'%"';

    if fil_documentoventa_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_estado like "%'+fil_documentoventa_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentoventa_fecha, documentoventa_id';

    ZQGrilla.Active:=true;
end;

end.
