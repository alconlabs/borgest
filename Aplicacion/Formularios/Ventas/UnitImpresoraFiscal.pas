unit UnitImpresoraFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid, OleServer,
  FiscalPrinterLib_TLB, OleCtrls;

type
  Timpresorafiscal = class(TForm)
    impresorafiscal: TAdvPanel;
    Label3: TLabel;
    btnimprimir: TButton;
    Timer1: TTimer;
    Memo1: TMemo;
    HASAR1: THASAR;
    MQDetalle: TMQuery;
    MQpagos: TMQuery;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    i:integer;
    HuboError:boolean;
    procedure ImprimirFactura;
    procedure ImprimirNotadeCredito;
    procedure ImprimirRemito;
    procedure ImprimirNotadeDebito;
    procedure ImprimirReporteZ;
    procedure ImprimirReporteX;
    procedure ImprimeTicketFactura;
    procedure ImprimeTicketNotaDebito;
    procedure ImprimeTicketNotaCredito;
    procedure ImprimirTicketC;
    procedure ImprimirRecibo;
    function AbrirPuerto:boolean;
    function InicializarImpresora:boolean;
    function CargarDatosCliente:boolean;
    function AbrirComprobante:boolean;
    function ImprimirDetalles:boolean;
    function ImprimirPagos:boolean;
    function CerrarComprobante:boolean;
    function ObtenerFechaHoraNumero:boolean;
    function LimpiarLineas:boolean;
    function CerrarPuerto:boolean;
  public
    { Public declarations }
    tipodocu_nombre:string;
    tipodocu_letra:string;
    Nombre_cliente:string;
    Direccion_cliente:string;
    NroDocumento_cliente:string;
    TipoDocumento_cliente:integer;
    ResponsabilidadIVA_cliente:integer;
    documentoventa_fecha:TDateTime;
    documentoventa_numero:integer;
    vendedor_nombre:string;
    documentoventa_observacion:string;
    tipodocu_leyenda:string;
    embarknumber:string;
    tipodocufiscal_id:integer;
    MResult:integer;
    modelo:integer;
    puerto:integer;
    devoluciones:real;
    recargo:real;
  end;

var
  impresorafiscal: Timpresorafiscal;

const
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

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Timpresorafiscal.ImprimirReporteX;
begin
    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Iniciando Impresora.');

    HASAR1.Comenzar;

    HASAR1.TratarDeCancelarTodo;

    Memo1.Lines.Add('Imprimendo Reporte Z.');

    HASAR1.ReporteX;

    Memo1.Lines.Add('Cerrando puerto.');

    HASAR1.Finalizar;

    self.ModalResult:=mrCancel;
end;


function Timpresorafiscal.AbrirPuerto;
begin
    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    //hasar1.Modelo:=8;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Abriendo Puerto.');

    HASAR1.Comenzar;


    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.InicializarImpresora;
begin
    Memo1.Lines.Add('Iniciando Impresora');

    HASAR1.TratarDeCancelarTodo;

    if tipodocu_leyenda<>'' then
      begin
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+tipodocu_leyenda);
      end;

    hasar1.PrecioBase:=false;

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.CargarDatosCliente;
begin
    Memo1.Lines.Add('Enviando datos de cliente.');
    hasar1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.AbrirComprobante;
