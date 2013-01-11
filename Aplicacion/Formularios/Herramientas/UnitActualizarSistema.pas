unit UnitActualizarSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel;

type
  TABMbase1 = class(TABMbase)
    btnactualizararchivos: TButton;
    link_archivos: TEdit;
    btnactualizardb: TButton;
    link_scriptdb: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ABMbase1: TABMbase1;

implementation

{$R *.dfm}

end.
