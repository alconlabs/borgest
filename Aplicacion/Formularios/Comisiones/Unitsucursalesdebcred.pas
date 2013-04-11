unit Unitsucursalesdebcred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, UnitSqlComboBox,
  MoneyEdit, ComCtrls;

type
  Tsucursalesdebcred = class(Tlistabase)
    fil_sucursaldebcred_fecha: TEdit;
    fil_sucursal_nombre: TEdit;
    fil_sucursaldebcred_importe: TEdit;
    fil_sucursaldebcred_tipo: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    sucursaldebcred_estado: TLabel;
    Label4: TLabel;
    sucursaldebcred_tipo: TComboBox;
    sucursaldebcred_fecha: TDateTimePicker;
    sucursaldebcred_descripcion: TEdit;
    sucursaldebcred_importe: TMoneyEdit;
    sucursal_id: TSqlComboBox;
    sucursaldebcred_id: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  sucursalesdebcred: Tsucursalesdebcred;

implementation

Uses UnitPrinc;

{$R *.dfm}

function Tsucursalesdebcred.Control:boolean;
var
  error:integer;
begin
    error:=0;

    result:=error=0;
end;


procedure Tsucursalesdebcred.eliminar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from sucursalesdebcred');
    ZQuery2.sql.add(' where sucursaldebcred_id=:sucursaldebcred_id');
    ZQuery2.parambyname('sucursaldebcred_id').asstring:=ZQGrilla.FieldByName('sucursaldebcred_id').AsString;
    ZQuery2.ExecSQL;

end;

procedure Tsucursalesdebcred.FormShow(Sender: TObject);
begin
  inherited;
    btnanular.Visible:=false;
end;

procedure Tsucursalesdebcred.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update sucursalesdebcred set ');
    ZQuery2.Sql.Add('sucursal_id=:sucursal_id, ');
    ZQuery2.Sql.Add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
    ZQuery2.Sql.Add('sucursaldebcred_importe=:sucursaldebcred_importe, ');
    ZQuery2.Sql.Add('sucursaldebcred_tipo=:sucursaldebcred_tipo, ');
    ZQuery2.Sql.Add('sucursaldebcred_descripcion=:sucursaldebcred_descripcion, ');
    ZQuery2.Sql.Add('sucursaldebcred_fecha=:sucursaldebcred_fecha ');
    ZQuery2.Sql.Add('where sucursaldebcred_id=:sucursaldebcred_id ');
    ZQuery2.ParamByName('sucursal_id').AsString:=sucursal_id.codigo;
    ZQuery2.ParamByName('liquidacionsucursal_id').AsString:='0';
    ZQuery2.ParamByName('sucursaldebcred_importe').AsString:=sucursaldebcred_importe.Text;
    ZQuery2.ParamByName('sucursaldebcred_tipo').AsString:=sucursaldebcred_tipo.Text;
    ZQuery2.ParamByName('sucursaldebcred_descripcion').AsString:=sucursaldebcred_descripcion.Text;
    ZQuery2.ParamByName('sucursaldebcred_fecha').AsString:=formatdatetime('yyyy-mm-dd',sucursaldebcred_fecha.Date);
    ZQuery2.ParamByName('sucursaldebcred_id').AsString:=sucursaldebcred_id.Text;
    ZQuery2.ExecSql;



end;


