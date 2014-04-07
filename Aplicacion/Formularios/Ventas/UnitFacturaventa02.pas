unit UnitFacturaventa02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitfacturasventa, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, AdvGlowButton, MoneyEdit, Grids,
  DBGrids, UnitSqlComboBox, ComCtrls, ExtCtrls, AdvPanel, AdvEdit, AdvEdBtn,
  EditCodi, math;

type
  Tfacturaventa02 = class(Tfacturasventa)
    Label14: TLabel;
    producto_id: TEditCodi;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    documentopago_nombre: TEdit;
    documentopago_importe: TMoneyEdit;
    ZQProducto: TZQuery;
    tipopago_id: TEditCodi;
    tarjeta_id: TEditCodi;
    tarjeta_nombre: TEdit;
    pagotarjeta_cuotas: TMoneyEdit;
    lbltarjeta: TLabel;
    lblcuotas: TLabel;
    ZQDocumentoventadetallesdocumentoventadetalle_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_descripcion: TStringField;
    ZQDocumentoventadetallesdocumentoventadetalle_cantidad: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_neto21: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_iva21: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_neto105: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_iva105: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_nogravado: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_estado: TStringField;
    ZQDocumentoventadetallesdocumentoventadetalle_observacion: TStringField;
    ZQDocumentoventadetallesproducto_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_idorig: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQDocumentoventadetallesdocumentoventa_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe3: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe4: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe5: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe6: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_listaprecio: TIntegerField;
    ZQDocumentoventadetallesproducto_tipo: TStringField;
    procedure producto_idAfterSearch(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure documentopago_nombreEnter(Sender: TObject);
    procedure documentopago_importeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnquitarpagoClick(Sender: TObject);
    procedure tipopago_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ZQDocumentoventadetallesBeforePost(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ZQDocumentoventadetallesAfterPost(DataSet: TDataSet);
    procedure tipopago_idAfterSearch(Sender: TObject);
    procedure pagotarjeta_cuotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CargarQuery;
  public
    { Public declarations }
  end;

var
  facturaventa02: Tfacturaventa02;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tfacturaventa02.FormCreate(Sender: TObject);
begin
  inherited;
    producto_id.ConfSql.Text:='select * from productos left join politicasdeprecios on productos.politicaprecio_id=politicasdeprecios.politicaprecio_id where producto_estado="DISPONIBLE" and producto_tipo="PRODUCTO" order by producto_nombre';
    producto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    producto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    producto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;
end;

procedure Tfacturaventa02.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
        VK_F2:begin
                  cliente_id.SetFocus;
                  cliente_id.DroppedDown:=true;
              end;
        VK_F3:begin
                  personal_id.SetFocus;
                  personal_id.DroppedDown:=true;
              end;
        VK_F4:producto_id.SetFocus;
        VK_F5:begin
                  tipopago_id.SetFocus;
//                  tipopago_id.DroppedDown:=true;
              end;
        VK_F6:documentoventa_recargo.SetFocus;
        VK_F7:documentoventa_descuento.SetFocus;
        VK_F8:if btnquitarpago.Enabled then btnquitarpago.Click;
        VK_F9:if btnguardar.Enabled then btnguardar.Click;
    end;

end;

procedure Tfacturaventa02.FormShow(Sender: TObject);
begin
  inherited;
    producto_id.SetFocus;
end;

procedure Tfacturaventa02.pagotarjeta_cuotasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if key=VK_RETURN then
      begin
          if tipopago_id.Text<>'' then
            begin
                if tarjeta_id.Text<>'' then
                  begin
                      ZQDocumentopagos.Insert;
                      ZQDocumentopagos.FieldByName('documentopago_id').AsInteger:=ZQDocumentopagos.RecordCount;
                      ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:=documentopago_nombre.Text;
                      ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=documentopago_importe.Text;
                      ZQDocumentopagos.FieldByName('tipopago_id').AsString:=tipopago_id.Text;
                      ZQDocumentopagos.FieldByName('tipopago_nombre').AsString:=tipopago_id.valor('tipopago_nombre');
                      ZQDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
                      ZQDocumentopagos.Post;

                      calculartotales;
                      calculartotalpagos;
                      documentopago_importe.Value:=documentoventa_saldo;
                      tipopago_id.Text:='';
                      tipopago_id.Search('');
                      tipopago_id.SetFocus;
                  end;
            end;
      end;
end;

procedure Tfacturaventa02.producto_idAfterSearch(Sender: TObject);
begin
  inherited;
//    ventadetalle_preciounitario.Text:=producto_id.valor('producto_precioventa1');
    btnagregar.Click;
end;


procedure Tfacturaventa02.tipopago_idAfterSearch(Sender: TObject);
begin
  inherited;
    lbltarjeta.Visible:=false;
    lblcuotas.Visible:=false;
    tarjeta_id.Visible:=false;
    tarjeta_nombre.Visible:=false;
    pagotarjeta_cuotas.Visible:=false;
    if tipopago_id.Text='2' then
      begin
          lbltarjeta.Visible:=true;
          lblcuotas.Visible:=true;
          tarjeta_id.Visible:=true;
          tarjeta_nombre.Visible:=true;
          pagotarjeta_cuotas.Visible:=true;
      end;


end;

procedure Tfacturaventa02.tipopago_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key=VK_RETURN then
      begin
          if (tipopago_id.Text='') and (documentopago_importe.Value=0) then
            btnguardar.SetFocus;

      end;

end;

procedure Tfacturaventa02.ZQDocumentoventadetallesAfterPost(DataSet: TDataSet);
begin
  inherited;
    calculartotales;
    calculartotalpagos;
    documentopago_importe.Value:=documentoventa_saldo;
end;

procedure Tfacturaventa02.ZQDocumentoventadetallesBeforePost(DataSet: TDataSet);
var
  tipoiva_valor:real;
begin
  inherited;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsFloat:=roundto(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat*ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat,-2);
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=0;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=0;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=0;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=0;

    tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva inner join productos on tipoiva.tipoiva_id=productos.tipoiva_id where producto_id="'+ZQDocumentoventadetalles.FieldByName('producto_id').AsString+'"','tipoiva_valor'));
    if tipoiva_valor>10.5 then
      begin
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=100*(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsFloat)/(100+tipoiva_valor);
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=tipoiva_valor*(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsFloat)/(100+tipoiva_valor);
      end
    else
      begin
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=100*(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsFloat)/(100+tipoiva_valor);
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=tipoiva_valor*(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsFloat)/(100+tipoiva_valor);
      end;
end;

procedure Tfacturaventa02.btnagregarClick(Sender: TObject);
begin
    if (producto_id.Text<>'') then
      begin
          CargarQuery;
          princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, ZQProducto);
          calculartotales;
          calculartotalpagos;
          documentopago_importe.Value:=documentoventa_saldo;
          producto_id.Text:='-1';
          producto_id.Search('-1');
          producto_id.SetFocus;
      end;

end;

procedure Tfacturaventa02.btnquitarpagoClick(Sender: TObject);
begin
  inherited;
    documentopago_importe.Value:=documentoventa_saldo;
end;

procedure Tfacturaventa02.CargarQuery;
var
  tipoiva_valor:real;
begin
    ZQProducto.Active:=false;
    ZQProducto.Active:=true;
    if ZQProducto.Active then
      begin
          ZQProducto.Active:=true;

          ZQProducto.Append;
          ZQProducto.FieldByName('documentoventadetalle_id').AsString:='0';
          ZQProducto.FieldByName('documentoventadetalle_descripcion').AsString:=producto_id.valor('producto_nombre');
          ZQProducto.FieldByName('documentoventadetalle_cantidad').AsString:='1';
          ZQProducto.FieldByName('documentoventadetalle_precio').AsString:=producto_id.valor('producto_precioventa1');
          ZQProducto.FieldByName('documentoventadetalle_total').AsString:=producto_id.valor('producto_precioventa1');

          ZQProducto.FieldByName('documentoventadetalle_neto21').AsFloat:=0;
          ZQProducto.FieldByName('documentoventadetalle_iva21').AsFloat:=0;
          ZQProducto.FieldByName('documentoventadetalle_neto105').AsFloat:=0;
          ZQProducto.FieldByName('documentoventadetalle_iva105').AsFloat:=0;

          tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva inner join productos on tipoiva.tipoiva_id=productos.tipoiva_id where producto_id="'+producto_id.Text+'"','tipoiva_valor'));
          if tipoiva_valor>10.5 then
            begin
                ZQProducto.FieldByName('documentoventadetalle_neto21').AsFloat:=100*strtofloat(producto_id.valor('producto_precioventa1'))/(100+tipoiva_valor);
                ZQProducto.FieldByName('documentoventadetalle_iva21').AsFloat:=tipoiva_valor*strtofloat(producto_id.valor('producto_precioventa1'))/(100+tipoiva_valor);
            end
          else
            begin

                ZQProducto.FieldByName('documentoventadetalle_neto105').AsFloat:=100*strtofloat(producto_id.valor('producto_precioventa1'))/(100+tipoiva_valor);
                ZQProducto.FieldByName('documentoventadetalle_iva105').AsFloat:=tipoiva_valor*strtofloat(producto_id.valor('producto_precioventa1'))/(100+tipoiva_valor);
            end;

          ZQProducto.FieldByName('documentoventadetalle_nogravado').AsString:='0';
          ZQProducto.FieldByName('documentoventadetalle_estado').AsString:='FACTURADO';
          ZQProducto.FieldByName('documentoventadetalle_observacion').AsString:='';
          ZQProducto.FieldByName('producto_id').AsString:=producto_id.Text;
          ZQProducto.FieldByName('documentoventadetalle_idorig').AsString:='0';
          ZQProducto.FieldByName('documentoventadetalle_cantidadpendiente').AsString:='0';
          ZQProducto.FieldByName('documentoventa_id').AsString:='0';
          ZQProducto.FieldByName('documentoventadetalle_listaprecio').AsInteger:=0;
          ZQProducto.Post;

      end;



end;

procedure Tfacturaventa02.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if key=#13 then
      begin
          if ZQDocumentoventadetalles.State in [dsEdit] then
            begin
                ZQDocumentoventadetalles.Post;
                DBGrid1.SetFocus;
            end;


      end;

end;

procedure Tfacturaventa02.documentopago_importeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if key=VK_RETURN then
      begin
          if tipopago_id.Text<>'' then
            begin
                if not tarjeta_id.Visible then
                  begin
                      ZQDocumentopagos.Insert;
                      ZQDocumentopagos.FieldByName('documentopago_id').AsInteger:=ZQDocumentopagos.RecordCount;
                      ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:=documentopago_nombre.Text;
                      ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=documentopago_importe.Text;
                      ZQDocumentopagos.FieldByName('tipopago_id').AsString:=tipopago_id.Text;
                      ZQDocumentopagos.FieldByName('tipopago_nombre').AsString:=tipopago_id.valor('tipopago_nombre');
                      ZQDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
                      ZQDocumentopagos.Post;

                      calculartotales;
                      calculartotalpagos;
                      documentopago_importe.Value:=documentoventa_saldo;
                      tipopago_id.Text:='';
                      tipopago_id.Search('');
                      tipopago_id.SetFocus;
                  end;
            end;
      end;
end;

procedure Tfacturaventa02.documentopago_nombreEnter(Sender: TObject);
begin
  inherited;
    if tipopago_id.Text='' then
      tipopago_id.SetFocus;

end;

end.
