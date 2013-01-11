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
  public
    { Public declarations }
  end;

var
  InformesVentas: TInformesVentas;

implementation

uses UnitPrinc;

{$R *.dfm}


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
                                             'where productodeposito.deposito_id="'+Princ.dep_id+'" and '+
                                             'tiposdocumento.tipodocu_nombre="Factura de Venta" and '+
                                             'documentosventas.documentoventa_estado<>"ANULADA" and '+
                                             'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                             'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+
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

    end;
end;

procedure TInformesVentas.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=date;
    hasta_fecha.Date:=date;
end;

end.
