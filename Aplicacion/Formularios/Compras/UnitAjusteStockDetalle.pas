unit UnitAjusteStockDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitventadetalle2, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, MoneyEdit, StdCtrls, AdvGlowButton, AdvEdBtn,
  EditCodi, AdvEdit, DBAdvEd, ExtCtrls, AdvPanel;

type
  TAjusteStockDetalle = class(Tventadetalle2)
    procedure btnaceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AjusteStockDetalle: TAjusteStockDetalle;

implementation

{$R *.dfm}

procedure TAjusteStockDetalle.btnaceptarClick(Sender: TObject);
begin
    ventadetalle_total.FloatValue:=1;
    ventadetalle_preciounitario.FloatValue:=1;
  inherited;

end;

end.
