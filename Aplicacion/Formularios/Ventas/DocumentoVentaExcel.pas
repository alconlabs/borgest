unit DocumentoVentaExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, ExtCtrls, AdvPanel;

type
  TABMbase2 = class(TABMbase)
    DBGrid1: TDBGrid;
    DTSSelect: TDataSource;
    ZQSelectdocumentoventa_id: TIntegerField;
    ZQSelectdocumentoventa_numero: TIntegerField;
    ZQSelectdocumentoventa_fecha: TDateField;
    ZQSelectdocumentoventa_hora: TTimeField;
    ZQSelectdocumentoventa_neto21: TFloatField;
    ZQSelectdocumentoventa_iva21: TFloatField;
    ZQSelectdocumentoventa_neto105: TFloatField;
    ZQSelectdocumentoventa_iva105: TFloatField;
    ZQSelectdocumentoventa_netonogravado: TFloatField;
    ZQSelectdocumentoventa_total: TFloatField;
    ZQSelectdocumentoventa_estado: TStringField;
    ZQSelectdocumentoventa_pagado: TFloatField;
    ZQSelectdocumentoventa_saldo: TFloatField;
    ZQSelectdocumentoventa_observacion: TStringField;
    ZQSelectcliente_id: TIntegerField;
    ZQSelectpersonal_id: TIntegerField;
    ZQSelecttipodocu_id: TIntegerField;
    ZQSelectdocumentoventa_condicionventa: TIntegerField;
    ZQSelectdocumentoventa_fechavenc: TDateField;
    ZQSelectdocumentoventa_listaprecio: TIntegerField;
    ZQSelecttipodocu_id_1: TIntegerField;
    ZQSelecttipodocu_nombre: TStringField;
    ZQSelecttipodocu_tipo: TStringField;
    ZQSelecttipodocu_caja: TIntegerField;
    ZQSelecttipodocu_stock: TIntegerField;
    ZQSelecttipodocu_iva: TIntegerField;
    ZQSelecttipodocu_fiscal: TIntegerField;
    ZQSelecttipodocu_ultimonumero: TIntegerField;
    ZQSelectpuntoventa_id: TIntegerField;
    ZQSelecttipodocu_letra: TStringField;
    ZQSelecttipodocu_debcred: TStringField;
    ZQSelecttipodocufiscal_id: TIntegerField;
    ZQSelecttipodocu_preimpresos: TIntegerField;
    ZQSelecttipodocu_impresora: TStringField;
    ZQSelecttipodocu_copias: TIntegerField;
    ZQSelecttipodocu_preview: TIntegerField;
    ZQSelecttipodocu_prompt: TIntegerField;
    ZQSelectpuntoventa_id_1: TIntegerField;
    ZQSelectpuntoventa_numero: TIntegerField;
    ZQSelectpuntoventa_descripcion: TStringField;
    ZQSelectsucursal_id: TIntegerField;
    ZQSelectcliente_id_1: TIntegerField;
    ZQSelectcliente_nombre: TStringField;
    ZQSelectcliente_domicilio: TStringField;
    ZQSelectcliente_documentonro: TStringField;
    ZQSelectcliente_documentotipo: TStringField;
    ZQSelectcliente_telefono: TStringField;
    ZQSelectcliente_celular: TStringField;
    ZQSelectcliente_mail: TStringField;
    ZQSelectcondicioniva_id: TIntegerField;
    ZQSelectcliente_listaprecio: TIntegerField;
    ZQSelectcliente_condicionventa: TStringField;
    ZQSelectlocalidad_id: TIntegerField;
    ZQSelectcliente_observaciones: TStringField;
    ZQSelectpersonal_id_1: TIntegerField;
    ZQSelectpersonal_nombre: TStringField;
    ZQSelectpersonal_domicilio: TStringField;
    ZQSelectpersonal_telefono: TStringField;
    ZQSelectpersonal_celular: TStringField;
    ZQSelectpersonal_mail: TStringField;
    ZQSelectdocumentoventadetalle_id: TIntegerField;
    ZQSelectdocumentoventadetalle_descripcion: TStringField;
    ZQSelectdocumentoventadetalle_cantidad: TFloatField;
    ZQSelectdocumentoventadetalle_precio: TFloatField;
    ZQSelectdocumentoventadetalle_total: TFloatField;
    ZQSelectdocumentoventadetalle_neto21: TFloatField;
    ZQSelectdocumentoventadetalle_iva21: TFloatField;
    ZQSelectdocumentoventadetalle_neto105: TFloatField;
    ZQSelectdocumentoventadetalle_iva105: TFloatField;
    ZQSelectdocumentoventadetalle_nogravado: TFloatField;
    ZQSelectdocumentoventadetalle_estado: TStringField;
    ZQSelectdocumentoventadetalle_observacion: TStringField;
    ZQSelectproducto_id: TIntegerField;
    ZQSelectdocumentoventadetalle_idorig: TIntegerField;
    ZQSelectdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQSelectdocumentoventa_id_1: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ABMbase2: TABMbase2;

implementation

{$R *.dfm}

end.
