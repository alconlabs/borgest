unit UnitNotaPedidoComisionesDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitNotaPedidoDetalle, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, MoneyEdit, StdCtrls, AdvGlowButton, AdvEdBtn,
  EditCodi, AdvEdit, DBAdvEd, ExtCtrls, AdvPanel;

type
  TNotapedidoComisionesDetalle = class(TNotapedidoDetalle)
    procedure ventadetalle_preciounitarioExit(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotapedidoComisionesDetalle: TNotapedidoComisionesDetalle;

implementation

{$R *.dfm}

procedure TNotapedidoComisionesDetalle.btnaceptarClick(Sender: TObject);
begin
  inherited;
    ZQDocumentoventadetalles.Edit;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString:=ventadetalle_total.Text;
    ZQDocumentoventadetalles.Post;
end;

procedure TNotapedidoComisionesDetalle.ventadetalle_preciounitarioExit(
  Sender: TObject);
begin
    ventadetalle_total.FloatValue:=ventadetalle_preciounitario.FloatValue*ventadeta_cantidad.Value;

end;

end.
