unit UnitventadetalleConcepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ExtCtrls, AdvPanel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvEdBtn, EditCodi,
  AdvGlowButton, Menus, AdvMenus, MoneyEdit;

type
  Tventadetalleconcepto = class(TForm)
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    Label6: TLabel;
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
    ventadetalle_preciounitoriginal: TDBAdvEdit;
    producdepo_stockinicial: TLabel;
    ventadeta_cantidad: TMoneyEdit;
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
    procedure ventadetalle_totalExit(Sender: TObject);
  private
    { Private declarations }
    PRODUCTOMODIFICARDESCR:string;
    procedure mostrarstock;
    procedure mostrarprecios;
    function control:boolean;
  public
    { Public declarations }
    producto_precioventa:string;
    documentoventadetalle_listaprecio:integer;
    procedure CargarQuery;
    procedure calculartotal;
  end;

var
  ventadetalleconcepto: Tventadetalleconcepto;

implementation

uses unitPrinc, UnitBusquedaConceptosDebCred;

{$R *.dfm}

function Tventadetalleconcepto.control:boolean;
var
  error:integer;
begin
    error:=0;

    if ventadetalle_total.FloatValue=0 then
      error:=3;

    if ventadetalle_preciounitario.FloatValue=0 then
      error:=2;

    if ventadeta_cantidad.Value=0 then
      error:=1;


    case error of
        1:begin
              MessageDlg('La cantidad no puede ser 0.', mtError, [mbOK], 0);
          end;

        2:begin
              MessageDlg('El precio unitario no puede ser 0.', mtError, [mbOK], 0);
          end;

        3:begin
              MessageDlg('El total no puede ser 0.', mtError, [mbOK], 0);
          end;

    end;





    result:=error=0;
end;




procedure Tventadetalleconcepto.mostrarprecios;
begin
    producto_precioventa1.Text:=producto_id.valor('producto_precioventa1');
    producto_precioventa2.Text:=producto_id.valor('producto_precioventa2');
    producto_precioventa3.Text:=producto_id.valor('producto_precioventa3');
    producto_precioventa4.Text:=producto_id.valor('producto_precioventa4');

end;


procedure Tventadetalleconcepto.CargarQuery;
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
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_listaprecio').AsInteger:=documentoventadetalle_listaprecio;
          ZQDocumentoventadetalles.FieldByName('producto_tipo').AsString:='CONCEPTO';
          ZQDocumentoventadetalles.Post;

      end;



end;


procedure Tventadetalleconcepto.mostrarstock;
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

          producdepo_stockinicial.Caption:='Stock Inic: '+Princ.ZQProductos.FieldByName('producdepo_stockinicial').AsString;

          if (actual<=minimo) or (actual<=0) then
            begin
                producdepo_stockactual.Font.Color:=clRed;
                producdepo_stockactual.Font.Style:=[fsBold];
            end;

          Princ.ZQProductos.Active:=false;
      end;
end;

procedure Tventadetalleconcepto.calculartotal;
begin
    ventadetalle_preciounitoriginal.Text:=producto_id.valor('producto_precioventa'+inttostr(documentoventadetalle_listaprecio+1));

    if (documentoventadetalle_listaprecio<>-1) and (producto_id.Text<>'') then
      begin
          if ventadetalle_preciounitario.Text<>ventadetalle_preciounitoriginal.Text then
            documentoventadetalle_listaprecio:=-1;
      end;
    ventadetalle_total.Text:=floattostr(ventadetalle_preciounitario.FloatValue*ventadeta_cantidad.Value);
end;


procedure Tventadetalleconcepto.Codigodereferencia1Click(Sender: TObject);
begin
//    busquedaproductos:=Tbusquedaproductos.Create(self);
//    busquedaproductos.producto_codigoreferencia:='="'+producto_id.valor('producto_codigoreferencia')+'"';
//    busquedaproductos.btnbuscar.Click;
//    if busquedaproductos.ShowModal=mrOk then
//      begin
//          producto_id.Search(busquedaproductos.producto_id);
//
//      end;
//
//    busquedaproductos.Free;
end;

