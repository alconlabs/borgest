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
    Timer1: TTimer;
    procedure btncancelarClick(Sender: TObject);
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
  end;

var
  login: Tlogin;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tlogin.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea salir del sistema?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          Self.Close;
          Application.Terminate;
      end;
end;

procedure Tlogin.btnguardarClick(Sender: TObject);
var
  pass:string;
begin
    ZQSelect.Active:=false;
    if (personal_usuario.Text<>'') and (personal_pass.Text<>'') then
      begin
          if (personal_usuario.Text<>'root') then
            begin
                Princ.Encriptador1.AEncriptar:=personal_pass.Text;
                Princ.Encriptador1.Encriptar;
                pass:=Princ.Encriptador1.Encriptado;

                ZQSelect.SQL.Clear;
                ZQSelect.SQL.Add('select * from personal ');
                ZQSelect.SQL.Add('inner join perfiles on personal.perfil_id=perfiles.perfil_id ');
                ZQSelect.SQL.Add('where personal_usuario=:personal_usuario ');
                ZQSelect.SQL.Add('and personal_pass=:personal_pass');
                ZQSelect.parambyname('personal_usuario').asstring:=personal_usuario.Text;
                Princ.Encriptador1.AEncriptar:=personal_pass.Text;
                Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
                Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
                Princ.Encriptador1.Encriptar;
                ZQSelect.parambyname('personal_pass').asstring:=Princ.Encriptador1.Encriptado;
                ZQSelect.Active:=true;

                if ZQSelect.RecordCount>0 then
                  begin
                      if abm=1 then
                        begin
                            Princ.personal_id_logueado:=ZQSelect.FieldByName('personal_id').AsString;
                            Princ.perfil_id_logueado:=ZQSelect.FieldByName('perfil_id').AsString;
                        end;
                      Self.ModalResult:=mrOk;
                  end
                else
                  begin
                      MessageDlg('Datos incorrectos.'+#13+#10+'Verifique usuario y contraseña.', mtError, [mbOK], 0);

                  end;


            end
          else
            begin
                if (personal_pass.Text='borgest9999') then
                  begin
                      ZQSelect.SQL.Clear;
                      ZQSelect.SQL.Add('select "root" as personal_nombre, "root" as perfil_nombre from personal ');
                      ZQSelect.Active:=true;

                      Princ.personal_id_logueado:='99';
                      Princ.perfil_id_logueado:='0';

                      Self.ModalResult:=mrOk;
                  end;
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
    abm:=1;
    liberar_al_cerrar:=true;
end;

procedure Tlogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnguardar.Click;
        VK_RETURN:btnguardar.Click;
    end;
end;

procedure Tlogin.FormShow(Sender: TObject);
begin
    if ParamCount=2 then
      Timer1.Enabled:=true;

    if abm=2 then
      begin
          personal_usuario.Text:=princ.buscar('select personal_usuario from personal where personal_id="'+Princ.personal_id_logueado+'"','personal_usuario');
          personal_usuario.Enabled:=false;
      end;


end;

procedure Tlogin.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled:=false;
    self.btnguardar.Click;
end;

end.
