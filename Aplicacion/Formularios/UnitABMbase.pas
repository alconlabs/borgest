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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations}
  public
    { Public declarations }
    id:string;
    abm:integer;
    liberar_al_cerrar:boolean;
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
    if liberar_al_cerrar then
      Self.Free;

    Application.BringToFront;
end;

procedure TABMbase.FormCreate(Sender: TObject);
begin
    liberar_al_cerrar:=true;
end;

procedure TABMbase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    
    case key of
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
        VK_F9:if btnguardar.Enabled then btnguardar.Click;
    end;
end;

end.
