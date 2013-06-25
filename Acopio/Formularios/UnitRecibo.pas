unit UnitRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDocumentoBase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, UnitSqlComboBox, ComCtrls, ExtCtrls,
  AdvPanel, Grids, DBGrids, Math;

type
  TRecibo = class(TDocumentoBase)
    DTSDocumentopagos: TDataSource;
    DBGrid1: TDBGrid;
    btnmodificarpago: TButton;
    btnagregarpago: TButton;
    btneliminarpago: TButton;
    ZQDocumentopagosdocumentopago_id: TIntegerField;
    ZQDocumentopagosdocumentopago_importe: TFloatField;
    ZQDocumentopagosdocumentopago_nombre: TStringField;
    ZQDocumentopagostipopago_id: TIntegerField;
    ZQDocumentopagosdocumento_id: TIntegerField;
    ZQDocumentopagostipopago_id_1: TIntegerField;
    ZQDocumentopagostipopago_nombre: TStringField;
    ZQDocumentopagostipopago_caja: TIntegerField;
    DBGrid2: TDBGrid;
    btnagregar: TButton;
    btnquitar: TButton;
    btntomardocumentosAuto: TButton;
    Label13: TLabel;
    documento_totalimputado: TMoneyEdit;
    ZQDocumentosdocuImputaciondocumentodocu_id: TIntegerField;
    ZQDocumentosdocuImputaciondocumentodocu_importe: TFloatField;
    ZQDocumentosdocuImputaciondocumentodocu_estado: TStringField;
    ZQDocumentosdocuImputaciondocumentodocu_pagado: TFloatField;
    ZQDocumentosdocuImputaciondocumentodocu_saldo: TFloatField;
    ZQDocumentosdocuImputaciondocumento_id: TIntegerField;
    ZQDocumentosdocuImputaciondocumento_idpago: TIntegerField;
    ZQDocumentosdocuImputaciondocumentodocu_tiporelacion: TStringField;
    ZQDocumentosdocuImputaciondocumento_id_1: TIntegerField;
    ZQDocumentosdocuImputaciondocumento_fecha: TDateField;
    ZQDocumentosdocuImputaciondocumento_fechavenc: TDateField;
    ZQDocumentosdocuImputaciondocumento_hora: TTimeField;
    ZQDocumentosdocuImputaciondocumento_numero: TIntegerField;
    ZQDocumentosdocuImputaciondocumento_total: TFloatField;
    ZQDocumentosdocuImputaciondocumento_saldo: TFloatField;
    ZQDocumentosdocuImputaciondocumento_pagado: TFloatField;
    ZQDocumentosdocuImputaciondocumento_estado: TStringField;
    ZQDocumentosdocuImputaciondocumento_neto21: TFloatField;
    ZQDocumentosdocuImputaciondocumento_iva21: TFloatField;
    ZQDocumentosdocuImputaciondocumento_neto105: TFloatField;
    ZQDocumentosdocuImputaciondocumento_iva105: TFloatField;
    ZQDocumentosdocuImputaciondocumento_neto27: TFloatField;
    ZQDocumentosdocuImputaciondocumento_iva27: TFloatField;
    ZQDocumentosdocuImputaciondocumento_observaciones: TStringField;
    ZQDocumentosdocuImputaciondocumento_ivaret: TFloatField;
    ZQDocumentosdocuImputaciondocumento_ivaperc: TFloatField;
    ZQDocumentosdocuImputaciondocumento_dgrret: TFloatField;
    ZQDocumentosdocuImputaciondocumento_dgrperc: TFloatField;
    ZQDocumentosdocuImputaciondocumento_otrosimpuestos: TFloatField;
    ZQDocumentosdocuImputaciondocumento_calidad: TStringField;
    ZQDocumentosdocuImputaciondocumento_documentacion: TStringField;
    ZQDocumentosdocuImputaciontipodocu_id: TIntegerField;
    ZQDocumentosdocuImputacionentidad_id: TIntegerField;
    ZQDocumentosdocuImputacionentidadtransportista_id: TIntegerField;
    ZQDocumentosdocuImputacionespecie_id: TIntegerField;
    ZQDocumentosdocuImputaciondocumento_fechacumplimiento: TDateField;
    ZQDocumentosdocuImputaciondocumento_moneda: TStringField;
    ZQDocumentosdocuImputaciondocumento_preciounitario: TFloatField;
    ZQDocumentosdocuImputaciondocumento_lugarentrega: TStringField;
    ZQDocumentosdocuImputaciondocumento_tipooperacion: TStringField;
    ZQDocumentosdocuImputaciondocumento_condicioncalidad: TStringField;
    ZQDocumentosdocuImputaciondocumento_tipodestino: TStringField;
    ZQDocumentosdocuImputaciondocumento_numerocartaporte: TIntegerField;
    ZQDocumentosdocuImputaciondocumento_kgbrutos: TFloatField;
    ZQDocumentosdocuImputaciondocumento_tara: TFloatField;
    ZQDocumentosdocuImputacionentidaddadorcarga_id: TIntegerField;
    ZQDocumentosdocuImputaciondocumento_chofer: TStringField;
    ZQDocumentosdocuImputaciondocumento_chofercuit: TStringField;
    ZQDocumentosdocuImputaciondocumento_transpchasis: TStringField;
    ZQDocumentosdocuImputaciondocumento_transpacoplado: TStringField;
    ZQDocumentosdocuImputaciondocumento_transptarifaflete: TFloatField;
    ZQDocumentosdocuImputaciondocumento_transpanticipo: TFloatField;
    ZQDocumentosdocuImputaciondocumento_cartaportetarifaflete: TFloatField;
    ZQDocumentosdocuImputaciondocumento_nogravado: TFloatField;
    ZQDocumentosdocuImputaciontipodocu_id_1: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_nombre: TStringField;
    ZQDocumentosdocuImputaciontipodocu_tipo: TStringField;
    ZQDocumentosdocuImputaciontipodocu_caja: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_stock: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_iva: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_fiscal: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_ultimonumero: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_letra: TStringField;
    ZQDocumentosdocuImputaciontipodocu_debcred: TStringField;
    ZQDocumentosdocuImputaciontipodocu_preimpresos: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_impresora: TStringField;
    ZQDocumentosdocuImputaciontipodocu_copias: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_preview: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_prompt: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_ctacte: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_archivoimpresion: TStringField;
    ZQDocumentosdocuImputaciontipodocu_leyenda: TStringField;
    ZQDocumentosdocuImputaciontipodocu_nombreabrev: TStringField;
    ZQDocumentosdocuImputaciontipodocu_manual: TIntegerField;
    ZQDocumentosdocuImputacionpuntoventa_id: TIntegerField;
    ZQDocumentosdocuImputaciontipodocu_tipoctacte: TStringField;
    ZQDocumentosdocuImputacionpuntoventa_id_1: TIntegerField;
    ZQDocumentosdocuImputacionpuntoventa_numero: TIntegerField;
    ZQDocumentosdocuImputacionpuntoventa_descripcion: TStringField;
    ZQDocumentosdocuImputacionpuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQDocumentosdocuImputacionpuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQDocumentosdocuImputacionsucursal_id: TIntegerField;
    DTSDocumentodocusImputacion: TDataSource;
    procedure btnagregarpagoClick(Sender: TObject);
    procedure btneliminarpagoClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btntomardocumentosAutoClick(Sender: TObject);
    procedure calculartotales;
  private
    { Private declarations }
    documento_saldo:real;
  public
    { Public declarations }
  end;

