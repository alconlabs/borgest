unit Unitdetallectas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid;

type
  Tdetallectas = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    cliente_id: TSqlComboBox;
    ZQPendientes: TZQuery;
    MQdetalle: TMQuery;
    tiventas: TTitles;
    DBGrid1: TDBGrid;
    DSCPendientes: TDataSource;
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
    lbldesdefecha: TLabel;
    desde_fecha: TDateTimePicker;
    cbdesdefecha: TCheckBox;
    lblhastafecha: TLabel;
    hasta_fecha: TDateTimePicker;
    cbhastafecha: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
      var ChangeColor: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbdesdefechaClick(Sender: TObject);
    procedure cbhastafechaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cargatemporal;


  end;

var
  detallectas: Tdetallectas;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Tdetallectas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tdetallectas.FormCreate(Sender: TObject);
begin
    cliente_id.llenarcombo;
    desde_fecha.Date:=Date-30;
    hasta_fecha.DateTime:=Date;
end;

procedure Tdetallectas.cargatemporal;
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

procedure Tdetallectas.cbdesdefechaClick(Sender: TObject);
begin
    lbldesdefecha.Enabled:=cbdesdefecha.Checked;
    desde_fecha.Enabled:=cbdesdefecha.Checked;
end;

procedure Tdetallectas.cbhastafechaClick(Sender: TObject);
begin
    lblhastafecha.Enabled:=cbhastafecha.Checked;
    hasta_fecha.Enabled:=cbhastafecha.Checked;
end;

procedure Tdetallectas.CustomizeGrid1PaintRow(DS: TDataSet;
  var RowColor: TColor; var ChangeColor: Boolean);
begin
    if DS.FieldByName('tipodocu_nombre').AsString='Recibo de Venta' then
      begin
          RowColor:=$00E4F2E3;

          ChangeColor:=true;
      end;

    if DS.FieldByName('tipodocu_nombre').AsString='Nota de Credito de Venta' then
      begin
          RowColor:=$00F3E2E2;

          ChangeColor:=true;
      end;

end;

procedure Tdetallectas.DBGrid1DblClick(Sender: TObject);
begin
    if ZQPendientes.Active then
      begin
          if ZQPendientes.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQPendientes.FieldByName('documentoventa_id').AsString,ZQPendientes.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure Tdetallectas.btnactualizarClick(Sender: TObject);
var
  acumulado:real;
  grupo, condicion_saldoanterior:string;
begin
    ZQPendientes.Active:=false;
    grupo:='(documentoventa_id)';
    condicion_saldoanterior:='1=2';
    if cbdesdefecha.Checked then
      begin
          grupo:=' if(documentoventa_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",0,documentoventa_id) ';
          condicion_saldoanterior:='documentoventa_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'"';
      end;


    ZQPendientes.SQL.Text:='select *, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas.documentoventa_total,0)) as debito, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentosventas.documentoventa_total,0)) as credito, '+
                           '0.00 as acumulado, '+grupo+' as grupo, '+
                           'if('+condicion_saldoanterior+',"Saldo anterior",tiposdocumento.tipodocu_nombre) as documento_nombre, '+
                           'if('+condicion_saldoanterior+',"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",documentoventa_fecha) as documentoventafecha, '+
                           'if('+condicion_saldoanterior+',"0",puntoventa_numero) as puntoventanumero, '+
                           'if('+condicion_saldoanterior+',"0",documentoventa_numero) as documentoventanumero '+

                           'from documentosventas '+
                           'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                           'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                           'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                           'where 1=1 '+Princ.empresa_where+
                           'and documentosventas.documentoventa_estado<>"ANULADA" '+
                           'and tiposdocumento.tipodocu_debcred<>"N/A" '+
                           'and clientes.cliente_id="'+cliente_id.codigo+'" ';

    if not strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE')) then
      ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'and documentosventas.documentoventa_condicionventa=1 ';

    if cbhastafecha.Checked then
      ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'and documentosventas.documentoventa_fecha<="'+formatdatetime('yyyy-mm-dd',hasta_fecha.Date)+'" ';

    ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'group by grupo ';

    ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'order by documentoventa_fecha, documentoventa_id ';


    ZQPendientes.Active:=true;
    acumulado:=0;
    ZQPendientes.First;

    ZQPendientes.FieldByName('acumulado').ReadOnly:=false;
    while not ZQPendientes.Eof do
        begin
            acumulado:=acumulado+ZQPendientes.FieldByName('debito').AsFloat-ZQPendientes.FieldByName('credito').AsFloat;

            ZQPendientes.Edit;
            ZQPendientes.FieldByName('acumulado').AsFloat:=acumulado;
            ZQPendientes.Post;

            ZQPendientes.Next;
        end;

end;

procedure Tdetallectas.btnimprimirClick(Sender: TObject);
begin
    cargatemporal;

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
