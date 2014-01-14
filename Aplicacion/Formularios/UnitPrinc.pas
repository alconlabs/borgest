unit UnitPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvMenus, AdvPanel,
  ZConnection, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, midaslib, ini,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, ADODB, rpcompobase, rpvclreport,
  ZSqlProcessor, WinINet, Math, UnitBackupdb, ZSqlMonitor,
  rpalias, GTBComboBox, ComCtrls, rpexpredlgvcl, DBClient,
  rpclientdataset, Menus, Encriptador, Utilidades, Permisos, DBGrids,
  TablaTemporal;


const
  InputBoxMessage = WM_USER + 200;


type
  TPrinc = class(TForm)
    MenuPrincipal: TAdvToolBarPager;
    AdvPageArchivo: TAdvPage;
    AdvPageVentas: TAdvPage;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvToolBarGeneral: TAdvToolBar;
    AdvToolBarDocVentas: TAdvToolBar;
    btnfacturasventas: TAdvGlowButton;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    ZBase: TZConnection;
    ZQBuscar: TZQuery;
    ZQCodigo: TZQuery;
    btnrecibodeventa: TAdvGlowButton;
    btnpersonal: TAdvGlowButton;
    ZQActualizarStock: TZQuery;
    btnproductos: TAdvGlowButton;
    btncalculoprecios: TAdvGlowButton;
    btnclientes: TAdvGlowButton;
    ini1: Tini;
    ZQCalculopreciodeta: TZQuery;
    btnpoliticaprecio: TAdvGlowButton;
    ZQActualizarSaldoDocumentoVenta: TZQuery;
    ZQRecibos: TZQuery;
    ZQZQActualizarNumeroDocumento: TZQuery;
    ZQDocumentosVentasPendientes: TZQuery;
    AdvPageCompras: TAdvPage;
    AdvToolBarDocCompras: TAdvToolBar;
    btnfacturascompras: TAdvGlowButton;
    btnordenespago: TAdvGlowButton;
    AdvPageHerramientas: TAdvPage;
    AdvToolBarHerramientas: TAdvToolBar;
    btnimportacion: TAdvGlowButton;
    btnconfiguracion: TAdvGlowButton;
    ZQDocumentosventas: TZQuery;
    ZQdocumentoventadetalles: TZQuery;
    ZQDocumentopagos: TZQuery;
    btnimpresorafiscal: TAdvGlowButton;
    ZQuery1: TZQuery;
    ZQDocumentosventasABM: TZQuery;
    btnnotasdecredito: TAdvGlowButton;
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    OpenDialog1: TOpenDialog;
    AdvToolBarProveedores: TAdvToolBar;
    btnproveedores: TAdvGlowButton;
    AdvToolBarLocalidades: TAdvToolBar;
    btnlocalidades: TAdvGlowButton;
    ZQProductosABM: TZQuery;
    AdvToolBarEmpresa: TAdvToolBar;
    btnempresa: TAdvGlowButton;
    btnservicios: TAdvGlowButton;
    btnventasrapidas: TAdvGlowButton;
    btncontratacion: TAdvGlowButton;
    VCLReport1: TVCLReport;
    AdvToolBarCtasCtesVentas: TAdvToolBar;
    AdvToolBarCaja: TAdvToolBar;
    btndetallectasventas: TAdvGlowButton;
    ZQExcecSQL: TZQuery;
    ZSQLProcessor1: TZSQLProcessor;
    ZQCalculopreciodetaprod: TZQuery;
    BackupDB1: TBackupDB;
    ZQDocumentoventadocus: TZQuery;
    ADOTable1: TADOTable;
    ZQProductos: TZQuery;
    ZQMenu: TZQuery;
    btncaja: TAdvGlowButton;
    tbnestadoctasventas: TAdvGlowButton;
    btnestadocaja: TAdvGlowButton;
    btnnotapedido: TAdvGlowButton;
    btnconsultaequipos: TAdvGlowButton;
    btnsucursales: TAdvGlowButton;
    btnpuntosdeventa: TAdvGlowButton;
    ZSQLMonitor1: TZSQLMonitor;
    btntiposdocumentos: TAdvGlowButton;
    AdvToolBarSeguridad: TAdvToolBar;
    btnperfiles: TAdvGlowButton;
    btnsaldos: TAdvGlowButton;
    btnservice: TAdvGlowButton;
    AdvToolBarInformes: TAdvToolBar;
    btninformesventas: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    btnordenservicio: TAdvGlowButton;
    AdvToolBarListados: TAdvToolBar;
    btnlistaprecios: TAdvGlowButton;
    btnpresupuestos: TAdvGlowButton;
    ZQdocumentocompradetalles: TZQuery;
    btndetallepagos: TAdvGlowButton;
    btnlibroivaventas: TAdvGlowButton;
    btncajabar: TAdvGlowButton;
    RpClientDataset1: TRpClientDataset;
    AdvPageComisiones: TAdvPage;
    AdvToolBarComisionesVendedores: TAdvToolBar;
    btncomisionesvendedores: TAdvGlowButton;
    btnliquidacionesvendedores: TAdvGlowButton;
    btnvendedoresdebcred: TAdvGlowButton;
    AdvToolBarComisionesSucursales: TAdvToolBar;
    btncomisionessucursales: TAdvGlowButton;
    btnliquidacionessucu: TAdvGlowButton;
    btndebcredsucursales: TAdvGlowButton;
    AdvToolBarNotasdepedido: TAdvToolBar;
    btnlistanotasdepedido: TAdvGlowButton;
    btnnotasdedebito: TAdvGlowButton;
    btnremitos: TAdvGlowButton;
    AdvPopupMenu1: TAdvPopupMenu;
    aver1: TMenuItem;
    aver21: TMenuItem;
    aver31: TMenuItem;
    aver41: TMenuItem;
    Encriptador1: TEncriptador;
    GTBUtilidades1: TGTBUtilidades;
    btnprovincias: TAdvGlowButton;
    btnconceptosdebcred: TAdvGlowButton;
    btnRecibosPendientes: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    Permisos1: TPermisos;
    btntarjetas: TAdvGlowButton;
    ZQRecargoTarjetas: TZQuery;
    ZQpagotarjeta: TZQuery;
    BtnConfigurarListas: TAdvGlowButton;
    ZQConfigcolumnas: TZQuery;
    ZQProcedimientosAlmacenados: TZQuery;
    ZQOrdendePago: TZQuery;
    ZQActualizarSaldoDocumentoCompra: TZQuery;
    ZQDocumentocompradocus: TZQuery;
    AdvToolBarCtasCtesCompras: TAdvToolBar;
    BtnDetalleCompras: TAdvGlowButton;
    BtnEstadoCompras: TAdvGlowButton;
    BtnSaldosCompras: TAdvGlowButton;
    AdvToolBarInformesCompras: TAdvToolBar;
    AdvGlowButton8: TAdvGlowButton;
    btnlibroivacompras: TAdvGlowButton;
    btninformescompras: TAdvGlowButton;
    btnnotasdecreditocompra: TAdvGlowButton;
    btnnotasdedebitocompra: TAdvGlowButton;
    AdvToolBarStock: TAdvToolBar;
    AdvGlowButton3: TAdvGlowButton;
    BtnAjustesdeStock: TAdvGlowButton;
    BtnConsultasStock: TAdvGlowButton;
    BtnMovimientosdeStock: TAdvGlowButton;
    BtnLiquidacionesBorradores: TAdvGlowButton;
    BtnDetalleCuentasBorradores: TAdvGlowButton;
    btnimprimiretiquetas: TAdvGlowButton;
    btnestadoctasborradores: TAdvGlowButton;
    BtnCuponesTarjetas: TAdvGlowButton;
    TablaTemporal1: TTablaTemporal;
    BaseRemota: TZConnection;
    procedure FormCreate(Sender: TObject);
    procedure tbnestadoctasventasClick(Sender: TObject);
    procedure btninformeventasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnclientesClick(Sender: TObject);
    procedure btnrecibodeventaClick(Sender: TObject);
    procedure btnproductosClick(Sender: TObject);
    procedure btncalculopreciosClick(Sender: TObject);
    procedure ZBaseBeforeConnect(Sender: TObject);
    procedure btnpoliticaprecioClick(Sender: TObject);
    procedure btnfacturasventasClick(Sender: TObject);
    procedure btndetallectasventasClick(Sender: TObject);
    procedure btnconfiguracionClick(Sender: TObject);
    procedure btnimpresorafiscalClick(Sender: TObject);
    procedure btnnotasdecreditoClick(Sender: TObject);
    procedure ADOConnection1BeforeConnect(Sender: TObject);
    procedure btnproveedoresClick(Sender: TObject);
    procedure btnlocalidadesClick(Sender: TObject);
    procedure btnventasrapidasClick(Sender: TObject);
    procedure btnestadocajaClick(Sender: TObject);
    procedure ZQProductosBeforeOpen(DataSet: TDataSet);
    procedure btncajaClick(Sender: TObject);
    procedure btnnotapedidoClick(Sender: TObject);
    procedure btnconsultaequiposClick(Sender: TObject);
    procedure MenuPrincipalChange(Sender: TObject);
    procedure btnsucursalesClick(Sender: TObject);
    procedure btnpuntosdeventaClick(Sender: TObject);
    procedure btntiposdocumentosClick(Sender: TObject);
    procedure btnpersonalClick(Sender: TObject);
    procedure btnperfilesClick(Sender: TObject);
    procedure btnsaldosClick(Sender: TObject);
    procedure btnfacturascomprasClick(Sender: TObject);
    procedure btnserviceClick(Sender: TObject);
    procedure btninformesventasClick(Sender: TObject);
    procedure btnordenservicioClick(Sender: TObject);
    procedure ZBaseAfterConnect(Sender: TObject);
    procedure btnlistapreciosClick(Sender: TObject);
    procedure btnpresupuestosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btndetallepagosClick(Sender: TObject);
    procedure btnlibroivaventasClick(Sender: TObject);
    procedure btncajabarClick(Sender: TObject);
    procedure btnlibroivacompras02Click(Sender: TObject);
    procedure btncomisionesvendedoresClick(Sender: TObject);
    procedure btncomisionessucursalesClick(Sender: TObject);
    procedure btnvendedoresdebcredClick(Sender: TObject);
    procedure btndebcredsucursalesClick(Sender: TObject);
    procedure btnnotasdedebitoClick(Sender: TObject);
    procedure btnremitosClick(Sender: TObject);
    procedure btnliquidacionesvendedoresClick(Sender: TObject);
    procedure btnliquidacionessucuClick(Sender: TObject);
    procedure btnprovinciasClick(Sender: TObject);
    procedure btnconceptosdebcredClick(Sender: TObject);
    procedure btnempresaClick(Sender: TObject);
    procedure VCLReport1BeforePrint(Sender: TObject);
    procedure btnRecibosPendientesClick(Sender: TObject);
    procedure btnlistanotasdepedidoClick(Sender: TObject);
    procedure btntarjetasClick(Sender: TObject);
    procedure BtnConfigurarListasClick(Sender: TObject);
    procedure btnordenespagoClick(Sender: TObject);
    procedure BtnSaldosComprasClick(Sender: TObject);
    procedure BtnEstadoComprasClick(Sender: TObject);
    procedure btnnotasdecreditocompraClick(Sender: TObject);
    procedure BtnDetalleComprasClick(Sender: TObject);
    procedure btnnotasdedebitocompraClick(Sender: TObject);
    procedure BtnMovimientosdeStockClick(Sender: TObject);
    procedure BtnAjustesdeStockClick(Sender: TObject);
    procedure BtnDetalleCuentasBorradoresClick(Sender: TObject);
    procedure BtnLiquidacionesBorradoresClick(Sender: TObject);
    procedure btnimprimiretiquetasClick(Sender: TObject);
    procedure BtnConsultasStockClick(Sender: TObject);
    procedure btnestadoctasborradoresClick(Sender: TObject);
    procedure BtnCuponesTarjetasClick(Sender: TObject);
  private
    { Private declarations }
    procedure MenuConfiguracion;
    procedure RefrescarMenu;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
  public
    { Public declarations }
    EXCEL_FILE:string;
    personal_id_logueado:string;
    perfil_id_logueado:string;
    dep_id:string;
    sucursal_actual:string;
    ProgressMax:integer;
    ProgressPos:integer;
    CODIGOPRODUCTOPORDEFECTO:integer;
    CAMPO_ID_PRODUCTO:string;
    NOMBREPRECIO1:string;
    NOMBREPRECIO2:string;
    NOMBREPRECIO3:string;
    NOMBREPRECIO4:string;
    CODIGOPRODUCTOBUSQUEDA1:string;
    CODIGOPRODUCTOBUSQUEDA2:string;
    CODIGOPRODUCTOBUSQUEDA3:string;
    CAJASALDOINICIALCONCEPTOID:string;
    PRODUCTOSTOCKINICIAL:boolean;
    VENTASNCNDCONCEPTOS:string;
    empresa_where:string;
    ruta_carpeta_reportes:string;
    ultima_busqueda_productos:string;
    MOSTRAREQUIPO:boolean;
    function codigo(tabla:string;campo:string):string;
    function buscar(sql:string;campo:string):string;
    function fechaservidor():TDateTime;
    function NumeroDocumento(tipodocu_id:string; documentoventa_numero:string):string;
    procedure actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
    function GetPrecioVentaBase(producto_preciocosto:real;calculoprecio_id:string):real;
    function GetPrecioVentaBaseprod(producto_precioventabase:real;producto_id:string):real;
    procedure ActualizarSaldoDocumentoVenta(id:string; importe:real; inversa:boolean=false);
    function AgregarDocumentoVenta(Cabecera:TDataset; Detalle:TDataset; Documentoventadocu:TDataset; Pagos:TDataset):string;
    Procedure ModificarDocumentoVenta(Cabecera: TDataSet; Detalle: TDataSet; Documentoventadocu: TDataSet; Pagos: TDataSet; pagostarjeta: TDataSet);
    procedure AgregarRecibo(ZQCabecera:TDataset; ZQDetalle:TDataset; ZQPagos:TDataset);
    function CargarPago(importe:real; QDocumentopagos:TDataset; QPagoTarjeta:TDataset): boolean;
    procedure ActualizarNumeroDocumento(tipodocu_id: string; tipodocu_ultimonumero:string);
    function CargarDocumentoVentaDocu(cliente_id: string; QDocumentoVentaDocus:TDataset;documentoventa_apagar:real;AgregarAutomatico:boolean;where_tipodocu:string=' and 1=1 '):boolean;
    function ImprimirFiscal(id:string; puntoventa_id:string=''):boolean;
    function GetConfiguracion(config_nombre:string):string;
    function QuitarCaracteresEspeciales(texto:string):string;
    procedure CalcularPreciosProducto(QProductos:TDataset; aplicar_cambios:boolean=false);
    procedure AgregarProductos(QProductos:TDataset);
    procedure ActualizarPrecios(QProductos:TDataset);
    function QuitarEspecialesNros(const Cad: string): string;
    function horaservidor():Ttime;
    function ControlCodigoProducto(codigo:string; producto_id:string;campo:string; mostrar_mensaje:boolean):boolean;
    procedure CargarDocumentoVentaDetalle(QDocumentoVentaDetalles:TDataset; Detalle:TDataset; abm:integer=1; bm:pointer=nil);
    procedure AbrirNuevoServicio;
    procedure AbrirModificarServicio(id:string);
    procedure AbrirNuevoCliente;
    procedure AbrirModificarCliente(id:string);
    procedure AbrirNuevoCalculoprecios;
    procedure AbrirModificarCalculoprecios(id:string);
    procedure AbrirNuevoProveedores;
    procedure AbrirModificarProveedores(id:string);
    procedure AbrirNuevoCajaAsiento(caja_id:string);
    procedure AbrirModificarCajaAsiento(id:string);
    procedure AbrirEliminarCajaAsiento(id:string);
    procedure AbrirNuevoCajaAsientoIngreso(caja_id:string);
    procedure AbrirModificarCajaAsientoIngreso(id:string);
    procedure AbrirNuevoCajaAsientoEgreso(caja_id:string);
    procedure AbrirModificarCajaAsientoEgreso(id:string);
    function EsCUITValido(Num:String):boolean;
    function DescargarArchivo( sURL, sArchivoLocal: String ): boolean;
    function EjecutarScriptDB(archivo_sql:string):boolean;
    function BorrarDocumentoVenta(documentoventa_id:string):boolean;
    function BorrarDocumentoCompra(documentocompra_id:string):boolean;
    function GetConfigTipoDocumento(documento_id:string; tipodocu_id:string; campo:string):string;
    procedure MostrarVentanaExcel;
    procedure GetBoolConfig(config_nombre:string;valor_true:string; var propiedad:boolean);
    procedure AbrirDocumentoVenta(id:string;tipodocu_nombre:string;abm:integer);
    procedure AbrirDocumentoCompra(id:string;tipodocu_nombre:string;abm:integer);
    procedure AbrirNuevoTipoDocumento;
    procedure AbrirModificarTipoDocumento(id:string);
    procedure AbrirNuevoPerfil;
    procedure AbrirModificarPerfil(id:string);
    procedure ImprimirDocumentoVenta(id:string);
    function AbrirCaja(personal_id:string):string;
    procedure CerrarCaja(caja_id:string;caja_saldofinal:real);
    function GetConfiguracionMenu(menu_nomb:string; campo:string):string;
    procedure AbrirModificarProducto(id:string);
    Procedure ModificarProducto(QProductos: TDataSet);
    procedure AbrirNuevoTarjeta;
    procedure AbrirModificarTarjeta(id:string);
    procedure CalcularRecargoTarjeta(tarjeta_id:string; cuotas:integer; importe:real);
    procedure ConfigurarColumnas(grilla: TDBGrid);
    function CargarDocumentoCompraDocu(proveedor_id: string; QDocumentoCompraDocus:TDataset;documentocompra_apagar:real;AgregarAutomatico:boolean;where_tipodocu:string=' and 1=1 '):boolean;
    function CargarCompraPago(importe:real; QDocumentocomprapagos: TDataSet; QPagoTarjeta:TDataset):boolean;
    procedure AgregarOrdendePago(ZQCabecera: TDataset; ZQDetalle: TDataset; ZQPagos: TDataset);
    procedure ActualizarSaldoDocumentoCompra(id: string; importe: Real; inversa:boolean=false);
    function ControlDocumentoComprarepetido(tipodocu_id:string; documentocompra_puntoventa:string; documentocompra_numero:string; proveedor_id:string):boolean;
    procedure CargarDocumentoCompraDetalle(QDocumentoCompraDetalles:TDataset; Detalle:TDataset; abm:integer=1; bm:pointer=nil);
    function ProtegidoxPass(nombre:string):boolean;
  end;


var
  Princ: TPrinc;

const
  TIPO_CUIT = $00000043;
  TIPO_CUIL = $0000004C;
  TIPO_LE = $00000030;
  TIPO_LC = $00000031;
  TIPO_DNI = $00000032;
  TIPO_PASAPORTE = $00000033;
  TIPO_CI = $00000034;
  TIPO_NINGUNO = $00000020;

  RESPONSABLE_INSCRIPTO = $00000049;
  RESPONSABLE_NO_INSCRIPTO = $0000004E;
  RESPONSABLE_EXENTO = $00000045;
  NO_RESPONSABLE = $00000041;
  CONSUMIDOR_FINAL = $00000043;
  BIENES_DE_USO = $00000042;
  NO_CATEGORIZADO = $00000054;
  MONOTRIBUTO = $0000004D;
  MONOTRIBUTO_SOCIAL = $00000053;
  EVENTUAL = $00000056;
  EVENTUAL_SOCIAL = $00000057;

  TICKET_FACTURA_A = $00000041;
  TICKET_FACTURA_B = $00000042;
  FACTURA_A = $00000030;
  FACTURA_B = $00000031;
  TICKET_NOTA_DEBITO_A = $00000032;
  TICKET_NOTA_DEBITO_B = $00000033;
  NOTA_DEBITO_A = $00000044;
  NOTA_DEBITO_B = $00000045;
  RECIBO_A = $00000061;
  RECIBO_B = $00000062;
  TICKET_C = $00000054;

  TICKET_NOTA_CREDITO_A = $00000034;
  TICKET_NOTA_CREDITO_B = $00000035;
  NOTA_CREDITO_A = $00000052;
  NOTA_CREDITO_B = $00000053;
  REMITO = $00000072;

  CONNECTION_STRING1='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
  CONNECTION_STRING3=';Extended Properties=Excel 8.0';

  VERSIONEXE='54';

  CLAVE_ENCRIPTADO='1234567890';

  VENCIMIENTO_LICENCIA='2013-08-15';

  CONDICIONVENTA_CONTADO='0';
  CONDICIONVENTA_CTACTE='1';

//Tipos Documentos
  TIPODOCU_FACTURAVENTA='Factura de Venta';
  TIPODOCU_RECIBOVENTA='Recibo de Venta';
  TIPODOCU_NOTACREDITOVENTA='Nota de Credito de Venta';
  TIPODOCU_NOTADEBITOVENTA='Nota de Debito de Venta';
  TIPODOCU_REMITOVENTA='Remito de Venta';
  TIPODOCU_NOTAPEDIDO='Nota de Pedido';
  TIPODOCU_NOTAPEDIDOCOMISIONES='Nota de Pedidos - Comisiones';

  TIPODOCU_FACTURACOMPRA='Factura de Compra';
  TIPODOCU_NOTACREDITOCOMPRA='Nota de Credito de Compra';
  TIPODOCU_NOTADEBITOCOMPRA='Nota de Debito de Compra';
  TIPODOCU_ORDENDEPAGO='Orden de Pago';

  ABM_AGREGAR=1;
  ABM_MODIFICAR=2;
  ABM_ELIMINAR=3;
  ABM_IMPRIMIR=4;
  ABM_ANULAR=5;
  ABM_VER=6;
  ABM_CLONAR=7;

//  CONNECTION_STRING1='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=';
//  CONNECTION_STRING3=';Mode=Share Deny None;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=35;'+
//                     'Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'+
//                     'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''''t Copy Locale on Compact=False;'+
//                     'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;';


  TablaMul:Array[1..10] of Integer=(5,4,3,2,7,6,5,4,3,2); {Tabla Arbitraria}


implementation

uses Unitestadodectas, Unitinformesventas, UnitCargarPagos,
  UnitDocumentosVentasPendientes, Unitdetallectas,
  UnitImpresoraFiscal, UnitConfiguracion, UnitImpresoraFiscalcola,
  Unitlistanotacreditoventa, UnitActualizarProductos, Unitlistaproveedores,
  UnitProductos, UnitServicios, Unitfacturaventarapida,
  Unitcalculoprecio, UnitProveedores, UnitClientes, UnitEstadoCaja,
  UnitCajaAsiento, UnitCajaAsientoIngreso,
  UnitcajaAsientoEgreso, UnitDocumentoVentaExcel, UnitMostrarExcel, UnitABMbase,
  UnitNotaPedido, UnitListaNotasPedido, UnitConsultaEquipos, Unitfacturasventa,
  Unitrecibosventa, Unitnotacreditoventa, UnitListaSucursales,
  UnitListaPuntosdeVenta, UnitListaTiposDocumentos, UnitTipoDocumento,
  UnitPersonal, UnitPerfil, UnitListaPerfiles, Unitsaldoclientes,
  Unitfacturascompra, UnitListaServices,
  UnitOrdenServicio, UnitListaOrdenesServicios, UnitImprimirListaPrecios,
  UnitPresupuesto, UnitListaPresupuestos, UnitDetallePagos, UnitLibroIvaVentas,
  UnitCajaBar, UnitLibroIvaCompras, UnitLogin, UnitComisionesVendedores,
  UnitComisionesSucursales, Unitvendedoresdebcred, Unitsucursalesdebcred,
  UnitNotaDebitoVenta, UnitListaNotaDebitoVenta, UnitRemitoVenta,
  UnitListaRemitoVenta, Unitlistacomisionesvendedores,
  UnitlistaComisionesSucursales, Unitprovincias, UnitNotadeCredito2,
  UnitListaDebCred, UnitNotadeDebito2, UnitEmpresa,
  UnitAplicarRecibosPendientes, UnitListaNotasPedidoComisiones,
  UnitListaClientes1, UnitListaProductos1, UnitListaCalculosPrecios1,
  UnitListaPoliticasdePrecios, UnitListaProveedores1, Unitlistalocalidades,
  UnitListaProvincias, UnitListaFacturasDeVenta, UnitListaRecibosdeVenta,
  UnitListaFacturasdeCompras, UnitNotaPedidoComisiones,
  UnitListaNotasCreditodeVentas, UnitListaTarjetasdeCredito, UnitTarjetaCredito,
  UnitCargaDetallePagos, UnitListaConfigListas, UnitListaOrdenesdePago,
  UnitDocumentosComprasPendientes, UnitOrdendePago, Unitsaldoproveedores,
  Unitestadodectasproveedores, UnitNotaCreditoCompra,
  UnitListaNotasDeCreditodeCompras, UnitNotaDebitoCompra,
  Unitdetallectasproveedores, UnitListaNotasDeDebitodeCompras,
  UnitMovimientosdeStock, UnitListaAjustesdeStock,
  UnitSaldosComisionesBorradores, UnitListaLiquidacionesBorradores,
  UnitImprimirEtiquetas, UnitConsultaStock, UnitEstadoComisionesBorradores,
  UnitDetalleComisionesBorradores, UnitListaCuponesTarjetasCredito;

