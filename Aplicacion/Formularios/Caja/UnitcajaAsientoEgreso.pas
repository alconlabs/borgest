unit UnitcajaAsientoEgreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitCajaAsiento, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, UnitSqlComboBox, MoneyEdit, ComCtrls, ExtCtrls, AdvPanel;

type
  TCajaAsientoEgreso = class(TCajaAsiento)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CajaAsientoEgreso: TCajaAsientoEgreso;

implementation

{$R *.dfm}

end.
