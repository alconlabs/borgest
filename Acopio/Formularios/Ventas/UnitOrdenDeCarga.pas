unit UnitOrdenDeCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, MoneyEdit,
  GTBComboBox, GTBMemo, GBTEdit, Grids, DBGrids;

type
  TOrdendeCarga = class(TABMbase)
    Label2: TLabel;
    Label15: TLabel;
    Labelsucursal: TLabel;
    documento_numero: TEdit;
    documento_fecha: TDateTimePicker;
    puntoventa_id: TSqlComboBox;
    tipodocu_id: TSqlComboBox;
    sucursal_id: TSqlComboBox;
    Label3: TLabel;
    Label1: TLabel;
    cliente_domicilio: TLabel;
    Label11: TLabel;
    cliente_documentonro: TLabel;
    entidad_id: TSqlComboBox;
    Label5: TLabel;
    Label16: TLabel;
    documento_fechavenc: TDateTimePicker;
    Label18: TLabel;
    documento_observaciones: TGTBMemo;
    Label7: TLabel;
    documento_fechacumplimiento: TDateTimePicker;
    Label8: TLabel;
    documento_preciounitario: TMoneyEdit;
    Label9: TLabel;
    documento_moneda: TGTBComboBox;
    Label10: TLabel;
    documento_lugarentrega: TGTBEdit;
    Label13: TLabel;
    documento_tipooperacion: TGTBComboBox;
    Label14: TLabel;
    documento_condicioncalidad: TGTBComboBox;
    Label17: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    documento_total: TMoneyEdit;
    Label12: TLabel;
    documento_calidad: TSqlComboBox;
    Label4: TLabel;
    especie_id: TSqlComboBox;
    Label19: TLabel;
    documento_numerocartaporte: TEdit;
    Label20: TLabel;
    documento_kgbrutos: TMoneyEdit;
    Label21: TLabel;
    documento_tara: TMoneyEdit;
    Label23: TLabel;
    Label24: TLabel;
    ZQContratosCompras: TZQuery;
    DTSContratosCompras: TDataSource;
    DTSContratosVentas: TDataSource;
    ZQContratosVentas: TZQuery;
    DBGrid1: TDBGrid;
    BtnAsignarContratosCompras: TButton;
    ZQContratosComprasdocumento_id: TIntegerField;
    ZQContratosComprasdocumento_fecha: TDateField;
    ZQContratosComprasdocumento_fechavenc: TDateField;
    ZQContratosComprasdocumento_hora: TTimeField;
    ZQContratosComprasdocumento_numero: TIntegerField;
    ZQContratosComprasdocumento_total: TFloatField;
    ZQContratosComprasdocumento_saldo: TFloatField;
    ZQContratosComprasdocumento_pagado: TFloatField;
    ZQContratosComprasdocumento_estado: TStringField;
    ZQContratosComprasdocumento_neto21: TFloatField;
    ZQContratosComprasdocumento_iva21: TFloatField;
    ZQContratosComprasdocumento_neto105: TFloatField;
    ZQContratosComprasdocumento_iva105: TFloatField;
    ZQContratosComprasdocumento_neto27: TFloatField;
    ZQContratosComprasdocumento_iva27: TFloatField;
    ZQContratosComprasdocumento_observaciones: TStringField;
    ZQContratosComprasdocumento_ivaret: TFloatField;
    ZQContratosComprasdocumento_ivaperc: TFloatField;
    ZQContratosComprasdocumento_dgrret: TFloatField;
    ZQContratosComprasdocumento_dgrperc: TFloatField;
    ZQContratosComprasdocumento_otrosimpuestos: TFloatField;
    ZQContratosComprasdocumento_calidad: TStringField;
    ZQContratosComprasdocumento_documentacion: TStringField;
    ZQContratosComprastipodocu_id: TIntegerField;
    ZQContratosComprasentidad_id: TIntegerField;
    ZQContratosComprasentidadtransportista_id: TIntegerField;
    ZQContratosComprasespecie_id: TIntegerField;
    ZQContratosComprasdocumento_fechacumplimiento: TDateField;
    ZQContratosComprasdocumento_moneda: TStringField;
    ZQContratosComprasdocumento_preciounitario: TFloatField;
    ZQContratosComprasdocumento_lugarentrega: TStringField;
    ZQContratosComprasdocumento_tipooperacion: TStringField;
    ZQContratosComprasdocumento_condicioncalidad: TStringField;
    ZQContratosComprasdocumento_tipodestino: TStringField;
    ZQContratosComprasdocumento_numerocartaporte: TIntegerField;
    ZQContratosComprasdocumento_kgbrutos: TFloatField;
    ZQContratosComprasdocumento_tara: TFloatField;
    ZQContratosComprastipodocu_id_1: TIntegerField;
    ZQContratosComprastipodocu_nombre: TStringField;
    ZQContratosComprastipodocu_tipo: TStringField;
    ZQContratosComprastipodocu_caja: TIntegerField;
    ZQContratosComprastipodocu_stock: TIntegerField;
    ZQContratosComprastipodocu_iva: TIntegerField;
    ZQContratosComprastipodocu_fiscal: TIntegerField;
    ZQContratosComprastipodocu_ultimonumero: TIntegerField;
    ZQContratosComprastipodocu_letra: TStringField;
    ZQContratosComprastipodocu_debcred: TStringField;
    ZQContratosComprastipodocu_preimpresos: TIntegerField;
    ZQContratosComprastipodocu_impresora: TStringField;
    ZQContratosComprastipodocu_copias: TIntegerField;
    ZQContratosComprastipodocu_preview: TIntegerField;
    ZQContratosComprastipodocu_prompt: TIntegerField;
    ZQContratosComprastipodocu_ctacte: TIntegerField;
    ZQContratosComprastipodocu_archivoimpresion: TStringField;
    ZQContratosComprastipodocu_leyenda: TStringField;
    ZQContratosComprastipodocu_nombreabrev: TStringField;
    ZQContratosComprastipodocu_manual: TIntegerField;
    ZQContratosCompraspuntoventa_id: TIntegerField;
    ZQContratosComprastipodocu_tipoctacte: TStringField;
    ZQContratosCompraspuntoventa_id_1: TIntegerField;
    ZQContratosCompraspuntoventa_numero: TIntegerField;
    ZQContratosCompraspuntoventa_descripcion: TStringField;
    ZQContratosCompraspuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQContratosCompraspuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQContratosComprassucursal_id: TIntegerField;
    ZQContratosComprasdocumentodocu_id: TIntegerField;
    ZQContratosComprasdocumentodocu_importe: TFloatField;
    ZQContratosComprasdocumentodocu_estado: TStringField;
    ZQContratosComprasdocumentodocu_pagado: TFloatField;
    ZQContratosComprasdocumentodocu_saldo: TFloatField;
    ZQContratosComprasdocumento_id_1: TIntegerField;
    ZQContratosComprasdocumento_idpago: TIntegerField;
    ZQContratosVentasdocumento_id: TIntegerField;
    ZQContratosVentasdocumento_fecha: TDateField;
    ZQContratosVentasdocumento_fechavenc: TDateField;
    ZQContratosVentasdocumento_hora: TTimeField;
    ZQContratosVentasdocumento_numero: TIntegerField;
    ZQContratosVentasdocumento_total: TFloatField;
    ZQContratosVentasdocumento_saldo: TFloatField;
    ZQContratosVentasdocumento_pagado: TFloatField;
    ZQContratosVentasdocumento_estado: TStringField;
    ZQContratosVentasdocumento_neto21: TFloatField;
    ZQContratosVentasdocumento_iva21: TFloatField;
    ZQContratosVentasdocumento_neto105: TFloatField;
    ZQContratosVentasdocumento_iva105: TFloatField;
    ZQContratosVentasdocumento_neto27: TFloatField;
    ZQContratosVentasdocumento_iva27: TFloatField;
    ZQContratosVentasdocumento_observaciones: TStringField;
    ZQContratosVentasdocumento_ivaret: TFloatField;
    ZQContratosVentasdocumento_ivaperc: TFloatField;
    ZQContratosVentasdocumento_dgrret: TFloatField;
    ZQContratosVentasdocumento_dgrperc: TFloatField;
    ZQContratosVentasdocumento_otrosimpuestos: TFloatField;
    ZQContratosVentasdocumento_calidad: TStringField;
    ZQContratosVentasdocumento_documentacion: TStringField;
    ZQContratosVentastipodocu_id: TIntegerField;
    ZQContratosVentasentidad_id: TIntegerField;
    ZQContratosVentasentidadtransportista_id: TIntegerField;
    ZQContratosVentasespecie_id: TIntegerField;
    ZQContratosVentasdocumento_fechacumplimiento: TDateField;
    ZQContratosVentasdocumento_moneda: TStringField;
    ZQContratosVentasdocumento_preciounitario: TFloatField;
    ZQContratosVentasdocumento_lugarentrega: TStringField;
    ZQContratosVentasdocumento_tipooperacion: TStringField;
    ZQContratosVentasdocumento_condicioncalidad: TStringField;
    ZQContratosVentasdocumento_tipodestino: TStringField;
    ZQContratosVentasdocumento_numerocartaporte: TIntegerField;
    ZQContratosVentasdocumento_kgbrutos: TFloatField;
    ZQContratosVentasdocumento_tara: TFloatField;
    ZQContratosVentastipodocu_id_1: TIntegerField;
    ZQContratosVentastipodocu_nombre: TStringField;
    ZQContratosVentastipodocu_tipo: TStringField;
    ZQContratosVentastipodocu_caja: TIntegerField;
    ZQContratosVentastipodocu_stock: TIntegerField;
    ZQContratosVentastipodocu_iva: TIntegerField;
    ZQContratosVentastipodocu_fiscal: TIntegerField;
    ZQContratosVentastipodocu_ultimonumero: TIntegerField;
    ZQContratosVentastipodocu_letra: TStringField;
    ZQContratosVentastipodocu_debcred: TStringField;
    ZQContratosVentastipodocu_preimpresos: TIntegerField;
    ZQContratosVentastipodocu_impresora: TStringField;
    ZQContratosVentastipodocu_copias: TIntegerField;
    ZQContratosVentastipodocu_preview: TIntegerField;
    ZQContratosVentastipodocu_prompt: TIntegerField;
    ZQContratosVentastipodocu_ctacte: TIntegerField;
    ZQContratosVentastipodocu_archivoimpresion: TStringField;
    ZQContratosVentastipodocu_leyenda: TStringField;
    ZQContratosVentastipodocu_nombreabrev: TStringField;
    ZQContratosVentastipodocu_manual: TIntegerField;
    ZQContratosVentaspuntoventa_id: TIntegerField;
    ZQContratosVentastipodocu_tipoctacte: TStringField;
    ZQContratosVentaspuntoventa_id_1: TIntegerField;
    ZQContratosVentaspuntoventa_numero: TIntegerField;
    ZQContratosVentaspuntoventa_descripcion: TStringField;
    ZQContratosVentaspuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQContratosVentaspuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQContratosVentassucursal_id: TIntegerField;
    ZQContratosVentasdocumentodocu_id: TIntegerField;
    ZQContratosVentasdocumentodocu_importe: TFloatField;
    ZQContratosVentasdocumentodocu_estado: TStringField;
    ZQContratosVentasdocumentodocu_pagado: TFloatField;
    ZQContratosVentasdocumentodocu_saldo: TFloatField;
    ZQContratosVentasdocumento_id_1: TIntegerField;
    ZQContratosVentasdocumento_idpago: TIntegerField;
    DBGrid2: TDBGrid;
    BtnAsignarContratosVentas: TButton;
    ZQContratosAnterior: TZQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    TimeField1: TTimeField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField2: TStringField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    DateField3: TDateField;
    StringField5: TStringField;
    FloatField15: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField7: TIntegerField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    IntegerField8: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    StringField12: TStringField;
    StringField13: TStringField;
    IntegerField14: TIntegerField;
    StringField14: TStringField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    StringField18: TStringField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    StringField19: TStringField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    FloatField18: TFloatField;
    StringField20: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    TabSheet4: TTabSheet;
    Label22: TLabel;
    entidadtransportista_id: TSqlComboBox;
    Label25: TLabel;
    documento_chofer: TEdit;
    Label26: TLabel;
    entidaddadorcarga_id: TSqlComboBox;
    Label27: TLabel;
    documento_transpchasis: TEdit;
    Label28: TLabel;
    documento_transpacoplado: TEdit;
    Label29: TLabel;
    documento_transpanticipo: TMoneyEdit;
    Label30: TLabel;
    documento_cartaportetarifaflete: TMoneyEdit;
    Label31: TLabel;
    documento_transptarifaflete: TMoneyEdit;
    Label32: TLabel;
    documento_chofercuit: TEdit;
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure sucursal_idSelect(Sender: TObject);
    procedure puntoventa_idSelect(Sender: TObject);
    procedure tipodocu_idSelect(Sender: TObject);
    procedure documento_kgbrutosExit(Sender: TObject);
    procedure BtnAsignarContratosComprasClick(Sender: TObject);
    procedure BtnAsignarContratosVentasClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure anular;
    procedure imprimir;
  public
    { Public declarations }
    tipodocu_nombre:string;
  end;

