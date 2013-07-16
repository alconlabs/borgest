unit UnitNotaPedidoComisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel;

type
  TNotaPedidoComisiones = class(Tdocumentoventabase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotaPedidoComisiones: TNotaPedidoComisiones;

implementation

{$R *.dfm}

end.
