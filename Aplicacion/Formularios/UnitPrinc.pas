unit UnitPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvMenus, AdvPanel,
  ZConnection, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, midaslib, ini,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, ADODB, rpcompobase, rpvclreport,
  UnitProgresoBase, ZSqlProcessor, WinINet, Math, UnitBackupdb, ZSqlMonitor,
  rpalias, GTBComboBox, ComCtrls, Encriptador;



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
    EstadoCtasCompras: TAdvGlowButton;
    btnfacturascompras: TAdvGlowButton;
    btnordenespago: TAdvGlowButton;
    btninformescompras: TAdvGlowButton;
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
    Encriptador1: TEncriptador;
    btndetallepagos: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure tbnestadoctasventasClick(Sender: TObject);
    procedure btninformeventasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnclientesClick(Sender: TObject);
    procedure btnrecibodeventaClick(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure btnproductosClick(Sender: TObject);
    procedure btnnuevasolicitudClick(Sender: TObject);
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
    procedure btnserviciosClick(Sender: TObject);
    procedure btnventasrapidasClick(Sender: TObject);
    procedure btnestadocajaClick(Sender: TObject);
    procedure ZQProductosBeforeOpen(DataSet: TDataSet);
    procedure btncontratacionClick(Sender: TObject);
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
  private
    { Private declarations }
    procedure MenuConfiguracion;
    procedure RefrescarMenu;
  public
    { Public declarations }
    EXCEL_FILE:string;
    empleado_id_logueado:string;
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
    empresa_where:string;
    function codigo(tabla:string;campo:string):string;
    function buscar(sql:string;campo:string):string;
    function fechaservidor():TDateTime;
    function NumeroDocumento(tipodocu_id:string):string;
    procedure actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
    function GetPrecioVentaBase(producto_preciocosto:real;calculoprecio_id:string):real;
    function GetPrecioVentaBaseprod(producto_precioventabase:real;producto_id:string):real;
    procedure ActualizarSaldoDocumentoVenta(id:string; importe:real; inversa:boolean=false);
    procedure AgregarDocumentoVenta(Cabecera:TDataset; Detalle:TDataset; Documentoventadocu:TDataset; Pagos:TDataset);
    procedure AgregarRecibo(ZQCabecera:TDataset; ZQDetalle:TDataset; ZQPagos:TDataset);
    function CargarPago(importe:real; QDocumentopagos:TDataset): boolean;
    procedure ActualizarNumeroDocumento(tipodocu_id: string; tipodocu_ultimonumero:string);
    function CargarDocumentoVentaDocu(cliente_id: string; QDocumentoVentaDocus:TDataset;documentoventa_apagar:real;AgregarAutomatico:boolean):boolean;
    function ImprimirFiscal(id:string; puntoventa_id:string=''):boolean;
    function GetConfiguracion(config_nombre:string):string;
    function QuitarCaracteresEspeciales(texto:string):string;
    procedure CalcularPreciosProducto(QProductos:TDataset; aplicar_cambios:boolean=false);
    procedure AgregarProductos(QProductos:TDataset);
    procedure ActualizarPrecios(QProductos:TDataset);
    function QuitarEspecialesNros(const Cad: string): string;
    function horaservidor():Ttime;
    function ControlCodigoProducto(codigo:string; producto_id:string;campo:string; mostrar_mensaje:boolean):boolean;
    procedure CargarDocumentoVentaDetalle(QDocumentoVentaDetalles:TDataset; Detalle:TDataset);
    procedure AbrirNuevoServicio;
    procedure AbrirModificarServicio(id:string);
    procedure AbrirNuevoCliente;
    procedure AbrirModificarCliente(id:string);
    procedure AbrirNuevoCalculoprecios;
    procedure AbrirModificarCalculoprecios(id:string);
    procedure AbrirNuevoProveedores;
    procedure AbrirModificarProveedores(id:string);
    procedure AbrirNuevoCajaAsiento;
    procedure AbrirModificarCajaAsiento(id:string);
    procedure AbrirEliminarCajaAsiento(id:string);
    procedure AbrirNuevoCajaAsientoIngreso;
    procedure AbrirModificarCajaAsientoIngreso(id:string);
    procedure AbrirNuevoCajaAsientoEgreso;
    procedure AbrirModificarCajaAsientoEgreso(id:string);
    procedure IniciarProgreso(Q:TDataset);
    procedure MostrarProgreso;
    function EsCUITValido(Num:String):boolean;
    function DescargarArchivo( sURL, sArchivoLocal: String ): boolean;
    function EjecutarScriptDB(archivo_sql:string):boolean;
    function BorrarDocumentoVenta(documentoventa_id:string):boolean;
    function BorrarDocumentoCompra(documentocompra_id:string):boolean;

    function GetConfigTipoDocumento(documento_id:string; campo:string):string;
    procedure MostrarVentanaExcel;
    procedure GetBoolConfig(config_nombre:string;valor_true:string; var propiedad:boolean);
    procedure AbrirDocumentoVenta(id:string;tipodocu_nombre:string;abm:integer);
    procedure AbrirDocumentoCompra(id:string;tipodocu_nombre:string;abm:integer);
    procedure AbrirNuevoTipoDocumento;
    procedure AbrirModificarTipoDocumento(id:string);
    procedure AbrirNuevoPerfil;
    procedure AbrirModificarPerfil(id:string);
  end;

type
  TBarraProgreso = class(TThread)
  PGB:TProgresoBase;
  Q:TDataSet;
    constructor Create; reintroduce; overload;
    procedure Execute; override;
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

  VERSIONEXE='50';


//  CONNECTION_STRING1='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=';
//  CONNECTION_STRING3=';Mode=Share Deny None;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=35;'+
//                     'Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'+
//                     'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''''t Copy Locale on Compact=False;'+
//                     'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;';


  TablaMul:Array[1..10] of Integer=(5,4,3,2,7,6,5,4,3,2); {Tabla Arbitraria}


implementation

uses Unitlistasolicitudes, Unitestadodectas, Unitinformesventas,
  Unitlistaclientes, Unitvendedores, Unitcobros, Unitemisionrecibos,
  Unitlocalidades, Unitconsultarvencidos, Unitgeneranuevasolicitud,
  Unitcobradores, Unitlistaproductos, Unitlistafacturasventa,
  Unitlistacalculoprecios, Unitlistapoliticasprecios, UnitCargarPagos,
  Unitlistarecibosventa, UnitDocumentosVentasPendientes, Unitdetallectas,
  UnitImpresoraFiscal, UnitConfiguracion, UnitImpresoraFiscalcola,
  Unitlistanotacreditoventa, UnitActualizarProductos, Unitlistaproveedores,
  UnitProductos, Unitlistaservicios, UnitServicios, Unitfacturaventarapida,
  Unitcalculoprecio, UnitProveedores, UnitClientes, UnitEstadoCaja,
  Unitlistacontrataciones, UnitCajaAsiento, UnitCajaAsientoIngreso,
  UnitcajaAsientoEgreso, UnitDocumentoVentaExcel, UnitMostrarExcel, UnitABMbase,
  UnitNotaPedido, UnitListaNotasPedido, UnitConsultaEquipos, Unitfacturasventa,
  Unitrecibosventa, Unitnotacreditoventa, UnitListaSucursales,
  UnitListaPuntosdeVenta, UnitListaTiposDocumentos, UnitTipoDocumento,
  UnitPersonal, UnitPerfil, UnitListaPerfiles, Unitsaldoclientes,
  Unitlistafacturascompra, Unitfacturascompra, UnitListaServices,
  UnitOrdenServicio, UnitListaOrdenesServicios, UnitImprimirListaPrecios,
  UnitPresupuesto, UnitListaPresupuestos, UnitDetallePagos;

{$R *.dfm}



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
          try
            notacreditoventa:=Tnotacreditoventa.Create(self);
          finally
            notacreditoventa.abm:=abm;
            notacreditoventa.id:=id;
            notacreditoventa.Show;
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

end;

procedure TPrinc.AbrirDocumentoCompra(id: string; tipodocu_nombre: string; abm: Integer);
begin
    if tipodocu_nombre='Factura de Compra' then
      begin
          try
            facturacompra:=Tfacturacompra.Create(self);
          finally
            facturacompra.abm:=abm;
            facturacompra.id:=id;
            facturacompra.Show;
          end;
      end;

end;



procedure TPrinc.MenuConfiguracion;
var
  i:integer;
begin
    ZQMenu.Active:=false;
    ZQMenu.Active:=true;
    for i := 0 to princ.ComponentCount-1 do
      begin
          if ZQMenu.Locate('menu_nomb',princ.Components[i].Name,[]) then
            begin
                if (princ.Components[i] is TAdvPage) then
                  begin
                      (princ.Components[i] as TAdvPage).TabVisible:=strtobool(ZQMenu.FieldByName('menu_visible').AsString);
                  end;

                if (princ.Components[i] is TAdvToolBar) then
                  begin
                      (princ.Components[i] as TAdvToolBar).Enabled:=strtobool(ZQMenu.FieldByName('menu_enabled').AsString);
                      (princ.Components[i] as TAdvToolBar).Visible:=strtobool(ZQMenu.FieldByName('menu_visible').AsString);
                  end;

                if (princ.Components[i] is TAdvGlowButton) then
                  begin
                      (princ.Components[i] as TAdvGlowButton).ShowHint:=true;
                      (princ.Components[i] as TAdvGlowButton).Hint:=(princ.Components[i] as TAdvGlowButton).Caption;
                      (princ.Components[i] as TAdvGlowButton).Enabled:=strtobool(ZQMenu.FieldByName('menu_enabled').AsString);
                      (princ.Components[i] as TAdvGlowButton).Visible:=strtobool(ZQMenu.FieldByName('menu_visible').AsString);
                      (princ.Components[i] as TAdvGlowButton).ShowHint:=true;
                      (princ.Components[i] as TAdvGlowButton).Hint:=(princ.Components[i] as TAdvGlowButton).Caption;

                  end;
            end;
      end;

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


function TPrinc.GetConfigTipoDocumento(documento_id: string; campo: string):string;
begin
    Result := Princ.buscar('select '+campo+' from tiposdocumento inner join documentosventas on tiposdocumento.tipodocu_id=documentosventas.tipodocu_id where documentosventas.documentoventa_id="'+documento_id+'"',campo);
end;


function TPrinc.BorrarDocumentoVenta(documentoventa_id: string):boolean;
var
  error:integer;
  tipodocu_id:string;
begin
    error:=0;
    ZQExcecSQL.SQL.Text:='begin';
    ZQExcecSQL.ExecSQL;

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
            ActualizarSaldoDocumentoVenta(ZQDocumentoventadocus.FieldByName('documentoventa_idpago').AsString,ZQDocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat, true);
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


function TPrinc.BorrarDocumentoCompra(documentocompra_id: string):boolean;
var
  error:integer;
  tipodocu_id:string;
begin
    error:=0;
    ZQExcecSQL.SQL.Text:='begin';
    ZQExcecSQL.ExecSQL;

//    ZQExcecSQL.SQL.Text:='delete from documentopagos where documentoventa_id="'+documentoventa_id+'"';
//    try
//      ZQExcecSQL.ExecSQL;
//    except
//      error:=1;
//    end;

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

//    ZQDocumentoventadocus.Active:=false;
//    ZQDocumentoventadocus.SQL.Text:='select * from documentoventadocus where documentoventa_id="'+documentoventa_id+'"';
//    ZQDocumentoventadocus.Active:=true;
//    ZQDocumentoventadocus.First;
//    while not ZQDocumentoventadocus.Eof do
//        begin
//            ActualizarSaldoDocumentoVenta(ZQDocumentoventadocus.FieldByName('documentoventa_idpago').AsString,ZQDocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat, true);
//            ZQDocumentoventadocus.Next;
//        end;
//    ZQDocumentoventadocus.Active:=false;
//
//    ZQExcecSQL.SQL.Text:='delete from documentoventadocus where documentoventa_id="'+documentoventa_id+'"';
//    try
//      ZQExcecSQL.ExecSQL;
//    except
//      error:=2;
//    end;

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

    while continuar do
        begin
            versiondb:=Princ.GetConfiguracion('VERSIONDB');
            if versiondb='' then
              versiondb:='0';
            
            if strtoint(versiondb)<strtoint(ZSQLProcessor1.Statements[i]) then
              begin
                  ZQExcecSQL.Active:=false;
                  ZQExcecSQL.SQL.Text:=ZSQLProcessor1.Statements[i+1];
                  try
                    ZQExcecSQL.ExecSQL;

                    ZQExcecSQL.SQL.Clear;
                    ZQExcecSQL.SQL.Add('Replace config set config_nombre="VERSIONDB", config_valor="'+ZSQLProcessor1.Statements[i]+'"');
                    ZQExcecSQL.ExecSQL;

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
 Sumatoria,       {Sumatoria de los Digitos menos el �ltimo}
 Dividendo,       {Resultado de la Divisi�n}
 Producto,
 Diferencia,
 DigitoVerif:Integer; {Digito Verificador Calculado}
begin 
result:=false;          { Asumir Invalido }
if Length(Num) = 11 then 
  begin 
    try
      { Convertir cada caracter a N�mero}
      for i:=1 to 11 do CUIT[i]:=StrToInt(Num[i]); 
    except
      { Si hay error de conversi�n es CUIT invalido}
      Exit;
    end; { try }
end else Exit; { if }  { Si no tiene 11 caracteres es CUIT invalido }
 
for i:=1 to 10 do             // Multiplicar cada digito por la
  R[i]:=CUIT[i]*TablaMul[i];   // Tabla Arbitraria menos el �ltimo
 
Sumatoria:=0;
for i:=1 to 10 do 
  Sumatoria:=Sumatoria+R[i];   // Calcular la sumatoria de los resultados
 
Dividendo:=Sumatoria div 11;     //  Dividir por 11  (divisi�n entera)
Producto:=Dividendo * 11;          // El resultado multiplica por 11
Diferencia:=Sumatoria - Producto;  // Obtener la diferencia
if Diferencia > 0 then             // Si la dif. es mayor a cero
     DigitoVerif:=11 - Diferencia  // El digito verificador es 11 menos la diferencia
else DigitoVerif:=Diferencia;       // sino es Cero.
 
if DigitoVerif = CUIT[11] then result:=true;  // si el Digito Verificador es igual
end;



constructor TBarraProgreso.Create;
begin
  inherited Create(True); // llamamos al constructor del padre (TThread)
end;


procedure TBarraProgreso.Execute;
begin
  inherited;
    PGB:=TProgresoBase.Create(princ);
    PGB.XiProgressBar1.Max:=Princ.ProgressMax;
    PGB.Show;
    while not Q.Eof do
      begin
          PGB.XiProgressBar1.Position:=Q.RecNo;
          PGB.Repaint;


      end;

end;


procedure TPrinc.IniciarProgreso(Q:TDataset);
var
  BarraProgreso:TBarraProgreso;
begin
    BarraProgreso := TBarraProgreso.Create(True);
    BarraProgreso.Q:=Q;

    BarraProgreso.FreeOnTerminate := True;
    BarraProgreso.Resume;




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

procedure TPrinc.MostrarProgreso;
begin
    

end;



procedure TPrinc.AbrirNuevoCajaAsientoEgreso;
begin
    try
      CajaAsientoEgreso:=TCajaAsientoEgreso.Create(self);
    finally
      CajaAsientoEgreso.abm:=1;
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


procedure TPrinc.AbrirNuevoCajaAsientoIngreso;
begin
    try
      CajaAsientoIngreso:=TCajaAsientoIngreso.Create(self);
    finally
      CajaAsientoIngreso.abm:=1;
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



procedure TPrinc.AbrirNuevoCajaAsiento;
begin
    try
      CajaAsiento:=TCajaAsiento.Create(self);
    finally
      CajaAsiento.abm:=1;
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



procedure TPrinc.CargarDocumentoVentaDetalle(QDocumentoVentaDetalles:TDataset; Detalle:TDataset);
var
  i:integer;
begin
    QDocumentoventadetalles.Last;
    QDocumentoventadetalles.Next;

    QDocumentoventadetalles.Insert;
    for i := 0 to Detalle.FieldCount-1 do
      begin
          QDocumentoventadetalles.Fields[i].Value:=Detalle.Fields[i].Value;
      end;
    QDocumentoventadetalles.Post;
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
begin
    QProductos.First;
    while not QProductos.Eof do
        begin
            ZQProductosABM.sql.clear;
            ZQProductosABM.sql.add('Update productos set ');
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
            ZQProductosABM.parambyname('producto_fechaactualizacionprecio').asstring:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);
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
            ZQProductosABM.sql.add('select 0, 0, '+id+', deposito_id, 0, 0 from depositos');
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
//    ProgressMax:=QProductos.RecordCount;
//    IniciarProgreso(QProductos);
    while not QProductos.Eof do
        begin