procedure Tsucursalesdebcred.agregar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into sucursalesdebcred set ');
    ZQuery2.Sql.Add('sucursal_id=:sucursal_id, ');
    ZQuery2.Sql.Add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
    ZQuery2.Sql.Add('sucursaldebcred_importe=:sucursaldebcred_importe, ');
    ZQuery2.Sql.Add('sucursaldebcred_tipo=:sucursaldebcred_tipo, ');
    ZQuery2.Sql.Add('sucursaldebcred_descripcion=:sucursaldebcred_descripcion, ');
    ZQuery2.Sql.Add('sucursaldebcred_fecha=:sucursaldebcred_fecha, ');
    ZQuery2.Sql.Add('sucursaldebcred_id=:sucursaldebcred_id ');
    ZQuery2.ParamByName('sucursal_id').AsString:=sucursal_id.codigo;
    ZQuery2.ParamByName('liquidacionsucursal_id').AsString:='0';
    ZQuery2.ParamByName('sucursaldebcred_importe').AsString:=sucursaldebcred_importe.Text;
    ZQuery2.ParamByName('sucursaldebcred_tipo').AsString:=sucursaldebcred_tipo.Text;
    ZQuery2.ParamByName('sucursaldebcred_descripcion').AsString:=sucursaldebcred_descripcion.Text;
    ZQuery2.ParamByName('sucursaldebcred_fecha').AsString:=formatdatetime('yyyy-mm-dd',sucursaldebcred_fecha.Date);
    ZQuery2.ParamByName('sucursaldebcred_id').AsString:=Princ.codigo('sucursalesdebcred','sucursaldebcred_id');
    ZQuery2.ExecSql;



end;

procedure Tsucursalesdebcred.btneliminarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          eliminar;

          btnfiltrar.Click;


      end;
end;

procedure Tsucursalesdebcred.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from sucursalesdebcred '+
                       'inner join sucursales on sucursalesdebcred.sucursal_id=sucursales.sucursal_id '+
                       'where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursaldebcred_id like "%'+fil_id.Text+'"';

    if fil_sucursaldebcred_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursaldebcred_fecha like "%'+fil_sucursaldebcred_fecha.Text+'%"';

    if fil_sucursal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_nombre like "%'+fil_sucursal_nombre.Text+'%"';

    if fil_sucursaldebcred_importe.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursaldebcred_importe like "%'+fil_sucursaldebcred_importe.Text+'%"';

    if fil_sucursaldebcred_tipo.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursaldebcred_tipo like "%'+fil_sucursaldebcred_tipo.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by sucursaldebcred_fecha, sucursal_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tsucursalesdebcred.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin  //agregar
              if control then
                begin
                    abm:=0;
                    agregar;
                    Panelabm.Visible:=false;

                end;


          end;
        2:begin  //modificar
              if control then
                begin
                    modificar;
                    abm:=0;

                    Panelabm.Visible:=false;

                end;

          end;

    end;
end;

procedure Tsucursalesdebcred.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          sucursal_id.llenarcombo;
          sucursaldebcred_id.Text:=ZQGrilla.FieldByName('sucursaldebcred_id').AsString;
          sucursaldebcred_fecha.Date:=ZQGrilla.FieldByName('sucursaldebcred_fecha').AsDateTime;
          sucursal_id.Buscar(ZQGrilla.FieldByName('sucursal_id').AsString);
          sucursaldebcred_tipo.Text:=ZQGrilla.FieldByName('sucursaldebcred_tipo').AsString;
          sucursaldebcred_descripcion.Text:=ZQGrilla.FieldByName('sucursaldebcred_descripcion').AsString;
          sucursaldebcred_importe.Text:=ZQGrilla.FieldByName('sucursaldebcred_importe').AsString;
          sucursaldebcred_estado.Caption:=ZQGrilla.FieldByName('sucursaldebcred_estado').AsString;
          Panelabm.Visible:=true;
          sucursal_id.SetFocus;

      end;
end;

procedure Tsucursalesdebcred.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    sucursaldebcred_id.Text:=Princ.codigo('sucursalesdebcred','sucursaldebcred_id');
    sucursaldebcred_fecha.Date:=date;
    sucursaldebcred_tipo.ItemIndex:=0;
    sucursal_id.llenarcombo;
    sucursaldebcred_descripcion.Text:='';
    sucursaldebcred_importe.Text:='0';
    sucursaldebcred_estado.Caption:='PENDIENTE';
end;

end.
