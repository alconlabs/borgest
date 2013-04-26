unit UnitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask;

type
  Tlogin = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    ZQSelect: TZQuery;
    ZQExecSQL: TZQuery;
    personal_usuario: TEdit;
    personal_pass: TEdit;
    Label7: TLabel;
    Label11: TLabel;
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
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
  login: Tlogin;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tlogin.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tlogin.btnguardarClick(Sender: TObject);
var
  pass:string;
begin
    ZQSelect.Active:=false;
    if (personal_usuario.Text<>'') and (personal_pass.Text<>'') then
      begin
//          Princ.Encriptador1.AEncriptar:=personal_pass.Text;
//          Princ.Encriptador1.Encriptar;
//          pass:=Princ.Encriptador1.Encriptado;


          ZQSelect.SQL.Text:='select * from personal where personal_usuario="'+personal_usuario.Text+'" and personal_pass="'+pass+'"';
          ZQSelect.Active:=true;

          if ZQSelect.RecordCount>0 then
            begin
                Princ.personal_id_logueado:=ZQSelect.FieldByName('personal_id').AsString;
                Princ.perfil_id_logueado:=ZQSelect.FieldByName('perfil_id').AsString;

                Self.ModalResult:=mrOk;
            end;
      end;

end;

procedure Tlogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if liberar_al_cerrar then
      Self.Free;
end;

procedure Tlogin.FormCreate(Sender: TObject);
begin
    liberar_al_cerrar:=true;
end;

procedure Tlogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnguardar.Click;
    end;
end;

end.