{$R *.dfm}



procedure TPrinc.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit, hButton: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    {
      // Change button text:
      hButton := FindWindowEx(hInputForm, 0, 'TButton', nil);
      SendMessage(hButton, WM_SETTEXT, 0, Integer(PChar('Cancel')));
    }
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;


function TPrinc.ProtegidoxPass(nombre: string):boolean;
var
  error:integer;
  passingresada:string;
  passusuarioprotector:string;
begin
    error:=0;

    if Princ.GetConfiguracion('USUARIOPROTECTOR')<>'0' then
      begin
            if Princ.buscar('select protegido_id from protegidospass where protegido_nombre="'+nombre+'"','protegido_id')<>'' then
            begin
                PostMessage(Handle, InputBoxMessage, 0, 0);
                passingresada := InputBox('Protegido', 'Ingrese contraseña', '');
                passusuarioprotector:=Princ.buscar('select personal_pass from personal where personal_id="'+Princ.GetConfiguracion('USUARIOPROTECTOR')+'"','personal_pass');
                Princ.Encriptador1.ADesencriptar:=passusuarioprotector;
                Princ.Encriptador1.MetodoEncriptado:=2;
                Princ.Encriptador1.Desencriptar;
                if passingresada<>Princ.Encriptador1.Desencriptado then
                  error:=1;
            end;
      end;

    Result:=error=0;
end;

function TPrinc.ControlDocumentoComprarepetido(tipodocu_id:string; documentocompra_puntoventa:string; documentocompra_numero:string; proveedor_id:string):boolean;
var
  documentocompra_id:string;
begin
    documentocompra_id:=buscar('select documentocompra_id from documentoscompras where '+
                               'tipodocu_id="'+tipodocu_id+'" '+
                               'and documentocompra_puntoventa="'+documentocompra_puntoventa+'" '+
                               'and documentocompra_numero="'+documentocompra_numero+'" '+
                               'and proveedor_id="'+proveedor_id+'" ','documentocompra_id');

    Result:=documentocompra_id<>'';


end;

procedure TPrinc.ConfigurarColumnas(grilla: TDBGrid);
var
  padre:TWinControl;
  i:integer;
begin
    padre:=grilla.Parent;
    while not (padre is TForm) do
    begin
        padre:=padre.Parent;
    end;

    ZQConfigcolumnas.Active:=false;
    ZQConfigcolumnas.ParamByName('configcolumna_grilla').AsString:=padre.ClassName+'.'+grilla.Name;
    ZQConfigcolumnas.Active:=true;
    ZQConfigcolumnas.First;

    for i := 0 to grilla.Columns.Count-1 do
      begin
          if ZQConfigcolumnas.Locate('configcolumnadeta_campo',grilla.Columns.Items[i].FieldName,[]) then
            begin
                grilla.Columns.Items[i].Visible:=ZQConfigcolumnas.FieldByName('configcolumnadeta_visible').AsInteger=-1;

            end;

      end;

    if ZQConfigcolumnas.FieldByName('configcolumna_anchoventana').AsInteger<>0 then
      padre.Width:=ZQConfigcolumnas.FieldByName('configcolumna_anchoventana').AsInteger;

end;


procedure TPrinc.CalcularRecargoTarjeta(tarjeta_id: string; cuotas: Integer; importe: Real);
begin
    ZQRecargoTarjetas.Active:=false;
    ZQRecargoTarjetas.ParamByName('tarjeta_id').AsString:=tarjeta_id;
    ZQRecargoTarjetas.ParamByName('cuotas').AsInteger:=cuotas;
    ZQRecargoTarjetas.ParamByName('importe').AsFloat:=importe;
    ZQRecargoTarjetas.Active:=true;



end;


procedure TPrinc.AbrirModificarTarjeta(id:string);
begin
    if id<>'' then
      begin
          try
            TarjetaCredito:=TTarjetaCredito.Create(self);
          finally
            TarjetaCredito.abm:=2;
            TarjetaCredito.id:=id;
            TarjetaCredito.btnguardar.Caption:='Modificar';
            TarjetaCredito.Show;
          end;

      end;

end;

procedure TPrinc.AbrirNuevoTarjeta;
begin
    try
      TarjetaCredito:=TTarjetaCredito.Create(self);
    finally
      TarjetaCredito.abm:=1;
      TarjetaCredito.btnguardar.Caption:='Guardar';
      TarjetaCredito.Show;
    end;


end;

procedure Tprinc.CerrarCaja(caja_id:string;caja_saldofinal:real);
begin
    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('begin');
    ZQExcecSQL.ExecSQL;

    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('update cajas set ');
    ZQExcecSQL.Sql.Add('caja_saldofinal=:caja_saldofinal, ');
    ZQExcecSQL.Sql.Add('caja_estado=:caja_estado ');
    ZQExcecSQL.Sql.Add('where caja_id=:caja_id ');
    ZQExcecSQL.ParamByName('caja_saldofinal').AsFloat:=caja_saldofinal;
    ZQExcecSQL.ParamByName('caja_estado').AsString:='CERRADA';
    ZQExcecSQL.ParamByName('caja_id').AsString:=caja_id;
    ZQExcecSQL.ExecSql;

    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('commit');
    ZQExcecSQL.ExecSQL;
end;


Function TPrinc.GetConfiguracionMenu(menu_nomb: string; campo: string):string;
begin
    result:=Princ.buscar('select * from menu where menu_path="'+menu_nomb+'"',campo);
end;


Function TPrinc.AbrirCaja(personal_id: string):string;
var
  caja_id,caja_idanterior:string;
  caja_saldoinicial:string;
  caja_saldofinal:string;
begin
    caja_id:=Princ.codigo('cajas','caja_id');

    caja_idanterior:=inttostr(strtoint(caja_id)-1);

    caja_saldofinal:=Princ.buscar('select caja_saldofinal from cajas where caja_id="'+caja_idanterior+'"','caja_saldofinal');

    caja_saldoinicial:= caja_saldofinal;
    if caja_saldoinicial='' then
      caja_saldoinicial:='0';

    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('begin');
    ZQExcecSQL.ExecSQL;


    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('insert into cajas set ');
    ZQExcecSQL.Sql.Add('personal_id=:personal_id, ');
    ZQExcecSQL.Sql.Add('caja_saldofinal=:caja_saldofinal, ');
    ZQExcecSQL.Sql.Add('caja_saldoinicial=:caja_saldoinicial, ');
    ZQExcecSQL.Sql.Add('caja_estado=:caja_estado, ');
    ZQExcecSQL.Sql.Add('caja_hora=:caja_hora, ');
    ZQExcecSQL.Sql.Add('caja_fecha=:caja_fecha, ');
    ZQExcecSQL.Sql.Add('caja_id=:caja_id ');
    ZQExcecSQL.ParamByName('personal_id').AsString:=personal_id;
    ZQExcecSQL.ParamByName('caja_saldofinal').AsString:='0';
    ZQExcecSQL.ParamByName('caja_saldoinicial').AsString:=caja_saldoinicial;
    ZQExcecSQL.ParamByName('caja_estado').AsString:='ABIERTA';
    ZQExcecSQL.ParamByName('caja_hora').AsDateTime:=Princ.horaservidor;
    ZQExcecSQL.ParamByName('caja_fecha').AsDate:=Princ.fechaservidor;
    ZQExcecSQL.ParamByName('caja_id').AsString:=caja_id;
    ZQExcecSQL.ExecSql;

    if caja_saldoinicial<>'0' then
      begin
          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('insert into cajaasientos set ');
          ZQExcecSQL.Sql.Add('caja_id=:caja_id, ');
          ZQExcecSQL.Sql.Add('concepto_id=:concepto_id, ');
          ZQExcecSQL.Sql.Add('cajaasiento_importe=:cajaasiento_importe, ');
          ZQExcecSQL.Sql.Add('cajaasiento_fecha=:cajaasiento_fecha, ');
          ZQExcecSQL.Sql.Add('cajaasiento_tipo=:cajaasiento_tipo, ');
          ZQExcecSQL.Sql.Add('cajaasiento_descripcion=:cajaasiento_descripcion, ');
          ZQExcecSQL.Sql.Add('cajaasiento_id=:cajaasiento_id ');
          ZQExcecSQL.ParamByName('caja_id').AsString:=caja_id;
          ZQExcecSQL.ParamByName('concepto_id').AsString:=CAJASALDOINICIALCONCEPTOID;
          ZQExcecSQL.ParamByName('cajaasiento_importe').AsString:=caja_saldofinal;
          ZQExcecSQL.ParamByName('cajaasiento_fecha').AsDate:=Princ.fechaservidor;
          ZQExcecSQL.ParamByName('cajaasiento_tipo').AsString:='INGRESO';
          ZQExcecSQL.ParamByName('cajaasiento_descripcion').AsString:='Saldo Inicial';
          ZQExcecSQL.ParamByName('cajaasiento_id').AsString:=Princ.codigo('cajaasientos','cajaasiento_id');
          ZQExcecSQL.ExecSql;



      end;

    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('update documentosventas set ');
    ZQExcecSQL.Sql.Add('caja_id=:caja_id ');
    ZQExcecSQL.Sql.Add('where documentoventa_estado=:documentoventa_estado ');
    ZQExcecSQL.ParamByName('caja_id').AsString:=caja_id;
    ZQExcecSQL.ParamByName('documentoventa_estado').AsString:='ABIERTA';
    ZQExcecSQL.ExecSql;

    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('commit');
    ZQExcecSQL.ExecSQL;


    Result:=caja_id;

end;


procedure TPrinc.ImprimirDocumentoVenta(id: string);
var
  tipodocu_archivoimpresion:string;
  tipodocu_fiscal:boolean;
  tipodocu_preimpresos:boolean;
begin
    tipodocu_fiscal:=strtobool(Princ.GetConfigTipoDocumento(id,'','tipodocu_fiscal'));

    if tipodocu_fiscal then
      begin
          Princ.ImprimirFiscal(id);
      end;



    tipodocu_preimpresos:=strtobool(Princ.GetConfigTipoDocumento(id,'','tipodocu_preimpresos'));

    if tipodocu_preimpresos then
      begin
          tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

          Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
          Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                                   'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                                   'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                                   'inner join paises on provincias.pais_id=paises.pais_id '+
                                                   'inner join condicioniva on clientes.condicioniva_id=condicioniva.condicioniva_id '+
                                                   'where documentosventas.documentoventa_id="'+id+'"';

          Princ.VCLReport1.Execute;
      end;

end;


procedure TPrinc.AbrirNuevoPerfil;
begin
    try
      Perfil:=TPerfil.Create(self);
    finally
      Perfil.abm:=1;
      Perfil.btnguardar.Caption:='Guardar';
      Perfil.Show;
    end;

end;


procedure TPrinc.AbrirModificarPerfil(id:string);
begin
    if id<>'' then
      begin
          try
            Perfil:=TPerfil.Create(self);
          finally
            Perfil.abm:=2;
            Perfil.id:=id;
            Perfil.btnguardar.Caption:='Modificar';
            Perfil.Show;
          end;
      end;
end;


procedure TPrinc.AbrirNuevoTipoDocumento;
begin
    try
      tipodocumento:=Ttipodocumento.Create(self);
    finally
      tipodocumento.abm:=1;
      tipodocumento.btnguardar.Caption:='Guardar';
      tipodocumento.Show;
    end;

end;



procedure TPrinc.AbrirModificarTipoDocumento(id:string);
begin
    if id<>'' then
      begin
          try
            tipodocumento:=Ttipodocumento.Create(self);
          finally
            tipodocumento.abm:=2;
            tipodocumento.id:=id;
            tipodocumento.btnguardar.Caption:='Modificar';
            tipodocumento.Show;
          end;

      end;



end;


procedure TPrinc.RefrescarMenu;
begin
    AdvToolBarDocVentas.AutoPositionControls:=false;
    AdvToolBarCtasCtesVentas.AutoPositionControls:=false;
    AdvToolBarCaja.AutoPositionControls:=false;
    AdvToolBarGeneral.AutoPositionControls:=false;
    AdvToolBarProveedores.AutoPositionControls:=false;
    AdvToolBarLocalidades.AutoPositionControls:=false;
    AdvToolBarEmpresa.AutoPositionControls:=false;
    AdvToolBarDocCompras.AutoPositionControls:=false;
    AdvToolBarHerramientas.AutoPositionControls:=false;


    AdvToolBarDocVentas.AutoSize:=false;
    AdvToolBarCtasCtesVentas.AutoSize:=false;
    AdvToolBarCaja.AutoSize:=false;
    AdvToolBarGeneral.AutoSize:=false;
    AdvToolBarProveedores.AutoSize:=false;
    AdvToolBarLocalidades.AutoSize:=false;
    AdvToolBarEmpresa.AutoSize:=false;
    AdvToolBarDocCompras.AutoSize:=false;
    AdvToolBarHerramientas.AutoSize:=false;


    AdvToolBarDocVentas.AutoPositionControls:=true;
    AdvToolBarCtasCtesVentas.AutoPositionControls:=true;
    AdvToolBarCaja.AutoPositionControls:=true;
    AdvToolBarGeneral.AutoPositionControls:=true;
    AdvToolBarProveedores.AutoPositionControls:=true;
    AdvToolBarLocalidades.AutoPositionControls:=true;
    AdvToolBarEmpresa.AutoPositionControls:=true;
    AdvToolBarDocCompras.AutoPositionControls:=true;
    AdvToolBarHerramientas.AutoPositionControls:=true;

    AdvToolBarDocVentas.AutoSize:=true;
    AdvToolBarCtasCtesVentas.AutoSize:=true;
    AdvToolBarCaja.AutoSize:=true;
    AdvToolBarGeneral.AutoSize:=true;
    AdvToolBarProveedores.AutoSize:=true;
    AdvToolBarLocalidades.AutoSize:=true;
    AdvToolBarEmpresa.AutoSize:=true;
    AdvToolBarDocCompras.AutoSize:=true;
    AdvToolBarHerramientas.AutoSize:=true;



end;

procedure TPrinc.AbrirDocumentoVenta(id: string; tipodocu_nombre: string; abm: Integer);
begin
    if tipodocu_nombre='Factura de Venta' then
      begin
          try
            facturasventa:=Tfacturasventa.Create(self);
          finally
            facturasventa.abm:=abm;
            facturasventa.id:=id;
            facturasventa.Show;
          end;
      end;

    if tipodocu_nombre='Recibo de Venta' then
      begin
          try
            recibosventa:=Trecibosventa.Create(self);
          finally
            recibosventa.abm:=abm;
            recibosventa.id:=id;
            recibosventa.Show;
          end;
      end;

    if tipodocu_nombre='Nota de Credito de Venta' then
      begin
          if not strtobool(VENTASNCNDCONCEPTOS) then
            begin
                try
                  notacreditoventa:=Tnotacreditoventa.Create(self);
                finally
                  notacreditoventa.abm:=abm;
                  notacreditoventa.id:=id;
                  notacreditoventa.tipodocu_nombre:=tipodocu_nombre;
                  notacreditoventa.Show;
                end;

            end
          else
            begin
                try
                  NotadeCredito2:=TNotadeCredito2.Create(self);
                finally
                  NotadeCredito2.abm:=abm;
                  NotadeCredito2.id:=id;
                  NotadeCredito2.tipodocu_nombre:=tipodocu_nombre;
                  NotadeCredito2.Show;
                end;

            end;

      end;

    if tipodocu_nombre='Nota de Debito de Venta' then
      begin
          if not strtobool(VENTASNCNDCONCEPTOS) then
            begin
                try
                  notadebitoventa:=Tnotadebitoventa.Create(self);
                finally
                  notadebitoventa.abm:=abm;
                  notadebitoventa.id:=id;
                  notadebitoventa.tipodocu_nombre:=tipodocu_nombre;
                  notadebitoventa.Show;
                end;

            end
          else
            begin
                try
                  NotadeDebito2:=TNotadeDebito2.Create(self);
                finally
                  NotadeDebito2.abm:=abm;
                  NotadeDebito2.id:=id;
                  NotadeDebito2.tipodocu_nombre:=tipodocu_nombre;
                  NotadeDebito2.Show;
                end;

            end;

      end;

    if tipodocu_nombre='Remito de Venta' then
      begin
          try
            remitoventa:=Tremitoventa.Create(self);
          finally
            remitoventa.abm:=abm;
            remitoventa.id:=id;
            remitoventa.tipodocu_nombre:=tipodocu_nombre;
            remitoventa.Show;
          end;

      end;

    if tipodocu_nombre='Nota de Pedido' then
      begin
          try
            NotaPedido:=TNotaPedido.Create(self);
          finally
            NotaPedido.abm:=abm;
            NotaPedido.id:=id;
            NotaPedido.tipodocu_nombre:=tipodocu_nombre;
            NotaPedido.Show;
          end;
      end;

    if tipodocu_nombre='Orden de Servicio' then
      begin
          try
            ordenservicio:=Tordenservicio.Create(self);
          finally
            ordenservicio.abm:=abm;
            ordenservicio.id:=id;
            ordenservicio.tipodocu_nombre:=tipodocu_nombre;
            ordenservicio.Show;
          end;
      end;

    if tipodocu_nombre='Presupuesto' then
      begin
          try
            Presupuesto:=TPresupuesto.Create(self);
          finally
//            Presupuesto.limpiar_al_guardar:=false;
            Presupuesto.abm:=abm;
            Presupuesto.id:=id;
            Presupuesto.tipodocu_nombre:=tipodocu_nombre;
            Presupuesto.Show;
          end;
      end;

    if tipodocu_nombre='Nota de Pedidos - Comisiones' then
      begin
          try
            NotaPedidoComisiones:=TNotaPedidoComisiones.Create(self);
          finally
//            Presupuesto.limpiar_al_guardar:=false;
            NotaPedidoComisiones.abm:=abm;
            NotaPedidoComisiones.id:=id;
            NotaPedidoComisiones.tipodocu_nombre:=tipodocu_nombre;
            NotaPedidoComisiones.Show;
          end;
      end;




end;

procedure TPrinc.AbrirDocumentoCompra(id: string; tipodocu_nombre: string; abm: Integer);
begin
    if tipodocu_nombre=TIPODOCU_FACTURACOMPRA then
      begin
          try
            facturacompra:=Tfacturacompra.Create(self);
          finally
            facturacompra.abm:=abm;
            facturacompra.id:=id;
            facturacompra.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_ORDENDEPAGO then
      begin
          try
            OrdendePago:=TOrdendePago.Create(self);
          finally
            OrdendePago.abm:=abm;
            OrdendePago.id:=id;
            OrdendePago.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_NOTACREDITOCOMPRA then
      begin
          try
            NotadeCreditoCompra:=TNotadeCreditoCompra.Create(self);
          finally
            NotadeCreditoCompra.abm:=abm;
            NotadeCreditoCompra.id:=id;
            NotadeCreditoCompra.tipodocu_nombre:=tipodocu_nombre;
            NotadeCreditoCompra.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_NOTADEBITOCOMPRA then
      begin
          try
            NotadeDebitoCompra:=TNotadeDebitoCompra.Create(self);
          finally
            NotadeDebitoCompra.abm:=abm;
            NotadeDebitoCompra.id:=id;
            NotadeDebitoCompra.tipodocu_nombre:=tipodocu_nombre;
            NotadeDebitoCompra.Show;
          end;
      end;

end;



procedure TPrinc.MenuConfiguracion;
var
  i:integer;
begin
    ZQMenu.Active:=false;
    if perfil_id_logueado<>'0' then
      begin
          ZQMenu.SQL.Text:='select *, (menu_enabled and menuperfil_habilitado) as enabled, (menu_visible and menuperfil_habilitado) as visible from menu inner join menuperfil on menu.menu_id=menuperfil.menu_id where menuperfil.perfil_id="'+perfil_id_logueado+'"';
      end
    else
      begin
          ZQMenu.SQL.Text:='select *, menu_enabled as enabled, menu_visible as visible from menu';

      end;


//    ZQMenu.ParamByName('perfil_id').AsString:=perfil_id_logueado;
    ZQMenu.Active:=true;
    for i := 0 to princ.ComponentCount-1 do
      begin
          if ZQMenu.Locate('menu_nomb',princ.Components[i].Name,[]) then
            begin
                if (princ.Components[i] is TAdvPage) then
                  begin
                      (princ.Components[i] as TAdvPage).TabVisible:=strtobool(ZQMenu.FieldByName('visible').AsString);
                  end;

                if (princ.Components[i] is TAdvToolBar) then
                  begin
//                      (princ.Components[i] as TAdvToolBar).Enabled:=strtobool(ZQMenu.FieldByName('menu_enabled').AsString) and strtobool(ZQMenu.FieldByName('menuperfil_habilitado').AsString);
                      (princ.Components[i] as TAdvToolBar).Enabled:=strtobool(ZQMenu.FieldByName('enabled').AsString);
                      (princ.Components[i] as TAdvToolBar).Visible:=strtobool(ZQMenu.FieldByName('visible').AsString);
                  end;

                if (princ.Components[i] is TAdvGlowButton) then
                  begin
                      (princ.Components[i] as TAdvGlowButton).ShowHint:=true;
                      (princ.Components[i] as TAdvGlowButton).Hint:=(princ.Components[i] as TAdvGlowButton).Caption;
//                      (princ.Components[i] as TAdvGlowButton).Enabled:=strtobool(ZQMenu.FieldByName('menu_enabled').AsString) and strtobool(ZQMenu.FieldByName('menuperfil_habilitado').AsString);
                      (princ.Components[i] as TAdvGlowButton).Enabled:=strtobool(ZQMenu.FieldByName('enabled').AsString);
                      (princ.Components[i] as TAdvGlowButton).Visible:=strtobool(ZQMenu.FieldByName('visible').AsString);
                      (princ.Components[i] as TAdvGlowButton).ShowHint:=true;
                      (princ.Components[i] as TAdvGlowButton).Hint:=(princ.Components[i] as TAdvGlowButton).Caption;

                  end;
            end;
      end;

    if not MenuPrincipal.ActivePage.TabVisible then
      MenuPrincipal.ActivePageIndex:=MenuPrincipal.ActivePageIndex+1;


    Princ.RefrescarMenu;
end;

procedure TPrinc.MenuPrincipalChange(Sender: TObject);
begin
    Princ.RefrescarMenu;
end;

procedure TPrinc.GetBoolConfig(config_nombre: string; valor_true: string; var propiedad: Boolean);
var
  config_valor:string;
begin
    config_valor:=GetConfiguracion(config_nombre);
    propiedad:=config_valor=valor_true;


end;



procedure TPrinc.MostrarVentanaExcel;
begin
    try
      MostrarExcel:=TMostrarExcel.Create(self);
    finally
      MostrarExcel.Show;
    end;



