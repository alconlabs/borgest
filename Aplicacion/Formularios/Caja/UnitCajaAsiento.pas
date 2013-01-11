unit UnitCajaAsiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, MoneyEdit, UnitSqlComboBox;

type
  TCajaAsiento = class(TABMbase)
    Label2: TLabel;
    cajaasiento_fecha: TDateTimePicker;
    cajaasiento_id: TEdit;
    Label15: TLabel;
    Label10: TLabel;
    cajaasiento_importe: TMoneyEdit;
    cajaasiento_descripcion: TEdit;
    Label1: TLabel;
    Label21: TLabel;
    concepto_id: TSqlComboBox;
    Label3: TLabel;
    cajaasiento_tipo: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;

  public
    { Public declarations }
  end;

var
  CajaAsiento: TCajaAsiento;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TCajaAsiento.btnguardarClick(Sender: TObject);
begin
  inherited;
    if control then 
      begin
          case abm of
              1:begin
                    agregar;
                end;

              2:begin
                    modificar;
                end;

              3:begin
                    if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                      eliminar;
                end;

          end;

      end;
end;

function TCajaAsiento.control:boolean;
var
  error:integer;
begin
    error:=0;

    result:=true;
    if error<>0 then
      result:=false;
end;


procedure TCajaAsiento.agregar;
begin
    id:=Princ.codigo('cajaasientos','cajaasiento_id');

    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Insert into cajaasientos (cajaasiento_descripcion, ');
    ZQExecSQL.sql.add('cajaasiento_fecha, cajaasiento_id, ');
    ZQExecSQL.sql.add('cajaasiento_importe, cajaasiento_tipo, ');
    ZQExecSQL.sql.add('concepto_id) values (:cajaasiento_descripcion, ');
    ZQExecSQL.sql.add(':cajaasiento_fecha, :cajaasiento_id, ');
    ZQExecSQL.sql.add(':cajaasiento_importe, :cajaasiento_tipo, ');
    ZQExecSQL.sql.add(':concepto_id)');
    ZQExecSQL.parambyname('cajaasiento_descripcion').asstring:=cajaasiento_descripcion.text;
    ZQExecSQL.parambyname('cajaasiento_fecha').asstring:=formatdatetime('yyyy-mm-dd',cajaasiento_fecha.Date);
    ZQExecSQL.parambyname('cajaasiento_id').asstring:=id;
    ZQExecSQL.parambyname('cajaasiento_importe').asstring:=cajaasiento_importe.text;
    ZQExecSQL.parambyname('cajaasiento_tipo').asstring:=cajaasiento_tipo.text;
    ZQExecSQL.parambyname('concepto_id').asstring:=concepto_id.codigo;
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados.', mtInformation, [mbOK], 0);
    Self.Close;



end;


procedure TCajaAsiento.modificar;
begin
    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Update cajaasientos set ');
    ZQExecSQL.sql.add('cajaasiento_descripcion=:cajaasiento_descripcion, ');
    ZQExecSQL.sql.add('cajaasiento_fecha=:cajaasiento_fecha, ');
    ZQExecSQL.sql.add('cajaasiento_importe=:cajaasiento_importe, ');
    ZQExecSQL.sql.add('cajaasiento_tipo=:cajaasiento_tipo, ');
    ZQExecSQL.sql.add('concepto_id=:concepto_id');
    ZQExecSQL.sql.add(' where cajaasiento_id=:cajaasiento_id');
    ZQExecSQL.parambyname('cajaasiento_descripcion').asstring:=cajaasiento_descripcion.text;
    ZQExecSQL.parambyname('cajaasiento_fecha').asstring:=formatdatetime('yyyy-mm-dd',cajaasiento_fecha.Date);
    ZQExecSQL.parambyname('cajaasiento_id').asstring:=id;
    ZQExecSQL.parambyname('cajaasiento_importe').asstring:=cajaasiento_importe.text;
    ZQExecSQL.parambyname('cajaasiento_tipo').asstring:=cajaasiento_tipo.text;
    ZQExecSQL.parambyname('concepto_id').asstring:=concepto_id.codigo;
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;


procedure TCajaAsiento.eliminar;
begin
    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Delete from cajaasientos');
    ZQExecSQL.sql.add(' where cajaasiento_id=:cajaasiento_id');
    ZQExecSQL.parambyname('cajaasiento_id').asstring:=id;
    ZQExecSQL.ExecSQL;



end;

procedure TCajaAsiento.FormCreate(Sender: TObject);
begin
  inherited;
    concepto_id.llenarcombo;
end;

procedure TCajaAsiento.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    cajaasiento_id.Text:='';
    cajaasiento_fecha.Date:=princ.fechaservidor;
    cajaasiento_descripcion.Text:='';
    concepto_id.ItemIndex:=-2;
    cajaasiento_importe.Value:=0;

    if abm<>1 then
      begin
          ZQSelect.ParamByName('cajaasiento_id').AsString:=id;
          ZQSelect.Active:=true;

      end;
end;

procedure TCajaAsiento.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    cajaasiento_id.Text:=ZQSelect.FieldByName('cajaasiento_id').AsString;
    cajaasiento_fecha.Date:=ZQSelect.FieldByName('cajaasiento_fecha').AsDateTime;
    cajaasiento_descripcion.Text:=ZQSelect.FieldByName('cajaasiento_descripcion').AsString;
    concepto_id.Buscar(ZQSelect.FieldByName('concepto_id').AsString);
    cajaasiento_importe.Value:=ZQSelect.FieldByName('cajaasiento_importe').AsFloat;
end;

end.