var
  OrdendeCarga: TOrdendeCarga;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TOrdendeCarga.agregar;
begin
    id:=Princ.codigo('documentos','documento_id');

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin ');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into documentos set ');
    ZQExecSQL.Sql.Add('entidadtransportista_id=:entidadtransportista_id, ');
    ZQExecSQL.Sql.Add('entidad_id=:entidad_id, ');
    ZQExecSQL.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQExecSQL.Sql.Add('documento_documentacion=:documento_documentacion, ');
    ZQExecSQL.Sql.Add('documento_calidad=:documento_calidad, ');
    ZQExecSQL.Sql.Add('documento_observaciones=:documento_observaciones, ');
    ZQExecSQL.Sql.Add('documento_estado=:documento_estado, ');
    ZQExecSQL.Sql.Add('documento_pagado=:documento_pagado, ');
    ZQExecSQL.Sql.Add('documento_saldo=:documento_saldo, ');
    ZQExecSQL.Sql.Add('documento_total=:documento_total, ');
    ZQExecSQL.Sql.Add('documento_numero=:documento_numero, ');
    ZQExecSQL.Sql.Add('documento_hora=:documento_hora, ');
    ZQExecSQL.Sql.Add('documento_fechavenc=:documento_fechavenc, ');
    ZQExecSQL.Sql.Add('documento_fecha=:documento_fecha, ');
    ZQExecSQL.Sql.Add('documento_fechacumplimiento=:documento_fechacumplimiento, ');
    ZQExecSQL.Sql.Add('documento_preciounitario=:documento_preciounitario, ');
    ZQExecSQL.Sql.Add('documento_moneda=:documento_moneda, ');
    ZQExecSQL.Sql.Add('documento_lugarentrega=:documento_lugarentrega, ');
    ZQExecSQL.Sql.Add('documento_condicioncalidad=:documento_condicioncalidad, ');
    ZQExecSQL.Sql.Add('documento_tipodestino=:documento_tipodestino, ');
    ZQExecSQL.Sql.Add('documento_numerocartaporte=:documento_numerocartaporte, ');
    ZQExecSQL.Sql.Add('documento_kgbrutos=:documento_kgbrutos, ');
    ZQExecSQL.Sql.Add('documento_tara=:documento_tara, ');
    ZQExecSQL.Sql.Add('especie_id=:especie_id, ');
    ZQExecSQL.Sql.Add('documento_tipooperacion=:documento_tipooperacion, ');
    ZQExecSQL.Sql.Add('entidaddadorcarga_id=:entidaddadorcarga_id, ');
    ZQExecSQL.Sql.Add('documento_chofer=:documento_chofer, ');
    ZQExecSQL.Sql.Add('documento_chofercuit=:documento_chofercuit, ');
    ZQExecSQL.Sql.Add('documento_transpchasis=:documento_transpchasis, ');
    ZQExecSQL.Sql.Add('documento_transpacoplado=:documento_transpacoplado, ');
    ZQExecSQL.Sql.Add('documento_transptarifaflete=:documento_transptarifaflete, ');
    ZQExecSQL.Sql.Add('documento_transpanticipo=:documento_transpanticipo, ');
    ZQExecSQL.Sql.Add('documento_cartaportetarifaflete=:documento_cartaportetarifaflete, ');
    ZQExecSQL.Sql.Add('documento_id=:documento_id ');
    ZQExecSQL.ParamByName('entidadtransportista_id').AsString:=entidadtransportista_id.codigo;
    ZQExecSQL.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSQL.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSQL.ParamByName('documento_documentacion').AsString:='';
    ZQExecSQL.ParamByName('documento_calidad').AsString:=documento_calidad.Text;
    ZQExecSQL.ParamByName('documento_observaciones').AsString:=documento_observaciones.Text;
    ZQExecSQL.ParamByName('documento_estado').AsString:='PAGADA';
    ZQExecSQL.ParamByName('documento_saldo').AsString:='0';
    ZQExecSQL.ParamByName('documento_pagado').AsString:=documento_total.Text;
    ZQExecSQL.ParamByName('documento_total').AsString:=documento_total.Text;
    ZQExecSQL.ParamByName('documento_numero').AsString:=documento_numero.Text;
    ZQExecSQL.ParamByName('documento_hora').AsString:=timetostr(time);
    ZQExecSQL.ParamByName('documento_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documento_fechavenc.Date);
    ZQExecSQL.ParamByName('documento_fecha').AsString:=formatdatetime('yyyy-mm-dd',documento_fecha.Date);
    ZQExecSQL.ParamByName('documento_fechacumplimiento').AsString:=formatdatetime('yyyy-mm-dd',documento_fechacumplimiento.Date);
    ZQExecSQL.ParamByName('documento_preciounitario').AsString:=documento_preciounitario.Text;
    ZQExecSQL.ParamByName('documento_moneda').AsString:=documento_moneda.Text;
    ZQExecSQL.ParamByName('documento_lugarentrega').AsString:=documento_lugarentrega.Text;
    ZQExecSQL.ParamByName('documento_condicioncalidad').AsString:=documento_condicioncalidad.Text;
    ZQExecSQL.ParamByName('documento_tipodestino').AsString:='';
    ZQExecSQL.ParamByName('documento_numerocartaporte').AsString:=documento_numerocartaporte.Text;
    ZQExecSQL.ParamByName('documento_kgbrutos').AsString:=documento_kgbrutos.Text;
    ZQExecSQL.ParamByName('documento_tara').AsString:=documento_tara.Text;
    ZQExecSQL.ParamByName('especie_id').AsString:=especie_id.codigo;
    ZQExecSQL.ParamByName('entidaddadorcarga_id').AsString:=entidaddadorcarga_id.codigo;
    ZQExecSQL.ParamByName('documento_chofer').AsString:=documento_chofer.Text;
    ZQExecSQL.ParamByName('documento_chofercuit').AsString:=documento_chofercuit.Text;
    ZQExecSQL.ParamByName('documento_transpchasis').AsString:=documento_transpchasis.Text;
    ZQExecSQL.ParamByName('documento_transpacoplado').AsString:=documento_transpacoplado.Text;
    ZQExecSQL.ParamByName('documento_transptarifaflete').AsString:=documento_transptarifaflete.Text;
    ZQExecSQL.ParamByName('documento_transpanticipo').AsString:=documento_transpanticipo.Text;
    ZQExecSQL.ParamByName('documento_cartaportetarifaflete').AsString:=documento_cartaportetarifaflete.Text;
    ZQExecSQL.ParamByName('documento_tipooperacion').AsString:=documento_tipooperacion.Text;
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;


    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo,documento_numero.Text);


    ZQContratosCompras.First;
    while not ZQContratosCompras.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into documentosdocu set ');
            ZQExecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
            ZQExecSQL.Sql.Add('documento_id=:documento_id, ');
            ZQExecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
            ZQExecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
            ZQExecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
            ZQExecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
            ZQExecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
            ZQExecSQL.ParamByName('documento_idpago').AsString:=ZQContratosCompras.FieldByName('documento_idpago').AsString;
            ZQExecSQL.ParamByName('documento_id').AsString:=id;
            ZQExecSQL.ParamByName('documentodocu_saldo').AsString:=ZQContratosCompras.FieldByName('documentodocu_saldo').AsString;
            ZQExecSQL.ParamByName('documentodocu_pagado').AsString:=ZQContratosCompras.FieldByName('documentodocu_pagado').AsString;
            ZQExecSQL.ParamByName('documentodocu_estado').AsString:=ZQContratosCompras.FieldByName('documentodocu_estado').AsString;
            ZQExecSQL.ParamByName('documentodocu_importe').AsString:=ZQContratosCompras.FieldByName('documentodocu_importe').AsString;
            ZQExecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
            ZQExecSQL.ExecSql;

            Princ.ActualizarSaldoDocumento(ZQContratosCompras.FieldByName('documento_idpago').AsString,ZQContratosCompras.FieldByName('documentodocu_importe').AsFloat);

            ZQContratosCompras.Next;
        end;

    ZQContratosVentas.First;
    while not ZQContratosVentas.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into documentosdocu set ');
            ZQExecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
            ZQExecSQL.Sql.Add('documento_id=:documento_id, ');
            ZQExecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
            ZQExecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
            ZQExecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
            ZQExecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
            ZQExecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
            ZQExecSQL.ParamByName('documento_idpago').AsString:=ZQContratosVentas.FieldByName('documento_idpago').AsString;
            ZQExecSQL.ParamByName('documento_id').AsString:=id;
            ZQExecSQL.ParamByName('documentodocu_saldo').AsString:=ZQContratosVentas.FieldByName('documentodocu_saldo').AsString;
            ZQExecSQL.ParamByName('documentodocu_pagado').AsString:=ZQContratosVentas.FieldByName('documentodocu_pagado').AsString;
            ZQExecSQL.ParamByName('documentodocu_estado').AsString:=ZQContratosVentas.FieldByName('documentodocu_estado').AsString;
            ZQExecSQL.ParamByName('documentodocu_importe').AsString:=ZQContratosVentas.FieldByName('documentodocu_importe').AsString;
            ZQExecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
            ZQExecSQL.ExecSql;

            Princ.ActualizarSaldoDocumento(ZQContratosVentas.FieldByName('documento_idpago').AsString,ZQContratosVentas.FieldByName('documentodocu_importe').AsFloat);

            ZQContratosVentas.Next;
        end;



    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit ');
    ZQExecSQL.ExecSQL;


    MessageDlg('Datos guardados correctamente', mtInformation, [mbOK], 0);
    self.Close;