end;


function TPrinc.GetConfigTipoDocumento(documento_id: string; tipodocu_id:string; campo: string):string;
begin
    if tipodocu_id='' then
      Result := Princ.buscar('select '+campo+' from tiposdocumento inner join documentosventas on tiposdocumento.tipodocu_id=documentosventas.tipodocu_id where documentosventas.documentoventa_id="'+documento_id+'"',campo)
    else
      Result := Princ.buscar('select '+campo+' from tiposdocumento where tipodocu_id="'+tipodocu_id+'"',campo);
end;


function TPrinc.BorrarDocumentoVenta(documentoventa_id: string):boolean;
var
  error:integer;
  tipodocu_id:string;
begin
    error:=0;
    ZQExcecSQL.SQL.Text:='begin';
    ZQExcecSQL.ExecSQL;

    ZQpagotarjeta.Active:=false;
    ZQpagotarjeta.ParamByName('documentoventa_id').AsString:=documentoventa_id;
    ZQpagotarjeta.Active:=true;
    ZQpagotarjeta.First;
    while not ZQpagotarjeta.Eof do
        begin
            ZQExcecSQL.SQL.Text:='delete from pagotarjeta where pagotarjeta_id="'+ZQpagotarjeta.FieldByName('pagotarjeta_id').AsString+'"';
            try
              ZQExcecSQL.ExecSQL;
            except
              error:=1;
            end;


            ZQpagotarjeta.Next;
        end;


    ZQExcecSQL.SQL.Text:='delete from documentopagos where documentoventa_id="'+documentoventa_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=1;
    end;

    ZQdocumentoventadetalles.Active:=false;
    ZQdocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+documentoventa_id+'"';
    ZQdocumentoventadetalles.Active:=true;
    ZQdocumentoventadetalles.First;
    tipodocu_id:=Self.buscar('select tipodocu_id from documentosventas where documentoventa_id="'+documentoventa_id+'"', 'tipodocu_id');
    while not ZQdocumentoventadetalles.Eof do
        begin
            Self.actualizarstock(ZQdocumentoventadetalles.FieldByName('producto_id').AsString, ZQdocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id,true);


            ZQExcecSQL.Sql.Clear;
            ZQExcecSQL.Sql.Add('delete from docuvendetcomisionesvendedores ');
            ZQExcecSQL.Sql.Add('where documentoventadetalle_id=:documentoventadetalle_id ');
            ZQExcecSQL.ParamByName('documentoventadetalle_id').AsString:=ZQdocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
            ZQExcecSQL.ExecSql;

            ZQdocumentoventadetalles.Next;
        end;

    ZQdocumentoventadetalles.Active:=false;
    ZQExcecSQL.SQL.Text:='delete from documentoventadetalles where documentoventa_id="'+documentoventa_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=1;
    end;

    ZQDocumentoventadocus.Active:=false;
    ZQDocumentoventadocus.SQL.Text:='select * from documentoventadocus where documentoventa_id="'+documentoventa_id+'"';
    ZQDocumentoventadocus.Active:=true;
    ZQDocumentoventadocus.First;
    while not ZQDocumentoventadocus.Eof do
        begin
            ActualizarSaldoDocumentoVenta(ZQDocumentoventadocus.FieldByName('documentoventa_idpago').AsString,abs(ZQDocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat), true);
            ZQDocumentoventadocus.Next;
        end;
    ZQDocumentoventadocus.Active:=false;

    ZQExcecSQL.SQL.Text:='delete from documentoventadocus where documentoventa_id="'+documentoventa_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=2;
    end;

    ZQExcecSQL.SQL.Text:='delete from documentosventas where documentoventa_id="'+documentoventa_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=3;
    end;

    ZQExcecSQL.SQL.Text:='commit';
    ZQExcecSQL.ExecSQL;

    Result := error=0;

end;



procedure TPrinc.BtnAjustesdeStockClick(Sender: TObject);
begin
    try
      ListaAjustedeStock:=TListaAjustedeStock.Create(self);
    finally
      ListaAjustedeStock.campo_id:='ajustestock_id';
      ListaAjustedeStock.Show;
    end;
end;

function TPrinc.BorrarDocumentoCompra(documentocompra_id: string):boolean;
var
  error:integer;
  tipodocu_id:string;
begin
    error:=0;
    ZQExcecSQL.SQL.Text:='begin';
    ZQExcecSQL.ExecSQL;

    ZQExcecSQL.SQL.Text:='delete from documentocomprapagos where documentocompra_id="'+documentocompra_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=1;
    end;

    ZQdocumentocompradetalles.Active:=false;
    ZQdocumentocompradetalles.SQL.Text:='select * from documentocompradetalles where documentocompra_id="'+documentocompra_id+'"';
    ZQdocumentocompradetalles.Active:=true;
    ZQdocumentocompradetalles.First;
    tipodocu_id:=Self.buscar('select tipodocu_id from documentoscompras where documentocompra_id="'+documentocompra_id+'"', 'tipodocu_id');
    while not ZQdocumentocompradetalles.Eof do
        begin
            Self.actualizarstock(ZQdocumentocompradetalles.FieldByName('producto_id').AsString, ZQdocumentocompradetalles.FieldByName('documentocompradetalle_cantidad').AsFloat, tipodocu_id,true);

            ZQdocumentocompradetalles.Next;
        end;

    ZQdocumentocompradetalles.Active:=false;
    ZQExcecSQL.SQL.Text:='delete from documentocompradetalles where documentocompra_id="'+documentocompra_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=1;
    end;

    ZQDocumentocompradocus.Active:=false;
    ZQDocumentocompradocus.SQL.Text:='select * from documentocompradocus where documentocompra_id="'+documentocompra_id+'"';
    ZQDocumentocompradocus.Active:=true;
    ZQDocumentocompradocus.First;
    while not ZQDocumentocompradocus.Eof do
        begin
            ActualizarSaldoDocumentoCompra(ZQDocumentocompradocus.FieldByName('documentocompra_idpago').AsString,abs(ZQDocumentocompradocus.FieldByName('documentocompradoc_importe').AsFloat), true);
            ZQDocumentocompradocus.Next;
        end;
    ZQDocumentocompradocus.Active:=false;

    ZQExcecSQL.SQL.Text:='delete from documentocompradocus where documentocompra_id="'+documentocompra_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=2;
    end;

    ZQExcecSQL.SQL.Text:='delete from documentoscompras where documentocompra_id="'+documentocompra_id+'"';
    try
      ZQExcecSQL.ExecSQL;
    except
      error:=3;
    end;

    ZQExcecSQL.SQL.Text:='commit';
    ZQExcecSQL.ExecSQL;

    Result := error=0;

end;



function TPrinc.EjecutarScriptDB(archivo_sql: string):boolean;
var
  error:integer;
  i:integer;
  continuar:boolean;
  versiondb:string;

begin
    error:=0;
    ZSQLProcessor1.Script.LoadFromFile(archivo_sql);
    ZSQLProcessor1.Parse;

    continuar:=true;
    i:=0;
// desactivar las foreign key
//    ZQExcecSQL.Active:=false;
//    ZQExcecSQL.SQL.Text:=ZSQLProcessor1.Statements[i+1];
//    ZQExcecSQL.ExecSQL;

    versiondb:=Princ.GetConfiguracion('VERSIONDB');
    if versiondb='' then
      versiondb:='0';

    while continuar do
        begin
            if strtoint(versiondb)<strtoint(ZSQLProcessor1.Statements[i]) then
              begin
                  ZQExcecSQL.Active:=false;
                  ZQExcecSQL.SQL.Text:=ZSQLProcessor1.Statements[i+1];
                  try
                    ZQExcecSQL.ExecSQL;

                    ZQExcecSQL.SQL.Clear;
                    ZQExcecSQL.SQL.Add('Replace config set config_nombre="VERSIONDB", config_valor="'+ZSQLProcessor1.Statements[i]+'"');
                    ZQExcecSQL.ExecSQL;

                    versiondb:=ZSQLProcessor1.Statements[i];

                  except
                    continuar:=false;
                    error:=1;
                    MessageDlg('Error al ejecutar la actualizacion nro. '+ZSQLProcessor1.Statements[i], mtError, [mbOK], 0);
                  end;

              end;
            if i+1<ZSQLProcessor1.StatementCount-1 then
              i:=i+2
            else
              continuar:=false;
        end;


    ZQProcedimientosAlmacenados.SQL.Text:='CREATE PROCEDURE `actualizarsaldocompra` (id int, pago float) '+
                                          'BEGIN '+
                                          '    update documentoscompras set documentocompra_saldo=documentocompra_saldo-(pago),  '+
                                          '    documentocompra_pagado=documentocompra_pagado+(pago), '+
                                          '    documentocompra_estado=if(documentocompra_saldo=0,"PAGADA","PENDIENTE") '+
                                          '    where documentocompra_id=id; '+
                                          'END; ';

    try
      ZQProcedimientosAlmacenados.ExecSQL;
    except
    end;

    if error=0 then
      result:=true
    else
      result:=false;
end;

function TPrinc.DescargarArchivo( sURL, sArchivoLocal: String ): boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  LongitudBuffer: DWORD;
  F: File;
  sMiPrograma: String;
begin
  sMiPrograma := ExtractFileName( Application.ExeName );
  hSession := InternetOpen( PChar( sMiPrograma ), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0 );

  try
    hURL := InternetOpenURL( hSession, PChar( sURL ), nil, 0, 0, 0 );

    try
      AssignFile( F, sArchivoLocal );
      Rewrite( F, 1 );

      repeat
        InternetReadFile( hURL, @Buffer, SizeOf( Buffer ), LongitudBuffer );
        BlockWrite( F, Buffer, LongitudBuffer );
      until LongitudBuffer = 0;

      CloseFile( F );
      Result := True;
    except
      Result := False;
    end;
    InternetCloseHandle( hURL );
  except
    Result := False;
  end;
  InternetCloseHandle( hSession );
end;



function TPrinc.EsCUITValido(Num:String):boolean;
type 
  ArrayDe11=Array[1..11] of Integer;
var 
 R:ArrayDe11;     {Resultados de Multiplicar por la Tabla Arbitraria}
 CUIT:ArrayDe11;  {Para convertir cada digito}
 I:Integer;       {Indice}
 Sumatoria,       {Sumatoria de los Digitos menos el último}
 Dividendo,       {Resultado de la División}
 Producto,
 Diferencia,
 DigitoVerif:Integer; {Digito Verificador Calculado}
begin 
result:=false;          { Asumir Invalido }
if Length(Num) = 11 then 
  begin 
    try
      { Convertir cada caracter a Número}
      for i:=1 to 11 do CUIT[i]:=StrToInt(Num[i]); 
    except
      { Si hay error de conversión es CUIT invalido}
      Exit;
    end; { try }
end else Exit; { if }  { Si no tiene 11 caracteres es CUIT invalido }
 
for i:=1 to 10 do             // Multiplicar cada digito por la
  R[i]:=CUIT[i]*TablaMul[i];   // Tabla Arbitraria menos el último
 
Sumatoria:=0;
for i:=1 to 10 do 
  Sumatoria:=Sumatoria+R[i];   // Calcular la sumatoria de los resultados
 
Dividendo:=Sumatoria div 11;     //  Dividir por 11  (división entera)
Producto:=Dividendo * 11;          // El resultado multiplica por 11
Diferencia:=Sumatoria - Producto;  // Obtener la diferencia
if Diferencia > 0 then             // Si la dif. es mayor a cero
     DigitoVerif:=11 - Diferencia  // El digito verificador es 11 menos la diferencia
else DigitoVerif:=Diferencia;       // sino es Cero.
 
if DigitoVerif = CUIT[11] then result:=true;  // si el Digito Verificador es igual
end;



procedure TPrinc.AbrirModificarProducto(id:string);
begin
    try
      productos:=Tproductos.Create(self);
    finally
      productos.abm:=2;
      productos.id:=id;
      productos.btnguardar.Caption:='Modificar';
      productos.Show;
    end;


end;



procedure TPrinc.AbrirEliminarCajaAsiento(id: string);
begin
    if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
      begin
          ZQExcecSQL.sql.clear;
          ZQExcecSQL.sql.add('Delete from cajaasientos');
          ZQExcecSQL.sql.add(' where cajaasiento_id=:cajaasiento_id');
          ZQExcecSQL.parambyname('cajaasiento_id').asstring:=id;
          ZQExcecSQL.ExecSQL;




      end;


end;

procedure TPrinc.AbrirNuevoCajaAsientoEgreso(caja_id:string);
begin
    try
      CajaAsientoEgreso:=TCajaAsientoEgreso.Create(self);
    finally
      CajaAsientoEgreso.abm:=1;
      CajaAsientoEgreso.caja_id:=caja_id;
      CajaAsientoEgreso.btnguardar.Caption:='Guardar';
      CajaAsientoEgreso.Show;
    end;

end;

procedure TPrinc.AbrirModificarCajaAsientoEgreso(id:string);
begin
    try
      CajaAsientoEgreso:=TCajaAsientoEgreso.Create(self);
    finally
      CajaAsientoEgreso.abm:=2;
      CajaAsientoEgreso.id:=id;
      CajaAsientoEgreso.btnguardar.Caption:='Modificar';
      CajaAsientoEgreso.Show;
    end;


end;


procedure TPrinc.AbrirNuevoCajaAsientoIngreso(caja_id:string);
begin
    try
      CajaAsientoIngreso:=TCajaAsientoIngreso.Create(self);
    finally
      CajaAsientoIngreso.abm:=1;
      CajaAsientoIngreso.caja_id:=caja_id;
      CajaAsientoIngreso.btnguardar.Caption:='Guardar';
      CajaAsientoIngreso.Show;
    end;

end;

procedure TPrinc.AbrirModificarCajaAsientoIngreso(id:string);
begin
    try
      CajaAsientoIngreso:=TCajaAsientoIngreso.Create(self);
    finally
      CajaAsientoIngreso.abm:=2;
      CajaAsientoIngreso.id:=id;
      CajaAsientoIngreso.btnguardar.Caption:='Modificar';
      CajaAsientoIngreso.Show;
    end;


end;


procedure TPrinc.AbrirModificarCajaAsiento(id:string);
begin
    try
      CajaAsiento:=TCajaAsiento.Create(self);
    finally
      CajaAsiento.abm:=2;
      CajaAsiento.id:=id;
      CajaAsiento.btnguardar.Caption:='Modificar';
      CajaAsiento.Show;
    end;


end;



procedure TPrinc.AbrirNuevoCajaAsiento(caja_id:string);
begin
    try
      CajaAsiento:=TCajaAsiento.Create(self);
    finally
      CajaAsiento.abm:=1;
      CajaAsiento.caja_id:=caja_id;
      CajaAsiento.btnguardar.Caption:='Guardar';
      CajaAsiento.Show;
    end;

end;

procedure TPrinc.AbrirModificarCliente(id:string);
begin
    try
      clientes:=Tclientes.Create(self);
    finally
      clientes.abm:=2;
      clientes.id:=id;
      clientes.btnguardar.Caption:='Modificar';
      clientes.Show;
    end;


end;


procedure TPrinc.AbrirNuevoCliente;
begin
    try
      clientes:=Tclientes.Create(self);
    finally
      clientes.abm:=1;
      clientes.btnguardar.Caption:='Guardar';
      clientes.Show;
    end;

end;


procedure TPrinc.AbrirModificarProveedores(id:string);
begin
    try
      proveedores:=Tproveedores.Create(self);
    finally
      proveedores.abm:=2;
      proveedores.id:=id;
      proveedores.btnguardar.Caption:='Modificar';
      proveedores.Show;
    end;


end;


procedure TPrinc.AbrirNuevoProveedores;
begin
    try
      proveedores:=Tproveedores.Create(self);
    finally
      proveedores.abm:=1;
      proveedores.btnguardar.Caption:='Guardar';
      proveedores.Show;
    end;
end;



procedure TPrinc.AbrirModificarCalculoprecios(id:string);
begin
    if id<>'' then
      begin
          try
            calculoprecio:=Tcalculoprecio.Create(self);
          finally
            calculoprecio.abm:=2;
            calculoprecio.id:=id;
            calculoprecio.btnguardar.Caption:='Modificar';
            calculoprecio.Show;
          end;

      end;



end;


procedure TPrinc.AbrirNuevoCalculoprecios;
begin
    try
      calculoprecio:=Tcalculoprecio.Create(self);
    finally
      calculoprecio.abm:=1;
      calculoprecio.btnguardar.Caption:='Guardar';
      calculoprecio.Show;
    end;

end;




procedure TPrinc.AbrirModificarServicio(id:string);
begin
    try
      servicios:=Tservicios.Create(self);
    finally
      servicios.abm:=2;
      servicios.id:=id;
      servicios.btnguardar.Caption:='Modificar';
      servicios.Show;
    end;


end;


procedure TPrinc.AbrirNuevoServicio;
begin
    try
      servicios:=Tservicios.Create(self);
    finally
      servicios.abm:=1;
      servicios.btnguardar.Caption:='Guardar';
      servicios.Show;
    end;

end;



procedure TPrinc.CargarDocumentoVentaDetalle(QDocumentoVentaDetalles:TDataset; Detalle:TDataset; abm:integer=1; bm:pointer=nil);
var
  i:integer;
begin
    if abm=1 then
      begin
          QDocumentoventadetalles.Last;
//          QDocumentoventadetalles.Next;
          QDocumentoventadetalles.Append;;

      end;
    if abm=2 then
      begin
          QDocumentoventadetalles.GotoBookmark(bm);

          QDocumentoventadetalles.Edit;
      end;

    for i := 0 to Detalle.FieldCount-1 do
      begin
          QDocumentoventadetalles.Fields[i].Value:=Detalle.Fields[i].Value;
      end;
    QDocumentoventadetalles.Post;
end;


procedure TPrinc.CargarDocumentoCompraDetalle(QDocumentoCompraDetalles:TDataset; Detalle:TDataset; abm:integer=1; bm:pointer=nil);
var
  i:integer;
begin
    if abm=1 then
      begin
          QDocumentoCompraDetalles.Last;
//          QDocumentoventadetalles.Next;
          QDocumentoCompraDetalles.Append;;

      end;
    if abm=2 then
      begin
          QDocumentoCompraDetalles.GotoBookmark(bm);

          QDocumentoCompraDetalles.Edit;
      end;

    for i := 0 to Detalle.FieldCount-1 do
      begin
          try
          QDocumentoCompraDetalles.Fields[i].Value:=Detalle.FieldByName(QDocumentoCompraDetalles.Fields[i].FieldName).Value;
          except
          end;
      end;
    QDocumentoCompraDetalles.Post;
end;




function TPrinc.ControlCodigoProducto(codigo: string; producto_id: string; campo:string; mostrar_mensaje:boolean):boolean;
begin
    ZQProductosABM.Active:=false;
    ZQProductosABM.SQL.Text:='select * from productos '+
                             'where '+campo+'="'+codigo+'"';

    ZQProductosABM.Active:=true;
    ZQProductosABM.First;
    result:=true;
    while not ZQProductosABM.Eof do
        begin
            if producto_id<>ZQProductosABM.FieldByName('producto_id').AsString then
              begin
                  result:=false;
                  if mostrar_mensaje then
                    MessageDlg('Codigo de producto repetido.'+#13+#10+'Codigo1=', mtError, [mbOK], 0);
              end;

            ZQProductosABM.Next;
        end;
    ZQProductosABM.Active:=false;
    ZQProductosABM.SQL.Clear;
end;



function TPrinc.horaservidor():Ttime;
var
  hora:string;
begin
    hora:=buscar('select TIME_FORMAT(CURTIME(),"%H:%i:%s") as hora','hora');

    Result:=StrToTime(hora);

end;




function TPrinc.QuitarEspecialesNros(const Cad: string): string;
const
  VALIDOS=['0'..'9'];
var
  i: Integer;
begin
    Result:= '';
    for i:= 1 to Length(Cad) do
      if Cad[i] in VALIDOS then
        Result:= Result+Cad[i]
end;

Procedure TPrinc.ActualizarPrecios(QProductos: TDataSet);
var
  producto_fechaactualizacionprecio:string;
begin
    producto_fechaactualizacionprecio:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);

    QProductos.First;
    while not QProductos.Eof do
        begin
            ZQProductosABM.sql.clear;
            ZQProductosABM.sql.add('Update productos set ');
            ZQProductosABM.sql.add('politicaprecio_id=:politicaprecio_id, ');
            ZQProductosABM.sql.add('tipoiva_id=:tipoiva_id, ');
            ZQProductosABM.sql.add('producto_neto1=:producto_neto1, ');
            ZQProductosABM.sql.add('producto_neto2=:producto_neto2, ');
            ZQProductosABM.sql.add('producto_neto3=:producto_neto3, ');
            ZQProductosABM.sql.add('producto_neto4=:producto_neto4, ');
            ZQProductosABM.sql.add('producto_preciocosto=:producto_preciocosto, ');
            ZQProductosABM.sql.add('producto_precioventa1=:producto_precioventa1, ');
            ZQProductosABM.sql.add('producto_precioventa2=:producto_precioventa2, ');
            ZQProductosABM.sql.add('producto_precioventa3=:producto_precioventa3, ');
            ZQProductosABM.sql.add('producto_precioventa4=:producto_precioventa4, ');
            ZQProductosABM.sql.add('producto_precioventabase=:producto_precioventabase, ');
            ZQProductosABM.sql.add('producto_fechaactualizacionprecio=:producto_fechaactualizacionprecio ');
            ZQProductosABM.sql.add('where producto_id=:producto_id');
            ZQProductosABM.parambyname('producto_neto1').asstring:=QProductos.FieldByName('producto_neto1').AsString;
            ZQProductosABM.parambyname('producto_neto2').asstring:=QProductos.FieldByName('producto_neto2').AsString;
            ZQProductosABM.parambyname('producto_neto3').asstring:=QProductos.FieldByName('producto_neto3').AsString;
            ZQProductosABM.parambyname('producto_neto4').asstring:=QProductos.FieldByName('producto_neto4').AsString;
            ZQProductosABM.parambyname('producto_preciocosto').asstring:=QProductos.FieldByName('producto_preciocosto').AsString;
            ZQProductosABM.parambyname('producto_precioventa1').asstring:=QProductos.FieldByName('producto_precioventa1').AsString;
            ZQProductosABM.parambyname('producto_precioventa2').asstring:=QProductos.FieldByName('producto_precioventa2').AsString;
            ZQProductosABM.parambyname('producto_precioventa3').asstring:=QProductos.FieldByName('producto_precioventa3').AsString;
            ZQProductosABM.parambyname('producto_precioventa4').asstring:=QProductos.FieldByName('producto_precioventa4').AsString;
            ZQProductosABM.parambyname('producto_precioventabase').asstring:=QProductos.FieldByName('producto_precioventabase').AsString;
            ZQProductosABM.parambyname('producto_id').asstring:=QProductos.FieldByName('producto_id').AsString;
            ZQProductosABM.parambyname('producto_fechaactualizacionprecio').asstring:=producto_fechaactualizacionprecio;
            ZQProductosABM.parambyname('politicaprecio_id').asstring:=QProductos.FieldByName('politicaprecio_id').AsString;
            ZQProductosABM.parambyname('tipoiva_id').asstring:=QProductos.FieldByName('tipoiva_id').AsString;
            ZQProductosABM.ExecSQL;

            QProductos.Next;
        end;

end;


Procedure TPrinc.AgregarProductos(QProductos: TDataSet);
var
  id:string;
  existe_campo_stock:boolean;
