unit Unitdetallectas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid, math,
  AdvListV, UnitSqlListView;

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
    GroupBox1: TGroupBox;
    lbldesdefecha: TLabel;
    lblhastafecha: TLabel;
    cbdesdefecha: TCheckBox;
    cbhastafecha: TCheckBox;
    desde_fecha: TDateTimePicker;
    hasta_fecha: TDateTimePicker;
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
    ZQPendientesdocumentoventa_id: TIntegerField;
    ZQPendientesdocumentoventa_numero: TIntegerField;
    ZQPendientesdocumentoventa_fecha: TDateField;
    ZQPendientesdocumentoventa_hora: TTimeField;
    ZQPendientesdocumentoventa_neto21: TFloatField;
    ZQPendientesdocumentoventa_iva21: TFloatField;
    ZQPendientesdocumentoventa_neto105: TFloatField;
    ZQPendientesdocumentoventa_iva105: TFloatField;
    ZQPendientesdocumentoventa_netonogravado: TFloatField;
    ZQPendientesdocumentoventa_total: TFloatField;
    ZQPendientesdocumentoventa_estado: TStringField;
    ZQPendientesdocumentoventa_pagado: TFloatField;
    ZQPendientesdocumentoventa_saldo: TFloatField;
    ZQPendientesdocumentoventa_observacion: TStringField;
    ZQPendientescliente_id: TIntegerField;
    ZQPendientespersonal_id: TIntegerField;
    ZQPendientestipodocu_id: TIntegerField;
    ZQPendientesdocumentoventa_condicionventa: TIntegerField;
    ZQPendientesdocumentoventa_fechavenc: TDateField;
    ZQPendientesdocumentoventa_listaprecio: TIntegerField;
    ZQPendientesdocumentoventa_equipo1: TStringField;
    ZQPendientesdocumentoventa_equipo2: TStringField;
    ZQPendientesdocumentoventa_formapago: TStringField;
    ZQPendientesdocumentoventa_nrodetallepago: TStringField;
    ZQPendientesdocumentoventa_solicitudcliente: TStringField;
    ZQPendientesdocumentoventa_trabajorealizado: TStringField;
    ZQPendientescaja_id: TIntegerField;
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
    ZQPendientescliente_id_1: TIntegerField;
    ZQPendientescliente_nombre: TStringField;
    ZQPendientescliente_domicilio: TStringField;
    ZQPendientescliente_documentonro: TStringField;
    ZQPendientescliente_documentotipo: TStringField;
    ZQPendientescliente_telefono: TStringField;
    ZQPendientescliente_celular: TStringField;
    ZQPendientescliente_mail: TStringField;
    ZQPendientescondicioniva_id: TIntegerField;
    ZQPendientescliente_listaprecio: TIntegerField;
    ZQPendientescliente_condicionventa: TStringField;
    ZQPendienteslocalidad_id: TIntegerField;
    ZQPendientescliente_observaciones: TStringField;
    ZQPendientespersonal_id_1: TIntegerField;
    ZQPendientescliente_diasvenc: TIntegerField;
    ZQPendientespersonal_id_2: TIntegerField;
    ZQPendientespersonal_nombre: TStringField;
    ZQPendientespersonal_domicilio: TStringField;
    ZQPendientespersonal_telefono: TStringField;
    ZQPendientespersonal_celular: TStringField;
    ZQPendientespersonal_mail: TStringField;
    ZQPendientespersonal_usuario: TStringField;
    ZQPendientespersonal_pass: TStringField;
    ZQPendientesperfil_id: TIntegerField;
    ZQPendientespersonal_id_3: TIntegerField;
    ZQPendientespersonal_nombre_1: TStringField;
    ZQPendientespersonal_domicilio_1: TStringField;
    ZQPendientespersonal_telefono_1: TStringField;
    ZQPendientespersonal_celular_1: TStringField;
    ZQPendientespersonal_mail_1: TStringField;
    ZQPendientespersonal_usuario_1: TStringField;
    ZQPendientespersonal_pass_1: TStringField;
    ZQPendientesperfil_id_1: TIntegerField;
    ZQPendientessucursal_id_1: TIntegerField;
    ZQPendientessucursal_nombre: TStringField;
    ZQPendientessucursal_domicilio: TStringField;
    ZQPendientessucursal_telefono: TStringField;
    ZQPendientesempresa_id: TIntegerField;
    ZQPendientessucursal_tipoliquidvendedor: TStringField;
    ZQPendientessucursal_tipoliquidsucursal: TStringField;
    ZQPendientescliente_id_2: TIntegerField;
    ZQPendientessucursal_tipodocumentoliquidar: TIntegerField;
    ZQPendientesdebito: TFloatField;
    ZQPendientescredito: TFloatField;
    ZQPendientesacumulado: TFloatField;
    ZQPendientesdocumento_nombre: TStringField;
    ZQPendientesdocumentoventafecha: TStringField;
    ZQPendientespuntoventanumero: TStringField;
    ZQPendientesdocumentoventanumero: TStringField;
    ZQPendientesdocumentoventa_recargo: TFloatField;
    ZQPendientesgrupo: TStringField;
    ZQPendientesacumulado_cliente: TFloatField;
    ZQPendientesdocumentoventa_descuento: TFloatField;
    ZQPendientestipodocu_importemax: TFloatField;
    ZQPendientespersonal_auxint1: TIntegerField;
    ZQPendientespersonal_auxint1_1: TIntegerField;
    ZQPendientesdocumentoventa_diasvenc: TIntegerField;
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
    clientes_ids_sin_deuda:string;
    procedure SetNotRequired;
    function GenerarWhere:string;
  public
    { Public declarations }
    procedure cargatemporal;


  end;

