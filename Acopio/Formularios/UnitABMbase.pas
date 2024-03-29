unit UnitABMbase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask;

type
  TABMbase = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    ZQSelect: TZQuery;
    ZQExecSQL: TZQuery;
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  protected
    { Protected declarations}
  public
    { Public declarations }
    id:string;
    abm:integer;
  end;

var
  ABMbase: TABMbase;

implementation

uses Unitprinc;

{$R *.dfm}


procedure TABMbase.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure TABMbase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure TABMbase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnguardar.Click;
    end;
end;

end.