begin
    QProductos.First;
    
    try
      QProductos.FieldByName('producdepo_stockactual').AsString;
      existe_campo_stock:=true;
    except
      existe_campo_stock:=false;
    end;

    while not QProductos.Eof do
        begin
            id:=Princ.codigo('productos','producto_id');
            ZQProductosABM.sql.clear;
            ZQProductosABM.sql.add('Insert into productos (calculoprecio_id, politicaprecio_id, ');
            ZQProductosABM.sql.add('producto_codigo, producto_codigobarras, producto_estado, ');
            ZQProductosABM.sql.add('producto_id, producto_neto1, producto_neto2, ');
            ZQProductosABM.sql.add('producto_neto3, producto_neto4, producto_nombre, ');
            ZQProductosABM.sql.add('producto_observaciones, producto_preciocosto, ');
            ZQProductosABM.sql.add('producto_precioventa1, producto_precioventa2, ');
            ZQProductosABM.sql.add('producto_precioventa3, producto_precioventa4, ');
            ZQProductosABM.sql.add('producto_precioventabase, proveedor_id, rubro_id, ');
            ZQProductosABM.sql.add('tipoiva_id,producto_fechaactualizacionprecio, producto_codigoreferencia) values (:calculoprecio_id, ');
            ZQProductosABM.sql.add(':politicaprecio_id, :producto_codigo, :producto_codigobarras, ');
            ZQProductosABM.sql.add(':producto_estado, :producto_id, :producto_neto1, ');
            ZQProductosABM.sql.add(':producto_neto2, :producto_neto3, :producto_neto4, ');
            ZQProductosABM.sql.add(':producto_nombre, :producto_observaciones, ');
            ZQProductosABM.sql.add(':producto_preciocosto, :producto_precioventa1, ');
            ZQProductosABM.sql.add(':producto_precioventa2, :producto_precioventa3, ');
            ZQProductosABM.sql.add(':producto_precioventa4, :producto_precioventabase, ');
            ZQProductosABM.sql.add(':proveedor_id, :rubro_id, :tipoiva_id, :producto_fechaactualizacionprecio, :producto_codigoreferencia)');
            ZQProductosABM.parambyname('calculoprecio_id').asstring:=QProductos.FieldByName('calculoprecio_id').AsString;
            ZQProductosABM.parambyname('politicaprecio_id').asstring:=QProductos.FieldByName('politicaprecio_id').AsString;

            ZQProductosABM.parambyname('producto_codigo').asstring:=QProductos.FieldByName('producto_codigo').AsString;
            if QProductos.FieldByName('producto_codigo').AsString='0' then
              ZQProductosABM.parambyname('producto_codigo').asstring:=id;

            ZQProductosABM.parambyname('producto_codigobarras').asstring:=QProductos.FieldByName('producto_codigobarras').AsString;
            if QProductos.FieldByName('producto_codigobarras').AsString='0' then
              ZQProductosABM.parambyname('producto_codigobarras').asstring:=id;

            ZQProductosABM.parambyname('producto_estado').asstring:=QProductos.FieldByName('producto_estado').AsString;
            ZQProductosABM.parambyname('producto_id').asstring:=id;
            ZQProductosABM.parambyname('producto_neto1').asstring:=QProductos.FieldByName('producto_neto1').AsString;
            ZQProductosABM.parambyname('producto_neto2').asstring:=QProductos.FieldByName('producto_neto2').AsString;
            ZQProductosABM.parambyname('producto_neto3').asstring:=QProductos.FieldByName('producto_neto3').AsString;
            ZQProductosABM.parambyname('producto_neto4').asstring:=QProductos.FieldByName('producto_neto4').AsString;
            ZQProductosABM.parambyname('producto_nombre').asstring:=QProductos.FieldByName('producto_nombre').AsString;
            ZQProductosABM.parambyname('producto_observaciones').asstring:=QProductos.FieldByName('producto_observaciones').AsString;
            ZQProductosABM.parambyname('producto_preciocosto').asstring:=QProductos.FieldByName('producto_preciocosto').AsString;
            ZQProductosABM.parambyname('producto_precioventa1').asstring:=QProductos.FieldByName('producto_precioventa1').AsString;
            ZQProductosABM.parambyname('producto_precioventa2').asstring:=QProductos.FieldByName('producto_precioventa2').AsString;
            ZQProductosABM.parambyname('producto_precioventa3').asstring:=QProductos.FieldByName('producto_precioventa3').AsString;
            ZQProductosABM.parambyname('producto_precioventa4').asstring:=QProductos.FieldByName('producto_precioventa4').AsString;
            ZQProductosABM.parambyname('producto_precioventabase').asstring:=QProductos.FieldByName('producto_precioventabase').AsString;
            ZQProductosABM.parambyname('proveedor_id').asstring:=QProductos.FieldByName('proveedor_id').AsString;
            ZQProductosABM.parambyname('rubro_id').asstring:=QProductos.FieldByName('rubro_id').AsString;
            ZQProductosABM.parambyname('tipoiva_id').asstring:=QProductos.FieldByName('tipoiva_id').AsString;
            ZQProductosABM.parambyname('producto_fechaactualizacionprecio').asstring:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);
            ZQProductosABM.parambyname('producto_codigoreferencia').asstring:=QProductos.FieldByName('producto_codigoreferencia').AsString;
            ZQProductosABM.ExecSQL;


            ZQProductosABM.sql.clear;
            ZQProductosABM.sql.add('Insert into productodeposito ');
            ZQProductosABM.sql.add('select 0, 0, '+id+', deposito_id, 0, 0, 0 from depositos');
            ZQProductosABM.ExecSQL;

            if existe_campo_stock then
              begin
                  ZQProductosABM.sql.clear;
                  ZQProductosABM.sql.add('update productodeposito set');
                  ZQProductosABM.sql.add('producdepo_stockactual=:producdepo_stockactual ');
                  ZQProductosABM.sql.add('where producto_id=:producto_id and ');
                  ZQProductosABM.sql.add('deposito_id=:deposito_id');
                  ZQProductosABM.ParamByName('producdepo_stockactual').AsString:=QProductos.FieldByName('producdepo_stockactual').AsString;
                  ZQProductosABM.ParamByName('producto_id').AsString:=id;
                  ZQProductosABM.ParamByName('deposito_id').AsString:=princ.dep_id;
                  ZQProductosABM.ExecSQL;




              end;


            QProductos.Next;
        end;


end;

Procedure TPrinc.CalcularPreciosProducto(QProductos: TDataSet; aplicar_cambios:boolean=false);
var
  politicaprecio_politica1, politicaprecio_politica2, politicaprecio_politica3, politicaprecio_politica4:real;
  tipoiva_valor:real;
  subtotal1, subtotal2, subtotal3, subtotal4:real;
begin
    QProductos.First;
    while not QProductos.Eof do
        begin
            QProductos.Edit;
            QProductos.FieldByName('producto_precioventabase').AsFloat:=Princ.GetPrecioVentaBase(QProductos.FieldByName('producto_preciocosto').AsFloat,QProductos.FieldByName('calculoprecio_id').AsString);

            QProductos.FieldByName('producto_precioventabase').AsFloat:=Princ.GetPrecioVentaBaseprod(QProductos.FieldByName('producto_precioventabase').AsFloat,QProductos.FieldByName('producto_id').AsString);



            politicaprecio_politica1:=strtofloat(Princ.buscar('select politicaprecio_politica1 from politicasdeprecios where politicaprecio_id="'+QProductos.FieldByName('politicaprecio_id').AsString+'"','politicaprecio_politica1'));
            politicaprecio_politica2:=strtofloat(Princ.buscar('select politicaprecio_politica2 from politicasdeprecios where politicaprecio_id="'+QProductos.FieldByName('politicaprecio_id').AsString+'"','politicaprecio_politica2'));
            politicaprecio_politica3:=strtofloat(Princ.buscar('select politicaprecio_politica3 from politicasdeprecios where politicaprecio_id="'+QProductos.FieldByName('politicaprecio_id').AsString+'"','politicaprecio_politica3'));
            politicaprecio_politica4:=strtofloat(Princ.buscar('select politicaprecio_politica4 from politicasdeprecios where politicaprecio_id="'+QProductos.FieldByName('politicaprecio_id').AsString+'"','politicaprecio_politica4'));

            QProductos.FieldByName('producto_neto1').AsFloat:=roundto(QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica1/100),-2);
            QProductos.FieldByName('producto_neto2').AsFloat:=roundto(QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica2/100),-2);
            QProductos.FieldByName('producto_neto3').AsFloat:=roundto(QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica3/100),-2);
            QProductos.FieldByName('producto_neto4').AsFloat:=roundto(QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica4/100),-2);

            tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva where tipoiva_id="'+QProductos.FieldByName('tipoiva_id').asstring+'"','tipoiva_valor'));

            QProductos.FieldByName('producto_precioventa1').AsFloat:=roundto((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica1/100))+((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica1/100))*tipoiva_valor/100),-2);
            QProductos.FieldByName('producto_precioventa2').AsFloat:=roundto((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica2/100))+((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica2/100))*tipoiva_valor/100),-2);
            QProductos.FieldByName('producto_precioventa3').AsFloat:=roundto((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica3/100))+((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica3/100))*tipoiva_valor/100),-2);
            QProductos.FieldByName('producto_precioventa4').AsFloat:=roundto((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica4/100))+((QProductos.FieldByName('producto_precioventabase').AsFloat+(QProductos.FieldByName('producto_precioventabase').AsFloat*politicaprecio_politica4/100))*tipoiva_valor/100),-2);

            QProductos.Post;


            if aplicar_cambios then
              begin
                  ZQExcecSQL.sql.clear;
                  ZQExcecSQL.sql.add('Update productos set ');
                  ZQExcecSQL.sql.add('producto_fechaactualizacionprecio=curdate(), ');
                  ZQExcecSQL.sql.add('producto_preciocosto=:producto_preciocosto, ');
                  ZQExcecSQL.sql.add('producto_precioventabase=:producto_precioventabase, ');
                  ZQExcecSQL.sql.add('calculoprecio_id=:calculoprecio_id, ');
                  ZQExcecSQL.sql.add('politicaprecio_id=:politicaprecio_id, ');
                  ZQExcecSQL.sql.add('producto_preciocosto=:producto_preciocosto, ');
                  ZQExcecSQL.sql.add('producto_neto1=:producto_neto1, ');
                  ZQExcecSQL.sql.add('producto_neto2=:producto_neto2, ');
                  ZQExcecSQL.sql.add('producto_neto3=:producto_neto3, ');
                  ZQExcecSQL.sql.add('producto_neto4=:producto_neto4, ');
                  ZQExcecSQL.sql.add('producto_precioventa1=:producto_precioventa1, ');
                  ZQExcecSQL.sql.add('producto_precioventa2=:producto_precioventa2, ');
                  ZQExcecSQL.sql.add('producto_precioventa3=:producto_precioventa3, ');
                  ZQExcecSQL.sql.add('producto_precioventa4=:producto_precioventa4, ');
                  ZQExcecSQL.sql.add('producto_precioventabase=:producto_precioventabase');
                  ZQExcecSQL.sql.add(' where producto_id=:producto_id');
                  ZQExcecSQL.parambyname('producto_neto1').asstring:=QProductos.FieldByName('producto_neto1').AsString;
                  ZQExcecSQL.parambyname('producto_neto2').asstring:=QProductos.FieldByName('producto_neto2').AsString;
                  ZQExcecSQL.parambyname('producto_neto3').asstring:=QProductos.FieldByName('producto_neto3').AsString;
                  ZQExcecSQL.parambyname('producto_neto4').asstring:=QProductos.FieldByName('producto_neto4').AsString;
                  ZQExcecSQL.parambyname('producto_precioventa1').asstring:=QProductos.FieldByName('producto_precioventa1').AsString;
                  ZQExcecSQL.parambyname('producto_precioventa2').asstring:=QProductos.FieldByName('producto_precioventa2').AsString;
                  ZQExcecSQL.parambyname('producto_precioventa3').asstring:=QProductos.FieldByName('producto_precioventa3').AsString;
                  ZQExcecSQL.parambyname('producto_precioventa4').asstring:=QProductos.FieldByName('producto_precioventa4').AsString;
                  ZQExcecSQL.parambyname('producto_precioventabase').asstring:=QProductos.FieldByName('producto_precioventabase').AsString;
                  ZQExcecSQL.parambyname('producto_preciocosto').asstring:=QProductos.FieldByName('producto_preciocosto').AsString;
                  ZQExcecSQL.parambyname('producto_precioventabase').asstring:=QProductos.FieldByName('producto_precioventabase').AsString;
                  ZQExcecSQL.parambyname('calculoprecio_id').asstring:=QProductos.FieldByName('calculoprecio_id').AsString;
                  ZQExcecSQL.parambyname('politicaprecio_id').asstring:=QProductos.FieldByName('politicaprecio_id').AsString;
                  ZQExcecSQL.parambyname('producto_id').asstring:=QProductos.FieldByName('producto_id').AsString;
                  ZQExcecSQL.parambyname('producto_preciocosto').asstring:=QProductos.FieldByName('producto_preciocosto').AsString;

                  ZQExcecSQL.ExecSQL;

              end;

            QProductos.Next;
        end;

    if aplicar_cambios then
      MessageDlg('Se actualizaron '+inttostr(QProductos.RecordCount)+' productos.', mtInformation, [mbOK], 0);

end;


Procedure TPrinc.ModificarProducto(QProductos: TDataSet);
var
  politicaprecio_politica1, politicaprecio_politica2, politicaprecio_politica3, politicaprecio_politica4:real;
  tipoiva_valor:real;
  subtotal1, subtotal2, subtotal3, subtotal4:real;
begin
    QProductos.First;
    while not QProductos.Eof do
        begin
            ZQExcecSQL.Sql.Clear;
            ZQExcecSQL.Sql.Add('update productos set ');
            ZQExcecSQL.Sql.Add('producto_codigoreferencia=:producto_codigoreferencia, ');
            ZQExcecSQL.Sql.Add('proveedor_id=:proveedor_id, ');
            ZQExcecSQL.Sql.Add('rubro_id=:rubro_id, ');
            ZQExcecSQL.Sql.Add('producto_estado=:producto_estado ');
            ZQExcecSQL.Sql.Add('where producto_id=:producto_id ');
            ZQExcecSQL.parambyname('producto_codigoreferencia').asstring:=QProductos.FieldByName('producto_codigoreferencia').AsString;
            ZQExcecSQL.parambyname('proveedor_id').asstring:=QProductos.FieldByName('proveedor_id').AsString;
            ZQExcecSQL.parambyname('rubro_id').asstring:=QProductos.FieldByName('rubro_id').AsString;
            ZQExcecSQL.parambyname('producto_estado').asstring:=QProductos.FieldByName('producto_estado').AsString;
            ZQExcecSQL.parambyname('producto_id').asstring:=QProductos.FieldByName('producto_id').AsString;
            ZQExcecSQL.ExecSQL;

            QProductos.Next;
        end;
      MessageDlg('Se actualizaron '+inttostr(QProductos.RecordCount)+' productos.', mtInformation, [mbOK], 0);
end;


Function TPrinc.AgregarDocumentoVenta(Cabecera: TDataSet; Detalle: TDataSet; Documentoventadocu: TDataSet; Pagos: TDataSet):string;
var
  id:string;
  documentoventa_numero:string;
begin
    ZQDocumentosventasABM.SQL.Clear;
    ZQDocumentosventasABM.SQL.Add('begin');
    ZQDocumentosventasABM.ExecSQL;

    id:=codigo('documentosventas', 'documentoventa_id');

    documentoventa_numero:=Princ.NumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString,Cabecera.FieldByName('documentoventa_numero').AsString);
    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+Cabecera.FieldByName('tipodocu_id').AsString+'"','tipodocu_fiscal')) then
      documentoventa_numero:='0';

    ZQDocumentosventasABM.sql.clear;
    ZQDocumentosventasABM.sql.add('Insert into documentosventas (cliente_id, documentoventa_condicionventa, ');
    ZQDocumentosventasABM.sql.add('documentoventa_estado, documentoventa_fecha, documentoventa_fechavenc, ');
    ZQDocumentosventasABM.sql.add('documentoventa_hora, documentoventa_id, documentoventa_iva105, ');
    ZQDocumentosventasABM.sql.add('documentoventa_iva21, documentoventa_listaprecio, documentoventa_neto105, ');
    ZQDocumentosventasABM.sql.add('documentoventa_neto21, documentoventa_netonogravado, documentoventa_numero, ');
    ZQDocumentosventasABM.sql.add('documentoventa_observacion, documentoventa_pagado, documentoventa_saldo, ');
    ZQDocumentosventasABM.sql.add('documentoventa_total, personal_id, tipodocu_id, caja_id) ');
    ZQDocumentosventasABM.sql.add('values (:cliente_id, :documentoventa_condicionventa, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_estado, :documentoventa_fecha, :documentoventa_fechavenc, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_hora, :documentoventa_id, :documentoventa_iva105, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_iva21, :documentoventa_listaprecio, :documentoventa_neto105, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_neto21, :documentoventa_netonogravado, :documentoventa_numero, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_observacion, :documentoventa_pagado, :documentoventa_saldo, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_total, :personal_id, :tipodocu_id, :caja_id)');
    ZQDocumentosventasABM.parambyname('cliente_id').asstring:=Cabecera.FieldByName('cliente_id').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_condicionventa').asstring:=Cabecera.FieldByName('documentoventa_condicionventa').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_estado').asstring:=Cabecera.FieldByName('documentoventa_estado').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_fecha').asstring:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documentoventa_fecha').AsDateTime);
    ZQDocumentosventasABM.parambyname('documentoventa_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documentoventa_fechavenc').AsDateTime);
    ZQDocumentosventasABM.parambyname('documentoventa_hora').asstring:=timetostr(Time);
    ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=id;
    ZQDocumentosventasABM.parambyname('documentoventa_iva105').asstring:=Cabecera.FieldByName('documentoventa_iva105').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_iva21').asstring:=Cabecera.FieldByName('documentoventa_iva21').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_listaprecio').asstring:=Cabecera.FieldByName('documentoventa_listaprecio').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_neto105').asstring:=Cabecera.FieldByName('documentoventa_neto105').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_neto21').asstring:=Cabecera.FieldByName('documentoventa_neto21').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_netonogravado').asstring:=Cabecera.FieldByName('documentoventa_netonogravado').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_numero').asstring:=documentoventa_numero;
    ZQDocumentosventasABM.parambyname('documentoventa_observacion').asstring:=Cabecera.FieldByName('documentoventa_observacion').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_pagado').asstring:=Cabecera.FieldByName('documentoventa_pagado').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_saldo').asstring:=Cabecera.FieldByName('documentoventa_saldo').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_total').asstring:=Cabecera.FieldByName('documentoventa_total').AsString;
    ZQDocumentosventasABM.parambyname('personal_id').asstring:=Cabecera.FieldByName('personal_id').AsString;
    ZQDocumentosventasABM.parambyname('tipodocu_id').asstring:=Cabecera.FieldByName('tipodocu_id').AsString;
    ZQDocumentosventasABM.parambyname('caja_id').asstring:=Cabecera.FieldByName('caja_id').AsString;
    ZQDocumentosventasABM.ExecSQL;

    ActualizarNumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString,documentoventa_numero);


    if Detalle<>nil then
      begin
          Detalle.First;
          while not Detalle.Eof do
              begin
                  ZQDocumentosventasABM.sql.clear;
                  ZQDocumentosventasABM.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
                  ZQDocumentosventasABM.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
                  ZQDocumentosventasABM.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id, documentoventadetalle_listaprecio) ');
                  ZQDocumentosventasABM.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id, :documentoventadetalle_listaprecio) ');
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_id').AsString:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_descripcion').AsString:=Detalle.FieldByName('documentoventadetalle_descripcion').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_cantidad').AsString:=Detalle.FieldByName('documentoventadetalle_cantidad').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_precio').AsString:=Detalle.FieldByName('documentoventadetalle_precio').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_total').AsString:=Detalle.FieldByName('documentoventadetalle_total').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_neto21').AsString:=Detalle.FieldByName('documentoventadetalle_neto21').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_iva21').AsString:=Detalle.FieldByName('documentoventadetalle_iva21').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_neto105').AsString:=Detalle.FieldByName('documentoventadetalle_neto105').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_iva105').AsString:=Detalle.FieldByName('documentoventadetalle_iva105').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_nogravado').AsString:=Detalle.FieldByName('documentoventadetalle_nogravado').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_estado').AsString:=Detalle.FieldByName('documentoventadetalle_estado').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_observacion').AsString:=Detalle.FieldByName('documentoventadetalle_observacion').AsString;
                  ZQDocumentosventasABM.ParamByName('producto_id').AsString:=Detalle.FieldByName('producto_id').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_idorig').AsString:=Detalle.FieldByName('documentoventadetalle_idorig').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=Detalle.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventa_id').AsString:=id;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_listaprecio').AsString:=Detalle.FieldByName('documentoventadetalle_listaprecio').AsString;
                  ZQDocumentosventasABM.ExecSQL;

                  Detalle.Next;
              end;

      end;


    if Documentoventadocu<>nil then
      begin
          Documentoventadocu.First;
          while not Documentoventadocu.Eof do
              begin
                  ZQDocumentosventasABM.sql.clear;
                  ZQDocumentosventasABM.sql.add('Insert into documentoventadocus (documentoventa_estado, ');
                  ZQDocumentosventasABM.sql.add('documentoventa_id, documentoventa_idpago, ');
                  ZQDocumentosventasABM.sql.add('documentoventa_pagado, documentoventa_saldo, ');
                  ZQDocumentosventasABM.sql.add('documentoventadoc_id, documentoventadoc_importe, documentoventadoc_tiporelacion) ');
                  ZQDocumentosventasABM.sql.add('values (:documentoventa_estado, :documentoventa_id, ');
                  ZQDocumentosventasABM.sql.add(':documentoventa_idpago, :documentoventa_pagado, ');
                  ZQDocumentosventasABM.sql.add(':documentoventa_saldo, :documentoventadoc_id, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadoc_importe, :documentoventadoc_tiporelacion)');
                  ZQDocumentosventasABM.parambyname('documentoventa_estado').asstring:=Documentoventadocu.FieldByName('documentoventa_estado').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=id;
                  ZQDocumentosventasABM.parambyname('documentoventa_idpago').asstring:=Documentoventadocu.FieldByName('documentoventa_idpago').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_pagado').asstring:=Documentoventadocu.FieldByName('documentoventa_pagado').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_saldo').asstring:=Documentoventadocu.FieldByName('documentoventa_saldo').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventadoc_id').asstring:=codigo('documentoventadocus', 'documentoventadoc_id');
                  ZQDocumentosventasABM.parambyname('documentoventadoc_importe').asstring:=Documentoventadocu.FieldByName('documentoventadoc_importe').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventadoc_tiporelacion').asstring:=Documentoventadocu.FieldByName('documentoventadoc_tiporelacion').AsString;
                  ZQDocumentosventasABM.ExecSQL;

                  if Documentoventadocu.FieldByName('documentoventadoc_tiporelacion').AsString='IMPUTACION' then
                    ActualizarSaldoDocumentoVenta(Documentoventadocu.FieldByName('documentoventa_idpago').AsString,Documentoventadocu.FieldByName('documentoventadoc_importe').AsFloat);

                  Documentoventadocu.Next;
              end;

      end;

    if Pagos<>nil then
      begin
          Pagos.First;
          while not Pagos.Eof do
              begin
                  ZQDocumentosventasABM.sql.clear;
                  ZQDocumentosventasABM.sql.add('Insert into documentopagos (documentopago_id, ');
                  ZQDocumentosventasABM.sql.add('documentopago_importe, documentopago_nombre, ');
                  ZQDocumentosventasABM.sql.add('documentoventa_id, tipopago_id) ');
                  ZQDocumentosventasABM.sql.add('values (:documentopago_id, :documentopago_importe, ');
                  ZQDocumentosventasABM.sql.add(':documentopago_nombre, :documentoventa_id, ');
                  ZQDocumentosventasABM.sql.add(':tipopago_id)');
                  ZQDocumentosventasABM.parambyname('documentopago_id').asstring:=codigo('documentopagos', 'documentopago_id');
                  ZQDocumentosventasABM.parambyname('documentopago_importe').asstring:=Pagos.FieldByName('documentopago_importe').AsString;
                  ZQDocumentosventasABM.parambyname('documentopago_nombre').asstring:=Pagos.FieldByName('documentopago_nombre').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=id;
                  ZQDocumentosventasABM.parambyname('tipopago_id').asstring:=Pagos.FieldByName('tipopago_id').AsString;
                  ZQDocumentosventasABM.ExecSQL;

                  Pagos.Next;
              end;

      end;

    ZQDocumentosventasABM.SQL.Clear;
    ZQDocumentosventasABM.SQL.Add('commit');
    ZQDocumentosventasABM.ExecSQL;

    result:=id;