var
  detallectas: Tdetallectas;

implementation

uses UnitPrinc;

{$R *.dfm}


function Tdetallectas.GenerarWhere:string;
var
  where:string;
begin
    where:=' 1=1 '+Princ.empresa_where+
                           'and documentosventas.documentoventa_estado<>"ANULADA" '+
                           'and tiposdocumento.tipodocu_debcred<>"N/A" ';

    if cliente_id.codigo<>'-1' then
      where:=where+' and clientes.cliente_id="'+cliente_id.codigo+'" ';

    if personal_id.codigo<>'-1' then
      where:=where+' and clientes.personal_id="'+personal_id.codigo+'" ';

    if not strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE')) then
      where:=where+'and documentosventas.documentoventa_condicionventa=1 ';

    puntoventa_id.GenerarWhere;
    where:=where+'and '+puntoventa_id.where;

    if cbhastafecha.Checked then
      where:=where+'and documentosventas.documentoventa_fecha<="'+formatdatetime('yyyy-mm-dd',hasta_fecha.Date)+'" ';

    if cbdesdefechavenc.Checked then
      where:=where+'and documentosventas.documentoventa_fechavenc>="'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'" ';

    if cbhastafechavenc.Checked then
      where:=where+'and documentosventas.documentoventa_fechavenc<="'+formatdatetime('yyyy-mm-dd',hasta_fecha_venc.Date)+'" ';

    Result:=where;

end;



procedure Tdetallectas.SetNotRequired;
var
  i:integer;
begin
    for i := 0 to ZQPendientes.Fields.Count-1 do
      ZQPendientes.Fields.Fields[i].Required:=false;

end;


procedure Tdetallectas.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure Tdetallectas.FormCreate(Sender: TObject);
begin
    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=0;
    desde_fecha.Date:=Date-30;
    hasta_fecha.Date:=Date;
    desde_fecha_venc.Date:=desde_fecha.Date;
    hasta_fecha_venc.Date:=hasta_fecha.Date;
    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;
    Titles1.Memo.Text:='select * from puntodeventa where 1=1 '+Princ.empresa_where;
    puntoventa_id.Fill;
end;

procedure Tdetallectas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tdetallectas.FormShow(Sender: TObject);
begin
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
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

procedure Tdetallectas.cbdesdefechavencClick(Sender: TObject);
begin
    lbldesdevenc.Enabled:=cbdesdefechavenc.Checked;
    desde_fecha_venc.Enabled:=cbdesdefechavenc.Checked;
end;

procedure Tdetallectas.cbhastafechaClick(Sender: TObject);
begin
    lblhastafecha.Enabled:=cbhastafecha.Checked;
    hasta_fecha.Enabled:=cbhastafecha.Checked;
end;

procedure Tdetallectas.cbhastafechavencClick(Sender: TObject);
begin
    lblhastavenc.Enabled:=cbhastafechavenc.Checked;
    hasta_fecha_venc.Enabled:=cbhastafechavenc.Checked;
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
  acumulado_cliente:real;
  cliente_id_anterior:string;
