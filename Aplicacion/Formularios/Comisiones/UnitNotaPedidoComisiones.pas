unit UnitNotaPedidoComisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel, MQuery, Math;

type
  TNotaPedidoComisiones = class(Tdocumentoventabase)
    ZQPersonal: TZQuery;
    DBGrid2: TDBGrid;
    DTSDocuVenDetComisionesVendedores: TDataSource;
    ZQDocuVenDetComisionesVendedores: TZQuery;
    ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_id: TIntegerField;
    ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_importeunit: TFloatField;
    ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_total: TFloatField;
    ZQDocuVenDetComisionesVendedoresdocumentoventadetalle_id: TIntegerField;
    ZQDocuVenDetComisionesVendedorespersonal_id: TIntegerField;
    ZQDocuVenDetComisionesVendedorespersonal_nombre: TStringField;
    ZQDocuVenDetComisionesVendedoresdocumentoventa_id: TIntegerField;
    ZQDocumentoventadetallesdiferencia: TFloatField;
    lblsaldocomisiones: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure ZQDocuVenDetComisionesVendedoresBeforePost(DataSet: TDataSet);
    procedure ZQDocumentoventadetallesCalcFields(DataSet: TDataSet);
    procedure btnmodificarClick(Sender: TObject);
    procedure ZQDocuVenDetComisionesVendedoresAfterPost(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
    procedure DTSDocumentoventadetalleDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
    detalle_id:integer;
    total_comisiones:real;
  protected
    { Protected declarations }
    procedure CalcularSaldo;
    procedure agregar;
    procedure modificar;
//    procedure eliminar;
//    procedure imprimir;
  public
    { Public declarations }
  end;

var
  NotaPedidoComisiones: TNotaPedidoComisiones;

implementation

uses Unitprinc, UnitNotaPedidoDetalle;

{$R *.dfm}


procedure TNotaPedidoComisiones.CalcularSaldo;
var
  bm:pointer;
begin
    if ZQDocuVenDetComisionesVendedores.Active then
      begin
          bm:=ZQDocuVenDetComisionesVendedores.GetBookmark;
          ZQDocuVenDetComisionesVendedores.First;
          total_comisiones:=0;
          while not ZQDocuVenDetComisionesVendedores.Eof do
              begin
                  total_comisiones:=roundto(total_comisiones+ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_importeunit').AsFloat,-2);
                  ZQDocuVenDetComisionesVendedores.Next;

              end;

          lblsaldocomisiones.Caption:='Saldo: '+floattostr(ZQDocumentoventadetalles.FieldByName('diferencia').AsFloat-total_comisiones);
          lblsaldocomisiones.Font.Color:=clBlack;
          if total_comisiones>ZQDocumentoventadetalles.FieldByName('diferencia').AsFloat then
            lblsaldocomisiones.Font.Color:=clred;

          ZQDocuVenDetComisionesVendedores.GotoBookmark(bm);
      end;
end;



procedure TNotaPedidoComisiones.DTSDocumentoventadetalleDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
    ZQDocuVenDetComisionesVendedores.Filtered:=false;
    ZQDocuVenDetComisionesVendedores.Filter:='documentoventadetalle_id='+QuotedStr(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString);
    ZQDocuVenDetComisionesVendedores.Filtered:=true;
    CalcularSaldo;
end;

procedure TNotaPedidoComisiones.modificar;
var
  i:integer;
  documentoventadetalle_id:string;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentosventas set');
    ZQExecSql.SQL.Add('tipodocu_id=:tipodocu_id, ');
    ZQExecSql.SQL.Add('documentoventa_fecha=:documentoventa_fecha, ');
    ZQExecSql.SQL.Add('cliente_id=:cliente_id, ');
    ZQExecSql.SQL.Add('personal_id=:personal_id, ');
    ZQExecSql.SQL.Add('documentoventa_condicionventa=:documentoventa_condicionventa, ');
    ZQExecSql.SQL.Add('documentoventa_listaprecio=:documentoventa_listaprecio, ');
    ZQExecSql.SQL.Add('documentoventa_neto21=:documentoventa_neto21, ');
    ZQExecSql.SQL.Add('documentoventa_iva21=:documentoventa_iva21, ');
    ZQExecSql.SQL.Add('documentoventa_neto105=:documentoventa_neto105, ');
    ZQExecSql.SQL.Add('documentoventa_iva105=:documentoventa_iva105, ');
    ZQExecSql.SQL.Add('documentoventa_total=:documentoventa_total, ');
    ZQExecSql.SQL.Add('documentoventa_saldo=:documentoventa_saldo, ');
    ZQExecSql.SQL.Add('documentoventa_pagado=:documentoventa_pagado, ');
    ZQExecSql.SQL.Add('documentoventa_observacion=:documentoventa_observacion, ');
    ZQExecSql.SQL.Add('documentoventa_numero=:documentoventa_numero, ');
    ZQExecSql.SQL.Add('documentoventa_fecha=:documentoventa_fecha ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');

    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQExecSql.ParamByName('cliente_id').AsString:=cliente_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_neto21').AsString:=documentoventa_neto21.Text;
    ZQExecSql.ParamByName('documentoventa_iva21').AsString:=documentoventa_iva21.Text;
    ZQExecSql.ParamByName('documentoventa_neto105').AsString:=documentoventa_neto105.Text;
    ZQExecSql.ParamByName('documentoventa_iva105').AsString:=documentoventa_iva105.Text;
    ZQExecSql.ParamByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('documentoventa_pagado').AsString:='0';
    ZQExecSql.ParamByName('documentoventa_saldo').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('documentoventa_observacion').AsString:=documentoventa_observacion.Text;
    ZQExecSql.ParamByName('documentoventa_numero').AsString:=documentoventa_numero.Text;
    ZQExecSql.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;


    ZQDocumentoventadetallesAnterior.Active:=false;
    ZQDocumentoventadetallesAnterior.ParamByName('documentoventa_id').AsString:=id;
    ZQDocumentoventadetallesAnterior.Active:=true;
    ZQDocumentoventadetallesAnterior.First;
    while not ZQDocumentoventadetallesAnterior.Eof do
        begin
            Princ.actualizarstock(ZQDocumentoventadetallesAnterior.FieldByName('producto_id').AsString,ZQDocumentoventadetallesAnterior.FieldByName('documentoventadetalle_cantidad').AsFloat,tipodocu_id.codigo,true);

            ZQDocumentoventadetallesAnterior.Next;
        end;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('delete from documentoventadetalles ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            documentoventadetalle_id:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.sql.clear;
            ZQExecSql.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
            ZQExecSql.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
            ZQExecSql.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id) ');
            ZQExecSql.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
            ZQExecSql.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
            ZQExecSql.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id) ');
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQExecSql.ParamByName('documentoventadetalle_descripcion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidad').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_precio').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_total').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_nogravado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_estado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_observacion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentoventadetalles.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
            ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
            ZQExecSql.ExecSQL;

            Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString,ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat,tipodocu_id.codigo,false);

            ZQExecSql.Sql.Clear;
            ZQExecSql.Sql.Add('delete from docuvendetcomisionesvendedores ');
            ZQExecSql.Sql.Add('where documentoventadetalle_id=:documentoventadetalle_id ');
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQExecSql.ExecSql;


            ZQDocuVenDetComisionesVendedores.First;
            while not ZQDocuVenDetComisionesVendedores.Eof do
                begin
                    ZQExecSql.Sql.Clear;
                    ZQExecSql.Sql.Add('insert into docuvendetcomisionesvendedores set ');
                    ZQExecSql.Sql.Add('personal_id=:personal_id, ');
                    ZQExecSql.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
                    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_total=:docuvendetcomisionvendedor_total, ');
                    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_importeunit=:docuvendetcomisionvendedor_importeunit, ');
                    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');
                    ZQExecSql.ParamByName('personal_id').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('personal_id').AsString;
                    ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
                    ZQExecSql.ParamByName('docuvendetcomisionvendedor_total').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_total').AsString;
                    ZQExecSql.ParamByName('docuvendetcomisionvendedor_importeunit').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_importeunit').AsString;
                    ZQExecSql.ParamByName('docuvendetcomisionvendedor_id').AsString:=Princ.codigo('docuvendetcomisionesvendedores','docuvendetcomisionvendedor_id');
                    ZQExecSql.ExecSql;

                    ZQDocuVenDetComisionesVendedores.Next;
                end;



            ZQDocumentoventadetalles.Edit;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQDocumentoventadetalles.Post;

            ZQDocumentoventadetalles.Next;
        end;



    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentoventadetalles set');
    ZQExecSql.SQL.Add('documentoventadetalle_importe1=:documentoventadetalle_importe1, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe2=:documentoventadetalle_importe2, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe3=:documentoventadetalle_importe3, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe4=:documentoventadetalle_importe4, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe5=:documentoventadetalle_importe5, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe6=:documentoventadetalle_importe6 ');
    ZQExecSql.SQL.Add('where documentoventadetalle_id=:documentoventadetalle_id');
    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQExecSql.ParamByName('documentoventadetalle_importe1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe1').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe2').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe2').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe3').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe4').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe5').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe5').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe6').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe6').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
            ZQExecSql.ExecSQL;
            ZQDocumentoventadetalles.Next;
        end;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

