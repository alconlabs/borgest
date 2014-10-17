unit UnitFacturaventa02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitfacturasventa, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, AdvGlowButton, MoneyEdit, Grids,
  DBGrids, UnitSqlComboBox, ComCtrls, ExtCtrls, AdvPanel, AdvEdit, AdvEdBtn,
  EditCodi, math, Buttons, GTBMemo;

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
    lbltarjeta: TLabel;
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
    GroupBox2: TGroupBox;
    Label17: TLabel;
    cliente_nombre: TEdit;
    Label21: TLabel;
    cliente_domicilio1: TEdit;
    cliente_documentonro1: TEdit;
    Label23: TLabel;
    cliente_mail1: TEdit;
    Label22: TLabel;
    Label24: TLabel;
    documentoventa_subtotal: TMoneyEdit;
    ZQProductoActualizar: TZQuery;
    vendedor_id: TEditCodi;
    Label25: TLabel;
    CBDevolucion: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label26: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label27: TLabel;
    deposito_iddestino: TSqlComboBox;
    Label28: TLabel;
    MovProducto_id: TEditCodi;
    DBGrid3: TDBGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label29: TLabel;
    movimientodeposito_observaciones: TGTBMemo;
    btnguardarmov: TButton;
    btncancelarmov: TButton;
    ZQmovimdepodetalles: TZQuery;
    ZQmovimdepodetallesmovimdepodetalle_id: TIntegerField;
    ZQmovimdepodetallesmovimdepodetalle_cantidadenviar: TFloatField;
    ZQmovimdepodetallesmovimdepodetalle_cantidadrecibir: TFloatField;
    ZQmovimdepodetallesmovimdepodetalle_estado: TStringField;
    ZQmovimdepodetallesproducto_id: TIntegerField;
    ZQmovimdepodetallesmovimientodeposito_id: TIntegerField;
    ZQmovimdepodetallesproducto_id_1: TIntegerField;
    ZQmovimdepodetallesproducto_nombre: TStringField;
    ZQmovimdepodetallesproducto_observaciones: TStringField;
    ZQmovimdepodetallesproducto_codigo: TStringField;
    ZQmovimdepodetallesproducto_codigobarras: TStringField;
    ZQmovimdepodetallesproducto_preciocosto: TFloatField;
    ZQmovimdepodetallesproducto_precioventabase: TFloatField;
    ZQmovimdepodetallesproducto_estado: TStringField;
    ZQmovimdepodetallesproducto_precioventa1: TFloatField;
    ZQmovimdepodetallestipoiva_id: TIntegerField;
    ZQmovimdepodetallesrubro_id: TIntegerField;
    ZQmovimdepodetallesproducto_precioventa2: TFloatField;
    ZQmovimdepodetallesproducto_precioventa3: TFloatField;
    ZQmovimdepodetallesproducto_precioventa4: TFloatField;
    ZQmovimdepodetallescalculoprecio_id: TIntegerField;
    ZQmovimdepodetallespoliticaprecio_id: TIntegerField;
    ZQmovimdepodetallesproducto_neto1: TFloatField;
    ZQmovimdepodetallesproducto_neto2: TFloatField;
    ZQmovimdepodetallesproducto_neto3: TFloatField;
    ZQmovimdepodetallesproducto_neto4: TFloatField;
    ZQmovimdepodetallesproveedor_id: TIntegerField;
    ZQmovimdepodetallesproducto_fechaactualizacionprecio: TDateField;
    ZQmovimdepodetallesproducto_codigoreferencia: TStringField;
    ZQmovimdepodetallesproducto_imprimir: TIntegerField;
    ZQmovimdepodetallesproducto_tipo: TStringField;
    DTSmovimdepodetalles: TDataSource;
    BtnConsultaStock: TButton;
    ZQDocumentoventadetallesproducto_codigo: TStringField;
    ZQDocumentoventadetallesproducto_codigobarras: TStringField;
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
    procedure btnguardarClick(Sender: TObject);
    procedure vendedor_idAfterSearch(Sender: TObject);
    procedure CBDevolucionClick(Sender: TObject);
    procedure MovProducto_idAfterSearch(Sender: TObject);
    procedure btnguardarmovClick(Sender: TObject);
    procedure DTSDocumentoventadetalleStateChange(Sender: TObject);
    procedure BtnConsultaStockClick(Sender: TObject);
    procedure producto_idEnter(Sender: TObject);
  private
    { Private declarations }
    precio_old:real;
    precio_new:real;
    abm_detalle:integer;

    procedure CargarQuery;
    function CargarCliente:string;
  public
    { Public declarations }
  end;