end;


Procedure TPrinc.ModificarDocumentoVenta(Cabecera: TDataSet; Detalle: TDataSet; Documentoventadocu: TDataSet; Pagos: TDataSet; pagostarjeta: TDataSet);
var
  documentoventa_neto21, documentoventa_iva21, documentoventa_neto105, documentoventa_iva105, documentoventa_total, documentoventa_pagado, documentoventa_saldo, documentoventa_estado:string;
  documentopago_id:string;
begin
    ZQDocumentosventasABM.SQL.Clear;
    ZQDocumentosventasABM.SQL.Add('begin');
    ZQDocumentosventasABM.ExecSQL;

    ZQDocumentosventasABM.Sql.Clear;
    ZQDocumentosventasABM.Sql.Add('update documentosventas set ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_trabajorealizado=:documentoventa_trabajorealizado, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_solicitudcliente=:documentoventa_solicitudcliente, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_nrodetallepago=:documentoventa_nrodetallepago, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_formapago=:documentoventa_formapago, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_equipo2=:documentoventa_equipo2, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_equipo1=:documentoventa_equipo1, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_listaprecio=:documentoventa_listaprecio, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_fechavenc=:documentoventa_fechavenc, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_condicionventa=:documentoventa_condicionventa, ');
    ZQDocumentosventasABM.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQDocumentosventasABM.Sql.Add('personal_id=:personal_id, ');
    ZQDocumentosventasABM.Sql.Add('cliente_id=:cliente_id, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_observacion=:documentoventa_observacion, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_saldo=:documentoventa_saldo, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_pagado=:documentoventa_pagado, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_estado=:documentoventa_estado, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_total=:documentoventa_total, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_netonogravado=:documentoventa_netonogravado, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_iva105=:documentoventa_iva105, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_neto105=:documentoventa_neto105, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_iva21=:documentoventa_iva21, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_neto21=:documentoventa_neto21, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_hora=:documentoventa_hora, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_fecha=:documentoventa_fecha, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_recargo=:documentoventa_recargo, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_descuento=:documentoventa_descuento, ');
    ZQDocumentosventasABM.Sql.Add('documentoventa_numero=:documentoventa_numero ');
    ZQDocumentosventasABM.Sql.Add('where documentoventa_id=:documentoventa_id ');
    ZQDocumentosventasABM.parambyname('cliente_id').asstring:=Cabecera.FieldByName('cliente_id').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_condicionventa').asstring:=Cabecera.FieldByName('documentoventa_condicionventa').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_estado').asstring:=Cabecera.FieldByName('documentoventa_estado').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_fecha').asstring:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documentoventa_fecha').AsDateTime);
    ZQDocumentosventasABM.parambyname('documentoventa_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documentoventa_fechavenc').AsDateTime);
    ZQDocumentosventasABM.parambyname('documentoventa_hora').asstring:=Cabecera.FieldByName('documentoventa_hora').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=Cabecera.FieldByName('documentoventa_id').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_iva105').asstring:=Cabecera.FieldByName('documentoventa_iva105').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_iva21').asstring:=Cabecera.FieldByName('documentoventa_iva21').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_listaprecio').asstring:=Cabecera.FieldByName('documentoventa_listaprecio').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_neto105').asstring:=Cabecera.FieldByName('documentoventa_neto105').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_neto21').asstring:=Cabecera.FieldByName('documentoventa_neto21').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_netonogravado').asstring:=Cabecera.FieldByName('documentoventa_netonogravado').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_numero').asstring:=Cabecera.FieldByName('documentoventa_numero').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_observacion').asstring:=Cabecera.FieldByName('documentoventa_observacion').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_pagado').asstring:=Cabecera.FieldByName('documentoventa_pagado').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_saldo').asstring:=Cabecera.FieldByName('documentoventa_saldo').AsString;
    ZQDocumentosventasABM.parambyname('documentoventa_total').asstring:=Cabecera.FieldByName('documentoventa_total').AsString;
    ZQDocumentosventasABM.parambyname('personal_id').asstring:=Cabecera.FieldByName('personal_id').AsString;
    ZQDocumentosventasABM.parambyname('tipodocu_id').asstring:=Cabecera.FieldByName('tipodocu_id').AsString;
    ZQDocumentosventasABM.ParamByName('documentoventa_recargo').AsString:=Cabecera.FieldByName('documentoventa_recargo').AsString;
    ZQDocumentosventasABM.ParamByName('documentoventa_descuento').AsString:=Cabecera.FieldByName('documentoventa_descuento').AsString;
    ZQDocumentosventasABM.ExecSQL;

    if Detalle<>nil then
      begin
          ZQdocumentoventadetalles.Active:=false;
          ZQdocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"';
          ZQdocumentoventadetalles.Active:=true;
          ZQdocumentoventadetalles.First;
          while not ZQdocumentoventadetalles.Eof do
              begin
                  Princ.actualizarstock(ZQdocumentoventadetalles.FieldByName('producto_id').AsString,ZQdocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat,Cabecera.FieldByName('tipodocu_id').AsString,true);

                  ZQdocumentoventadetalles.Next;
              end;

          ZQDocumentosventasABM.Sql.Clear;
          ZQDocumentosventasABM.Sql.Add('delete from documentoventadetalles ');
          ZQDocumentosventasABM.Sql.Add('where documentoventa_id=:documentoventa_id ');
          ZQDocumentosventasABM.ParamByName('documentoventa_id').AsString:=Cabecera.FieldByName('documentoventa_id').AsString;
          ZQDocumentosventasABM.ExecSql;

          Detalle.First;

          while not Detalle.Eof do
              begin
                  ZQDocumentosventasABM.sql.clear;
                  ZQDocumentosventasABM.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
                  ZQDocumentosventasABM.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
                  ZQDocumentosventasABM.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id, documentoventadetalle_listaprecio) ');
                  ZQDocumentosventasABM.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id, :documentoventadetalle_listaprecio) ');
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_id').AsString:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_descripcion').AsString:=Detalle.FieldByName('documentoventadetalle_descripcion').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_cantidad').AsString:=Detalle.FieldByName('documentoventadetalle_cantidad').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_precio').AsString:=Detalle.FieldByName('documentoventadetalle_precio').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_total').AsString:=Detalle.FieldByName('documentoventadetalle_total').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_neto21').AsString:=Detalle.FieldByName('documentoventadetalle_neto21').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_iva21').AsString:=Detalle.FieldByName('documentoventadetalle_iva21').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_neto105').AsString:=Detalle.FieldByName('documentoventadetalle_neto105').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_iva105').AsString:=Detalle.FieldByName('documentoventadetalle_iva105').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_nogravado').AsString:=Detalle.FieldByName('documentoventadetalle_nogravado').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_estado').AsString:=Detalle.FieldByName('documentoventadetalle_estado').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_observacion').AsString:=Detalle.FieldByName('documentoventadetalle_observacion').AsString;
                  ZQDocumentosventasABM.ParamByName('producto_id').AsString:=Detalle.FieldByName('producto_id').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_idorig').AsString:=Detalle.FieldByName('documentoventadetalle_idorig').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=Detalle.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventa_id').AsString:=cabecera.FieldByName('documentoventa_id').AsString;
                  ZQDocumentosventasABM.ParamByName('documentoventadetalle_listaprecio').AsString:=Detalle.FieldByName('documentoventadetalle_listaprecio').AsString;
                  ZQDocumentosventasABM.ExecSQL;

                  Princ.actualizarstock(Detalle.FieldByName('producto_id').AsString,Detalle.FieldByName('documentoventadetalle_cantidad').AsFloat,Cabecera.FieldByName('tipodocu_id').AsString,false);

                  Detalle.Next;
              end;

          documentoventa_neto21:=floattostr(roundto(Cabecera.FieldByName('documentoventa_recargo').AsFloat/1.21,-2)+strtofloat(princ.buscar('select sum(documentoventadetalle_neto21) as neto21 from documentoventadetalles where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"','neto21')));
          documentoventa_neto105:=princ.buscar('select sum(documentoventadetalle_neto105) as neto105 from documentoventadetalles where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"','neto105');
          documentoventa_iva21:=floattostr(roundto(Cabecera.FieldByName('documentoventa_recargo').AsFloat*21/100,-2)+strtofloat(princ.buscar('select sum(documentoventadetalle_iva21) as iva21 from documentoventadetalles where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"','iva21')));
          documentoventa_iva105:=princ.buscar('select sum(documentoventadetalle_iva105) as iva105 from documentoventadetalles where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"','iva105');
          documentoventa_total:=floattostr((Cabecera.FieldByName('documentoventa_recargo').AsFloat)+strtofloat(princ.buscar('select sum(documentoventadetalle_total) as total from documentoventadetalles where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"','total')));

          ZQDocumentosventasABM.Sql.Clear;
          ZQDocumentosventasABM.Sql.Add('update documentosventas set ');
          ZQDocumentosventasABM.Sql.Add('documentoventa_total=:documentoventa_total, ');
          ZQDocumentosventasABM.Sql.Add('documentoventa_iva105=:documentoventa_iva105, ');
          ZQDocumentosventasABM.Sql.Add('documentoventa_neto105=:documentoventa_neto105, ');
          ZQDocumentosventasABM.Sql.Add('documentoventa_iva21=:documentoventa_iva21, ');
          ZQDocumentosventasABM.Sql.Add('documentoventa_neto21=:documentoventa_neto21 ');
          ZQDocumentosventasABM.Sql.Add('where documentoventa_id=:documentoventa_id ');
          ZQDocumentosventasABM.parambyname('documentoventa_iva105').asstring:=documentoventa_iva105;
          ZQDocumentosventasABM.parambyname('documentoventa_iva21').asstring:=documentoventa_iva21;
          ZQDocumentosventasABM.parambyname('documentoventa_neto105').asstring:=documentoventa_neto105;
          ZQDocumentosventasABM.parambyname('documentoventa_neto21').asstring:=documentoventa_neto21;
          ZQDocumentosventasABM.parambyname('documentoventa_total').asstring:=documentoventa_total;
          ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=Cabecera.FieldByName('documentoventa_id').AsString;
          ZQDocumentosventasABM.ExecSQL;
      end;



    if Documentoventadocu<>nil then
      begin
          ZQDocumentoventadocus.Active:=false;
          ZQDocumentoventadocus.SQL.Text:='select * from documentoventadocus where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'" and documentoventadoc_tiporelacion="IMPUTACION"';
          ZQDocumentoventadocus.Active:=true;
          ZQDocumentoventadocus.First;
          while not ZQDocumentoventadocus.Eof do
              begin
                  ActualizarSaldoDocumentoVenta(ZQDocumentoventadocus.FieldByName('documentoventa_idpago').AsString,abs(ZQDocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat), true);
                  ZQDocumentoventadocus.Next;
              end;
          ZQDocumentoventadocus.Active:=false;

          ZQDocumentosventasABM.SQL.Text:='delete from documentoventadocus where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"';
          ZQDocumentosventasABM.ExecSQL;

          if Documentoventadocu<>nil then
            begin
                Documentoventadocu.First;
                ZQDocumentosventasABM.sql.clear;
                ZQDocumentosventasABM.sql.add('Insert into documentoventadocus (documentoventa_estado, ');
                ZQDocumentosventasABM.sql.add('documentoventa_id, documentoventa_idpago, ');
                ZQDocumentosventasABM.sql.add('documentoventa_pagado, documentoventa_saldo, ');
                ZQDocumentosventasABM.sql.add('documentoventadoc_id, documentoventadoc_importe, documentoventadoc_tiporelacion) ');
                ZQDocumentosventasABM.sql.add('values (:documentoventa_estado, :documentoventa_id, ');
                ZQDocumentosventasABM.sql.add(':documentoventa_idpago, :documentoventa_pagado, ');
                ZQDocumentosventasABM.sql.add(':documentoventa_saldo, :documentoventadoc_id, ');
                ZQDocumentosventasABM.sql.add(':documentoventadoc_importe, :documentoventadoc_tiporelacion)');
                while not Documentoventadocu.Eof do
                    begin
                        ZQDocumentosventasABM.parambyname('documentoventa_estado').asstring:=Documentoventadocu.FieldByName('documentoventa_estado').AsString;
                        ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=Cabecera.FieldByName('documentoventa_id').AsString;
                        ZQDocumentosventasABM.parambyname('documentoventa_idpago').asstring:=Documentoventadocu.FieldByName('documentoventa_idpago').AsString;
                        ZQDocumentosventasABM.parambyname('documentoventa_pagado').asstring:=Documentoventadocu.FieldByName('documentoventa_pagado').AsString;
                        ZQDocumentosventasABM.parambyname('documentoventa_saldo').asstring:=Documentoventadocu.FieldByName('documentoventa_saldo').AsString;
                        ZQDocumentosventasABM.parambyname('documentoventadoc_id').asstring:=codigo('documentoventadocus', 'documentoventadoc_id');
                        ZQDocumentosventasABM.parambyname('documentoventadoc_importe').asstring:=Documentoventadocu.FieldByName('documentoventadoc_importe').AsString;
                        ZQDocumentosventasABM.parambyname('documentoventadoc_tiporelacion').asstring:=Documentoventadocu.FieldByName('documentoventadoc_tiporelacion').AsString;
                        ZQDocumentosventasABM.ExecSQL;

                        if Documentoventadocu.FieldByName('documentoventadoc_tiporelacion').AsString='IMPUTACION' then
                          ActualizarSaldoDocumentoVenta(Documentoventadocu.FieldByName('documentoventa_idpago').AsString,Documentoventadocu.FieldByName('documentoventadoc_importe').AsFloat);

                        Documentoventadocu.Next;
                    end;

                documentoventa_pagado:=princ.buscar('select sum(documentoventadoc_importe) as pagado from documentoventadocus where documentoventa_id="'+Cabecera.FieldByName('documentoventa_id').AsString+'"','pagado');
                documentoventa_saldo:=floattostr(Cabecera.FieldByName('documentoventa_total').AsFloat-strtofloat(documentoventa_pagado));
                documentoventa_estado:='PAGADA';
                if strtofloat(documentoventa_saldo)>0then
                  documentoventa_estado:='PENDIENTE';

                ZQDocumentosventasABM.Sql.Clear;
                ZQDocumentosventasABM.Sql.Add('update documentosventas set ');
                ZQDocumentosventasABM.Sql.Add('documentoventa_saldo=:documentoventa_saldo, ');
                ZQDocumentosventasABM.Sql.Add('documentoventa_pagado=:documentoventa_pagado, ');
                ZQDocumentosventasABM.Sql.Add('documentoventa_estado=:documentoventa_estado ');
                ZQDocumentosventasABM.Sql.Add('where documentoventa_id=:documentoventa_id ');
                ZQDocumentosventasABM.ParamByName('documentoventa_saldo').AsString:=documentoventa_saldo;
                ZQDocumentosventasABM.ParamByName('documentoventa_pagado').AsString:=documentoventa_pagado;
                ZQDocumentosventasABM.ParamByName('documentoventa_estado').AsString:=documentoventa_estado;
                ZQDocumentosventasABM.ParamByName('documentoventa_id').AsString:=Cabecera.FieldByName('documentoventa_id').AsString;
                ZQDocumentosventasABM.ExecSql;

            end;
      end;


    if Pagos<>nil then
      begin
          if pagostarjeta<>nil then
            begin
                ZQDocumentopagos.Active:=false;
                ZQDocumentopagos.ParamByName('documentoventa_id').AsString:=Cabecera.FieldByName('documentoventa_id').AsString;
                ZQDocumentopagos.Active:=true;

                while not ZQDocumentopagos.Eof do
                    begin
                        ZQDocumentosventasABM.Sql.Clear;
                        ZQDocumentosventasABM.Sql.Add('delete from pagotarjeta ');
                        ZQDocumentosventasABM.Sql.Add('where documentopago_id=:documentopago_id ');
                        ZQDocumentosventasABM.ParamByName('documentopago_id').AsString:=ZQDocumentopagos.FieldByName('documentopago_id').AsString;
                        ZQDocumentosventasABM.ExecSql;

                        ZQDocumentopagos.Next;
                    end;

            end;

          ZQDocumentosventasABM.Sql.Clear;
          ZQDocumentosventasABM.Sql.Add('delete from documentopagos ');
          ZQDocumentosventasABM.Sql.Add('where documentoventa_id=:documentoventa_id ');
          ZQDocumentosventasABM.ParamByName('documentoventa_id').AsString:=Cabecera.FieldByName('documentoventa_id').AsString;
          ZQDocumentosventasABM.ExecSql;

          Pagos.First;
          while not Pagos.Eof do
              begin
                  documentopago_id:=Princ.codigo('documentopagos','documentopago_id');
                  ZQDocumentosventasABM.Sql.Clear;
                  ZQDocumentosventasABM.Sql.Add('insert into documentopagos set ');
                  ZQDocumentosventasABM.Sql.Add('documentoventa_id=:documentoventa_id, ');
                  ZQDocumentosventasABM.Sql.Add('tipopago_id=:tipopago_id, ');
                  ZQDocumentosventasABM.Sql.Add('documentopago_importe=:documentopago_importe, ');
                  ZQDocumentosventasABM.Sql.Add('documentopago_nombre=:documentopago_nombre, ');
                  ZQDocumentosventasABM.Sql.Add('documentopago_id=:documentopago_id ');
                  ZQDocumentosventasABM.ParamByName('documentoventa_id').AsString:=Cabecera.FieldByName('documentoventa_id').AsString;
                  ZQDocumentosventasABM.ParamByName('tipopago_id').AsString:=Pagos.FieldByName('tipopago_id').AsString;
                  ZQDocumentosventasABM.ParamByName('documentopago_importe').AsString:=Pagos.FieldByName('documentopago_importe').AsString;
                  ZQDocumentosventasABM.ParamByName('documentopago_nombre').AsString:=Pagos.FieldByName('documentopago_nombre').AsString;
                  ZQDocumentosventasABM.ParamByName('documentopago_id').AsString:=documentopago_id;
                  ZQDocumentosventasABM.ExecSql;


                  if pagostarjeta.Locate('documentopago_id',Pagos.FieldByName('documentopago_id').AsString,[]) then
                    begin
                        pagostarjeta.Edit;
                        pagostarjeta.FieldByName('documentopago_id').AsString:=documentopago_id;
                        pagostarjeta.Post;
                    end;


                  Pagos.Next;
              end;

          pagostarjeta.First;
          while not pagostarjeta.Eof do
              begin
                  ZQDocumentosventasABM.Sql.Clear;
                  ZQDocumentosventasABM.Sql.Add('insert into pagotarjeta set ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_recargo=:pagotarjeta_recargo, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_telefono=:pagotarjeta_telefono, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_dni=:pagotarjeta_dni, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_titular=:pagotarjeta_titular, ');
                  ZQDocumentosventasABM.Sql.Add('tarjeta_id=:tarjeta_id, ');
                  ZQDocumentosventasABM.Sql.Add('documentopago_id=:documentopago_id, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_autoriz=:pagotarjeta_autoriz, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_cupon=:pagotarjeta_cupon, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_cuotas=:pagotarjeta_cuotas, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_importe=:pagotarjeta_importe, ');
                  ZQDocumentosventasABM.Sql.Add('pagotarjeta_id=:pagotarjeta_id ');
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_recargo').AsString:=pagostarjeta.FieldByName('pagotarjeta_recargo').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_telefono').AsString:=pagostarjeta.FieldByName('pagotarjeta_telefono').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_dni').AsString:=pagostarjeta.FieldByName('pagotarjeta_dni').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_titular').AsString:=pagostarjeta.FieldByName('pagotarjeta_titular').AsString;
                  ZQDocumentosventasABM.ParamByName('tarjeta_id').AsString:=pagostarjeta.FieldByName('tarjeta_id').AsString;
                  ZQDocumentosventasABM.ParamByName('documentopago_id').AsString:=pagostarjeta.FieldByName('documentopago_id').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_autoriz').AsString:=pagostarjeta.FieldByName('pagotarjeta_autoriz').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_cupon').AsString:=pagostarjeta.FieldByName('pagotarjeta_cupon').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_cuotas').AsString:=pagostarjeta.FieldByName('pagotarjeta_cuotas').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_importe').AsString:=pagostarjeta.FieldByName('pagotarjeta_importe').AsString;
                  ZQDocumentosventasABM.ParamByName('pagotarjeta_id').AsString:=princ.codigo('pagotarjeta','pagotarjeta_id');;
                  ZQDocumentosventasABM.ExecSql;
                  pagostarjeta.Next;
              end;
      end;

    ZQDocumentosventasABM.SQL.Clear;
    ZQDocumentosventasABM.SQL.Add('commit');
    ZQDocumentosventasABM.ExecSQL;

end;


function TPrinc.QuitarCaracteresEspeciales(texto: string):string;
const
  VALIDOS=['0'..'9','A'..'Z','a'..'z','-','.',' '];
var
  i: Integer;
begin
    Result:= '';
    for i:= 1 to Length(texto) do
      if texto[i] in VALIDOS then
        Result:= Result+texto[i]

end;


function TPrinc.GetConfiguracion(config_nombre: string):string;
var
  config_valor:string;
begin
    config_valor:=Princ.buscar('select config_valor from config where config_nombre="'+config_nombre+'"','config_valor');


    result:=config_valor;
end;


function TPrinc.ImprimirFiscal(id: string; puntoventa_id:string=''):boolean;
begin
    impresorafiscal:=Timpresorafiscal.Create(self);

    if id<>'-1' then
      begin
          ZQDocumentosventas.Active:=false;
          ZQDocumentosventas.ParamByName('documentoventa_id').AsString:=id;
          ZQDocumentosventas.Active:=true;

          impresorafiscal.modelo:=ZQDocumentosventas.FieldByName('puntoventa_controladorfiscalmodelo').AsInteger;
          impresorafiscal.puerto:=ZQDocumentosventas.FieldByName('puntoventa_controladorfiscalpuerto').AsInteger;
          impresorafiscal.tipodocufiscal_id:=ZQDocumentosventas.FieldByName('tipodocufiscal_id').AsInteger;
          impresorafiscal.tipodocu_nombre:=ZQDocumentosventas.FieldByName('tipodocu_nombre').AsString;
          impresorafiscal.tipodocu_letra:=ZQDocumentosventas.FieldByName('tipodocu_letra').AsString;
          impresorafiscal.tipodocu_leyenda:=ZQDocumentosventas.FieldByName('documentoventa_observacion').AsString;
          impresorafiscal.Nombre_cliente:=QuitarCaracteresEspeciales(ZQDocumentosventas.FieldByName('cliente_nombre').AsString);
          impresorafiscal.Direccion_cliente:=QuitarCaracteresEspeciales(ZQDocumentosventas.FieldByName('cliente_domicilio').AsString);
          impresorafiscal.documentoventa_condicionventa:=ZQDocumentosventas.FieldByName('documentoventa_condicionventa').AsString;
          impresorafiscal.documentoventa_total:=ZQDocumentosventas.FieldByName('documentoventa_total').AsFloat;

          if impresorafiscal.Direccion_cliente='' then
            impresorafiscal.Direccion_cliente:='0';

          impresorafiscal.NroDocumento_cliente:=Princ.QuitarEspecialesNros(ZQDocumentosventas.FieldByName('cliente_documentonro').AsString);

          if impresorafiscal.NroDocumento_cliente='' then
            impresorafiscal.NroDocumento_cliente:='0';

          if (ZQDocumentosventas.FieldByName('tipodocu_nombre').AsString='Nota de Credito de Venta') or
             (ZQDocumentosventas.FieldByName('tipodocu_nombre').AsString='Nota de Debito de Venta') then
            impresorafiscal.embarknumber:=princ.buscar('select documentoventa_numero from documentosventas '+
                                                       'inner join documentoventadocus on documentoventadocus.documentoventa_idpago=documentosventas.documentoventa_id '+
                                                       'where documentoventadocus.documentoventa_id="'+ZQDocumentosventas.FieldByName('documentoventa_id').AsString+'"', 'documentoventa_numero');

          if ZQDocumentosventas.FieldByName('cliente_documentotipo').AsString='DNI' then
            impresorafiscal.TipoDocumento_cliente:=TIPO_DNI;

          if ZQDocumentosventas.FieldByName('cliente_documentotipo').AsString='CUIT' then
            impresorafiscal.TipoDocumento_cliente:=TIPO_CUIT;

          impresorafiscal.ResponsabilidadIVA_cliente:=ZQDocumentosventas.FieldByName('condicioniva_idfiscal').AsInteger;

