unit Unitestadodectasproveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid, AdvListV,
  UnitSqlListView;

type
  Testadoctasproveedores = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    proveedor_id: TSqlComboBox;
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
    Label4: TLabel;
    personal_id: TSqlComboBox;
    puntoventa_id: TSqlListView;
    Titles1: TTitles;
    BtnDetalleImputacion: TButton;
    ZQDebitos: TZQuery;
    ZQCreditos: TZQuery;
    ZQuery3: TZQuery;
    ZQPendientesdocumentocompra_id: TIntegerField;
    ZQPendientesdocumentocompra_numero: TIntegerField;
    ZQPendientesdocumentocompra_fecha: TDateField;
    ZQPendientesdocumentocompra_hora: TTimeField;
    ZQPendientesdocumentocompra_total: TFloatField;
    ZQPendientesdocumentocompra_estado: TStringField;
    ZQPendientesdocumentocompra_pagado: TFloatField;
    ZQPendientesdocumentocompra_saldo: TFloatField;
    ZQPendientesdocumentocompra_observacion: TStringField;
    ZQPendientesdocumentocompra_condicionventa: TIntegerField;
    ZQPendientesdocumentocompra_fechavenc: TDateField;
    ZQPendientespersonal_id: TIntegerField;
    ZQPendientesproveedor_id: TIntegerField;
    ZQPendientestipodocu_id: TIntegerField;
    ZQPendientesdocumentocompra_neto21: TFloatField;
    ZQPendientesdocumentocompra_iva21: TFloatField;
    ZQPendientesdocumentocompra_neto105: TFloatField;
    ZQPendientesdocumentocompra_iva105: TFloatField;
    ZQPendientesdocumentocompra_otrosimpuestos: TFloatField;
    ZQPendientesdocumentocompra_puntoventa: TIntegerField;
    ZQPendientesdocumentocompra_neto27: TFloatField;
    ZQPendientesdocumentocompra_iva27: TFloatField;
    ZQPendientesdocumentocompra_nogravado: TFloatField;
    ZQPendientesdocumentocompra_tishhperc: TFloatField;
    ZQPendientesdocumentocompra_ivaret: TFloatField;
    ZQPendientesdocumentocompra_ivaperc: TFloatField;
    ZQPendientesdocumentocompra_dgrret: TFloatField;
    ZQPendientesdocumentocompra_dgrperc: TFloatField;
    ZQPendientestipodocu_id_1: TIntegerField;
    ZQPendientestipodocu_nombre: TStringField;
    ZQPendientestipodocu_tipo: TStringField;
    ZQPendientestipodocu_caja: TIntegerField;
    ZQPendientestipodocu_stock: TIntegerField;
    ZQPendientestipodocu_iva: TIntegerField;
    ZQPendientestipodocu_fiscal: TIntegerField;
    ZQPendientestipodocu_ultimonumero: TIntegerField;
    ZQPendientespuntoventa_id: TIntegerField;
    ZQPendientestipodocu_letra: TStringField;
    ZQPendientestipodocu_debcred: TStringField;
    ZQPendientestipodocufiscal_id: TIntegerField;
    ZQPendientestipodocu_preimpresos: TIntegerField;
    ZQPendientestipodocu_impresora: TStringField;
    ZQPendientestipodocu_copias: TIntegerField;
    ZQPendientestipodocu_preview: TIntegerField;
    ZQPendientestipodocu_prompt: TIntegerField;
    ZQPendientestipodocu_ctacte: TIntegerField;
    ZQPendientestipodocu_archivoimpresion: TStringField;
    ZQPendientestipodocu_leyenda: TStringField;
    ZQPendientestipodocu_nombreabrev: TStringField;
    ZQPendientestipodocu_manual: TIntegerField;
    ZQPendientespuntoventa_id_1: TIntegerField;
    ZQPendientespuntoventa_numero: TIntegerField;
    ZQPendientespuntoventa_descripcion: TStringField;
    ZQPendientessucursal_id: TIntegerField;
    ZQPendientespuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQPendientespuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQPendientesproveedor_id_1: TIntegerField;
    ZQPendientesproveedor_nombre: TStringField;
    ZQPendientesproveedor_domicilio: TStringField;
    ZQPendientesproveedor_documentonro: TStringField;
    ZQPendientesproveedor_documentotipo: TStringField;
    ZQPendientesproveedor_telefono: TStringField;
    ZQPendientesproveedor_celular: TStringField;
    ZQPendientesproveedor_mail: TStringField;
    ZQPendientescondicioniva_id: TIntegerField;
    ZQPendientesproveedor_condicionventa: TStringField;
    ZQPendientesproveedor_tipo: TStringField;
    ZQPendienteslocalidad_id: TIntegerField;
    ZQPendientespersonal_id_1: TIntegerField;
    ZQPendientespersonal_nombre: TStringField;
    ZQPendientespersonal_domicilio: TStringField;
    ZQPendientespersonal_telefono: TStringField;
    ZQPendientespersonal_celular: TStringField;
    ZQPendientespersonal_mail: TStringField;
    ZQPendientespersonal_usuario: TStringField;
    ZQPendientespersonal_pass: TStringField;
    ZQPendientesperfil_id: TIntegerField;
    ZQPendientessucursal_id_1: TIntegerField;
    ZQPendientessucursal_nombre: TStringField;
    ZQPendientessucursal_domicilio: TStringField;
    ZQPendientessucursal_telefono: TStringField;
    ZQPendientesempresa_id: TIntegerField;
    ZQPendientessucursal_tipoliquidvendedor: TStringField;
    ZQPendientessucursal_tipoliquidsucursal: TStringField;
    ZQPendientescliente_id: TIntegerField;
    ZQPendientessucursal_tipodocumentoliquidar: TIntegerField;
    ZQPendientesdebito: TFloatField;
    ZQPendientescredito: TFloatField;
    ZQPendientesacumulado: TFloatField;
    ZQPendientesgrupo: TStringField;
    ZQPendientesdocumento_nombre: TStringField;
    ZQPendientesdocumentocomprafecha: TStringField;
    ZQPendientespuntoventanumero: TStringField;
    ZQPendientesdocumentocompranumero: TStringField;
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
    procedure BtnDetalleImputacionClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    temporal_idproceso:string;
    proveedores_ids_sin_deuda:string;
    procedure SetNotRequired;
    function GenerarWhere:string;
    function WhereproveedoresinDeuda:string;
  public
    { Public declarations }
    procedure cargatemporal;


  end;