end;


procedure TNotaPedidoComisiones.agregar;
var
  i: Integer;
  recibo_numero:string;
  tipodocu_id_recibo:string;
  documentoventadetalle_id:string;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    id:=Princ.codigo('documentosventas','documentoventa_id');

    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,documentoventa_numero.Text);
    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
      documentoventa_numero.Text:='0';

    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Insert into documentosventas (documentoventa_id, documentoventa_numero, documentoventa_fecha, documentoventa_hora, ');
    ZQExecSql.sql.add('documentoventa_neto21, documentoventa_iva21, documentoventa_neto105, documentoventa_iva105, documentoventa_netonogravado, ');
    ZQExecSql.sql.add('documentoventa_total, documentoventa_estado, documentoventa_pagado, documentoventa_saldo, ');
    ZQExecSql.sql.add('cliente_id, personal_id, tipodocu_id, documentoventa_condicionventa, documentoventa_fechavenc, documentoventa_listaprecio, documentoventa_observacion) ');
    ZQExecSql.sql.add('values (:documentoventa_id, :documentoventa_numero, :documentoventa_fecha, :documentoventa_hora, ');
    ZQExecSql.sql.add(':documentoventa_neto21, :documentoventa_iva21, :documentoventa_neto105, :documentoventa_iva105, :documentoventa_netonogravado, ');
    ZQExecSql.sql.add(':documentoventa_total, :documentoventa_estado, :documentoventa_pagado, :documentoventa_saldo, ');
    ZQExecSql.sql.add(':cliente_id, :personal_id, :tipodocu_id, :documentoventa_condicionventa, :documentoventa_fechavenc, :documentoventa_listaprecio, :documentoventa_observacion)');
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ParamByName('documentoventa_numero').AsString:=documentoventa_numero.Text;
    ZQExecSql.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQExecSql.ParamByName('documentoventa_hora').AsString:=timetostr(Princ.horaservidor);
    ZQExecSql.ParamByName('documentoventa_neto21').AsString:=documentoventa_neto21.Text;
    ZQExecSql.ParamByName('documentoventa_iva21').AsString:=documentoventa_iva21.Text;
    ZQExecSql.ParamByName('documentoventa_neto105').AsString:=documentoventa_neto105.Text;
    ZQExecSql.ParamByName('documentoventa_iva105').AsString:=documentoventa_iva105.Text;
    ZQExecSql.ParamByName('documentoventa_netonogravado').AsString:='0';
    ZQExecSql.ParamByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('documentoventa_estado').AsString:='PENDIENTE';
    ZQExecSql.ParamByName('documentoventa_pagado').AsString:='0';
    ZQExecSql.ParamByName('documentoventa_saldo').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('cliente_id').AsString:=cliente_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date+15);
    ZQExecSql.ParamByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_observacion').AsString:=documentoventa_observacion.Text;
    ZQExecSql.ExecSQL;

    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo, documentoventa_numero.Text);


    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            documentoventadetalle_id:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.sql.clear;
            ZQExecSql.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
            ZQExecSql.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
            ZQExecSql.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id, documentoventadetalle_listaprecio) ');
            ZQExecSql.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
            ZQExecSql.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
            ZQExecSql.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id, :documentoventadetalle_listaprecio) ');
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQExecSql.ParamByName('documentoventadetalle_descripcion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidad').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_precio').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_total').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_nogravado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_estado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_observacion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentoventadetalles.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
            ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
            ZQExecSql.ParamByName('documentoventadetalle_listaprecio').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_listaprecio').AsString;

            ZQExecSql.ExecSQL;

            ZQDocuVenDetComisionesVendedores.First;
            while not ZQDocuVenDetComisionesVendedores.Eof do
                begin
                    ZQExecSql.Sql.Clear;
                    ZQExecSql.Sql.Add('insert into docuvendetcomisionesvendedores set ');
                    ZQExecSql.Sql.Add('personal_id=:personal_id, ');
                    ZQExecSql.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
                    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_total=:docuvendetcomisionvendedor_total, ');
                    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_importeunit=:docuvendetcomisionvendedor_importeunit, ');
                    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');
                    ZQExecSql.ParamByName('personal_id').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('personal_id').AsString;
                    ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
                    ZQExecSql.ParamByName('docuvendetcomisionvendedor_total').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_total').AsString;
                    ZQExecSql.ParamByName('docuvendetcomisionvendedor_importeunit').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_importeunit').AsString;
                    ZQExecSql.ParamByName('docuvendetcomisionvendedor_id').AsString:=Princ.codigo('docuvendetcomisionesvendedores','docuvendetcomisionvendedor_id');
                    ZQExecSql.ExecSql;

                    ZQDocuVenDetComisionesVendedores.Next;
                end;

            ZQDocumentoventadetalles.Edit;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQDocumentoventadetalles.Post;

            Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString, ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, false);

            ZQDocumentoventadetalles.Next;
        end;


    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentoventadetalles set');
    ZQExecSql.SQL.Add('documentoventadetalle_importe1=:documentoventadetalle_importe1, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe2=:documentoventadetalle_importe2, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe3=:documentoventadetalle_importe3, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe4=:documentoventadetalle_importe4, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe5=:documentoventadetalle_importe5, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe6=:documentoventadetalle_importe6 ');
    ZQExecSql.SQL.Add('where documentoventadetalle_id=:documentoventadetalle_id');
    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQExecSql.ParamByName('documentoventadetalle_importe1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe1').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe2').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe2').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe3').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe4').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe5').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe5').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe6').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe6').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
            ZQExecSql.ExecSQL;
            ZQDocumentoventadetalles.Next;
        end;


    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

