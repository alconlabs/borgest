unit UnitListaMarcas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaMarcas = class(Tlistabase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaMarcas: TListaMarcas;

implementation

{$R *.dfm}

end.
