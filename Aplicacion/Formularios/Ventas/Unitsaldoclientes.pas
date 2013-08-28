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
    ZQSaldosdocumentoventa_id: TIntegerField;
    ZQSaldosdocumentoventa_numero: TIntegerField;
    ZQSaldosdocumentoventa_fecha: TDateField;
    ZQSaldosdocumentoventa_hora: TTimeField;
    ZQSaldosdocumentoventa_neto21: TFloatField;
    ZQSaldosdocumentoventa_iva21: TFloatField;
    ZQSaldosdocumentoventa_neto105: TFloatField;
    ZQSaldosdocumentoventa_iva105: TFloatField;
    ZQSaldosdocumentoventa_netonogravado: TFloatField;
    ZQSaldosdocumentoventa_total: TFloatField;
    ZQSaldosdocumentoventa_estado: TStringField;
    ZQSaldosdocumentoventa_pagado: TFloatField;
    ZQSaldosdocumentoventa_saldo: TFloatField;
    ZQSaldosdocumentoventa_observacion: TStringField;
    ZQSaldoscliente_id: TIntegerField;
    ZQSaldospersonal_id: TIntegerField;
    ZQSaldostipodocu_id: TIntegerField;
    ZQSaldosdocumentoventa_condicionventa: TIntegerField;
    ZQSaldosdocumentoventa_fechavenc: TDateField;
    ZQSaldosdocumentoventa_listaprecio: TIntegerField;
    ZQSaldosdocumentoventa_equipo1: TStringField;
    ZQSaldosdocumentoventa_equipo2: TStringField;
    ZQSaldosdocumentoventa_formapago: TStringField;
    ZQSaldoscliente_id_1: TIntegerField;
    ZQSaldoscliente_nombre: TStringField;
    ZQSaldoscliente_domicilio: TStringField;
    ZQSaldoscliente_documentonro: TStringField;
    ZQSaldoscliente_documentotipo: TStringField;
    ZQSaldoscliente_telefono: TStringField;
    ZQSaldoscliente_celular: TStringField;
    ZQSaldoscliente_mail: TStringField;
    ZQSaldoscondicioniva_id: TIntegerField;
    ZQSaldoscliente_listaprecio: TIntegerField;
    ZQSaldoscliente_condicionventa: TStringField;
    ZQSaldoslocalidad_id: TIntegerField;
    ZQSaldoscliente_observaciones: TStringField;
    ZQSaldostipodocu_id_1: TIntegerField;
    ZQSaldostipodocu_nombre: TStringField;
    ZQSaldostipodocu_tipo: TStringField;
    ZQSaldostipodocu_caja: TIntegerField;
    ZQSaldostipodocu_stock: TIntegerField;
    ZQSaldostipodocu_iva: TIntegerField;
    ZQSaldostipodocu_fiscal: TIntegerField;
    ZQSaldostipodocu_ultimonumero: TIntegerField;
    ZQSaldospuntoventa_id: TIntegerField;
    ZQSaldostipodocu_letra: TStringField;
    ZQSaldostipodocu_debcred: TStringField;
    ZQSaldostipodocufiscal_id: TIntegerField;
    ZQSaldostipodocu_preimpresos: TIntegerField;
    ZQSaldostipodocu_impresora: TStringField;
    ZQSaldostipodocu_copias: TIntegerField;
    ZQSaldostipodocu_preview: TIntegerField;
    ZQSaldostipodocu_prompt: TIntegerField;
    ZQSaldostipodocu_ctacte: TIntegerField;
    ZQSaldostipodocu_archivoimpresion: TStringField;
    ZQSaldostipodocu_leyenda: TStringField;
    ZQSaldossaldo: TFloatField;
    btnestado: TButton;
    btndetalle: TButton;
    cliente_id: TSqlComboBox;
    Label3: TLabel;
    Label1: TLabel;
    sucursal_id: TSqlComboBox;
    CBSindeuda: TCheckBox;
    BtnDetalleImputacion: TButton;
    ZQDebitos: TZQuery;
    ZQCreditos: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
      var ChangeColor: Boolean);
    procedure btnestadoClick(Sender: TObject);
    procedure btndetalleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDetalleImputacionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    temporal_idproceso:string;
  public
    { Public declarations }
    procedure cargatemporal;


  end;

var
  saldoclientes: Tsaldoclientes;

implementation

uses UnitPrinc, Unitventadetalle, Unitdetallectas, Unitestadodectas;

{$R *.dfm}


procedure Tsaldoclientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

    Self.Free;
end;

procedure Tsaldoclientes.FormCreate(Sender: TObject);
begin
    temporal_idproceso:='';
end;

procedure Tsaldoclientes.FormShow(Sender: TObject);
begin
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=0;
    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=0;
    
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
                       'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas.documentoventa_saldo,documentosventas.documentoventa_saldo*-1)) as saldo '+
                       'from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       'where 1=1 '+Princ.empresa_where+
                       'and tiposdocumento.tipodocu_debcred<>"N/A" '+
                       'and documentosventas.documentoventa_estado<>"ANULADA" ';

    if sucursal_id.codigo<>'-1' then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and puntodeventa.sucursal_id="'+sucursal_id.codigo+'" ';

    if cliente_id.codigo<>'-1' then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and clientes.cliente_id="'+cliente_id.codigo+'" ';

    if CBSindeuda.Checked then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and documentosventas.documentoventa_estado="PENDIENTE" ';


    if not strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE')) then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and documentosventas.documentoventa_condicionventa=1 ';


    ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'group by clientes.cliente_id ';
    ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'order by clientes.cliente_nombre ';


    ZQSaldos.Active:=true;