//            ProgressPos:=QProductos.RecNo;
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
                  ZQExcecSQL.parambyname('producto_id').asstring:=QProductos.FieldByName('producto_id').AsString;
                  ZQExcecSQL.ExecSQL;

              end;

            QProductos.Next;
        end;

    if aplicar_cambios then
      MessageDlg('Se actualizaron '+inttostr(QProductos.RecordCount)+' productos.', mtInformation, [mbOK], 0);

end;


Procedure TPrinc.AgregarDocumentoVenta(Cabecera: TDataSet; Detalle: TDataSet; Documentoventadocu: TDataSet; Pagos: TDataSet);
var
  id:string;
  documentoventa_numero:string;
begin
    ZQDocumentosventasABM.SQL.Clear;
    ZQDocumentosventasABM.SQL.Add('begin');
    ZQDocumentosventasABM.ExecSQL;

    id:=codigo('documentosventas', 'documentoventa_id');

    documentoventa_numero:=Princ.NumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString);
    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+Cabecera.FieldByName('tipodocu_id').AsString+'"','tipodocu_fiscal')) then
      documentoventa_numero:='0';
      
    ZQDocumentosventasABM.sql.clear;
    ZQDocumentosventasABM.sql.add('Insert into documentosventas (cliente_id, documentoventa_condicionventa, ');
    ZQDocumentosventasABM.sql.add('documentoventa_estado, documentoventa_fecha, documentoventa_fechavenc, ');
    ZQDocumentosventasABM.sql.add('documentoventa_hora, documentoventa_id, documentoventa_iva105, ');
    ZQDocumentosventasABM.sql.add('documentoventa_iva21, documentoventa_listaprecio, documentoventa_neto105, ');
    ZQDocumentosventasABM.sql.add('documentoventa_neto21, documentoventa_netonogravado, documentoventa_numero, ');
    ZQDocumentosventasABM.sql.add('documentoventa_observacion, documentoventa_pagado, documentoventa_saldo, ');
    ZQDocumentosventasABM.sql.add('documentoventa_total, personal_id, tipodocu_id) ');
    ZQDocumentosventasABM.sql.add('values (:cliente_id, :documentoventa_condicionventa, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_estado, :documentoventa_fecha, :documentoventa_fechavenc, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_hora, :documentoventa_id, :documentoventa_iva105, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_iva21, :documentoventa_listaprecio, :documentoventa_neto105, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_neto21, :documentoventa_netonogravado, :documentoventa_numero, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_observacion, :documentoventa_pagado, :documentoventa_saldo, ');
    ZQDocumentosventasABM.sql.add(':documentoventa_total, :personal_id, :tipodocu_id)');
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
    ZQDocumentosventasABM.ExecSQL;

    ActualizarNumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString,Cabecera.FieldByName('documentoventa_numero').AsString);


    if Detalle<>nil then
      begin
          Detalle.First;
          while not Detalle.Eof do
              begin
                  ZQDocumentosventasABM.sql.clear;
                  ZQDocumentosventasABM.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
                  ZQDocumentosventasABM.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
                  ZQDocumentosventasABM.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id) ');
                  ZQDocumentosventasABM.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id) ');
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
                  ZQDocumentosventasABM.sql.add('documentoventadoc_id, documentoventadoc_importe) ');
                  ZQDocumentosventasABM.sql.add('values (:documentoventa_estado, :documentoventa_id, ');
                  ZQDocumentosventasABM.sql.add(':documentoventa_idpago, :documentoventa_pagado, ');
                  ZQDocumentosventasABM.sql.add(':documentoventa_saldo, :documentoventadoc_id, ');
                  ZQDocumentosventasABM.sql.add(':documentoventadoc_importe)');
                  ZQDocumentosventasABM.parambyname('documentoventa_estado').asstring:=Documentoventadocu.FieldByName('documentoventa_estado').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_id').asstring:=id;
                  ZQDocumentosventasABM.parambyname('documentoventa_idpago').asstring:=Documentoventadocu.FieldByName('documentoventa_idpago').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_pagado').asstring:=Documentoventadocu.FieldByName('documentoventa_pagado').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventa_saldo').asstring:=Documentoventadocu.FieldByName('documentoventa_saldo').AsString;
                  ZQDocumentosventasABM.parambyname('documentoventadoc_id').asstring:=codigo('documentoventadocus', 'documentoventadoc_id');
                  ZQDocumentosventasABM.parambyname('documentoventadoc_importe').asstring:=Documentoventadocu.FieldByName('documentoventadoc_importe').AsString;
                  ZQDocumentosventasABM.ExecSQL;

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



