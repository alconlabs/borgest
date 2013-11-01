unit Unitcompradetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ExtCtrls, AdvPanel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvEdBtn, EditCodi,
  AdvGlowButton, Menus, AdvMenus, MoneyEdit;

type
  Tcompradetalle = class(TForm)
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    Label6: TLabel;
    cantidad: TDBAdvEdit;
    Button1: TButton;
    btnaceptar: TButton;
    Label1: TLabel;
    preciounitario: TDBAdvEdit;
    Label2: TLabel;
    total: TDBAdvEdit;
    ZQDocumentocompradetalles: TZQuery;
    producto_id: TEditCodi;
    producto_nombre: TEdit;
    producdepo_stockminimo: TLabel;
    producdepo_stockactual: TLabel;
    btnherramientas: TAdvGlowButton;
    AdvPopupMenu1: TAdvPopupMenu;
    Codigodereferencia1: TMenuItem;
    producto_fechaactualizacionprecio: TLabel;
    Historial1: TMenuItem;
    GroupBoxPrecios: TGroupBox;
    producto_precioventa1: TMoneyEdit;
    producto_precioventa2: TMoneyEdit;
    producto_precioventa3: TMoneyEdit;
    producto_precioventa4: TMoneyEdit;
    btnprecio1: TButton;
    btnprecio2: TButton;
    btnprecio4: TButton;
    btnprecio3: TButton;
    ZQDocumentocompradetallesdocumentocompradetalle_id: TIntegerField;
    ZQDocumentocompradetallesdocumentocompradetalle_descripcion: TStringField;
    ZQDocumentocompradetallesdocumentocompradetalle_cantidad: TFloatField;
    ZQDocumentocompradetallesdocumentocompradetalle_precio: TFloatField;
    ZQDocumentocompradetallesdocumentocompradetalle_total: TFloatField;
    ZQDocumentocompradetallesdocumentocompradetalle_estado: TStringField;
    ZQDocumentocompradetallesdocumentocompradetalle_observacion: TStringField;
    ZQDocumentocompradetallesdocumentocompradetalle_idorig: TIntegerField;
    ZQDocumentocompradetallesdocumentocompradetalle_cantidadpendiente: TFloatField;
    ZQDocumentocompradetallesproducto_id: TIntegerField;
    ZQDocumentocompradetallesdocumentocompra_id: TIntegerField;
    ZQDocumentocompradetallesdocumentocompradetalle_neto21: TFloatField;
    ZQDocumentocompradetallesdocumentocompradetalle_neto105: TFloatField;
    ZQDocumentocompradetallesdocumentocompradetalle_iva21: TFloatField;
    ZQDocumentocompradetallesdocumentocompradetalle_iva105: TFloatField;
    ZQDocumentocompradetallesproducto_id_1: TIntegerField;
    ZQDocumentocompradetallesproducto_nombre: TStringField;
    ZQDocumentocompradetallesproducto_observaciones: TStringField;
    ZQDocumentocompradetallesproducto_codigo: TStringField;
    ZQDocumentocompradetallesproducto_codigobarras: TStringField;
    ZQDocumentocompradetallesproducto_preciocosto: TFloatField;
    ZQDocumentocompradetallesproducto_precioventabase: TFloatField;
    ZQDocumentocompradetallesproducto_estado: TStringField;
    ZQDocumentocompradetallesproducto_precioventa1: TFloatField;
    ZQDocumentocompradetallestipoiva_id: TIntegerField;
    ZQDocumentocompradetallesrubro_id: TIntegerField;
    ZQDocumentocompradetallesproducto_precioventa2: TFloatField;
    ZQDocumentocompradetallesproducto_precioventa3: TFloatField;
    ZQDocumentocompradetallesproducto_precioventa4: TFloatField;
    ZQDocumentocompradetallescalculoprecio_id: TIntegerField;
    ZQDocumentocompradetallespoliticaprecio_id: TIntegerField;
    ZQDocumentocompradetallesproducto_neto1: TFloatField;
    ZQDocumentocompradetallesproducto_neto2: TFloatField;
    ZQDocumentocompradetallesproducto_neto3: TFloatField;
    ZQDocumentocompradetallesproducto_neto4: TFloatField;
    ZQDocumentocompradetallesproveedor_id: TIntegerField;
    ZQDocumentocompradetallesproducto_fechaactualizacionprecio: TDateField;
    ZQDocumentocompradetallesproducto_codigoreferencia: TStringField;
    ZQDocumentocompradetallesproducto_imprimir: TIntegerField;
    ZQDocumentocompradetallesproducto_tipo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
    procedure producto_idSelect(Sender: TObject);
    procedure cantidadExit(Sender: TObject);
    procedure preciounitarioExit(Sender: TObject);
    procedure producto_idClickBtn(Sender: TObject);
    procedure producto_idAfterSearch(Sender: TObject);
    procedure producto_idKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnherramientasClick(Sender: TObject);
    procedure Codigodereferencia1Click(Sender: TObject);
    procedure btnprecio1Click(Sender: TObject);
    procedure btnprecio2Click(Sender: TObject);
    procedure btnprecio3Click(Sender: TObject);
    procedure btnprecio4Click(Sender: TObject);
  private
    { Private declarations }
    PRODUCTOMODIFICARDESCR:string;
    procedure mostrarstock;
    procedure mostrarprecios;
  public
    { Public declarations }
    producto_precioventa:string;
    procedure CargarQuery;
    procedure calculartotal;
  end;