end;


procedure TOrdendeCarga.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin ');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update documentos set ');
    ZQExecSQL.Sql.Add('entidad_id=:entidad_id, ');
    ZQExecSQL.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQExecSQL.Sql.Add('documento_documentacion=:documento_documentacion, ');
    ZQExecSQL.Sql.Add('documento_calidad=:documento_calidad, ');
    ZQExecSQL.Sql.Add('documento_observaciones=:documento_observaciones, ');
    ZQExecSQL.Sql.Add('documento_estado=:documento_estado, ');
    ZQExecSQL.Sql.Add('documento_pagado=:documento_pagado, ');
    ZQExecSQL.Sql.Add('documento_saldo=:documento_saldo, ');
    ZQExecSQL.Sql.Add('documento_total=:documento_total, ');
    ZQExecSQL.Sql.Add('documento_numero=:documento_numero, ');
    ZQExecSQL.Sql.Add('documento_hora=:documento_hora, ');
    ZQExecSQL.Sql.Add('documento_fechavenc=:documento_fechavenc, ');
    ZQExecSQL.Sql.Add('documento_condicioncalidad=:documento_condicioncalidad, ');
    ZQExecSQL.Sql.Add('documento_tipodestino=:documento_tipodestino, ');
    ZQExecSQL.Sql.Add('documento_numerocartaporte=:documento_numerocartaporte, ');
    ZQExecSQL.Sql.Add('documento_kgbrutos=:documento_kgbrutos, ');
    ZQExecSQL.Sql.Add('documento_tara=:documento_tara, ');
    ZQExecSQL.Sql.Add('especie_id=:especie_id, ');
    ZQExecSQL.Sql.Add('documento_tipooperacion=:documento_tipooperacion, ');
    ZQExecSQL.Sql.Add('documento_fecha=:documento_fecha, ');
    ZQExecSQL.Sql.Add('documento_preciounitario=:documento_preciounitario, ');
    ZQExecSQL.Sql.Add('documento_moneda=:documento_moneda, ');
    ZQExecSQL.Sql.Add('documento_lugarentrega=:documento_lugarentrega, ');
    ZQExecSQL.Sql.Add('entidadtransportista_id=:entidadtransportista_id, ');
    ZQExecSQL.Sql.Add('entidaddadorcarga_id=:entidaddadorcarga_id, ');
    ZQExecSQL.Sql.Add('documento_chofer=:documento_chofer, ');
    ZQExecSQL.Sql.Add('documento_chofercuit=:documento_chofercuit, ');
    ZQExecSQL.Sql.Add('documento_transpchasis=:documento_transpchasis, ');
    ZQExecSQL.Sql.Add('documento_transpacoplado=:documento_transpacoplado, ');
    ZQExecSQL.Sql.Add('documento_transptarifaflete=:documento_transptarifaflete, ');
    ZQExecSQL.Sql.Add('documento_transpanticipo=:documento_transpanticipo, ');
    ZQExecSQL.Sql.Add('documento_cartaportetarifaflete=:documento_cartaportetarifaflete, ');
    ZQExecSQL.Sql.Add('documento_fechacumplimiento=:documento_fechacumplimiento ');
    ZQExecSQL.Sql.Add('where documento_id=:documento_id ');
    ZQExecSQL.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSQL.ParamByName('entidadtransportista_id').AsString:=entidadtransportista_id.codigo;
    ZQExecSQL.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSQL.ParamByName('documento_documentacion').AsString:='';
    ZQExecSQL.ParamByName('documento_calidad').AsString:=documento_calidad.Text;
    ZQExecSQL.ParamByName('documento_observaciones').AsString:=documento_observaciones.Text;
    ZQExecSQL.ParamByName('documento_estado').AsString:='PAGADA';
    ZQExecSQL.ParamByName('documento_saldo').AsString:='0';
    ZQExecSQL.ParamByName('documento_pagado').AsString:=documento_total.Text;
    ZQExecSQL.ParamByName('documento_total').AsString:=documento_total.Text;
    ZQExecSQL.ParamByName('documento_numero').AsString:=documento_numero.Text;
    ZQExecSQL.ParamByName('documento_hora').AsString:=timetostr(time);
    ZQExecSQL.ParamByName('documento_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documento_fechavenc.Date);
    ZQExecSQL.ParamByName('documento_fecha').AsString:=formatdatetime('yyyy-mm-dd',documento_fecha.Date);
    ZQExecSQL.ParamByName('documento_fechacumplimiento').AsString:=formatdatetime('yyyy-mm-dd',documento_fechacumplimiento.Date);
    ZQExecSQL.ParamByName('documento_preciounitario').AsString:=documento_preciounitario.Text;
    ZQExecSQL.ParamByName('documento_moneda').AsString:=documento_moneda.Text;
    ZQExecSQL.ParamByName('documento_lugarentrega').AsString:=documento_lugarentrega.Text;
    ZQExecSQL.ParamByName('documento_condicioncalidad').AsString:=documento_condicioncalidad.Text;
    ZQExecSQL.ParamByName('documento_tipodestino').AsString:='';
    ZQExecSQL.ParamByName('documento_numerocartaporte').AsString:=documento_numerocartaporte.Text;
    ZQExecSQL.ParamByName('documento_kgbrutos').AsString:=documento_kgbrutos.Text;
    ZQExecSQL.ParamByName('documento_tara').AsString:=documento_tara.Text;
    ZQExecSQL.ParamByName('especie_id').AsString:=especie_id.codigo;
    ZQExecSQL.ParamByName('documento_tipooperacion').AsString:=documento_tipooperacion.Text;
    ZQExecSQL.ParamByName('entidaddadorcarga_id').AsString:=entidaddadorcarga_id.codigo;
    ZQExecSQL.ParamByName('documento_chofer').AsString:=documento_chofer.Text;
    ZQExecSQL.ParamByName('documento_chofercuit').AsString:=documento_chofercuit.Text;
    ZQExecSQL.ParamByName('documento_transpchasis').AsString:=documento_transpchasis.Text;
    ZQExecSQL.ParamByName('documento_transpacoplado').AsString:=documento_transpacoplado.Text;
    ZQExecSQL.ParamByName('documento_transptarifaflete').AsString:=documento_transptarifaflete.Text;
    ZQExecSQL.ParamByName('documento_transpanticipo').AsString:=documento_transpanticipo.Text;
    ZQExecSQL.ParamByName('documento_cartaportetarifaflete').AsString:=documento_cartaportetarifaflete.Text;
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;


     ZQContratosAnterior.Active:=false;
     ZQContratosAnterior.ParamByName('documento_id').AsString:=id;
     ZQContratosAnterior.Active:=true;
     ZQContratosAnterior.First;
     while not ZQContratosAnterior.Eof do
         begin
             Princ.ActualizarSaldoDocumento(ZQContratosAnterior.FieldByName('documento_idpago').AsString,ZQContratosAnterior.FieldByName('documentodocu_importe').AsFloat, True);

             ZQContratosAnterior.Next;
         end;

     ZQExecSql.SQL.Clear;
     ZQExecSql.SQL.Add('delete from documentosdocu ');
     ZQExecSql.SQL.Add('where documento_id=:documento_id');
     ZQExecSql.ParamByName('documento_id').AsString:=id;
     ZQExecSql.ExecSQL;


    ZQContratosCompras.First;
    while not ZQContratosCompras.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into documentosdocu set ');
            ZQExecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
            ZQExecSQL.Sql.Add('documento_id=:documento_id, ');
            ZQExecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
            ZQExecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
            ZQExecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
            ZQExecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
            ZQExecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
            ZQExecSQL.ParamByName('documento_idpago').AsString:=ZQContratosCompras.FieldByName('documento_idpago').AsString;
            ZQExecSQL.ParamByName('documento_id').AsString:=id;
            ZQExecSQL.ParamByName('documentodocu_saldo').AsString:=ZQContratosCompras.FieldByName('documentodocu_saldo').AsString;
            ZQExecSQL.ParamByName('documentodocu_pagado').AsString:=ZQContratosCompras.FieldByName('documentodocu_pagado').AsString;
            ZQExecSQL.ParamByName('documentodocu_estado').AsString:=ZQContratosCompras.FieldByName('documentodocu_estado').AsString;
            ZQExecSQL.ParamByName('documentodocu_importe').AsString:=ZQContratosCompras.FieldByName('documentodocu_importe').AsString;
            ZQExecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
            ZQExecSQL.ExecSql;

            Princ.ActualizarSaldoDocumento(ZQContratosCompras.FieldByName('documento_idpago').AsString,ZQContratosCompras.FieldByName('documentodocu_importe').AsFloat);

            ZQContratosCompras.Next;
        end;

    ZQContratosVentas.First;
    while not ZQContratosVentas.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into documentosdocu set ');
            ZQExecSQL.Sql.Add('documento_idpago=:documento_idpago, ');
            ZQExecSQL.Sql.Add('documento_id=:documento_id, ');
            ZQExecSQL.Sql.Add('documentodocu_saldo=:documentodocu_saldo, ');
            ZQExecSQL.Sql.Add('documentodocu_pagado=:documentodocu_pagado, ');
            ZQExecSQL.Sql.Add('documentodocu_estado=:documentodocu_estado, ');
            ZQExecSQL.Sql.Add('documentodocu_importe=:documentodocu_importe, ');
            ZQExecSQL.Sql.Add('documentodocu_id=:documentodocu_id ');
            ZQExecSQL.ParamByName('documento_idpago').AsString:=ZQContratosVentas.FieldByName('documento_idpago').AsString;
            ZQExecSQL.ParamByName('documento_id').AsString:=id;
            ZQExecSQL.ParamByName('documentodocu_saldo').AsString:=ZQContratosVentas.FieldByName('documentodocu_saldo').AsString;
            ZQExecSQL.ParamByName('documentodocu_pagado').AsString:=ZQContratosVentas.FieldByName('documentodocu_pagado').AsString;
            ZQExecSQL.ParamByName('documentodocu_estado').AsString:=ZQContratosVentas.FieldByName('documentodocu_estado').AsString;
            ZQExecSQL.ParamByName('documentodocu_importe').AsString:=ZQContratosVentas.FieldByName('documentodocu_importe').AsString;
            ZQExecSQL.ParamByName('documentodocu_id').AsString:=Princ.codigo('documentosdocu','documentodocu_id');
            ZQExecSQL.ExecSql;

            Princ.ActualizarSaldoDocumento(ZQContratosVentas.FieldByName('documento_idpago').AsString,ZQContratosVentas.FieldByName('documentodocu_importe').AsFloat);

            ZQContratosVentas.Next;
        end;


    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit ');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente', mtInformation, [mbOK], 0);
    self.Close;