end;

function TPrinc.QuitarCaracteresEspeciales(texto: string):string;
const
  VALIDOS=['0'..'9','A'..'Z','a'..'z','-','.'];
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
          impresorafiscal.tipodocu_leyenda:=ZQDocumentosventas.FieldByName('tipodocu_leyenda').AsString;
          impresorafiscal.Nombre_cliente:=QuitarCaracteresEspeciales(ZQDocumentosventas.FieldByName('cliente_nombre').AsString);
          impresorafiscal.Direccion_cliente:=QuitarCaracteresEspeciales(ZQDocumentosventas.FieldByName('cliente_domicilio').AsString);
          if impresorafiscal.Direccion_cliente='' then
            impresorafiscal.Direccion_cliente:='0';
          impresorafiscal.NroDocumento_cliente:=Princ.QuitarEspecialesNros(ZQDocumentosventas.FieldByName('cliente_documentonro').AsString);
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

          while not ZQdocumentoventadetalles.Eof do
              begin
                  impresorafiscal.MQDetalle.Insert;
                  impresorafiscal.MQDetalle.FieldByName('descripcion').AsString:=QuitarCaracteresEspeciales(ZQdocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString);
                  impresorafiscal.MQDetalle.FieldByName('cantidad').AsString:=ZQdocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
                  impresorafiscal.MQDetalle.FieldByName('monto').AsString:=ZQdocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
                  impresorafiscal.MQDetalle.FieldByName('IVA').AsString:=ZQdocumentoventadetalles.FieldByName('tipoiva_valor').AsString;
                  impresorafiscal.MQDetalle.FieldByName('impuestosinternos').AsString:='0';

                  impresorafiscal.MQDetalle.Post;
                  ZQdocumentoventadetalles.Next;
              end;

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
      end
    else
      begin
          impresorafiscal.tipodocu_nombre:='Reporte Z';
          impresorafiscal.modelo:=strtoint(Princ.buscar('select puntoventa_controladorfiscalmodelo from puntodeventa where puntoventa_id="'+puntoventa_id+'"','puntoventa_controladorfiscalmodelo'));
          impresorafiscal.puerto:=strtoint(Princ.buscar('select puntoventa_controladorfiscalpuerto from puntodeventa where puntoventa_id="'+puntoventa_id+'"','puntoventa_controladorfiscalpuerto'));
      end;

    if impresorafiscal.Showmodal=mrOk then
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

    impresorafiscal.Free;

    result:=false;