begin
    Memo1.Lines.Add('Abriendo comprobante fiscal.');

    HASAR1.AbrirComprobanteFiscal(tipodocufiscal_id);

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.ImprimirDetalles;
begin
    Memo1.Lines.Add('Imprimiendo detalles.');

    MQDetalle.First;
    while not MQDetalle.Eof do
        begin
            HASAR1.ImprimirItem(MQDetalle.FieldByName('descripcion').AsString,MQDetalle.FieldByName('cantidad').AsFloat, MQDetalle.FieldByName('monto').AsFloat, MQDetalle.FieldByName('IVA').AsFloat, MQDetalle.FieldByName('impuestosinternos').AsFloat);

            MQDetalle.Next;
        end;

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.ImprimirPagos;
begin
    Memo1.Lines.Add('Imprimiendo pagos.');

    MQpagos.First;
    while not MQpagos.Eof do
        begin
            HASAR1.ImprimirPago(MQpagos.FieldByName('descripcion').AsString,MQpagos.FieldByName('monto').AsFloat);

            MQpagos.Next;
        end;

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.CerrarComprobante;
begin
    Memo1.Lines.Add('Cerrando comprobante fiscal.');

    HASAR1.CerrarComprobanteFiscal;

    Memo1.Lines.Add('Imprimiendo Duplicado.');

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.ObtenerFechaHoraNumero;
begin
    documentoventa_fecha:=HASAR1.FechaHoraFiscal;
    if tipodocu_letra='A' then
      documentoventa_numero:=hasar1.UltimoDocumentoFiscalA
    else
      documentoventa_numero:=hasar1.UltimoDocumentoFiscalBC;

    Memo1.Lines.Add('Cerrando Documento numero '+inttostr(documentoventa_numero));

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.LimpiarLineas;
begin
    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));  //  Limpiar lineas de vendedor
    hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));   //  limpiar lineas de observacion

    Result:=HASAR1.HuboErrorFiscal;
end;

function Timpresorafiscal.CerrarPuerto;
begin
    Memo1.Lines.Add('Cerrando puerto.');
    HASAR1.Finalizar;

    Result:=HASAR1.HuboErrorFiscal;
end;

procedure Timpresorafiscal.ImprimirRecibo;
begin

end;

procedure Timpresorafiscal.ImprimirTicketC;
begin

end;


procedure Timpresorafiscal.ImprimeTicketNotaCredito;
var
  error:integer;
begin
    error:=0;

    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    //hasar1.Modelo:=8;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Iniciando Impresora.');

    HASAR1.Comenzar;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=1', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    HASAR1.TratarDeCancelarTodo;


//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));
//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+'Vendedor: '+vendedor_nombre);

//    if HASAR1.HuboErrorFiscal then
//      begin
//          MessageDlg('error=2', mtWarning, [mbOK], 0);
//          MResult:=mrCancel;
//      end;

    if tipodocu_leyenda<>'' then
      begin
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+tipodocu_leyenda);
      end;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=3', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    hasar1.PrecioBase:=false;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=4', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Comprobante Original: '+embarknumber);

    ////////  SETEMBARKNUMBER  (NUMERO DE COMPROBANTE QUE ORIGINA LA NOTA DE CREDITO)
      HASAR1.Enviar(chr(147){comando}+chr(28){separador de campos} + '1'{Numero linea} +chr(28)+{numero de factura} embarknumber);

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=4A', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Enviando datos de cliente.');

    hasar1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=5', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Abriendo comprobante fiscal. Tipo: '+inttostr(tipodocufiscal_id));


    HASAR1.AbrirDNFH(tipodocufiscal_id);

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=6', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Imprimiendo detalles.');

    MQDetalle.First;
    while not MQDetalle.Eof do
        begin
            HASAR1.ImprimirItem(MQDetalle.FieldByName('descripcion').AsString,MQDetalle.FieldByName('cantidad').AsFloat, MQDetalle.FieldByName('monto').AsFloat, MQDetalle.FieldByName('IVA').AsFloat, MQDetalle.FieldByName('impuestosinternos').AsFloat);

            if HASAR1.HuboErrorFiscal then
              begin
                  MessageDlg('error=7', mtWarning, [mbOK], 0);
                  MResult:=mrCancel;
              end;

            MQDetalle.Next;
        end;


    Memo1.Lines.Add('Cerrando comprobante fiscal.');

    HASAR1.CerrarDNFH;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=9', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Imprimiendo Duplicado.');

    documentoventa_fecha:=HASAR1.FechaHoraFiscal;
    if tipodocu_letra='A' then
      documentoventa_numero:=hasar1.UltimaNotaCreditoA
    else
      documentoventa_numero:=hasar1.UltimaNotaCreditoBC;
//    documentoventa_numero:=strtoint(hasar1.Respuesta[3]);             ////APARENTEMENTE ESTO ES LA FECHA

    Memo1.Lines.Add('Cerrando Documento numero '+inttostr(documentoventa_numero));

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=10', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));  //  Limpiar lineas de vendedor
    hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));   //  limpiar lineas de observacion

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=11', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Cerrando puerto.');
    HASAR1.Finalizar;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=12', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;


    self.ModalResult:=MResult;