begin
    ZQPendientes.Active:=false;
    grupo:='concat("0-",documentosventas.documentoventa_id)';
    condicion_saldoanterior:='1=2';
    if cbdesdefecha.Checked then
      begin
          grupo:=' if(documentosventas.documentoventa_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",concat("0-",documentosventas.cliente_id),concat("0-",documentosventas.documentoventa_id)) ';
          condicion_saldoanterior:='documentosventas.documentoventa_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'"';
      end;

    if cbdesdefechavenc.Checked and cbdesdefecha.Checked then
      begin
          if desde_fecha_venc.Date<desde_fecha.Date then
            begin
                grupo:=' if(documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat("0-",documentosventas.cliente_id),concat("0-",documentosventas.documentoventa_id)) ';
                condicion_saldoanterior:='documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';

            end;


      end
    else
      begin
          if cbdesdefechavenc.Checked then
            begin
                grupo:=' if(documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat("0-",documentosventas.cliente_id),concat("0-",documentosventas.documentoventa_id)) ';
                condicion_saldoanterior:='documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';
            end;
      end;

    ZQPendientes.SQL.Text:='select *, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas.documentoventa_total,0)) as debito, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentosventas.documentoventa_total,0)) as credito, '+
                           '0.00 as acumulado, '+grupo+' as grupo, '+
                           'if('+condicion_saldoanterior+',"Saldo anterior",CONCAT(tiposdocumento.tipodocu_nombreabrev," ",tiposdocumento.tipodocu_letra)) as documento_nombre, '+
                           'if('+condicion_saldoanterior+',"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",DATE_FORMAT(documentosventas.documentoventa_fecha,"%d/%m/%Y")) as documentoventafecha, '+
                           'if('+condicion_saldoanterior+',"0",puntoventa_numero) as puntoventanumero, '+
                           'if('+condicion_saldoanterior+',"0",documentosventas.documentoventa_numero) as documentoventanumero, '+
                           '0.00 as acumulado_cliente, '+
                           'DATEDIFF(documentoventa_fechavenc,curdate()) as documentoventa_diasvenc '+
                           'from documentosventas '+
//                           'left join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
//                           'left join documentoventadetalles documentoventadetalles2 on documentoventadetalles.documentoventadetalle_idorig=documentoventadetalles2.documentoventadetalle_id '+
//                           'left join documentosventas documentosventas2 on documentoventadetalles2.documentoventa_id=documentosventas2.documentoventa_id '+
                           'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                           'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                           'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                           'inner join personal on documentosventas.personal_id=personal.personal_id '+
                           'inner join personal as pesronalcliente on clientes.personal_id=pesronalcliente.personal_id '+
                           'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                           'group by grupo '+
                           'order by clientes.cliente_nombre, documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero ';


    ZQPendientes.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQPendientes.SQL.Text,GenerarWhere);

    ZQPendientes.Active:=true;
    SetNotRequired;
    acumulado:=0;
    ZQPendientes.First;
    acumulado_cliente:=0;
    cliente_id_anterior:=ZQPendientes.FieldByName('cliente_id').AsString;
    clientes_ids_sin_deuda:='-1';

    ZQPendientes.FieldByName('acumulado').ReadOnly:=false;
    while not ZQPendientes.Eof do
        begin
            acumulado:=roundto(acumulado+ZQPendientes.FieldByName('debito').AsFloat-ZQPendientes.FieldByName('credito').AsFloat,-2);

            ZQPendientes.Edit;
            ZQPendientes.FieldByName('acumulado').AsFloat:=acumulado;
            ZQPendientes.Post;

            if cliente_id_anterior<>ZQPendientes.FieldByName('cliente_id').AsString then
              begin
                  acumulado_cliente:=0;
              end;

            acumulado_cliente:=acumulado_cliente+ZQPendientes.FieldByName('debito').AsFloat-ZQPendientes.FieldByName('credito').AsFloat;

            ZQPendientes.Edit;
            ZQPendientes.FieldByName('acumulado_cliente').AsFloat:=acumulado_cliente;
            ZQPendientes.Post;

            cliente_id_anterior:=ZQPendientes.FieldByName('cliente_id').AsString;

            ZQPendientes.Next;

            if (cliente_id_anterior<>ZQPendientes.FieldByName('cliente_id').AsString) and (acumulado_cliente=0) then
              begin
                  clientes_ids_sin_deuda:=clientes_ids_sin_deuda+','+cliente_id_anterior;

              end;
        end;

end;

procedure Tdetallectas.BtnDetalleImputacionClick(Sender: TObject);
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
                        'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                        'tiposdocumento.tipodocu_tipo="Venta" and tiposdocumento.tipodocu_debcred="DEBITO" '+Princ.empresa_where+
                        ' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero ';

    if cliente_id.Text<>'Todos' then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' clientes.cliente_id="'+cliente_id.codigo+'" ');

    if cbdesdefecha.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentosventas.documentoventa_fecha>="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" ');

    if cbhastafecha.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentosventas.documentoventa_fecha<="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" ');

    if cbdesdefechavenc.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentosventas.documentoventa_fechavenc>="'+FormatDateTime('yyyy-mm-dd',desde_fecha_venc.Date)+'" ');

    if cbhastafechavenc.Checked then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentosventas.documentoventa_fechavenc<="'+FormatDateTime('yyyy-mm-dd',hasta_fecha_venc.Date)+'" ');

    puntoventa_id.GenerarWhere;
    ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,puntoventa_id.where);

    if personal_id.Text<>'Todos' then
     ZQDebitos.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQDebitos.SQL.Text,' documentosventas.personal_id="'+personal_id.codigo+'" ');

    if not strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE')) then
      ZQDebitos.SQL.Text:=ZQDebitos.SQL.Text+' and documentosventas.documentoventa_condicionventa="'+CONDICIONVENTA_CTACTE+'" ';

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
            Princ.ZQExcecSQL.Sql.Add('temporal_string3=:temporal_string3, ');
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
            Princ.ZQExcecSQL.ParamByName('temporal_string3').AsString:=ZQDebitos.FieldByName('documentoventa_equipo1').AsString;
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
                    Princ.ZQExcecSQL.Sql.Add('temporal_string3=:temporal_string3, ');
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
                    Princ.ZQExcecSQL.ParamByName('temporal_string3').AsString:=ZQDebitos.FieldByName('documentoventa_equipo1').AsString;
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