var
  facturaventa02: Tfacturaventa02;

implementation

uses UnitPrinc, UnitConsultarStockCurva;

{$R *.dfm}

function Tfacturaventa02.CargarCliente:string;
var
  cargar:boolean;
  idcliente:string;
begin
    cargar:=false;
    cargar:=cliente_nombre.Text<>cliente_id.Text;
    cargar:=cargar or (cliente_domicilio1.Text<>cliente_domicilio.Caption);
    cargar:=cargar or (cliente_documentonro1.Text<>cliente_documentonro.Caption);
    cargar:=cargar or (cliente_mail1.Text<>Princ.buscar('select cliente_mail from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_mail'));

    if cargar then
      begin
          idcliente:=Princ.codigo('clientes','cliente_id');

          ZQExecSql.sql.clear;
          ZQExecSql.sql.add('Insert into clientes (cliente_id, cliente_nombre, cliente_domicilio, ');
          ZQExecSql.sql.add('cliente_documentonro, cliente_documentotipo, cliente_telefono, cliente_celular, ');
          ZQExecSql.sql.add('cliente_mail, condicioniva_id, cliente_listaprecio, cliente_condicionventa, localidad_id, cliente_observaciones, personal_id, cliente_diasvenc) ');
          ZQExecSql.sql.add('values (:cliente_id, :cliente_nombre, :cliente_domicilio, ');
          ZQExecSql.sql.add(':cliente_documentonro, :cliente_documentotipo, :cliente_telefono, :cliente_celular, ');
          ZQExecSql.sql.add(':cliente_mail, :condicioniva_id, :cliente_listaprecio, :cliente_condicionventa, :localidad_id, :cliente_observaciones, :personal_id, :cliente_diasvenc) ');

          ZQExecSql.parambyname('cliente_id').asstring:=idcliente;
          ZQExecSql.parambyname('cliente_nombre').asstring:=cliente_nombre.Text;
          ZQExecSql.parambyname('cliente_domicilio').asstring:=cliente_domicilio1.Text;
          ZQExecSql.parambyname('cliente_documentonro').asstring:=cliente_documentonro1.Text;

          ZQExecSql.parambyname('cliente_documentotipo').asstring:='DNI';
          ZQExecSql.parambyname('cliente_telefono').asstring:='';
          ZQExecSql.parambyname('cliente_celular').asstring:='';
          ZQExecSql.parambyname('cliente_mail').asstring:=cliente_mail1.Text;
          ZQExecSql.parambyname('condicioniva_id').asstring:='3';
          ZQExecSql.parambyname('cliente_listaprecio').AsInteger:=0;
          ZQExecSql.parambyname('cliente_condicionventa').AsInteger:=0;
          ZQExecSql.parambyname('localidad_id').asstring:='1';
          ZQExecSql.parambyname('cliente_observaciones').asstring:='';
          ZQExecSql.parambyname('personal_id').asstring:=personal_id.codigo;
          ZQExecSql.parambyname('cliente_diasvenc').asstring:='0';
          ZQExecSql.ExecSQL;

      end
    else
      idcliente:=cliente_id.codigo;


    result:=idcliente;
end;

procedure Tfacturaventa02.FormCreate(Sender: TObject);
begin
  inherited;
    producto_id.ConfSql.Text:='select * from productos left join politicasdeprecios on productos.politicaprecio_id=politicasdeprecios.politicaprecio_id where producto_estado="DISPONIBLE" and producto_tipo="PRODUCTO" order by producto_nombre';
    producto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    producto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    producto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;

    MovProducto_id.ConfSql.Text:='select * from productos left join politicasdeprecios on productos.politicaprecio_id=politicasdeprecios.politicaprecio_id where producto_estado="DISPONIBLE" and producto_tipo="PRODUCTO" order by producto_nombre';
    MovProducto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    MovProducto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    MovProducto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;

    deposito_iddestino.Confsql.Text:='select * from depositos where deposito_id<>"'+princ.dep_id+'" order by deposito_nombre';
    deposito_iddestino.llenarcombo;
    deposito_iddestino.ItemIndex:=0;

end;

