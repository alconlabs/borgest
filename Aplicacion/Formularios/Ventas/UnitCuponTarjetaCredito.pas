unit UnitCuponTarjetaCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, MoneyEdit, UnitSqlComboBox, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, ComCtrls;

type
  TCuponTarjetaCredito = class(TABMbase)
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    tarjeta_porcinteres: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    tarjeta_id: TSqlComboBox;
    cupontarjeta_importe: TMoneyEdit;
    cupontarjeta_cuotas: TMoneyEdit;
    cupontarjeta_recargo: TMoneyEdit;
    tarjeta_cobrado: TMoneyEdit;
    cupontarjeta_numero: TEdit;
    cupontarjeta_autoriz: TEdit;
    cupontarjeta_titular: TEdit;
    cupontarjeta_dni: TEdit;
    cupontarjeta_telefono: TEdit;
    importecuota: TMoneyEdit;
    btnabmtarjetas: TButton;
    Label2: TLabel;
    cupontarjeta_fecha: TDateTimePicker;
    Label1: TLabel;
    cupontarjeta_id: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
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
  CuponTarjetaCredito: TCuponTarjetaCredito;

implementation

uses Unitprinc;

{$R *.dfm}


procedure TCuponTarjetaCredito.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este Cupon?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

    end;
end;

function TCuponTarjetaCredito.control:boolean;
var
  error:integer;
begin
    error:=0;



    result:=error=0;
end;