//          case ZQDocumentosventas.FieldByName('condicioniva_id').AsInteger of
//              1:begin
//                    impresorafiscal.ResponsabilidadIVA_cliente:=MONOTRIBUTO;
//                end;
//              2:begin
//                    impresorafiscal.ResponsabilidadIVA_cliente:=RESPONSABLE_INSCRIPTO;
//                end;
//              3:begin
//                    impresorafiscal.ResponsabilidadIVA_cliente:=CONSUMIDOR_FINAL;
//                end;
//
//          end;

          impresorafiscal.MQDetalle.Active:=false;
          impresorafiscal.MQDetalle.Active:=True;

          ZQdocumentoventadetalles.Active:=false;
          ZQdocumentoventadetalles.SQL.Clear;
          ZQdocumentoventadetalles.SQL.Add('select * from documentoventadetalles ');
          ZQdocumentoventadetalles.SQL.Add('inner join productos on documentoventadetalles.producto_id=productos.producto_id ');
          ZQdocumentoventadetalles.SQL.Add('inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id ');
          ZQdocumentoventadetalles.SQL.Add('where documentoventa_id=:documentoventa_id');
          ZQdocumentoventadetalles.ParamByName('documentoventa_id').AsString:=id;
          ZQdocumentoventadetalles.Active:=true;


          impresorafiscal.devoluciones:=0;
          while not ZQdocumentoventadetalles.Eof do
              begin
                  impresorafiscal.MQDetalle.Insert;
                  if ZQdocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat>0 then
                    begin
                        impresorafiscal.MQDetalle.FieldByName('cantidad').AsString:=ZQdocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
                        impresorafiscal.MQDetalle.FieldByName('monto').AsString:=ZQdocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
                    end
                  else
                    begin
                        impresorafiscal.MQDetalle.FieldByName('cantidad').AsFloat:=ZQdocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat*-1;
                        impresorafiscal.MQDetalle.FieldByName('monto').AsFloat:=0.01;

                        impresorafiscal.devoluciones:=impresorafiscal.devoluciones+ZQdocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;
                    end;

                  if princ.GetConfiguracion('VENTAIMPRIMIRCODIGOPROD')='-1' then
                    impresorafiscal.MQDetalle.FieldByName('descripcion').AsString:=QuitarCaracteresEspeciales(ZQdocumentoventadetalles.FieldByName('producto_id').AsString)+' - ';

                  impresorafiscal.MQDetalle.FieldByName('descripcion').AsString:=impresorafiscal.MQDetalle.FieldByName('descripcion').AsString+QuitarCaracteresEspeciales(ZQdocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString);


                  impresorafiscal.MQDetalle.FieldByName('IVA').AsString:=ZQdocumentoventadetalles.FieldByName('tipoiva_valor').AsString;
                  impresorafiscal.MQDetalle.FieldByName('impuestosinternos').AsString:='0';

                  impresorafiscal.MQDetalle.Post;
                  ZQdocumentoventadetalles.Next;
              end;

          impresorafiscal.recargo:=ZQDocumentosventas.FieldByName('documentoventa_recargo').AsFloat;

          impresorafiscal.MQpagos.Active:=false;
          impresorafiscal.MQpagos.Active:=true;

          ZQDocumentopagos.Active:=false;
          ZQDocumentopagos.ParamByName('documentoventa_id').AsString:=id;
          ZQDocumentopagos.Active:=true;

          while not ZQDocumentopagos.Eof do
              begin
                  impresorafiscal.MQpagos.Insert;
                  impresorafiscal.MQpagos.FieldByName('descripcion').AsString:=QuitarCaracteresEspeciales(ZQDocumentopagos.FieldByName('documentopago_nombre').AsString);
                  impresorafiscal.MQpagos.FieldByName('monto').AsString:=ZQDocumentopagos.FieldByName('documentopago_importe').AsString;
                  impresorafiscal.MQpagos.Post;

                  ZQDocumentopagos.Next;
              end;

          if (impresorafiscal.Showmodal=mrOk) and (id<>'-1') then
            begin
                //MessageDlg('nro desde la impr'+inttostr(impresorafiscal.documentoventa_numero), mtInformation, [mbOK], 0);
                Princ.ActualizarNumeroDocumento(id,inttostr(impresorafiscal.documentoventa_numero));

                ZQuery1.sql.clear;
                ZQuery1.sql.add('Update documentosventas set ');
                ZQuery1.sql.add('documentoventa_fecha=:documentoventa_fecha, ');
                ZQuery1.sql.add('documentoventa_hora=:documentoventa_hora,');
                ZQuery1.sql.add('documentoventa_numero=:documentoventa_numero');
                ZQuery1.sql.add(' where documentoventa_id=:documentoventa_id');
                ZQuery1.parambyname('documentoventa_fecha').asstring:=formatdatetime('yyyy-mm-dd',impresorafiscal.documentoventa_fecha);
                ZQuery1.parambyname('documentoventa_hora').asstring:=formatdatetime('hh:nn:ss',impresorafiscal.documentoventa_fecha);
                ZQuery1.parambyname('documentoventa_numero').AsInteger:=impresorafiscal.documentoventa_numero;
                ZQuery1.parambyname('documentoventa_id').asstring:=id;
                ZQuery1.ExecSQL;
            end
          else
            MessageDlg('No se pudo imprimir el comprobante.'+#13+#10+'Verifique los datos.', mtError, [mbOK], 0);


      end;
    if id='-1' then
      begin
          impresorafiscal.tipodocu_nombre:='Reporte Z';
          impresorafiscal.modelo:=strtoint(Princ.buscar('select puntoventa_controladorfiscalmodelo from puntodeventa where puntoventa_id="'+puntoventa_id+'"','puntoventa_controladorfiscalmodelo'));
          impresorafiscal.puerto:=strtoint(Princ.buscar('select puntoventa_controladorfiscalpuerto from puntodeventa where puntoventa_id="'+puntoventa_id+'"','puntoventa_controladorfiscalpuerto'));
          impresorafiscal.Showmodal;
      end;

    if id='-2' then
      begin
          impresorafiscal.tipodocu_nombre:='Reporte X';
          impresorafiscal.modelo:=strtoint(Princ.buscar('select puntoventa_controladorfiscalmodelo from puntodeventa where puntoventa_id="'+puntoventa_id+'"','puntoventa_controladorfiscalmodelo'));
          impresorafiscal.puerto:=strtoint(Princ.buscar('select puntoventa_controladorfiscalpuerto from puntodeventa where puntoventa_id="'+puntoventa_id+'"','puntoventa_controladorfiscalpuerto'));
          impresorafiscal.Showmodal;
      end;

    impresorafiscal.Free;

    result:=false;
end;

function TPrinc.CargarDocumentoVentaDocu(cliente_id: string; QDocumentoVentaDocus:TDataset;documentoventa_apagar:real;AgregarAutomatico:boolean;where_tipodocu:string=' and 1=1 '):boolean;
begin
    DocumentosVentasPendientes:=TDocumentosVentasPendientes.Create(self);
    DocumentosVentasPendientes.cliente_id:=cliente_id;
    DocumentosVentasPendientes.where_tipodocu:=where_tipodocu;
    DocumentosVentasPendientes.ActivarConsulta;
    DocumentosVentasPendientes.documentoventa_apagar:=roundto(documentoventa_apagar,-2);
    QDocumentoVentaDocus.First;
    while not QDocumentoVentaDocus.Eof do
        begin
            if DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Locate('documentoventa_id',QDocumentoVentaDocus.FieldByName('documentoventa_idpago').AsString,[]) then
              begin
                  DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Edit;
                  DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat:=roundto(QDocumentoVentaDocus.FieldByName('documentoventadoc_importe').AsFloat,-2);

                  DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Post;

              end;

            QDocumentoVentaDocus.Next;
        end;
    if AgregarAutomatico then
      begin
          DocumentosVentasPendientes.btnimputardocumentos.Click;
      end
    else
      begin
          DocumentosVentasPendientes.Showmodal;
      end;




    if DocumentosVentasPendientes.ModalResult=mrOk then
      begin
          DocumentosVentasPendientes.ZQDocumentosVentasPendientes.First;
          while not DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Eof do
              begin
                  if DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat<>0 then
                    begin
                        if QDocumentoVentaDocus.Locate('documentoventa_idpago',DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_id').AsString,[]) then
                          QDocumentoVentaDocus.Edit
                        else
                          QDocumentoVentaDocus.Insert;

                        QDocumentoVentaDocus.FieldByName('documentoventa_id').AsString:='0';
                        QDocumentoVentaDocus.FieldByName('documentoventa_numero').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_numero').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_fecha').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_fecha').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_hora').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_hora').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_total').AsFloat:=roundto(DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_total').AsFloat,-2);
                        QDocumentoVentaDocus.FieldByName('documentoventa_estado').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_estado').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_pagado').AsFloat:=roundto(DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_pagado').AsFloat+abs(DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat),-2);
                        QDocumentoVentaDocus.FieldByName('documentoventa_saldo').AsFloat:=roundto(DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat-abs(DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat),-2);
                        QDocumentoVentaDocus.FieldByName('cliente_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('cliente_id').AsString;
                        QDocumentoVentaDocus.FieldByName('personal_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('personal_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_id_1').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_nombre').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_nombre').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_tipo').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_tipo').AsString;
                        QDocumentoVentaDocus.FieldByName('puntoventa_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_letra').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_letra').AsString;
                        QDocumentoVentaDocus.FieldByName('puntoventa_id_1').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoVentaDocus.FieldByName('puntoventa_numero').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_numero').AsString;
                        QDocumentoVentaDocus.FieldByName('sucursal_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('sucursal_id').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventadoc_importe').AsFloat:=roundto(DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat,-2);
                        QDocumentoVentaDocus.FieldByName('documentoventadoc_id').AsString:='0';
                        QDocumentoVentaDocus.FieldByName('documentoventa_idpago').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_id').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_id_1').AsString:='0';
                        QDocumentoVentaDocus.FieldByName('documentoventadoc_tiporelacion').AsString:='IMPUTACION';
                        QDocumentoVentaDocus.Post;


                    end;


                  DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Next;
              end;

          result:=true;
      end
    else
      result:=false;

    DocumentosVentasPendientes.Free;





end;