procedure Tfacturaventa02.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
        VK_F2:begin
                  cliente_nombre.SetFocus;
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
    PageControl1.Align:=alClient;
    PageControl1.ActivePage:=TabSheet1;
    panelgrilla.Parent:=TabSheet1;

    cliente_nombre.Text:=cliente_id.Text;
    cliente_domicilio1.Text:=cliente_domicilio.Caption;
    cliente_documentonro1.Text:=cliente_documentonro.Caption;
    cliente_mail1.Text:=Princ.buscar('select cliente_mail from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_mail');

    vendedor_id.SetFocus;

    ZQmovimdepodetalles.Active:=false;
    ZQmovimdepodetalles.ParamByName('movimientodeposito_id').AsString:='-1';
    ZQmovimdepodetalles.Active:=true;
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
                      documentoventa_subtotal.Value:=documentoventa_total.Value;
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


procedure Tfacturaventa02.producto_idEnter(Sender: TObject);
begin
  inherited;
    abm_detalle:=ABM_AGREGAR;
end;

procedure Tfacturaventa02.tipopago_idAfterSearch(Sender: TObject);
begin
  inherited;
    lbltarjeta.Visible:=false;
    tarjeta_id.Visible:=false;
    Label19.Left:=115;
    documentopago_nombre.Left:=115;
    documentopago_nombre.Width:=251;
    if tipopago_id.valor('tipopago_id')='2' then
      begin
          lbltarjeta.Visible:=true;
          tarjeta_id.Visible:=true;
          Label19.Left:=171;
          documentopago_nombre.Left:=171;
          documentopago_nombre.Width:=195;
          tarjeta_id.SetFocus;
      end;


end;

procedure Tfacturaventa02.tipopago_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key=VK_RETURN then
      begin
          if (tipopago_id.Text='') then
            documentoventa_descuento.SetFocus;

      end;

end;

procedure Tfacturaventa02.vendedor_idAfterSearch(Sender: TObject);
begin
  inherited;
    personal_id.Buscar(vendedor_id.Text);

end;

procedure Tfacturaventa02.ZQDocumentoventadetallesAfterPost(DataSet: TDataSet);
begin
  inherited;
    calculartotales;
    calculartotalpagos;
    documentopago_importe.Value:=documentoventa_saldo;
    documentoventa_subtotal.Value:=documentoventa_total.Value;

    ZQProductoActualizar.Active:=false;
    ZQProductoActualizar.ParamByName('producto_id').AsString:=ZQDocumentoventadetalles.FieldByName('producto_id').AsString;
    ZQProductoActualizar.Active:=true;
    if ZQProductoActualizar.FieldByName('producto_precioventa1').AsFloat<>ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat then
      begin
          ZQProductoActualizar.Edit;
          ZQProductoActualizar.FieldByName('producto_estadosinc').AsString:='PENDIENTE';
          ZQProductoActualizar.FieldByName('producto_precioventa1').AsFloat:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;
          ZQProductoActualizar.FieldByName('producto_fechaactualizacionprecio').AsDateTime:=Date;
          ZQProductoActualizar.Post;

          ZQProductoActualizar.ApplyUpdates;

          ZQProductoActualizar.Active:=false;
      end;

end;

procedure Tfacturaventa02.ZQDocumentoventadetallesBeforePost(DataSet: TDataSet);
var
  tipoiva_valor:real;
begin
  inherited;
    //ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').CurValue;
//    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').OldValue;
//    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').NewValue;
    if ZQDocumentoventadetalles.State in [dsEdit] then
      begin
          precio_new:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;
          if precio_old<>precio_new then
            if not Princ.IdentificaUsuario('') then
              ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat:=precio_old;

      end;




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
          princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, ZQProducto, abm_detalle, nil);
          calculartotales;
          calculartotalpagos;
          documentopago_importe.Value:=documentoventa_saldo;
          documentoventa_subtotal.Value:=documentoventa_total.Value;
          producto_id.Text:='-1';
          producto_id.Search('-1');
          producto_id.SetFocus;
      end
    else
      begin
          if ZQDocumentoventadetalles.State in [dsInsert] then
            ZQDocumentoventadetalles.Cancel;


      end;

end;

procedure Tfacturaventa02.BtnConsultaStockClick(Sender: TObject);
begin
  inherited;
    ConsultarStockCurvas:=TConsultarStockCurvas.Create(self);
    ConsultarStockCurvas.Show;
