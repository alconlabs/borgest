unit UnitNotaCreditoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentocomprabase, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, AdvGlowButton, MoneyEdit, Grids,
  DBGrids, UnitSqlComboBox, ComCtrls, ExtCtrls, AdvPanel;

type
  TNotadeCreditoCompra = class(Tdocumentocomprabase)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotadeCreditoCompra: TNotadeCreditoCompra;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TNotadeCreditoCompra.FormCreate(Sender: TObject);
begin
  tipodocu_nombre:=TIPODOCU_NOTACREDITOCOMPRA;

  inherited;

end;

end.
