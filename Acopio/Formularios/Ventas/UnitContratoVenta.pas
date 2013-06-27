unit UnitContratoVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, MoneyEdit,
  GTBComboBox, GTBMemo, GBTEdit;

type
  Tcontratoventa = class(TABMbase)
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
    Label16: TLabel;
    documento_fechavenc: TDateTimePicker;
    Label18: TLabel;
    documento_observaciones: TGTBMemo;
    Label4: TLabel;
    especie_id: TSqlComboBox;
    Label7: TLabel;
    documento_fechacumplimiento: TDateTimePicker;
    Label8: TLabel;
    documento_preciounitario: TMoneyEdit;
    Label9: TLabel;
    documento_moneda: TGTBComboBox;
    Label10: TLabel;
    documento_lugarentrega: TGTBEdit;
    Label13: TLabel;
    documento_tipooperacion: TGTBComboBox;
    Label14: TLabel;
    documento_condicioncalidad: TGTBComboBox;
    Label17: TLabel;
    Label19: TLabel;
    Edit1: TEdit;
    Label20: TLabel;
    Edit2: TEdit;
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure sucursal_idSelect(Sender: TObject);
    procedure puntoventa_idSelect(Sender: TObject);
    procedure tipodocu_idSelect(Sender: TObject);
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
    tipodocu_nombre:string;
  end;

var
  contratoventa: Tcontratoventa;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure Tcontratoventa.agregar;
begin
    id:=Princ.codigo('documentos','documento_id');
    
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
    ZQExecSQL.Sql.Add('documento_fechacumplimiento=:documento_fechacumplimiento, ');
    ZQExecSQL.Sql.Add('documento_preciounitario=:documento_preciounitario, ');
    ZQExecSQL.Sql.Add('documento_moneda=:documento_moneda, ');
    ZQExecSQL.Sql.Add('documento_lugarentrega=:documento_lugarentrega, ');
    ZQExecSQL.Sql.Add('documento_condicioncalidad=:documento_condicioncalidad, ');
    ZQExecSQL.Sql.Add('documento_tipodestino=:documento_tipodestino, ');
    ZQExecSQL.Sql.Add('documento_numerocartaporte=:documento_numerocartaporte, ');
    ZQExecSQL.Sql.Add('documento_kgbrutos=:documento_kgbrutos, ');
    ZQExecSQL.Sql.Add('documento_tara=:documento_tara, ');
    ZQExecSQL.Sql.Add('especie_id=:especie_id, ');
    ZQExecSQL.Sql.Add('documento_tipooperacion=:documento_tipooperacion, ');
    ZQExecSQL.Sql.Add('documento_id=:documento_id ');
    ZQExecSQL.ParamByName('entidadtransportista_id').AsString:='0';
    ZQExecSQL.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSQL.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSQL.ParamByName('documento_documentacion').AsString:='';
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
    ZQExecSQL.ParamByName('documento_fechacumplimiento').AsString:=formatdatetime('yyyy-mm-dd',documento_fechacumplimiento.Date);
    ZQExecSQL.ParamByName('documento_preciounitario').AsString:=documento_preciounitario.Text;
    ZQExecSQL.ParamByName('documento_moneda').AsString:=documento_moneda.Text;
    ZQExecSQL.ParamByName('documento_lugarentrega').AsString:=documento_lugarentrega.Text;
    ZQExecSQL.ParamByName('documento_condicioncalidad').AsString:=documento_condicioncalidad.Text;
    ZQExecSQL.ParamByName('documento_tipodestino').AsString:='';
    ZQExecSQL.ParamByName('documento_numerocartaporte').AsString:='0';
    ZQExecSQL.ParamByName('documento_kgbrutos').AsString:='0';
    ZQExecSQL.ParamByName('documento_tara').AsString:='0';
    ZQExecSQL.ParamByName('especie_id').AsString:=especie_id.codigo;
    ZQExecSQL.ParamByName('documento_tipooperacion').AsString:=documento_tipooperacion.Text;
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;

    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo,documento_numero.Text);


    MessageDlg('Datos guardados correctamente', mtInformation, [mbOK], 0);
    self.Close;

end;


procedure Tcontratoventa.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update documentos set ');
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
    ZQExecSQL.Sql.Add('documento_condicioncalidad=:documento_condicioncalidad, ');
    ZQExecSQL.Sql.Add('documento_tipodestino=:documento_tipodestino, ');
    ZQExecSQL.Sql.Add('documento_numerocartaporte=:documento_numerocartaporte, ');
    ZQExecSQL.Sql.Add('documento_kgbrutos=:documento_kgbrutos, ');
    ZQExecSQL.Sql.Add('documento_tara=:documento_tara, ');
    ZQExecSQL.Sql.Add('especie_id=:especie_id, ');
    ZQExecSQL.Sql.Add('documento_tipooperacion=:documento_tipooperacion, ');
    ZQExecSQL.Sql.Add('documento_fecha=:documento_fecha, ');
    ZQExecSQL.Sql.Add('documento_preciounitario=:documento_preciounitario, ');
    ZQExecSQL.Sql.Add('documento_moneda=:documento_moneda, ');
    ZQExecSQL.Sql.Add('documento_lugarentrega=:documento_lugarentrega, ');
    ZQExecSQL.Sql.Add('documento_fechacumplimiento=:documento_fechacumplimiento ');
    ZQExecSQL.Sql.Add('where documento_id=:documento_id ');
    ZQExecSQL.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSQL.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSQL.ParamByName('documento_documentacion').AsString:='';
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
    ZQExecSQL.ParamByName('documento_fechacumplimiento').AsString:=formatdatetime('yyyy-mm-dd',documento_fechacumplimiento.Date);
    ZQExecSQL.ParamByName('documento_preciounitario').AsString:=documento_preciounitario.Text;
    ZQExecSQL.ParamByName('documento_moneda').AsString:=documento_moneda.Text;
    ZQExecSQL.ParamByName('documento_lugarentrega').AsString:=documento_lugarentrega.Text;
    ZQExecSQL.ParamByName('documento_condicioncalidad').AsString:=documento_condicioncalidad.Text;
    ZQExecSQL.ParamByName('documento_tipodestino').AsString:='';
    ZQExecSQL.ParamByName('documento_numerocartaporte').AsString:='0';
    ZQExecSQL.ParamByName('documento_kgbrutos').AsString:='0';
    ZQExecSQL.ParamByName('documento_tara').AsString:='0';
    ZQExecSQL.ParamByName('especie_id').AsString:=especie_id.codigo;
    ZQExecSQL.ParamByName('documento_tipooperacion').AsString:=documento_tipooperacion.Text;
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;

    MessageDlg('Datos guardados correctamente', mtInformation, [mbOK], 0);
    self.Close;