end;

procedure TNotaPedidoComisiones.btnagregarClick(Sender: TObject);
begin
    try
      NotapedidoDetalle:= TNotapedidoDetalle.Create(self);
    finally
      NotapedidoDetalle.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      if NotapedidoDetalle.ShowModal=mrOk then
        begin

            princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, NotapedidoDetalle.ZQDocumentoventadetalles);

        end;

      NotapedidoDetalle.Free;
      calculartotales;
    end;

    ZQDocuVenDetComisionesVendedores.Filtered:=false;

    ZQDocumentoventadetalles.Edit;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsInteger:=detalle_id;
    ZQDocumentoventadetalles.Post;

    ZQPersonal.Active:=false;
    ZQPersonal.Active:=true;
    ZQPersonal.First;
    while not ZQPersonal.Eof do
        begin
            ZQDocuVenDetComisionesVendedores.Insert;
            ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_id').AsString:='0';
            ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_importeunit').AsString:='0';
            ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_total').AsString:='0';
            ZQDocuVenDetComisionesVendedores.FieldByName('documentoventadetalle_id').AsInteger:=detalle_id;
            ZQDocuVenDetComisionesVendedores.FieldByName('personal_id').AsString:=ZQPersonal.FieldByName('personal_id').AsString;
            ZQDocuVenDetComisionesVendedores.FieldByName('personal_nombre').AsString:=ZQPersonal.FieldByName('personal_nombre').AsString;
            ZQDocuVenDetComisionesVendedores.FieldByName('documentoventa_id').AsInteger:=0;
            ZQDocuVenDetComisionesVendedores.Post;

            ZQPersonal.Next;
        end;

    detalle_id:=detalle_id+1;


    ZQDocuVenDetComisionesVendedores.Filter:='documentoventadetalle_id='+QuotedStr(ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString);
    ZQDocuVenDetComisionesVendedores.Filtered:=true;

