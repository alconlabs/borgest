unit UnitNotaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel, GBTEdit;

type
  TNotaPedido = class(Tdocumentoventabase)
    documentoventa_formapago: TGTBMemo;
    Label14: TLabel;
    documentoventa_equipo1: TGTBEdit;
    Label16: TLabel;
    Label17: TLabel;
    documentoventa_equipo2: TGTBEdit;
    btnimprimir: TButton;
    ZQDebitos: TZQuery;
    ZQCreditos: TZQuery;
    ZQDocumentoventadetallesproducto_codigo: TStringField;
    ZQDocumentoventadetallesproducto_codigobarras: TStringField;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
    temporal_idproceso:string;
    procedure imprimir;
    procedure Modificar1;
  public
    { Public declarations }
  end;

var
  NotaPedido: TNotaPedido;

implementation

Uses UnitPrinc, UnitNotaPedidoDetalle;

{$R *.dfm}


procedure TNotaPedido.imprimir;
var
  tipodocu_archivoimpresion:string;
  factura_id:string;
  orden:integer;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                             'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                             'inner join paises on provincias.pais_id=paises.pais_id '+
                                             'inner join condicioniva on clientes.condicioniva_id=condicioniva.condicioniva_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_id="'+id+'"';


    factura_id:=princ.buscar('select detallefact.documentoventa_id from documentoventadetalles '+
                             'inner join documentoventadetalles detallefact on documentoventadetalles.documentoventadetalle_id=detallefact.documentoventadetalle_idorig '+
                             'where documentoventadetalles.documentoventa_id="'+id+'" '+
                             'group by detallefact.documentoventa_id ','documentoventa_id');


    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

    temporal_idproceso:=Princ.codigo('temporales','temporal_idproceso');
    ZQDebitos.SQL.Text:='select * from documentosventas '+
                        'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                        'where documentosventas.documentoventa_id="'+factura_id+'"';

    ZQDebitos.Active:=true;
    ZQDebitos.First;
    ZQCreditos.Active:=false;
    ZQCreditos.SQL.Text:='select * from documentoventadocus '+
                         'inner join documentosventas on documentoventadocus.documentoventa_id=documentosventas.documentoventa_id '+
                         'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                         'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                         'where documentoventadocus.documentoventa_idpago=:documentoventa_idpago and documentoventadoc_tiporelacion="IMPUTACION"';

    Princ.ZQExcecSQL.Sql.Clear;
    Princ.ZQExcecSQL.Sql.Add('begin');
    Princ.ZQExcecSQL.ExecSql;

    while not ZQDebitos.Eof do
        begin
            orden:=1;
            Princ.ZQExcecSQL.Sql.Clear;
            Princ.ZQExcecSQL.Sql.Add('insert into temporales set ');
            Princ.ZQExcecSQL.Sql.Add('temporal_fecha1=:temporal_fecha1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int4=:temporal_int4, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int3=:temporal_int3, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int2=:temporal_int2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float2=:temporal_float2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float1=:temporal_float1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
            Princ.ZQExcecSQL.ParamByName('temporal_fecha1').AsString:=formatdatetime('yyyy-mm-dd',ZQDebitos.FieldByName('documentoventa_fecha').AsDateTime);
            Princ.ZQExcecSQL.ParamByName('temporal_int4').AsInteger:=orden;
            Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDebitos.FieldByName('documentoventa_id').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int2').AsString:=ZQDebitos.FieldByName('documentoventa_numero').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQDebitos.FieldByName('puntoventa_numero').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float2').AsString:=ZQDebitos.FieldByName('documentoventa_total').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:='0';
            Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQDebitos.FieldByName('tipodocu_nombreabrev').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDebitos.FieldByName('cliente_nombre').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
            Princ.ZQExcecSQL.ExecSql;

            ZQCreditos.Active:=false;
            ZQCreditos.ParamByName('documentoventa_idpago').AsString:= ZQDebitos.FieldByName('documentoventa_id').AsString;
            ZQCreditos.Active:=true;
            ZQCreditos.First;
            while not ZQCreditos.Eof do
                begin
                    orden:=orden+1;
                    Princ.ZQExcecSQL.Sql.Clear;
                    Princ.ZQExcecSQL.Sql.Add('insert into temporales set ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_fecha1=:temporal_fecha1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int4=:temporal_int4, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int3=:temporal_int3, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int2=:temporal_int2, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_float2=:temporal_float2, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_float1=:temporal_float1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
                    Princ.ZQExcecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
                    Princ.ZQExcecSQL.ParamByName('temporal_fecha1').AsString:=formatdatetime('yyyy-mm-dd',ZQCreditos.FieldByName('documentoventa_fecha').AsDateTime);
                    Princ.ZQExcecSQL.ParamByName('temporal_int4').AsInteger:=orden;
                    Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDebitos.FieldByName('documentoventa_id').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int2').AsString:=ZQCreditos.FieldByName('documentoventa_numero').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQCreditos.FieldByName('puntoventa_numero').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_float2').AsFloat:=ZQCreditos.FieldByName('documentoventadoc_importe').AsFloat*-1;
                    Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:='0';
                    Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQCreditos.FieldByName('tipodocu_nombreabrev').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDebitos.FieldByName('cliente_nombre').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
                    Princ.ZQExcecSQL.ExecSql;

                    ZQCreditos.Next;
                end;

            ZQDebitos.Next;
        end;

    Princ.ZQExcecSQL.Sql.Clear;
    Princ.ZQExcecSQL.Sql.Add('commit');
    Princ.ZQExcecSQL.ExecSql;


    Princ.VCLReport1.Report.Datainfo.Items[1].sql:='select * from temporales '+
                                                   'where temporal_idproceso="'+temporal_idproceso+'" '+
                                                   'order by temporal_string2, temporal_id, temporal_int4 ';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select *, sum(documentoventadetalle_cantidad) as cantidad from documentoventadetalles '+
                                                   'where documentoventa_id="'+id+'" '+
                                                   'group by producto_id ';

    Princ.VCLReport1.Execute;

    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

