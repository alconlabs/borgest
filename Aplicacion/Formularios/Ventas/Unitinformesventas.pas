unit Unitinformesventas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, StdCtrls, GTBComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel,
  UnitSqlComboBox, AdvListV, UnitSqlListView, Titles, AdvToolBtn;

type
  TInformesVentas = class(TABMInibase)
    Label1: TLabel;
    desde_fecha: TDateTimePicker;
    Label2: TLabel;
    hasta_fecha: TDateTimePicker;
    Label3: TLabel;
    informe_tipo: TGTBComboBox;
    personal_id: TSqlComboBox;
    Label4: TLabel;
    puntoventa_id: TSqlListView;
    Titles1: TTitles;
    Label5: TLabel;
    Label6: TLabel;
    cliente_id: TSqlComboBox;
    Label7: TLabel;
    provincia_id: TSqlComboBox;
    btnimprimir: TAdvToolButton;
    procedure FormCreate(Sender: TObject);
    procedure btnimprimirDropDown(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    temporal_idproceso:string;
    procedure InformeCostosporVentas;
    procedure InformeVentasPrecios;
    procedure InformedeVentas;
    procedure InformedeVentasProductos;
    procedure InformedeVentasProductosCantidad;
    procedure InformedeCobros;
    procedure RankingProductos;
    procedure InformedeVentasCEquipos;
    procedure InformedeEquipos;
    procedure InformedeEquiposGrafico;
    procedure InformedeCuponesTarjetas;

  public
    { Public declarations }
  end;

var
  InformesVentas: TInformesVentas;

implementation

uses UnitPrinc;

{$R *.dfm}


procedure TInformesVentas.InformedeEquiposGrafico;
var
  desdemes, hastames:tdate;
begin
    if desde_fecha.Date<hasta_fecha.Date then
      begin
          if temporal_idproceso<>'' then
            begin
                Princ.ZQExcecSQL.Sql.Clear;
                Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
                Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
                Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
                Princ.ZQExcecSQL.ExecSql;
            end;

          temporal_idproceso:=Princ.codigo('temporales','temporal_idproceso');  
          puntoventa_id.GenerarWhere;
          desdemes:=desde_fecha.Date;
          hastames:=hasta_fecha.Date;
          ZQSelect.Active:=false;
          ZQSelect.SQL.Text:='select documentoventa_id '+
                             'from documentosventas '+
                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                             'documentosventas.personal_id="'+personal_id.codigo+'" '+
                             'and tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'" '+
                             'and date_format(documentoventa_fecha,"%Y%m")= :aniomes '+
                             'and documentoventa_equipo1<>"" '+Princ.empresa_where+
                             ' and '+puntoventa_id.where+
                             ' group by documentoventa_equipo1 ';


          while desdemes<=hastames do
            begin
                ZQSelect.Active:=false;
                ZQSelect.ParamByName('aniomes').AsString:=formatdatetime('yyyymm',desdemes);
                ZQSelect.Active:=true;


                ZQExecSQL.Sql.Clear;
                ZQExecSQL.Sql.Add('insert into temporales set ');
                ZQExecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
                ZQExecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
                ZQExecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
                ZQExecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
                ZQExecSQL.ParamByName('temporal_int1').AsInteger:=ZQSelect.RecordCount;
                ZQExecSQL.ParamByName('temporal_string2').AsString:=formatdatetime('yyyymm',desdemes);
                ZQExecSQL.ParamByName('temporal_string1').AsString:=formatdatetime('mm-yyyy',desdemes);
                ZQExecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
                ZQExecSQL.ExecSql;



                desdemes:=IncMonth(desdemes,1);

            end;


          Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_equipos_grafico.rep';
          Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
          Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
          Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
          Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
          Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;
          Princ.VCLReport1.Report.Params.ParamByName('SUCURSAL_NOMBRE').AsString:=princ.buscar('select sucursal_nombre from sucursales inner join puntodeventa on sucursales.sucursal_id=puntodeventa.sucursal_id where '+puntoventa_id.where,'sucursal_nombre');
          Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from temporales where temporal_idproceso="'+temporal_idproceso+'" order by temporal_string2';
      end;
end;


procedure TInformesVentas.InformedeCuponesTarjetas;
begin
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_cupones_tarjetas.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select documentopagos.*, tipospago.*,  sum(documentopago_importe) as importe,  '+
                                                   'count(documentopagos.documentopago_nombre) as cantidad '+
                                                   'from documentopagos '+
                                                   'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                                   'inner join documentosventas on documentopagos.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tipopago_caja=-1 and tipospago.tipopago_id=2 and '+
                                                   'documentosventas.documentoventa_fecha>="'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_fecha<="'+formatdatetime('yyyy-mm-dd',hasta_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_estado<>"ANULADA"'+Princ.empresa_where+
                                                   ' group by documentopagos.documentopago_nombre '+
                                                   'order by documentopagos.documentopago_nombre ';

    Princ.VCLReport1.Report.Datainfo.ItemByName('ALIAS_CUPONESMANUALES').sql:='select *, sum(cupontarjeta_importe) as importe, count(cupontarjeta_id) as cantidad from cuponestarjetas  '+
                                                   'inner join tarjetas on cuponestarjetas.tarjeta_id=tarjetas.tarjeta_id '+
                                                   'where (cupontarjeta_fecha>="'+formatdatetime('yyyy-mm-dd',desde_fecha.Date)+'") and '+
                                                   '(cupontarjeta_fecha<="'+formatdatetime('yyyy-mm-dd',hasta_fecha.Date)+'") '+
                                                   'group by cuponestarjetas.tarjeta_id, cuponestarjetas.cupontarjeta_cuotas ';

//    Princ.VCLReport1.Execute;

end;

procedure TInformesVentas.InformedeEquipos;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_equipos.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'tiposdocumento.tipodocu_nombre="'+TIPODOCU_NOTAPEDIDO+'" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where;

    if personal_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.personal_id="'+personal_id.codigo+'" ';

    if cliente_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.cliente_id="'+cliente_id.codigo+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero';


//    Princ.VCLReport1.Execute;

end;



procedure TInformesVentas.RankingProductos;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'ranking_ventas_productos.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, '+
                                                   'sum(if(tiposdocumento.tipodocu_stock=1,documentoventadetalle_cantidad,documentoventadetalle_cantidad*-1)) as cantidad, '+
                                                   'sum(if(tiposdocumento.tipodocu_stock=1,documentoventadetalle_total,documentoventadetalle_total*-1)) as total_ventas '+
                                                   'from documentoventadetalles '+
                                                   'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                                   'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                                                   'where documentoventadetalles.producto_tipo="PRODUCTO" and documentosventas.documentoventa_estado<>"ANULADA" and '+
                                                   'tiposdocumento.tipodocu_stock<>0 and productodeposito.deposito_id="'+Princ.dep_id+'" and '+
                                                   'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                                   ' and '+puntoventa_id.where;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+'group by documentoventadetalles.producto_id ';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+'order by cantidad desc, documentoventadetalle_descripcion';


//    Princ.VCLReport1.Execute;

end;


procedure TInformesVentas.InformedeVentas;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_ventas.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'tiposdocumento.tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where;

    if personal_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.personal_id="'+personal_id.codigo+'" ';

    if cliente_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.cliente_id="'+cliente_id.codigo+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero';


//    Princ.VCLReport1.Execute;

end;

procedure TInformesVentas.InformedeVentasProductos;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_ventas_productos.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, productos.'+Princ.CAMPO_ID_PRODUCTO+' as productocodigo from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'tiposdocumento.tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where;

    if personal_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.personal_id="'+personal_id.codigo+'" ';

    if cliente_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.cliente_id="'+cliente_id.codigo+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentoventadetalles.documentoventadetalle_descripcion';


//    Princ.VCLReport1.Execute;

end;

procedure TInformesVentas.InformedeVentasProductosCantidad;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_ventas_productos_cantidades.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('PROVINCIA_NOMBRE').AsString:=provincia_id.Text;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, productos.'+Princ.CAMPO_ID_PRODUCTO+' as productocodigo, sum(documentoventadetalle_cantidad) as cantidad from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'tiposdocumento.tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where;

    if personal_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.personal_id="'+personal_id.codigo+'" ';

    if cliente_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.cliente_id="'+cliente_id.codigo+'" ';

    if provincia_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and localidades.provincia_id="'+provincia_id.codigo+'" ';



    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' group by documentoventadetalles.producto_id ';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by sucursales.sucursal_id, documentoventadetalle_descripcion';


//    Princ.VCLReport1.Execute;

end;


procedure TInformesVentas.InformedeVentasCEquipos;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_ventas_equipos.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'tiposdocumento.tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where;

    if personal_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.personal_id="'+personal_id.codigo+'" ';

    if cliente_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.cliente_id="'+cliente_id.codigo+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero';


//    Princ.VCLReport1.Execute;

end;



procedure TInformesVentas.InformedeCobros;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_cobros.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
//    Princ.VCLReport1.ConnectionName:=Princ.GetConfiguracion('CONEXIONREPORTES');
//    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_cobros.rep';

    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;
    Princ.VCLReport1.Report.Params.ParamByName('CLIENTE_NOMBRE').AsString:=cliente_id.Text;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'documentosventas.documentoventa_condicionventa="'+CONDICIONVENTA_CTACTE+'" and '+
                                             'tiposdocumento.tipodocu_nombre="'+TIPODOCU_RECIBOVENTA+'" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where;

    if personal_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.personal_id="'+personal_id.codigo+'" ';

    if cliente_id.Text<>'Todos' then
      Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and documentosventas.cliente_id="'+cliente_id.codigo+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero';


//    Princ.VCLReport1.Execute;

end;




procedure TInformesVentas.InformeVentasPrecios;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_ventas_precios.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('NOMBREPRECIO1').AsString:=Princ.NOMBREPRECIO1;
    Princ.VCLReport1.Report.Params.ParamByName('NOMBREPRECIO2').AsString:=Princ.NOMBREPRECIO2;
    Princ.VCLReport1.Report.Params.ParamByName('NOMBREPRECIO3').AsString:=Princ.NOMBREPRECIO3;
    Princ.VCLReport1.Report.Params.ParamByName('NOMBREPRECIO4').AsString:=Princ.NOMBREPRECIO4;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, sum(documentoventadetalles.documentoventadetalle_cantidad) as cantidad_vendida, '+
                                             'sum(if(documentoventadetalles.documentoventadetalle_listaprecio=0, documentoventadetalle_total,0)) as precio1, '+
                                             'sum(if(documentoventadetalles.documentoventadetalle_listaprecio=1, documentoventadetalle_total,0)) as precio2, '+
                                             'sum(if(documentoventadetalles.documentoventadetalle_listaprecio=2, documentoventadetalle_total,0)) as precio3, '+
                                             'sum(if(documentoventadetalles.documentoventadetalle_listaprecio=3, documentoventadetalle_total,0)) as precio4, '+
                                             'sum(if(documentoventadetalles.documentoventadetalle_listaprecio=-1, documentoventadetalle_total,0)) as precio5 '+
                                             'from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                             'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where productodeposito.deposito_id="'+Princ.dep_id+'" and '+
                                             'tiposdocumento.tipodocu_nombre="Factura de Venta" and '+
                                             'documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where+
                                             'group by productos.producto_id '+
                                             'order by productos.producto_nombre';

//    Princ.VCLReport1.Execute;


end;


procedure TInformesVentas.InformeCostosporVentas;
begin
    puntoventa_id.GenerarWhere;

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_costos_ventas.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, sum(documentoventadetalles.documentoventadetalle_cantidad) as cantidad_vendida from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                             'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where productodeposito.deposito_id="'+Princ.dep_id+'" and '+
                                             'tiposdocumento.tipodocu_nombre="Factura de Venta" and '+
                                             'documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                             ' and '+puntoventa_id.where+
                                             ' group by productos.producto_id '+
                                             'order by productos.producto_nombre';

end;

procedure TInformesVentas.btnimprimirClick(Sender: TObject);
begin
  inherited;
    btnimprimir.OnDropDown(self);
    Princ.impresion_tipo:=IMPRESION_IMPRIMIR;
    Princ.ImprimirReporte;
end;

procedure TInformesVentas.btnimprimirDropDown(Sender: TObject);
begin
  inherited;
    case informe_tipo.ItemIndex of
        0:begin
              InformeCostosporVentas;
          end;
        1:begin
              InformeVentasPrecios;
          end;
        2:begin
              InformedeVentas;

          end;
        3:begin
              InformedeVentasProductos;

          end;
        4:begin
              InformedeVentasProductosCantidad;

          end;
        5:begin
              InformedeCobros;

          end;
        6:begin
              RankingProductos;

          end;
        7:begin
              InformedeVentasCEquipos;

          end;
        8:begin
              InformedeEquipos;

          end;
        9:begin
              InformedeEquiposGrafico;

          end;
       10:begin
              InformedeCuponesTarjetas;

          end;

    end;
end;

procedure TInformesVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;
  inherited;

end;

procedure TInformesVentas.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=date;
    hasta_fecha.Date:=date;

    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;

    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=0;

    provincia_id.llenarcombo;
    provincia_id.ItemIndex:=0;

    Titles1.Memo.Text:='select * from puntodeventa where 1=1 '+Princ.empresa_where;
    puntoventa_id.Fill;
end;

end.