var
  estadoctasproveedores: Testadoctasproveedores;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


function Testadoctasproveedores.WhereproveedoresinDeuda:string;
begin



    Result:='';
end;


function Testadoctasproveedores.GenerarWhere:string;
var
  where:string;
begin
    where:='1=1 '+Princ.empresa_where+
           'and tiposdocumento.tipodocu_debcred<>"N/A" '+
           'and documentoscompras.documentocompra_estado="PENDIENTE" ';

    if proveedor_id.codigo<>'-1' then
      where:=where+' and proveedores.proveedor_id="'+proveedor_id.codigo+'" ';

    if personal_id.codigo<>'-1' then
      where:=where+' and documentoscompras.personal_id="'+personal_id.codigo+'" ';

    puntoventa_id.GenerarWhere;
    where:=where+' and '+puntoventa_id.where;


    where:=where+'and documentoscompras.documentocompra_condicionventa=1 ';

    if cbhastafecha.Checked then
      where:=where+'and documentoscompras.documentocompra_fecha<="'+formatdatetime('yyyy-mm-dd',hasta_fecha.Date)+'" ';

    if cbhastafechavenc.Checked then
      where:=where+'and documentoscompras.documentocompra_fechavenc<="'+formatdatetime('yyyy-mm-dd',hasta_fecha_venc.Date)+'" ';

    Result:=where;

end;

procedure Testadoctasproveedores.SetNotRequired;
var
  i:integer;
begin
    for i := 0 to ZQPendientes.Fields.Count-1 do
      ZQPendientes.Fields.Fields[i].Required:=false;

end;

procedure Testadoctasproveedores.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure Testadoctasproveedores.FormCreate(Sender: TObject);
begin
    proveedor_id.llenarcombo;
    proveedor_id.ItemIndex:=0;
    desde_fecha.Date:=Date-30;
    hasta_fecha.DateTime:=Date;
    desde_fecha_venc.Date:=desde_fecha.Date;
    hasta_fecha_venc.Date:=hasta_fecha.Date;
    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;
    Titles1.Memo.Text:='select * from puntodeventa where 1=1 '+Princ.empresa_where;
    puntoventa_id.Fill;
    
end;

procedure Testadoctasproveedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Testadoctasproveedores.FormShow(Sender: TObject);
begin
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Testadoctasproveedores.cargatemporal;
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

