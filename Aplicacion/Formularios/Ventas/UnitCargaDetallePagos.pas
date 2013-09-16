unit UnitCargaDetallePagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, MoneyEdit, Math, UnitSqlComboBox;

type
  TCargaDetallePagos = class(TABMbase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
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
    procedure efectivo_importeExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure btnefectivoClick(Sender: TObject);
    procedure btntarjetaClick(Sender: TObject);
    procedure btnchequeClick(Sender: TObject);
    procedure btndepositoClick(Sender: TObject);
    procedure tarjeta_idSelect(Sender: TObject);
    procedure btnabmtarjetasClick(Sender: TObject);
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

procedure TCargaDetallePagos.btnabmtarjetasClick(Sender: TObject);
begin
  inherited;
    princ.btntarjetas.Click;
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

procedure TCargaDetallePagos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if (Shift=[ssCtrl])then
      begin
          case key of
            49: Self.PageControl1.ActivePage:=TabSheet1;
            50: Self.PageControl1.ActivePage:=TabSheet2;
            51: Self.PageControl1.ActivePage:=TabSheet3;
            52: Self.PageControl1.ActivePage:=TabSheet4;

          end;


      end;



end;

procedure TCargaDetallePagos.TabSheet1Show(Sender: TObject);
begin
  inherited;
    efectivo_importe.Value:=documentopago_importe;
    efectivo_importe.OnExit(self);

    efectivo_nombre.SetFocus;

    tipopago_id:='1';
    tipopago_nombre:='EFECTIVO';

end;

procedure TCargaDetallePagos.TabSheet2Show(Sender: TObject);
begin
  inherited;
    tipopago_id:='2';
    tipopago_nombre:='TARJETA';

    tarjeta_acobrar.Value:=documentopago_importe;

    tarjeta_id.llenarcombo;
end;

procedure TCargaDetallePagos.TabSheet3Show(Sender: TObject);
begin
  inherited;
    tipopago_id:='3';
    tipopago_nombre:='CHEQUE';

    cheque_importe.Value:=documentopago_importe;
    cheque_nombre.SetFocus;
end;

procedure TCargaDetallePagos.TabSheet4Show(Sender: TObject);
begin
  inherited;
    tipopago_id:='4';
    tipopago_nombre:='DEPOSITO';

    deposito_importe.Value:=documentopago_importe;
    deposito_nombre.SetFocus;
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
          tarjeta_importecuota.Text:=Princ.ZQRecargoTarjetas.FieldByName('cuota_importe').AsString;
      end;

    tarjeta_cobrado.Value:=tarjeta_acobrar.Value+tarjeta_importeinteres.Value;
end;

end.
