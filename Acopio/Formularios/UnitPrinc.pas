unit UnitPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvGlowButton, AdvMenus, AdvPanel,
  ZConnection, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, midaslib, ini,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, ADODB, rpcompobase, rpvclreport,
  ZSqlProcessor, WinINet, Math, UnitBackupdb, ZSqlMonitor,
  rpalias, GTBComboBox, ComCtrls, rpgraphicex, Menus, AdvAppStyler, jpeg,
  ExtCtrls, Encriptador;



type
  TPrinc = class(TForm)
    MenuPrincipal: TAdvToolBarPager;
    AdvPageArchivo: TAdvPage;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvToolBarGeneral: TAdvToolBar;
    AdvMenuStyler1: TAdvMenuStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    ZBase: TZConnection;
    ZQBuscar: TZQuery;
    ZQCodigo: TZQuery;
    ZQActualizarStock: TZQuery;
    ini1: Tini;
    ZQCalculopreciodeta: TZQuery;
    ZQActualizarSaldoDocumentos: TZQuery;
    ZQRecibos: TZQuery;
    ZQZQActualizarNumeroDocumento: TZQuery;
    ZQDocumentosVentasPendientes: TZQuery;
    ZQDocumentosventas: TZQuery;
    ZQdocumentoventadetalles: TZQuery;
    ZQDocumentopagos: TZQuery;
    ZQuery1: TZQuery;
    ZQDocumentosventasABM: TZQuery;
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    OpenDialog1: TOpenDialog;
    ZQProductosABM: TZQuery;
    VCLReport1: TVCLReport;
    ZQExcecSQL: TZQuery;
    ZSQLProcessor1: TZSQLProcessor;
    ZQCalculopreciodetaprod: TZQuery;
    BackupDB1: TBackupDB;
    ZQDocumentoventadocus: TZQuery;
    ADOTable1: TADOTable;
    ZQProductos: TZQuery;
    ZQMenu: TZQuery;
    ZSQLMonitor1: TZSQLMonitor;
    ZQdocumentocompradetalles: TZQuery;
    AdvPopupMenu1: TAdvPopupMenu;
    asdf4: TMenuItem;
    asdf5: TMenuItem;
    asdf6: TMenuItem;
    AdvPopupMenu2: TAdvPopupMenu;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    AdvToolBar1: TAdvToolBar;
    btnespecies: TAdvGlowButton;
    AdvToolBarFantasyStyler1: TAdvToolBarFantasyStyler;
    AdvToolBarCustomizer1: TAdvToolBarCustomizer;
    AdvFormStyler1: TAdvFormStyler;
    AdvAppStyler1: TAdvAppStyler;
    Image1: TImage;
    Encriptador1: TEncriptador;
    AdvToolBar2: TAdvToolBar;
    AdvGlowButton7: TAdvGlowButton;
    AdvGlowButton6: TAdvGlowButton;
    AdvGlowButton8: TAdvGlowButton;
    AdvGlowButton9: TAdvGlowButton;
    AdvPage1: TAdvPage;
    AdvPage2: TAdvPage;
    AdvPage3: TAdvPage;
    AdvToolBar3: TAdvToolBar;
    btnfacturascompras: TAdvGlowButton;
    btnnotacreditocompra: TAdvGlowButton;
    btnnotadebitocompra: TAdvGlowButton;
    AdvToolBar4: TAdvToolBar;
    AdvGlowButton13: TAdvGlowButton;
    AdvGlowButton14: TAdvGlowButton;
    AdvGlowButton15: TAdvGlowButton;
    AdvToolBar5: TAdvToolBar;
    btnfacturasventas: TAdvGlowButton;
    btnrecibos: TAdvGlowButton;
    AdvToolBar6: TAdvToolBar;
    btnsaldosgranos: TAdvGlowButton;
    AdvGlowButton20: TAdvGlowButton;
    AdvGlowButton21: TAdvGlowButton;
    AdvToolBar7: TAdvToolBar;
    AdvGlowButton16: TAdvGlowButton;
    AdvGlowButton22: TAdvGlowButton;
    AdvGlowButton23: TAdvGlowButton;
    ZQDocumentodocus: TZQuery;
    btncontratos: TAdvGlowButton;
    btncontratoventa: TAdvGlowButton;
    AdvToolBar8: TAdvToolBar;
    AdvGlowButton3: TAdvGlowButton;
    AdvGlowButton5: TAdvGlowButton;
    AdvGlowButton24: TAdvGlowButton;
    AdvPage4: TAdvPage;
    AdvToolBar9: TAdvToolBar;
    btnordenesdecarga: TAdvGlowButton;
    AdvToolBar10: TAdvToolBar;
    AdvGlowButton19: TAdvGlowButton;
    AdvToolBar11: TAdvToolBar;
    btnconfiguracion: TAdvGlowButton;
    btnperfiles: TAdvGlowButton;
    btnnotasdecredito: TAdvGlowButton;
    BtnNotasdeDebito: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZBaseBeforeConnect(Sender: TObject);
    procedure ADOConnection1BeforeConnect(Sender: TObject);
    procedure ZQProductosBeforeOpen(DataSet: TDataSet);
    procedure MenuPrincipalChange(Sender: TObject);
    procedure ZBaseAfterConnect(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AdvToolBarGeneralOptionClick(Sender: TObject; ClientPoint,
      ScreenPoint: TPoint);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure btnespeciesClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton7Click(Sender: TObject);
    procedure AdvGlowButton8Click(Sender: TObject);
    procedure AdvGlowButton9Click(Sender: TObject);
    procedure btnsaldosgranosClick(Sender: TObject);
    procedure AdvGlowButton20Click(Sender: TObject);
    procedure AdvGlowButton21Click(Sender: TObject);
    procedure btnfacturasventasClick(Sender: TObject);
    procedure AdvGlowButton16Click(Sender: TObject);
    procedure btnrecibosClick(Sender: TObject);
    procedure btncontratosClick(Sender: TObject);
    procedure btnordenesdecargaClick(Sender: TObject);
    procedure btncontratoventaClick(Sender: TObject);
    procedure btnconfiguracionClick(Sender: TObject);
    procedure btnperfilesClick(Sender: TObject);
    procedure btnnotasdecreditoClick(Sender: TObject);
    procedure BtnNotasdeDebitoClick(Sender: TObject);
    procedure btnfacturascomprasClick(Sender: TObject);
    procedure btnnotacreditocompraClick(Sender: TObject);
    procedure btnnotadebitocompraClick(Sender: TObject);
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
    empresa_where:string;
    function codigo(tabla:string;campo:string):string;
    function buscar(sql:string;campo:string):string;
    function fechaservidor():TDateTime;
    function NumeroDocumento(tipodocu_id:string; documentoventa_numero:string):string;
    procedure actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
    function GetPrecioVentaBase(producto_preciocosto:real;calculoprecio_id:string):real;
    function GetPrecioVentaBaseprod(producto_precioventabase:real;producto_id:string):real;
    procedure ActualizarSaldoDocumentoVenta(id:string; importe:real; inversa:boolean=false);
    procedure ActualizarSaldoDocumento(id: string; importe: Real; inversa:boolean=false);
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
    function horaservidor():string;
    function ControlCodigoProducto(codigo:string; producto_id:string; mostrar_mensaje:boolean):boolean;
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
    procedure MostrarProgreso;
    function EsCUITValido(Num:String):boolean;
    function DescargarArchivo( sURL, sArchivoLocal: String ): boolean;
    function EjecutarScriptDB(archivo_sql:string):boolean;
    function BorrarDocumentoVenta(documentoventa_id:string):boolean;
    function BorrarDocumentoCompra(documentocompra_id:string):boolean;

    function GetConfigTipoDocumento(documento_id: string; tipodocu_id:string; campo: string):string;
    procedure MostrarVentanaExcel;
    procedure GetBoolConfig(config_nombre:string;valor_true:string; var propiedad:boolean);
    procedure AbrirDocumentoVenta(id:string;tipodocu_nombre:string;abm:integer);
    procedure AbrirDocumentoCompra(id:string;tipodocu_nombre:string;abm:integer);
    procedure AbrirNuevoTipoDocumento;
    procedure AbrirModificarTipoDocumento(id:string);
    procedure AbrirNuevoPerfil;
    procedure AbrirModificarPerfil(id:string);
    function CargarDocumentoDocu(entidad_id: string; QDocumentoDocus:TDataset;documento_apagar:real;AgregarAutomatico:boolean;especie_id:string;tipodocu_nombre:string):boolean;
    Procedure AgregarDocumento(Cabecera: TDataSet; DocumentodocuImputacion: TDataSet; DocumentodocuRelacion: TDataSet; Pagos: TDataSet);
    Procedure ModificarDocumento(Cabecera: TDataSet; DocumentodocuImputacion: TDataSet; DocumentodocuRelacion: TDataSet; Pagos: TDataSet);
    procedure AbrirDocumento(id: string; tipodocu_nombre: string; abm: Integer);
    function CargarDocumentoMonetarioDocu(entidad_id: string; QDocumentoDocus:TDataset;documento_apagar:real; AgregarAutomatico:boolean; tipodocu_tipo:string; where_tipodocu:string=' and 1=1 '):boolean;
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

  VERSIONEXE='10';

  //Tipos Documentos
  TIPODOCU_FACTURAVENTA='Factura de Venta';
  TIPODOCU_RECIBO='Recibo';
  TIPODOCU_NOTACREDITOVENTA='Nota de Credito de Venta';
  TIPODOCU_NOTADEBITOVENTA='Nota de Debito de Venta';
  TIPODOCU_REMITOVENTA='Remito de Venta';

  TIPODOCU_FACTURACOMPRA='Factura de Compra';
  TIPODOCU_NOTACREDITOCOMPRA='Nota de Credito de Compra';
  TIPODOCU_NOTADEBITOCOMPRA='Nota de Debito de Compra';

  ABM_AGREGAR=1;
  ABM_MODIFICAR=2;
  ABM_ELIMINAR=3;
  ABM_IMPRIMIR=4;
  ABM_ANULAR=5;
  ABM_MOSTRAR=6;
  ABM_CLONAR=7;

//  CONNECTION_STRING1='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=';
//  CONNECTION_STRING3=';Mode=Share Deny None;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=35;'+
//                     'Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";'+
//                     'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''''t Copy Locale on Compact=False;'+
//                     'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;';


  TablaMul:Array[1..10] of Integer=(5,4,3,2,7,6,5,4,3,2); {Tabla Arbitraria}


implementation

uses Unitlocalidades, UnitConfiguracion, UnitABMbase, UnitListaSucursales,
     UnitListaPuntosdeVenta, UnitListaTiposDocumentos, UnitPersonal,
     UnitPerfil, UnitListaPerfiles, Unitlistatemplates, UnitlistaRoles,
     UnitlistaEntidades, UnitlistaRubros, UnitlistaControlEntidad,
  UnitTipoDocumento, Unitsaldoclientes, Unitestadodectas, Unitdetallectas,
  Unitrecibosventa, UnitListaDocumentos, UnitListaContratos,
  Unitlistaespeciesvariedades, UnitListaOrdendeCarga, UnitDocumentosPendientes,
  UnitListaContratosVentas, Unitlistarecibos, UnitRecibo, UnitCargarPagos,
  UnitlistaNotasCreditoVentas, UnitNotaCreditoVenta, UnitlistaFacturasVentas,
  UnitFacturaVenta, UnitNotaDebitoVenta, UnitlistaNotasDebitoVentas,
  UnitDocumentosDineroPendientes, UnitFacturaCompra, UnitlistaFacturasCompras,
  UnitNotaCreditoCompra, UnitlistaNotasCreditoCompras, UnitNotaDebitoCompra,
  UnitlistaNotasDebitoCompras;

{$R *.dfm}


function TPrinc.CargarDocumentoMonetarioDocu(entidad_id: string; QDocumentoDocus:TDataset;documento_apagar:real; AgregarAutomatico:boolean; tipodocu_tipo:string; where_tipodocu:string=' and 1=1 '):boolean;
begin
    DocumentosDineroPendientes:=TDocumentosDineroPendientes.Create(self);
    DocumentosDineroPendientes.entidad_id:=entidad_id;
    DocumentosDineroPendientes.where_tipodocu:=where_tipodocu;
    DocumentosDineroPendientes.tipodocu_tipo:=tipodocu_tipo;
    DocumentosDineroPendientes.ActivarConsulta;
    DocumentosDineroPendientes.documento_apagar:=documento_apagar;
    QDocumentoDocus.First;
    while not QDocumentoDocus.Eof do
        begin
            if DocumentosDineroPendientes.ZQDocumentosPendientes.Locate('documento_id',QDocumentoDocus.FieldByName('documento_idpago').AsString,[]) then
              begin
                  DocumentosDineroPendientes.ZQDocumentosPendientes.Edit;
                  DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documentodocu_importe').AsString:=QDocumentoDocus.FieldByName('documentodocu_importe').AsString;

                  DocumentosDineroPendientes.ZQDocumentosPendientes.Post;

              end;

            QDocumentoDocus.Next;
        end;
    if AgregarAutomatico then
      begin
          DocumentosDineroPendientes.btnimputardocumentos.Click;
      end
    else
      begin
          DocumentosDineroPendientes.Showmodal;
      end;




    if DocumentosDineroPendientes.ModalResult=mrOk then
      begin
          DocumentosDineroPendientes.ZQDocumentosPendientes.First;
          while not DocumentosDineroPendientes.ZQDocumentosPendientes.Eof do
              begin
                  if DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat<>0 then
                    begin
                        if QDocumentoDocus.Locate('documento_idpago',DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_id').AsString,[]) then
                          QDocumentoDocus.Edit
                        else
                          QDocumentoDocus.Insert;
                          
                        QDocumentoDocus.FieldByName('documento_id').AsString:='0';
                        QDocumentoDocus.FieldByName('documento_numero').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_numero').AsString;
                        QDocumentoDocus.FieldByName('documento_fecha').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_fecha').AsString;
                        QDocumentoDocus.FieldByName('documento_hora').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_hora').AsString;
                        QDocumentoDocus.FieldByName('documento_total').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_total').AsString;
                        QDocumentoDocus.FieldByName('documento_estado').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_estado').AsString;
                        QDocumentoDocus.FieldByName('documento_pagado').AsFloat:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_pagado').AsFloat+abs(DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat);
                        QDocumentoDocus.FieldByName('documento_saldo').AsFloat:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_saldo').AsFloat-abs(DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat);
                        QDocumentoDocus.FieldByName('entidad_id').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('entidad_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_id').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_id_1').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_nombre').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_nombre').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_tipo').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_tipo').AsString;
                        QDocumentoDocus.FieldByName('puntoventa_id').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_letra').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_letra').AsString;
                        QDocumentoDocus.FieldByName('puntoventa_id_1').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoDocus.FieldByName('puntoventa_numero').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('puntoventa_numero').AsString;
                        QDocumentoDocus.FieldByName('sucursal_id').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('sucursal_id').AsString;
                        QDocumentoDocus.FieldByName('documentodocu_importe').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsString;
                        QDocumentoDocus.FieldByName('documentodocu_id').AsString:='0';
                        QDocumentoDocus.FieldByName('documento_idpago').AsString:=DocumentosDineroPendientes.ZQDocumentosPendientes.FieldByName('documento_id').AsString;
                        QDocumentoDocus.FieldByName('documento_id_1').AsString:='0';
                        QDocumentoDocus.FieldByName('documentodocu_tiporelacion').AsString:='IMPUTACION';
                        QDocumentoDocus.Post;


                    end;


                  DocumentosDineroPendientes.ZQDocumentosPendientes.Next;
              end;

          result:=true;
      end
    else
      result:=false;

    DocumentosDineroPendientes.Free;





