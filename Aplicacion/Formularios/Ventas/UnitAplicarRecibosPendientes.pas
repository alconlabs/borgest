unit UnitAplicarRecibosPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Grids, DBGrids, StdCtrls, UnitSqlComboBox, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, Math,
  MoneyEdit;

type
  TAplicarRecibosPendientes = class(TABMbase)
    Label3: TLabel;
    cliente_id: TSqlComboBox;
    Label1: TLabel;
    cliente_domicilio: TLabel;
    Label11: TLabel;
    cliente_documentonro: TLabel;
    DBGrid1: TDBGrid;
    btnagregar: TButton;
    btnquitar: TButton;
    btntomardocumentosAuto: TButton;
    Label2: TLabel;
    documentoventa_id: TSqlComboBox;
    Label4: TLabel;
    documentoventa_total: TLabel;
    Label6: TLabel;
    documentoventa_pagado: TLabel;
    Label8: TLabel;
    documentoventa_saldo: TLabel;
    ZQdocumentoventadocus: TZQuery;
    ZQdocumentoventadocusdocumentoventadoc_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventadoc_importe: TFloatField;
    ZQdocumentoventadocusdocumentoventa_pagado: TFloatField;
    ZQdocumentoventadocusdocumentoventa_saldo: TFloatField;
    ZQdocumentoventadocusdocumentoventa_estado: TStringField;
    ZQdocumentoventadocusdocumentoventa_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_idpago: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_id_1: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_numero: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_fecha: TDateField;
    ZQdocumentoventadocusdocumentoventa_hora: TTimeField;
    ZQdocumentoventadocusdocumentoventa_neto21: TFloatField;
    ZQdocumentoventadocusdocumentoventa_iva21: TFloatField;
    ZQdocumentoventadocusdocumentoventa_neto105: TFloatField;
    ZQdocumentoventadocusdocumentoventa_iva105: TFloatField;
    ZQdocumentoventadocusdocumentoventa_netonogravado: TFloatField;
    ZQdocumentoventadocusdocumentoventa_total: TFloatField;
    ZQdocumentoventadocusdocumentoventa_estado_1: TStringField;
    ZQdocumentoventadocusdocumentoventa_pagado_1: TFloatField;
    ZQdocumentoventadocusdocumentoventa_saldo_1: TFloatField;
    ZQdocumentoventadocusdocumentoventa_observacion: TStringField;
    ZQdocumentoventadocuscliente_id: TIntegerField;
    ZQdocumentoventadocuspersonal_id: TIntegerField;
    ZQdocumentoventadocustipodocu_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_condicionventa: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_fechavenc: TDateField;
    ZQdocumentoventadocusdocumentoventa_listaprecio: TIntegerField;
    ZQdocumentoventadocustipodocu_id_1: TIntegerField;
    ZQdocumentoventadocustipodocu_nombre: TStringField;
    ZQdocumentoventadocustipodocu_tipo: TStringField;
    ZQdocumentoventadocustipodocu_caja: TIntegerField;
    ZQdocumentoventadocustipodocu_stock: TIntegerField;
    ZQdocumentoventadocustipodocu_iva: TIntegerField;
    ZQdocumentoventadocustipodocu_fiscal: TIntegerField;
    ZQdocumentoventadocustipodocu_ultimonumero: TIntegerField;
    ZQdocumentoventadocuspuntoventa_id: TIntegerField;
    ZQdocumentoventadocustipodocu_letra: TStringField;
    ZQdocumentoventadocuspuntoventa_id_1: TIntegerField;
    ZQdocumentoventadocuspuntoventa_numero: TIntegerField;
    ZQdocumentoventadocuspuntoventa_descripcion: TStringField;
    ZQdocumentoventadocussucursal_id: TIntegerField;
    DTSDocumentoventadocus: TDataSource;
    btnVerRecibo: TButton;
    ZQdocumentoventadocusABM: TZQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField2: TStringField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField3: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    DateField2: TDateField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    StringField6: TStringField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    StringField7: TStringField;
    IntegerField20: TIntegerField;
    ZQdocumentoventadocusABMdocumentoventadoc_tiporelacion: TStringField;
    ZQdocumentoventadocusABMdocumentoventa_equipo1: TStringField;
    ZQdocumentoventadocusABMdocumentoventa_equipo2: TStringField;
    ZQdocumentoventadocusABMdocumentoventa_formapago: TStringField;
    ZQdocumentoventadocusABMdocumentoventa_nrodetallepago: TStringField;
    ZQdocumentoventadocusABMdocumentoventa_solicitudcliente: TStringField;
    ZQdocumentoventadocusABMdocumentoventa_trabajorealizado: TStringField;
    ZQdocumentoventadocusABMcaja_id: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_debcred: TStringField;
    ZQdocumentoventadocusABMtipodocufiscal_id: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_preimpresos: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_impresora: TStringField;
    ZQdocumentoventadocusABMtipodocu_copias: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_preview: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_prompt: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_ctacte: TIntegerField;
    ZQdocumentoventadocusABMtipodocu_archivoimpresion: TStringField;
    ZQdocumentoventadocusABMtipodocu_leyenda: TStringField;
    ZQdocumentoventadocusABMtipodocu_nombreabrev: TStringField;
    ZQdocumentoventadocusABMtipodocu_manual: TIntegerField;
    ZQdocumentoventadocusABMpuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQdocumentoventadocusABMpuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQdocumentoventadocusdocumentoventadoc_tiporelacion: TStringField;
    ZQdocumentoventadocusdocumentoventa_equipo1: TStringField;
    ZQdocumentoventadocusdocumentoventa_equipo2: TStringField;
    ZQdocumentoventadocusdocumentoventa_formapago: TStringField;
    ZQdocumentoventadocusdocumentoventa_nrodetallepago: TStringField;
    ZQdocumentoventadocusdocumentoventa_solicitudcliente: TStringField;
    ZQdocumentoventadocusdocumentoventa_trabajorealizado: TStringField;
    ZQdocumentoventadocuscaja_id: TIntegerField;
    ZQdocumentoventadocustipodocu_debcred: TStringField;
    ZQdocumentoventadocustipodocufiscal_id: TIntegerField;
    ZQdocumentoventadocustipodocu_preimpresos: TIntegerField;
    ZQdocumentoventadocustipodocu_impresora: TStringField;
    ZQdocumentoventadocustipodocu_copias: TIntegerField;
    ZQdocumentoventadocustipodocu_preview: TIntegerField;
    ZQdocumentoventadocustipodocu_prompt: TIntegerField;
    ZQdocumentoventadocustipodocu_ctacte: TIntegerField;
    ZQdocumentoventadocustipodocu_archivoimpresion: TStringField;
    ZQdocumentoventadocustipodocu_leyenda: TStringField;
    ZQdocumentoventadocustipodocu_nombreabrev: TStringField;
    ZQdocumentoventadocustipodocu_manual: TIntegerField;
    ZQdocumentoventadocuspuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQdocumentoventadocuspuntoventa_controladorfiscalpuerto: TIntegerField;
    Label17: TLabel;
    documentoventa_totalimputado: TMoneyEdit;
    procedure cliente_idSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnagregarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btntomardocumentosAutoClick(Sender: TObject);
    procedure documentoventa_idSelect(Sender: TObject);
    procedure btnVerReciboClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    pagado:real;
    saldo:real;
    procedure calculartotales;
  public
    { Public declarations }
  end;

