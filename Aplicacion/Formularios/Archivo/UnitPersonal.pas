unit UnitPersonal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Buttons;

type
  Tpersonal = class(Tlistabase)
    Label1: TLabel;
    personal_id: TGTBEdit;
    Label5: TLabel;
    personal_nombre: TGTBEdit;
    Label2: TLabel;
    personal_domicilio: TGTBEdit;
    Label3: TLabel;
    personal_telefono: TGTBEdit;
    personal_celular: TGTBEdit;
    Label4: TLabel;
    Label6: TLabel;
    personal_mail: TGTBEdit;
    fil_personal_nombre: TGTBEdit;
    fil_personal_domicilio: TGTBEdit;
    fil_personal_telefono: TGTBEdit;
    personal_usuario: TEdit;
    Label11: TLabel;
    Label7: TLabel;
    personal_pass: TEdit;
    personal_pass2: TEdit;
    Label8: TLabel;
    Label21: TLabel;
    perfil_id: TSqlComboBox;
    lblpersonal_ivaliquidaciones: TLabel;
    personal_ivaliquidaciones: TDBAdvEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    function control:boolean;
  public
    { Public declarations }
  end;

var
  personal: Tpersonal;

implementation

Uses Unitprinc;

{$R *.dfm}


function Tpersonal.control:boolean;
var
  error:integer;
  personal_id_usuario_existente:string;
begin
    error:=0;

    if personal_pass.Text='' then
      error:=1;

    if personal_pass.Text<>personal_pass2.Text then
      error:=2;

    personal_id_usuario_existente:=Princ.buscar('select personal_id from personal where personal_usuario="'+personal_usuario.Text+'"','personal_id');


    if personal_id_usuario_existente<>'' then
      begin
          if abm=ABM_AGREGAR then
            begin
                if personal_id_usuario_existente<>'' then
                  error:=3;
            end;
          if abm=ABM_MODIFICAR then
            begin
                if personal_id_usuario_existente<>personal_id.Text then
                  error:=3;
            end;
      end;


    if personal_usuario.Text='' then
      error:=4;


    case error of
        1:begin
              MessageDlg('Ingrese una contraseņa', mtError, [mbOK], 0);
          end;

        2:begin
              MessageDlg('Las contraseņa repetida no coincide con la contraseņa', mtError, [mbOK], 0);
          end;

        3:begin
              MessageDlg('Nombre de usuario repetido. Utilice otro nombre de usuario', mtError, [mbOK], 0);
          end;

        4:begin
              MessageDlg('Ingrese nombre de usuario', mtError, [mbOK], 0);
          end;


    end;

    result:=error=0;
end;