end;





function TPrinc.CargarDocumentoDocu(entidad_id: string; QDocumentoDocus:TDataset;documento_apagar:real;AgregarAutomatico:boolean;especie_id:string;tipodocu_nombre:string):boolean;
begin
    DocumentosPendientes:=TDocumentosPendientes.Create(self);
    DocumentosPendientes.entidad_id:=entidad_id;
    if tipodocu_nombre='Contrato de Compra' then
      DocumentosPendientes.Caption:='Contratos de Compra de '+Princ.buscar('select entidad_razonsocial from entidades where entidad_id="'+entidad_id+'"','entidad_razonsocial');

    if tipodocu_nombre='Contrato de Venta' then
      DocumentosPendientes.Caption:='Contratos de Venta';
    DocumentosPendientes.especie_id:=especie_id;
    DocumentosPendientes.tipodocu_nombre:=tipodocu_nombre;
    DocumentosPendientes.ActivarConsulta;
    DocumentosPendientes.documento_apagar:=documento_apagar;
    QDocumentoDocus.First;
    while not QDocumentoDocus.Eof do
        begin
            if DocumentosPendientes.ZQDocumentosPendientes.Locate('documento_id',QDocumentoDocus.FieldByName('documento_idpago').AsString,[]) then
              begin
                  DocumentosPendientes.ZQDocumentosPendientes.Edit;
                  DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsString:=QDocumentoDocus.FieldByName('documentodocu_importe').AsString;
                  DocumentosPendientes.ZQDocumentosPendientes.Post;

              end;

            QDocumentoDocus.Next;
        end;
    if AgregarAutomatico then
      begin
          DocumentosPendientes.btnimputardocumentos.Click;
      end
    else
      begin
          DocumentosPendientes.Showmodal;
      end;




    if DocumentosPendientes.ModalResult=mrOk then
      begin
          DocumentosPendientes.ZQDocumentosPendientes.First;
          while not DocumentosPendientes.ZQDocumentosPendientes.Eof do
              begin
                  if DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat<>0 then
                    begin
                        if QDocumentoDocus.Locate('documento_idpago',DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_id').AsString,[]) then
                          QDocumentoDocus.Edit
                        else
                          QDocumentoDocus.Insert;
                          
                        QDocumentoDocus.FieldByName('documento_id').AsString:='0';
                        QDocumentoDocus.FieldByName('documento_numero').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_numero').AsString;
                        QDocumentoDocus.FieldByName('documento_fecha').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_fecha').AsString;
                        QDocumentoDocus.FieldByName('documento_hora').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_hora').AsString;
                        QDocumentoDocus.FieldByName('documento_total').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_total').AsString;
                        QDocumentoDocus.FieldByName('documento_estado').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_estado').AsString;
                        QDocumentoDocus.FieldByName('documento_pagado').AsFloat:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_pagado').AsFloat+DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat;
                        QDocumentoDocus.FieldByName('documento_saldo').AsFloat:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_saldo').AsFloat-DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat;
                        QDocumentoDocus.FieldByName('entidad_id').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('entidad_id').AsString;
                        QDocumentoDocus.FieldByName('especie_id').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('especie_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_id').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_id_1').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_nombre').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_nombre').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_tipo').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_tipo').AsString;
                        QDocumentoDocus.FieldByName('puntoventa_id').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoDocus.FieldByName('tipodocu_letra').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('tipodocu_letra').AsString;
                        QDocumentoDocus.FieldByName('puntoventa_id_1').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('puntoventa_id').AsString;
                        QDocumentoDocus.FieldByName('puntoventa_numero').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('puntoventa_numero').AsString;
                        QDocumentoDocus.FieldByName('sucursal_id').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('sucursal_id').AsString;
                        QDocumentoDocus.FieldByName('documentodocu_importe').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsString;
                        QDocumentoDocus.FieldByName('documentodocu_pagado').AsFloat:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_pagado').AsFloat+DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat;
                        QDocumentoDocus.FieldByName('documentodocu_saldo').AsFloat:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_saldo').AsFloat-DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat;
                        QDocumentoDocus.FieldByName('documentodocu_id').AsString:='0';
                        QDocumentoDocus.FieldByName('documento_idpago').AsString:=DocumentosPendientes.ZQDocumentosPendientes.FieldByName('documento_id').AsString;
                        QDocumentoDocus.FieldByName('documento_id_1').AsString:='0';
                        QDocumentoDocus.Post;


                    end;


                  DocumentosPendientes.ZQDocumentosPendientes.Next;
              end;

          result:=true;
      end
    else
      result:=false;

    DocumentosPendientes.Free;