procedure Tdetallectas.btnimprimirClick(Sender: TObject);
var
  grupo, condicion_saldoanterior:string;
begin
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'detalle_de_ctasctes.rep';
    if cbdesdefecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    if cbhastafecha.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    if cbdesdefechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHAVENC').AsString:=datetostr(desde_fecha_venc.Date);
    if cbhastafechavenc.Checked then
      Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHAVENC').AsString:=datetostr(hasta_fecha_venc.Date);



    grupo:='(documentosventas.documentoventa_id)';
    condicion_saldoanterior:='1=2';
    if cbdesdefecha.Checked then
      begin
          grupo:=' if(documentosventas.documentoventa_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",concat(sucursales.sucursal_id,"-",documentosventas.cliente_id),documentosventas.documentoventa_id) ';
          condicion_saldoanterior:='documentosventas.documentoventa_fecha<"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'"';

      end;

    if cbdesdefechavenc.Checked and cbdesdefecha.Checked then
      begin
          if desde_fecha_venc.Date<desde_fecha.Date then
            begin
                grupo:=' if(documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat(concat(sucursales.sucursal_id,"-",documentosventas.cliente_id),documentosventas.documentoventa_id) ';
                condicion_saldoanterior:='documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';

            end;

      end
    else
      begin
          if cbdesdefechavenc.Checked then
            begin
                grupo:=' if(documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'",concat(concat(sucursales.sucursal_id,"-",documentosventas.cliente_id),documentosventas.documentoventa_id) ';
                condicion_saldoanterior:='documentosventas.documentoventa_fechavenc<"'+formatdatetime('yyyy-mm-dd',desde_fecha_venc.Date)+'"';
            end;
      end;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas.documentoventa_total,0)) as debito, '+
                           'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentosventas.documentoventa_total,0)) as credito, '+
                           '0.00 as acumulado, '+grupo+' as grupo, '+
                           'if('+condicion_saldoanterior+',"Saldo anterior",CONCAT(tiposdocumento.tipodocu_nombreabrev," ",tiposdocumento.tipodocu_letra)) as documento_nombre, '+
                           'if('+condicion_saldoanterior+',"'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'",DATE_FORMAT(documentosventas.documentoventa_fecha,"%d/%m/%Y")) as documentoventafecha, '+
                           'puntodeventa.puntoventa_id as puntoventanumero, '+
                           'if('+condicion_saldoanterior+',"0",documentosventas.documentoventa_numero) as documentoventanumero, '+
                           'DATEDIFF(documentoventa_fechavenc,curdate()) as documentoventa_diasvenc '+
                           'from documentosventas '+
//                           'left join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
//                           'left join documentoventadetalles documentoventadetalles2 on documentoventadetalles.documentoventadetalle_idorig=documentoventadetalles2.documentoventadetalle_id '+
//                           'left join documentosventas documentosventas2 on documentoventadetalles2.documentoventa_id=documentosventas2.documentoventa_id '+
                           'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                           'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                           'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                           'inner join personal on documentosventas.personal_id=personal.personal_id '+
                           'inner join personal as pesronalcliente on clientes.personal_id=pesronalcliente.personal_id '+
                           'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                           'group by grupo '+
                           'order by pesronalcliente.personal_nombre, sucursal_nombre, cliente_nombre, clientes.cliente_id, documentoventa_fecha, documentoventa_numero ';


    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.GTBUtilidades1.AgregarWhere(Princ.VCLReport1.Report.Datainfo.Items[0].sql,GenerarWhere);
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.GTBUtilidades1.AgregarWhere(Princ.VCLReport1.Report.Datainfo.Items[0].sql,'clientes.cliente_id not in ('+self.clientes_ids_sin_deuda+')');
    
    Princ.VCLReport1.Execute;



end;

end.