end;


procedure Tcontratoventa.puntoventa_idSelect(Sender: TObject);
begin
  inherited;
    documento_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;

     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     if tipodocu_id.ItemIndex>-1 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tcontratoventa.sucursal_idSelect(Sender: TObject);
begin
  inherited;
    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';
    puntoventa_id.llenarcombo;
    try
       puntoventa_id.ItemIndex:=0;
     except
       puntoventa_id.ItemIndex:=-1;
     end;

    puntoventa_id.OnSelect(self);
end;

procedure Tcontratoventa.tipodocu_idSelect(Sender: TObject);
begin
  inherited;
    documento_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documento_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tcontratoventa.imprimir;
begin

end;

procedure Tcontratoventa.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=0;

    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" order by puntoventa_numero';

    puntoventa_id.llenarcombo;
    try
      puntoventa_id.ItemIndex:=0;
    except
      puntoventa_id.ItemIndex:=-1;
    end;


    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'" '+
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
          documento_fechavenc.Date:=Date+30;
          documento_fechacumplimiento.date:=Date+30;
          entidad_id.ItemIndex:=-1;
          especie_id.ItemIndex:=-1;
          documento_total.Text:='0';
          documento_observaciones.Text:='';
          documento_calidad.ItemIndex:=1;
          documento_preciounitario.Text:='0';
          documento_moneda.ItemIndex:=-1;
          documento_lugarentrega.Text:='PUERTO DE ROSARIO';
          documento_observaciones.Text:='';
      end
    else
      begin
          documento_fecha.Date:=ZQSelect.FieldByName('documento_fecha').AsDateTime;
          documento_fechavenc.Date:=ZQSelect.FieldByName('documento_fechavenc').AsDateTime;
          documento_fechacumplimiento.Date:=ZQSelect.FieldByName('documento_fechacumplimiento').AsDateTime;
          sucursal_id.Buscar(ZQSelect.FieldByName('sucursal_id').AsString);
          sucursal_id.OnSelect(self);
          puntoventa_id.Buscar(ZQSelect.FieldByName('puntoventa_id').AsString);
          puntoventa_id.OnSelect(self);
          entidad_id.Buscar(ZQSelect.FieldByName('entidad_id').AsString);
          tipodocu_id.buscar(ZQSelect.FieldByName('tipodocu_id').AsString);
          tipodocu_id.OnSelect(self);
          documento_numero.Text:=ZQSelect.FieldByName('documento_numero').AsString;


          documento_total.Text:=ZQSelect.FieldByName('documento_total').AsString;
          documento_observaciones.Text:=ZQSelect.FieldByName('documento_observaciones').AsString;

          documento_calidad.Buscar(ZQSelect.FieldByName('documento_calidad').AsString,true);
          documento_preciounitario.Text:=ZQSelect.FieldByName('documento_preciounitario').AsString;
          especie_id.Buscar(ZQSelect.FieldByName('especie_id').AsString);
          documento_moneda.Text:=ZQSelect.FieldByName('documento_moneda').AsString;
          documento_lugarentrega.Text:=ZQSelect.FieldByName('documento_lugarentrega').AsString;

          documento_tipooperacion.Text:=ZQSelect.FieldByName('documento_tipooperacion').AsString;
          documento_condicioncalidad.Text:=ZQSelect.FieldByName('documento_condicioncalidad').AsString;


      end;
end;

procedure Tcontratoventa.eliminar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from documentos ');
    ZQExecSQL.Sql.Add('where documento_id=:documento_id ');
    ZQExecSQL.ParamByName('documento_id').AsString:=id;
    ZQExecSQL.ExecSql;

    MessageDlg('Datos eliminados.', mtInformation, [mbOK], 0);
    self.Close;
end;


procedure Tcontratoventa.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';

    

    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=-1;

    documento_calidad.llenarcombo;

    especie_id.llenarcombo;

end;

procedure Tcontratoventa.FormShow(Sender: TObject);
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

procedure Tcontratoventa.anular;
begin

end;

function Tcontratoventa.control:boolean;
var
  error:integer;
begin
    error:=0;


    if error=0 then
      result:=true
    else
      result:=false;

end;



procedure Tcontratoventa.btnguardarClick(Sender: TObject);
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
