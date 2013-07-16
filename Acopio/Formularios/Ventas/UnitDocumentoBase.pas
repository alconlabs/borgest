unit UnitDocumentoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, MoneyEdit,
  GTBComboBox, GTBMemo, Math;

type
  TDocumentoBase = class(TABMbase)
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
    ZQDocumentos: TZQuery;
    ZQDocumentosdocuImputacion: TZQuery;
    ZQDocumentosdocuRelacion: TZQuery;
    ZQDocumentopagos: TZQuery;
    ZQDocumentosdocumento_id: TIntegerField;
    ZQDocumentosdocumento_fecha: TDateField;
    ZQDocumentosdocumento_fechavenc: TDateField;
    ZQDocumentosdocumento_hora: TTimeField;
    ZQDocumentosdocumento_numero: TIntegerField;
    ZQDocumentosdocumento_total: TFloatField;
    ZQDocumentosdocumento_saldo: TFloatField;
    ZQDocumentosdocumento_pagado: TFloatField;
    ZQDocumentosdocumento_estado: TStringField;
    ZQDocumentosdocumento_neto21: TFloatField;
    ZQDocumentosdocumento_iva21: TFloatField;
    ZQDocumentosdocumento_neto105: TFloatField;
    ZQDocumentosdocumento_iva105: TFloatField;
    ZQDocumentosdocumento_neto27: TFloatField;
    ZQDocumentosdocumento_iva27: TFloatField;
    ZQDocumentosdocumento_observaciones: TStringField;
    ZQDocumentosdocumento_ivaret: TFloatField;
    ZQDocumentosdocumento_ivaperc: TFloatField;
    ZQDocumentosdocumento_dgrret: TFloatField;
    ZQDocumentosdocumento_dgrperc: TFloatField;
    ZQDocumentosdocumento_otrosimpuestos: TFloatField;
    ZQDocumentosdocumento_calidad: TStringField;
    ZQDocumentosdocumento_documentacion: TStringField;
    ZQDocumentostipodocu_id: TIntegerField;
    ZQDocumentosentidad_id: TIntegerField;
    ZQDocumentosentidadtransportista_id: TIntegerField;
    ZQDocumentosespecie_id: TIntegerField;
    ZQDocumentosdocumento_fechacumplimiento: TDateField;
    ZQDocumentosdocumento_moneda: TStringField;
    ZQDocumentosdocumento_preciounitario: TFloatField;
    ZQDocumentosdocumento_lugarentrega: TStringField;
    ZQDocumentosdocumento_tipooperacion: TStringField;
    ZQDocumentosdocumento_condicioncalidad: TStringField;
    ZQDocumentosdocumento_tipodestino: TStringField;
    ZQDocumentosdocumento_numerocartaporte: TIntegerField;
    ZQDocumentosdocumento_kgbrutos: TFloatField;
    ZQDocumentosdocumento_tara: TFloatField;
    ZQDocumentosentidaddadorcarga_id: TIntegerField;
    ZQDocumentosdocumento_chofer: TStringField;
    ZQDocumentosdocumento_chofercuit: TStringField;
    ZQDocumentosdocumento_transpchasis: TStringField;
    ZQDocumentosdocumento_transpacoplado: TStringField;
    ZQDocumentosdocumento_transptarifaflete: TFloatField;
    ZQDocumentosdocumento_transpanticipo: TFloatField;
    ZQDocumentosdocumento_cartaportetarifaflete: TFloatField;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label12: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    documento_neto21: TMoneyEdit;
    documento_iva21: TMoneyEdit;
    documento_neto105: TMoneyEdit;
    documento_iva105: TMoneyEdit;
    documento_total: TMoneyEdit;
    documento_otrosimpuestos: TMoneyEdit;
    documento_neto27: TMoneyEdit;
    documento_iva27: TMoneyEdit;
    documento_nogravado: TMoneyEdit;
    documento_ivaret: TMoneyEdit;
    documento_ivaperc: TMoneyEdit;
    documento_dgrret: TMoneyEdit;
    documento_dgrperc: TMoneyEdit;
    ZQDocumentosdocumento_nogravado: TFloatField;
    ZQDocumentosdocumento_puntoventa: TIntegerField;

    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
    procedure anular;
    procedure GuardarEnDataset;
    procedure calculartotales;
    procedure sucursal_idSelect(Sender: TObject);
    procedure puntoventa_idSelect(Sender: TObject);
    procedure tipodocu_idSelect(Sender: TObject);

  private
    { Private declarations }
  Protected
    { Public declarations }
    documento_pagado:real;
    documento_saldo:real;
    documento_apagar:real;
    documento_estado:string;
  public
    { Public declarations }
    tipodocu_nombre:string;
  end;

var
  DocumentoBase: TDocumentoBase;

implementation

Uses Unitprinc;

{$R *.dfm}

procedure TDocumentoBase.calculartotales;
begin
    documento_estado:='PENDIENTE';
    documento_saldo:=documento_total.Value;
    documento_pagado:=0;

end;

