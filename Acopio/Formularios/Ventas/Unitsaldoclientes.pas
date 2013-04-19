unit Unitsaldoclientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid;

type
  Tsaldoclientes = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    ZQSaldos: TZQuery;
    MQdetalle: TMQuery;
    tiventas: TTitles;
    DBGrid1: TDBGrid;
    DSCSaldos: TDataSource;
    tipagos: TTitles;
    btnactualizar: TButton;
    btnimprimir: TButton;
    ZQsolicitud: TZQuery;
    Tisolicitud: TTitles;
    Ticobros: TTitles;
    ZQsoliciPendiente: TZQuery;
    MQsolicipendiente: TMQuery;
    ZQcobropendientes: TZQuery;
    ZQuery1: TZQuery;
    CustomizeGrid1: TCustomizeGrid;
    btnestado: TButton;
    btndetalle: TButton;
    entidad_id: TSqlComboBox;
    Label3: TLabel;
    Label1: TLabel;
    sucursal_id: TSqlComboBox;
    CBSindeuda: TCheckBox;
    Button1: TButton;
    ZQSaldosdocumento_id: TIntegerField;
    ZQSaldosdocumento_fecha: TDateField;
    ZQSaldosdocumento_fechavenc: TDateField;
    ZQSaldosdocumento_hora: TTimeField;
    ZQSaldosdocumento_numero: TIntegerField;
    ZQSaldosdocumento_total: TFloatField;
    ZQSaldosdocumento_saldo: TFloatField;
    ZQSaldosdocumento_pagado: TFloatField;
    ZQSaldosdocumento_estado: TStringField;
    ZQSaldosdocumento_neto21: TFloatField;
    ZQSaldosdocumento_iva21: TFloatField;
    ZQSaldosdocumento_neto105: TFloatField;
    ZQSaldosdocumento_iva105: TFloatField;
    ZQSaldosdocumento_neto27: TFloatField;
    ZQSaldosdocumento_iva27: TFloatField;
    ZQSaldosdocumento_observaciones: TStringField;
    ZQSaldosdocumento_ivaret: TFloatField;
    ZQSaldosdocumento_ivaperc: TFloatField;
    ZQSaldosdocumento_dgrret: TFloatField;
    ZQSaldosdocumento_dgrperc: TFloatField;
    ZQSaldosdocumento_otrosimpuestos: TFloatField;
    ZQSaldosdocumento_calidad: TStringField;
    ZQSaldosdocumento_documentacion: TStringField;
    ZQSaldostipodocu_id: TIntegerField;
    ZQSaldosentidad_id: TIntegerField;
    ZQSaldosentidadtransportista_id: TIntegerField;
    ZQSaldosespecie_id: TIntegerField;
    ZQSaldosdocumento_fechacumplimiento: TDateField;
    ZQSaldosdocumento_moneda: TStringField;
    ZQSaldosdocumento_preciounitario: TFloatField;
    ZQSaldosdocumento_lugarentrega: TStringField;
    ZQSaldosdocumento_tipooperacion: TStringField;
    ZQSaldosdocumento_condicioncalidad: TStringField;
    ZQSaldosdocumento_tipodestino: TStringField;
    ZQSaldosdocumento_numerocartaporte: TIntegerField;
    ZQSaldosdocumento_kgbrutos: TFloatField;
    ZQSaldosdocumento_tara: TFloatField;
    ZQSaldosentidad_id_1: TIntegerField;
    ZQSaldosentidad_precodi: TIntegerField;
    ZQSaldosentidad_razonsocial: TStringField;
    ZQSaldosentidad_nombfantasia: TStringField;
    ZQSaldosentidad_calle: TStringField;
    ZQSaldosentidad_puerta: TStringField;
    ZQSaldosentidad_piso: TStringField;
    ZQSaldosentidad_depto: TStringField;
    ZQSaldosentidad_domiurbano: TStringField;
    ZQSaldosentidad_domirural: TStringField;
    ZQSaldosentidad_observaciones: TStringField;
    ZQSaldosprovincia_id: TIntegerField;
    ZQSaldoslocalidad_id: TIntegerField;
    ZQSaldosentidad_tipodocumento: TStringField;
    ZQSaldosentidad_nrodocumento: TStringField;
    ZQSaldosentidad_iibb: TStringField;
    ZQSaldosentidad_inicioactividad: TDateField;
    ZQSaldosentidad_tipoiva: TStringField;
    ZQSaldosentidad_retieneiibb: TStringField;
    ZQSaldosentidad_agretencion: TStringField;
    ZQSaldosentidad_convmulti: TStringField;
    ZQSaldosentidad_exportador: TStringField;
    ZQSaldosentidad_minagri: TStringField;
    ZQSaldosentidad_diretransporte: TStringField;
    ZQSaldosentidad_regibalanza: TStringField;
    ZQSaldosentidad_regiacopiador: TStringField;
    ZQSaldosentidad_nrocarnetmanejo: TStringField;
    ZQSaldosentidad_vencecarnet: TDateField;
    ZQSaldosentidad_expedidocarnet: TStringField;
    ZQSaldosentidad_inscregproducto: TStringField;
    ZQSaldostipodocu_id_1: TIntegerField;
    ZQSaldostipodocu_nombre: TStringField;
    ZQSaldostipodocu_tipo: TStringField;
    ZQSaldostipodocu_caja: TIntegerField;
    ZQSaldostipodocu_stock: TIntegerField;
    ZQSaldostipodocu_iva: TIntegerField;
    ZQSaldostipodocu_fiscal: TIntegerField;
    ZQSaldostipodocu_ultimonumero: TIntegerField;
    ZQSaldostipodocu_letra: TStringField;
    ZQSaldostipodocu_debcred: TStringField;
    ZQSaldostipodocu_preimpresos: TIntegerField;
    ZQSaldostipodocu_impresora: TStringField;
    ZQSaldostipodocu_copias: TIntegerField;
    ZQSaldostipodocu_preview: TIntegerField;
    ZQSaldostipodocu_prompt: TIntegerField;
    ZQSaldostipodocu_ctacte: TIntegerField;
    ZQSaldostipodocu_archivoimpresion: TStringField;
    ZQSaldostipodocu_leyenda: TStringField;
    ZQSaldostipodocu_nombreabrev: TStringField;
    ZQSaldostipodocu_manual: TIntegerField;
    ZQSaldospuntoventa_id: TIntegerField;
    ZQSaldostipodocu_tipoctacte: TStringField;
    ZQSaldossaldo: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
      var ChangeColor: Boolean);
    procedure btnestadoClick(Sender: TObject);
    procedure btndetalleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipodocu_tipoctacte:string;
    procedure cargatemporal;


  end;

