unit UnitLiquidacionBorradorDebCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, MoneyEdit;

type
  TLiquidacionBorradorDebCred = class(TABMbase)
    liquidacionborradordebcred_importe: TMoneyEdit;
    liquidacionborradordebcred_descripcion: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LiquidacionBorradorDebCred: TLiquidacionBorradorDebCred;

implementation

{$R *.dfm}

procedure TLiquidacionBorradorDebCred.btnguardarClick(Sender: TObject);
begin
  inherited;
    if liquidacionborradordebcred_importe.Value<>0 then
      self.ModalResult:=mrOk;

end;

procedure TLiquidacionBorradorDebCred.FormShow(Sender: TObject);
begin
  inherited;
    self.liberar_al_cerrar:=false;
end;

end.
