unit UnitRoles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TRoles = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    rol_codi: TDBAdvEdit;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    btnguardar: TButton;
    btncancelar: TButton;
    rol_nombre: TEdit;
    Label4: TLabel;
    ZQSelect: TZQuery;
    ZQExecSql: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btncancelarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;

  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  Roles: TRoles;

implementation

uses UnitPrinc;

{$R *.dfm}


procedure TRoles.eliminar;
begin
    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Delete from roles ');
    ZQExecSql.sql.add('where rol_codi=:rol_codi ');
    ZQExecSql.ParamByName('rol_codi').AsString:=id;
    ZQExecSql.ExecSQL;

    close;

end;


procedure TRoles.modificar;
begin
    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Update roles set ');
    ZQExecSql.sql.add('rol_nombre=:rol_nombre ');
    ZQExecSql.sql.add('where rol_codi=:rol_codi ');
    ZQExecSql.ParamByName('rol_codi').AsString:=id;
    ZQExecSql.ParamByName('rol_nombre').AsString:=rol_nombre.Text;
    ZQExecSql.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    close;

end;

procedure TRoles.btncancelarClick(Sender: TObject);
begin
 if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure TRoles.btnguardarClick(Sender: TObject);
begin
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
              if (MessageDlg('Seguro desea eliminar este Rol?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                eliminar;


          end;
    end;

end;

function TRoles.control:boolean;
var
  error:integer;
  rol_codi_nombre:string;
begin
 error:=0;

    if abm=1 then
      begin
          rol_codi_nombre:=Princ.buscar('select rol_codi from roles where rol_nombre="'+rol_nombre.Text+'"','rol_codi');
          if rol_codi_nombre<>'' then
            begin
                error:=3;
                if (MessageDlg('Ya existe un Rol con el mismo nombre.'+#13+#10+'Desea continuar?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                  error:=0;
            end;
      end;

    if error=0 then
      result:=true
    else
      result:=false;
end;


procedure TRoles.agregar;
begin
    id:=Princ.codigo('roles','rol_codi');

    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Insert into roles (rol_codi, rol_nombre) ');
    ZQExecSql.sql.add('values (:rol_codi, :rol_nombre) ');
    ZQExecSql.ParamByName('rol_codi').AsString:=id;
    ZQExecSql.ParamByName('rol_nombre').AsString:=rol_nombre.Text;
    ZQExecSql.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    close;

end;


procedure TRoles.FormCreate(Sender: TObject);
begin
    rol_codi.Text:=Princ.codigo('roles','rol_codi');
    rol_nombre.Text:='';
end;

procedure TRoles.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQSelect.Active:=false;
          ZQSelect.ParamByName('rol_codi').AsString:=id;
          ZQSelect.Active:=true;


      end;

end;

procedure TRoles.ZQSelectAfterOpen(DataSet: TDataSet);
begin
    rol_codi.Text:=ZQSelect.FieldByName('rol_codi').AsString;
    rol_nombre.Text:=ZQSelect.FieldByName('rol_nombre').AsString;
end;

end.
