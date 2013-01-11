unit Unitventadetalle2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ExtCtrls, AdvPanel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvEdBtn, EditCodi,
  AdvGlowButton, Menus, AdvMenus, MoneyEdit;

type
  Tventadetalle2 = class(TForm)
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    Label6: TLabel;
    ventadeta_cantidad: TDBAdvEdit;
    Button1: TButton;
    btnaceptar: TButton;
    Label1: TLabel;
    ventadetalle_preciounitario: TDBAdvEdit;
    Label2: TLabel;
    ventadetalle_total: TDBAdvEdit;
    ZQDocumentoventadetalles: TZQuery;
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
    procedure FormCreate(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
    procedure producto_idSelect(Sender: TObject);
    procedure ventadeta_cantidadExit(Sender: TObject);
    procedure ventadetalle_preciounitarioExit(Sender: TObject);
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
  ventadetalle2: Tventadetalle2;

implementation

uses unitPrinc, Unitbusquedaproductos;

{$R *.dfm}

procedure Tventadetalle2.mostrarprecios;
begin
    producto_precioventa1.Text:=producto_id.valor('producto_precioventa1');
    producto_precioventa2.Text:=producto_id.valor('producto_precioventa2');
    producto_precioventa3.Text:=producto_id.valor('producto_precioventa3');
    producto_precioventa4.Text:=producto_id.valor('producto_precioventa4');

end;


procedure Tventadetalle2.CargarQuery;
var
  tipoiva_valor:real;
begin
    if not ZQDocumentoventadetalles.Active then
      begin
          ZQDocumentoventadetalles.Active:=true;

          ZQDocumentoventadetalles.Append;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:='0';
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString:=producto_nombre.Text;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString:=ventadeta_cantidad.Text;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString:=ventadetalle_preciounitario.Text;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString:=ventadetalle_total.Text;

          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=0;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=0;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=0;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=0;

          tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva inner join productos on tipoiva.tipoiva_id=productos.tipoiva_id where producto_id="'+producto_id.Text+'"','tipoiva_valor'));
          if tipoiva_valor>10.5 then
            begin
                ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=100*ventadetalle_total.FloatValue/(100+tipoiva_valor);
                ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=tipoiva_valor*ventadetalle_total.FloatValue/(100+tipoiva_valor);
            end
          else
            begin
                ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=100*ventadetalle_total.FloatValue/(100+tipoiva_valor);
                ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=tipoiva_valor*ventadetalle_total.FloatValue/(100+tipoiva_valor);
            end;

          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString:='0';
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString:='FACTURADO';
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString:='';
          ZQDocumentoventadetalles.FieldByName('producto_id').AsString:=producto_id.Text;
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString:='0';
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString:='0';
          ZQDocumentoventadetalles.FieldByName('documentoventa_id').AsString:='0';
          ZQDocumentoventadetalles.Post;

      end;



end;


procedure Tventadetalle2.mostrarstock;
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

procedure Tventadetalle2.calculartotal;
begin

    ventadetalle_total.Text:=floattostr(ventadetalle_preciounitario.FloatValue*ventadeta_cantidad.FloatValue);

end;


procedure Tventadetalle2.Codigodereferencia1Click(Sender: TObject);
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

procedure Tventadetalle2.producto_idAfterSearch(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:=producto_id.valor('producto_precioventa'+producto_precioventa);
    producto_nombre.ReadOnly:=not (PRODUCTOMODIFICARDESCR=producto_id.Text);
    producto_nombre.TabStop:=not producto_nombre.ReadOnly;

    producto_fechaactualizacionprecio.Caption:=producto_id.valor('producto_fechaactualizacionprecio');


    mostrarstock;
    mostrarprecios;
    calculartotal;
end;

procedure Tventadetalle2.producto_idClickBtn(Sender: TObject);
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

procedure Tventadetalle2.producto_idKeyPress(Sender: TObject; var Key: Char);
begin
    if key='+' then
      begin
          key:=#0;
          producto_id.OnClickBtn(self);

      end;

//    if key=#13 then
//      begin
//          key:=#0;
//          producto_id.Search(producto_id.Text);
//
//
//      end;
end;

procedure Tventadetalle2.producto_idSelect(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:=princ.buscar('select producto_precioventa'+producto_precioventa+' from productos where producto_id="'+producto_id.Text+'"','producto_precioventa'+producto_precioventa);
    calculartotal;
end;

procedure Tventadetalle2.btnherramientasClick(Sender: TObject);
var
  pt: TPoint;
begin
    pt := Point(btnherramientas.Left, btnherramientas.Top + btnherramientas.Height);
    pt := Self.ClientToScreen(pt);

    btnherramientas.DropDownMenu.Popup(pt.X,pt.Y);
end;

procedure Tventadetalle2.btnprecio1Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa1.Text;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalle2.btnprecio2Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa2.Text;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalle2.btnprecio3Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa3.Text;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalle2.btnprecio4Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa4.Text;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalle2.btnaceptarClick(Sender: TObject);
begin
    CargarQuery;
    Self.ModalResult:=mrOk;
end;

procedure Tventadetalle2.FormCreate(Sender: TObject);
begin
    ventadeta_cantidad.Text:='1';
    PRODUCTOMODIFICARDESCR:=Princ.GetConfiguracion('PRODUCTOMODIFICARDESCR');
    producto_fechaactualizacionprecio.Caption:='';
    ZQDocumentoventadetalles.Active:=false;
    btnprecio1.Caption:=Princ.NOMBREPRECIO1;
    btnprecio2.Caption:=Princ.NOMBREPRECIO2;
    btnprecio3.Caption:=Princ.NOMBREPRECIO3;
    btnprecio4.Caption:=Princ.NOMBREPRECIO4;

    producto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    producto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    producto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;

end;

procedure Tventadetalle2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnaceptar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tventadetalle2.ventadetalle_preciounitarioExit(Sender: TObject);
begin
    calculartotal;
end;

procedure Tventadetalle2.ventadeta_cantidadExit(Sender: TObject);
begin
    calculartotal;
end;

end.