end;





procedure TPrinc.AbrirNuevoPerfil;
begin

end;


procedure TPrinc.AbrirModificarPerfil(id:string);
begin

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
//    AdvToolBarDocVentas.AutoPositionControls:=false;
//    AdvToolBarCtasCtesVentas.AutoPositionControls:=false;
//    AdvToolBarCaja.AutoPositionControls:=false;
 //   AdvToolBarGeneral.AutoPositionControls:=false;
   // AdvToolBarProveedores.AutoPositionControls:=false;
 //   AdvToolBarLocalidades.AutoPositionControls:=false;
  //  AdvToolBarEmpresa.AutoPositionControls:=false;
//    AdvToolBarDocCompras.AutoPositionControls:=false;
  //  AdvToolBarHerramientas.AutoPositionControls:=false;


//    AdvToolBarDocVentas.AutoSize:=false;
 //   AdvToolBarCtasCtesVentas.AutoSize:=false;
 //   AdvToolBarCaja.AutoSize:=false;
 //   AdvToolBarGeneral.AutoSize:=false;
  //  AdvToolBarProveedores.AutoSize:=false;
   // AdvToolBarLocalidades.AutoSize:=false;
  //  AdvToolBarEmpresa.AutoSize:=false;
  //  AdvToolBarDocCompras.AutoSize:=false;
  //  AdvToolBarHerramientas.AutoSize:=false;


 //   AdvToolBarDocVentas.AutoPositionControls:=true;
 //   AdvToolBarCtasCtesVentas.AutoPositionControls:=true;
 //   AdvToolBarCaja.AutoPositionControls:=true;
 //   AdvToolBarGeneral.AutoPositionControls:=true;
 //   AdvToolBarProveedores.AutoPositionControls:=true;
 //   AdvToolBarLocalidades.AutoPositionControls:=true;
  //  AdvToolBarEmpresa.AutoPositionControls:=true;
  //  AdvToolBarDocCompras.AutoPositionControls:=true;
  //  AdvToolBarHerramientas.AutoPositionControls:=true;

  //  AdvToolBarDocVentas.AutoSize:=true;
  //  AdvToolBarCtasCtesVentas.AutoSize:=true;
  //  AdvToolBarCaja.AutoSize:=true;
   // AdvToolBarGeneral.AutoSize:=true;
  //  AdvToolBarProveedores.AutoSize:=true;
  //  AdvToolBarLocalidades.AutoSize:=true;
  //  AdvToolBarEmpresa.AutoSize:=true;
   // AdvToolBarDocCompras.AutoSize:=true;
   // AdvToolBarHerramientas.AutoSize:=true;



end;

procedure TPrinc.AbrirDocumento(id: string; tipodocu_nombre: string; abm: Integer);
begin
    if tipodocu_nombre=TIPODOCU_RECIBO then
      begin
          try
            recibo:=Trecibo.Create(self);
          finally
            recibo.abm:=abm;
            recibo.id:=id;
            recibo.tipodocu_nombre:=tipodocu_nombre;
            recibo.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_NOTACREDITOVENTA then
      begin
          try
            NotaCreditoVenta:=TNotaCreditoVenta.Create(self);
          finally
            NotaCreditoVenta.abm:=abm;
            NotaCreditoVenta.id:=id;
            NotaCreditoVenta.tipodocu_nombre:=tipodocu_nombre;
            NotaCreditoVenta.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_FACTURAVENTA then
      begin
          try
            facturaventa:=Tfacturaventa.Create(self);
          finally
            facturaventa.abm:=abm;
            facturaventa.id:=id;
            facturaventa.tipodocu_nombre:=tipodocu_nombre;
            facturaventa.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_NOTADEBITOVENTA then
      begin
          try
            NotaDebitoVenta:=TNotaDebitoVenta.Create(self);
          finally
            NotaDebitoVenta.abm:=abm;
            NotaDebitoVenta.id:=id;
            NotaDebitoVenta.tipodocu_nombre:=tipodocu_nombre;
            NotaDebitoVenta.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_FACTURACOMPRA then
      begin
          try
            facturacompra:=Tfacturacompra.Create(self);
          finally
            facturacompra.abm:=abm;
            facturacompra.id:=id;
            facturacompra.tipodocu_nombre:=tipodocu_nombre;
            facturacompra.Show;
          end;
      end;


    if tipodocu_nombre=TIPODOCU_NOTACREDITOCOMPRA then
      begin
          try
            NotaCreditoCompra:=TNotaCreditoCompra.Create(self);
          finally
            NotaCreditoCompra.abm:=abm;
            NotaCreditoCompra.id:=id;
            NotaCreditoCompra.tipodocu_nombre:=tipodocu_nombre;
            NotaCreditoCompra.Show;
          end;
      end;

    if tipodocu_nombre=TIPODOCU_NOTADEBITOCOMPRA then
      begin
          try
            NotaDebitoCompra:=TNotaDebitoCompra.Create(self);
          finally
            NotaDebitoCompra.abm:=abm;
            NotaDebitoCompra.id:=id;
            NotaDebitoCompra.tipodocu_nombre:=tipodocu_nombre;
            NotaDebitoCompra.Show;
          end;
      end;
end;

procedure TPrinc.AbrirDocumentoVenta(id: string; tipodocu_nombre: string; abm: Integer);
begin
    if tipodocu_nombre='Factura de Venta' then
      begin
          try
            FacturaVenta:=TFacturaVenta.Create(self);
          finally
            FacturaVenta.abm:=abm;
            FacturaVenta.id:=id;
            FacturaVenta.Show;
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

end;

procedure TPrinc.AbrirDocumentoCompra(id: string; tipodocu_nombre: string; abm: Integer);
begin

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
end;


function TPrinc.GetConfigTipoDocumento(documento_id: string; tipodocu_id:string; campo: string):string;
begin
    if tipodocu_id='' then
      Result := Princ.buscar('select '+campo+' from tiposdocumento inner join documentos on tiposdocumento.tipodocu_id=documentosventas.tipodocu_id where documentos.documento_id="'+documento_id+'"',campo)
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
end;

procedure TPrinc.AbrirModificarCajaAsientoEgreso(id:string);
begin


end;


procedure TPrinc.AbrirNuevoCajaAsientoIngreso;
begin

end;

procedure TPrinc.AbrirModificarCajaAsientoIngreso(id:string);
begin

end;


procedure TPrinc.AbrirModificarCajaAsiento(id:string);
begin

end;



procedure TPrinc.AbrirNuevoCajaAsiento;
begin

end;

procedure TPrinc.AbrirModificarCliente(id:string);
begin


end;


procedure TPrinc.AbrirNuevoCliente;
begin


end;


procedure TPrinc.AbrirModificarProveedores(id:string);
begin



end;


procedure TPrinc.AbrirNuevoProveedores;
begin
end;



procedure TPrinc.AbrirModificarCalculoprecios(id:string);
begin



end;


procedure TPrinc.AbrirNuevoCalculoprecios;
begin

end;




procedure TPrinc.AbrirModificarServicio(id:string);
begin



end;