end;

function TPrinc.CargarDocumentoVentaDocu(cliente_id: string; QDocumentoVentaDocus:TDataset;documentoventa_apagar:real;AgregarAutomatico:boolean):boolean;
begin
    DocumentosVentasPendientes:=TDocumentosVentasPendientes.Create(self);
    DocumentosVentasPendientes.cliente_id:=cliente_id;
    DocumentosVentasPendientes.ActivarConsulta;
    DocumentosVentasPendientes.documentoventa_apagar:=documentoventa_apagar;
    QDocumentoVentaDocus.First;
    while not QDocumentoVentaDocus.Eof do
        begin
            if DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Locate('documentoventa_id',QDocumentoVentaDocus.FieldByName('documentoventa_idpago').AsString,[]) then
              begin
                  DocumentosVentasPendientes.ZQDocumentosVentasPendientes.Edit;
                  DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsString:=QDocumentoVentaDocus.FieldByName('documentoventadoc_importe').AsString;
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
              //          QDocumentoVentaDocus.FieldByName('documentoventa_neto21').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_neto21').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_iva21').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_iva21').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_neto105').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_neto105').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_iva105').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_iva105').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_netonogravado').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_netonogravado').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_total').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_total').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_estado').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_estado').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_pagado').AsFloat:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_pagado').AsFloat+DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat;
                        QDocumentoVentaDocus.FieldByName('documentoventa_saldo').AsFloat:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat-DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_observacion').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_observacion').AsString;
                        QDocumentoVentaDocus.FieldByName('cliente_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('cliente_id').AsString;
                        QDocumentoVentaDocus.FieldByName('personal_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('personal_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_id').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_condicionventa').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_condicionventa').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_fechavenc').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_fechavenc').AsString;
              //          QDocumentoVentaDocus.FieldByName('documentoventa_listaprecio').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_listaprecio').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_id_1').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_nombre').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_nombre').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_tipo').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_tipo').AsString;
              //          QDocumentoVentaDocus.FieldByName('tipodocu_caja').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_caja').AsString;
              //		      QDocumentoVentaDocus.FieldByName('tipodocu_stock').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_stock').AsString;
              //          QDocumentoVentaDocus.FieldByName('tipodocu_iva').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_iva').AsString;
              //          QDocumentoVentaDocus.FieldByName('tipodocu_fiscal').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_fiscal').AsString;
              //    		  QDocumentoVentaDocus.FieldByName('tipodocu_ultimonumero').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_ultimonumero').AsString;
                        QDocumentoVentaDocus.FieldByName('puntoventa_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoVentaDocus.FieldByName('tipodocu_letra').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('tipodocu_letra').AsString;
                        QDocumentoVentaDocus.FieldByName('puntoventa_id_1').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoVentaDocus.FieldByName('puntoventa_numero').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_numero').AsString;
              //          QDocumentoVentaDocus.FieldByName('puntoventa_descripcion').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('puntoventa_descripcion').AsString;
                        QDocumentoVentaDocus.FieldByName('sucursal_id').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('sucursal_id').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventadoc_importe').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventadoc_id').AsString:='0';
                        QDocumentoVentaDocus.FieldByName('documentoventa_idpago').AsString:=DocumentosVentasPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_id').AsString;
                        QDocumentoVentaDocus.FieldByName('documentoventa_id_1').AsString:='0';
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


