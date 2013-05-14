unit UnitObservaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, GTBMemo, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel;

type
  Tobservaciones = class(TABMbase)
    documentoventa_observacion: TGTBMemo;
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  observaciones: Tobservaciones;

implementation

{$R *.dfm}

procedure Tobservaciones.btnguardarClick(Sender: TObject);
begin
  inherited;
    Self.ModalResult:=mrOk;
end;

end.