procedure TPrinc.AbrirNuevoServicio;
begin

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




function TPrinc.ControlCodigoProducto(codigo: string; producto_id: string; mostrar_mensaje:boolean):boolean;
begin
    ZQProductosABM.Active:=false;
    ZQProductosABM.SQL.Text:='select * from productos '+
                             'where concat(producto_id,"")="'+codigo+'" '+
                             'or producto_codigo="'+codigo+'" '+
                             'or producto_codigobarras="'+codigo+'"';

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



function TPrinc.horaservidor():string;
var
  hora:string;
begin
    hora:=buscar('select TIME_FORMAT(CURTIME(),"%H:%i:%s") as hora','hora');

    Result:=(hora);

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


Procedure TPrinc.ModificarDocumento(Cabecera: TDataSet; DocumentodocuImputacion: TDataSet; DocumentodocuRelacion: TDataSet; Pagos: TDataSet);
var
  documento_pagado:string;
  documento_saldo:string;
  documento_estado:string;
begin
    ZQExcecSQL.SQL.Clear;
    ZQExcecSQL.SQL.Add('begin');
    ZQExcecSQL.ExecSQL;

    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('update documentos set ');
    ZQExcecSQL.Sql.Add('documento_cartaportetarifaflete=:documento_cartaportetarifaflete, ');
    ZQExcecSQL.Sql.Add('documento_transpanticipo=:documento_transpanticipo, ');
    ZQExcecSQL.Sql.Add('documento_transptarifaflete=:documento_transptarifaflete, ');
    ZQExcecSQL.Sql.Add('documento_transpacoplado=:documento_transpacoplado, ');
    ZQExcecSQL.Sql.Add('documento_transpchasis=:documento_transpchasis, ');
    ZQExcecSQL.Sql.Add('documento_chofercuit=:documento_chofercuit, ');
    ZQExcecSQL.Sql.Add('documento_chofer=:documento_chofer, ');
    ZQExcecSQL.Sql.Add('entidaddadorcarga_id=:entidaddadorcarga_id, ');
    ZQExcecSQL.Sql.Add('documento_tara=:documento_tara, ');
    ZQExcecSQL.Sql.Add('documento_kgbrutos=:documento_kgbrutos, ');
    ZQExcecSQL.Sql.Add('documento_numerocartaporte=:documento_numerocartaporte, ');
    ZQExcecSQL.Sql.Add('documento_tipodestino=:documento_tipodestino, ');
    ZQExcecSQL.Sql.Add('documento_condicioncalidad=:documento_condicioncalidad, ');
    ZQExcecSQL.Sql.Add('documento_tipooperacion=:documento_tipooperacion, ');
    ZQExcecSQL.Sql.Add('documento_lugarentrega=:documento_lugarentrega, ');
    ZQExcecSQL.Sql.Add('documento_preciounitario=:documento_preciounitario, ');
    ZQExcecSQL.Sql.Add('documento_moneda=:documento_moneda, ');
    ZQExcecSQL.Sql.Add('documento_fechacumplimiento=:documento_fechacumplimiento, ');
    ZQExcecSQL.Sql.Add('especie_id=:especie_id, ');
    ZQExcecSQL.Sql.Add('entidadtransportista_id=:entidadtransportista_id, ');
    ZQExcecSQL.Sql.Add('entidad_id=:entidad_id, ');
    ZQExcecSQL.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQExcecSQL.Sql.Add('documento_documentacion=:documento_documentacion, ');
    ZQExcecSQL.Sql.Add('documento_calidad=:documento_calidad, ');
    ZQExcecSQL.Sql.Add('documento_otrosimpuestos=:documento_otrosimpuestos, ');
    ZQExcecSQL.Sql.Add('documento_dgrperc=:documento_dgrperc, ');
    ZQExcecSQL.Sql.Add('documento_dgrret=:documento_dgrret, ');
    ZQExcecSQL.Sql.Add('documento_ivaperc=:documento_ivaperc, ');
    ZQExcecSQL.Sql.Add('documento_ivaret=:documento_ivaret, ');
    ZQExcecSQL.Sql.Add('documento_observaciones=:documento_observaciones, ');
    ZQExcecSQL.Sql.Add('documento_iva27=:documento_iva27, ');
    ZQExcecSQL.Sql.Add('documento_neto27=:documento_neto27, ');
    ZQExcecSQL.Sql.Add('documento_iva105=:documento_iva105, ');
    ZQExcecSQL.Sql.Add('documento_neto105=:documento_neto105, ');
    ZQExcecSQL.Sql.Add('documento_iva21=:documento_iva21, ');
    ZQExcecSQL.Sql.Add('documento_neto21=:documento_neto21, ');
    ZQExcecSQL.Sql.Add('documento_estado=:documento_estado, ');
    ZQExcecSQL.Sql.Add('documento_pagado=:documento_pagado, ');
    ZQExcecSQL.Sql.Add('documento_saldo=:documento_saldo, ');
    ZQExcecSQL.Sql.Add('documento_total=:documento_total, ');
    ZQExcecSQL.Sql.Add('documento_numero=:documento_numero, ');
    ZQExcecSQL.Sql.Add('documento_hora=:documento_hora, ');
    ZQExcecSQL.Sql.Add('documento_fechavenc=:documento_fechavenc, ');
    ZQExcecSQL.Sql.Add('documento_fecha=:documento_fecha, ');
    ZQExcecSQL.Sql.Add('documento_nogravado=:documento_nogravado ');
    ZQExcecSQL.Sql.Add('where documento_id=:documento_id ');
    ZQExcecSQL.ParamByName('documento_cartaportetarifaflete').AsString:=Cabecera.FieldByName('documento_cartaportetarifaflete').AsString;
    ZQExcecSQL.ParamByName('documento_transpanticipo').AsString:=Cabecera.FieldByName('documento_transpanticipo').AsString;
    ZQExcecSQL.ParamByName('documento_transptarifaflete').AsString:=Cabecera.FieldByName('documento_transptarifaflete').AsString;
    ZQExcecSQL.ParamByName('documento_transpacoplado').AsString:=Cabecera.FieldByName('documento_transpacoplado').AsString;
    ZQExcecSQL.ParamByName('documento_transpchasis').AsString:=Cabecera.FieldByName('documento_transpchasis').AsString;
    ZQExcecSQL.ParamByName('documento_chofercuit').AsString:=Cabecera.FieldByName('documento_chofercuit').AsString;
    ZQExcecSQL.ParamByName('documento_chofer').AsString:=Cabecera.FieldByName('documento_chofer').AsString;
    ZQExcecSQL.ParamByName('entidaddadorcarga_id').AsString:=Cabecera.FieldByName('entidaddadorcarga_id').AsString;
    ZQExcecSQL.ParamByName('documento_tara').AsString:=Cabecera.FieldByName('documento_tara').AsString;
    ZQExcecSQL.ParamByName('documento_kgbrutos').AsString:=Cabecera.FieldByName('documento_kgbrutos').AsString;
    ZQExcecSQL.ParamByName('documento_numerocartaporte').AsString:=Cabecera.FieldByName('documento_numerocartaporte').AsString;
    ZQExcecSQL.ParamByName('documento_tipodestino').AsString:=Cabecera.FieldByName('documento_tipodestino').AsString;
    ZQExcecSQL.ParamByName('documento_condicioncalidad').AsString:=Cabecera.FieldByName('documento_condicioncalidad').AsString;
    ZQExcecSQL.ParamByName('documento_tipooperacion').AsString:=Cabecera.FieldByName('documento_tipooperacion').AsString;
    ZQExcecSQL.ParamByName('documento_lugarentrega').AsString:=Cabecera.FieldByName('documento_lugarentrega').AsString;
    ZQExcecSQL.ParamByName('documento_preciounitario').AsString:=Cabecera.FieldByName('documento_preciounitario').AsString;
    ZQExcecSQL.ParamByName('documento_moneda').AsString:=Cabecera.FieldByName('documento_moneda').AsString;
    ZQExcecSQL.ParamByName('documento_fechacumplimiento').AsString:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documento_fechacumplimiento').AsDateTime);
    ZQExcecSQL.ParamByName('especie_id').AsString:=Cabecera.FieldByName('especie_id').AsString;
    ZQExcecSQL.ParamByName('entidadtransportista_id').AsString:=Cabecera.FieldByName('entidadtransportista_id').AsString;
    ZQExcecSQL.ParamByName('entidad_id').AsString:=Cabecera.FieldByName('entidad_id').AsString;
    ZQExcecSQL.ParamByName('tipodocu_id').AsString:=Cabecera.FieldByName('tipodocu_id').AsString;
    ZQExcecSQL.ParamByName('documento_documentacion').AsString:=Cabecera.FieldByName('documento_documentacion').AsString;
    ZQExcecSQL.ParamByName('documento_calidad').AsString:=Cabecera.FieldByName('documento_calidad').AsString;
    ZQExcecSQL.ParamByName('documento_otrosimpuestos').AsString:=Cabecera.FieldByName('documento_otrosimpuestos').AsString;
    ZQExcecSQL.ParamByName('documento_dgrperc').AsString:=Cabecera.FieldByName('documento_dgrperc').AsString;
    ZQExcecSQL.ParamByName('documento_dgrret').AsString:=Cabecera.FieldByName('documento_dgrret').AsString;
    ZQExcecSQL.ParamByName('documento_ivaperc').AsString:=Cabecera.FieldByName('documento_ivaperc').AsString;
    ZQExcecSQL.ParamByName('documento_ivaret').AsString:=Cabecera.FieldByName('documento_ivaret').AsString;
    ZQExcecSQL.ParamByName('documento_observaciones').AsString:=Cabecera.FieldByName('documento_observaciones').AsString;
    ZQExcecSQL.ParamByName('documento_iva27').AsString:=Cabecera.FieldByName('documento_iva27').AsString;
    ZQExcecSQL.ParamByName('documento_neto27').AsString:=Cabecera.FieldByName('documento_neto27').AsString;
    ZQExcecSQL.ParamByName('documento_iva105').AsString:=Cabecera.FieldByName('documento_iva105').AsString;
    ZQExcecSQL.ParamByName('documento_neto105').AsString:=Cabecera.FieldByName('documento_neto105').AsString;
    ZQExcecSQL.ParamByName('documento_iva21').AsString:=Cabecera.FieldByName('documento_iva21').AsString;
    ZQExcecSQL.ParamByName('documento_neto21').AsString:=Cabecera.FieldByName('documento_neto21').AsString;
    ZQExcecSQL.ParamByName('documento_estado').AsString:=Cabecera.FieldByName('documento_estado').AsString;
    ZQExcecSQL.ParamByName('documento_pagado').AsString:=Cabecera.FieldByName('documento_pagado').AsString;
    ZQExcecSQL.ParamByName('documento_saldo').AsString:=Cabecera.FieldByName('documento_saldo').AsString;
    ZQExcecSQL.ParamByName('documento_total').AsString:=Cabecera.FieldByName('documento_total').AsString;
    ZQExcecSQL.ParamByName('documento_numero').AsString:=Cabecera.FieldByName('documento_numero').AsString;
    ZQExcecSQL.ParamByName('documento_hora').AsString:=Cabecera.FieldByName('documento_hora').AsString;
    ZQExcecSQL.ParamByName('documento_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documento_fechavenc').AsDateTime);
    ZQExcecSQL.ParamByName('documento_fecha').AsString:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documento_fecha').AsDateTime);
    ZQExcecSQL.ParamByName('documento_nogravado').AsString:=Cabecera.FieldByName('documento_nogravado').AsString;
    ZQExcecSQL.ParamByName('documento_id').AsString:=Cabecera.FieldByName('documento_id').AsString;
    ZQExcecSQL.ExecSql;


    if DocumentodocuImputacion<>nil then
      begin
          ZQDocumentodocus.Active:=false;
          ZQDocumentodocus.SQL.Text:='select * from documentosdocu where documento_id="'+Cabecera.FieldByName('documento_id').AsString+'" and documentodocu_tiporelacion="IMPUTACION"';
          ZQDocumentodocus.Active:=true;
          ZQDocumentodocus.First;
          while not ZQDocumentodocus.Eof do
              begin
                  ActualizarSaldoDocumento(ZQDocumentodocus.FieldByName('documento_idpago').AsString,abs(ZQDocumentodocus.FieldByName('documentodocu_importe').AsFloat), true);
                  ZQDocumentodocus.Next;
              end;
          ZQDocumentodocus.Active:=false;

          ZQExcecSQL.SQL.Text:='delete from documentosdocu where documento_id="'+Cabecera.FieldByName('documento_id').AsString+'" and documentodocu_tiporelacion="IMPUTACION"';
          ZQExcecSQL.ExecSQL;

          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('insert into documentosdocu set ');
          ZQExcecSQL.Sql.Add('documentodocu_tiporelacion=:documentodocu_tiporelacion, ');
          ZQExcecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
          ZQExcecSQL.Sql.Add('documento_id=:documento_id, ');
          ZQExcecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
          ZQExcecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
          ZQExcecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
          ZQExcecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
          ZQExcecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
          DocumentodocuImputacion.First;
          while not DocumentodocuImputacion.Eof do
              begin
                  ZQExcecSQL.ParamByName('documentodocu_tiporelacion').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_tiporelacion').AsString;
                  ZQExcecSQL.ParamByName('documento_idpago').AsString:=DocumentodocuImputacion.FieldByName('documento_idpago').AsString;
                  ZQExcecSQL.ParamByName('documento_id').AsString:=Cabecera.FieldByName('documento_id').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_saldo').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_saldo').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_pagado').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_pagado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_estado').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_estado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_importe').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_importe').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
                  ZQExcecSQL.ExecSql;

                  ActualizarSaldoDocumentoVenta(DocumentodocuImputacion.FieldByName('documento_idpago').AsString,DocumentodocuImputacion.FieldByName('documentodoc_importe').AsFloat);

                  DocumentodocuImputacion.Next;
              end;

          documento_pagado:=princ.buscar('select sum(documentodocu_importe) as pagado from documentosdocu where documento_id="'+Cabecera.FieldByName('documento_id').AsString+'"','pagado');
          if documento_pagado='' then
            documento_pagado:='0';

          documento_saldo:=floattostr(Cabecera.FieldByName('documento_total').AsFloat-strtofloat(documento_pagado));
          documento_estado:='PAGADA';
          if strtofloat(documento_saldo)>0then
            documento_estado:='PENDIENTE';

          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('update documentos set ');
          ZQExcecSQL.Sql.Add('documento_estado=:documento_estado, ');
          ZQExcecSQL.Sql.Add('documento_pagado=:documento_pagado, ');
          ZQExcecSQL.Sql.Add('documento_saldo=:documento_saldo ');
          ZQExcecSQL.Sql.Add('where documento_id=:documento_id ');
          ZQExcecSQL.ParamByName('documento_estado').AsString:=documento_estado;
          ZQExcecSQL.ParamByName('documento_pagado').AsString:=documento_pagado;
          ZQExcecSQL.ParamByName('documento_saldo').AsString:=documento_saldo;
          ZQExcecSQL.ParamByName('documento_id').AsString:=Cabecera.FieldByName('documento_id').AsString;
          ZQExcecSQL.ExecSql;


      end;

    if DocumentodocuRelacion<>nil then
      begin
          ZQExcecSQL.SQL.Text:='delete from documentosdocu where documento_id="'+Cabecera.FieldByName('documento_id').AsString+'" and documentodocu_tiporelacion="RELACION"';
          ZQExcecSQL.ExecSQL;

          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('insert into documentosdocu set ');
          ZQExcecSQL.Sql.Add('documentodocu_tiporelacion=:documentodocu_tiporelacion, ');
          ZQExcecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
          ZQExcecSQL.Sql.Add('documento_id=:documento_id, ');
          ZQExcecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
          ZQExcecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
          ZQExcecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
          ZQExcecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
          ZQExcecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
          DocumentodocuRelacion.First;
          while not DocumentodocuRelacion.Eof do
              begin
                  ZQExcecSQL.ParamByName('documentodocu_tiporelacion').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_tiporelacion').AsString;
                  ZQExcecSQL.ParamByName('documento_idpago').AsString:=DocumentodocuRelacion.FieldByName('documento_idpago').AsString;
                  ZQExcecSQL.ParamByName('documento_id').AsString:=Cabecera.FieldByName('documento_id').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_saldo').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_saldo').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_pagado').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_pagado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_estado').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_estado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_importe').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_importe').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
                  ZQExcecSQL.ExecSql;

                  DocumentodocuImputacion.Next;
              end;

      end;

    if Pagos<>nil then
      begin
          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('delete from documentopagos ');
          ZQExcecSQL.Sql.Add('where documento_id=:documento_id ');
          ZQExcecSQL.ParamByName('documento_id').AsString:=Cabecera.FieldByName('documento_id').AsString;
          ZQExcecSQL.ExecSql;

          Pagos.First;
          while not Pagos.Eof do
              begin
                  ZQExcecSQL.Sql.Clear;
                  ZQExcecSQL.Sql.Add('insert into documentopagos set ');
                  ZQExcecSQL.Sql.Add('documento_id=:documento_id, ');
                  ZQExcecSQL.Sql.Add('tipopago_id=:tipopago_id, ');
                  ZQExcecSQL.Sql.Add('documentopago_importe=:documentopago_importe, ');
                  ZQExcecSQL.Sql.Add('documentopago_nombre=:documentopago_nombre, ');
                  ZQExcecSQL.Sql.Add('documentopago_id=:documentopago_id ');
                  ZQExcecSQL.ParamByName('documento_id').AsString:=Cabecera.FieldByName('documento_id').AsString;
                  ZQExcecSQL.ParamByName('tipopago_id').AsString:=Pagos.FieldByName('tipopago_id').AsString;
                  ZQExcecSQL.ParamByName('documentopago_importe').AsString:=Pagos.FieldByName('documentopago_importe').AsString;
                  ZQExcecSQL.ParamByName('documentopago_nombre').AsString:=Pagos.FieldByName('documentopago_nombre').AsString;
                  ZQExcecSQL.ParamByName('documentopago_id').AsString:=Princ.codigo('documentopagos','documentopago_id');
                  ZQExcecSQL.ExecSql;

                  Pagos.Next;
              end;
      end;

    ZQExcecSQL.SQL.Clear;
    ZQExcecSQL.SQL.Add('commit');
    ZQExcecSQL.ExecSQL;