var
  Recibo: TRecibo;

implementation

Uses Unitprinc;

{$R *.dfm}

procedure TRecibo.calculartotales;
begin
    inherited;
    documento_total.Value:=0;
    ZQDocumentopagos.First;
    while not ZQDocumentopagos.Eof do
        begin
            documento_total.Value:=roundto(documento_total.Value+ZQDocumentopagos.FieldByName('documentopago_importe').AsFloat,-2);

            ZQDocumentopagos.Next;
        end;

    documento_pagado:=0;
    ZQDocumentosdocuImputacion.First;
    while not ZQDocumentosdocuImputacion.Eof do
        begin
            documento_pagado:=roundto(documento_pagado+ZQDocumentosdocuImputacion.FieldByName('documentodocu_importe').AsFloat,-2);

            ZQDocumentosdocuImputacion.Next;
        end;

    documento_estado:='PENDIENTE';
    documento_saldo:=roundto(documento_total.Value-documento_pagado,-2);
    if documento_saldo=0 then
      documento_estado:='PAGADA';

    documento_apagar:=documento_pagado-documento_total.Value;
end;

procedure TRecibo.btnagregarClick(Sender: TObject);
begin
  inherited;
    Princ.CargarDocumentoMonetarioDocu(entidad_id.codigo,ZQDocumentosdocuImputacion,documento_pagado,false,'Venta');
    calculartotales;
    documento_totalimputado.Value:=documento_pagado;
end;

procedure TRecibo.btnagregarpagoClick(Sender: TObject);
begin
  inherited;
    calculartotales;
    if Princ.CargarPago(documento_apagar,ZQDocumentopagos) then
      begin
          calculartotales;
          documento_totalimputado.Value:=documento_pagado;
      end;
end;

procedure TRecibo.btneliminarpagoClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea quitar este pago?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentopagos.Delete;
          finally
            calculartotales;
            documento_totalimputado.Value:=documento_pagado;
          end;
      end;
end;

procedure TRecibo.btnguardarClick(Sender: TObject);
begin
    calculartotales;
    self.GuardarEnDataset;

  inherited;
end;

procedure TRecibo.btnquitarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentosdocuImputacion.Delete;
          finally
            calculartotales;
            documento_totalimputado.Value:=documento_pagado;
          end;

      end;
end;

procedure TRecibo.btntomardocumentosAutoClick(Sender: TObject);
begin
  inherited;
    Princ.CargarDocumentoMonetarioDocu(entidad_id.codigo,ZQDocumentosdocuImputacion,documento_pagado,false,'Venta');
    calculartotales;
    documento_totalimputado.Value:=documento_pagado;
end;

end.