end;


procedure Timpresorafiscal.ImprimeTicketNotaDebito;
begin


end;

procedure Timpresorafiscal.ImprimeTicketFactura;
var
  error:integer;
begin
    error:=0;

    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    //hasar1.Modelo:=8;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Iniciando Impresora.');

    HASAR1.Comenzar;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=1', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    HASAR1.TratarDeCancelarTodo;


//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));
//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+'Vendedor: '+vendedor_nombre);
//
//    if HASAR1.HuboErrorFiscal then
//      begin
//          MessageDlg('error=2', mtWarning, [mbOK], 0);
//          MResult:=mrCancel;
//      end;

    if tipodocu_leyenda<>'' then
      begin
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+tipodocu_leyenda);
      end;


    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=3', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    hasar1.PrecioBase:=false;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=4', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Enviando datos de cliente.');


    hasar1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);

//    if tipodocu_letra='A' then
//     begin
//         hasar1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);
//     end
//    else
//      begin
//          //hasar1.Modelo:=2;
//          hasar1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente);
//
//      end;


//    HASAR1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=5', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Abriendo comprobante fiscal.');

    //hasar1.Modelo:=2;

    HASAR1.AbrirComprobanteFiscal(tipodocufiscal_id);

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=6', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Imprimiendo detalles.');

    MQDetalle.First;
    while not MQDetalle.Eof do
        begin
            HASAR1.ImprimirItem(MQDetalle.FieldByName('descripcion').AsString,MQDetalle.FieldByName('cantidad').AsFloat, MQDetalle.FieldByName('monto').AsFloat, MQDetalle.FieldByName('IVA').AsFloat, MQDetalle.FieldByName('impuestosinternos').AsFloat);

            if HASAR1.HuboErrorFiscal then
              begin
                  MessageDlg('error=7', mtWarning, [mbOK], 0);
                  MResult:=mrCancel;
              end;

            MQDetalle.Next;
        end;


    if recargo>0 then
      HASAR1.ImprimirItem('Recargo',1, recargo, 21, 0);


    if devoluciones>0 then
      begin
          HASAR1.DescuentoGeneral('Devoluciones',devoluciones,false);
      end;


    Memo1.Lines.Add('Imprimiendo pagos.');

    MQpagos.First;
    while not MQpagos.Eof do
        begin
            HASAR1.ImprimirPago(MQpagos.FieldByName('descripcion').AsString,MQpagos.FieldByName('monto').AsFloat);

            if HASAR1.HuboErrorFiscal then
              begin
                  MessageDlg('error=8', mtWarning, [mbOK], 0);
                  MResult:=mrCancel;
              end;
            MQpagos.Next;
        end;

    Memo1.Lines.Add('Cerrando comprobante fiscal.');

    HASAR1.CerrarComprobanteFiscal;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=9', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Imprimiendo Duplicado.');

    documentoventa_fecha:=HASAR1.FechaHoraFiscal;
    if tipodocu_letra='A' then
      documentoventa_numero:=hasar1.UltimoDocumentoFiscalA
    else
      documentoventa_numero:=hasar1.UltimoDocumentoFiscalBC;
//    documentoventa_numero:=strtoint(hasar1.Respuesta[3]);             ////APARENTEMENTE ESTO ES LA FECHA

    Memo1.Lines.Add('Cerrando Documento numero '+inttostr(documentoventa_numero));

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=10', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));  //  Limpiar lineas de vendedor
    hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));   //  limpiar lineas de observacion

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=11', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    Memo1.Lines.Add('Cerrando puerto.');
    HASAR1.Finalizar;

    if HASAR1.HuboErrorFiscal then
      begin
          MessageDlg('error=12', mtWarning, [mbOK], 0);
          MResult:=mrCancel;
      end;

    self.ModalResult:=MResult;

end;

procedure Timpresorafiscal.ImprimirReporteZ;
begin
    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Iniciando Impresora.');

    HASAR1.Comenzar;

    HASAR1.TratarDeCancelarTodo;

    Memo1.Lines.Add('Imprimendo Reporte Z.');

    HASAR1.ReporteZ;

    Memo1.Lines.Add('Cerrando puerto.');

    HASAR1.Finalizar;

    self.ModalResult:=mrCancel;