end;


Procedure TPrinc.AgregarDocumento(Cabecera: TDataSet; DocumentodocuImputacion: TDataSet; DocumentodocuRelacion: TDataSet; Pagos: TDataSet);
var
  id:string;
  documento_numero:string;
begin
    ZQExcecSQL.SQL.Clear;
    ZQExcecSQL.SQL.Add('begin');
    ZQExcecSQL.ExecSQL;

    id:=codigo('documentos', 'documento_id');
    Cabecera.First;
    documento_numero:=Princ.NumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString,Cabecera.FieldByName('documento_numero').AsString);
    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+Cabecera.FieldByName('tipodocu_id').AsString+'"','tipodocu_fiscal')) then
      documento_numero:='0';


    ZQExcecSQL.Sql.Clear;
    ZQExcecSQL.Sql.Add('insert into documentos set ');
    ZQExcecSQL.Sql.Add('documento_cartaportetarifaflete=:documento_cartaportetarifaflete, ');
    ZQExcecSQL.Sql.Add('documento_transpanticipo=:documento_transpanticipo, ');
    ZQExcecSQL.Sql.Add('documento_transptarifaflete=:documento_transptarifaflete, ');
    ZQExcecSQL.Sql.Add('documento_transpacoplado=:documento_transpacoplado, ');
    ZQExcecSQL.Sql.Add('documento_transpchasis=:documento_transpchasis, ');
    ZQExcecSQL.Sql.Add('documento_chofercuit=:documento_chofercuit, ');
    ZQExcecSQL.Sql.Add('documento_chofer=:documento_chofer, ');
    ZQExcecSQL.Sql.Add('entidaddadorcarga_id=:entidaddadorcarga_id, ');
    ZQExcecSQL.Sql.Add('documento_tara=:documento_tara, ');
    ZQExcecSQL.Sql.Add('documento_kgbrutos=:documento_kgbrutos, ');
    ZQExcecSQL.Sql.Add('documento_numerocartaporte=:documento_numerocartaporte, ');
    ZQExcecSQL.Sql.Add('documento_tipodestino=:documento_tipodestino, ');
    ZQExcecSQL.Sql.Add('documento_condicioncalidad=:documento_condicioncalidad, ');
    ZQExcecSQL.Sql.Add('documento_tipooperacion=:documento_tipooperacion, ');
    ZQExcecSQL.Sql.Add('documento_lugarentrega=:documento_lugarentrega, ');
    ZQExcecSQL.Sql.Add('documento_preciounitario=:documento_preciounitario, ');
    ZQExcecSQL.Sql.Add('documento_moneda=:documento_moneda, ');
    ZQExcecSQL.Sql.Add('documento_fechacumplimiento=:documento_fechacumplimiento, ');
    ZQExcecSQL.Sql.Add('especie_id=:especie_id, ');
    ZQExcecSQL.Sql.Add('entidadtransportista_id=:entidadtransportista_id, ');
    ZQExcecSQL.Sql.Add('entidad_id=:entidad_id, ');
    ZQExcecSQL.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQExcecSQL.Sql.Add('documento_documentacion=:documento_documentacion, ');
    ZQExcecSQL.Sql.Add('documento_calidad=:documento_calidad, ');
    ZQExcecSQL.Sql.Add('documento_otrosimpuestos=:documento_otrosimpuestos, ');
    ZQExcecSQL.Sql.Add('documento_dgrperc=:documento_dgrperc, ');
    ZQExcecSQL.Sql.Add('documento_dgrret=:documento_dgrret, ');
    ZQExcecSQL.Sql.Add('documento_ivaperc=:documento_ivaperc, ');
    ZQExcecSQL.Sql.Add('documento_ivaret=:documento_ivaret, ');
    ZQExcecSQL.Sql.Add('documento_observaciones=:documento_observaciones, ');
    ZQExcecSQL.Sql.Add('documento_iva27=:documento_iva27, ');
    ZQExcecSQL.Sql.Add('documento_neto27=:documento_neto27, ');
    ZQExcecSQL.Sql.Add('documento_iva105=:documento_iva105, ');
    ZQExcecSQL.Sql.Add('documento_neto105=:documento_neto105, ');
    ZQExcecSQL.Sql.Add('documento_iva21=:documento_iva21, ');
    ZQExcecSQL.Sql.Add('documento_neto21=:documento_neto21, ');
    ZQExcecSQL.Sql.Add('documento_estado=:documento_estado, ');
    ZQExcecSQL.Sql.Add('documento_pagado=:documento_pagado, ');
    ZQExcecSQL.Sql.Add('documento_saldo=:documento_saldo, ');
    ZQExcecSQL.Sql.Add('documento_total=:documento_total, ');
    ZQExcecSQL.Sql.Add('documento_numero=:documento_numero, ');
    ZQExcecSQL.Sql.Add('documento_hora=:documento_hora, ');
    ZQExcecSQL.Sql.Add('documento_fechavenc=:documento_fechavenc, ');
    ZQExcecSQL.Sql.Add('documento_fecha=:documento_fecha, ');
    ZQExcecSQL.Sql.Add('documento_nogravado=:documento_nogravado, ');
    ZQExcecSQL.Sql.Add('documento_id=:documento_id ');
    ZQExcecSQL.ParamByName('documento_cartaportetarifaflete').AsString:=Cabecera.FieldByName('documento_cartaportetarifaflete').AsString;
    ZQExcecSQL.ParamByName('documento_transpanticipo').AsString:=Cabecera.FieldByName('documento_transpanticipo').AsString;
    ZQExcecSQL.ParamByName('documento_transptarifaflete').AsString:=Cabecera.FieldByName('documento_transptarifaflete').AsString;
    ZQExcecSQL.ParamByName('documento_transpacoplado').AsString:=Cabecera.FieldByName('documento_transpacoplado').AsString;
    ZQExcecSQL.ParamByName('documento_transpchasis').AsString:=Cabecera.FieldByName('documento_transpchasis').AsString;
    ZQExcecSQL.ParamByName('documento_chofercuit').AsString:=Cabecera.FieldByName('documento_chofercuit').AsString;
    ZQExcecSQL.ParamByName('documento_chofer').AsString:=Cabecera.FieldByName('documento_chofer').AsString;
    ZQExcecSQL.ParamByName('entidaddadorcarga_id').AsString:=Cabecera.FieldByName('entidaddadorcarga_id').AsString;
    ZQExcecSQL.ParamByName('documento_tara').AsString:=Cabecera.FieldByName('documento_tara').AsString;
    ZQExcecSQL.ParamByName('documento_kgbrutos').AsString:=Cabecera.FieldByName('documento_kgbrutos').AsString;
    ZQExcecSQL.ParamByName('documento_numerocartaporte').AsString:=Cabecera.FieldByName('documento_numerocartaporte').AsString;
    ZQExcecSQL.ParamByName('documento_tipodestino').AsString:=Cabecera.FieldByName('documento_tipodestino').AsString;
    ZQExcecSQL.ParamByName('documento_condicioncalidad').AsString:=Cabecera.FieldByName('documento_condicioncalidad').AsString;
    ZQExcecSQL.ParamByName('documento_tipooperacion').AsString:=Cabecera.FieldByName('documento_tipooperacion').AsString;
    ZQExcecSQL.ParamByName('documento_lugarentrega').AsString:=Cabecera.FieldByName('documento_lugarentrega').AsString;
    ZQExcecSQL.ParamByName('documento_preciounitario').AsString:=Cabecera.FieldByName('documento_preciounitario').AsString;
    ZQExcecSQL.ParamByName('documento_moneda').AsString:=Cabecera.FieldByName('documento_moneda').AsString;
    ZQExcecSQL.ParamByName('documento_fechacumplimiento').AsString:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documento_fechacumplimiento').AsDateTime);
    ZQExcecSQL.ParamByName('especie_id').AsString:=Cabecera.FieldByName('especie_id').AsString;
    ZQExcecSQL.ParamByName('entidadtransportista_id').AsString:=Cabecera.FieldByName('entidadtransportista_id').AsString;
    ZQExcecSQL.ParamByName('entidad_id').AsString:=Cabecera.FieldByName('entidad_id').AsString;
    ZQExcecSQL.ParamByName('tipodocu_id').AsString:=Cabecera.FieldByName('tipodocu_id').AsString;
    ZQExcecSQL.ParamByName('documento_documentacion').AsString:=Cabecera.FieldByName('documento_documentacion').AsString;
    ZQExcecSQL.ParamByName('documento_calidad').AsString:=Cabecera.FieldByName('documento_calidad').AsString;
    ZQExcecSQL.ParamByName('documento_otrosimpuestos').AsString:=Cabecera.FieldByName('documento_otrosimpuestos').AsString;
    ZQExcecSQL.ParamByName('documento_dgrperc').AsString:=Cabecera.FieldByName('documento_dgrperc').AsString;
    ZQExcecSQL.ParamByName('documento_dgrret').AsString:=Cabecera.FieldByName('documento_dgrret').AsString;
    ZQExcecSQL.ParamByName('documento_ivaperc').AsString:=Cabecera.FieldByName('documento_ivaperc').AsString;
    ZQExcecSQL.ParamByName('documento_ivaret').AsString:=Cabecera.FieldByName('documento_ivaret').AsString;
    ZQExcecSQL.ParamByName('documento_observaciones').AsString:=Cabecera.FieldByName('documento_observaciones').AsString;
    ZQExcecSQL.ParamByName('documento_iva27').AsString:=Cabecera.FieldByName('documento_iva27').AsString;
    ZQExcecSQL.ParamByName('documento_neto27').AsString:=Cabecera.FieldByName('documento_neto27').AsString;
    ZQExcecSQL.ParamByName('documento_iva105').AsString:=Cabecera.FieldByName('documento_iva105').AsString;
    ZQExcecSQL.ParamByName('documento_neto105').AsString:=Cabecera.FieldByName('documento_neto105').AsString;
    ZQExcecSQL.ParamByName('documento_iva21').AsString:=Cabecera.FieldByName('documento_iva21').AsString;
    ZQExcecSQL.ParamByName('documento_neto21').AsString:=Cabecera.FieldByName('documento_neto21').AsString;
    ZQExcecSQL.ParamByName('documento_estado').AsString:=Cabecera.FieldByName('documento_estado').AsString;
    ZQExcecSQL.ParamByName('documento_pagado').AsString:=Cabecera.FieldByName('documento_pagado').AsString;
    ZQExcecSQL.ParamByName('documento_saldo').AsString:=Cabecera.FieldByName('documento_saldo').AsString;
    ZQExcecSQL.ParamByName('documento_total').AsString:=Cabecera.FieldByName('documento_total').AsString;
    ZQExcecSQL.ParamByName('documento_numero').AsString:=documento_numero;
    ZQExcecSQL.ParamByName('documento_hora').AsString:=Cabecera.FieldByName('documento_hora').AsString;
    ZQExcecSQL.ParamByName('documento_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documento_fechavenc').AsDateTime);
    ZQExcecSQL.ParamByName('documento_fecha').AsString:=formatdatetime('yyyy-mm-dd',Cabecera.FieldByName('documento_fecha').AsDateTime);
    ZQExcecSQL.ParamByName('documento_nogravado').AsString:=Cabecera.FieldByName('documento_nogravado').AsString;
    ZQExcecSQL.ParamByName('documento_id').AsString:=id;
    ZQExcecSQL.ExecSql;

    ActualizarNumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString,documento_numero);

    if DocumentodocuImputacion<>nil then
      begin
          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('insert into documentosdocu set ');
          ZQExcecSQL.Sql.Add('documentodocu_tiporelacion=:documentodocu_tiporelacion, ');
          ZQExcecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
          ZQExcecSQL.Sql.Add('documento_id=:documento_id, ');
          ZQExcecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
          ZQExcecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
          ZQExcecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
          ZQExcecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
          ZQExcecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
          DocumentodocuImputacion.First;
          while not DocumentodocuImputacion.Eof do
              begin
                  ZQExcecSQL.ParamByName('documentodocu_tiporelacion').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_tiporelacion').AsString;
                  ZQExcecSQL.ParamByName('documento_idpago').AsString:=DocumentodocuImputacion.FieldByName('documento_idpago').AsString;
                  ZQExcecSQL.ParamByName('documento_id').AsString:=id;
                  ZQExcecSQL.ParamByName('documentodocu_saldo').AsString:=DocumentodocuImputacion.FieldByName('documento_saldo').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_pagado').AsString:=DocumentodocuImputacion.FieldByName('documento_pagado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_estado').AsString:=DocumentodocuImputacion.FieldByName('documento_estado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_importe').AsString:=DocumentodocuImputacion.FieldByName('documentodocu_importe').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
                  ZQExcecSQL.ExecSql;

                  ActualizarSaldoDocumento(DocumentodocuImputacion.FieldByName('documento_idpago').AsString,abs(DocumentodocuImputacion.FieldByName('documentodocu_importe').AsFloat));

                  DocumentodocuImputacion.Next;
              end;



      end;


    if DocumentodocuRelacion<>nil then
      begin
          ZQExcecSQL.Sql.Clear;
          ZQExcecSQL.Sql.Add('insert into documentosdocu set ');
          ZQExcecSQL.Sql.Add('documentodocu_tiporelacion=:documentodocu_tiporelacion, ');
          ZQExcecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
          ZQExcecSQL.Sql.Add('documento_id=:documento_id, ');
          ZQExcecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
          ZQExcecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
          ZQExcecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
          ZQExcecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
          ZQExcecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
          DocumentodocuRelacion.First;
          while not DocumentodocuRelacion.Eof do
              begin
                  ZQExcecSQL.ParamByName('documentodocu_tiporelacion').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_tiporelacion').AsString;
                  ZQExcecSQL.ParamByName('documento_idpago').AsString:=DocumentodocuRelacion.FieldByName('documento_idpago').AsString;
                  ZQExcecSQL.ParamByName('documento_id').AsString:=id;
                  ZQExcecSQL.ParamByName('documentodocu_saldo').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_saldo').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_pagado').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_pagado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_estado').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_estado').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_importe').AsString:=DocumentodocuRelacion.FieldByName('documentodocu_importe').AsString;
                  ZQExcecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
                  ZQExcecSQL.ExecSql;

                  DocumentodocuRelacion.Next;
              end;

      end;

    if Pagos<>nil then
      begin
          Pagos.First;
          while not Pagos.Eof do
              begin
                  ZQExcecSQL.Sql.Clear;
                  ZQExcecSQL.Sql.Add('insert into documentopagos set ');
                  ZQExcecSQL.Sql.Add('documento_id=:documento_id, ');
                  ZQExcecSQL.Sql.Add('tipopago_id=:tipopago_id, ');
                  ZQExcecSQL.Sql.Add('documentopago_importe=:documentopago_importe, ');
                  ZQExcecSQL.Sql.Add('documentopago_nombre=:documentopago_nombre, ');
                  ZQExcecSQL.Sql.Add('documentopago_id=:documentopago_id ');
                  ZQExcecSQL.ParamByName('documento_id').AsString:=id;
                  ZQExcecSQL.ParamByName('tipopago_id').AsString:=Pagos.FieldByName('tipopago_id').AsString;
                  ZQExcecSQL.ParamByName('documentopago_importe').AsString:=Pagos.FieldByName('documentopago_importe').AsString;
                  ZQExcecSQL.ParamByName('documentopago_nombre').AsString:=Pagos.FieldByName('documentopago_nombre').AsString;
                  ZQExcecSQL.ParamByName('documentopago_id').AsString:=Princ.codigo('documentopagos','documentopago_id');
                  ZQExcecSQL.ExecSql;


                  Pagos.Next;
              end;
      end;

    ZQExcecSQL.SQL.Clear;
    ZQExcecSQL.SQL.Add('commit');
    ZQExcecSQL.ExecSQL;
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

    documentoventa_numero:=Princ.NumeroDocumento(Cabecera.FieldByName('tipodocu_id').AsString,'');
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
end;

