unit Unitinformesventas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, StdCtrls, GTBComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel;

type
  TInformesVentas = class(TABMInibase)
    Label1: TLabel;
    desde_fecha: TDateTimePicker;
    Label2: TLabel;
    hasta_fecha: TDateTimePicker;
    Label3: TLabel;
    informe_tipo: TGTBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    procedure InformeCostosporVentas;
    procedure InformeVentasPrecios;
  public
    { Public declarations }
  end;

var
  InformesVentas: TInformesVentas;

implementation

uses UnitPrinc;

{$R *.dfm}


procedure TInformesVentas.InformeVentasPrecios;
begin
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
                                             'group by productos.producto_id '+
                                             'order by productos.producto_nombre';

    Princ.VCLReport1.Execute;


end;


procedure TInformesVentas.InformeCostosporVentas;
begin
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
                                             'group by productos.producto_id '+
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
        2:begin
              InformeVentasPrecios;
          end;

    end;
end;

procedure TInformesVentas.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=date;
    hasta_fecha.Date:=date;
end;

end.
