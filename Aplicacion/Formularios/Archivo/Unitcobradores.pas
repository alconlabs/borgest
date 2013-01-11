unit Unitcobradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit;

type
  Tcobradores = class(TForm)
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
    fil_cobrador_domicilio: TEdit;
    fil_cobrador_id: TEdit;
    fil_cobrador_nombre: TEdit;
    fil_cobrador_telefono: TEdit;
    Label1: TLabel;
    cobrador_id: TEdit;
    Label2: TLabel;
    cobrador_nombre: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button6: TButton;
    ZQuery2: TZQuery;
    Label5: TLabel;
    cobrador_domicilio: TEdit;
    cobrador_telefono: TEdit;
    Label4: TLabel;
    cobrador_celular: TEdit;
    Label6: TLabel;
    cobrador_mail: TEdit;
    cobrador_dni: TEdit;
    Label10: TLabel;
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
  cobradores: Tcobradores;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tcobradores.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from cobradores ');
    ZQuery2.SQL.Add('where cobrador_id=:cobrador_id');
    ZQuery2.ParamByName('cobrador_id').AsString:=ZQGrilla.FieldByName('cobrador_id').AsString;
    try
    ZQuery2.ExecSQL;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;
    except
    MessageDlg('El cobrador tiene asociado movimientos asociados.'+#13+#10+'No es posible eliminar.', mtError, [mbOK], 0);


    end;

end;



procedure Tcobradores.FormCreate(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

procedure Tcobradores.modificar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update cobradores set ');
    ZQuery2.sql.add('cobrador_celular=:cobrador_celular, ');
    ZQuery2.sql.add('cobrador_dni=:cobrador_dni, ');
    ZQuery2.sql.add('cobrador_domicilio=:cobrador_domicilio, ');
    ZQuery2.sql.add('cobrador_mail=:cobrador_mail, ');
    ZQuery2.sql.add('cobrador_nombre=:cobrador_nombre, ');
    ZQuery2.sql.add('cobrador_telefono=:cobrador_telefono ');
    ZQuery2.sql.add(' where cobrador_id=:cobrador_id');
    ZQuery2.parambyname('cobrador_celular').asstring:=cobrador_celular.text;
    ZQuery2.parambyname('cobrador_dni').asstring:=cobrador_dni.text;
    ZQuery2.parambyname('cobrador_domicilio').asstring:=cobrador_domicilio.text;
    ZQuery2.parambyname('cobrador_mail').asstring:=cobrador_mail.text;
    ZQuery2.parambyname('cobrador_nombre').asstring:=cobrador_nombre.text;
    ZQuery2.parambyname('cobrador_telefono').asstring:=cobrador_telefono.text;
    ZQuery2.parambyname('cobrador_id').asstring:=cobrador_id.text;
    ZQuery2.ExecSQL;


    Panelabm.Visible:=false;


end;


procedure Tcobradores.agregar;
begin

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into cobradores (cobrador_celular, cobrador_dni, ');
    ZQuery2.sql.add('cobrador_domicilio, cobrador_id, cobrador_mail, ');
    ZQuery2.sql.add('cobrador_nombre, cobrador_telefono) ');
    ZQuery2.sql.add('values (:cobrador_celular, :cobrador_dni, ');
    ZQuery2.sql.add(':cobrador_domicilio, :cobrador_id, :cobrador_mail, ');
    ZQuery2.sql.add(':cobrador_nombre,:cobrador_telefono)');
    ZQuery2.parambyname('cobrador_celular').asstring:=cobrador_celular.text;
    ZQuery2.parambyname('cobrador_dni').asstring:=cobrador_dni.text;
    ZQuery2.parambyname('cobrador_domicilio').asstring:=cobrador_domicilio.text;
    ZQuery2.parambyname('cobrador_id').asstring:=Princ.codigo('cobradores','cobrador_id');
    ZQuery2.parambyname('cobrador_mail').asstring:=cobrador_mail.text;
    ZQuery2.parambyname('cobrador_nombre').asstring:=cobrador_nombre.text;
    ZQuery2.parambyname('cobrador_telefono').asstring:=cobrador_telefono.text;
    ZQuery2.ExecSQL;


    Panelabm.Visible:=false;


end;



function Tcobradores.control:boolean;
var
  error:integer;
begin
    error:=0;

    if cobrador_dni.Text='' then
      error:=4;

    if cobrador_telefono.Text='' then
      error:=3;

    if cobrador_domicilio.Text='' then
      error:=2;

    if cobrador_nombre.Text='' then
      error:=1;



    case error of
        1:begin
              MessageDlg('Ingrese nombre del cobrador', mtError, [mbOK], 0);
              cobrador_nombre.SetFocus;
          end;

        2:begin
              MessageDlg('Ingrese domicilio del cobrador', mtError, [mbOK], 0);
              cobrador_domicilio.SetFocus;
          end;

        3:begin
              MessageDlg('Ingrese telefono del cobrador', mtError, [mbOK], 0);
              cobrador_telefono.SetFocus;
          end;

        4:begin
              MessageDlg('Ingrese cuil del cobrador', mtError, [mbOK], 0);
              cobrador_dni.SetFocus;
          end;

    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;

procedure Tcobradores.Button1Click(Sender: TObject);
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

procedure Tcobradores.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar este Empleado?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;

end;

procedure Tcobradores.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          cobrador_id.Text:=ZQGrilla.FieldByName('cobrador_id').AsString;
          cobrador_nombre.Text:=ZQGrilla.FieldByName('cobrador_nombre').AsString;
          cobrador_domicilio.Text:=ZQGrilla.FieldByName('cobrador_domicilio').AsString;
          cobrador_domicilio.Text:=ZQGrilla.FieldByName('cobrador_domicilio').AsString;
          cobrador_telefono.Text:=ZQGrilla.FieldByName('cobrador_telefono').AsString;
          cobrador_celular.Text:=ZQGrilla.FieldByName('cobrador_celular').AsString;
          cobrador_mail.Text:=ZQGrilla.FieldByName('cobrador_mail').AsString;
          cobrador_dni.Text:=ZQGrilla.FieldByName('cobrador_dni').AsString;
          Panelabm.Visible:=true;
          cobrador_nombre.SetFocus;

      end;

end;

procedure Tcobradores.Button4Click(Sender: TObject);
begin
    abm:=1;
    Panelabm.Visible:=true;
    cobrador_nombre.SetFocus;
    cobrador_id.Text:=princ.codigo('cobradores','cobrador_id');
    cobrador_nombre.Text:='';
    cobrador_domicilio.Text:='';
    cobrador_telefono.Text:='';
    cobrador_celular.Text:='';
    cobrador_mail.Text:='';
    cobrador_dni.Text:='';


end;

procedure Tcobradores.Button5Click(Sender: TObject);
begin
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from cobradores where 1=1';
    if fil_cobrador_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cobrador_id like "%'+fil_cobrador_id.Text+'"';

    if fil_cobrador_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cobrador_nombre like "%'+fil_cobrador_nombre.Text+'%"';

    if fil_cobrador_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cobrador_domicilio like "%'+fil_cobrador_domicilio.Text+'%"';

    if fil_cobrador_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cobrador_telefono like "%'+fil_cobrador_telefono.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by cobrador_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tcobradores.Button6Click(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

end.
