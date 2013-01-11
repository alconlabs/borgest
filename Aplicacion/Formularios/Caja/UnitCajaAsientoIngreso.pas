unit UnitCajaAsientoIngreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitCajaAsiento, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, UnitSqlComboBox, MoneyEdit, ComCtrls, ExtCtrls, AdvPanel;

type
  TCajaAsientoIngreso = class(TCajaAsiento)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CajaAsientoIngreso: TCajaAsientoIngreso;

implementation

{$R *.dfm}

end.