function TPrinc.CargarPago(importe:real; QDocumentopagos: TDataSet):boolean;
begin
    CargarPagos:=TCargarPagos.Create(self);
    CargarPagos.documentopago_importe.Value:=importe;
    if CargarPagos.ShowModal=mrOK then
      begin
          QDocumentopagos.Insert;
          QDocumentopagos.FieldByName('documentopago_id').AsString:='0';
          QDocumentopagos.FieldByName('documentopago_nombre').AsString:=CargarPagos.documentopago_nombre.Text;
          QDocumentopagos.FieldByName('documentopago_importe').AsString:=CargarPagos.documentopago_importe.Text;
          QDocumentopagos.FieldByName('tipopago_id').AsString:=CargarPagos.tipopago_id.codigo;
          QDocumentopagos.FieldByName('tipopago_nombre').AsString:=CargarPagos.tipopago_id.Text;
          QDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
          QDocumentopagos.Post;

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

                  ActualizarSaldoDocumentoVenta(ZQDetalle.FieldByName('documentoventa_idpago').AsString,ZQDetalle.FieldByName('documentoventadoc_importe').AsFloat);

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

function TPrinc.NumeroDocumento(tipodocu_id: string):string;
var
  tipodocu_numero:string;
begin
    tipodocu_numero:=self.buscar('select tipodocu_ultimonumero from tiposdocumento where tipodocu_id="'+tipodocu_id+'"','tipodocu_ultimonumero');
    if tipodocu_numero<>'' then
      begin
          tipodocu_numero:=inttostr(strtoint(tipodocu_numero)+1);
      end
    else
      tipodocu_numero:='1';


    result:=tipodocu_numero