function TPrinc.CargarDocumentoVentaDocu(cliente_id: string; QDocumentoVentaDocus:TDataset;documentoventa_apagar:real;AgregarAutomatico:boolean):boolean;
begin

end;

procedure TPrinc.ActualizarNumeroDocumento(tipodocu_id: string; tipodocu_ultimonumero:string);
var
  tipodocu_numero:string;
begin
    if tipodocu_ultimonumero<>'0' then
      begin
          ZQExcecSQL.Active:=false;
          ZQExcecSQL.SQL.Text:='update tiposdocumento set tipodocu_ultimonumero="'+tipodocu_ultimonumero+'" where tipodocu_id="'+tipodocu_id+'"';
          ZQExcecSQL.ExecSQL;
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
          QDocumentopagos.FieldByName('documento_id').AsString:='0';
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
    ZQRecibos.sql.add('documentoventa_total, personal_id, tipodocu_id) ');
    ZQRecibos.sql.add('values (:cliente_id, :documentoventa_condicionventa, ');
    ZQRecibos.sql.add(':documentoventa_estado, :documentoventa_fecha, :documentoventa_fechavenc, ');
    ZQRecibos.sql.add(':documentoventa_hora, :documentoventa_id, :documentoventa_iva105, ');
    ZQRecibos.sql.add(':documentoventa_iva21, :documentoventa_listaprecio, :documentoventa_neto105, ');
    ZQRecibos.sql.add(':documentoventa_neto21, :documentoventa_netonogravado, :documentoventa_numero, ');
    ZQRecibos.sql.add(':documentoventa_observacion, :documentoventa_pagado, :documentoventa_saldo, ');
    ZQRecibos.sql.add(':documentoventa_total, :personal_id, :tipodocu_id)');
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