procedure Tventadetalleconcepto.producto_idAfterSearch(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:=producto_id.valor('producto_precioventa'+producto_precioventa);
    //producto_nombre.ReadOnly:=not (PRODUCTOMODIFICARDESCR=producto_id.Text);
//    producto_nombre.TabStop:=not producto_nombre.ReadOnly;

    producto_fechaactualizacionprecio.Caption:=producto_id.valor('producto_fechaactualizacionprecio');


    mostrarstock;
    mostrarprecios;
    calculartotal;
end;

procedure Tventadetalleconcepto.producto_idClickBtn(Sender: TObject);
begin
    BusquedaConceptosDebCred:=TBusquedaConceptosDebCred.Create(self);
    BusquedaConceptosDebCred.campo_id:='producto_id';
    if BusquedaConceptosDebCred.ShowModal=mrOk then
      begin
          producto_id.Text:=BusquedaConceptosDebCred.id;
          producto_id.Search(BusquedaConceptosDebCred.id);
      end;

    BusquedaConceptosDebCred.Free;
end;

procedure Tventadetalleconcepto.producto_idKeyPress(Sender: TObject; var Key: Char);
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

procedure Tventadetalleconcepto.producto_idSelect(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:=princ.buscar('select producto_precioventa'+producto_precioventa+' from productos where producto_id="'+producto_id.Text+'"','producto_precioventa'+producto_precioventa);
    calculartotal;
end;

procedure Tventadetalleconcepto.btnherramientasClick(Sender: TObject);
var
  pt: TPoint;
begin
    pt := Point(btnherramientas.Left, btnherramientas.Top + btnherramientas.Height);
    pt := Self.ClientToScreen(pt);

    btnherramientas.DropDownMenu.Popup(pt.X,pt.Y);
end;

procedure Tventadetalleconcepto.btnprecio1Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa1.Text;
    documentoventadetalle_listaprecio:=0;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalleconcepto.btnprecio2Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa2.Text;
    documentoventadetalle_listaprecio:=1;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalleconcepto.btnprecio3Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa3.Text;
    documentoventadetalle_listaprecio:=2;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalleconcepto.btnprecio4Click(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:= producto_precioventa4.Text;
    documentoventadetalle_listaprecio:=3;
    calculartotal;
    btnaceptar.SetFocus;
end;

procedure Tventadetalleconcepto.btnaceptarClick(Sender: TObject);
begin
    if control then
      begin
          calculartotal;
          CargarQuery;
          Self.ModalResult:=mrOk;
      end;

end;

procedure Tventadetalleconcepto.FormCreate(Sender: TObject);
begin
    ventadeta_cantidad.Text:='1';
    PRODUCTOMODIFICARDESCR:=Princ.GetConfiguracion('PRODUCTOMODIFICARDESCR');
    producto_fechaactualizacionprecio.Caption:='';
    ZQDocumentoventadetalles.Active:=false;
    btnprecio1.Caption:=Princ.NOMBREPRECIO1;
    btnprecio2.Caption:=Princ.NOMBREPRECIO2;
    btnprecio3.Caption:=Princ.NOMBREPRECIO3;
    btnprecio4.Caption:=Princ.NOMBREPRECIO4;

    producto_id.ConfSql.Text:='select * from productos where producto_estado="DISPONIBLE" and producto_tipo="CONCEPTO" order by producto_nombre';
    producto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    producto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    producto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;

    producdepo_stockinicial.Visible:=Princ.PRODUCTOSTOCKINICIAL;

end;

procedure Tventadetalleconcepto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F9:btnaceptar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tventadetalleconcepto.ventadetalle_preciounitarioExit(Sender: TObject);
begin
    calculartotal;
end;

procedure Tventadetalleconcepto.ventadetalle_totalExit(Sender: TObject);
begin
    calculartotal;
end;

procedure Tventadetalleconcepto.ventadeta_cantidadExit(Sender: TObject);
begin
    calculartotal;
end;

end.
