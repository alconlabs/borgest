unit UnitConceptoDebCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitProductos, DB, MQuery, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids, AdvEdit, DBAdvEd, StdCtrls, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel;

type
  TConceptoDebCred = class(Tproductos)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConceptoDebCred: TConceptoDebCred;

implementation

{$R *.dfm}

end.