procedure TPrinc.ActualizarSaldoDocumento(id: string; importe: Real; inversa:boolean=false);
var
  importe_real:real;
begin
    importe_real:=importe;
    if inversa then
      importe_real:=importe*-1;

    ZQActualizarSaldoDocumentos.Active:=false;
    ZQActualizarSaldoDocumentos.SQL.Text:='call actualizarsaldo("'+id+'","'+floattostr(importe_real)+'")';

    ZQActualizarSaldoDocumentos.ExecSQL;



end;


procedure TPrinc.ActualizarSaldoDocumentoVenta(id: string; importe: Real; inversa:boolean=false);
var
  importe_real:real;
begin
    importe_real:=importe;
    if inversa then
      importe_real:=importe*-1;

    ZQActualizarSaldoDocumentos.Active:=false;
    ZQActualizarSaldoDocumentos.SQL.Text:='call actualizarsaldoventa("'+id+'","'+floattostr(importe_real)+'")';

    ZQActualizarSaldoDocumentos.ExecSQL;



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

    sucursal_actual:='1';

{    NOMBREPRECIO1:=Princ.GetConfiguracion('NOMBREPRECIO1');
    NOMBREPRECIO2:=Princ.GetConfiguracion('NOMBREPRECIO2');
    NOMBREPRECIO3:=Princ.GetConfiguracion('NOMBREPRECIO3');
    NOMBREPRECIO4:=Princ.GetConfiguracion('NOMBREPRECIO4');


    empresa_where:='and 1=1';

    MenuConfiguracion;}