end;

procedure TNotaPedidoComisiones.btnguardarClick(Sender: TObject);
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







    ZQDocuVenDetComisionesVendedores.First;
    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('insert into docuvendetcomisionesvendedores set ');
    ZQExecSql.Sql.Add('personal_id=:personal_id, ');
    ZQExecSql.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_total=:docuvendetcomisionvendedor_total, ');
    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_importeunit=:docuvendetcomisionvendedor_importeunit, ');
    ZQExecSql.Sql.Add('docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');

    while not ZQDocuVenDetComisionesVendedores.Eof do
        begin
            ZQExecSql.ParamByName('personal_id').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('personal_id').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('documentoventadetalle_id').AsString;
            ZQExecSql.ParamByName('docuvendetcomisionvendedor_total').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_total').AsString;
            ZQExecSql.ParamByName('docuvendetcomisionvendedor_importeunit').AsString:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_importeunit').AsString;
            ZQExecSql.ParamByName('docuvendetcomisionvendedor_id').AsString:=Princ.codigo('docuvendetcomisionesvendedores','docuvendetcomisionvendedor_id');
            ZQExecSql.ExecSql;


            ZQDocuVenDetComisionesVendedores.Next;
        end;
end;

procedure TNotaPedidoComisiones.btnmodificarClick(Sender: TObject);
begin
    try
      NotapedidoDetalle:= TNotapedidoDetalle.Create(self);
    finally
      NotapedidoDetalle.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      NotapedidoDetalle.producto_id.Search(ZQDocumentoventadetalles.FieldByName('producto_id').AsString);
      NotapedidoDetalle.ventadeta_cantidad.Value:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat;
      NotapedidoDetalle.ventadetalle_preciounitario.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;
      NotapedidoDetalle.documentoventadetalle_importe1.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe1').AsFloat;
      NotapedidoDetalle.documentoventadetalle_importe2.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe2').AsFloat;
      NotapedidoDetalle.documentoventadetalle_importe3.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsFloat;
      NotapedidoDetalle.documentoventadetalle_importe4.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsFloat;
      NotapedidoDetalle.documentoventadetalle_importe5.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe5').AsFloat;
      NotapedidoDetalle.documentoventadetalle_importe6.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe6').AsFloat;
      NotapedidoDetalle.documentoventadetalle_id:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
      NotapedidoDetalle.calculartotal;
      NotapedidoDetalle.calculartotal1;