end;


procedure TOrdendeCarga.puntoventa_idSelect(Sender: TObject);
begin
  inherited;
    documento_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;

     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     if tipodocu_id.ItemIndex>-1 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TOrdendeCarga.sucursal_idSelect(Sender: TObject);
begin
  inherited;
    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';
    puntoventa_id.llenarcombo;
    try
       puntoventa_id.ItemIndex:=0;
     except
       puntoventa_id.ItemIndex:=-1;
     end;

    puntoventa_id.OnSelect(self);
end;

procedure TOrdendeCarga.tipodocu_idSelect(Sender: TObject);
begin
  inherited;
    documento_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TOrdendeCarga.imprimir;
begin

end;

procedure TOrdendeCarga.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    sucursal_id.llenarcombo;

    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" order by puntoventa_numero';

    puntoventa_id.llenarcombo;
    try
      puntoventa_id.ItemIndex:=0;
    except
      puntoventa_id.ItemIndex:=-1;
    end;


    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'" '+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;
     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     documento_numero.Text:='';
     if tipodocu_id.ItemIndex=0 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');


    documento_fecha.Date:=date;

    if abm=1 then
      begin
          documento_fecha.Date:=date;
          documento_fechavenc.Date:=Date+30;
          documento_fechacumplimiento.date:=Date+30;
          entidad_id.ItemIndex:=-1;
          especie_id.ItemIndex:=-1;
          documento_total.Text:='0';
          documento_observaciones.Text:='';
          documento_calidad.ItemIndex:=1;
          documento_preciounitario.Text:='0';
          documento_moneda.ItemIndex:=-1;
          documento_lugarentrega.Text:='PUERTO DE ROSARIO';
          documento_observaciones.Text:='';
          entidaddadorcarga_id.ItemIndex:=-1;
          documento_chofer.Text:='';
          documento_chofercuit.Text:='';
          documento_transpchasis.Text:='';
          documento_transpacoplado.Text:='';
          documento_transptarifaflete.Value:=0;
          documento_transpanticipo.Value:=0;
          documento_cartaportetarifaflete.Value:=0;
      end
    else
      begin
          documento_fecha.Date:=ZQSelect.FieldByName('documento_fecha').AsDateTime;
          documento_fechavenc.Date:=ZQSelect.FieldByName('documento_fechavenc').AsDateTime;
          documento_fechacumplimiento.Date:=ZQSelect.FieldByName('documento_fechacumplimiento').AsDateTime;
          sucursal_id.Buscar(ZQSelect.FieldByName('sucursal_id').AsString);
          sucursal_id.OnSelect(self);
          puntoventa_id.Buscar(ZQSelect.FieldByName('puntoventa_id').AsString);
          puntoventa_id.OnSelect(self);
          entidad_id.Buscar(ZQSelect.FieldByName('entidad_id').AsString);
          tipodocu_id.buscar(ZQSelect.FieldByName('tipodocu_id').AsString);
          tipodocu_id.OnSelect(self);
          documento_numero.Text:=ZQSelect.FieldByName('documento_numero').AsString;

          documento_total.Text:=ZQSelect.FieldByName('documento_total').AsString;
          documento_observaciones.Text:=ZQSelect.FieldByName('documento_observaciones').AsString;

          documento_calidad.Buscar(ZQSelect.FieldByName('documento_calidad').AsString,true);
          documento_preciounitario.Text:=ZQSelect.FieldByName('documento_preciounitario').AsString;
          especie_id.Buscar(ZQSelect.FieldByName('especie_id').AsString);
          documento_moneda.Text:=ZQSelect.FieldByName('documento_moneda').AsString;
          documento_lugarentrega.Text:=ZQSelect.FieldByName('documento_lugarentrega').AsString;

          documento_tipooperacion.Text:=ZQSelect.FieldByName('documento_tipooperacion').AsString;
          documento_condicioncalidad.Text:=ZQSelect.FieldByName('documento_condicioncalidad').AsString;

          documento_numerocartaporte.Text:=ZQSelect.FieldByName('documento_numerocartaporte').AsString;
          documento_kgbrutos.Text:=ZQSelect.FieldByName('documento_kgbrutos').AsString;
          documento_tara.Text:=ZQSelect.FieldByName('documento_tara').AsString;
          entidadtransportista_id.Buscar(ZQSelect.FieldByName('entidadtransportista_id').AsString);

          entidaddadorcarga_id.Buscar(ZQSelect.FieldByName('entidaddadorcarga_id').AsString);
          documento_chofer.Text:=ZQSelect.FieldByName('documento_chofer').AsString;
          documento_chofercuit.Text:=ZQSelect.FieldByName('documento_chofercuit').AsString;
          documento_transpchasis.Text:=ZQSelect.FieldByName('documento_transpchasis').AsString;
          documento_transpacoplado.Text:=ZQSelect.FieldByName('documento_transpacoplado').AsString;
          documento_transptarifaflete.Text:=ZQSelect.FieldByName('documento_transptarifaflete').AsString;
          documento_transpanticipo.Text:=ZQSelect.FieldByName('documento_transpanticipo').AsString;
          documento_cartaportetarifaflete.Text:=ZQSelect.FieldByName('documento_cartaportetarifaflete').AsString;

      end;


    ZQContratosCompras.Active:=false;
    ZQContratosCompras.ParamByName('documento_id').AsString:=id;
    ZQContratosCompras.Active:=true;

    ZQContratosVentas.Active:=false;
    ZQContratosVentas.ParamByName('documento_id').AsString:=id;
    ZQContratosVentas.Active:=true;

