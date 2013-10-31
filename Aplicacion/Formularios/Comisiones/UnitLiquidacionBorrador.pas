unit UnitLiquidacionBorrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, Grids,
  DBGrids, MoneyEdit, Math;

type
  TLiquidacionBorrador = class(TABMbase)
    Label1: TLabel;
    liquidacionvendedor_id: TEdit;
    Label2: TLabel;
    liquidacionvendedor_fecha: TDateTimePicker;
    Label4: TLabel;
    personal_id: TSqlComboBox;
    DBGrid1: TDBGrid;
    ZQliquidacionborradordetalles: TZQuery;
    DTSliquidacionborradordetalles: TDataSource;
    btnagregar: TButton;
    btnquitar: TButton;
    Label10: TLabel;
    liquidacionborrador_total: TMoneyEdit;
    Label3: TLabel;
    Memo1: TMemo;
    ZQliquidacionborradordetallesliquidacionborradordetalle_id: TIntegerField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_importe: TFloatField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_pagado: TFloatField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_saldo: TFloatField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_estado: TFloatField;
    ZQliquidacionborradordetallesliquidacionborrador_id: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_id: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_id_1: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_importeunit: TFloatField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_total: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_id: TIntegerField;
    ZQliquidacionborradordetallespersonal_id: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_saldo: TFloatField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_pagado: TFloatField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_estado: TStringField;
    ZQliquidacionborradordetallesdocumentoventadetalle_id_1: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_descripcion: TStringField;
    ZQliquidacionborradordetallesdocumentoventadetalle_cantidad: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_precio: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_total: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_neto21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_iva21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_neto105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_iva105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_nogravado: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_estado: TStringField;
    ZQliquidacionborradordetallesdocumentoventadetalle_observacion: TStringField;
    ZQliquidacionborradordetallesproducto_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_idorig: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe1: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe2: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe3: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe4: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe5: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe6: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_listaprecio: TIntegerField;
    ZQliquidacionborradordetallesproducto_tipo: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_id_1: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_numero: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_fecha: TDateField;
    ZQliquidacionborradordetallesdocumentoventa_hora: TTimeField;
    ZQliquidacionborradordetallesdocumentoventa_neto21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_iva21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_neto105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_iva105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_netonogravado: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_total: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_estado: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_pagado: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_saldo: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_observacion: TStringField;
    ZQliquidacionborradordetallescliente_id: TIntegerField;
    ZQliquidacionborradordetallespersonal_id_1: TIntegerField;
    ZQliquidacionborradordetallestipodocu_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_condicionventa: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_fechavenc: TDateField;
    ZQliquidacionborradordetallesdocumentoventa_listaprecio: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_equipo1: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_equipo2: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_formapago: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_nrodetallepago: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_solicitudcliente: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_trabajorealizado: TStringField;
    ZQliquidacionborradordetallescaja_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_recargo: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_descuento: TFloatField;
    procedure btnagregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CalcularTotal;
  public
    { Public declarations }
  end;

var
  LiquidacionBorrador: TLiquidacionBorrador;

implementation

uses UnitComisionesBorradorPendientes, unitprinc;

{$R *.dfm}

procedure TLiquidacionBorrador.CalcularTotal;
begin
    liquidacionborrador_total.Value:=0;
    ZQliquidacionborradordetalles.First;
    while not ZQliquidacionborradordetalles.Eof do
        begin
            liquidacionborrador_total.Value:=liquidacionborrador_total.Value+ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsFloat;

            ZQliquidacionborradordetalles.Next;
        end;


end;

procedure TLiquidacionBorrador.btnagregarClick(Sender: TObject);
begin
  inherited;
    ComisionesBorradorPendientes:=TComisionesBorradorPendientes.Create(self);
    ComisionesBorradorPendientes.personal_id:=personal_id.codigo;
    ComisionesBorradorPendientes.ActivarConsulta;
    ZQliquidacionborradordetalles.First;
    while not ZQliquidacionborradordetalles.Eof do
        begin
            if ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Locate('documentoventa_id',ZQliquidacionborradordetalles.FieldByName('documentoventa_idpago').AsString,[]) then
              begin
                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Edit;
                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat:=roundto(ZQliquidacionborradordetalles.FieldByName('documentoventadoc_importe').AsFloat,-2);

                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Post;

              end;

            ZQliquidacionborradordetalles.Next;
        end;

    ComisionesBorradorPendientes.Showmodal;

    if ComisionesBorradorPendientes.ModalResult=mrOk then
      begin
          ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.First;
          while not ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Eof do
              begin
                  if ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat<>0 then
                    begin
                        if ZQliquidacionborradordetalles.Locate('docuvendetcomisionvendedor_id',ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_id').AsString,[]) then
                          ZQliquidacionborradordetalles.Edit
                        else
                          ZQliquidacionborradordetalles.Insert;

                        ZQliquidacionborradordetalles.FieldByName('documentoventa_fecha').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_fecha').AsString;
                        ZQliquidacionborradordetalles.FieldByName('documentoventa_equipo1').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_equipo1').AsString;
                        ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_total').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_total').AsString;
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_pagado').AsFloat:=roundto(ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_pagado').AsFloat+ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2);
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat:=roundto(ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat-ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2);;
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsString;
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_id').AsString:='0';
//                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_estado').AsString:='PENDIENTE';
//                        if ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat=0 then
//                          ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_estado').AsString:='PAGADA';

                        ZQliquidacionborradordetalles.FieldByName('liquidacionborrador_id').AsString:='0';
                        ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_id').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_id').AsString;
                        ZQliquidacionborradordetalles.Post;


                    end;



                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Next;
              end;


      end
    else

    ComisionesBorradorPendientes.Free;
end;

procedure TLiquidacionBorrador.FormCreate(Sender: TObject);
begin
  inherited;
    personal_id.llenarcombo;
end;

procedure TLiquidacionBorrador.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQSelect.Active:=true;
end;

procedure TLiquidacionBorrador.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=ABM_AGREGAR then
      begin
          liquidacionvendedor_id.Text:=Princ.codigo('liquidacionesborradores','liquidacionborrador_id');
          liquidacionvendedor_fecha.Date:=Date;

      end
    else
      begin



      end;


    ZQliquidacionborradordetalles.Active:=false;
    ZQliquidacionborradordetalles.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQliquidacionborradordetalles.Active:=true;
end;

end.
