unit UnitListaBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel,
  UnitSqlComboBox;

type
  TListaBancos = class(Tlistabase)
    fil_banco_nombre: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    banco_id: TEdit;
    banco_nombre: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  ListaBancos: TListaBancos;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaBancos.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update bancos set ');
    ZQuery2.Sql.Add('banco_nombre=:banco_nombre ');
    ZQuery2.Sql.Add('where banco_id=:banco_id ');
    ZQuery2.ParamByName('banco_nombre').AsString:=banco_nombre.Text;
    ZQuery2.ParamByName('banco_id').AsString:=banco_id.Text;
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;


end;


procedure TListaBancos.agregar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into bancos set ');
    ZQuery2.Sql.Add('banco_nombre=:banco_nombre, ');
    ZQuery2.Sql.Add('banco_id=:banco_id ');
    ZQuery2.ParamByName('banco_nombre').AsString:=banco_nombre.Text;
    ZQuery2.ParamByName('banco_id').AsString:=princ.codigo('bancos','banco_id');
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;
end;



function TListaBancos.control:boolean;
var
  error:integer;
begin
    error:=0;

    if banco_nombre.Text='' then
      error:=1;

    case error of
        1:begin
              MessageDlg('Ingrese nombre del banco', mtError, [mbOK], 0);
              banco_nombre.SetFocus;
          end;

    end;

    if error=0 then
      result:=true
    else
      result:=false;
end;

procedure TListaBancos.eliminar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('delete from bancos ');
    ZQuery2.Sql.Add('where banco_id=:banco_id ');
    ZQuery2.ParamByName('banco_id').AsString:=ZQGrilla.FieldByName('banco_id').AsString;
    ZQuery2.ExecSql;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;


end;

procedure TListaBancos.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar este banco?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;
end;

procedure TListaBancos.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from bancos where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and banco_id like "'+primercaracter+fil_id.Text+'"';

    if fil_banco_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and banco_nombre like "'+primercaracter+fil_banco_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by banco_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaBancos.btnguardarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaBancos.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          banco_id.Text:=ZQGrilla.FieldByName('banco_id').AsString;
          banco_nombre.Text:=ZQGrilla.FieldByName('banco_nombre').AsString;
          Panelabm.Visible:=true;
          banco_nombre.SetFocus;

      end;
end;

procedure TListaBancos.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    banco_id.Text:=princ.codigo('bancos','banco_id');
    banco_nombre.Text:='';
    banco_id.SetFocus;
end;

end.