procedure Tpersonal.agregar;
begin
    id:=princ.codigo('personal','personal_id');
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into personal (personal_id, personal_nombre, personal_domicilio, ');
    ZQuery2.sql.add('personal_telefono, personal_mail, personal_celular, personal_usuario, personal_pass, perfil_id, personal_ivaliquidaciones) ');
    ZQuery2.sql.add('values (:personal_id, :personal_nombre, :personal_domicilio, ');
    ZQuery2.sql.add(':personal_telefono, :personal_mail, :personal_celular, :personal_usuario, :personal_pass, :perfil_id, :personal_ivaliquidaciones) ');
    ZQuery2.parambyname('personal_id').asstring:=id;
    ZQuery2.parambyname('personal_nombre').asstring:=personal_nombre.text;
    ZQuery2.parambyname('personal_domicilio').asstring:=personal_domicilio.text;
    ZQuery2.parambyname('personal_telefono').asstring:=personal_telefono.text;
    ZQuery2.parambyname('personal_celular').asstring:=personal_celular.Text;
    ZQuery2.parambyname('personal_mail').asstring:=personal_mail.Text;
    ZQuery2.parambyname('personal_usuario').asstring:=personal_usuario.Text;
    Princ.Encriptador1.AEncriptar:=personal_pass.Text;
    Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
    Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
    Princ.Encriptador1.Encriptar;
    ZQuery2.parambyname('personal_pass').asstring:=Princ.Encriptador1.Encriptado;
//    ZQuery2.parambyname('personal_pass').asstring:='';
    ZQuery2.parambyname('perfil_id').asstring:=perfil_id.codigo;
    ZQuery2.parambyname('personal_ivaliquidaciones').asstring:=personal_ivaliquidaciones.Text;
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;


end;


procedure Tpersonal.modificar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('update personal set ');
    ZQuery2.sql.add('personal_nombre=:personal_nombre, ');
    ZQuery2.sql.add('personal_domicilio=:personal_domicilio, ');
    ZQuery2.sql.add('personal_telefono=:personal_telefono, ');
    ZQuery2.sql.add('personal_celular=:personal_celular, ');
    ZQuery2.sql.add('personal_mail=:personal_mail, ');
    ZQuery2.sql.add('personal_usuario=:personal_usuario, ');
    ZQuery2.sql.add('personal_pass=:personal_pass, ');
    ZQuery2.sql.add('perfil_id=:perfil_id, ');
    ZQuery2.sql.add('personal_ivaliquidaciones=:personal_ivaliquidaciones ');
    ZQuery2.sql.add('where personal_id=:personal_id');
    ZQuery2.parambyname('personal_id').asstring:=id;
    ZQuery2.parambyname('personal_nombre').asstring:=personal_nombre.text;
    ZQuery2.parambyname('personal_domicilio').asstring:=personal_domicilio.text;
    ZQuery2.parambyname('personal_telefono').asstring:=personal_telefono.text;
    ZQuery2.parambyname('personal_celular').asstring:=personal_celular.Text;
    ZQuery2.parambyname('personal_mail').asstring:=personal_mail.Text;
    ZQuery2.parambyname('personal_usuario').asstring:=personal_usuario.Text;
    Princ.Encriptador1.AEncriptar:=personal_pass.Text;
    Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
    Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
    Princ.Encriptador1.Encriptar;
    ZQuery2.parambyname('personal_pass').asstring:=Princ.Encriptador1.Encriptado;
    ZQuery2.parambyname('perfil_id').asstring:=perfil_id.codigo;
    ZQuery2.parambyname('personal_ivaliquidaciones').asstring:=personal_ivaliquidaciones.Text;
//    ZQuery2.parambyname('personal_pass').asstring:='';
    ZQuery2.ExecSQL;




    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;



procedure Tpersonal.eliminar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('delete from personal where personal_id=:personal_id');
    ZQuery2.parambyname('personal_id').asstring:=id;
    ZQuery2.ExecSQL;

    Panelabm.Visible:=false;
    btnfiltrar.Click;

end;


procedure Tpersonal.FormShow(Sender: TObject);
begin
  inherited;
    lblpersonal_ivaliquidaciones.Visible:=Princ.GetConfiguracion('LIQUIDACIONVENDEDOR')='-1';
    personal_ivaliquidaciones.Visible:=Princ.GetConfiguracion('LIQUIDACIONVENDEDOR')='-1';

end;

procedure Tpersonal.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if (MessageDlg('Seguro desea eliminar este vendedor?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
            eliminar;
      end;
end;

procedure Tpersonal.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from personal where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_id like "%'+fil_id.Text+'%"';

    if fil_personal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_nombre like "%'+fil_personal_nombre.Text+'%"';

    if fil_personal_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_domicilio like "%'+fil_personal_domicilio.Text+'%"';

    if fil_personal_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_telefono like "%'+fil_personal_telefono.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by personal_nombre';
    ZQGrilla.Active:=true;
end;

procedure Tpersonal.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin
              if control then
                agregar;
          end;

        2:begin
              if control then
                modificar;
          end;

        3:begin
              if (MessageDlg('Seguro desea eliminar esta sucursal?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;

          end;
    end;
end;

procedure Tpersonal.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=2;
                Panelabm.Visible:=true;
                personal_id.Text:=ZQGrilla.FieldByName('personal_id').AsString;
                personal_nombre.Text:=ZQGrilla.FieldByName('personal_nombre').AsString;
                personal_domicilio.Text:=ZQGrilla.FieldByName('personal_domicilio').AsString;
                personal_telefono.Text:=ZQGrilla.FieldByName('personal_telefono').AsString;
                personal_celular.Text:=ZQGrilla.FieldByName('personal_celular').AsString;
                personal_mail.Text:=ZQGrilla.FieldByName('personal_mail').AsString;
                personal_usuario.Text:=ZQGrilla.FieldByName('personal_usuario').AsString;
                Princ.Encriptador1.ADesencriptar:=ZQGrilla.FieldByName('personal_pass').AsString;
                Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
                Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
                Princ.Encriptador1.Desencriptar;
                personal_pass.Text:=Princ.Encriptador1.Desencriptado;
                personal_pass2.Text:=Princ.Encriptador1.Desencriptado;
                perfil_id.llenarcombo;
                perfil_id.Buscar(ZQGrilla.FieldByName('perfil_id').AsString);
                personal_ivaliquidaciones.Text:=ZQGrilla.FieldByName('personal_ivaliquidaciones').AsString;

                personal_nombre.SetFocus;
            end;

      end;
end;

procedure Tpersonal.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    personal_id.Text:=princ.codigo('personal','personal_id');
    personal_nombre.Text:='';
    personal_domicilio.Text:='';
    personal_telefono.Text:='';
    personal_celular.Text:='';
    personal_mail.Text:='';
    personal_usuario.Text:='';
    personal_pass.Text:='';
    personal_pass2.Text:='';
    perfil_id.llenarcombo;
    perfil_id.ItemIndex:=0;
    personal_ivaliquidaciones.Text:='0';

end;

end.