var
  compradetalle: Tcompradetalle;

implementation

uses unitPrinc, Unitbusquedaproductos;

{$R *.dfm}

procedure Tcompradetalle.mostrarprecios;
begin
    producto_precioventa1.Text:=producto_id.valor('producto_precioventa1');
    producto_precioventa2.Text:=producto_id.valor('producto_precioventa2');
    producto_precioventa3.Text:=producto_id.valor('producto_precioventa3');
    producto_precioventa4.Text:=producto_id.valor('producto_precioventa4');

end;


procedure Tcompradetalle.CargarQuery;
var
  tipoiva_valor:real;
begin
    if not ZQDocumentocompradetalles.Active then
      begin
          ZQDocumentocompradetalles.Active:=true;

          ZQDocumentocompradetalles.Append;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_id').AsString:='0';
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_descripcion').AsString:=producto_nombre.Text;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_cantidad').AsString:=cantidad.Text;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_precio').AsString:=preciounitario.Text;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_total').AsString:=total.Text;

          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto21').AsFloat:=0;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva21').AsFloat:=0;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto105').AsFloat:=0;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva105').AsFloat:=0;

          tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva inner join productos on tipoiva.tipoiva_id=productos.tipoiva_id where producto_id="'+producto_id.Text+'"','tipoiva_valor'));
          if tipoiva_valor>10.5 then
            begin
                ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto21').AsFloat:=100*total.FloatValue/(100+tipoiva_valor);
                ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva21').AsFloat:=tipoiva_valor*total.FloatValue/(100+tipoiva_valor);
            end
          else
            begin
                ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto105').AsFloat:=100*total.FloatValue/(100+tipoiva_valor);
                ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva105').AsFloat:=tipoiva_valor*total.FloatValue/(100+tipoiva_valor);
            end;

          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_estado').AsString:='FACTURADO';
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_observacion').AsString:='';
          ZQDocumentocompradetalles.FieldByName('producto_id').AsString:=producto_id.Text;
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_idorig').AsString:='0';
          ZQDocumentocompradetalles.FieldByName('documentocompradetalle_cantidadpendiente').AsString:='0';
          ZQDocumentocompradetalles.FieldByName('documentocompra_id').AsString:='0';
          ZQDocumentocompradetalles.FieldByName('producto_codigo').AsString:=producto_id.valor('producto_codigo');
          ZQDocumentocompradetalles.FieldByName('producto_codigobarras').AsString:=producto_id.valor('producto_codigobarras');

          ZQDocumentocompradetalles.Post;

      end;



end;


procedure Tcompradetalle.mostrarstock;
var
  minimo, actual:real;
begin
    producdepo_stockminimo.Visible:=false;
    producdepo_stockactual.Visible:=false;

    producdepo_stockactual.Font.Color:=clWindowText;
    producdepo_stockactual.Font.Style:=[];

    if producto_id.Text<>'' then
      begin
          Princ.ZQProductos.Active:=false;
          Princ.ZQProductos.ParamByName('producto_id').AsString:=producto_id.Text;
          Princ.ZQProductos.Active:=true;
          Princ.ZQProductos.First;

          try
            minimo:=Princ.ZQProductos.FieldByName('producdepo_stockminimo').AsFloat;
            actual:=Princ.ZQProductos.FieldByName('producdepo_stockactual').AsFloat;
          except
            minimo:=0;
            actual:=0;
          end;

          producdepo_stockminimo.Visible:=true;
          producdepo_stockactual.Visible:=true;

          producdepo_stockminimo.Caption:='Stock Min: '+floattostr(minimo);
          producdepo_stockactual.Caption:='Stock: '+floattostr(actual);

          if (actual<=minimo) or (actual<=0) then
            begin
                producdepo_stockactual.Font.Color:=clRed;
                producdepo_stockactual.Font.Style:=[fsBold];
            end;

          Princ.ZQProductos.Active:=false;
      end;
end;