procedure TDocumentoBase.anular;
begin
  //..
    self.Close;
end;

procedure TDocumentoBase.imprimir;
begin
  //..
end;

procedure TDocumentoBase.eliminar;
begin
  //..
    self.Close;
end;

procedure TDocumentoBase.modificar;
begin
    Princ.ModificarDocumento(ZQDocumentos,ZQDocumentosdocuImputacion,ZQDocumentosdocuRelacion,ZQDocumentopagos);
    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    self.Close;
end;

procedure TDocumentoBase.puntoventa_idSelect(Sender: TObject);
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

procedure TDocumentoBase.sucursal_idSelect(Sender: TObject);
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

procedure TDocumentoBase.tipodocu_idSelect(Sender: TObject);
begin
  inherited;
    documento_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TDocumentoBase.GuardarEnDataset;
begin
    ZQDocumentos.Active:=false;
    ZQDocumentos.ParamByName('documento_id').AsString:=id;
    ZQDocumentos.Active:=true;

    ZQDocumentos.First;
    if ZQDocumentos.RecordCount>0 then
      ZQDocumentos.Edit
    else
      ZQDocumentos.Insert;

    ZQDocumentos.FieldByName('documento_cartaportetarifaflete').AsString:='0';
    ZQDocumentos.FieldByName('documento_transpanticipo').AsString:='0';
    ZQDocumentos.FieldByName('documento_transptarifaflete').AsString:='0';
    ZQDocumentos.FieldByName('documento_transpacoplado').AsString:='';
    ZQDocumentos.FieldByName('documento_transpchasis').AsString:='';
    ZQDocumentos.FieldByName('documento_chofercuit').AsString:='';
    ZQDocumentos.FieldByName('documento_chofer').AsString:='';
    ZQDocumentos.FieldByName('entidaddadorcarga_id').AsString:='0';
    ZQDocumentos.FieldByName('documento_tara').AsString:='0';
    ZQDocumentos.FieldByName('documento_kgbrutos').AsString:='0';
    ZQDocumentos.FieldByName('documento_numerocartaporte').AsString:='0';
    ZQDocumentos.FieldByName('documento_tipodestino').AsString:='';
    ZQDocumentos.FieldByName('documento_condicioncalidad').AsString:='';
    ZQDocumentos.FieldByName('documento_tipooperacion').AsString:='';
    ZQDocumentos.FieldByName('documento_lugarentrega').AsString:='';
    ZQDocumentos.FieldByName('documento_preciounitario').AsString:='0';
    ZQDocumentos.FieldByName('documento_moneda').AsString:='';
    ZQDocumentos.FieldByName('documento_fechacumplimiento').AsDateTime:=Princ.fechaservidor;
    ZQDocumentos.FieldByName('especie_id').AsString:='0';
    ZQDocumentos.FieldByName('entidadtransportista_id').AsString:='0';
    ZQDocumentos.FieldByName('entidad_id').AsString:=entidad_id.codigo;
    ZQDocumentos.FieldByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQDocumentos.FieldByName('documento_documentacion').AsString:='';
    ZQDocumentos.FieldByName('documento_calidad').AsString:='';
    ZQDocumentos.FieldByName('documento_otrosimpuestos').AsString:='0';
    ZQDocumentos.FieldByName('documento_dgrperc').AsString:='0';
    ZQDocumentos.FieldByName('documento_dgrret').AsString:='0';
    ZQDocumentos.FieldByName('documento_ivaperc').AsString:='0';
    ZQDocumentos.FieldByName('documento_ivaret').AsString:='0';
    ZQDocumentos.FieldByName('documento_observaciones').AsString:='0';
    ZQDocumentos.FieldByName('documento_iva27').AsString:='0';
    ZQDocumentos.FieldByName('documento_neto27').AsString:='0';
    ZQDocumentos.FieldByName('documento_iva105').AsString:='0';
    ZQDocumentos.FieldByName('documento_neto105').AsString:='0';
    ZQDocumentos.FieldByName('documento_iva21').AsString:='0';
    ZQDocumentos.FieldByName('documento_neto21').AsString:='0';
    ZQDocumentos.FieldByName('documento_estado').AsString:=documento_estado;
    ZQDocumentos.FieldByName('documento_pagado').AsFloat:=documento_pagado;
    ZQDocumentos.FieldByName('documento_saldo').AsString:=documento_total.Text;
    ZQDocumentos.FieldByName('documento_numero').AsString:=documento_numero.Text;
    ZQDocumentos.FieldByName('documento_hora').AsString:=Princ.horaservidor;
    ZQDocumentos.FieldByName('documento_fechavenc').AsDateTime:=documento_fechavenc.Date;
    ZQDocumentos.FieldByName('documento_fecha').AsDateTime:=documento_fecha.Date;
    ZQDocumentos.FieldByName('documento_id').AsString:=id;
    ZQDocumentos.FieldByName('documento_neto21').AsString:=documento_neto21.Text;
    ZQDocumentos.FieldByName('documento_iva21').AsString:=documento_iva21.Text;
    ZQDocumentos.FieldByName('documento_otrosimpuestos').AsString:=documento_otrosimpuestos.Text;
    ZQDocumentos.FieldByName('documento_neto105').AsString:=documento_neto105.Text;
    ZQDocumentos.FieldByName('documento_iva105').AsString:=documento_iva105.Text;
    ZQDocumentos.FieldByName('documento_neto27').AsString:=documento_neto27.Text;
    ZQDocumentos.FieldByName('documento_iva27').AsString:=documento_iva27.Text;
    ZQDocumentos.FieldByName('documento_nogravado').AsString:=documento_nogravado.Text;
    ZQDocumentos.FieldByName('documento_ivaret').AsString:=documento_ivaret.Text;
    ZQDocumentos.FieldByName('documento_ivaperc').AsString:=documento_ivaperc.Text;
    ZQDocumentos.FieldByName('documento_dgrret').AsString:=documento_dgrret.Text;
    ZQDocumentos.FieldByName('documento_dgrperc').AsString:=documento_dgrperc.Text;
    ZQDocumentos.FieldByName('documento_total').AsString:=documento_total.Text;
    ZQDocumentos.Post;