end;

procedure TPrinc.actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
var
  tipodocu_stock:integer;
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






end;

function TPrinc.fechaservidor():TDateTime;
var
  fech:string;
begin
    fech:=buscar('select DATE_FORMAT(CURDATE(),"%d/%m/%Y") as fecha ','fecha');

    Result:=StrToDate(fech);

end;


procedure TPrinc.FormCreate(Sender: TObject);
begin
    DecimalSeparator:='.';
    ThousandSeparator:=',';
    Application.UpdateFormatSettings:= False;

    MenuPrincipal.ActivePage:=AdvPageArchivo;
    empleado_id_logueado:='';
    dep_id:='1';

    sucursal_actual:=Princ.GetConfiguracion('SUCURSALDEFECTO');

    NOMBREPRECIO1:=Princ.GetConfiguracion('NOMBREPRECIO1');
    NOMBREPRECIO2:=Princ.GetConfiguracion('NOMBREPRECIO2');
    NOMBREPRECIO3:=Princ.GetConfiguracion('NOMBREPRECIO3');
    NOMBREPRECIO4:=Princ.GetConfiguracion('NOMBREPRECIO4');


    empresa_where:='and puntodeventa.puntoventa_id not in ('+Princ.buscar('select empresa_where from empresas','empresa_where')+')';

    MenuConfiguracion;