var
  AplicarRecibosPendientes: TAplicarRecibosPendientes;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TAplicarRecibosPendientes.btnguardarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
    if cliente_id.codigo<>'' then
      begin
          if documentoventa_id.codigo<>'' then
            begin
                if ZQdocumentoventadocus.RecordCount>0 then
                  begin
                      ZQdocumentoventadocusABM.Active:=false;
                      ZQdocumentoventadocusABM.ParamByName('documentoventa_id').AsString:=documentoventa_id.codigo;
                      ZQdocumentoventadocusABM.Active:=true;

                      ZQdocumentoventadocusABM.Last;
                      ZQdocumentoventadocus.First;
                      while not ZQdocumentoventadocus.Eof do
                          begin
                              ZQdocumentoventadocusABM.Insert;
                              for i := 0 to ZQdocumentoventadocus.FieldCount-1 do
                                begin
                                    ZQdocumentoventadocusABM.Fields.Fields[i].AsString:=ZQdocumentoventadocus.Fields.Fields[i].AsString;
                                    ZQdocumentoventadocus.FieldByName('documentoventadoc_tiporelacion').AsString;
                                    ZQdocumentoventadocusABM.FieldByName('documentoventadoc_tiporelacion').AsString;

                                end;
                              ZQdocumentoventadocusABM.Post;
                              ZQdocumentoventadocus.Next;
                          end;

                      Princ.ModificarDocumentoVenta(ZQSelect,nil,ZQdocumentoventadocusABM, nil,nil);
                      MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
                      cliente_id.OnSelect(self);
                      ZQdocumentoventadocus.Active:=false;
                      ZQdocumentoventadocus.Active:=true;
                      documentoventa_totalimputado.Value:=0;
                      documentoventa_id.OnSelect(self);
                      documentoventa_id.SetFocus;
                  end;

            end;

      end;

