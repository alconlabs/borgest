unit Unitsaldoproveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid;

type
  Tsaldoproveedores = class(TForm)
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
    proveedor_id: TSqlComboBox;
    Label3: TLabel;
    Label1: TLabel;
    sucursal_id: TSqlComboBox;
    CBSindeuda: TCheckBox;
    BtnDetalleImputacion: TButton;
    ZQDebitos: TZQuery;
    ZQCreditos: TZQuery;
    ZQSaldosdocumentocompra_id: TIntegerField;
    ZQSaldosdocumentocompra_numero: TIntegerField;
    ZQSaldosdocumentocompra_fecha: TDateField;
    ZQSaldosdocumentocompra_hora: TTimeField;
    ZQSaldosdocumentocompra_total: TFloatField;
    ZQSaldosdocumentocompra_estado: TStringField;
    ZQSaldosdocumentocompra_pagado: TFloatField;
    ZQSaldosdocumentocompra_saldo: TFloatField;
    ZQSaldosdocumentocompra_observacion: TStringField;
    ZQSaldosdocumentocompra_condicionventa: TIntegerField;
    ZQSaldosdocumentocompra_fechavenc: TDateField;
    ZQSaldospersonal_id: TIntegerField;
    ZQSaldosproveedor_id: TIntegerField;
    ZQSaldostipodocu_id: TIntegerField;
    ZQSaldosdocumentocompra_neto21: TFloatField;
    ZQSaldosdocumentocompra_iva21: TFloatField;
    ZQSaldosdocumentocompra_neto105: TFloatField;
    ZQSaldosdocumentocompra_iva105: TFloatField;
    ZQSaldosdocumentocompra_otrosimpuestos: TFloatField;
    ZQSaldosdocumentocompra_puntoventa: TIntegerField;
    ZQSaldosdocumentocompra_neto27: TFloatField;
    ZQSaldosdocumentocompra_iva27: TFloatField;
    ZQSaldosdocumentocompra_nogravado: TFloatField;
    ZQSaldosdocumentocompra_tishhperc: TFloatField;
    ZQSaldosdocumentocompra_ivaret: TFloatField;
    ZQSaldosdocumentocompra_ivaperc: TFloatField;
    ZQSaldosdocumentocompra_dgrret: TFloatField;
    ZQSaldosdocumentocompra_dgrperc: TFloatField;
    ZQSaldosproveedor_id_1: TIntegerField;
    ZQSaldosproveedor_nombre: TStringField;
    ZQSaldosproveedor_domicilio: TStringField;
    ZQSaldosproveedor_documentonro: TStringField;
    ZQSaldosproveedor_documentotipo: TStringField;
    ZQSaldosproveedor_telefono: TStringField;
    ZQSaldosproveedor_celular: TStringField;
    ZQSaldosproveedor_mail: TStringField;
    ZQSaldoscondicioniva_id: TIntegerField;
    ZQSaldosproveedor_condicionventa: TStringField;
    ZQSaldosproveedor_tipo: TStringField;
    ZQSaldoslocalidad_id: TIntegerField;
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
    ZQSaldostipodocu_nombreabrev: TStringField;
    ZQSaldostipodocu_manual: TIntegerField;
    ZQSaldossaldo: TFloatField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    temporal_idproceso:string;
  public
    { Public declarations }
    procedure cargatemporal;


  end;

var
  saldoproveedores: Tsaldoproveedores;

implementation

uses UnitPrinc, Unitventadetalle, Unitdetallectas, Unitestadodectas,
  Unitestadodectasproveedores;

{$R *.dfm}


procedure Tsaldoproveedores.FormClose(Sender: TObject; var Action: TCloseAction);
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
    Application.BringToFront;
end;

procedure Tsaldoproveedores.FormCreate(Sender: TObject);
begin
    temporal_idproceso:='';
end;

procedure Tsaldoproveedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tsaldoproveedores.FormShow(Sender: TObject);
begin
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=0;
    proveedor_id.llenarcombo;
    proveedor_id.ItemIndex:=0;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tsaldoproveedores.cargatemporal;
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

procedure Tsaldoproveedores.CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
  var ChangeColor: Boolean);
begin
    if DS.FieldByName('tipodocu_nombre').AsString='Recibo de Venta' then
      begin
          RowColor:=$00E4F2E3;

          ChangeColor:=true;
      end;
end;

procedure Tsaldoproveedores.btnactualizarClick(Sender: TObject);
var
  acumulado:real;
begin
    ZQSaldos.Active:=false;
    ZQSaldos.SQL.Text:='select *, '+
                       'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompras.documentocompra_saldo,documentoscompras.documentocompra_saldo*-1)) as saldo '+
                       'from documentoscompras '+
                       'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                       'where 1=1 '+Princ.empresa_where+
                       'and tiposdocumento.tipodocu_debcred<>"N/A" '+
                       'and documentoscompras.documentocompra_estado<>"ANULADA" ';

    if sucursal_id.codigo<>'-1' then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and puntodeventa.sucursal_id="'+sucursal_id.codigo+'" ';

    if proveedor_id.codigo<>'-1' then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and proveedores.proveedor_id="'+proveedor_id.codigo+'" ';

    if CBSindeuda.Checked then
      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and documentoscompras.documentocompra_estado="PENDIENTE" ';

      ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'and documentoscompras.documentocompra_condicionventa=1 ';


    ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'group by proveedores.proveedor_id ';
    ZQSaldos.SQL.Text:=ZQSaldos.SQL.Text+'order by proveedores.proveedor_nombre ';


    ZQSaldos.Active:=true;

end;

procedure Tsaldoproveedores.btndetalleClick(Sender: TObject);
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

procedure Tsaldoproveedores.btnestadoClick(Sender: TObject);
begin
    try
      estadoctasproveedores:=Testadoctasproveedores.Create(self);
      if ZQSaldos.Active then
        begin
            if ZQSaldos.FieldByName('proveedor_id').AsString<>'' then
              begin
                  estadoctasproveedores.proveedor_id.Buscar(ZQSaldos.FieldByName('proveedor_id').AsString);
                  estadoctasproveedores.btnactualizar.Click;
              end;
        end;

    finally
      estadoctasproveedores.Show;
    end;
end;

procedure Tsaldoproveedores.btnimprimirClick(Sender: TObject);
begin
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'saldoproveedores.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=ZQSaldos.SQL.Text;

    Princ.VCLReport1.Execute;



end;

procedure Tsaldoproveedores.BtnDetalleImputacionClick(Sender: TObject);
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

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'detalle_imputacion.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
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
