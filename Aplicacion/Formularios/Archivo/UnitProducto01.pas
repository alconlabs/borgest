unit UnitProducto01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitProductos, DB, MQuery, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, AdvEdit, DBAdvEd, StdCtrls, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel;

type
  Tproducto01 = class(Tproductos)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  producto01: Tproducto01;

implementation

{$R *.dfm}

procedure Tproducto01.FormShow(Sender: TObject);
begin
  inherited;
    producto_codigobarras.SetFocus;
end;

end.