end;

procedure Tsaldoclientes.btndetalleClick(Sender: TObject);
begin
    try
      detallectas:=Tdetallectas.Create(self);
      if ZQSaldos.Active then
        begin
            if ZQSaldos.FieldByName('cliente_id').AsString<>'' then
              begin
                  detallectas.cliente_id.Buscar(ZQSaldos.FieldByName('cliente_id').AsString);
                  detallectas.btnactualizar.Click;
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
      if ZQSaldos.Active then
        begin
            if ZQSaldos.FieldByName('cliente_id').AsString<>'' then
              begin
                  estadoctas.cliente_id.Buscar(ZQSaldos.FieldByName('cliente_id').AsString);
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

procedure Tsaldoclientes.BtnDetalleImputacionClick(Sender: TObject);
var
  orden:integer;
begin
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

    temporal_idproceso:=Princ.codigo('temporales','temporal_idproceso');
    ZQDebitos.Active:=false;
    ZQDebitos.SQL.Text:='select * from documentosventas '+
                        'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                        'where documentosventas.cliente_id="'+ZQSaldos.FieldByName('cliente_id').AsString+'" and '+
                        'documentosventas.documentoventa_estado<>"ANULADA" and '+
                        'tiposdocumento.tipodocu_tipo="Venta" and tiposdocumento.tipodocu_debcred="DEBITO" '+Princ.empresa_where;

    if not strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE')) then
      ZQDebitos.SQL.Text:=ZQDebitos.SQL.Text+' and documentosventas.documentoventa_condicionventa=1 ';

    ZQDebitos.SQL.Text:=ZQDebitos.SQL.Text+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero ';

    ZQDebitos.Active:=true;
    ZQDebitos.First;
    ZQCreditos.Active:=false;
    ZQCreditos.SQL.Text:='select * from documentoventadocus '+
                         'inner join documentosventas on documentoventadocus.documentoventa_id=documentosventas.documentoventa_id '+
                         'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                         'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                         'where documentoventadocus.documentoventa_idpago=:documentoventa_idpago and documentoventadoc_tiporelacion="IMPUTACION"';

    Princ.ZQExcecSQL.Sql.Clear;
    Princ.ZQExcecSQL.Sql.Add('begin');
    Princ.ZQExcecSQL.ExecSql;

    while not ZQDebitos.Eof do
        begin
            orden:=1;
            Princ.ZQExcecSQL.Sql.Clear;
            Princ.ZQExcecSQL.Sql.Add('insert into temporales set ');
            Princ.ZQExcecSQL.Sql.Add('temporal_fecha1=:temporal_fecha1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int4=:temporal_int4, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int3=:temporal_int3, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int2=:temporal_int2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float2=:temporal_float2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float1=:temporal_float1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
            Princ.ZQExcecSQL.ParamByName('temporal_fecha1').AsString:=formatdatetime('yyyy-mm-dd',ZQDebitos.FieldByName('documentoventa_fecha').AsDateTime);
            Princ.ZQExcecSQL.ParamByName('temporal_int4').AsInteger:=orden;
            Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDebitos.FieldByName('documentoventa_id').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int2').AsString:=ZQDebitos.FieldByName('documentoventa_numero').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQDebitos.FieldByName('puntoventa_numero').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float2').AsString:=ZQDebitos.FieldByName('documentoventa_total').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:='0';
            Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQDebitos.FieldByName('tipodocu_nombreabrev').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDebitos.FieldByName('cliente_nombre').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
            Princ.ZQExcecSQL.ExecSql;

            ZQCreditos.Active:=false;
            ZQCreditos.ParamByName('documentoventa_idpago').AsString:= ZQDebitos.FieldByName('documentoventa_id').AsString;
            ZQCreditos.Active:=true;
            ZQCreditos.First;
            while not ZQCreditos.Eof do
                begin
                    orden:=orden+1;
                    Princ.ZQExcecSQL.Sql.Clear;
                    Princ.ZQExcecSQL.Sql.Add('insert into temporales set ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_fecha1=:temporal_fecha1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int4=:temporal_int4, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int3=:temporal_int3, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int2=:temporal_int2, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_float2=:temporal_float2, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_float1=:temporal_float1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
                    Princ.ZQExcecSQL.ParamByName('temporal_fecha1').AsString:=formatdatetime('yyyy-mm-dd',ZQCreditos.FieldByName('documentoventa_fecha').AsDateTime);
                    Princ.ZQExcecSQL.ParamByName('temporal_int4').AsInteger:=orden;
                    Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDebitos.FieldByName('documentoventa_id').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int2').AsString:=ZQCreditos.FieldByName('documentoventa_numero').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQCreditos.FieldByName('puntoventa_numero').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_float2').AsFloat:=ZQCreditos.FieldByName('documentoventadoc_importe').AsFloat*-1;
                    Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:='0';
                    Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQCreditos.FieldByName('tipodocu_nombreabrev').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDebitos.FieldByName('cliente_nombre').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
                    Princ.ZQExcecSQL.ExecSql;

                    ZQCreditos.Next;
                end;

            ZQDebitos.Next;
        end;

    Princ.ZQExcecSQL.Sql.Clear;
    Princ.ZQExcecSQL.Sql.Add('commit');
    Princ.ZQExcecSQL.ExecSql;

    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\detalle_imputacion.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from temporales '+
                                                   'where temporal_idproceso="'+temporal_idproceso+'" '+
                                                   'order by temporal_string2, temporal_id, temporal_int4 ';

    Princ.VCLReport1.Execute;

    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

end;

end.