end;

procedure TOrdendeCarga.eliminar;
begin

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin ');
    ZQExecSQL.ExecSQL;

    ZQContratosAnterior.Active:=false;
     ZQContratosAnterior.ParamByName('documento_id').AsString:=id;
     ZQContratosAnterior.Active:=true;
     ZQContratosAnterior.First;
     while not ZQContratosAnterior.Eof do
         begin
             Princ.ActualizarSaldoDocumento(ZQContratosAnterior.FieldByName('documento_idpago').AsString,ZQContratosAnterior.FieldByName('documentodocu_importe').AsFloat, True);

             ZQContratosAnterior.Next;
         end;

     ZQExecSql.SQL.Clear;
     ZQExecSql.SQL.Add('delete from documentosdocu ');
     ZQExecSql.SQL.Add('where documento_id=:documento_id');
     ZQExecSql.ParamByName('documento_id').AsString:=id;
     ZQExecSql.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from documentos ');
    ZQExecSQL.Sql.Add('where documento_id=:documento_id ');
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;


    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit ');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos eliminados.', mtInformation, [mbOK], 0);
    self.Close;
end;


procedure TOrdendeCarga.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';

    

    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=-1;

    entidadtransportista_id.llenarcombo;
    entidadtransportista_id.ItemIndex:=-1;

    documento_calidad.llenarcombo;

    especie_id.llenarcombo;

    entidaddadorcarga_id.llenarcombo;
    entidadtransportista_id.ItemIndex:=-1;