var
  saldoclientes: Tsaldoclientes;

implementation

uses UnitPrinc, Unitdetallectas, Unitestadodectas;

{$R *.dfm}


procedure Tsaldoclientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tsaldoclientes.FormCreate(Sender: TObject);
begin
    tipodocu_tipoctacte:='DINERO';
end;

procedure Tsaldoclientes.FormShow(Sender: TObject);
begin
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=0;
    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=0;
    
end;

procedure Tsaldoclientes.cargatemporal;
var
  id:string;
begin

   ZQuery1.sql.clear;
   ZQuery1.sql.add('Delete from tempestacuenta');
   ZQuery1.sql.add(' where 1=1');
   ZQuery1.ExecSQL;


   MQdetalle.First;
   while not MQdetalle.Eof do
   begin
      id:=Princ.codigo('tempestacuenta','id');

      ZQuery1.sql.clear;
      ZQuery1.sql.add('Insert into tempestacuenta (id, fecha, comprob, ');
      ZQuery1.sql.add('numero, importe) values (:id, :fecha, ');
      ZQuery1.sql.add(':comprob, :numero, :importe)');
      ZQuery1.parambyname('id').asstring:=id;
      ZQuery1.parambyname('fecha').asstring:=formatdatetime('yyyy-mm-dd',MQdetalle.FieldByName('fecha').asdatetime);
      ZQuery1.parambyname('comprob').asstring:=MQdetalle.FieldByName('comprob').AsString;
      ZQuery1.parambyname('numero').asstring:=MQdetalle.FieldByName('numero').AsString;
      ZQuery1.parambyname('importe').asstring:=MQdetalle.FieldByName('importe').AsString;
      ZQuery1.ExecSQL;


   MQdetalle.Next;
   end;




