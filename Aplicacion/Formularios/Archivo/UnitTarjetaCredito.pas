unit UnitTarjetaCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids;

type
  TTarjetaCredito = class(TABMbase)
    Label15: TLabel;
    tarjeta_id: TEdit;
    Label3: TLabel;
    tarjeta_nombre: TEdit;
    DBGrid1: TDBGrid;
    btnagregar: TButton;
    btnquitar: TButton;
    ZQtarjetacuotas: TZQuery;
    DTStarjetacuotas: TDataSource;
    Label2: TLabel;
    tarjeta_observaciones: TMemo;
    ZQtarjetacuotastarjetacuota_id: TIntegerField;
    ZQtarjetacuotastarjetacuota_desde: TIntegerField;
    ZQtarjetacuotastarjetacuota_hasta: TIntegerField;
    ZQtarjetacuotastarjetacuota_recargo: TFloatField;
    ZQtarjetacuotastarjeta_id: TIntegerField;
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
  TarjetaCredito: TTarjetaCredito;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TTarjetaCredito.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        ABM_AGREGAR:begin
            if control then
              agregar;


        end;
        ABM_MODIFICAR:begin
            if control then
              modificar;

        end;
        ABM_ELIMINAR:begin
            if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
              eliminar;


        end;

    end;
end;

function TTarjetaCredito.control:boolean;
var
  error:integer;
begin
    error:=0;



    Result:=error=0;
end;

procedure TTarjetaCredito.agregar;
begin
    id:=Princ.codigo('tarjetas','tarjeta_id');

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into tarjetas set ');
    ZQExecSQL.Sql.Add('tarjeta_observaciones=:tarjeta_observaciones, ');
    ZQExecSQL.Sql.Add('tarjeta_nombre=:tarjeta_nombre, ');
    ZQExecSQL.Sql.Add('tarjeta_id=:tarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_observaciones').AsString:=tarjeta_observaciones.Text;
    ZQExecSQL.ParamByName('tarjeta_nombre').AsString:=tarjeta_nombre.Text;
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=tarjeta_id.Text;
    ZQExecSQL.ExecSql;

    ZQtarjetacuotas.First;
    while not ZQtarjetacuotas.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into tarjetacuotas set ');
            ZQExecSQL.Sql.Add('tarjeta_id=:tarjeta_id, ');
            ZQExecSQL.Sql.Add('tarjetacuota_recargo=:tarjetacuota_recargo, ');
            ZQExecSQL.Sql.Add('tarjetacuota_hasta=:tarjetacuota_hasta, ');
            ZQExecSQL.Sql.Add('tarjetacuota_desde=:tarjetacuota_desde, ');
            ZQExecSQL.Sql.Add('tarjetacuota_id=:tarjetacuota_id ');
            ZQExecSQL.ParamByName('tarjeta_id').AsString:=id;
            ZQExecSQL.ParamByName('tarjetacuota_recargo').AsString:=ZQtarjetacuotas.FieldByName('tarjetacuota_recargo').AsString;
            ZQExecSQL.ParamByName('tarjetacuota_hasta').AsString:=ZQtarjetacuotas.FieldByName('tarjetacuota_hasta').AsString;
            ZQExecSQL.ParamByName('tarjetacuota_desde').AsString:=ZQtarjetacuotas.FieldByName('tarjetacuota_desde').AsString;
            ZQExecSQL.ParamByName('tarjetacuota_id').AsString:=Princ.codigo('tarjetacuotas','tarjetacuota_id');
            ZQExecSQL.ExecSql;

            ZQtarjetacuotas.Next;
        end;


    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;


procedure TTarjetaCredito.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update tarjetas set ');
    ZQExecSQL.Sql.Add('tarjeta_observaciones=:tarjeta_observaciones, ');
    ZQExecSQL.Sql.Add('tarjeta_nombre=:tarjeta_nombre ');
    ZQExecSQL.Sql.Add('where tarjeta_id=:tarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_observaciones').AsString:=tarjeta_observaciones.Text;
    ZQExecSQL.ParamByName('tarjeta_nombre').AsString:=tarjeta_nombre.Text;
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from tarjetacuotas ');
    ZQExecSQL.Sql.Add('where tarjeta_id=:tarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQtarjetacuotas.First;
    while not ZQtarjetacuotas.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into tarjetacuotas set ');
            ZQExecSQL.Sql.Add('tarjeta_id=:tarjeta_id, ');
            ZQExecSQL.Sql.Add('tarjetacuota_recargo=:tarjetacuota_recargo, ');
            ZQExecSQL.Sql.Add('tarjetacuota_hasta=:tarjetacuota_hasta, ');
            ZQExecSQL.Sql.Add('tarjetacuota_desde=:tarjetacuota_desde, ');
            ZQExecSQL.Sql.Add('tarjetacuota_id=:tarjetacuota_id ');
            ZQExecSQL.ParamByName('tarjeta_id').AsString:=id;
            ZQExecSQL.ParamByName('tarjetacuota_recargo').AsString:=ZQtarjetacuotas.FieldByName('tarjetacuota_recargo').AsString;
            ZQExecSQL.ParamByName('tarjetacuota_hasta').AsString:=ZQtarjetacuotas.FieldByName('tarjetacuota_hasta').AsString;
            ZQExecSQL.ParamByName('tarjetacuota_desde').AsString:=ZQtarjetacuotas.FieldByName('tarjetacuota_desde').AsString;
            ZQExecSQL.ParamByName('tarjetacuota_id').AsString:=Princ.codigo('tarjetacuotas','tarjetacuota_id');
            ZQExecSQL.ExecSql;

            ZQtarjetacuotas.Next;
        end;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;


procedure TTarjetaCredito.eliminar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from tarjetacuotas ');
    ZQExecSQL.Sql.Add('where tarjeta_id=:tarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from tarjetas ');
    ZQExecSQL.Sql.Add('where tarjeta_id=:tarjeta_id ');
    ZQExecSQL.ParamByName('tarjeta_id').AsString:=id;
    ZQExecSQL.ExecSql;

    MessageDlg('Datos eliminados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;





procedure TTarjetaCredito.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';
    
end;

procedure TTarjetaCredito.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('tarjeta_id').AsString:=id;
    ZQSelect.Active:=true;
end;

procedure TTarjetaCredito.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    tarjeta_id.Text:=id;
    if abm=1 then
      tarjeta_id.Text:=Princ.codigo('tarjetas','tarjeta_id');

    tarjeta_nombre.Text:=ZQSelect.FieldByName('tarjeta_nombre').AsString;
    tarjeta_observaciones.Text:=ZQSelect.FieldByName('tarjeta_observaciones').AsString;

    ZQtarjetacuotas.Active:=false;
    ZQtarjetacuotas.ParamByName('tarjeta_id').AsString:=id;
    ZQtarjetacuotas.Active:=true;



end;

end.
