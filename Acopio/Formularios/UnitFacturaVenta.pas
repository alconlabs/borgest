unit UnitFacturaVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDocumentoBase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, UnitSqlComboBox, ComCtrls, ExtCtrls,
  AdvPanel, Grids, DBGrids, Math;

type
  TFacturaVenta = class(TDocumentoBase)
    procedure btnguardarClick(Sender: TObject);
    procedure documento_neto21Exit(Sender: TObject);

  private
    { Private declarations }
    documento_saldo:real;
    procedure calculartotal(posicion:integer);
  public
    { Public declarations }
  end;

var
  FacturaVenta: TFacturaVenta;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TFacturaVenta.calculartotal(posicion:integer);
begin
    if posicion<1 then
      documento_iva21.Text:=floattostr(roundto(documento_neto21.Value*21/100,-2));

    if posicion<3 then
      documento_iva105.Text:=floattostr(roundto(documento_neto105.Value*10.5/100,-2));

    if posicion<5 then
      documento_iva27.Text:=floattostr(roundto(documento_neto27.Value*27/100,-2));

    if posicion<13 then
      documento_total.Text:=floattostr(roundto(documento_neto21.Value+
                                             documento_iva21.Value+
                                             documento_neto105.Value+
                                             documento_iva105.Value+
                                             documento_neto27.Value+
                                             documento_iva27.Value+
                                             documento_nogravado.Value+
                                             documento_ivaret.Value+
                                             documento_ivaperc.Value+
                                             documento_dgrret.Value+
                                             documento_dgrperc.Value+
                                             documento_otrosimpuestos.Value,-2));
end;

procedure TFacturaVenta.documento_neto21Exit(Sender: TObject);
begin
  inherited;
    calculartotal((Sender as twincontrol).TabOrder);
end;

procedure TFacturaVenta.btnguardarClick(Sender: TObject);
begin
    calculartotales;
    self.GuardarEnDataset;

  inherited;

end;

end.
