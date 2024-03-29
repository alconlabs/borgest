unit Unitestadodectas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid, AdvListV,
  UnitSqlListView;

type
  Testadoctas = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    entidad_id: TSqlComboBox;
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
    lblhastafecha: TLabel;
    hasta_fecha: TDateTimePicker;
    cbdesdefecha: TCheckBox;
    cbhastafecha: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lbldesdevenc: TLabel;
    lblhastavenc: TLabel;
    cbdesdefechavenc: TCheckBox;
    cbhastafechavenc: TCheckBox;
    desde_fecha_venc: TDateTimePicker;
    hasta_fecha_venc: TDateTimePicker;
    puntoventa_id: TSqlListView;
    Titles1: TTitles;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
      var ChangeColor: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbdesdefechaClick(Sender: TObject);
    procedure cbhastafechaClick(Sender: TObject);
    procedure cbdesdefechavencClick(Sender: TObject);
    procedure cbhastafechavencClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetNotRequired;
  public
    { Public declarations }
    tipodocu_tipoctacte:string;
    procedure cargatemporal;


  end;

var
  estadoctas: Testadoctas;

implementation

uses UnitPrinc;

{$R *.dfm}


procedure Testadoctas.SetNotRequired;
var
  i:integer;
begin
    for i := 0 to ZQPendientes.Fields.Count-1 do
      ZQPendientes.Fields.Fields[i].Required:=false;

end;

procedure Testadoctas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Testadoctas.FormCreate(Sender: TObject);
begin
    tipodocu_tipoctacte:='DINERO';
    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=0;
    desde_fecha.Date:=Date-30;
    hasta_fecha.DateTime:=Date;
    desde_fecha_venc.Date:=desde_fecha.Date;
    hasta_fecha_venc.Date:=hasta_fecha.Date;
    Titles1.Memo.Text:='select * from puntodeventa where 1=1 '+Princ.empresa_where;
    puntoventa_id.Fill;
    
end;

procedure Testadoctas.cargatemporal;
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

procedure Testadoctas.cbdesdefechaClick(Sender: TObject);
begin
    lbldesdefecha.Enabled:=cbdesdefecha.Checked;
    desde_fecha.Enabled:=cbdesdefecha.Checked;

end;

procedure Testadoctas.cbdesdefechavencClick(Sender: TObject);
begin
    lbldesdevenc.Enabled:=cbdesdefechavenc.Checked;
    desde_fecha_venc.Enabled:=cbdesdefechavenc.Checked;
end;

procedure Testadoctas.cbhastafechaClick(Sender: TObject);
begin
    lblhastafecha.Enabled:=cbhastafecha.Checked;
    hasta_fecha.Enabled:=cbhastafecha.Checked;
end;

procedure Testadoctas.cbhastafechavencClick(Sender: TObject);
begin
    lblhastavenc.Enabled:=cbhastafechavenc.Checked;
    hasta_fecha_venc.Enabled:=cbhastafechavenc.Checked;
end;

procedure Testadoctas.CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
  var ChangeColor: Boolean);
begin
    if DS.FieldByName('tipodocu_nombre').AsString='Recibo de Venta' then
      begin
          RowColor:=$00E4F2E3;

          ChangeColor:=true;
      end;
end;

procedure Testadoctas.DBGrid1DblClick(Sender: TObject);
begin
    if ZQPendientes.Active then
      begin
          if ZQPendientes.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQPendientes.FieldByName('documento_id').AsString,ZQPendientes.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure Testadoctas.btnactualizarClick(Sender: TObject);
var
  acumulado:real;
  grupo, condicion_saldoanterior:string;
begin
    ZQPendientes.Active:=false;
    grupo:='(documentos.documento_id)';
    condicion_saldoanterior:='1=2';
    if cbdesdefecha.Checked then
      begin
          grupo:=' if(documentos.documento_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",0,documentos.documento_id) ';
          condicion_saldoanterior:='documentos.documento_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'"';
      end;

    ZQPendientes.SQL.Text:='select *, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentos.documento_saldo,0)) as debito, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentos.documento_saldo,0)) as credito, '+
                           '0.00 as acumulado, '+grupo+' as grupo, '+
                           'if('+condicion_saldoanterior+',"Saldo anterior",CONCAT(tiposdocumento.tipodocu_nombreabrev," ",tiposdocumento.tipodocu_letra)) as documentonombre, '+
                           'if('+condicion_saldoanterior+',"'+formatdatetime('dd/mm/yyyy',desde_fecha.Date)+'",DATE_FORMAT(documentos.documento_fecha,"%d/%m/%Y")) as documentofecha, '+
                           'if('+condicion_saldoanterior+',"0",puntoventa_numero) as puntoventanumero, '+
                           'if('+condicion_saldoanterior+',"0",documentos.documento_numero) as documentonumero '+

                           'from documentos '+
                           'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumento.tipodocu_id '+
                           'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                           'inner join entidades on documentos.entidad_id=entidades.entidad_id '+
                           'where 1=1 '+Princ.empresa_where+
                           'and tiposdocumento.tipodocu_debcred<>"N/A" '+
                           'and documentos.documento_estado="PENDIENTE" ';



    if entidad_id.codigo<>'-1' then
      ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+' and entidades.entidad_id="'+entidad_id.codigo+'" ';

    puntoventa_id.GenerarWhere;
    ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+' and '+puntoventa_id.where;


    if cbhastafecha.Checked then
      ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'and documentos.documento_fecha<="'+formatdatetime('yyyy-mm-dd',hasta_fecha.Date)+'" ';

    if cbdesdefechavenc.Checked then
      ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'and documentos.documento_fechafenc>="'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'" ';

    if cbhastafechavenc.Checked then
      ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'and documentos.documento_fechafenc<="'+formatdatetime('yyyy-mm-dd',hasta_fecha_venc.Date)+'" ';

    ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'group by grupo ';


    ZQPendientes.SQL.Text:=ZQPendientes.SQL.Text+'order by entidades.entidad_razonsocial, documentos.documento_fecha, documentos.documento_id ';


    ZQPendientes.Active:=true;
    SetNotRequired;
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

procedure Testadoctas.btnimprimirClick(Sender: TObject);
begin
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\estado_de_ctasctes.rep';
    if cbdesdefecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    if cbhastafecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    if cbdesdefechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHAVENC').AsString:=datetostr(desde_fecha_venc.Date);
    if cbhastafechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHAVENC').AsString:=datetostr(hasta_fecha_venc.Date);


    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=ZQPendientes.SQL.Text;

    Princ.VCLReport1.Execute;

end;

end.