procedure Testadoctasproveedores.cbdesdefechaClick(Sender: TObject);
begin
    lbldesdefecha.Enabled:=cbdesdefecha.Checked;
    desde_fecha.Enabled:=cbdesdefecha.Checked;

end;

procedure Testadoctasproveedores.cbdesdefechavencClick(Sender: TObject);
begin
    lbldesdevenc.Enabled:=cbdesdefechavenc.Checked;
    desde_fecha_venc.Enabled:=cbdesdefechavenc.Checked;
end;

procedure Testadoctasproveedores.cbhastafechaClick(Sender: TObject);
begin
    lblhastafecha.Enabled:=cbhastafecha.Checked;
    hasta_fecha.Enabled:=cbhastafecha.Checked;
end;

procedure Testadoctasproveedores.cbhastafechavencClick(Sender: TObject);
begin
    lblhastavenc.Enabled:=cbhastafechavenc.Checked;
    hasta_fecha_venc.Enabled:=cbhastafechavenc.Checked;
end;

procedure Testadoctasproveedores.CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
  var ChangeColor: Boolean);
begin
    if DS.FieldByName('tipodocu_nombre').AsString=TIPODOCU_ORDENDEPAGO then
      begin
          RowColor:=$00E4F2E3;

          ChangeColor:=true;
      end;
end;

procedure Testadoctasproveedores.DBGrid1DblClick(Sender: TObject);
begin
    if ZQPendientes.Active then
      begin
          if ZQPendientes.RecordCount>0 then
            Princ.Abrirdocumentocompra(ZQPendientes.FieldByName('documentocompra_id').AsString,ZQPendientes.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure Testadoctasproveedores.btnactualizarClick(Sender: TObject);
var
  acumulado:real;
  grupo, condicion_saldoanterior:string;
  acumulado_cliente:real;
  proveedor_id_anterior:string;
begin
    ZQPendientes.Active:=false;
    grupo:='concat("0-",documentoscompras.documentocompra_id)';
    condicion_saldoanterior:='1=2';
    if cbdesdefecha.Checked then
      begin
          grupo:=' if(documentoscompras.documentocompra_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",concat("0-",documentoscompras.proveedor_id),concat("0-",documentoscompras.documentocompra_id)) ';
          condicion_saldoanterior:='documentoscompras.documentocompra_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'"';
      end;

    if cbdesdefechavenc.Checked and cbdesdefecha.Checked then
      begin
          if desde_fecha_venc.Date<desde_fecha.Date then
            begin
                grupo:=' if(documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat("0-",documentoscompras.proveedor_id),concat("0-",documentoscompras.documentocompra_id)) ';
                condicion_saldoanterior:='documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';

            end;


      end
    else
      begin
          if cbdesdefechavenc.Checked then
            begin
                grupo:=' if(documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat("0-",documentoscompras.proveedor_id),concat("0-",documentoscompras.documentocompra_id)) ';
                condicion_saldoanterior:='documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';
            end;
      end;


    ZQPendientes.SQL.Text:='select *, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompras.documentocompra_saldo,0)) as debito, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentoscompras.documentocompra_saldo,0)) as credito, '+
                           '0.00 as acumulado, '+grupo+' as grupo, '+
                           'if('+condicion_saldoanterior+',"Saldo anterior",CONCAT(tiposdocumento.tipodocu_nombreabrev," ",tiposdocumento.tipodocu_letra)) as documento_nombre, '+
                           'if('+condicion_saldoanterior+',"'+formatdatetime('dd/mm/yyyy',desde_fecha.Date)+'",DATE_FORMAT(documentoscompras.documentocompra_fecha,"%d/%m/%Y")) as documentocomprafecha, '+
                           'if('+condicion_saldoanterior+',"0",puntoventa_numero) as puntoventanumero, '+
                           'if('+condicion_saldoanterior+',"0",documentoscompras.documentocompra_numero) as documentocompranumero, '+
                           '0.00 as acumulado_cliente '+
                           'from documentoscompras '+
                           'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                           'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                           'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                           'inner join personal on documentoscompras.personal_id=personal.personal_id '+
                           'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                           'group by grupo '+
                           'order by proveedores.proveedor_nombre, documentoscompras.documentocompra_fecha, documentoscompras.documentocompra_id ';



    ZQPendientes.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQPendientes.SQL.Text,GenerarWhere);


    ZQPendientes.Active:=true;
    SetNotRequired;
    acumulado:=0;
    acumulado_cliente:=0;
    ZQPendientes.First;
    ZQPendientes.FieldByName('acumulado').ReadOnly:=false;
    proveedor_id_anterior:=ZQPendientes.FieldByName('proveedor_id').AsString;
    proveedores_ids_sin_deuda:='-1';
    while not ZQPendientes.Eof do
        begin
            acumulado:=acumulado+ZQPendientes.FieldByName('debito').AsFloat-ZQPendientes.FieldByName('credito').AsFloat;

            ZQPendientes.Edit;
            ZQPendientes.FieldByName('acumulado').AsFloat:=acumulado;
            ZQPendientes.Post;

            if proveedor_id_anterior<>ZQPendientes.FieldByName('proveedor_id').AsString then
              begin
                  acumulado_cliente:=0;
              end;

            acumulado_cliente:=acumulado_cliente+ZQPendientes.FieldByName('debito').AsFloat-ZQPendientes.FieldByName('credito').AsFloat;

            ZQPendientes.Next;

        end;

