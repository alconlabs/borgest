unit Unitinformesventas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, StdCtrls, GTBComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel,
  UnitSqlComboBox, AdvListV, UnitSqlListView, Titles;

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
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure informe_tipoSelect(Sender: TObject);
  private
    { Private declarations }
    procedure InformeCostosporVentas;
    procedure InformeVentasPrecios;
    procedure InformedeVentas;
    procedure InformedeCobros;
    procedure RankingProductos;

  public
    { Public declarations }
  end;

var
  InformesVentas: TInformesVentas;

implementation

uses UnitPrinc;

{$R *.dfm}



procedure TInformesVentas.RankingProductos;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\ranking_ventas_productos.rep';
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
                                                   'where documentoventadetalles.producto_tipo="PRODUCTO" and documentosventas.documentoventa_estado<>"ANULADA" and '+
                                                   'tiposdocumento.tipodocu_stock<>0 and '+
                                                   'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                                   ' and '+puntoventa_id.where;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+'group by documentoventadetalles.producto_id ';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+'order by cantidad desc, documentoventadetalle_descripcion';


    Princ.VCLReport1.Execute;

end;


procedure TInformesVentas.InformedeVentas;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\informe_ventas.rep';
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;

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

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero';


    Princ.VCLReport1.Execute;

end;



procedure TInformesVentas.InformedeCobros;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\informe_cobros.rep';
//    Princ.VCLReport1.ConnectionName:=Princ.GetConfiguracion('CONEXIONREPORTES');
//    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\informe_cobros.rep';
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('PERSONAL_NOMBRE').AsString:=personal_id.Text;

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

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' order by documentosventas.documentoventa_fecha, documentosventas.documentoventa_numero';


    Princ.VCLReport1.Execute;

end;




procedure TInformesVentas.InformeVentasPrecios;
begin
    puntoventa_id.GenerarWhere;
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\informe_ventas_precios.rep';
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

    Princ.VCLReport1.Execute;


end;


procedure TInformesVentas.informe_tipoSelect(Sender: TObject);
begin
  inherited;
    Label4.Enabled:=false;
    personal_id.Enabled:=false;
    if informe_tipo.codigo='2' then
      begin
          Label4.Enabled:=true;
          personal_id.Enabled:=true;

      end;

end;

procedure TInformesVentas.InformeCostosporVentas;
begin
    puntoventa_id.GenerarWhere;

    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\informe_costos_ventas.rep';
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
    Princ.VCLReport1.Execute;

end;

procedure TInformesVentas.btnguardarClick(Sender: TObject);
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
              InformedeCobros;

          end;
        4:begin
              RankingProductos;

          end;

    end;
end;

procedure TInformesVentas.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=date;
    hasta_fecha.Date:=date;

    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;

    Label4.Enabled:=false;
    personal_id.Enabled:=false;

    Titles1.Memo.Text:='select * from puntodeventa where 1=1 '+Princ.empresa_where;
    puntoventa_id.Fill;
end;

end.