end;

procedure TPrinc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ( Shift = [ ssalt, ssshift ] ) then
      begin
          if Key=65 then
            empresa_where:='and 1=1';
      end;



end;        

procedure TPrinc.FormShow(Sender: TObject);
begin
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


    MenuConfiguracion;

end;

procedure TPrinc.ZBaseAfterConnect(Sender: TObject);
var
  LOGDB:string;
begin
    ZSQLMonitor1.Active:=false;
    ZSQLMonitor1.FileName:=ExtractFilePath(Application.ExeName)+'logsql.log';

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
    tipo_encriptacion:=ini1.ReadiniString('Config','Tipo','');
    if tipo_encriptacion='1' then
      begin
          Encriptador1.ADesencriptar:=pass;
          Encriptador1.Desencriptar;
          pass:=Encriptador1.Desencriptado;
      end
    else
      begin
          ini1.WriteiniString('Config','Tipo','1');
          Encriptador1.AEncriptar:=pass;
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

end;

procedure TPrinc.btnclientesClick(Sender: TObject);
begin
    try
      listaclientes:=Tlistaclientes.Create(self);
    finally
      listaclientes.Show;
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

procedure TPrinc.btnconsultaequiposClick(Sender: TObject);
begin
    try
      ConsultaEquipos:=TConsultaEquipos.Create(self);
    finally
      ConsultaEquipos.Show;
    end;
