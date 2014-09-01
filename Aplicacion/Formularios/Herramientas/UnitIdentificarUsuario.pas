unit UnitIdentificarUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask;

type
  TIdentificarUsuario = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    ZQSelect: TZQuery;
    ZQExecSQL: TZQuery;
    personal_usuario: TEdit;
    personal_pass: TEdit;
    Label7: TLabel;
    Label11: TLabel;
    Timer1: TTimer;
    lvlerror: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations}
  public
    { Public declarations }
    id:string;
    abm:integer;
    liberar_al_cerrar:boolean;
    personal_id:string;
  end;

var
  IdentificarUsuario: TIdentificarUsuario;

implementation

uses Unitprinc;

{$R *.dfm}


procedure TIdentificarUsuario.btnguardarClick(Sender: TObject);
var
  pass:string;
begin
    ZQSelect.Active:=false;
    if (personal_usuario.Text<>'') and (personal_pass.Text<>'') then
      begin
            begin
                Princ.Encriptador1.AEncriptar:=personal_pass.Text;
                Princ.Encriptador1.Encriptar;
                pass:=Princ.Encriptador1.Encriptado;

                ZQSelect.SQL.Clear;
                ZQSelect.SQL.Add('select * from personal ');
                ZQSelect.SQL.Add('where personal_usuario=:personal_usuario ');
                ZQSelect.SQL.Add('and personal_pass=:personal_pass');
                ZQSelect.parambyname('personal_usuario').asstring:=personal_usuario.Text;
                Princ.Encriptador1.AEncriptar:=personal_pass.Text;
                Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
                Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
                Princ.Encriptador1.Encriptar;
                ZQSelect.parambyname('personal_pass').asstring:=Princ.Encriptador1.Encriptado;
                ZQSelect.Active:=true;
                personal_id:='';
                if ZQSelect.RecordCount>0 then
                  begin
                      personal_id:=ZQSelect.FieldByName('personal_id').AsString;
                      Self.ModalResult:=mrOk;
                  end
                else
                  begin
                      MessageDlg('Datos incorrectos.'+#13+#10+'Verifique usuario y contraseña.', mtError, [mbOK], 0);
                      personal_pass.SetFocus;
                  end;

            end
      end
    else
      Perform(WM_NEXTDLGCTL, 0, 0);

end;

procedure TIdentificarUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if liberar_al_cerrar then
      Self.Free;
end;

procedure TIdentificarUsuario.FormCreate(Sender: TObject);
begin
    abm:=1;
    liberar_al_cerrar:=false;
end;

procedure TIdentificarUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnguardar.Click;
        VK_RETURN:btnguardar.Click;
        
    end;
end;

procedure TIdentificarUsuario.FormShow(Sender: TObject);
begin
    if ParamCount=2 then
      Timer1.Enabled:=true;

    if abm=2 then
      begin
          personal_usuario.Text:=princ.buscar('select personal_usuario from personal where personal_id="'+Princ.personal_id_logueado+'"','personal_usuario');
          personal_usuario.Enabled:=false;
      end;


end;

procedure TIdentificarUsuario.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled:=false;
    self.btnguardar.Click;
end;

end.
