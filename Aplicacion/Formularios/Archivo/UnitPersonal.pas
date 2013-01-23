unit UnitPersonal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

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
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
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
begin
    error:=0;


    result:=error=0;
end;


procedure Tpersonal.agregar;
begin
    id:=princ.codigo('personal','personal_id');
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into personal (personal_id, personal_nombre, personal_domicilio, ');
    ZQuery2.sql.add('personal_telefono, personal_mail, personal_celular) ');
    ZQuery2.sql.add('values (:personal_id, :personal_nombre, :personal_domicilio, ');
    ZQuery2.sql.add(':personal_telefono, :personal_mail, :personal_celular) ');
    ZQuery2.parambyname('personal_id').asstring:=id;
    ZQuery2.parambyname('personal_nombre').asstring:=personal_nombre.text;
    ZQuery2.parambyname('personal_domicilio').asstring:=personal_domicilio.text;
    ZQuery2.parambyname('personal_telefono').asstring:=personal_telefono.text;
    ZQuery2.parambyname('personal_celular').asstring:=personal_celular.Text;
    ZQuery2.parambyname('personal_mail').asstring:=personal_mail.Text;
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
    ZQuery2.sql.add('personal_mail=:personal_mail ');
    ZQuery2.sql.add('where personal_id=:personal_id');
    ZQuery2.parambyname('personal_id').asstring:=id;
    ZQuery2.parambyname('personal_nombre').asstring:=personal_nombre.text;
    ZQuery2.parambyname('personal_domicilio').asstring:=personal_domicilio.text;
    ZQuery2.parambyname('personal_telefono').asstring:=personal_telefono.text;
    ZQuery2.parambyname('personal_celular').asstring:=personal_celular.Text;
    ZQuery2.parambyname('personal_mail').asstring:=personal_mail.Text;
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
end;

end.
