unit UnitNotaDebitoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentocomprabase, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, AdvGlowButton, MoneyEdit, Grids,
  DBGrids, UnitSqlComboBox, ComCtrls, ExtCtrls, AdvPanel;

type
  TNotadeDebitoCompra = class(Tdocumentocomprabase)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotadeDebitoCompra: TNotadeDebitoCompra;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TNotadeDebitoCompra.FormCreate(Sender: TObject);
begin
  tipodocu_nombre:=TIPODOCU_NOTADEBITOCOMPRA;
  inherited;

end;

end.