end;


procedure TNotaPedido.FormShow(Sender: TObject);
begin
  inherited;
  if abm=1 then
    begin
        documentoventa_formapago.Text:='';
        documentoventa_equipo1.Text:='';
        documentoventa_equipo2.Text:='';
    end
  else
    begin
        documentoventa_formapago.Text:=ZQuery2.FieldByName('documentoventa_formapago').AsString;
        documentoventa_equipo1.Text:=ZQuery2.FieldByName('documentoventa_equipo1').AsString;
        documentoventa_equipo2.Text:=ZQuery2.FieldByName('documentoventa_equipo2').AsString;
    end;

end;

procedure TNotaPedido.Modificar1;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentosventas set');
    ZQExecSql.SQL.Add('documentoventa_formapago=:documentoventa_formapago, ');
    ZQExecSql.SQL.Add('documentoventa_equipo1=:documentoventa_equipo1, ');
    ZQExecSql.SQL.Add('documentoventa_equipo2=:documentoventa_equipo2 ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');
    ZQExecSql.ParamByName('documentoventa_formapago').AsString:=documentoventa_formapago.Text;
    ZQExecSql.ParamByName('documentoventa_equipo1').AsString:=documentoventa_equipo1.Text;
    ZQExecSql.ParamByName('documentoventa_equipo2').AsString:=documentoventa_equipo2.Text;
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;



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

procedure TNotaPedido.btnagregarClick(Sender: TObject);
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

end;

procedure TNotaPedido.btnguardarClick(Sender: TObject);
begin
  inherited;
    if (abm=1) or (abm=2) then
      begin
          Modificar1;

          MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

          if Princ.buscar('select tipodocu_preimpresos from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_preimpresos')='-1' then
            begin
                if (MessageDlg('Desea imprimir el comprobante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                      imprimir;

                  end;

            end;

      end;

    if abm=3 then
      begin
          if eliminado then
            MessageDlg('Los datos fueron borrados correctamente.', mtInformation, [mbOK], 0);
      end;

    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;


end;

procedure TNotaPedido.btnimprimirClick(Sender: TObject);
begin
  inherited;
    self.imprimir;
end;

procedure TNotaPedido.btnmodificarClick(Sender: TObject);
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

end.
