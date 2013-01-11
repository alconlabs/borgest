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

end.