function TPrinc.CargarDocumentoCompraDocu(proveedor_id: string; QDocumentoCompraDocus:TDataset;documentocompra_apagar:real;AgregarAutomatico:boolean;where_tipodocu:string=' and 1=1 '):boolean;
begin
    DocumentosComprasPendientes:=TDocumentosComprasPendientes.Create(self);
    DocumentosComprasPendientes.proveedor_id:=proveedor_id;
    DocumentosComprasPendientes.where_tipodocu:=where_tipodocu;
    DocumentosComprasPendientes.ActivarConsulta;
    DocumentosComprasPendientes.documentocompra_apagar:=roundto(documentocompra_apagar,-2);
    QDocumentoCompraDocus.First;
    while not QDocumentoCompraDocus.Eof do
        begin
            if DocumentosComprasPendientes.ZQDocumentosComprasPendientes.Locate('documentocompra_id',QDocumentoCompraDocus.FieldByName('documentocompra_idpago').AsString,[]) then
              begin
                  DocumentosComprasPendientes.ZQDocumentosComprasPendientes.Edit;
                  DocumentosComprasPendientes.ZQDocumentosComprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=roundto(QDocumentoCompraDocus.FieldByName('documentocompradoc_importe').AsFloat,-2);

                  DocumentosComprasPendientes.ZQDocumentosComprasPendientes.Post;

              end;

            QDocumentoCompraDocus.Next;
        end;
    if AgregarAutomatico then
      begin
          DocumentosComprasPendientes.btnimputardocumentos.Click;
      end
    else
      begin
          DocumentosComprasPendientes.Showmodal;
      end;




    if DocumentosComprasPendientes.ModalResult=mrOk then
      begin
          DocumentosComprasPendientes.ZQDocumentosComprasPendientes.First;
          while not DocumentosComprasPendientes.ZQDocumentosComprasPendientes.Eof do
              begin
                  if DocumentosComprasPendientes.ZQDocumentosComprasPendientes.FieldByName('documentocompradoc_importe').AsFloat<>0 then
                    begin
                        if QDocumentoCompraDocus.Locate('documentocompra_idpago',DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_id').AsString,[]) then
                          QDocumentocompraDocus.Edit
                        else
                          QDocumentocompraDocus.Insert;

                        QDocumentocompraDocus.FieldByName('documentocompra_id').AsString:='0';
                        QDocumentocompraDocus.FieldByName('documentocompra_numero').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_numero').AsString;
                        QDocumentocompraDocus.FieldByName('documentocompra_fecha').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_fecha').AsString;
                        QDocumentocompraDocus.FieldByName('documentocompra_hora').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_hora').AsString;
                        QDocumentocompraDocus.FieldByName('documentocompra_total').AsFloat:=roundto(DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_total').AsFloat,-2);
                        QDocumentocompraDocus.FieldByName('documentocompra_estado').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_estado').AsString;
                        QDocumentocompraDocus.FieldByName('documentocompra_pagado').AsFloat:=roundto(DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_pagado').AsFloat+abs(DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat),-2);
                        QDocumentocompraDocus.FieldByName('documentocompra_saldo').AsFloat:=roundto(DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_saldo').AsFloat-abs(DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat),-2);
                        QDocumentocompraDocus.FieldByName('proveedor_id').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('proveedor_id').AsString;
                        QDocumentocompraDocus.FieldByName('personal_id').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('personal_id').AsString;
                        QDocumentocompraDocus.FieldByName('tipodocu_id').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentocompraDocus.FieldByName('tipodocu_id_1').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentocompraDocus.FieldByName('tipodocu_nombre').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('tipodocu_nombre').AsString;
                        QDocumentocompraDocus.FieldByName('tipodocu_tipo').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('tipodocu_tipo').AsString;
                        QDocumentocompraDocus.FieldByName('puntoventa_id').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentocompraDocus.FieldByName('tipodocu_letra').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('tipodocu_letra').AsString;
                        QDocumentocompraDocus.FieldByName('puntoventa_id_1').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentocompraDocus.FieldByName('puntoventa_numero').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('puntoventa_numero').AsString;
                        QDocumentocompraDocus.FieldByName('sucursal_id').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('sucursal_id').AsString;
                        QDocumentocompraDocus.FieldByName('documentocompradoc_importe').AsFloat:=roundto(DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat,-2);
                        QDocumentocompraDocus.FieldByName('documentocompradoc_id').AsString:='0';
                        QDocumentocompraDocus.FieldByName('documentocompra_idpago').AsString:=DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.FieldByName('documentocompra_id').AsString;
                        QDocumentocompraDocus.FieldByName('documentocompra_id_1').AsString:='0';
                        QDocumentocompraDocus.FieldByName('documentocompradoc_tiporelacion').AsString:='IMPUTACION';
                        QDocumentocompraDocus.Post;


                    end;


                  DocumentoscomprasPendientes.ZQDocumentoscomprasPendientes.Next;
              end;

          result:=true;
      end
    else
      result:=false;

    DocumentoscomprasPendientes.Free;





end;


procedure TPrinc.ActualizarNumeroDocumento(tipodocu_id: string; tipodocu_ultimonumero:string);
var
  tipodocu_numero:string;
begin
    if tipodocu_ultimonumero<>'0' then
      begin
          ZQActualizarSaldoDocumentoVenta.Active:=false;
          ZQActualizarSaldoDocumentoVenta.SQL.Text:='update tiposdocumento set tipodocu_ultimonumero="'+tipodocu_ultimonumero+'" where tipodocu_id="'+tipodocu_id+'"';
          ZQActualizarSaldoDocumentoVenta.ExecSQL;
      end;
end;


function TPrinc.CargarPago(importe:real; QDocumentopagos: TDataSet; QPagoTarjeta:TDataset):boolean;
begin
    CargaDetallePagos:=TCargaDetallePagos.Create(self);
    CargaDetallePagos.documentopago_importe:=importe;
    CargaDetallePagos.liberar_al_cerrar:=false;
    CargaDetallePagos.PageControl1.ActivePage:=CargaDetallePagos.TabSheet1;
    if CargaDetallePagos.ShowModal=mrOK then
      begin
          QDocumentopagos.Last;
          QDocumentopagos.Append;
          QDocumentopagos.FieldByName('documentopago_id').AsInteger:=QDocumentopagos.RecordCount;
          QDocumentopagos.FieldByName('documentopago_nombre').AsString:=CargaDetallePagos.documentopago_nombre;
          QDocumentopagos.FieldByName('documentopago_importe').AsFloat:=CargaDetallePagos.documentopago_importe;
          QDocumentopagos.FieldByName('tipopago_id').AsString:=CargaDetallePagos.tipopago_id;
          QDocumentopagos.FieldByName('tipopago_nombre').AsString:=CargaDetallePagos.tipopago_nombre;
          QDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
          QDocumentopagos.Post;


          case strtoint(CargaDetallePagos.tipopago_id) of
              1:begin

                end;
              2:begin
                    QPagoTarjeta.Last;
                    QPagoTarjeta.Append;
                    QPagoTarjeta.FieldByName('pagotarjeta_id').AsFloat:=QPagoTarjeta.RecordCount;
                    QPagoTarjeta.FieldByName('pagotarjeta_importe').AsFloat:=CargaDetallePagos.documentopago_importe;
                    QPagoTarjeta.FieldByName('pagotarjeta_cuotas').AsString:=CargaDetallePagos.tarjeta_cuotas.Text;
                    QPagoTarjeta.FieldByName('pagotarjeta_cupon').AsString:=CargaDetallePagos.tarjeta_cupon.Text;
                    QPagoTarjeta.FieldByName('pagotarjeta_autoriz').AsString:=CargaDetallePagos.tarjeta_autorizacion.Text;
                    QPagoTarjeta.FieldByName('documentopago_id').AsString:=QDocumentopagos.FieldByName('documentopago_id').AsString;
                    QPagoTarjeta.FieldByName('tarjeta_id').AsString:=CargaDetallePagos.tarjeta_id.codigo;
                    QPagoTarjeta.FieldByName('pagotarjeta_titular').AsString:=CargaDetallePagos.tarjeta_titular.Text;
                    QPagoTarjeta.FieldByName('pagotarjeta_dni').AsString:=CargaDetallePagos.tarjeta_dni.Text;
                    QPagoTarjeta.FieldByName('pagotarjeta_telefono').AsString:=CargaDetallePagos.tarjeta_telefono.Text;
                    QPagoTarjeta.FieldByName('pagotarjeta_recargo').AsString:=CargaDetallePagos.tarjeta_importeinteres.Text;
                    QPagoTarjeta.Post;
                end;
              3:begin

                end;
              4:begin

                end;
          end;


          Result:=true;

      end;

    CargaDetallePagos.Free;


end;


function TPrinc.CargarCompraPago(importe:real; QDocumentocomprapagos: TDataSet; QPagoTarjeta:TDataset):boolean;
begin
    CargarPagos:=TCargarPagos.Create(self);
    CargarPagos.documentopago_importe.Value:=importe;
    if CargarPagos.ShowModal=mrOK then
      begin
          QDocumentocomprapagos.Last;
          QDocumentocomprapagos.Append;
          QDocumentocomprapagos.FieldByName('documentocomprapago_id').AsInteger:=QDocumentocomprapagos.RecordCount;
          QDocumentocomprapagos.FieldByName('documentocomprapago_nombre').AsString:=CargarPagos.documentopago_nombre.Text;
          QDocumentocomprapagos.FieldByName('documentocomprapago_importe').AsFloat:=CargarPagos.documentopago_importe.Value;
          QDocumentocomprapagos.FieldByName('tipopago_id').AsString:=CargarPagos.tipopago_id.codigo;
          QDocumentocomprapagos.FieldByName('tipopago_nombre').AsString:=CargarPagos.tipopago_id.Text;
          QDocumentocomprapagos.FieldByName('documentocompra_id').AsString:='0';
          QDocumentocomprapagos.Post;

          Result:=true;

      end;

    CargarPagos.Free;


end;

procedure TPrinc.AgregarRecibo(ZQCabecera: TDataset; ZQDetalle: TDataset; ZQPagos: TDataset);
var
  id:string;
begin
    ZQRecibos.SQL.Clear;
    ZQRecibos.SQL.Add('begin');
    ZQRecibos.ExecSQL;

    id:=codigo('documentosventas', 'documentoventa_id');

    ZQRecibos.sql.clear;
    ZQRecibos.sql.add('Insert into documentosventas (cliente_id, documentoventa_condicionventa, ');
    ZQRecibos.sql.add('documentoventa_estado, documentoventa_fecha, documentoventa_fechavenc, ');
    ZQRecibos.sql.add('documentoventa_hora, documentoventa_id, documentoventa_iva105, ');
    ZQRecibos.sql.add('documentoventa_iva21, documentoventa_listaprecio, documentoventa_neto105, ');
    ZQRecibos.sql.add('documentoventa_neto21, documentoventa_netonogravado, documentoventa_numero, ');
    ZQRecibos.sql.add('documentoventa_observacion, documentoventa_pagado, documentoventa_saldo, ');
    ZQRecibos.sql.add('documentoventa_total, personal_id, tipodocu_id, documentoventa_nrodetallepago) ');
    ZQRecibos.sql.add('values (:cliente_id, :documentoventa_condicionventa, ');
    ZQRecibos.sql.add(':documentoventa_estado, :documentoventa_fecha, :documentoventa_fechavenc, ');
    ZQRecibos.sql.add(':documentoventa_hora, :documentoventa_id, :documentoventa_iva105, ');
    ZQRecibos.sql.add(':documentoventa_iva21, :documentoventa_listaprecio, :documentoventa_neto105, ');
    ZQRecibos.sql.add(':documentoventa_neto21, :documentoventa_netonogravado, :documentoventa_numero, ');
    ZQRecibos.sql.add(':documentoventa_observacion, :documentoventa_pagado, :documentoventa_saldo, ');
    ZQRecibos.sql.add(':documentoventa_total, :personal_id, :tipodocu_id, :documentoventa_nrodetallepago)');
    ZQRecibos.parambyname('cliente_id').asstring:=ZQCabecera.FieldByName('cliente_id').AsString;
    ZQRecibos.parambyname('documentoventa_condicionventa').asstring:=ZQCabecera.FieldByName('documentoventa_condicionventa').AsString;
    ZQRecibos.parambyname('documentoventa_estado').asstring:=ZQCabecera.FieldByName('documentoventa_estado').AsString;
    ZQRecibos.parambyname('documentoventa_fecha').asstring:=formatdatetime('yyyy-mm-dd',ZQCabecera.FieldByName('documentoventa_fecha').AsDateTime);
    ZQRecibos.parambyname('documentoventa_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',ZQCabecera.FieldByName('documentoventa_fechavenc').AsDateTime);
    ZQRecibos.parambyname('documentoventa_hora').asstring:=timetostr(Time);
    ZQRecibos.parambyname('documentoventa_id').asstring:=id;
    ZQRecibos.parambyname('documentoventa_iva105').asstring:=ZQCabecera.FieldByName('documentoventa_iva105').AsString;
    ZQRecibos.parambyname('documentoventa_iva21').asstring:=ZQCabecera.FieldByName('documentoventa_iva21').AsString;
    ZQRecibos.parambyname('documentoventa_listaprecio').asstring:=ZQCabecera.FieldByName('documentoventa_listaprecio').AsString;
    ZQRecibos.parambyname('documentoventa_neto105').asstring:=ZQCabecera.FieldByName('documentoventa_neto105').AsString;
    ZQRecibos.parambyname('documentoventa_neto21').asstring:=ZQCabecera.FieldByName('documentoventa_neto21').AsString;
    ZQRecibos.parambyname('documentoventa_netonogravado').asstring:=ZQCabecera.FieldByName('documentoventa_netonogravado').AsString;
    ZQRecibos.parambyname('documentoventa_numero').asstring:=ZQCabecera.FieldByName('documentoventa_numero').AsString;
    ZQRecibos.parambyname('documentoventa_observacion').asstring:=ZQCabecera.FieldByName('documentoventa_observacion').AsString;
    ZQRecibos.parambyname('documentoventa_pagado').asstring:=ZQCabecera.FieldByName('documentoventa_pagado').AsString;
    ZQRecibos.parambyname('documentoventa_saldo').asstring:=ZQCabecera.FieldByName('documentoventa_saldo').AsString;
    ZQRecibos.parambyname('documentoventa_total').asstring:=ZQCabecera.FieldByName('documentoventa_total').AsString;
    ZQRecibos.parambyname('personal_id').asstring:=ZQCabecera.FieldByName('personal_id').AsString;
    ZQRecibos.parambyname('tipodocu_id').asstring:=ZQCabecera.FieldByName('tipodocu_id').AsString;
    ZQRecibos.parambyname('documentoventa_nrodetallepago').asstring:=ZQCabecera.FieldByName('documentoventa_nrodetallepago').AsString;
    ZQRecibos.ExecSQL;

    ActualizarNumeroDocumento(ZQCabecera.FieldByName('tipodocu_id').AsString,ZQCabecera.FieldByName('documentoventa_numero').AsString);

    if ZQDetalle<>nil then
      begin
          ZQDetalle.First;
          while not ZQDetalle.Eof do
              begin
                  ZQRecibos.sql.clear;
                  ZQRecibos.sql.add('Insert into documentoventadocus (documentoventa_estado, ');
                  ZQRecibos.sql.add('documentoventa_id, documentoventa_idpago, ');
                  ZQRecibos.sql.add('documentoventa_pagado, documentoventa_saldo, ');
                  ZQRecibos.sql.add('documentoventadoc_id, documentoventadoc_importe) ');
                  ZQRecibos.sql.add('values (:documentoventa_estado, :documentoventa_id, ');
                  ZQRecibos.sql.add(':documentoventa_idpago, :documentoventa_pagado, ');
                  ZQRecibos.sql.add(':documentoventa_saldo, :documentoventadoc_id, ');
                  ZQRecibos.sql.add(':documentoventadoc_importe)');
                  ZQRecibos.parambyname('documentoventa_estado').asstring:=ZQDetalle.FieldByName('documentoventa_estado').AsString;
                  ZQRecibos.parambyname('documentoventa_id').asstring:=id;
                  ZQRecibos.parambyname('documentoventa_idpago').asstring:=ZQDetalle.FieldByName('documentoventa_idpago').AsString;
                  ZQRecibos.parambyname('documentoventa_pagado').asstring:=ZQDetalle.FieldByName('documentoventa_pagado').AsString;
                  ZQRecibos.parambyname('documentoventa_saldo').asstring:=ZQDetalle.FieldByName('documentoventa_saldo').AsString;
                  ZQRecibos.parambyname('documentoventadoc_id').asstring:=codigo('documentoventadocus', 'documentoventadoc_id');
                  ZQRecibos.parambyname('documentoventadoc_importe').asstring:=ZQDetalle.FieldByName('documentoventadoc_importe').AsString;
                  ZQRecibos.ExecSQL;

                  ActualizarSaldoDocumentoVenta(ZQDetalle.FieldByName('documentoventa_idpago').AsString,abs(ZQDetalle.FieldByName('documentoventadoc_importe').AsFloat));

                  ZQDetalle.Next;
              end;




      end;

    if ZQPagos<>nil then
      begin
          ZQPagos.First;
          while not ZQPagos.Eof do
              begin
                  ZQRecibos.sql.clear;
                  ZQRecibos.sql.add('Insert into documentopagos (documentopago_id, ');
                  ZQRecibos.sql.add('documentopago_importe, documentopago_nombre, ');
                  ZQRecibos.sql.add('documentoventa_id, tipopago_id) ');
                  ZQRecibos.sql.add('values (:documentopago_id, :documentopago_importe, ');
                  ZQRecibos.sql.add(':documentopago_nombre, :documentoventa_id, ');
                  ZQRecibos.sql.add(':tipopago_id)');
                  ZQRecibos.parambyname('documentopago_id').asstring:=codigo('documentopagos', 'documentopago_id');
                  ZQRecibos.parambyname('documentopago_importe').asstring:=ZQPagos.FieldByName('documentopago_importe').AsString;
                  ZQRecibos.parambyname('documentopago_nombre').asstring:=ZQPagos.FieldByName('documentopago_nombre').AsString;
                  ZQRecibos.parambyname('documentoventa_id').asstring:=id;
                  ZQRecibos.parambyname('tipopago_id').asstring:=ZQPagos.FieldByName('tipopago_id').AsString;
                  ZQRecibos.ExecSQL;

                  ZQPagos.Next;
              end;

      end;

    ZQRecibos.SQL.Clear;
    ZQRecibos.SQL.Add('commit');
    ZQRecibos.ExecSQL;

end;


procedure TPrinc.AgregarOrdendePago(ZQCabecera: TDataset; ZQDetalle: TDataset; ZQPagos: TDataset);
var
  id:string;
begin
    ZQRecibos.SQL.Clear;
    ZQRecibos.SQL.Add('begin');
    ZQRecibos.ExecSQL;

    id:=codigo('documentoscompras', 'documentocompra_id');

    ZQOrdendePago.Sql.Clear;
    ZQOrdendePago.Sql.Add('insert into documentoscompras set ');
    ZQOrdendePago.Sql.Add('documentocompra_dgrperc=:documentocompra_dgrperc, ');
    ZQOrdendePago.Sql.Add('documentocompra_dgrret=:documentocompra_dgrret, ');
    ZQOrdendePago.Sql.Add('documentocompra_ivaperc=:documentocompra_ivaperc, ');
    ZQOrdendePago.Sql.Add('documentocompra_ivaret=:documentocompra_ivaret, ');
    ZQOrdendePago.Sql.Add('documentocompra_tishhperc=:documentocompra_tishhperc, ');
    ZQOrdendePago.Sql.Add('documentocompra_nogravado=:documentocompra_nogravado, ');
    ZQOrdendePago.Sql.Add('documentocompra_iva27=:documentocompra_iva27, ');
    ZQOrdendePago.Sql.Add('documentocompra_neto27=:documentocompra_neto27, ');
    ZQOrdendePago.Sql.Add('documentocompra_puntoventa=:documentocompra_puntoventa, ');
    ZQOrdendePago.Sql.Add('documentocompra_otrosimpuestos=:documentocompra_otrosimpuestos, ');
    ZQOrdendePago.Sql.Add('documentocompra_iva105=:documentocompra_iva105, ');
    ZQOrdendePago.Sql.Add('documentocompra_neto105=:documentocompra_neto105, ');
    ZQOrdendePago.Sql.Add('documentocompra_iva21=:documentocompra_iva21, ');
    ZQOrdendePago.Sql.Add('documentocompra_neto21=:documentocompra_neto21, ');
    ZQOrdendePago.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQOrdendePago.Sql.Add('proveedor_id=:proveedor_id, ');
    ZQOrdendePago.Sql.Add('personal_id=:personal_id, ');
    ZQOrdendePago.Sql.Add('documentocompra_fechavenc=:documentocompra_fechavenc, ');
    ZQOrdendePago.Sql.Add('documentocompra_condicionventa=:documentocompra_condicionventa, ');
    ZQOrdendePago.Sql.Add('documentocompra_observacion=:documentocompra_observacion, ');
    ZQOrdendePago.Sql.Add('documentocompra_saldo=:documentocompra_saldo, ');
    ZQOrdendePago.Sql.Add('documentocompra_pagado=:documentocompra_pagado, ');
    ZQOrdendePago.Sql.Add('documentocompra_estado=:documentocompra_estado, ');
    ZQOrdendePago.Sql.Add('documentocompra_total=:documentocompra_total, ');
    ZQOrdendePago.Sql.Add('documentocompra_hora=:documentocompra_hora, ');
    ZQOrdendePago.Sql.Add('documentocompra_fecha=:documentocompra_fecha, ');
    ZQOrdendePago.Sql.Add('documentocompra_numero=:documentocompra_numero, ');
    ZQOrdendePago.Sql.Add('documentocompra_id=:documentocompra_id ');

    ZQOrdendePago.ParamByName('documentocompra_dgrperc').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_dgrret').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_ivaperc').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_ivaret').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_tishhperc').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_nogravado').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_iva27').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_neto27').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_puntoventa').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_otrosimpuestos').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_iva105').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_neto105').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_iva21').AsString:='0';
    ZQOrdendePago.ParamByName('documentocompra_neto21').AsString:='0';
    ZQOrdendePago.ParamByName('tipodocu_id').AsString:=ZQCabecera.FieldByName('tipodocu_id').AsString;
    ZQOrdendePago.ParamByName('proveedor_id').AsString:=ZQCabecera.FieldByName('proveedor_id').AsString;
    ZQOrdendePago.ParamByName('personal_id').AsString:=ZQCabecera.FieldByName('personal_id').AsString;
    ZQOrdendePago.ParamByName('documentocompra_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',ZQCabecera.FieldByName('documentocompra_fechavenc').AsDateTime);
    ZQOrdendePago.ParamByName('documentocompra_condicionventa').AsString:=ZQCabecera.FieldByName('documentocompra_condicionventa').AsString;
    ZQOrdendePago.ParamByName('documentocompra_observacion').AsString:=ZQCabecera.FieldByName('documentocompra_observacion').AsString;
    ZQOrdendePago.ParamByName('documentocompra_saldo').AsString:=ZQCabecera.FieldByName('documentocompra_saldo').AsString;
    ZQOrdendePago.ParamByName('documentocompra_pagado').AsString:=ZQCabecera.FieldByName('documentocompra_pagado').AsString;
    ZQOrdendePago.ParamByName('documentocompra_estado').AsString:=ZQCabecera.FieldByName('documentocompra_estado').AsString;
    ZQOrdendePago.ParamByName('documentocompra_total').AsString:=ZQCabecera.FieldByName('documentocompra_total').AsString;
    ZQOrdendePago.ParamByName('documentocompra_hora').AsString:=ZQCabecera.FieldByName('documentocompra_hora').AsString;
    ZQOrdendePago.ParamByName('documentocompra_fecha').AsString:=formatdatetime('yyyy-mm-dd',ZQCabecera.FieldByName('documentocompra_fecha').AsDateTime);
    ZQOrdendePago.ParamByName('documentocompra_numero').AsString:=ZQCabecera.FieldByName('documentocompra_numero').AsString;
    ZQOrdendePago.ParamByName('documentocompra_id').AsString:=id;
    ZQOrdendePago.ExecSql;


    ActualizarNumeroDocumento(ZQCabecera.FieldByName('tipodocu_id').AsString,ZQCabecera.FieldByName('documentocompra_numero').AsString);

    if ZQDetalle<>nil then
      begin
          ZQDetalle.First;
          while not ZQDetalle.Eof do
              begin
                  ZQOrdendePago.sql.clear;
                  ZQOrdendePago.sql.add('Insert into documentocompradocus (documentocompra_estado, ');
                  ZQOrdendePago.sql.add('documentocompra_id, documentocompra_idpago, ');
                  ZQOrdendePago.sql.add('documentocompra_pagado, documentocompra_saldo, ');
                  ZQOrdendePago.sql.add('documentocompradoc_id, documentocompradoc_importe) ');
                  ZQOrdendePago.sql.add('values (:documentocompra_estado, :documentocompra_id, ');
                  ZQOrdendePago.sql.add(':documentocompra_idpago, :documentocompra_pagado, ');
                  ZQOrdendePago.sql.add(':documentocompra_saldo, :documentocompradoc_id, ');
                  ZQOrdendePago.sql.add(':documentocompradoc_importe)');
                  ZQOrdendePago.parambyname('documentocompra_estado').asstring:=ZQDetalle.FieldByName('documentocompra_estado').AsString;
                  ZQOrdendePago.parambyname('documentocompra_id').asstring:=id;
                  ZQOrdendePago.parambyname('documentocompra_idpago').asstring:=ZQDetalle.FieldByName('documentocompra_idpago').AsString;
                  ZQOrdendePago.parambyname('documentocompra_pagado').asstring:=ZQDetalle.FieldByName('documentocompra_pagado').AsString;
                  ZQOrdendePago.parambyname('documentocompra_saldo').asstring:=ZQDetalle.FieldByName('documentocompra_saldo').AsString;
                  ZQOrdendePago.parambyname('documentocompradoc_id').asstring:=codigo('documentocompradocus', 'documentocompradoc_id');
                  ZQOrdendePago.parambyname('documentocompradoc_importe').asstring:=ZQDetalle.FieldByName('documentocompradoc_importe').AsString;
                  ZQOrdendePago.ExecSQL;

                  ActualizarSaldoDocumentoCompra(ZQDetalle.FieldByName('documentocompra_idpago').AsString,abs(ZQDetalle.FieldByName('documentocompradoc_importe').AsFloat));

                  ZQDetalle.Next;
              end;




      end;

    if ZQPagos<>nil then
      begin
          ZQPagos.First;
          while not ZQPagos.Eof do
              begin
                  ZQOrdendePago.sql.clear;
                  ZQOrdendePago.sql.add('Insert into documentocomprapagos (documentocomprapago_id, ');
                  ZQOrdendePago.sql.add('documentocomprapago_importe, documentocomprapago_nombre, ');
                  ZQOrdendePago.sql.add('documentocompra_id, tipopago_id) ');
                  ZQOrdendePago.sql.add('values (:documentocomprapago_id, :documentocomprapago_importe, ');
                  ZQOrdendePago.sql.add(':documentocomprapago_nombre, :documentocompra_id, ');
                  ZQOrdendePago.sql.add(':tipopago_id)');
                  ZQOrdendePago.parambyname('documentocomprapago_id').asstring:=codigo('documentocomprapagos', 'documentocomprapago_id');
                  ZQOrdendePago.parambyname('documentocomprapago_importe').asstring:=ZQPagos.FieldByName('documentocomprapago_importe').AsString;
                  ZQOrdendePago.parambyname('documentocomprapago_nombre').asstring:=ZQPagos.FieldByName('documentocomprapago_nombre').AsString;
                  ZQOrdendePago.parambyname('documentocompra_id').asstring:=id;
                  ZQOrdendePago.parambyname('tipopago_id').asstring:=ZQPagos.FieldByName('tipopago_id').AsString;
                  ZQOrdendePago.ExecSQL;

                  ZQPagos.Next;
              end;

      end;

    ZQRecibos.SQL.Clear;
    ZQRecibos.SQL.Add('commit');
    ZQRecibos.ExecSQL;

end;


procedure TPrinc.ActualizarSaldoDocumentoVenta(id: string; importe: Real; inversa:boolean=false);
var
  importe_real:real;
begin
    importe_real:=importe;
    if inversa then
      importe_real:=importe*-1;

    ZQActualizarSaldoDocumentoVenta.Active:=false;
    ZQActualizarSaldoDocumentoVenta.SQL.Text:='call actualizarsaldoventa("'+id+'","'+floattostr(importe_real)+'")';

    ZQActualizarSaldoDocumentoVenta.ExecSQL;



end;

procedure TPrinc.ActualizarSaldoDocumentoCompra(id: string; importe: Real; inversa:boolean=false);
var
  importe_real:real;
begin
    importe_real:=importe;
    if inversa then
      importe_real:=importe*-1;

    ZQActualizarSaldoDocumentoCompra.Active:=false;
    ZQActualizarSaldoDocumentoCompra.SQL.Text:='call actualizarsaldocompra("'+id+'","'+floattostr(importe_real)+'")';

    ZQActualizarSaldoDocumentoCompra.ExecSQL;



end;


function TPrinc.GetPrecioVentaBase(producto_preciocosto: Real; calculoprecio_id: string):real;
var
  producto_precioventabase:real;
begin
    producto_precioventabase:=producto_preciocosto;
    ZQCalculopreciodeta.Active:=false;
    ZQCalculopreciodeta.ParamByName('calculoprecio_id').AsString:=calculoprecio_id;
    ZQCalculopreciodeta.Active:=true;
    ZQCalculopreciodeta.First;
    while not ZQCalculopreciodeta.Eof do
        begin
            if ZQCalculopreciodeta.FieldByName('calculopreciodeta_tipo').AsString='Porcentaje' then
              begin
                  producto_precioventabase:=producto_precioventabase+(producto_precioventabase*ZQCalculopreciodeta.FieldByName('calculopreciodeta_valor').AsFloat/100);
              end
            else
              begin
                  producto_precioventabase:=producto_precioventabase+ZQCalculopreciodeta.FieldByName('calculopreciodeta_valor').AsFloat;
              end;
            ZQCalculopreciodeta.Next;
        end;

    ZQCalculopreciodeta.Active:=false;

    Result:=producto_precioventabase;
end;

function TPrinc.GetPrecioVentaBaseprod(producto_precioventabase:real;producto_id:string):real;
begin
    ZQCalculopreciodetaprod.Active:=false;
    ZQCalculopreciodetaprod.ParamByName('producto_id').AsString:=producto_id;
    ZQCalculopreciodetaprod.Active:=true;
    ZQCalculopreciodetaprod.First;
    while not ZQCalculopreciodetaprod.Eof do
        begin
            if ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_tipo').AsString='Porcentaje' then
              begin
                  producto_precioventabase:=producto_precioventabase+(producto_precioventabase*ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsFloat/100);
              end
            else
              begin
                  producto_precioventabase:=producto_precioventabase+ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsFloat;
              end;
            ZQCalculopreciodetaprod.Next;
        end;

    ZQCalculopreciodetaprod.Active:=false;

    Result:=producto_precioventabase;
end;

function TPrinc.NumeroDocumento(tipodocu_id:string; documentoventa_numero:string):string;
var
  tipodocu_numero:string;
  tipodocu_manual:boolean;
begin
    tipodocu_manual:=strtobool(princ.GetConfigTipoDocumento('',tipodocu_id,'tipodocu_manual'));
    if (not tipodocu_manual) or (documentoventa_numero='') then
      begin
          tipodocu_numero:=princ.buscar('select tipodocu_ultimonumero from tiposdocumento where tipodocu_id="'+tipodocu_id+'"','tipodocu_ultimonumero');
          if tipodocu_numero<>'' then
            begin
                tipodocu_numero:=inttostr(strtoint(tipodocu_numero)+1);
            end
          else
            tipodocu_numero:='1';

      end
    else
      tipodocu_numero:=documentoventa_numero;

    result:=tipodocu_numero;
end;

procedure TPrinc.actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
var
  tipodocu_stock:integer;
begin
    if tipodocu_id<>'' then
      begin
          tipodocu_stock:=strtoint(Princ.buscar('select tipodocu_stock from tiposdocumento where tipodocu_id="'+tipodocu_id+'"','tipodocu_stock'));

          if tipodocu_stock<>0 then
            begin
                if tipodocu_stock=1 then
                  cantidad:= cantidad*-1;

                if inversa then
                  cantidad:= cantidad*-1;

                ZQActualizarStock.SQL.Clear;
                ZQActualizarStock.SQL.Text:='call actualizarstockproductos("'+producto_id+'","'+dep_id+'","'+floattostr(cantidad)+'")';
                ZQActualizarStock.ExecSQL;
            end;

      end
    else
      begin
          if inversa then
            cantidad:= cantidad*-1;

          ZQActualizarStock.SQL.Clear;
          ZQActualizarStock.SQL.Text:='call actualizarstockproductos("'+producto_id+'","'+dep_id+'","'+floattostr(cantidad)+'")';
          ZQActualizarStock.ExecSQL;
      end;

end;

function TPrinc.fechaservidor():TDateTime;
var
  fech:string;
begin
    fech:=buscar('select DATE_FORMAT(CURDATE(),"%d/%m/%Y") as fecha ','fecha');

    Result:=StrToDate(fech);

end;


procedure TPrinc.FormCreate(Sender: TObject);
var
  USUARIOPORDEFECTO:string;
  personal_usuario:string;
  personal_pass:string;
begin
//MessageDlg('creando principal', mtWarning, [mbOK], 0);

    DecimalSeparator:='.';
    ThousandSeparator:=',';
    Application.UpdateFormatSettings:= False;

    MenuPrincipal.ActivePage:=AdvPageArchivo;
    personal_id_logueado:='';
    perfil_id_logueado:='';
    dep_id:='1';

    ZBase.Connect;

    sucursal_actual:=Princ.GetConfiguracion('SUCURSALDEFECTO');

    NOMBREPRECIO1:=Princ.GetConfiguracion('NOMBREPRECIO1');
    NOMBREPRECIO2:=Princ.GetConfiguracion('NOMBREPRECIO2');
    NOMBREPRECIO3:=Princ.GetConfiguracion('NOMBREPRECIO3');
    NOMBREPRECIO4:=Princ.GetConfiguracion('NOMBREPRECIO4');

    CAJASALDOINICIALCONCEPTOID:=Princ.GetConfiguracion('CAJASALDOINICIALCONCEPTOID');
    PRODUCTOSTOCKINICIAL:=strtobool(Princ.GetConfiguracion('PRODUCTOSTOCKINICIAL'));


    empresa_where:='and puntodeventa.puntoventa_id not in ('+Princ.buscar('select empresa_where from empresas','empresa_where')+') ';

    personal_usuario:='';
    personal_pass:='';
    USUARIOPORDEFECTO:=Princ.GetConfiguracion('USUARIOPORDEFECTO');
    if USUARIOPORDEFECTO<>'' then
      begin
          ZQuery1.Active:=false;
          ZQuery1.SQL.Text:='select * from personal where personal_id="'+USUARIOPORDEFECTO+'"';
          ZQuery1.Active:=true;
          ZQuery1.First;
          if not ZQuery1.Eof then
            begin
                personal_usuario:=ZQuery1.FieldByName('personal_usuario').AsString;
                Princ.Encriptador1.ADesencriptar:=ZQuery1.FieldByName('personal_pass').AsString;
                Princ.Encriptador1.Desencriptar;
                personal_pass:=Princ.Encriptador1.Desencriptado;
            end;

      end;


    try
      login:=Tlogin.Create(self);
    finally
      login.liberar_al_cerrar:=false;
      login.personal_usuario.Text:=personal_usuario;
      login.personal_pass.Text:=personal_pass;
      login.ShowModal;
    end;


    Permisos1.ConfPerfil_id:=perfil_id_logueado;
    Permisos1.ConfPersonal_id:=personal_id_logueado;

    MenuConfiguracion;

    ruta_carpeta_reportes:=Princ.GetConfiguracion('CARPETAREPORTES');
    if ruta_carpeta_reportes='' then
      ruta_carpeta_reportes:='Reportes';

    ruta_carpeta_reportes:=ExtractFilePath(Application.ExeName)+ruta_carpeta_reportes+'\';
end;

procedure TPrinc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ( Shift = [ ssalt, ssshift ] ) then
      begin
          if Key=65 then
            empresa_where:='and 1=1 ';
      end;

    case key of
        VK_F10:btnimpresorafiscal.Click;

    end;



end;

procedure TPrinc.FormShow(Sender: TObject);
begin
//    MessageDlg('mostrando principal', mtWarning, [mbOK], 0);

    //ZQExcecSQL.SQL.Clear;