end;

procedure Tsaldoclientes.CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
  var ChangeColor: Boolean);
begin
    if DS.FieldByName('tipodocu_nombre').AsString='Recibo de Venta' then
      begin
          RowColor:=$00E4F2E3;

          ChangeColor:=true;
      end;
end;

procedure Tsaldoclientes.btnactualizarClick(Sender: TObject);
var
  acumulado:real;
begin
    ZQSaldos.Active:=false;
    ZQSaldos.SQL.Text:='select *, '+
                       'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentos.documento_saldo,documentos.documento_saldo*-1)) as saldo '+
                       'from documentos '+
                       'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join entidades on documentos.entidad_id=entidades.entidad_id '+
                       'where 1=1 '+Princ.empresa_where+
                       'and tiposdocumento.tipodocu_debcred<>"N/A" '+
                       'and documentos.documento_estado<>"ANULADA" and tipodocu_tipoctacte="'+tipodocu_tipoctacte+'" ';

    if sucursal_id.codigo<>'-1' then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and puntodeventa.sucursal_id="'+sucursal_id.codigo+'" ';

    if entidad_id.codigo<>'-1' then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and entidades.entidad_id="'+entidad_id.codigo+'" ';

    if CBSindeuda.Checked then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and documentos.documento_estado="PENDIENTE" ';


//    if not strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE')) then
//      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and documentosventas.documentoventa_condicionventa=1 ';


    ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'group by entidades.entidad_id ';
    ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'order by entidades.entidad_razonsocial ';

    ZQSaldos.Active:=true;

end;

procedure Tsaldoclientes.btndetalleClick(Sender: TObject);
begin
    try
      detallectas:=Tdetallectas.Create(self);
      if ZQSaldos.Active then
        begin
            if ZQSaldos.FieldByName('entidad_id').AsString<>'' then
              begin
//                  detallectas.entidad_id.Buscar(ZQSaldos.FieldByName('entidad_id').AsString);
//                  detallectas.btnactualizar.Click;
              end;
        end;

    finally
      detallectas.Show;
    end;
end;

procedure Tsaldoclientes.btnestadoClick(Sender: TObject);
begin
    try
      estadoctas:=Testadoctas.Create(self);
      estadoctas.tipodocu_tipoctacte:=tipodocu_tipoctacte;
      if ZQSaldos.Active then
        begin
            if ZQSaldos.FieldByName('entidad_id').AsString<>'' then
              begin
                  estadoctas.entidad_id.Buscar(ZQSaldos.FieldByName('entidad_id').AsString);
                  estadoctas.btnactualizar.Click;
              end;
        end;

    finally
      estadoctas.Show;
    end;
end;

procedure Tsaldoclientes.btnimprimirClick(Sender: TObject);
begin
//    cargatemporal;

////    if tipo_resumen.ItemIndex=0 then  //DETALLE DE CTA
//    begin
//
//        VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\ventas\detallecuenta.rep';
//        VCLReport1.Report.Datainfo.Items[0].sql:='select * from tempestacuenta '+
//                                                 'order by fecha';
//
//        VCLReport1.Report.Datainfo.Items[0].sql:=VCLReport1.Report.Datainfo.Items[0].sql;
//        VCLReport1.Execute;
//
//    end
////    else
//    begin
//
//        VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\ventas\saldocuenta.rep';
//        VCLReport1.Report.Datainfo.Items[0].sql:='select * from tempestacuenta '+
//                                                 'order by fecha';
//
//        VCLReport1.Report.Datainfo.Items[0].sql:=VCLReport1.Report.Datainfo.Items[0].sql;
//        VCLReport1.Execute;
//
//    end;




end;

end.