end;

procedure Testadoctasproveedores.BtnDetalleImputacionClick(Sender: TObject);
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
    ZQDebitos.SQL.Text:='select * from documentoscompras '+
                        'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                        'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                        'where documentoscompras.documentocompra_estado="PENDIENTE" and '+
                        'tiposdocumento.tipodocu_tipo="Compra" and tiposdocumento.tipodocu_debcred="DEBITO" '+Princ.empresa_where+
                        ' order by documentoscompras.documentocompra_fecha, documentoscompras.documentocompra_numero ';

    if proveedor_id.Text<>'Todos' then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' proveedores.proveedor_id="'+proveedor_id.codigo+'" ');

    if cbdesdefecha.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentoscompras.documentocompra_fecha>="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" ');

    if cbhastafecha.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentoscompras.documentocompra_fecha<="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" ');

    if cbdesdefechavenc.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentoscompras.documentocompra_fechavenc>="'+FormatDateTime('yyyy-mm-dd',desde_fecha_venc.Date)+'" ');

    if cbhastafechavenc.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentoscompras.documentocompra_fechavenc<="'+FormatDateTime('yyyy-mm-dd',hasta_fecha_venc.Date)+'" ');

    puntoventa_id.GenerarWhere;
    ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,puntoventa_id.where);

    if personal_id.Text<>'Todos' then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentoscompras.personal_id="'+personal_id.codigo+'" ');

    ZQDebitos.SQL.Text:=ZQDebitos.SQL.Text+' and documentoscompras.documentocompra_condicionventa="'+CONDICIONVENTA_CTACTE+'" ';

    ZQDebitos.Active:=true;
    ZQDebitos.First;
    ZQCreditos.Active:=false;
    ZQCreditos.SQL.Text:='select * from documentocompradocus '+
                         'inner join documentoscompras on documentocompradocus.documentocompra_id=documentoscompras.documentocompra_id '+
                         'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                         'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                         'where documentocompradocus.documentocompra_idpago=:documentocompra_idpago and documentocompradoc_tiporelacion="IMPUTACION"';

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
            Princ.ZQExcecSQL.ParamByName('temporal_fecha1').AsString:=formatdatetime('yyyy-mm-dd',ZQDebitos.FieldByName('documentocompra_fecha').AsDateTime);
            Princ.ZQExcecSQL.ParamByName('temporal_int4').AsInteger:=orden;
            Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDebitos.FieldByName('documentocompra_id').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int2').AsString:=ZQDebitos.FieldByName('documentocompra_numero').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQDebitos.FieldByName('puntoventa_numero').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float2').AsString:=ZQDebitos.FieldByName('documentocompra_total').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:='0';
            Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQDebitos.FieldByName('tipodocu_nombreabrev').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDebitos.FieldByName('proveedor_nombre').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
            Princ.ZQExcecSQL.ExecSql;

            ZQCreditos.Active:=false;
            ZQCreditos.ParamByName('documentocompra_idpago').AsString:= ZQDebitos.FieldByName('documentocompra_id').AsString;
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
                    Princ.ZQExcecSQL.ParamByName('temporal_fecha1').AsString:=formatdatetime('yyyy-mm-dd',ZQCreditos.FieldByName('documentocompra_fecha').AsDateTime);
                    Princ.ZQExcecSQL.ParamByName('temporal_int4').AsInteger:=orden;
                    Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDebitos.FieldByName('documentocompra_id').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int2').AsString:=ZQCreditos.FieldByName('documentocompra_numero').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQCreditos.FieldByName('puntoventa_numero').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_float2').AsFloat:=ZQCreditos.FieldByName('documentocompradoc_importe').AsFloat*-1;
                    Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:='0';
                    Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQCreditos.FieldByName('tipodocu_nombreabrev').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDebitos.FieldByName('proveedor_nombre').AsString;
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
    if cbdesdefecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    if cbhastafecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    if cbdesdefechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHAVENC').AsString:=datetostr(desde_fecha_venc.Date);
    if cbhastafechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHAVENC').AsString:=datetostr(hasta_fecha_venc.Date);

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

