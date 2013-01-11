unit UnitProgresoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, XiProgressBar, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ExtCtrls, AdvPanel;

type
  TProgresoBase = class(TABMbase)
    XiProgressBar1: TXiProgressBar;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    max:integer;
    pos:integer;

  end;

var
  ProgresoBase: TProgresoBase;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TProgresoBase.FormCreate(Sender: TObject);
begin
  inherited;
    XiProgressBar1.Max:=Princ.ProgressMax;
end;

end.