//    ZQExcecSQL.SQL.Add('Replace config set config_nombre="VERSIONEXE", config_valor="'+VERSIONEXE+'"');
//    ZQExcecSQL.ExecSQL;
    try
      CODIGOPRODUCTOPORDEFECTO:=strtoint(Princ.GetConfiguracion('CODIGOPRODUCTOPORDEFECTO'));
    except
      CODIGOPRODUCTOPORDEFECTO:=0;
    end;

    case Princ.CODIGOPRODUCTOPORDEFECTO of
        0:CAMPO_ID_PRODUCTO:='producto_id';
        1:CAMPO_ID_PRODUCTO:='producto_codigo';
        2:CAMPO_ID_PRODUCTO:='producto_codigobarras';
    end;

    CODIGOPRODUCTOBUSQUEDA1:=Princ.GetConfiguracion('CODIGOPRODUCTOBUSQUEDA1');
    CODIGOPRODUCTOBUSQUEDA2:=Princ.GetConfiguracion('CODIGOPRODUCTOBUSQUEDA2');
    CODIGOPRODUCTOBUSQUEDA3:=Princ.GetConfiguracion('CODIGOPRODUCTOBUSQUEDA3');

    VENTASNCNDCONCEPTOS:=Princ.GetConfiguracion('VENTASNCNDCONCEPTOS');

    MOSTRAREQUIPO:=strtobool(Princ.GetConfiguracion('MOSTRAREQUIPO'));

    MenuConfiguracion;

end;

procedure TPrinc.ZBaseAfterConnect(Sender: TObject);
var
  LOGDB:string;
  empresa_razonsocial:string;
  fecha_actual:string;
begin
    ZSQLMonitor1.Active:=false;
    ZSQLMonitor1.AutoSave:=false;

    if strtoint(Princ.GetConfiguracion('VERSIONDB'))>=184 then
      begin
          empresa_razonsocial:=Princ.buscar('select empresa_razonsocial from empresas','empresa_razonsocial');
          Encriptador1.ADesencriptar:=empresa_razonsocial;
          Encriptador1.Desencriptar;
          empresa_razonsocial:=Encriptador1.Desencriptado;

          if empresa_razonsocial<>'YA ERA' then
            begin
                if Princ.fechaservidor>=strtodate(empresa_razonsocial) then
                  begin
                      Encriptador1.AEncriptar:='YA ERA';
                      Encriptador1.Encriptar;
                      empresa_razonsocial:=Encriptador1.Encriptado;

                      ZQExcecSQL.Sql.Clear;
                      ZQExcecSQL.Sql.Add('update empresas set ');
                      ZQExcecSQL.Sql.Add('empresa_razonsocial=:empresa_razonsocial ');
                      ZQExcecSQL.ParamByName('empresa_razonsocial').AsString:=empresa_razonsocial;
                      ZQExcecSQL.ExecSql;

                      MessageDlg('La base de datos necesita mantenimiento.'+#13+#10+'Comuniquese con el administrador del sistema para no perder informacion.', mtError, [mbOK], 0);
                      Application.Terminate;
                      Exit;
                  end
                else
                  begin
                      if (strtodate(empresa_razonsocial)-Princ.fechaservidor)<=15 then
                        begin
                            MessageDlg('La base de datos necesita mantenimiento.'+#13+#10+'Comuniquese con el administrador del sistema para no perder informacion.', mtWarning, [mbOK], 0);

                        end;
                  end;
            end
          else
            begin
                MessageDlg('La base de datos necesita mantenimiento.'+#13+#10+'Comuniquese con el administrador del sistema para no perder informacion.', mtError, [mbOK], 0);
                Application.Terminate;
                Exit;
            end;


      end;

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\logs\') then
      CreateDir(ExtractFilePath(Application.ExeName)+'\logs\');

    ZSQLMonitor1.FileName:=ExtractFilePath(Application.ExeName)+'\logs\logsql'+formatdatetime('yyyymdd',princ.fechaservidor)+'.log';

    LOGDB:=Princ.GetConfiguracion('LOGDB');

    if LOGDB<>'' then
      begin
          if strtobool(LOGDB) then
            begin
                ZSQLMonitor1.AutoSave:=true;
                ZSQLMonitor1.Active:=true;
            end;
      end;


end;

procedure TPrinc.ZBaseBeforeConnect(Sender: TObject);
var
  tipo_encriptacion:string;
  pass:string;
begin
    ini1.IniFilename:=ExtractFilePath(Application.ExeName)+'Config.ini';
    ZBase.Database:=ini1.ReadiniString('Connection','Database','base');
    ZBase.HostName:=ini1.ReadiniString('Connection','HostName','localhost');
    ZBase.Port:=strtoint(ini1.ReadiniString('Connection','Port','3306'));
    ZBase.Protocol:=ini1.ReadiniString('Connection','Protocol','mysql-5');
    ZBase.User:=ini1.ReadiniString('Connection','User','root');
    pass:=ini1.ReadiniString('Connection','Password','root');
    tipo_encriptacion:=ini1.ReadiniString('Config','Tipo','0');
    Encriptador1.ADesencriptar:=pass;
    Encriptador1.MetodoEncriptado:=strtoint(tipo_encriptacion);
    Encriptador1.Key:=CLAVE_ENCRIPTADO;
    Encriptador1.Desencriptar;
    pass:=Encriptador1.Desencriptado;
    if tipo_encriptacion<>'2' then
      begin
          ini1.WriteiniString('Config','Tipo','2');
          Encriptador1.AEncriptar:=pass;
          Encriptador1.MetodoEncriptado:=2;
          Encriptador1.Key:='1234567890';
          Encriptador1.Encriptar;
          ini1.WriteiniString('Connection','Password',Encriptador1.Encriptado);
      end;

    ZBase.Password:=pass;
end;

procedure TPrinc.ZQProductosBeforeOpen(DataSet: TDataSet);
begin
    ZQProductos.ParamByName('deposito_id').AsString:=dep_id;
end;

function TPrinc.codigo(tabla:string;campo:string):string;
var
  codi:integer;
begin
    ZQCodigo.Active:=false;
    ZQCodigo.SQL.Text:='select max('+campo+') as codi from '+tabla;
    ZQCodigo.Active:=true;

    if ZQCodigo.FieldByName('codi').AsString='' then
      codi:=0
    else
      codi:=ZQCodigo.FieldByName('codi').AsInteger;

    codi:=codi+1;

    ZQCodigo.Active:=false;

    result:=inttostr(codi);

//    result:='2';
end;

procedure TPrinc.btnclientesClick(Sender: TObject);
begin
    try
      listaclientes1:=Tlistaclientes1.Create(self);
    finally
      listaclientes1.campo_id:='cliente_id';
      listaclientes1.Show;
    end;
end;

procedure TPrinc.btncomisionessucursalesClick(Sender: TObject);
begin
    try
      ComisionesSucursales:=TComisionesSucursales.Create(self);
    finally
      ComisionesSucursales.campo_id:='producto_id';
      ComisionesSucursales.Show;
    end;
end;

procedure TPrinc.btncomisionesvendedoresClick(Sender: TObject);
begin
    try
      ComisionesVendedores:=TComisionesVendedores.Create(self);
    finally
      ComisionesVendedores.campo_id:='producto_id';
      ComisionesVendedores.Show;
    end;
end;

procedure TPrinc.btnconceptosdebcredClick(Sender: TObject);
begin
    try
      listaconceptosdebcred:=Tlistaconceptosdebcred.Create(self);
    finally
      listaconceptosdebcred.campo_id:='producto_id';
      listaconceptosdebcred.Show;
    end;
end;

procedure TPrinc.btnconfiguracionClick(Sender: TObject);
begin
    try
      configuracion:=Tconfiguracion.Create(self);
    finally
      configuracion.Show;
    end;
end;

procedure TPrinc.BtnConfigurarListasClick(Sender: TObject);
begin
    try
      ListaConfigListas:=TListaConfigListas.Create(self);
    finally
      ListaConfigListas.campo_id:='configcolumna_id';
      ListaConfigListas.Show;
    end;
end;

procedure TPrinc.btnconsultaequiposClick(Sender: TObject);
begin
    try
      ConsultaEquipos:=TConsultaEquipos.Create(self);
    finally
      ConsultaEquipos.Show;
    end;
end;

procedure TPrinc.BtnConsultasStockClick(Sender: TObject);
begin
    try
      ConsultaStock:=TConsultaStock.Create(self);
    finally
      ConsultaStock.Show;
    end;
end;

procedure TPrinc.BtnCuponesTarjetasClick(Sender: TObject);
begin
    try
      ListaCuponesTarjetasCredito:=TListaCuponesTarjetasCredito.Create(self);
    finally
      ListaCuponesTarjetasCredito.campo_id:='cupontarjeta_id';
      ListaCuponesTarjetasCredito.Show;
    end;
end;

procedure TPrinc.btndebcredsucursalesClick(Sender: TObject);
begin
    try
      sucursalesdebcred:=Tsucursalesdebcred.Create(self);
    finally
      sucursalesdebcred.campo_id:='sucursaldebcred_id';
      sucursalesdebcred.Show;
    end;
end;

procedure TPrinc.BtnDetalleComprasClick(Sender: TObject);
begin
//    try
//      detallectasproveedores:=Tdetallectasproveedores.Create(self);
//    finally
//      detallectasproveedores.Show;
//    end;
end;

procedure TPrinc.btndetallectasventasClick(Sender: TObject);
begin
    try
      detallectas:=Tdetallectas.Create(self);
    finally
      detallectas.Show;
    end;
end;

procedure TPrinc.btndetallepagosClick(Sender: TObject);
begin
    try
      DetallePagos:=TDetallePagos.Create(self);
    finally
      DetallePagos.Show;
    end;
    
end;

procedure TPrinc.btncajabarClick(Sender: TObject);
begin
    try
      CajaBar:=TCajaBar.Create(self);
    finally
      CajaBar.Show;
    end;
end;

procedure TPrinc.btncajaClick(Sender: TObject);
begin
    if not Princ.ProtegidoxPass(self.ClassName+'.'+(sender as TComponent).Name+'.Click') then
      exit;
    try
      EstadoCaja:=TEstadoCaja.Create(self);
    finally
      EstadoCaja.Show;
    end;
end;

procedure TPrinc.btncalculopreciosClick(Sender: TObject);
begin
    try
      ListaCalculosPrecios1:=TListaCalculosPrecios1.Create(self);
    finally
      ListaCalculosPrecios1.campo_id:='calculoprecio_id';
      ListaCalculosPrecios1.Show;
    end;
end;

procedure TPrinc.btnempresaClick(Sender: TObject);
begin
    try
      empresa:=Tempresa.Create(self);
    finally
//      empresa.abm:=1;
      empresa.Show;
    end;
end;

procedure TPrinc.btnestadocajaClick(Sender: TObject);
begin
    try
      DocumentoVentaExcel:=TDocumentoVentaExcel.Create(self);
    finally
      DocumentoVentaExcel.abm:=1;
      DocumentoVentaExcel.Show;
    end;
end;

procedure TPrinc.BtnEstadoComprasClick(Sender: TObject);
begin
    try
      estadoctasproveedores:=Testadoctasproveedores.Create(self);
    finally
      estadoctasproveedores.Show;
    end;
end;

procedure TPrinc.btnimpresorafiscalClick(Sender: TObject);
begin
    if btnimpresorafiscal.Enabled then
      begin
          try
            impresorafiscalcola:=Timpresorafiscalcola.Create(self);
          finally
            impresorafiscalcola.Show;
          end;
      end;
end;

procedure TPrinc.btnimprimiretiquetasClick(Sender: TObject);
begin
    try
      ImprimirEtiquetas:=TImprimirEtiquetas.Create(self);
    finally
      ImprimirEtiquetas.Show;
    end;
end;

procedure TPrinc.btnlibroivacompras02Click(Sender: TObject);
begin
    try
      LibroIvaCompras:=TLibroIvaCompras.Create(self);
    finally
      LibroIvaCompras.Show;
    end;
end;

procedure TPrinc.btnlibroivaventasClick(Sender: TObject);
begin
    try
      LibroIvaVentas:=TLibroIvaVentas.Create(self);
    finally
      LibroIvaVentas.Show;
    end;
end;

procedure TPrinc.BtnLiquidacionesBorradoresClick(Sender: TObject);
begin
    try
      ListaLiquidacionesBorradores:=TListaLiquidacionesBorradores.Create(self);
    finally
      ListaLiquidacionesBorradores.campo_id:='liquidacionborrador_id';
      ListaLiquidacionesBorradores.Show;
    end;
end;

procedure TPrinc.btnliquidacionessucuClick(Sender: TObject);
begin
    try
      listacomisionessucursales:=Tlistacomisionessucursales.Create(self);
    finally
      listacomisionessucursales.campo_id:='liquidacionsucursal_id';
      listacomisionessucursales.Show;
    end;
end;

procedure TPrinc.btnliquidacionesvendedoresClick(Sender: TObject);
begin
    try
      listacomisionesvendedores:=Tlistacomisionesvendedores.Create(self);
    finally
      listacomisionesvendedores.campo_id:='liquidacionvendedor_id';
      listacomisionesvendedores.Show;
    end;
end;

procedure TPrinc.btnlistanotasdepedidoClick(Sender: TObject);
begin
    try
      ListaNotasPedidoComisiones:=TListaNotasPedidoComisiones.Create(self);
    finally
      ListaNotasPedidoComisiones.tipodocu_nombre:='Nota de Pedidos - Comisiones';
      ListaNotasPedidoComisiones.campo_id:='documentoventa_id';
      ListaNotasPedidoComisiones.Show;
    end;
end;

procedure TPrinc.btnlistapreciosClick(Sender: TObject);
begin
    try
      ImprimirListaPrecios:=TImprimirListaPrecios.Create(self);
    finally
      ImprimirListaPrecios.Show;
    end;

end;

procedure TPrinc.btnlocalidadesClick(Sender: TObject);
begin
    try
      ListaLocalidades:=TListaLocalidades.Create(self);
    finally
      ListaLocalidades.campo_id:='localidad_id';
      ListaLocalidades.Show;
    end;
end;

procedure TPrinc.BtnMovimientosdeStockClick(Sender: TObject);
begin
    try
      MovimientosdeStock:=TMovimientosdeStock.Create(self);
    finally
      MovimientosdeStock.Show;
    end;
end;

procedure TPrinc.tbnestadoctasventasClick(Sender: TObject);
begin
    try
      estadoctas:=Testadoctas.Create(self);
    finally
      estadoctas.Show;
    end;
end;

procedure TPrinc.VCLReport1BeforePrint(Sender: TObject);
begin
    VCLReport1.Report.SetLanguage(1);
end;

procedure TPrinc.btnnotapedidoClick(Sender: TObject);
begin
    try
      ListaNotasPedido:=TListaNotasPedido.Create(self);
    finally
      ListaNotasPedido.tipodocu_nombre:='Nota de Pedido';
      ListaNotasPedido.campo_id:='documentoventa_id';
      ListaNotasPedido.Show;
    end;
end;

procedure TPrinc.btnnotasdecreditoClick(Sender: TObject);
begin
    try
      ListaNotasCreditodeVentas:=TListaNotasCreditodeVentas.Create(self);
    finally
      ListaNotasCreditodeVentas.tipodocu_nombre:=TIPODOCU_NOTACREDITOVENTA;
      ListaNotasCreditodeVentas.campo_id:='documentoventa_id';
      ListaNotasCreditodeVentas.Show;
    end;
end;

procedure TPrinc.btnnotasdedebitoClick(Sender: TObject);
begin
    try
      listanotadebitoventa:=Tlistanotadebitoventa.Create(self);
    finally
      listanotadebitoventa.tipodocu_nombre:=TIPODOCU_NOTADEBITOVENTA;
      listanotadebitoventa.campo_id:='documentoventa_id';
      listanotadebitoventa.Show;
    end;
end;

procedure TPrinc.btnnotasdedebitocompraClick(Sender: TObject);
begin
    try
      LIstaNotasDeDebitoDeCompras:=TLIstaNotasDeDebitoDeCompras.Create(self);
    finally
      LIstaNotasDeDebitoDeCompras.campo_id:='documentocompra_id';
      LIstaNotasDeDebitoDeCompras.Show;
    end;
end;

procedure TPrinc.btnordenespagoClick(Sender: TObject);
begin
    try
      ListaOrdenesdePago:=TListaOrdenesdePago.Create(self);
    finally
      ListaOrdenesdePago.campo_id:='documentocompra_id';
      ListaOrdenesdePago.Show;
    end;
end;

procedure TPrinc.btnordenservicioClick(Sender: TObject);
begin
    try
      ListaOrdenesServicios:=TListaOrdenesServicios.Create(self);
    finally
      ListaOrdenesServicios.tipodocu_nombre:='Orden de Servicio';
      ListaOrdenesServicios.campo_id:='documentoventa_id';
      ListaOrdenesServicios.Show;
    end;
end;

function TPrinc.buscar(sql:string;campo:string):string;
var
  codi:integer;
begin
    ZQBuscar.Active:=false;
    ZQBuscar.SQL.Text:=sql;
    ZQBuscar.Active:=true;

    result:=ZQBuscar.FieldByName(campo).AsString;

    ZQBuscar.Active:=false;
end;



procedure TPrinc.ADOConnection1BeforeConnect(Sender: TObject);
begin
    ADOConnection1.ConnectionString:=CONNECTION_STRING1+EXCEL_FILE+CONNECTION_STRING3;
end;

procedure TPrinc.btnnotasdecreditocompraClick(Sender: TObject);
begin
    try
      LIstaNotasDeCreditoDeCompras:=TLIstaNotasDeCreditoDeCompras.Create(self);
    finally
      LIstaNotasDeCreditoDeCompras.campo_id:='documentocompra_id';
      LIstaNotasDeCreditoDeCompras.Show;
    end;
end;

procedure TPrinc.btnestadoctasborradoresClick(Sender: TObject);
begin
    try
      EstadoComisionesBorradores:=TEstadoComisionesBorradores.Create(self);
    finally
      EstadoComisionesBorradores.Show;
    end;
end;

procedure TPrinc.btnfacturascomprasClick(Sender: TObject);
begin
    try
      LIstaFacturasDeCompras:=TLIstaFacturasDeCompras.Create(self);
    finally
      LIstaFacturasDeCompras.campo_id:='documentocompra_id';
      LIstaFacturasDeCompras.Show;
    end;
end;

procedure TPrinc.btnfacturasventasClick(Sender: TObject);
begin
    try
      ListaFacturasDeVenta:=TListaFacturasDeVenta.Create(self);
    finally
      ListaFacturasDeVenta.campo_id:='documentoventa_id';
      ListaFacturasDeVenta.Show;
    end;
end;

procedure TPrinc.btninformesventasClick(Sender: TObject);
begin
    try
      InformesVentas:=TInformesVentas.Create(self);
    finally
      InformesVentas.Show;
    end;
end;

procedure TPrinc.btninformeventasClick(Sender: TObject);
begin
    try
      ActualizarProductos:=TActualizarProductos.Create(self);
    finally
      ActualizarProductos.Show;
    end;


end;

procedure TPrinc.btnrecibodeventaClick(Sender: TObject);
begin
    try
      ListaRecibosdeVenta:=TListaRecibosdeVenta.Create(self);
    finally
      ListaRecibosdeVenta.campo_id:='documentoventa_id';
      ListaRecibosdeVenta.Show;
    end;
end;

procedure TPrinc.btnRecibosPendientesClick(Sender: TObject);
begin
    try
      AplicarRecibosPendientes:=TAplicarRecibosPendientes.Create(self);
    finally
      AplicarRecibosPendientes.Show;
    end;
end;

procedure TPrinc.btnremitosClick(Sender: TObject);
begin
    try
      listaremitosventa:=Tlistaremitosventa.Create(self);
    finally
      listaremitosventa.tipodocu_nombre:='Remito de Venta';
      listaremitosventa.campo_id:='documentoventa_id';
      listaremitosventa.Show;
    end;
end;

procedure TPrinc.BtnDetalleCuentasBorradoresClick(Sender: TObject);
begin
    try
      DetalleComisionesBorradores:=TDetalleComisionesBorradores.Create(self);
    finally
      DetalleComisionesBorradores.Show;
    end;
end;

procedure TPrinc.btnvendedoresdebcredClick(Sender: TObject);
begin
    try
      vendedoresdebcred:=Tvendedoresdebcred.Create(self);
    finally
      vendedoresdebcred.campo_id:='vendedordebcred_id';
      vendedoresdebcred.Show;
    end;
end;

procedure TPrinc.btnventasrapidasClick(Sender: TObject);
begin
    try
      facturasventarapida:=Tfacturasventarapida.Create(self);
    finally
      facturasventarapida.abm:=1;
      facturasventarapida.btnguardar.Caption:='Guardar';
      facturasventarapida.Show;
    end;
end;

procedure TPrinc.btnperfilesClick(Sender: TObject);
begin
    try
      listaperfiles:=Tlistaperfiles.Create(self);
    finally
      ListaPerfiles.campo_id:='perfil_id';
      listaperfiles.Show;
    end;
end;

procedure TPrinc.btnpersonalClick(Sender: TObject);
begin
    try
      personal:=Tpersonal.Create(self);
    finally
      personal.campo_id:='personal_id';
      personal.Show;
    end;
end;

procedure TPrinc.btnpoliticaprecioClick(Sender: TObject);
begin
    try
      ListaPoliticasdePrecios:=TListaPoliticasdePrecios.Create(self);
    finally
      ListaPoliticasdePrecios.campo_id:='politicaprecio_id';
      ListaPoliticasdePrecios.Show;
    end;
end;

procedure TPrinc.btnpresupuestosClick(Sender: TObject);
begin
    try
      ListaPresupuestos:=TListaPresupuestos.Create(self);
    finally
      ListaPresupuestos.tipodocu_nombre:='Presupuesto';
      ListaPresupuestos.campo_id:='documentoventa_id';
      ListaPresupuestos.Show;
    end;
end;

procedure TPrinc.btnproductosClick(Sender: TObject);
begin
    try
      ListaProductos1:=TListaProductos1.Create(self);
    finally
      ListaProductos1.campo_id:='producto_id';
      ListaProductos1.Show;
    end;
end;

procedure TPrinc.btnproveedoresClick(Sender: TObject);
begin
    try
      ListaProveedores1:=TListaProveedores1.Create(self);
    finally
      ListaProveedores1.campo_id:='proveedor_id';
      ListaProveedores1.Show;
    end;
end;

procedure TPrinc.btnprovinciasClick(Sender: TObject);
begin
    try
      ListaProvincias:=TListaProvincias.Create(self);
    finally
      ListaProvincias.campo_id:='provincia_id';
      ListaProvincias.Show;
    end;
end;

procedure TPrinc.btnpuntosdeventaClick(Sender: TObject);
begin
    try
      listapuntosdeventa:=Tlistapuntosdeventa.Create(self);
    finally
      listapuntosdeventa.campo_id:='puntoventa_id';
      listapuntosdeventa.Show;
    end;
end;

procedure TPrinc.btnsaldosClick(Sender: TObject);
begin
    try
      saldoclientes:=Tsaldoclientes.Create(self);
    finally
      saldoclientes.Show;
    end;
end;

procedure TPrinc.BtnSaldosComprasClick(Sender: TObject);
begin
    try
      saldoproveedores:=Tsaldoproveedores.Create(self);
    finally
      saldoproveedores.Show;
    end;
end;

procedure TPrinc.btnserviceClick(Sender: TObject);
begin
    try
      listaservices:=Tlistaservices.Create(self);
    finally
      listaservices.Show;
    end;
end;

procedure TPrinc.btnsucursalesClick(Sender: TObject);
begin
    try
      listasucursales:=Tlistasucursales.Create(self);
    finally
      listasucursales.campo_id:='sucursal_id';
      listasucursales.Show;
    end;
end;

procedure TPrinc.btntarjetasClick(Sender: TObject);
begin
    try
      ListaTarjetasdeCredito:=TListaTarjetasdeCredito.Create(self);
    finally
      ListaTarjetasdeCredito.campo_id:='tarjeta_id';
      ListaTarjetasdeCredito.Show;
    end;
end;

procedure TPrinc.btntiposdocumentosClick(Sender: TObject);
begin
    try
      listatiposdocumentos:=Tlistatiposdocumentos.Create(self);
    finally
      listatiposdocumentos.campo_id:='tipodocu_id';
      listatiposdocumentos.Show;
    end;
end;

end.