end;

procedure TOrdendeCarga.FormShow(Sender: TObject);
begin
  inherited;
    if abm=1 then
      id:='';


    ZQSelect.Active:=false;
    ZQSelect.ParamByName('documento_id').AsString:=id;
    ZQSelect.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;
end;

procedure TOrdendeCarga.anular;
begin

end;

procedure TOrdendeCarga.BtnAsignarContratosComprasClick(Sender: TObject);
begin
  inherited;
    princ.CargarDocumentoDocu(entidad_id.codigo,ZQContratosCompras,documento_total.Value,False,especie_id.codigo,'Contrato de Compra');
end;

function TOrdendeCarga.control:boolean;
var
  error:integer;
begin
    error:=0;


    if error=0 then
      result:=true
    else
      result:=false;

end;



procedure TOrdendeCarga.documento_kgbrutosExit(Sender: TObject);
begin
  inherited;
    documento_total.Value:=documento_kgbrutos.Value-documento_tara.Value;
end;

procedure TOrdendeCarga.btnguardarClick(Sender: TObject);
begin
  inherited;
       case abm of
        1:begin
              if control then
                agregar;

          end;

        2:begin
              if control then
                modificar;

          end;

        3:begin
              if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;

        5:begin
              if (MessageDlg('Seguro desea anular esta Factura?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                anular;
          end;


    end;
end;

procedure TOrdendeCarga.BtnAsignarContratosVentasClick(Sender: TObject);
begin
  inherited;
    princ.CargarDocumentoDocu(entidad_id.codigo,ZQContratosVentas,documento_total.Value,False,especie_id.codigo, 'Contrato de Venta');
end;

end.
