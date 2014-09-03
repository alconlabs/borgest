unit UnitCargaDetallePagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, MoneyEdit, Math, UnitSqlComboBox;

type
  TCargaDetallePagos = class(TABMbase)
    PageControl1: TPageControl;
    TabSheetEfectivo: TTabSheet;
    TabSheetTarjeta: TTabSheet;
    Label1: TLabel;
    efectivo_nombre: TEdit;
    Label5: TLabel;
    efectivo_importe: TMoneyEdit;
    Label2: TLabel;
    cobrado: TMoneyEdit;
    cambio: TMoneyEdit;
    Label3: TLabel;
    btnefectivo: TButton;
    btncancelarefectivo: TButton;
    btntarjeta: TButton;
    btncancelartarjeta: TButton;
    TabSheetCheque: TTabSheet;
    TabSheetDeposito: TTabSheet;
    Label4: TLabel;
    cheque_nombre: TEdit;
    Label6: TLabel;
    cheque_importe: TMoneyEdit;
    Label7: TLabel;
    deposito_nombre: TEdit;
    Label8: TLabel;
    deposito_importe: TMoneyEdit;
    btncancelarcheques: TButton;
    btncheque: TButton;
    btncancelardeposito: TButton;
    btndeposito: TButton;
    Label9: TLabel;
    tarjeta_id: TSqlComboBox;
    Label10: TLabel;
    tarjeta_acobrar: TMoneyEdit;
    Label11: TLabel;
    tarjeta_cuotas: TMoneyEdit;
    tarjeta_porcinteres: TLabel;
    tarjeta_importeinteres: TMoneyEdit;
    Label13: TLabel;
    tarjeta_cobrado: TMoneyEdit;
    Label14: TLabel;
    tarjeta_cupon: TEdit;
    Label15: TLabel;
    tarjeta_autorizacion: TEdit;
    Label16: TLabel;
    tarjeta_titular: TEdit;
    tarjeta_dni: TEdit;
    Label17: TLabel;
    tarjeta_telefono: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    tarjeta_importecuota: TMoneyEdit;
    btnabmtarjetas: TButton;
    TabSheetRetencion: TTabSheet;
    Label12: TLabel;
    Label20: TLabel;
    retencion_nombre: TEdit;
    retencion_importe: TMoneyEdit;
    btncancelarretencion: TButton;
    btnretencion: TButton;
    Label21: TLabel;
    banco_id: TSqlComboBox;
    BtnAbmBancos: TButton;
    Label22: TLabel;
    cheque_numero: TEdit;
    Label23: TLabel;
    cheque_fechavenc: TDateTimePicker;
    procedure efectivo_importeExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheetEfectivoShow(Sender: TObject);
    procedure TabSheetTarjetaShow(Sender: TObject);
    procedure TabSheetChequeShow(Sender: TObject);
    procedure TabSheetDepositoShow(Sender: TObject);
    procedure btnefectivoClick(Sender: TObject);
    procedure btntarjetaClick(Sender: TObject);
    procedure btnchequeClick(Sender: TObject);
    procedure btndepositoClick(Sender: TObject);
    procedure tarjeta_idSelect(Sender: TObject);
    procedure TabSheetRetencionShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnretencionClick(Sender: TObject);
    procedure BtnAbmBancosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    total_cobrar:real;
    total_pagado:real;
    documentopago_importe:real;
    documentopago_nombre:string;
    tipopago_id:string;
    tipopago_nombre:string;
  end;

var
  CargaDetallePagos: TCargaDetallePagos;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TCargaDetallePagos.BtnAbmBancosClick(Sender: TObject);
begin
  inherited;
    princ.BtnBancos.Click;
end;

procedure TCargaDetallePagos.btnchequeClick(Sender: TObject);
begin
  inherited;
    documentopago_nombre:=cheque_nombre.Text;
    documentopago_importe:=cheque_importe.Value;

    tipopago_id:='3';
    tipopago_nombre:='CHEQUE';

    Self.ModalResult:=mrOk;
end;

procedure TCargaDetallePagos.btndepositoClick(Sender: TObject);
begin
  inherited;
    documentopago_nombre:=deposito_nombre.Text;
    documentopago_importe:=deposito_importe.Value;

    tipopago_id:='4';
    tipopago_nombre:='DEPOSITO';

    Self.ModalResult:=mrOk;
end;

procedure TCargaDetallePagos.btnefectivoClick(Sender: TObject);
begin
  inherited;
    documentopago_nombre:=efectivo_nombre.Text;
    documentopago_importe:=efectivo_importe.Value;

    Self.ModalResult:=mrOk;
end;

