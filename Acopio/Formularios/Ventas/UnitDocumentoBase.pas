unit UnitDocumentoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, MoneyEdit,
  GTBComboBox, GTBMemo;

type
  TDocumentoBase = class(TABMbase)
    Label2: TLabel;
    Label15: TLabel;
    Labelsucursal: TLabel;
    documento_numero: TEdit;
    documento_fecha: TDateTimePicker;
    puntoventa_id: TSqlComboBox;
    tipodocu_id: TSqlComboBox;
    sucursal_id: TSqlComboBox;
    Label3: TLabel;
    Label1: TLabel;
    cliente_domicilio: TLabel;
    Label11: TLabel;
    cliente_documentonro: TLabel;
    Label12: TLabel;
    entidad_id: TSqlComboBox;
    Label5: TLabel;
    Label6: TLabel;
    documento_total: TMoneyEdit;
    documento_calidad: TSqlComboBox;
    Label7: TLabel;
    entidadtransportista_id: TSqlComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    documento_fechavenc: TDateTimePicker;
    documento_documentacion: TGTBComboBox;
    Label17: TLabel;
    Label18: TLabel;
    documento_observaciones: TGTBMemo;
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure anular;
    procedure imprimir;
  public
    { Public declarations }
  end;

var
  DocumentoBase: TDocumentoBase;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TDocumentoBase.agregar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into documentos set ');
    ZQExecSQL.Sql.Add('entidadtransportista_id=:entidadtransportista_id, ');
    ZQExecSQL.Sql.Add('entidad_id=:entidad_id, ');
    ZQExecSQL.Sql.Add('tipodocu_id=:tipodocu_id, ');
    ZQExecSQL.Sql.Add('documento_documentacion=:documento_documentacion, ');
    ZQExecSQL.Sql.Add('documento_calidad=:documento_calidad, ');
    ZQExecSQL.Sql.Add('documento_observaciones=:documento_observaciones, ');
    ZQExecSQL.Sql.Add('documento_estado=:documento_estado, ');
    ZQExecSQL.Sql.Add('documento_pagado=:documento_pagado, ');
    ZQExecSQL.Sql.Add('documento_saldo=:documento_saldo, ');
    ZQExecSQL.Sql.Add('documento_total=:documento_total, ');
    ZQExecSQL.Sql.Add('documento_numero=:documento_numero, ');
    ZQExecSQL.Sql.Add('documento_hora=:documento_hora, ');
    ZQExecSQL.Sql.Add('documento_fechavenc=:documento_fechavenc, ');
    ZQExecSQL.Sql.Add('documento_fecha=:documento_fecha, ');
    ZQExecSQL.Sql.Add('documento_id=:documento_id ');
    ZQExecSQL.ParamByName('entidadtransportista_id').AsString:=entidadtransportista_id.codigo;
    ZQExecSQL.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSQL.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSQL.ParamByName('documento_documentacion').AsString:=documento_documentacion.Text;
    ZQExecSQL.ParamByName('documento_calidad').AsString:=documento_calidad.Text;
    ZQExecSQL.ParamByName('documento_observaciones').AsString:=documento_observaciones.Text;
    ZQExecSQL.ParamByName('documento_estado').AsString:='PENDIENTE';
    ZQExecSQL.ParamByName('documento_pagado').AsString:='0';
    ZQExecSQL.ParamByName('documento_saldo').AsString:=documento_total.Text;
    ZQExecSQL.ParamByName('documento_total').AsString:=documento_total.Text;
    ZQExecSQL.ParamByName('documento_numero').AsString:=documento_numero.Text;
    ZQExecSQL.ParamByName('documento_hora').AsString:=timetostr(time);
    ZQExecSQL.ParamByName('documento_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documento_fechavenc.Date);
    ZQExecSQL.ParamByName('documento_fecha').AsString:=formatdatetime('yyyy-mm-dd',documento_fecha.Date);
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;

end;


procedure TDocumentoBase.modificar;
begin

end;


procedure TDocumentoBase.imprimir;
begin

end;

procedure TDocumentoBase.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    sucursal_id.llenarcombo;

    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" order by puntoventa_numero';

    puntoventa_id.llenarcombo;
    try
      puntoventa_id.ItemIndex:=0;
    except
      puntoventa_id.ItemIndex:=-1;
    end;


    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;
     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     documento_numero.Text:='';
     if tipodocu_id.ItemIndex=0 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');


    documento_fecha.Date:=date;

    if abm=1 then
      begin
          documento_fecha.Date:=date;
          entidad_id.ItemIndex:=-1;
          entidadtransportista_id.ItemIndex:=-1;

          documento_total.Text:='0';
          documento_observaciones.Text:='';
      end
    else
      begin
          documento_fecha.Date:=ZQSelect.FieldByName('documento_fecha').AsDateTime;
          sucursal_id.Buscar(ZQSelect.FieldByName('sucursal_id').AsString);
          sucursal_id.OnSelect(self);
          puntoventa_id.Buscar(ZQSelect.FieldByName('puntoventa_id').AsString);
          puntoventa_id.OnSelect(self);
          entidad_id.Buscar(ZQSelect.FieldByName('entidad_id').AsString);
          entidadtransportista_id.Buscar(ZQSelect.FieldByName('entidadtransportista_id').AsString);
          tipodocu_id.buscar(ZQSelect.FieldByName('tipodocu_id').AsString);
          tipodocu_id.OnSelect(self);
          documento_numero.Text:=ZQSelect.FieldByName('documento_numero').AsString;


          documento_total.Text:=ZQSelect.FieldByName('documento_total').AsString;
          documento_observaciones.Text:=ZQSelect.FieldByName('documento_observaciones').AsString;

          documento_calidad.Text:=ZQSelect.FieldByName('documento_calidad').AsString;
          documento_documentacion.Text:=ZQSelect.FieldByName('documento_documentacion').AsString;

      end;
end;

procedure TDocumentoBase.eliminar;
begin

end;


procedure TDocumentoBase.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';

    

    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=-1;

    entidadtransportista_id.llenarcombo;
    entidadtransportista_id.ItemIndex:=-1;

    documento_calidad.llenarcombo;

end;

procedure TDocumentoBase.FormShow(Sender: TObject);
begin
  inherited;
    if abm=1 then
      id:='';


    ZQSelect.Active:=false;
    ZQSelect.ParamByName('documento_id').AsString:=id;
    ZQSelect.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;
end;

procedure TDocumentoBase.anular;
begin

end;

function TDocumentoBase.control:boolean;
var
  error:integer;
begin
    error:=0;


    if error=0 then
      result:=true
    else
      result:=false;

end;



procedure TDocumentoBase.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;

        5:begin
              if (MessageDlg('Seguro desea anular esta Factura?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                anular;
          end;


    end;
end;

end.