procedure TCuponTarjetaCredito.agregar;
begin
    id:=Princ.codigo('cuponestarjetas','cupontarjeta_id');

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into cuponestarjetas set ');
    ZQExecSQL.Sql.Add('tarjeta_id=:tarjeta_id, ');
    ZQExecSQL.Sql.Add('cupontarjeta_recargo=:cupontarjeta_recargo, ');
    ZQExecSQL.Sql.Add('cupontarjeta_telefono=:cupontarjeta_telefono, ');
    ZQExecSQL.Sql.Add('cupontarjeta_dni=:cupontarjeta_dni, ');
    ZQExecSQL.Sql.Add('cupontarjeta_titular=:cupontarjeta_titular, ');
    ZQExecSQL.Sql.Add('cupontarjeta_autoriz=:cupontarjeta_autoriz, ');
    ZQExecSQL.Sql.Add('cupontarjeta_cuotas=:cupontarjeta_cuotas, ');
    ZQExecSQL.Sql.Add('cupontarjeta_numero=:cupontarjeta_numero, ');
    ZQExecSQL.Sql.Add('cupontarjeta_importe=:cupontarjeta_importe, ');
    ZQExecSQL.Sql.Add('cupontarjeta_fecha=:cupontarjeta_fecha, ');
    ZQExecSQL.Sql.Add('cupontarjeta_id=:cupontarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=tarjeta_id.codigo;
    ZQExecSQL.ParamByName('cupontarjeta_recargo').AsString:=cupontarjeta_recargo.Text;
    ZQExecSQL.ParamByName('cupontarjeta_telefono').AsString:=cupontarjeta_telefono.Text;
    ZQExecSQL.ParamByName('cupontarjeta_dni').AsString:=cupontarjeta_dni.Text;
    ZQExecSQL.ParamByName('cupontarjeta_titular').AsString:=cupontarjeta_titular.Text;
    ZQExecSQL.ParamByName('cupontarjeta_autoriz').AsString:=cupontarjeta_autoriz.Text;
    ZQExecSQL.ParamByName('cupontarjeta_cuotas').AsString:=cupontarjeta_cuotas.Text;
    ZQExecSQL.ParamByName('cupontarjeta_numero').AsString:=cupontarjeta_numero.Text;
    ZQExecSQL.ParamByName('cupontarjeta_importe').AsString:=cupontarjeta_importe.Text;
    ZQExecSQL.ParamByName('cupontarjeta_fecha').AsString:=formatdatetime('yyyy-mm-dd',cupontarjeta_fecha.Date);
    ZQExecSQL.ParamByName('cupontarjeta_id').AsString:=id;
    ZQExecSQL.ExecSql;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;

end;

procedure TCuponTarjetaCredito.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update cuponestarjetas set ');
    ZQExecSQL.Sql.Add('tarjeta_id=:tarjeta_id, ');
    ZQExecSQL.Sql.Add('cupontarjeta_recargo=:cupontarjeta_recargo, ');
    ZQExecSQL.Sql.Add('cupontarjeta_telefono=:cupontarjeta_telefono, ');
    ZQExecSQL.Sql.Add('cupontarjeta_dni=:cupontarjeta_dni, ');
    ZQExecSQL.Sql.Add('cupontarjeta_titular=:cupontarjeta_titular, ');
    ZQExecSQL.Sql.Add('cupontarjeta_autoriz=:cupontarjeta_autoriz, ');
    ZQExecSQL.Sql.Add('cupontarjeta_cuotas=:cupontarjeta_cuotas, ');
    ZQExecSQL.Sql.Add('cupontarjeta_numero=:cupontarjeta_numero, ');
    ZQExecSQL.Sql.Add('cupontarjeta_importe=:cupontarjeta_importe, ');
    ZQExecSQL.Sql.Add('cupontarjeta_fecha=:cupontarjeta_fecha ');
    ZQExecSQL.Sql.Add('where cupontarjeta_id=:cupontarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=tarjeta_id.codigo;
    ZQExecSQL.ParamByName('cupontarjeta_recargo').AsString:=cupontarjeta_recargo.Text;
    ZQExecSQL.ParamByName('cupontarjeta_telefono').AsString:=cupontarjeta_telefono.Text;
    ZQExecSQL.ParamByName('cupontarjeta_dni').AsString:=cupontarjeta_dni.Text;
    ZQExecSQL.ParamByName('cupontarjeta_titular').AsString:=cupontarjeta_titular.Text;
    ZQExecSQL.ParamByName('cupontarjeta_autoriz').AsString:=cupontarjeta_autoriz.Text;
    ZQExecSQL.ParamByName('cupontarjeta_cuotas').AsString:=cupontarjeta_cuotas.Text;
    ZQExecSQL.ParamByName('cupontarjeta_numero').AsString:=cupontarjeta_numero.Text;
    ZQExecSQL.ParamByName('cupontarjeta_importe').AsString:=cupontarjeta_importe.Text;
    ZQExecSQL.ParamByName('cupontarjeta_fecha').AsString:=formatdatetime('yyyy-mm-dd',cupontarjeta_fecha.Date);
    ZQExecSQL.ParamByName('cupontarjeta_id').AsString:=id;
    ZQExecSQL.ExecSql;



    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;

end;

procedure TCuponTarjetaCredito.eliminar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from cuponestarjetas ');
    ZQExecSQL.Sql.Add('where cupontarjeta_id=:cupontarjeta_id ');
    ZQExecSQL.ParamByName('cupontarjeta_id').AsString:=cupontarjeta_id.Text;
    ZQExecSQL.ExecSql;

    MessageDlg('Datos eliminados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;
end;

procedure TCuponTarjetaCredito.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';
    tarjeta_id.llenarcombo;
    tarjeta_id.ItemIndex:=0;
end;

procedure TCuponTarjetaCredito.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('cupontarjeta_id').AsString:=id;
    ZQSelect.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
        6:begin
              btnguardar.Enabled:=false;
          end;

    end;
end;

procedure TCuponTarjetaCredito.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=1 then
      begin
          cupontarjeta_id.Text:=princ.codigo('cuponestarjetas','cupontarjeta_id');
          cupontarjeta_fecha.Date:=Date;
          cupontarjeta_importe.Value:=0;
          cupontarjeta_cuotas.Value:=1;
          cupontarjeta_recargo.Value:=0;
          cupontarjeta_autoriz.Text:='';
          cupontarjeta_numero.Text:='';
          cupontarjeta_titular.Text:='';
          cupontarjeta_dni.Text:='';
          cupontarjeta_telefono.Text:='';

      end
    else
      begin
          cupontarjeta_id.Text:=ZQSelect.FieldByName('cupontarjeta_id').AsString;
          cupontarjeta_fecha.Date:=ZQSelect.FieldByName('cupontarjeta_fecha').AsDateTime;
          cupontarjeta_importe.Value:=ZQSelect.FieldByName('cupontarjeta_importe').AsFloat;
          cupontarjeta_cuotas.Value:=ZQSelect.FieldByName('cupontarjeta_cuotas').AsFloat;
          cupontarjeta_recargo.Value:=ZQSelect.FieldByName('cupontarjeta_recargo').AsFloat;
          cupontarjeta_autoriz.Text:=ZQSelect.FieldByName('cupontarjeta_autoriz').AsString;
          cupontarjeta_numero.Text:=ZQSelect.FieldByName('cupontarjeta_numero').AsString;
          cupontarjeta_titular.Text:=ZQSelect.FieldByName('cupontarjeta_titular').AsString;
          cupontarjeta_dni.Text:=ZQSelect.FieldByName('cupontarjeta_dni').AsString;
          cupontarjeta_telefono.Text:=ZQSelect.FieldByName('cupontarjeta_telefono').AsString;
          tarjeta_id.Buscar(ZQSelect.FieldByName('tarjeta_id').AsString);
      end;
end;

end.
