unit UnitCargarPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MoneyEdit;

type
  TCargarPagos = class(TForm)
    panelgrilla: TAdvPanel;
    Label5: TLabel;
    documentopago_importe: TMoneyEdit;
    documentopago_nombre: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    tipopago_id: TSqlComboBox;
    btnguardar: TButton;
    btncancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    total_cobrar:real;
    total_pagado:real;
  end;

var
  CargarPagos: TCargarPagos;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure TCargarPagos.FormCreate(Sender: TObject);
begin
    tipopago_id.llenarcombo;
end;

procedure TCargarPagos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F9:btnguardar.Click;
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

end.