end;


procedure Timpresorafiscal.ImprimirFactura;
var
  error:integer;
begin
    error:=0;

    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Iniciando Impresora.');

    HASAR1.Comenzar;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=1', mtWarning, [mbOK], 0);

    HASAR1.TratarDeCancelarTodo;


//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));
//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+'Vendedor: '+vendedor_nombre);
//
//    if HASAR1.HuboErrorFiscal then
//      MessageDlg('error=2', mtWarning, [mbOK], 0);

    if tipodocu_leyenda<>'' then
      begin
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+tipodocu_leyenda);
      end;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=3', mtWarning, [mbOK], 0);

    hasar1.PrecioBase:=false;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=4', mtWarning, [mbOK], 0);

    Memo1.Lines.Add('Enviando datos de cliente.');

    HASAR1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=5', mtWarning, [mbOK], 0);

    Memo1.Lines.Add('Abriendo comprobante fiscal.');

    if tipodocu_letra='A' then
      HASAR1.AbrirComprobanteFiscal(FACTURA_A)
    else
      HASAR1.AbrirComprobanteFiscal(FACTURA_B);

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=6', mtWarning, [mbOK], 0);

    Memo1.Lines.Add('Imprimiendo detalles.');

    MQDetalle.First;
    while not MQDetalle.Eof do
        begin
            HASAR1.ImprimirItem(MQDetalle.FieldByName('descripcion').AsString,MQDetalle.FieldByName('cantidad').AsFloat, MQDetalle.FieldByName('monto').AsFloat, MQDetalle.FieldByName('IVA').AsFloat, MQDetalle.FieldByName('impuestosinternos').AsFloat);

            if HASAR1.HuboErrorFiscal then
              MessageDlg('error=7 - detalle', mtWarning, [mbOK], 0);

            MQDetalle.Next;
        end;


    Memo1.Lines.Add('Imprimiendo pagos.');

    MQpagos.First;
    while not MQpagos.Eof do
        begin
            HASAR1.ImprimirPago(MQpagos.FieldByName('descripcion').AsString,MQpagos.FieldByName('monto').AsFloat);

            if HASAR1.HuboErrorFiscal then
              MessageDlg('error=8 - pagos', mtWarning, [mbOK], 0);
            MQpagos.Next;
        end;

    Memo1.Lines.Add('Cerrando comprobante fiscal.');

    HASAR1.CerrarComprobanteFiscal;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=9', mtWarning, [mbOK], 0);

    Memo1.Lines.Add('Imprimiendo Duplicado.');

    documentoventa_fecha:=HASAR1.FechaHoraFiscal;

    documentoventa_fecha:=HASAR1.FechaHoraFiscal;

    if tipodocu_letra='A' then
      documentoventa_numero:=hasar1.UltimoDocumentoFiscalA
    else
      documentoventa_numero:=hasar1.UltimoDocumentoFiscalBC;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=11', mtWarning, [mbOK], 0);

    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));  //  Limpiar lineas de vendedor
    hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));   //  limpiar lineas de observacion

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=12', mtWarning, [mbOK], 0);

    Memo1.Lines.Add('Cerrando puerto.');
    HASAR1.Finalizar;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=13', mtWarning, [mbOK], 0);


    self.ModalResult:=mrOk;

end;

procedure Timpresorafiscal.ImprimirNotadeCredito;
begin
    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Iniciando Impresora.');

    HASAR1.Comenzar;

    HASAR1.TratarDeCancelarTodo;