end;

procedure TAplicarRecibosPendientes.btnquitarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQdocumentoventadocus.Delete;
          finally
            calculartotales;
          end;

      end;
end;

procedure TAplicarRecibosPendientes.btntomardocumentosAutoClick(
  Sender: TObject);
begin
  inherited;
    Princ.CargarDocumentoVentaDocu(cliente_id.codigo,ZQdocumentoventadocus,saldo,true);

    calculartotales;
end;

procedure TAplicarRecibosPendientes.btnVerReciboClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoVenta(documentoventa_id.codigo,TIPODOCU_RECIBOVENTA,2);
end;

procedure TAplicarRecibosPendientes.calculartotales;
var
  bm:TBookmark;
begin
    ZQdocumentoventadocus.First;
    if ZQSelect.Active then
      begin
          pagado:=ZQSelect.FieldByName('documentoventa_pagado').AsFloat;
          saldo:=ZQSelect.FieldByName('documentoventa_saldo').AsFloat;

          while not ZQdocumentoventadocus.Eof do
              begin
                  pagado:=roundto(pagado+ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat,-2);
                  saldo:=roundto(saldo-ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat,-2);

                  ZQdocumentoventadocus.Next;
              end;
          documentoventa_totalimputado.Value:=pagado;


      end;


end;


procedure TAplicarRecibosPendientes.btnagregarClick(Sender: TObject);
begin
  inherited;
    Princ.CargarDocumentoVentaDocu(cliente_id.codigo,ZQdocumentoventadocus,saldo,false);

    calculartotales;
end;

procedure TAplicarRecibosPendientes.cliente_idSelect(Sender: TObject);
begin
  inherited;
    cliente_domicilio.Caption:=Princ.buscar('select cliente_domicilio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_domicilio');
    cliente_documentonro.Caption:=Princ.buscar('select cliente_documentonro from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_documentonro');


    documentoventa_id.Confsql.Text:='select *, concat("Nro. ",documentoventa_numero, " - ", DATE_FORMAT(documentoventa_fecha,"%d/%m/%Y"), " $", round(documentoventa_total,2)) as documentoventa_nombre '+
                                    'from documentosventas '+
                                    'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                    'where tipodocu_nombre="'+TIPODOCU_RECIBOVENTA+'" and '+
                                    'documentoventa_estado="PENDIENTE" and '+
                                    'documentoventa_saldo<>0 and '+
                                    'cliente_id="'+cliente_id.codigo+'" '+
                                    'order by documentoventa_numero ';
    documentoventa_id.llenarcombo;
    documentoventa_id.OnSelect(self);
end;


procedure TAplicarRecibosPendientes.documentoventa_idSelect(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('documentoventa_id').AsString:=documentoventa_id.codigo;
    ZQSelect.Active:=true;

    btnagregar.Enabled:=false;
    btnquitar.Enabled:=false;
    btntomardocumentosAuto.Enabled:=false;

    if documentoventa_id.codigo<>'' then
      begin
          btnagregar.Enabled:=true;
          btnquitar.Enabled:=true;
          btntomardocumentosAuto.Enabled:=true;


      end;


end;

procedure TAplicarRecibosPendientes.FormShow(Sender: TObject);
begin
  inherited;
    cliente_id.llenarcombo;

    ZQdocumentoventadocus.Active:=false;
    ZQdocumentoventadocus.Active:=true;

end;

procedure TAplicarRecibosPendientes.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    documentoventa_total.Caption:=floattostr(roundto(ZQSelect.FieldByName('documentoventa_total').AsFloat,-2));
    documentoventa_pagado.Caption:=floattostr(roundto(ZQSelect.FieldByName('documentoventa_pagado').AsFloat,-2));
    documentoventa_saldo.Caption:=floattostr(roundto(ZQSelect.FieldByName('documentoventa_saldo').AsFloat,-2));

    pagado:=ZQSelect.FieldByName('documentoventa_pagado').AsFloat;
    saldo:=ZQSelect.FieldByName('documentoventa_saldo').AsFloat;
end;

end.