procedure Testadoctasproveedores.btnimprimirClick(Sender: TObject);
var
  condicion_saldoanterior, grupo:string;
begin
    grupo:='(documentoscompras.documentocompra_id)';
    condicion_saldoanterior:='1=2';
    if cbdesdefecha.Checked then
      begin
          grupo:=' if(documentoscompras.documentocompra_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",concat(sucursales.sucursal_id,"-",documentoscompras.proveedor_id),documentoscompras.documentocompra_id) ';
          condicion_saldoanterior:='documentoscompras.documentocompra_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'"';

      end;

    if cbdesdefechavenc.Checked and cbdesdefecha.Checked then
      begin
          if desde_fecha_venc.Date<desde_fecha.Date then
            begin
                grupo:=' if(documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat(sucursales.sucursal_id,"-",documentoscompras.proveedor_id),documentoscompras.documentocompra_id) ';
                condicion_saldoanterior:='documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';

            end;

      end
    else
      begin
          if cbdesdefechavenc.Checked then
            begin
                grupo:=' if(documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat(sucursales.sucursal_id,"-",documentoscompras.proveedor_id),documentoscompras.documentocompra_id) ';
                condicion_saldoanterior:='documentoscompras.documentocompra_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';
            end;
      end;

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'estado_de_ctasctes.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    if cbdesdefecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    if cbhastafecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    if cbdesdefechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHAVENC').AsString:=datetostr(desde_fecha_venc.Date);
    if cbhastafechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHAVENC').AsString:=datetostr(hasta_fecha_venc.Date);



    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompras.documentocompra_saldo,0)) as debito, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentoscompras.documentocompra_saldo,0)) as credito, '+
                           '0.00 as acumulado, '+grupo+' as grupo, '+
                           'if('+condicion_saldoanterior+',"Saldo anterior",CONCAT(tiposdocumento.tipodocu_nombreabrev," ",tiposdocumento.tipodocu_letra)) as documento_nombre, '+
                           'if('+condicion_saldoanterior+',"'+formatdatetime('dd/mm/yyyy',desde_fecha.Date)+'",DATE_FORMAT(documentoscompras.documentocompra_fecha,"%d/%m/%Y")) as documentocomprafecha, '+
                           'puntodeventa.puntoventa_id as puntoventanumero, '+
                           'if('+condicion_saldoanterior+',"0",documentoscompras.documentocompra_numero) as documentocompranumero '+

                           'from documentoscompras '+
//                           'left join documentocompradetalles on documentoscompras.documentocompra_id=documentocompradetalles.documentocompra_id '+
//                           'left join documentocompradetalles documentocompradetalles2 on documentocompradetalles.documentocompradetalle_idorig=documentocompradetalles2.documentocompradetalle_id '+
//                           'left join documentoscompras documentoscompras2 on documentocompradetalles2.documentocompra_id=documentoscompras2.documentocompra_id '+
                           'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                           'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                           'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                           'inner join personal on documentoscompras.personal_id=personal.personal_id '+
                           'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                           'group by grupo '+
                           'order by sucursal_nombre, personal.personal_nombre, proveedor_nombre, proveedores.proveedor_id, documentocompra_fecha, documentocompra_numero ';



    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.GTBUtilidades1.AgregarWhere(Princ.VCLReport1.Report.Datainfo.Items[0].sql,GenerarWhere);

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.GTBUtilidades1.AgregarWhere(Princ.VCLReport1.Report.Datainfo.Items[0].sql,'proveedores.proveedor_id not in ('+self.proveedores_ids_sin_deuda+')');


    Princ.VCLReport1.Execute;

end;

end.