procedure TCargaDetallePagos.btnretencionClick(Sender: TObject);
begin
  inherited;
    documentopago_nombre:=retencion_nombre.Text;
    documentopago_importe:=retencion_importe.Value;

    tipopago_id:='5';
    tipopago_nombre:='RETENCION';

    Self.ModalResult:=mrOk;
end;

procedure TCargaDetallePagos.btntarjetaClick(Sender: TObject);
begin
  inherited;
    tipopago_id:='2';
    tipopago_nombre:='TARJETA';

    documentopago_nombre:=tarjeta_id.Text + ' - ' + tarjeta_cuotas.Text + ' cuotas';
    documentopago_importe:=tarjeta_cobrado.Value;

    Self.ModalResult:=mrOk;
end;

procedure TCargaDetallePagos.efectivo_importeExit(Sender: TObject);
begin
  inherited;
    cobrado.Text:=efectivo_importe.Text;
    cambio.Text:='0';
end;

procedure TCargaDetallePagos.FormCreate(Sender: TObject);
begin
  inherited;
    banco_id.llenarcombo;
    cheque_fechavenc.Date:=Date;
end;

procedure TCargaDetallePagos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if (Shift=[ssCtrl])then
      begin
          case key of
            49: Self.PageControl1.ActivePage:=TabSheetEfectivo;
            50: Self.PageControl1.ActivePage:=TabSheetTarjeta;
            51: Self.PageControl1.ActivePage:=TabSheetCheque;
            52: Self.PageControl1.ActivePage:=TabSheetDeposito;
            53: Self.PageControl1.ActivePage:=TabSheetRetencion;

          end;

      end;



end;

procedure TCargaDetallePagos.FormShow(Sender: TObject);
begin
  inherited;
    TabSheetEfectivo.TabVisible:=Princ.DisponibleTipoPago('1');
    TabSheetTarjeta.TabVisible:=Princ.DisponibleTipoPago('2');
    TabSheetCheque.TabVisible:=Princ.DisponibleTipoPago('3');
    TabSheetDeposito.TabVisible:=Princ.DisponibleTipoPago('4');
    TabSheetRetencion.TabVisible:=Princ.DisponibleTipoPago('5');
end;

procedure TCargaDetallePagos.TabSheetEfectivoShow(Sender: TObject);
begin
  inherited;
    efectivo_importe.Value:=documentopago_importe;
    efectivo_importe.OnExit(self);

    efectivo_nombre.SetFocus;

    tipopago_id:='1';
    tipopago_nombre:='EFECTIVO';

end;

procedure TCargaDetallePagos.TabSheetTarjetaShow(Sender: TObject);
begin
  inherited;
    tipopago_id:='2';
    tipopago_nombre:='TARJETA';

    tarjeta_acobrar.Value:=documentopago_importe;

    tarjeta_id.llenarcombo;
    tarjeta_cuotas.Text:='1';
end;

procedure TCargaDetallePagos.TabSheetChequeShow(Sender: TObject);
begin
  inherited;
    tipopago_id:='3';
    tipopago_nombre:='CHEQUE';

    cheque_importe.Value:=documentopago_importe;
    cheque_nombre.SetFocus;
end;

procedure TCargaDetallePagos.TabSheetDepositoShow(Sender: TObject);
begin
  inherited;
    tipopago_id:='4';
    tipopago_nombre:='DEPOSITO';

    deposito_importe.Value:=documentopago_importe;
    deposito_nombre.SetFocus;
end;

procedure TCargaDetallePagos.TabSheetRetencionShow(Sender: TObject);
begin
  inherited;
    tipopago_id:='5';
    tipopago_nombre:='RETENCION';

    retencion_importe.Value:=documentopago_importe;
    retencion_nombre.SetFocus;
end;

procedure TCargaDetallePagos.tarjeta_idSelect(Sender: TObject);
begin
  inherited;
    princ.CalcularRecargoTarjeta(tarjeta_id.codigo,round(tarjeta_cuotas.Value),tarjeta_acobrar.Value);
    tarjeta_porcinteres.Caption:=Princ.ZQRecargoTarjetas.FieldByName('tarjetacuota_recargo').AsString+'% interes';
    tarjeta_importeinteres.Text:=Princ.ZQRecargoTarjetas.FieldByName('importe').AsString;
    tarjeta_importecuota.Text:=Princ.ZQRecargoTarjetas.FieldByName('cuota_importe').AsString;
    if Princ.ZQRecargoTarjetas.FieldByName('tarjetacuota_recargo').AsString='' then
      begin
          tarjeta_porcinteres.Caption:='0% interes';
          tarjeta_importeinteres.Text:='0';
          tarjeta_importecuota.Value:=roundto(tarjeta_acobrar.Value/round(tarjeta_cuotas.Value),-2);
      end;

    tarjeta_cobrado.Value:=tarjeta_acobrar.Value+tarjeta_importeinteres.Value;
end;

end.