end;

procedure Tfacturaventa02.btnguardarClick(Sender: TObject);
var
  idcliente:string;
begin
    if (MessageDlg('Confirma la venta?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          idcliente:=CargarCliente;
          cliente_id.llenarcombo;
          cliente_id.Buscar(idcliente);

          inherited;
      end
    else
      Self.OnShow(self);

end;

procedure Tfacturaventa02.btnguardarmovClick(Sender: TObject);
var
  movimientodeposito_id:string;
begin
  inherited;
    movimientodeposito_id:=princ.codigo('movimientosdepositos','movimientodeposito_id');
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into movimientosdepositos set ');
    ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
    ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
    ZQExecSQL.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
    ZQExecSQL.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
    ZQExecSQL.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado, ');
    ZQExecSQL.Sql.Add('movimientodeposito_hora=:movimientodeposito_hora, ');
    ZQExecSQL.Sql.Add('movimientodeposito_fecha=:movimientodeposito_fecha, ');
    ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id ');
    ZQExecSQL.ParamByName('deposito_iddestino').AsString:=deposito_iddestino.codigo;
    ZQExecSQL.ParamByName('deposito_idorigen').AsString:=princ.dep_id;
    ZQExecSQL.ParamByName('movimientodeposito_observaciones').AsString:='GENERADO DESDE VENTAS 02';
    ZQExecSQL.ParamByName('movimientodeposito_estadosinc').AsString:=Princ.GetConfiguracion('MOVIMDEPOESTADOSINCALCREAR');
    ZQExecSQL.ParamByName('movimientodeposito_estado').AsString:='PENDIENTE';
    ZQExecSQL.ParamByName('movimientodeposito_hora').AsTime:=Time;
    ZQExecSQL.ParamByName('movimientodeposito_fecha').AsString:=FormatDateTime('yyyy-mm-dd',Date);
    ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=movimientodeposito_id;
    ZQExecSQL.ExecSql;

    ZQmovimdepodetalles.First;
    while not ZQmovimdepodetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into movimdepodetalles set ');
            ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
            ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
            ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
            ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
            ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=movimientodeposito_id;
            ZQExecSQL.ParamByName('producto_id').AsString:=ZQmovimdepodetalles.FieldByName('producto_id').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_estado').AsString:='ENVIADO';
            ZQExecSQL.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_id').AsString:=princ.codigo('movimdepodetalles','movimdepodetalle_id');
            ZQExecSQL.ParamByName('deposito_iddestino').AsString:=deposito_iddestino.codigo;
            ZQExecSQL.ParamByName('deposito_idorigen').AsString:=princ.dep_id;
            ZQExecSQL.ExecSql;

            Princ.actualizarstock(ZQmovimdepodetalles.FieldByName('producto_id').AsString,ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat*-1,'',false);

            ZQmovimdepodetalles.Next;
        end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit');
    ZQExecSQL.ExecSQL;

    princ.Permisos1.guardarlog(self.ClassName+'.Guardar_movimiento_deposito; movimientodeposito_id='+movimientodeposito_id);

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    PageControl1.ActivePage:=TabSheet1;
    ZQmovimdepodetalles.Active:=false;
    ZQmovimdepodetalles.ParamByName('movimientodeposito_id').AsString:='-1';
    ZQmovimdepodetalles.Active:=true;
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
          if CBDevolucion.Checked then
            begin
                ZQProducto.FieldByName('documentoventadetalle_cantidad').AsString:='-1';
                CBDevolucion.Checked:= false;

            end;

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
          ZQProducto.FieldByName('producto_codigo').AsString:=producto_id.valor('producto_codigo');
          ZQProducto.FieldByName('producto_codigobarras').AsString:=producto_id.valor('producto_codigobarras');
          ZQProducto.FieldByName('documentoventadetalle_idorig').AsString:='0';
          ZQProducto.FieldByName('documentoventadetalle_cantidadpendiente').AsString:='0';
          ZQProducto.FieldByName('documentoventa_id').AsString:='0';
          ZQProducto.FieldByName('documentoventadetalle_listaprecio').AsInteger:=0;
          ZQProducto.Post;

      end;



end;

procedure Tfacturaventa02.CBDevolucionClick(Sender: TObject);
begin
  inherited;
    producto_id.SetFocus;
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

          if ZQDocumentoventadetalles.State in [dsInsert] then
            begin
                if DBGrid1.SelectedIndex=0 then
                  begin
                      abm_detalle:=ABM_MODIFICAR;
                      producto_id.Text:=DBGrid1.SelectedField.Value;
                      producto_id.Search(producto_id.Text);
                      DBGrid1.SetFocus;

                      ZQDocumentoventadetalles.Last;
                      ZQDocumentoventadetalles.Next;
                      ZQDocumentoventadetalles.Append;;
                      DBGrid1.SelectedIndex:=0;

                  end;





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
                ZQDocumentopagos.Insert;
                ZQDocumentopagos.FieldByName('documentopago_id').AsInteger:=ZQDocumentopagos.RecordCount;
                ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:=documentopago_nombre.Text;
                ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=documentopago_importe.Text;
                ZQDocumentopagos.FieldByName('tipopago_id').AsString:=tipopago_id.valor('tipopago_id');
                ZQDocumentopagos.FieldByName('tipopago_nombre').AsString:=tipopago_id.valor('tipopago_nombre');
                ZQDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
                ZQDocumentopagos.Post;


                case strtoint(tipopago_id.valor('tipopago_id')) of
                    1:begin

                      end;
                    2:begin
                          ZQpagotarjeta.Last;
                          ZQpagotarjeta.Append;
                          ZQpagotarjeta.FieldByName('pagotarjeta_id').AsInteger:=ZQpagotarjeta.RecordCount;
                          ZQpagotarjeta.FieldByName('pagotarjeta_importe').AsString:=documentopago_importe.Text;
                          ZQpagotarjeta.FieldByName('pagotarjeta_cuotas').AsString:='1';
                          ZQpagotarjeta.FieldByName('pagotarjeta_cupon').AsString:='';
                          ZQpagotarjeta.FieldByName('pagotarjeta_autoriz').AsString:='';
                          ZQpagotarjeta.FieldByName('documentopago_id').AsInteger:=ZQDocumentopagos.RecordCount;
                          ZQpagotarjeta.FieldByName('tarjeta_id').AsString:=tarjeta_id.Text;
                          ZQpagotarjeta.FieldByName('pagotarjeta_titular').AsString:=cliente_id.Text;
                          ZQpagotarjeta.FieldByName('pagotarjeta_dni').AsString:='';
                          ZQpagotarjeta.FieldByName('pagotarjeta_telefono').AsString:='';
                          ZQpagotarjeta.FieldByName('pagotarjeta_recargo').AsString:='0';
                          ZQpagotarjeta.Post;
                      end;
                    3:begin

                      end;
                    4:begin

                      end;
                    5:begin

                      end;
                end;

                calculartotales;
                calculartotalpagos;
                documentopago_importe.Value:=documentoventa_saldo;
                documentoventa_subtotal.Value:=documentoventa_total.Value;
                tipopago_id.Text:='';
                tipopago_id.Search('');
                tipopago_id.SetFocus;
            end;
      end;
end;

procedure Tfacturaventa02.documentopago_nombreEnter(Sender: TObject);
begin
  inherited;
    if tipopago_id.Text='' then
      tipopago_id.SetFocus;

end;

procedure Tfacturaventa02.DTSDocumentoventadetalleStateChange(Sender: TObject);
begin
  inherited;
    if ZQDocumentoventadetalles.State in [dsEdit] then
      begin
          precio_old:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;

      end

end;

procedure Tfacturaventa02.MovProducto_idAfterSearch(Sender: TObject);
begin
  inherited;
    if (MovProducto_id.Text<>'') then
      begin
          ZQmovimdepodetalles.Insert;
          ZQmovimdepodetalles.FieldByName('movimdepodetalle_id').AsString:='0';
          ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsInteger:=1;
          ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString:='0';
          ZQmovimdepodetalles.FieldByName('movimdepodetalle_estado').AsString:='ENVIADO';
          ZQmovimdepodetalles.FieldByName('producto_id').AsString:=MovProducto_id.Text;
          ZQmovimdepodetalles.FieldByName('movimientodeposito_id').AsString:='0';
          ZQmovimdepodetalles.FieldByName('producto_nombre').AsString:=MovProducto_id.valor('producto_nombre');

          ZQmovimdepodetalles.Post;

          MovProducto_id.Text:='-1';
          MovProducto_id.Search('-1');
          MovProducto_id.SetFocus;
      end;
end;

end.