end;

procedure TPrinc.btncontratacionClick(Sender: TObject);
begin
    try
      listacontrataciones:=Tlistacontrataciones.Create(self);
    finally
      listacontrataciones.Show;
    end;
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

procedure TPrinc.btncajaClick(Sender: TObject);
begin
    try
      EstadoCaja:=TEstadoCaja.Create(self);
    finally
      EstadoCaja.Show;
    end;
end;

procedure TPrinc.btncalculopreciosClick(Sender: TObject);
begin
    try
      listacalculoprecios:=Tlistacalculoprecios.Create(self);
    finally
      listacalculoprecios.Show;
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

procedure TPrinc.btnimpresorafiscalClick(Sender: TObject);
begin
    try
      impresorafiscalcola:=Timpresorafiscalcola.Create(self);
    finally
      impresorafiscalcola.Show;
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
      localidades:=Tlocalidades.Create(self);
    finally
      localidades.Show;
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
      listanotacreditoventa:=Tlistanotacreditoventa.Create(self);
    finally
      listanotacreditoventa.Show;
    end;
end;

procedure TPrinc.btnnuevasolicitudClick(Sender: TObject);
begin
    try
      generanuevasolicitud:=Tgeneranuevasolicitud.Create(self);
    finally
      generanuevasolicitud.Show;
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

procedure TPrinc.btnfacturascomprasClick(Sender: TObject);
begin
    try
      listafacturascompra:=Tlistafacturascompra.Create(self);
    finally
      listafacturascompra.Show;
    end;
end;

procedure TPrinc.btnfacturasventasClick(Sender: TObject);
begin
    try
      listafacturasventa:=Tlistafacturasventa.Create(self);
    finally
      listafacturasventa.Show;
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
      listarecibosventa:=Tlistarecibosventa.Create(self);
    finally
      listarecibosventa.Show;
    end;
end;

procedure TPrinc.AdvGlowButton3Click(Sender: TObject);
begin
    try
      emisionrecibos:=Temisionrecibos.Create(self);
    finally
      emisionrecibos.Show;
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
      listapoliticasprecios:=Tlistapoliticasprecios.Create(self);
    finally
      listapoliticasprecios.Show;
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
      listaproductos:=Tlistaproductos.Create(self);
    finally
      listaproductos.Show;
    end;
end;

procedure TPrinc.btnproveedoresClick(Sender: TObject);
begin
    try
      listaproveedores:=Tlistaproveedores.Create(self);
    finally
      listaproveedores.Show;
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

procedure TPrinc.btnserviceClick(Sender: TObject);
begin
    try
      listaservices:=Tlistaservices.Create(self);
    finally
      listaservices.Show;
    end;
end;

procedure TPrinc.btnserviciosClick(Sender: TObject);
begin
    try
      listaservicios:=Tlistaservicios.Create(self);
    finally
      listaservicios.Show;
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