procedure Tcompradetalle.calculartotal;
begin

    total.Text:=floattostr(preciounitario.FloatValue*cantidad.FloatValue);

end;


procedure Tcompradetalle.Codigodereferencia1Click(Sender: TObject);
begin
    busquedaproductos:=Tbusquedaproductos.Create(self);
    busquedaproductos.producto_codigoreferencia:='="'+producto_id.valor('producto_codigoreferencia')+'"';
    busquedaproductos.btnbuscar.Click;
    if busquedaproductos.ShowModal=mrOk then
      begin
          producto_id.Search(busquedaproductos.producto_id);

      end;

    busquedaproductos.Free;
end;

procedure Tcompradetalle.producto_idAfterSearch(Sender: TObject);
begin
    preciounitario.Text:=producto_id.valor('producto_preciocosto');
    producto_nombre.ReadOnly:=not (PRODUCTOMODIFICARDESCR=producto_id.Text);
    producto_nombre.TabStop:=not producto_nombre.ReadOnly;

    producto_fechaactualizacionprecio.Caption:=producto_id.valor('producto_fechaactualizacionprecio');


    mostrarstock;
    mostrarprecios;
    calculartotal;
end;

procedure Tcompradetalle.producto_idClickBtn(Sender: TObject);
begin
    busquedaproductos:=Tbusquedaproductos.Create(self);
    busquedaproductos.ConfCampoBusqueda1:=producto_id.ConfCampoBusqueda1;
    if busquedaproductos.ShowModal=mrOk then
      begin
          producto_id.Text:=busquedaproductos.producto_id;
          producto_id.Search(busquedaproductos.producto_id);

      end;

    busquedaproductos.Free;
end;

procedure Tcompradetalle.producto_idKeyPress(Sender: TObject; var Key: Char);
begin
    if key='+' then
      begin
          key:=#0;
          producto_id.OnClickBtn(self);

      end;

    if key=#13 then
      begin
          key:=#0;
          producto_id.Search(producto_id.Text);


      end;
end;

procedure Tcompradetalle.producto_idSelect(Sender: TObject);
begin
//    ventadetalle_preciounitario.Text:=princ.buscar('select producto_precioventa'+producto_precioventa+' from productos where producto_id="'+producto_id.Text+'"','producto_precioventa'+producto_precioventa);
    calculartotal;
end;

procedure Tcompradetalle.btnherramientasClick(Sender: TObject);
var
  pt: TPoint;
begin
    pt := Point(btnherramientas.Left, btnherramientas.Top + btnherramientas.Height);
    pt := Self.ClientToScreen(pt);

    btnherramientas.DropDownMenu.Popup(pt.X,pt.Y);
end;

procedure Tcompradetalle.btnprecio1Click(Sender: TObject);
begin
//    preciounitario.Text:= producto_precioventa1.Text;
//    calculartotal;
//    btnaceptar.SetFocus;
end;

procedure Tcompradetalle.btnprecio2Click(Sender: TObject);
begin
//    ventadetalle_preciounitario.Text:= producto_precioventa2.Text;
//    calculartotal;
//    btnaceptar.SetFocus;
end;

procedure Tcompradetalle.btnprecio3Click(Sender: TObject);
begin
//    ventadetalle_preciounitario.Text:= producto_precioventa3.Text;
//    calculartotal;
//    btnaceptar.SetFocus;
end;

procedure Tcompradetalle.btnprecio4Click(Sender: TObject);
begin
//    ventadetalle_preciounitario.Text:= producto_precioventa4.Text;
//    calculartotal;
//    btnaceptar.SetFocus;
end;

procedure Tcompradetalle.btnaceptarClick(Sender: TObject);
begin
    CargarQuery;
    Self.ModalResult:=mrOk;
end;

procedure Tcompradetalle.FormCreate(Sender: TObject);
begin
    cantidad.Text:='1';
    PRODUCTOMODIFICARDESCR:=Princ.GetConfiguracion('PRODUCTOMODIFICARDESCR');
    producto_fechaactualizacionprecio.Caption:='';
    ZQDocumentocompradetalles.Active:=false;
    btnprecio1.Caption:=Princ.NOMBREPRECIO1;
    btnprecio2.Caption:=Princ.NOMBREPRECIO2;
    btnprecio3.Caption:=Princ.NOMBREPRECIO3;
    btnprecio4.Caption:=Princ.NOMBREPRECIO4;

    producto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    producto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    producto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;
end;

procedure Tcompradetalle.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnaceptar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tcompradetalle.preciounitarioExit(Sender: TObject);
begin
    calculartotal;
end;

procedure Tcompradetalle.cantidadExit(Sender: TObject);
begin
    calculartotal;
end;

end.