end;

procedure TPrinc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ( Shift = [ ssalt, ssshift ] ) then
      begin
          if Key=65 then
            empresa_where:='and puntodeventa.puntoventa_id not in ('+Princ.buscar('select empresa_where from empresas','empresa_where')+')';
      end;



end;        

procedure TPrinc.FormShow(Sender: TObject);
begin
{    ZQExcecSQL.SQL.Clear;
    ZQExcecSQL.SQL.Add('Replace config set config_nombre="VERSIONEXE", config_valor="'+VERSIONEXE+'"');
    ZQExcecSQL.ExecSQL;
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

    MenuConfiguracion; }
end;

procedure TPrinc.ZBaseAfterConnect(Sender: TObject);
var
  LOGDB:string;
begin
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

procedure TPrinc.AdvGlowButton16Click(Sender: TObject);
begin
    try
      localidades:=Tlocalidades.Create(self);
    finally
      localidades.Show;
    end;
end;

procedure TPrinc.btnrecibosClick(Sender: TObject);
begin
    try
      listarecibos:=Tlistarecibos.Create(self);
    finally
      listarecibos.campo_id:='documento_id';
      listarecibos.Show;
    end;
end;

procedure TPrinc.btnsaldosgranosClick(Sender: TObject);
begin
    try
      saldoclientes:=Tsaldoclientes.Create(self);
    finally
      saldoclientes.tipodocu_tipoctacte:='STOCK';
      saldoclientes.Show;
    end;
end;


function TPrinc.NumeroDocumento(tipodocu_id:string; documentoventa_numero:string):string;
var
  tipodocu_numero:string;
  tipodocu_manual:boolean;
begin
    tipodocu_manual:=strtobool(princ.GetConfigTipoDocumento('',tipodocu_id,'tipodocu_manual'));
    if (not tipodocu_manual) or (documentoventa_numero='') then
      begin
          tipodocu_numero:=princ.GetConfigTipoDocumento('',tipodocu_id,'tipodocu_ultimonumero');

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


procedure TPrinc.AdvGlowButton1Click(Sender: TObject);
begin
    try
      listaEntidades:=TlistaEntidades.Create(self);
    finally
      listaEntidades.campo_id:='entidad_id';
      listaEntidades.Show;
    end;

end;

procedure TPrinc.AdvGlowButton20Click(Sender: TObject);
begin
    try
      estadoctas:=Testadoctas.Create(self);
    finally
      estadoctas.tipodocu_tipoctacte:='STOCK';
      estadoctas.Show;
    end;
end;

procedure TPrinc.AdvGlowButton21Click(Sender: TObject);
begin
    try
      detallectas:=Tdetallectas.Create(self);
    finally
      detallectas.Show;
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

procedure TPrinc.btncontratosClick(Sender: TObject);
begin
    try
      listacontratos:=Tlistacontratos.Create(self);
    finally
      listacontratos.campo_id:='documento_id';
      listacontratos.tipodocu_nombre:='Contrato de Compra';
      listacontratos.Show;
    end;
end;

procedure TPrinc.btncontratoventaClick(Sender: TObject);
begin
    try
      listacontratosventa:=Tlistacontratosventa.Create(self);
    finally
      listacontratosventa.campo_id:='documento_id';
      listacontratosventa.tipodocu_nombre:='Contrato de Venta';
      listacontratosventa.Show;
    end;
end;

procedure TPrinc.AdvGlowButton2Click(Sender: TObject);
begin
    try
      listaControlEntidad:=TlistaControlEntidad.Create(self);
    finally
      listaControlEntidad.campo_id:='entidadrol_id';
      listaControlEntidad.show;
    end;


end;

procedure TPrinc.AdvGlowButton3Click(Sender: TObject);
begin
//    try
//      listaAritculos:=TlistaAritculos.Create(self);
//    finally
//       listaAritculos.campo_id:='articulo_codi';
//      listaAritculos.show;
//    end;

end;

procedure TPrinc.AdvGlowButton4Click(Sender: TObject);
begin
    try
      listaRoles:=TlistaRoles.Create(self);
    finally
       listaRoles.campo_id:='rol_id';
      listaRoles.show;
    end;
end;

procedure TPrinc.btnespeciesClick(Sender: TObject);
begin
    try
      listaespeciesvariedades:=Tlistaespeciesvariedades.Create(self);
    finally
       listaespeciesvariedades.campo_id:='especie_id';
       listaespeciesvariedades.show;
    end;
end;

procedure TPrinc.AdvGlowButton7Click(Sender: TObject);
begin
    try
      listatiposdocumentos:=Tlistatiposdocumentos.Create(self);
    finally
      listatiposdocumentos.campo_id:='tipodocu_id';
      listatiposdocumentos.show;
    end;
end;

procedure TPrinc.AdvGlowButton8Click(Sender: TObject);
begin
    try
      listasucursales:=Tlistasucursales.Create(self);
    finally
      listasucursales.campo_id:='sucursal_id';
      listasucursales.Show;
    end;
end;

procedure TPrinc.AdvGlowButton9Click(Sender: TObject);
begin
    try
      listapuntosdeventa:=Tlistapuntosdeventa.Create(self);
    finally
      listapuntosdeventa.campo_id:='puntoventa_id';
      listapuntosdeventa.Show;
    end;
end;

procedure TPrinc.AdvToolBarGeneralOptionClick(Sender: TObject; ClientPoint,
  ScreenPoint: TPoint);
begin
    self.AdvPopupMenu1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TPrinc.btnfacturascomprasClick(Sender: TObject);
begin
    try
      ListaFacturasCompra:=TListaFacturasCompra.Create(self);
    finally
      ListaFacturasCompra.campo_id:='documento_id';
      ListaFacturasCompra.Show;
    end;
end;

procedure TPrinc.btnfacturasventasClick(Sender: TObject);
begin
    try
      ListaFacturasVenta:=TListaFacturasVenta.Create(self);
    finally
      ListaFacturasVenta.campo_id:='documento_id';
      ListaFacturasVenta.Show;
    end;
end;

procedure TPrinc.btnnotacreditocompraClick(Sender: TObject);
begin
    try
      ListaNotasCreditoCompra:=TListaNotasCreditoCompra.Create(self);
    finally
      ListaNotasCreditoCompra.campo_id:='documento_id';
      ListaNotasCreditoCompra.Show;
    end;
end;

procedure TPrinc.btnnotadebitocompraClick(Sender: TObject);
begin
    try
      ListaNotasDebitoCompra:=TListaNotasDebitoCompra.Create(self);
    finally
      ListaNotasDebitoCompra.campo_id:='documento_id';
      ListaNotasDebitoCompra.Show;
    end;
end;

procedure TPrinc.btnnotasdecreditoClick(Sender: TObject);
begin
    try
      ListaNotasCreditoVenta:=TListaNotasCreditoVenta.Create(self);
    finally
      ListaNotasCreditoVenta.campo_id:='documento_id';
      ListaNotasCreditoVenta.Show;
    end;
end;

procedure TPrinc.BtnNotasdeDebitoClick(Sender: TObject);
begin
    try
      ListaNotasDebitoVenta:=TListaNotasDebitoVenta.Create(self);
    finally
      ListaNotasDebitoVenta.campo_id:='documento_id';
      ListaNotasDebitoVenta.Show;
    end;
end;

procedure TPrinc.btnordenesdecargaClick(Sender: TObject);
begin
    try
      listaordendecarga:=Tlistaordendecarga.Create(self);
    finally
      listaordendecarga.campo_id:='documento_id';
      listaordendecarga.tipodocu_nombre:='Orden de Carga';
      listaordendecarga.Show;
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

//procedure TPrinc.btnperfilesClick(Snder: TObject);
//begin
 //   try
  //    listaperfiles:=Tlistaperfiles.Create(self);
  //  finally
  //    ListaPerfiles.campo_id:='perfil_id';
  //    listaperfiles.Show;
  //  end;
//end;

end.
