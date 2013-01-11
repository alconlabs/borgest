unit Unitvendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit;

type
  Tvendedores = class(TForm)
    panelgrilla: TAdvPanel;
    panelabm: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ZQGrilla: TZQuery;
    DSCgrilla: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    fil_vendedor_domicilio: TEdit;
    fil_vendedor_id: TEdit;
    fil_vendedor_nombre: TEdit;
    fil_vendedor_telefono: TEdit;
    Label1: TLabel;
    vendedor_id: TEdit;
    Label2: TLabel;
    vendedor_nombre: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button6: TButton;
    ZQuery2: TZQuery;
    Label5: TLabel;
    vendedor_domicilio: TEdit;
    vendedor_telefono: TEdit;
    Label4: TLabel;
    vendedor_celular: TEdit;
    Label6: TLabel;
    vendedor_mail: TEdit;
    Label7: TLabel;
    vendedor_pass: TEdit;
    Label8: TLabel;
    vendedor_pass2: TEdit;
    vendedor_dni: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    vendedor_usuario: TEdit;
    vendedor_vendedor: TCheckBox;
    vendedor_cobrador: TCheckBox;
    Label9: TLabel;
    Label12: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    abm:integer;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  vendedores: Tvendedores;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tvendedores.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from vendedores ');
    ZQuery2.SQL.Add('where vendedor_id=:vendedor_id');
    ZQuery2.ParamByName('vendedor_id').AsString:=ZQGrilla.FieldByName('vendedor_id').AsString;
    try
    ZQuery2.ExecSQL;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;
    except
    MessageDlg('El vendedor tiene asociado movimientos asociados.'+#13+#10+'No es posible eliminar.', mtError, [mbOK], 0);


    end;

end;



procedure Tvendedores.FormCreate(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

procedure Tvendedores.modificar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update vendedores set ');
    ZQuery2.sql.add('vendedor_celular=:vendedor_celular, ');
    ZQuery2.sql.add('vendedor_dni=:vendedor_dni, ');
    ZQuery2.sql.add('vendedor_domicilio=:vendedor_domicilio, ');
    ZQuery2.sql.add('vendedor_mail=:vendedor_mail, ');
    ZQuery2.sql.add('vendedor_nombre=:vendedor_nombre, ');
    ZQuery2.sql.add('vendedor_pass=ENCODE(:vendedor_pass,"510"), ');
    ZQuery2.sql.add('vendedor_telefono=:vendedor_telefono, ');
    ZQuery2.sql.add('vendedor_usuario=:vendedor_usuario, ');
    ZQuery2.sql.add('vendedor_vendedor=:vendedor_vendedor, ');
    ZQuery2.sql.add('vendedor_cobrador=:vendedor_cobrador ');
    ZQuery2.sql.add(' where vendedor_id=:vendedor_id');
    ZQuery2.parambyname('vendedor_celular').asstring:=vendedor_celular.text;
    ZQuery2.parambyname('vendedor_dni').asstring:=vendedor_dni.text;
    ZQuery2.parambyname('vendedor_domicilio').asstring:=vendedor_domicilio.text;
    ZQuery2.parambyname('vendedor_mail').asstring:=vendedor_mail.text;
    ZQuery2.parambyname('vendedor_nombre').asstring:=vendedor_nombre.text;
    ZQuery2.parambyname('vendedor_pass').asstring:=vendedor_pass.text;
    ZQuery2.parambyname('vendedor_telefono').asstring:=vendedor_telefono.text;
    ZQuery2.parambyname('vendedor_usuario').asstring:=vendedor_usuario.text;
    ZQuery2.parambyname('vendedor_id').asstring:=vendedor_id.text;
    ZQuery2.parambyname('vendedor_vendedor').asstring:=booltostr(vendedor_vendedor.Checked);
    ZQuery2.parambyname('vendedor_cobrador').asstring:=booltostr(vendedor_cobrador.Checked);
    ZQuery2.ExecSQL;


    Panelabm.Visible:=false;


end;


procedure Tvendedores.agregar;
begin

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into vendedores (vendedor_celular, vendedor_dni, ');
    ZQuery2.sql.add('vendedor_domicilio, vendedor_id, vendedor_mail, ');
    ZQuery2.sql.add('vendedor_nombre, vendedor_pass, vendedor_telefono, ');
    ZQuery2.sql.add('vendedor_usuario, vendedor_vendedor, vendedor_cobrador) values (:vendedor_celular, :vendedor_dni, ');
    ZQuery2.sql.add(':vendedor_domicilio, :vendedor_id, :vendedor_mail, ');
    ZQuery2.sql.add(':vendedor_nombre, ENCODE(:vendedor_pass,"510"), :vendedor_telefono, ');
    ZQuery2.sql.add(':vendedor_usuario, :vendedor_vendedor, :vendedor_cobrador)');
    ZQuery2.parambyname('vendedor_celular').asstring:=vendedor_celular.text;
    ZQuery2.parambyname('vendedor_dni').asstring:=vendedor_dni.text;
    ZQuery2.parambyname('vendedor_domicilio').asstring:=vendedor_domicilio.text;
    ZQuery2.parambyname('vendedor_id').asstring:=Princ.codigo('vendedores','vendedor_id');
    ZQuery2.parambyname('vendedor_mail').asstring:=vendedor_mail.text;
    ZQuery2.parambyname('vendedor_nombre').asstring:=vendedor_nombre.text;
    ZQuery2.parambyname('vendedor_pass').asstring:=vendedor_pass.text;
    ZQuery2.parambyname('vendedor_telefono').asstring:=vendedor_telefono.text;
    ZQuery2.parambyname('vendedor_usuario').asstring:=vendedor_usuario.text;
    ZQuery2.parambyname('vendedor_vendedor').asstring:=booltostr(vendedor_vendedor.Checked);
    ZQuery2.parambyname('vendedor_cobrador').asstring:=booltostr(vendedor_cobrador.Checked);
    ZQuery2.ExecSQL;


    Panelabm.Visible:=false;


end;



function Tvendedores.control:boolean;
var
  error:integer;
begin
    error:=0;

    if vendedor_pass.Text<>vendedor_pass2.Text then
      error:=8;

    if vendedor_pass2.Text='' then
      error:=7;

    if vendedor_pass.Text='' then
      error:=6;

    if vendedor_usuario.Text='' then
      error:=5;

    if vendedor_dni.Text='' then
      error:=4;

    if vendedor_telefono.Text='' then
      error:=3;

    if vendedor_domicilio.Text='' then
      error:=2;

    if vendedor_nombre.Text='' then
      error:=1;



    case error of
        1:begin
              MessageDlg('Ingrese nombre del vendedor', mtError, [mbOK], 0);
              vendedor_nombre.SetFocus;
          end;

        2:begin
              MessageDlg('Ingrese domicilio del vendedor', mtError, [mbOK], 0);
              vendedor_domicilio.SetFocus;
          end;

        3:begin
              MessageDlg('Ingrese telefono del vendedor', mtError, [mbOK], 0);
              vendedor_telefono.SetFocus;
          end;

        4:begin
              MessageDlg('Ingrese cuil del vendedor', mtError, [mbOK], 0);
              vendedor_dni.SetFocus;
          end;

        5:begin
              MessageDlg('Ingrese nombre de usuario', mtError, [mbOK], 0);
              vendedor_usuario.SetFocus;
          end;

        6:begin
              MessageDlg('Ingrese contraseña', mtError, [mbOK], 0);
              vendedor_pass.SetFocus;
          end;

        7:begin
              MessageDlg('Repita contraseña', mtError, [mbOK], 0);
              vendedor_pass2.SetFocus;
          end;

        8:begin
              MessageDlg('verifique contraseña', mtError, [mbOK], 0);
              vendedor_pass.SetFocus;
          end;

    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;

procedure Tvendedores.Button1Click(Sender: TObject);
begin
    case abm of
        1:begin  //agregar
              if control then
                begin
                    agregar;
                    abm:=0;
                    ZQGrilla.Active:=false;
                    ZQGrilla.Active:=true;

                    Panelabm.Visible:=false;

                end;


          end;
        2:begin  //modificar
              if control then
                begin
                    modificar;
                    abm:=0;
                    ZQGrilla.Active:=false;
                    ZQGrilla.Active:=true;

                    Panelabm.Visible:=false;

                end;

          end;

        3:begin  //eliminar
              if Application.MessageBox('Seguro desea eliminar este proveedor?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
                eliminar;

          end;


    end;

end;

procedure Tvendedores.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar este Empleado?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;

end;

procedure Tvendedores.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          vendedor_id.Text:=ZQGrilla.FieldByName('vendedor_id').AsString;
          vendedor_nombre.Text:=ZQGrilla.FieldByName('vendedor_nombre').AsString;
          vendedor_domicilio.Text:=ZQGrilla.FieldByName('vendedor_domicilio').AsString;
          vendedor_domicilio.Text:=ZQGrilla.FieldByName('vendedor_domicilio').AsString;
          vendedor_telefono.Text:=ZQGrilla.FieldByName('vendedor_telefono').AsString;
          vendedor_celular.Text:=ZQGrilla.FieldByName('vendedor_celular').AsString;
          vendedor_mail.Text:=ZQGrilla.FieldByName('vendedor_mail').AsString;
          vendedor_pass.Text:=ZQGrilla.FieldByName('pass').AsString;
          vendedor_pass2.Text:=ZQGrilla.FieldByName('pass').AsString;
          vendedor_dni.Text:=ZQGrilla.FieldByName('vendedor_dni').AsString;
          vendedor_usuario.Text:=ZQGrilla.FieldByName('vendedor_usuario').AsString;
          vendedor_vendedor.Checked:=strtobool(ZQGrilla.FieldByName('vendedor_vendedor').AsString);
          vendedor_cobrador.Checked:=strtobool(ZQGrilla.FieldByName('vendedor_cobrador').AsString);
          Panelabm.Visible:=true;
          vendedor_nombre.SetFocus;

      end;

end;

procedure Tvendedores.Button4Click(Sender: TObject);
begin
    abm:=1;
    Panelabm.Visible:=true;
    vendedor_nombre.SetFocus;
    vendedor_id.Text:=princ.codigo('vendedores','vendedor_id');
    vendedor_nombre.Text:='';
    vendedor_domicilio.Text:='';
    vendedor_telefono.Text:='';
    vendedor_celular.Text:='';
    vendedor_mail.Text:='';
    vendedor_pass.Text:='';
    vendedor_pass2.Text:='';
    vendedor_dni.Text:='';
    vendedor_usuario.Text:='';
    vendedor_vendedor.Checked:=true;
    vendedor_cobrador.Checked:=false;


end;

procedure Tvendedores.Button5Click(Sender: TObject);
begin
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select *, concat(DECODE(vendedor_pass,"510"),"") as pass from vendedores where 1=1';
    if fil_vendedor_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedor_id like "%'+fil_vendedor_id.Text+'"';

    if fil_vendedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedor_nombre like "%'+fil_vendedor_nombre.Text+'%"';

    if fil_vendedor_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedor_domicilio like "%'+fil_vendedor_domicilio.Text+'%"';

    if fil_vendedor_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedor_telefono like "%'+fil_vendedor_telefono.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by vendedor_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tvendedores.Button6Click(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

end.