end;


procedure TDocumentoBase.agregar;
begin

    princ.AgregarDocumento(ZQDocumentos,ZQDocumentosdocuImputacion,ZQDocumentosdocuRelacion,ZQDocumentopagos);
    
    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    self.Close;
end;


procedure TDocumentoBase.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    sucursal_id.llenarcombo;

    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';

    puntoventa_id.llenarcombo;
    try
      puntoventa_id.ItemIndex:=0;
    except
      puntoventa_id.ItemIndex:=-1;
    end;


    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" '+
                              'and tipodocu_nombre="'+tipodocu_nombre+'" '+
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
          entidad_id.ItemIndex:=-1;

          documento_total.Text:='0';
          documento_observaciones.Text:='';
      end
    else
      begin
          documento_fecha.Date:=ZQSelect.FieldByName('documento_fecha').AsDateTime;
          sucursal_id.Buscar(ZQSelect.FieldByName('sucursal_id').AsString);
          sucursal_id.OnSelect(self);
          puntoventa_id.Buscar(ZQSelect.FieldByName('puntoventa_id').AsString);
          puntoventa_id.OnSelect(self);
          tipodocu_id.buscar(ZQSelect.FieldByName('tipodocu_id').AsString);
          tipodocu_id.OnSelect(self);
          documento_numero.Text:=ZQSelect.FieldByName('documento_numero').AsString;

          entidad_id.Buscar(ZQSelect.FieldByName('entidad_id').AsString);
          documento_total.Text:=ZQSelect.FieldByName('documento_total').AsString;
          documento_observaciones.Text:=ZQSelect.FieldByName('documento_observaciones').AsString;

          documento_neto21.Text:=ZQSelect.FieldByName('documento_neto21').AsString;
          documento_iva21.Text:=ZQSelect.FieldByName('documento_iva21').AsString;
          documento_otrosimpuestos.Text:=ZQSelect.FieldByName('documento_otrosimpuestos').AsString;
          documento_neto105.Text:=ZQSelect.FieldByName('documento_neto105').AsString;
          documento_iva105.Text:=ZQSelect.FieldByName('documento_iva105').AsString;
          documento_neto27.Text:=ZQSelect.FieldByName('documento_neto27').AsString;
          documento_iva27.Text:=ZQSelect.FieldByName('documento_iva27').AsString;
          documento_nogravado.Text:=ZQSelect.FieldByName('documento_nogravado').AsString;
          documento_ivaret.Text:=ZQSelect.FieldByName('documento_ivaret').AsString;
          documento_ivaperc.Text:=ZQSelect.FieldByName('documento_ivaperc').AsString;
          documento_dgrret.Text:=ZQSelect.FieldByName('documento_dgrret').AsString;
          documento_dgrperc.Text:=ZQSelect.FieldByName('documento_dgrperc').AsString;
          documento_total.Text:=ZQSelect.FieldByName('documento_total').AsString;

      end;

    ZQDocumentosdocuImputacion.Active:=false;
    ZQDocumentosdocuImputacion.ParamByName('documento_id').AsString:=id;
    ZQDocumentosdocuImputacion.Active:=true;

    ZQDocumentosdocuRelacion.Active:=false;
    ZQDocumentosdocuRelacion.ParamByName('documento_id').AsString:=id;
    ZQDocumentosdocuRelacion.Active:=true;

    ZQDocumentopagos.Active:=false;
    ZQDocumentopagos.ParamByName('documento_id').AsString:=id;
    ZQDocumentopagos.Active:=true;
end;

procedure TDocumentoBase.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';

    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=-1;

end;

procedure TDocumentoBase.FormShow(Sender: TObject);
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

function TDocumentoBase.control:boolean;
var
  error:integer;
begin
    error:=0;


    if error=0 then
      result:=true
    else
      result:=false;

end;



procedure TDocumentoBase.btnguardarClick(Sender: TObject);
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

end.