//      NotapedidoDetalle.ventadetalle_total.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;

      if NotapedidoDetalle.ShowModal=mrOk then
        begin

            princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, NotapedidoDetalle.ZQDocumentoventadetalles,2,ZQDocumentoventadetalles.GetBookmark);

        end;

      NotapedidoDetalle.Free;
      calculartotales;
    end;

end;

procedure TNotaPedidoComisiones.FormCreate(Sender: TObject);
begin
  inherited;
    detalle_id:=1;
end;

procedure TNotaPedidoComisiones.ZQDocumentoventadetallesCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('diferencia').AsFloat:=roundto(DataSet.FieldByName('documentoventadetalle_precio').AsFloat-DataSet.FieldByName('documentoventadetalle_importe1').AsFloat,-2);
end;

procedure TNotaPedidoComisiones.ZQDocuVenDetComisionesVendedoresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
    CalcularSaldo;
end;

procedure TNotaPedidoComisiones.ZQDocuVenDetComisionesVendedoresBeforePost(
  DataSet: TDataSet);
begin
  inherited;
    ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_total').AsFloat:=ZQDocuVenDetComisionesVendedores.FieldByName('docuvendetcomisionvendedor_importeunit').AsFloat*ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat;
end;

procedure TNotaPedidoComisiones.ZQuery2AfterOpen(DataSet: TDataSet);
begin
  inherited;
    ZQDocuVenDetComisionesVendedores.Active:=false;
    ZQDocuVenDetComisionesVendedores.ParamByName('documentoventa_id').AsString:=id;
    ZQDocuVenDetComisionesVendedores.Active:=true;
    CalcularSaldo;
end;

end.