//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));
//    hasar1.Enviar(chr(93)+chr(28)+'12'+chr(28)+'Vendedor: '+vendedor_nombre);
//
//    Memo1.Lines.Add('Datos vendedor.');
//
//    if HASAR1.HuboErrorFiscal then
//      MessageDlg('error=1', mtWarning, [mbOK], 0);

    if tipodocu_leyenda<>'' then
      begin
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));
          hasar1.Enviar(chr(93)+chr(28)+'13'+chr(28)+tipodocu_leyenda);
      end;

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=3', mtWarning, [mbOK], 0);

    hasar1.PrecioBase:=false;

    ////////  SETEMBARKNUMBER  (NUMERO DE COMPROBANTE QUE ORIGINA LA NOTA DE CREDITO)
    HASAR1.Enviar(chr(147){comando}+chr(28){separador de campos} + '1'{Numero linea} +chr(28)+{numero de factura} embarknumber);

    Memo1.Lines.Add('Datos Factura original.');
    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=2', mtWarning, [mbOK], 0);

    HASAR1.DatosCliente(Nombre_cliente,NroDocumento_cliente,TipoDocumento_cliente,ResponsabilidadIVA_cliente,Direccion_cliente);

    Memo1.Lines.Add('Datos Cliente.');
    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=3', mtWarning, [mbOK], 0);

    if tipodocu_letra='A' then
      HASAR1.AbrirDNFH(NOTA_CREDITO_A)
    else
      HASAR1.AbrirDNFH(NOTA_CREDITO_B);

    Memo1.Lines.Add('Tipo Documento');
    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=4', mtWarning, [mbOK], 0);


    Memo1.Lines.Add('Imprimiendo detalles.');

    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=5', mtWarning, [mbOK], 0);

    MQDetalle.First;
    while not MQDetalle.Eof do
        begin
            HASAR1.ImprimirItem(MQDetalle.FieldByName('descripcion').AsString,MQDetalle.FieldByName('cantidad').AsFloat, MQDetalle.FieldByName('monto').AsFloat, MQDetalle.FieldByName('IVA').AsFloat, MQDetalle.FieldByName('impuestosinternos').AsFloat);

            MQDetalle.Next;
        end;

    Memo1.Lines.Add('Cerrando comprobantes.');
    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=6', mtWarning, [mbOK], 0);

    HASAR1.CerrarDNFH;

    documentoventa_fecha:=HASAR1.FechaHoraFiscal;
    if tipodocu_letra='A' then
      documentoventa_numero:=hasar1.UltimaNotaCreditoA
    else
      documentoventa_numero:=hasar1.UltimaNotaCreditoBC;

    Memo1.Lines.Add('Tomando fecha de impresora');
    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=7', mtWarning, [mbOK], 0);

    HASAR1.Enviar(chr(93)+chr(28)+'12'+chr(28)+chr(46));  //  Limpiar lineas de vendedor
    HASAR1.Enviar(chr(93)+chr(28)+'13'+chr(28)+chr(46));   //  limpiar lineas de observacion

    HASAR1.Finalizar;

    Memo1.Lines.Add('Cerrando puerto.');
    if HASAR1.HuboErrorFiscal then
      MessageDlg('error=8', mtWarning, [mbOK], 0);

    self.ModalResult:=mrOk;

end;




procedure Timpresorafiscal.ImprimirRemito;
begin
    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

end;


procedure Timpresorafiscal.ImprimirNotadeDebito;
begin
    HASAR1.Modelo:=self.modelo;
    HASAR1.Puerto:=self.puerto;

end;

procedure Timpresorafiscal.FormCreate(Sender: TObject);
begin
    i:=0;
    MResult:=MrOk;
end;

procedure Timpresorafiscal.FormShow(Sender: TObject);
begin
    Timer1.Enabled:=true;
end;

procedure Timpresorafiscal.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled:=false;

    case tipodocufiscal_id of
        48:ImprimirFactura;
        49:ImprimirFactura;
        50:ImprimeTicketNotaDebito;
        51:ImprimeTicketNotaDebito;
        52:ImprimeTicketNotaCredito;
        53:ImprimeTicketNotaCredito;
        65:ImprimeTicketFactura;
        66:ImprimeTicketFactura;
        68:ImprimirNotadeDebito;
        69:ImprimirNotadeDebito;
        82:ImprimirNotadeCredito;
        83:ImprimirNotadeCredito;
        84:ImprimirTicketC;
        97:ImprimirRecibo;
        98:ImprimirRecibo;
       114:ImprimirRemito;

    end;

    if tipodocu_nombre='Reporte Z' then
      ImprimirReporteZ;

    if tipodocu_nombre='Reporte X' then
      ImprimirReporteX;
    

end;

end.
