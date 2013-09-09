unit Unitliquidaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, BaseGrid, AdvGrid, DBAdvGrid, Titles,
  AdvListV, UnitSqlListView, MQuery, math, rpcompobase, rpvclreport;

type
  Tliquidaciones = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label1: TLabel;
    liquidacionvendedor_id: TEdit;
    liquidacionvendedor_fecha: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    personal_id: TSqlComboBox;
    btncancelar: TButton;
    btnguardar: TButton;
    Label3: TLabel;
    liquidacionvendedor_desdefecha: TDateTimePicker;
    Label13: TLabel;
    liquidacionvendedor_hastafecha: TDateTimePicker;
    btnactualizar: TButton;
    Label21: TLabel;
    liquidacionvendedor_total: TDBAdvEdit;
    sucursal_id: TSqlListView;
    tiSucursales: TTitles;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    btnquitarpordefecto: TButton;
    Label15: TLabel;
    liquidacionvendedor_subtotal1: TDBAdvEdit;
    TabSheet4: TTabSheet;
    DBGrid2: TDBGrid;
    btnquitarenfactura: TButton;
    Label5: TLabel;
    liquidacionvendedor_subtotal2: TDBAdvEdit;
    btnquitarenobservaciones: TButton;
    Label6: TLabel;
    liquidacionvendedor_subtotal3: TDBAdvEdit;
    DBGrid4: TDBGrid;
    btnquitardebcred: TButton;
    Label7: TLabel;
    liquidacionvendedor_subtotal4: TDBAdvEdit;
    DSCPorDefecto: TDataSource;
    MQPorDefecto: TMQuery;
    Label8: TLabel;
    ZQliquivendedoressucursales: TZQuery;
    ZQliquidacionesvendedores: TZQuery;
    btncalcular: TButton;
    ZQfacturasventa: TZQuery;
    ZQComisiones: TZQuery;
    MQEnFacturas: TMQuery;
    DSCEnFacturas: TDataSource;
    ZQControlDetalle: TZQuery;
    DBGrid1: TDBGrid;
    MQEnObservaciones: TMQuery;
    DSCEnObservaciones: TDataSource;
    DBGrid3: TDBGrid;
    ZQvendedoresdebcred: TZQuery;
    DSCvendedoresdebcred: TDataSource;
    ZQliquivendedeta: TZQuery;
    btnimprimir: TButton;
    VCLReport1: TVCLReport;
    MQPorDefectoliquivendedeta_id: TIntegerField;
    MQPorDefectoproducto_id: TStringField;
    MQPorDefectocomisionvendedor_tipo: TStringField;
    MQPorDefectocomisionvendedor_valor: TFloatField;
    MQPorDefectoliquidacionvendedor_id: TIntegerField;
    MQPorDefectodocumentoventa_fecha: TDateField;
    MQPorDefectodocumentoventa_numero: TIntegerField;
    MQPorDefectocliente_nombre: TStringField;
    MQPorDefectodocumentoventadetalle_descripcion: TStringField;
    MQPorDefectodocumentoventadetalle_cantidad: TFloatField;
    MQPorDefectodocumentoventadetalle_precio: TFloatField;
    MQPorDefectosucursal_tipoliquidvendedor: TStringField;
    MQPorDefectoliquivendedeta_importe: TFloatField;
    MQPorDefectopuntoventa_numero: TStringField;
    MQPorDefectosucursal_nombre: TStringField;
    MQEnFacturasliquivendedeta_id: TIntegerField;
    MQEnFacturasproducto_id: TStringField;
    MQEnFacturascomisionvendedor_tipo: TStringField;
    MQEnFacturascomisionvendedor_valor: TFloatField;
    MQEnFacturasliquidacionvendedor_id: TIntegerField;
    MQEnFacturasdocumentoventa_fecha: TDateField;
    MQEnFacturasdocumentoventa_numero: TIntegerField;
    MQEnFacturascliente_nombre: TStringField;
    MQEnFacturasdocumentoventadetalle_descripcion: TStringField;
    MQEnFacturasdocumentoventadetalle_cantidad: TFloatField;
    MQEnFacturasdocumentoventadetalle_precio: TFloatField;
    MQEnFacturassucursal_tipoliquidvendedor: TStringField;
    MQEnFacturasliquivendedeta_importe: TFloatField;
    MQEnFacturaspuntoventa_numero: TStringField;
    MQEnFacturassucursal_nombre: TStringField;
    MQEnObservacionesliquivendedeta_id: TIntegerField;
    MQEnObservacionesproducto_id: TStringField;
    MQEnObservacionescomisionvendedor_tipo: TStringField;
    MQEnObservacionescomisionvendedor_valor: TFloatField;
    MQEnObservacionesliquidacionvendedor_id: TIntegerField;
    MQEnObservacionesdocumentoventa_fecha: TDateField;
    MQEnObservacionesdocumentoventa_numero: TIntegerField;
    MQEnObservacionescliente_nombre: TStringField;
    MQEnObservacionesdocumentoventadetalle_descripcion: TStringField;
    MQEnObservacionesdocumentoventadetalle_cantidad: TFloatField;
    MQEnObservacionesdocumentoventadetalle_precio: TFloatField;
    MQEnObservacionessucursal_tipoliquidvendedor: TStringField;
    MQEnObservacionesliquivendedeta_importe: TFloatField;
    MQEnObservacionespuntoventa_numero: TStringField;
    MQEnObservacionessucursal_nombre: TStringField;
    ZQvendedoresdebcredvendedordebcred_id: TIntegerField;
    ZQvendedoresdebcredvendedordebcred_fecha: TDateField;
    ZQvendedoresdebcredvendedordebcred_descripcion: TStringField;
    ZQvendedoresdebcredvendedordebcred_tipo: TStringField;
    ZQvendedoresdebcredvendedordebcred_importe: TFloatField;
    ZQvendedoresdebcredvendedordebcred_estado: TStringField;
    ZQvendedoresdebcredliquidacionvendedor_id: TIntegerField;
    ZQvendedoresdebcredpersonal_id: TIntegerField;
    ZQvendedoresdebcredimporte: TFloatField;
    ZQvendedoresdebcredpersonal_id_1: TIntegerField;
    ZQvendedoresdebcredpersonal_nombre: TStringField;
    ZQvendedoresdebcredpersonal_domicilio: TStringField;
    ZQvendedoresdebcredpersonal_telefono: TStringField;
    ZQvendedoresdebcredpersonal_celular: TStringField;
    ZQvendedoresdebcredpersonal_mail: TStringField;
    ZQvendedoresdebcredpersonal_usuario: TStringField;
    ZQvendedoresdebcredpersonal_pass: TStringField;
    ZQvendedoresdebcredperfil_id: TIntegerField;
    MQPorDefectodocumentoventadetalle_id: TStringField;
    MQEnFacturasdocumentoventadetalle_id: TStringField;
    MQEnObservacionesdocumentoventadetalle_id: TStringField;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure solic_cuotasExit(Sender: TObject);
    procedure solic_importecuotaExit(Sender: TObject);
    procedure solic_prestadoExit(Sender: TObject);
    procedure cliente_idSelect(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure btncalcularClick(Sender: TObject);
    procedure btnquitarpordefectoClick(Sender: TObject);
    procedure btnquitarenfacturaClick(Sender: TObject);
    procedure btnquitarenobservacionesClick(Sender: TObject);
    procedure btnquitardebcredClick(Sender: TObject);
    procedure ZQliquidacionesvendedoresAfterOpen(DataSet: TDataSet);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    EsVendedorPorDefecto:boolean;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
    function ControlDetalle(documentoventadetalle_id:string; producto_id:string; detalle_tipo:string):boolean;
    procedure PasarAMQuery(Qorig:TDataset;QDest:TDataset; detalle_tipo:string);
    procedure PasarAMQuery2(QDest:TDataset; detalle_tipo:string);
    procedure CargarPorDefecto;
    procedure CargarEnFactura;
    procedure CargarEnObservaciones;
    procedure CargarEnOtros;
    procedure CargarVendedoresDebCred;
    procedure CalcularTotal(detalle:Tdataset; subtotal:TDBAdvEdit);
    procedure CalcularTotalDebCred;
    procedure CalularTotales;
    procedure TraerPorDefecto;
    procedure TraerEnFactura;
    procedure TraerEnObservaciones;
    procedure TraerEnOtros;
    procedure TraerDebitosCreditos;
    procedure TraerDetalles;
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  liquidaciones: Tliquidaciones;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Tliquidaciones.TraerDebitosCreditos;
begin
    ZQvendedoresdebcred.Active:=false;
    ZQvendedoresdebcred.SQL.Text:='select *, if(vendedordebcred_tipo="Debito",vendedordebcred_importe*-1,vendedordebcred_importe) as importe '+
                               'from vendedoresdebcred '+
                               'inner join personal on vendedoresdebcred.personal_id=personal.personal_id '+
                               'where liquidacionvendedor_id="'+id+'"';

    ZQvendedoresdebcred.Active:=true;

end;

procedure Tliquidaciones.TraerEnObservaciones;
begin
    PasarAMQuery2(MQEnObservaciones,'En Observaciones');
end;

procedure Tliquidaciones.TraerEnOtros;
begin
    PasarAMQuery2(MQEnObservaciones,'En Otros');
end;

procedure Tliquidaciones.TraerEnFactura;
begin
    PasarAMQuery2(MQEnFacturas,'En Factura');
end;

procedure Tliquidaciones.PasarAMQuery2(QDest: TDataSet; detalle_tipo: string);
var
  Qorig:TZQuery;
begin
    Qorig:= TZQuery.Create(self);
    Qorig.Connection:=Princ.ZBase;
    Qorig.Active:=false;
    Qorig.SQL.Text:='select * from liquivendedeta '+
                    'inner join documentoventadetalles on liquivendedeta.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                    'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                    'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                    'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                    'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                    'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                    'where liquidacionvendedor_id="'+id+'" and liquivendedeta_tipodetalle="'+detalle_tipo+'"';
    Qorig.Active:=true;

    QDest.Active:=false;
    QDest.Active:=true;

    Qorig.First;
    while not Qorig.Eof do
        begin
            QDest.Insert;
            QDest.FieldByName('liquivendedeta_id').AsString:=Qorig.FieldByName('liquivendedeta_id').AsString;
            QDest.FieldByName('documentoventadetalle_id').AsString:=Qorig.FieldByName('documentoventadetalle_id').AsString;
            QDest.FieldByName('producto_id').AsString:=Qorig.FieldByName('producto_id').AsString;
            QDest.FieldByName('comisionvendedor_tipo').AsString:=Qorig.FieldByName('comisionvendedor_tipo').AsString;
            QDest.FieldByName('comisionvendedor_valor').AsString:=Qorig.FieldByName('comisionvendedor_valor').AsString;
            QDest.FieldByName('liquidacionvendedor_id').AsString:=Qorig.FieldByName('liquidacionvendedor_id').AsString;
            QDest.FieldByName('documentoventa_fecha').AsDateTime:=Qorig.FieldByName('documentoventa_fecha').AsDateTime;
            QDest.FieldByName('documentoventa_numero').AsString:=Qorig.FieldByName('documentoventa_numero').AsString;
            QDest.FieldByName('cliente_nombre').AsString:=Qorig.FieldByName('cliente_nombre').AsString;
            QDest.FieldByName('documentoventadetalle_descripcion').AsString:=Qorig.FieldByName('documentoventadetalle_descripcion').AsString;
            QDest.FieldByName('documentoventadetalle_cantidad').AsString:=Qorig.FieldByName('documentoventadetalle_cantidad').AsString;
            QDest.FieldByName('sucursal_tipoliquidvendedor').AsString:=Qorig.FieldByName('sucursal_tipoliquidvendedor').AsString;
            QDest.FieldByName('documentoventadetalle_precio').AsString:=Qorig.FieldByName('documentoventadetalle_total').AsString;
            QDest.FieldByName('liquivendedeta_importe').AsString:=Qorig.FieldByName('liquivendedeta_importe').AsString;
            QDest.FieldByName('puntoventa_numero').AsString:=Qorig.FieldByName('puntoventa_numero').AsString;
            QDest.FieldByName('sucursal_nombre').AsString:=Qorig.FieldByName('sucursal_nombre').AsString;

            QDest.Post;

            Qorig.Next;
        end;
    Qorig.Free;
end;

procedure Tliquidaciones.TraerPorDefecto;
begin
    PasarAMQuery2(MQPorDefecto,'Por Defecto');

end;

procedure Tliquidaciones.TraerDetalles;
begin
    TraerPorDefecto;
    TraerEnFactura;
    TraerEnOtros;
    TraerDebitosCreditos;
    CalularTotales;


end;

procedure Tliquidaciones.CalcularTotalDebCred;
begin
    liquidacionvendedor_subtotal4.FloatValue:=0;
    ZQvendedoresdebcred.First;
    while not ZQvendedoresdebcred.Eof do
        begin
            liquidacionvendedor_subtotal4.FloatValue:=liquidacionvendedor_subtotal4.FloatValue+ZQvendedoresdebcred.FieldByName('importe').AsFloat;

            ZQvendedoresdebcred.Next;
        end;


end;

procedure Tliquidaciones.CargarVendedoresDebCred;
begin
    ZQvendedoresdebcred.Active:=false;
    ZQvendedoresdebcred.SQL.Text:='select *, if(vendedordebcred_tipo="Debito",vendedordebcred_importe*-1,vendedordebcred_importe) as importe '+
                                  'from vendedoresdebcred '+
                                  'inner join personal on vendedoresdebcred.personal_id=personal.personal_id '+
                                  'where (vendedordebcred_fecha between "'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_desdefecha.Date)+'" and "'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_hastafecha.Date)+'") '+
                                  'and (liquidacionvendedor_id=0 or liquidacionvendedor_id="'+id+'") and '+
                                  'personal.personal_id="'+personal_id.codigo+'"';
    ZQvendedoresdebcred.Active:=true;


end;

procedure Tliquidaciones.CalcularTotal(detalle:Tdataset; subtotal:TDBAdvEdit);
begin
    subtotal.FloatValue:=0;
    detalle.First;
    while not detalle.Eof do
        begin
            if detalle.FieldByName('comisionvendedor_tipo').AsString='Porcentaje' then
              begin
                  detalle.Edit;
                  detalle.FieldByName('liquivendedeta_importe').AsFloat:=roundto(detalle.FieldByName('documentoventadetalle_precio').AsFloat*detalle.FieldByName('comisionvendedor_valor').AsFloat/100,-2);
                  detalle.Post;


              end;

            if detalle.FieldByName('comisionvendedor_tipo').AsString='Cantidad' then
              begin
                  detalle.Edit;
                  detalle.FieldByName('liquivendedeta_importe').AsFloat:=roundto(detalle.FieldByName('documentoventadetalle_cantidad').AsFloat*detalle.FieldByName('comisionvendedor_valor').AsFloat,-2);
                  detalle.Post;

              end;

            subtotal.FloatValue:=subtotal.FloatValue+detalle.FieldByName('liquivendedeta_importe').AsFloat;

            detalle.Next;
        end;

end;

procedure Tliquidaciones.CargarEnOtros;
var
  where:string;
begin
    sucursal_id.LlenarMQuery;
    sucursal_id.FQChequeados.First;
    sucursal_id.GenerarWhere;
    where := 'where documentoventapersonal.personal_id="'+personal_id.codigo+'"  and documentoventa_estado<>"ANULADA" and '+
             '(documentoventa_fecha between "'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_desdefecha.Date)+'" and '+
             '"'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_hastafecha.Date)+'") and '+
             sucursal_id.where;

    ZQfacturasventa.Active:=false;
    ZQfacturasventa.SQL.Text:='select *'+
                              'from documentosventas '+
                              'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                              'inner join documentoventapersonal on documentosventas.documentoventa_id=documentoventapersonal.documentoventa_id '+
                              'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                              'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                              'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                              'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                              where;
    ZQfacturasventa.Active:=true;
    MQEnObservaciones.Active:=false;
    MQEnObservaciones.Active:=true;

    PasarAMQuery(ZQfacturasventa,MQEnObservaciones, 'En Observaciones');



end;



procedure Tliquidaciones.CargarEnObservaciones;
var
  where:string;
begin

end;



procedure Tliquidaciones.CargarPorDefecto;
var
  where:string;
begin
    MQPorDefecto.Active:=false;
    MQPorDefecto.Active:=true;
    if personal_id.codigo=Princ.GetConfiguracion('PERSONALIDCOMISIONESDEF') then
      begin
          sucursal_id.LlenarMQuery;
          sucursal_id.FQChequeados.First;
          sucursal_id.GenerarWhere;
          where := 'where documentoventa_estado<>"ANULADA" and '+
                   '(documentoventa_fecha between "'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_desdefecha.Date)+'" and '+
                   '"'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_hastafecha.Date)+'") and tipodocu_nombre="Factura de Venta" and '+
                   sucursal_id.where;

          ZQfacturasventa.Active:=false;
          ZQfacturasventa.SQL.Text:='select *'+
                                    'from documentosventas '+
                                    'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                    'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                    'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                    'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                    'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                                    where;
          ZQfacturasventa.Active:=true;


          PasarAMQuery(ZQfacturasventa,MQPorDefecto, 'Por Defecto');


      end;





end;


function Tliquidaciones.ControlDetalle(documentoventadetalle_id: string; producto_id: string; detalle_tipo: string):boolean;
var
  id_encontrado:string;
begin
    ZQControlDetalle.Active:=false;
    ZQControlDetalle.SQL.Text:='select liquivendedeta.liquidacionvendedor_id from liquivendedeta '+
                               'inner join liquidacionesvendedores on liquivendedeta.liquidacionvendedor_id=liquidacionesvendedores.liquidacionvendedor_id '+
                               'inner join documentoventadetalles on liquivendedeta.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                               'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                               'where documentoventadetalles.documentoventadetalle_id="'+documentoventadetalle_id+'" and '+
                               'documentosventas.personal_id="'+personal_id.codigo+'" and '+
                               'documentoventadetalles.producto_id="'+producto_id+'" and '+
                               'liquivendedeta_tipodetalle="'+detalle_tipo+'"';

    ZQControlDetalle.Active:=true;

    id_encontrado:=ZQControlDetalle.FieldByName('liquidacionvendedor_id').AsString;


    if (id_encontrado='') or (id_encontrado=id) then
      result:=true
    else
      result:=false;

end;


procedure Tliquidaciones.PasarAMQuery(Qorig: TDataSet; QDest: TDataSet; detalle_tipo:string);
begin
    Qorig.First;
    while not Qorig.Eof do
        begin
            if ControlDetalle(Qorig.FieldByName('documentoventadetalle_id').AsString, Qorig.FieldByName('producto_id').AsString, detalle_tipo) then
              begin
                  ZQComisiones.Active:=false;
                  ZQComisiones.SQL.Text:='select * from comisionesvendedor '+
                                         'where personal_id="'+personal_id.codigo+'" and '+
                                         'producto_id="'+Qorig.FieldByName('producto_id').AsString+'"';
                  ZQComisiones.Active:=true;
                  ZQComisiones.First;

                  QDest.Insert;
                  QDest.FieldByName('liquivendedeta_id').AsString:='0';
                  QDest.FieldByName('documentoventadetalle_id').AsString:=Qorig.FieldByName('documentoventadetalle_id').AsString;
                  QDest.FieldByName('producto_id').AsString:=Qorig.FieldByName('producto_id').AsString;
                  QDest.FieldByName('comisionvendedor_tipo').AsString:=ZQComisiones.FieldByName('comisionvendedor_tipo').AsString;
                  QDest.FieldByName('comisionvendedor_valor').AsString:=ZQComisiones.FieldByName('comisionvendedor_valor').AsString;
                  QDest.FieldByName('liquidacionvendedor_id').AsString:='0';
                  QDest.FieldByName('documentoventa_fecha').AsDateTime:=Qorig.FieldByName('documentoventa_fecha').AsDateTime;
                  QDest.FieldByName('documentoventa_numero').AsString:=Qorig.FieldByName('documentoventa_numero').AsString;
                  QDest.FieldByName('cliente_nombre').AsString:=Qorig.FieldByName('cliente_nombre').AsString;
                  QDest.FieldByName('documentoventadetalle_descripcion').AsString:=Qorig.FieldByName('documentoventadetalle_descripcion').AsString;
                  QDest.FieldByName('documentoventadetalle_cantidad').AsString:=Qorig.FieldByName('documentoventadetalle_cantidad').AsString;
                  QDest.FieldByName('sucursal_tipoliquidvendedor').AsString:=princ.buscar('select sucursal_tipoliquidvendedor from sucursales where sucursal_id="'+Qorig.FieldByName('sucursal_id').AsString+'"','sucursal_tipoliquidvendedor');
                  QDest.FieldByName('documentoventadetalle_precio').AsString:=Qorig.FieldByName('documentoventadetalle_total').AsString;
                  if QDest.FieldByName('sucursal_tipoliquidvendedor').AsString='Neto' then
                    QDest.FieldByName('documentoventadetalle_precio').AsFloat:=roundto(QDest.FieldByName('documentoventadetalle_precio').AsFloat/1.21,-2);

//                    QDest.FieldByName('documentoventadetalle_precio').AsFloat:=Qorig.FieldByName('documentoventadetalle_neto21').AsFloat+Qorig.FieldByName('documentoventadetalle_neto105').AsFloat;

                  QDest.FieldByName('liquivendedeta_importe').AsString:='0';
                  QDest.FieldByName('puntoventa_numero').AsString:=Qorig.FieldByName('puntoventa_numero').AsString;
                  QDest.FieldByName('sucursal_nombre').AsString:=Qorig.FieldByName('sucursal_nombre').AsString;

                  QDest.Post;

              end;

            Qorig.Next;
        end;


end;

procedure Tliquidaciones.CargarEnFactura;
var
  where:string;
begin
    sucursal_id.LlenarMQuery;
    sucursal_id.FQChequeados.First;
    sucursal_id.GenerarWhere;
    where := 'where documentoventa_estado<>"ANULADA" and (documentosventas.personal_id="'+personal_id.codigo+'") and '+
             '(documentoventa_fecha between "'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_desdefecha.Date)+'" and '+
             '"'+formatdatetime('yyyy-mm-dd',liquidacionvendedor_hastafecha.Date)+'") and tipodocu_nombre="Factura de Venta" and '+
             sucursal_id.where;

    ZQfacturasventa.Active:=false;
    ZQfacturasventa.SQL.Text:='select *'+
                              'from documentosventas '+
                              'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                              'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                              'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                              'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                              'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                              where;
    ZQfacturasventa.Active:=true;
    MQEnFacturas.Active:=false;
    MQEnFacturas.Active:=true;

    PasarAMQuery(ZQfacturasventa,MQEnFacturas, 'En Factura');



end;


procedure Tliquidaciones.CalularTotales;
begin
    CalcularTotal(MQPorDefecto,liquidacionvendedor_subtotal1);
    CalcularTotal(MQEnFacturas,liquidacionvendedor_subtotal2);
    CalcularTotal(MQEnObservaciones,liquidacionvendedor_subtotal3);
    CalcularTotalDebCred;

    liquidacionvendedor_total.FloatValue:=liquidacionvendedor_subtotal1.FloatValue+liquidacionvendedor_subtotal2.FloatValue+liquidacionvendedor_subtotal3.FloatValue+liquidacionvendedor_subtotal4.FloatValue;

end;


procedure Tliquidaciones.imprimir;
begin
end;


procedure Tliquidaciones.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquivendedeta');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id');
    ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquivendedoressucursales');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id');
    ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
    ZQuery2.ExecSQL;


    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update vendedoresdebcred set ');
    ZQuery2.sql.add('liquidacionvendedor_id=:liquidacionvendedor_id2');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id1');
    ZQuery2.parambyname('liquidacionvendedor_id2').asstring:='0';
    ZQuery2.parambyname('liquidacionvendedor_id1').asstring:=id;
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquidacionesvendedores');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id');
    ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
    ZQuery2.ExecSQL;



    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Tliquidaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tliquidaciones.FormCreate(Sender: TObject);
begin
    id:='';
    personal_id.llenarcombo;
    personal_id.ItemIndex:=-1;

    sucursal_id.Fill;

    EsVendedorPorDefecto:=true;

end;

procedure Tliquidaciones.FormShow(Sender: TObject);
begin
    ZQliquidacionesvendedores.Active:=false;
    ZQliquidacionesvendedores.ParamByName('liquidacionvendedor_id').AsString:=id;
    ZQliquidacionesvendedores.Active:=true;

//    btnimprimir.Enabled:=false;
//    if abm=4 then
//      btnimprimir.Enabled:=true;

    if abm=3 then
      btnguardar.Caption:='Eliminar';

end;

procedure Tliquidaciones.modificar;
var
  i:integer;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquivendedeta');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id');
    ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquivendedoressucursales');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id');
    ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
    ZQuery2.ExecSQL;


    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update vendedoresdebcred set ');
    ZQuery2.sql.add('liquidacionvendedor_id=:liquidacionvendedor_id2');
    ZQuery2.sql.add(' where liquidacionvendedor_id=:liquidacionvendedor_id1');
    ZQuery2.parambyname('liquidacionvendedor_id2').asstring:='0';
    ZQuery2.parambyname('liquidacionvendedor_id1').asstring:=id;
    ZQuery2.ExecSQL;


    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update liquidacionesvendedores set ');
    ZQuery2.Sql.Add('personal_id=:personal_id, ');
    ZQuery2.Sql.Add('liquidacionvendedor_total=:liquidacionvendedor_total, ');
    ZQuery2.Sql.Add('liquidacionvendedor_hastafecha=:liquidacionvendedor_hastafecha, ');
    ZQuery2.Sql.Add('liquidacionvendedor_desdefecha=:liquidacionvendedor_desdefecha, ');
    ZQuery2.Sql.Add('liquidacionvendedor_fecha=:liquidacionvendedor_fecha ');
    ZQuery2.Sql.Add('where liquidacionvendedor_id=:liquidacionvendedor_id ');
    ZQuery2.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQuery2.parambyname('liquidacionvendedor_desdefecha').asstring:=formatdatetime('yyyy-mm-dd',liquidacionvendedor_desdefecha.Date);
    ZQuery2.parambyname('liquidacionvendedor_fecha').asstring:=formatdatetime('yyyy-mm-dd',liquidacionvendedor_fecha.Date);
    ZQuery2.parambyname('liquidacionvendedor_hastafecha').asstring:=formatdatetime('yyyy-mm-dd',liquidacionvendedor_hastafecha.Date);
    ZQuery2.parambyname('liquidacionvendedor_total').asstring:=liquidacionvendedor_total.text;
    ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
    ZQuery2.ExecSql;




//    suc_codi.LlenarMQuery;
//    while not suc_codi.FQChequeados.Eof do
//        begin
//            ZQuery2.sql.clear;
//            ZQuery2.sql.add('Insert into liquivendedoressucursales (liquidacionvendedor_id, ');
//            ZQuery2.sql.add('liquivendedoressucursales_id, suc_codi) ');
//            ZQuery2.sql.add('values (:liquidacionvendedor_id, ');
//            ZQuery2.sql.add(':liquivendedoressucursales_id, :suc_codi)');
//            ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
//            ZQuery2.parambyname('liquivendedoressucursales_id').asstring:=Princ.codigo('liquivendedoressucursales','liquivendedoressucursales_id');
//            ZQuery2.parambyname('suc_codi').asstring:=suc_codi.FQChequeados.FieldByName('suc_codi').AsString;
//            ZQuery2.ExecSQL;
//
//
//
//            suc_codi.FQChequeados.Next;
//        end;


    MQPorDefecto.First;
    while not MQPorDefecto.Eof do
        begin
            ZQuery2.Sql.Clear;
            ZQuery2.Sql.Add('insert into liquivendedeta set ');
            ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
            ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.Sql.Add('liquivendedeta_tipodetalle=:liquivendedeta_tipodetalle, ');
            ZQuery2.Sql.Add('liquivendedeta_importe=:liquivendedeta_importe, ');
            ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
            ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
            ZQuery2.Sql.Add('liquivendedeta_id=:liquivendedeta_id ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQPorDefecto.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
            ZQuery2.ParamByName('liquivendedeta_tipodetalle').AsString:='Por Defecto';
            ZQuery2.ParamByName('liquivendedeta_importe').AsString:=MQPorDefecto.FieldByName('liquivendedeta_importe').AsString;
            ZQuery2.ParamByName('comisionvendedor_valor').AsString:=MQPorDefecto.FieldByName('comisionvendedor_valor').AsString;
            ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=MQPorDefecto.FieldByName('comisionvendedor_tipo').AsString;
            ZQuery2.ParamByName('liquivendedeta_id').AsString:=Princ.codigo('liquivendedeta','liquivendedeta_id');
            ZQuery2.ExecSql;

            MQPorDefecto.Next;
        end;


    MQEnFacturas.First;
    while not MQEnFacturas.Eof do
        begin
            ZQuery2.Sql.Clear;
            ZQuery2.Sql.Add('insert into liquivendedeta set ');
            ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
            ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.Sql.Add('liquivendedeta_tipodetalle=:liquivendedeta_tipodetalle, ');
            ZQuery2.Sql.Add('liquivendedeta_importe=:liquivendedeta_importe, ');
            ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
            ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
            ZQuery2.Sql.Add('liquivendedeta_id=:liquivendedeta_id ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQEnFacturas.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
            ZQuery2.ParamByName('liquivendedeta_tipodetalle').AsString:='En Factura';
            ZQuery2.ParamByName('liquivendedeta_importe').AsString:=MQEnFacturas.FieldByName('liquivendedeta_importe').AsString;
            ZQuery2.ParamByName('comisionvendedor_valor').AsString:=MQEnFacturas.FieldByName('comisionvendedor_valor').AsString;
            ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=MQEnFacturas.FieldByName('comisionvendedor_tipo').AsString;
            ZQuery2.ParamByName('liquivendedeta_id').AsString:=Princ.codigo('liquivendedeta','liquivendedeta_id');
            ZQuery2.ExecSql;



            MQEnFacturas.Next;
        end;


    MQEnObservaciones.First;
    while not MQEnObservaciones.Eof do
        begin
            ZQuery2.Sql.Clear;
            ZQuery2.Sql.Add('insert into liquivendedeta set ');
            ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
            ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.Sql.Add('liquivendedeta_tipodetalle=:liquivendedeta_tipodetalle, ');
            ZQuery2.Sql.Add('liquivendedeta_importe=:liquivendedeta_importe, ');
            ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
            ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
            ZQuery2.Sql.Add('liquivendedeta_id=:liquivendedeta_id ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQEnObservaciones.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
            ZQuery2.ParamByName('liquivendedeta_tipodetalle').AsString:='En Otros';
            ZQuery2.ParamByName('liquivendedeta_importe').AsString:=MQEnObservaciones.FieldByName('liquivendedeta_importe').AsString;
            ZQuery2.ParamByName('comisionvendedor_valor').AsString:=MQEnObservaciones.FieldByName('comisionvendedor_valor').AsString;
            ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=MQEnObservaciones.FieldByName('comisionvendedor_tipo').AsString;
            ZQuery2.ParamByName('liquivendedeta_id').AsString:=Princ.codigo('liquivendedeta','liquivendedeta_id');
            ZQuery2.ExecSql;

            MQEnObservaciones.Next;
        end;


    ZQvendedoresdebcred.First;
    while not ZQvendedoresdebcred.Eof do
        begin
            ZQuery2.sql.clear;
            ZQuery2.sql.add('Update vendedoresdebcred set ');
            ZQuery2.sql.add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.sql.add('vendedordebcred_estado=:vendedordebcred_estado');
            ZQuery2.sql.add(' where vendedordebcred_id=:vendedordebcred_id');
            ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
            ZQuery2.parambyname('vendedordebcred_estado').asstring:='LIQUIDADO';
            ZQuery2.parambyname('vendedordebcred_id').asstring:=ZQvendedoresdebcred.FieldByName('vendedordebcred_id').AsString;
            ZQuery2.ExecSQL;

            ZQvendedoresdebcred.Next;
        end;




    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    if (MessageDlg('Datos guardados correctamente.'+#13+#10+'Desea imprimir esta liquidacion?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          btnguardar.Enabled:=false;
          btnimprimir.Click;

      end
    else
      Self.Close;

end;


procedure Tliquidaciones.solic_cuotasExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure Tliquidaciones.solic_importecuotaExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure Tliquidaciones.solic_prestadoExit(Sender: TObject);
begin
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure Tliquidaciones.ZQliquidacionesvendedoresAfterOpen(DataSet: TDataSet);
var
  i:integer;
begin
    if abm=1 then
      begin
          liquidacionvendedor_id.Text:=Princ.codigo('liquidacionesvendedores','liquidacionvendedor_id');
          liquidacionvendedor_fecha.Date:=date;
          liquidacionvendedor_desdefecha.Date:=date;
          liquidacionvendedor_hastafecha.Date:=date;




      end
    else
      begin
          liquidacionvendedor_id.Text:=ZQliquidacionesvendedores.FieldByName('liquidacionvendedor_id').AsString;
          liquidacionvendedor_fecha.Date:=ZQliquidacionesvendedores.FieldByName('liquidacionvendedor_fecha').AsDateTime;
          liquidacionvendedor_desdefecha.Date:=ZQliquidacionesvendedores.FieldByName('liquidacionvendedor_desdefecha').AsDateTime;
          liquidacionvendedor_hastafecha.Date:=ZQliquidacionesvendedores.FieldByName('liquidacionvendedor_hastafecha').AsDateTime;
          personal_id.Buscar(ZQliquidacionesvendedores.FieldByName('personal_id').AsString);

          ZQliquivendedoressucursales.Active:=false;
          ZQliquivendedoressucursales.ParamByName('liquidacionvendedor_id').AsString:=id;
          ZQliquivendedoressucursales.Active:=true;

          for i:=0 to sucursal_id.Items.Count-1 do
            begin
                if ZQliquivendedoressucursales.Locate('sucursal_id',sucursal_id.Items.Item[i].Caption,[]) then
                  begin
                      sucursal_id.Items.Item[i].Checked:=true;
                  end;
            end;
          TraerDetalles;
end;


end;
procedure Tliquidaciones.agregar;
var
  i: Integer;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('liquidacionesvendedores','liquidacionvendedor_id');

    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into liquidacionesvendedores set ');
    ZQuery2.Sql.Add('personal_id=:personal_id, ');
    ZQuery2.Sql.Add('liquidacionvendedor_total=:liquidacionvendedor_total, ');
    ZQuery2.Sql.Add('liquidacionvendedor_hastafecha=:liquidacionvendedor_hastafecha, ');
    ZQuery2.Sql.Add('liquidacionvendedor_desdefecha=:liquidacionvendedor_desdefecha, ');
    ZQuery2.Sql.Add('liquidacionvendedor_fecha=:liquidacionvendedor_fecha, ');
    ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id ');
    ZQuery2.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQuery2.ParamByName('liquidacionvendedor_total').AsString:=liquidacionvendedor_total.Text;
    ZQuery2.parambyname('liquidacionvendedor_desdefecha').asstring:=formatdatetime('yyyy-mm-dd',liquidacionvendedor_desdefecha.Date);
    ZQuery2.parambyname('liquidacionvendedor_fecha').asstring:=formatdatetime('yyyy-mm-dd',liquidacionvendedor_fecha.Date);
    ZQuery2.parambyname('liquidacionvendedor_hastafecha').asstring:=formatdatetime('yyyy-mm-dd',liquidacionvendedor_hastafecha.Date);
    ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
    ZQuery2.ExecSql;


    sucursal_id.LlenarMQuery;
    while not sucursal_id.FQChequeados.Eof do
        begin
            ZQuery2.sql.clear;
            ZQuery2.sql.add('Insert into liquivendedoressucursales (liquidacionvendedor_id, ');
            ZQuery2.sql.add('liquivendedoressucursales_id, sucursal_id) ');
            ZQuery2.sql.add('values (:liquidacionvendedor_id, ');
            ZQuery2.sql.add(':liquivendedoressucursales_id, :sucursal_id)');
            ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
            ZQuery2.parambyname('liquivendedoressucursales_id').asstring:=Princ.codigo('liquivendedoressucursales','liquivendedoressucursales_id');
            ZQuery2.parambyname('sucursal_id').asstring:=sucursal_id.FQChequeados.FieldByName('sucursal_id').AsString;
            ZQuery2.ExecSQL;



            sucursal_id.FQChequeados.Next;
        end;


    MQPorDefecto.First;
    while not MQPorDefecto.Eof do
        begin
            ZQuery2.Sql.Clear;
            ZQuery2.Sql.Add('insert into liquivendedeta set ');
            ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
            ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.Sql.Add('liquivendedeta_tipodetalle=:liquivendedeta_tipodetalle, ');
            ZQuery2.Sql.Add('liquivendedeta_importe=:liquivendedeta_importe, ');
            ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
            ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
            ZQuery2.Sql.Add('liquivendedeta_id=:liquivendedeta_id ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQPorDefecto.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
            ZQuery2.ParamByName('liquivendedeta_tipodetalle').AsString:='Por Defecto';
            ZQuery2.ParamByName('liquivendedeta_importe').AsString:=MQPorDefecto.FieldByName('liquivendedeta_importe').AsString;
            ZQuery2.ParamByName('comisionvendedor_valor').AsString:=MQPorDefecto.FieldByName('comisionvendedor_valor').AsString;
            ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=MQPorDefecto.FieldByName('comisionvendedor_tipo').AsString;
            ZQuery2.ParamByName('liquivendedeta_id').AsString:=Princ.codigo('liquivendedeta','liquivendedeta_id');
            ZQuery2.ExecSql;

            MQPorDefecto.Next;
        end;


    MQEnFacturas.First;
    while not MQEnFacturas.Eof do
        begin
            ZQuery2.Sql.Clear;
            ZQuery2.Sql.Add('insert into liquivendedeta set ');
            ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
            ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.Sql.Add('liquivendedeta_tipodetalle=:liquivendedeta_tipodetalle, ');
            ZQuery2.Sql.Add('liquivendedeta_importe=:liquivendedeta_importe, ');
            ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
            ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
            ZQuery2.Sql.Add('liquivendedeta_id=:liquivendedeta_id ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQEnFacturas.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
            ZQuery2.ParamByName('liquivendedeta_tipodetalle').AsString:='En Factura';
            ZQuery2.ParamByName('liquivendedeta_importe').AsString:=MQEnFacturas.FieldByName('liquivendedeta_importe').AsString;
            ZQuery2.ParamByName('comisionvendedor_valor').AsString:=MQEnFacturas.FieldByName('comisionvendedor_valor').AsString;
            ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=MQEnFacturas.FieldByName('comisionvendedor_tipo').AsString;
            ZQuery2.ParamByName('liquivendedeta_id').AsString:=Princ.codigo('liquivendedeta','liquivendedeta_id');
            ZQuery2.ExecSql;



            MQEnFacturas.Next;
        end;


    MQEnObservaciones.First;
    while not MQEnObservaciones.Eof do
        begin
            ZQuery2.Sql.Clear;
            ZQuery2.Sql.Add('insert into liquivendedeta set ');
            ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
            ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.Sql.Add('liquivendedeta_tipodetalle=:liquivendedeta_tipodetalle, ');
            ZQuery2.Sql.Add('liquivendedeta_importe=:liquivendedeta_importe, ');
            ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
            ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
            ZQuery2.Sql.Add('liquivendedeta_id=:liquivendedeta_id ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQEnObservaciones.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionvendedor_id').AsString:=id;
            ZQuery2.ParamByName('liquivendedeta_tipodetalle').AsString:='En Otros';
            ZQuery2.ParamByName('liquivendedeta_importe').AsString:=MQEnObservaciones.FieldByName('liquivendedeta_importe').AsString;
            ZQuery2.ParamByName('comisionvendedor_valor').AsString:=MQEnObservaciones.FieldByName('comisionvendedor_valor').AsString;
            ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=MQEnObservaciones.FieldByName('comisionvendedor_tipo').AsString;
            ZQuery2.ParamByName('liquivendedeta_id').AsString:=Princ.codigo('liquivendedeta','liquivendedeta_id');
            ZQuery2.ExecSql;

            MQEnObservaciones.Next;
        end;

    ZQvendedoresdebcred.First;
    while not ZQvendedoresdebcred.Eof do
        begin
            ZQuery2.sql.clear;
            ZQuery2.sql.add('Update vendedoresdebcred set ');
            ZQuery2.sql.add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
            ZQuery2.sql.add('vendedordebcred_estado=:vendedordebcred_estado');
            ZQuery2.sql.add(' where vendedordebcred_id=:vendedordebcred_id');
            ZQuery2.parambyname('liquidacionvendedor_id').asstring:=id;
            ZQuery2.parambyname('vendedordebcred_estado').asstring:='LIQUIDADO';
            ZQuery2.parambyname('vendedordebcred_id').asstring:=ZQvendedoresdebcred.FieldByName('vendedordebcred_id').AsString;
            ZQuery2.ExecSQL;

            ZQvendedoresdebcred.Next;
        end;


    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    if (MessageDlg('Datos guardados correctamente.'+#13+#10+'Desea imprimir esta liquidacion?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          btnguardar.Enabled:=false;
          btnimprimir.Click;

      end
    else
      Self.Close;
end;



procedure Tliquidaciones.btnactualizarClick(Sender: TObject);
begin
    CargarPorDefecto;
    CargarEnFactura;
    CargarEnOtros;
    CargarVendedoresDebCred;
end;

procedure Tliquidaciones.btncalcularClick(Sender: TObject);
begin
    CalularTotales;
end;

procedure Tliquidaciones.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Tliquidaciones.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar esta solicitud?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;


    end;
end;

procedure Tliquidaciones.btnimprimirClick(Sender: TObject);
begin
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'liquidacion_vendedor.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].SQL:='select * from liquidacionesvendedores '+
                                                   'inner join liquivendedeta on liquidacionesvendedores.liquidacionvendedor_id=liquivendedeta.liquidacionvendedor_id '+
                                                   'inner join documentoventadetalles on liquivendedeta.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                                                   'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                                                   'inner join personal on liquidacionesvendedores.personal_id=personal.personal_id '+
                                                   'where liquidacionesvendedores.liquidacionvendedor_id="'+id+'" '+
                                                   'order by sucursal_nombre, documentoventa_numero, documentoventadetalle_descripcion ';

    Princ.VCLReport1.Report.Datainfo.Items[1].sql:='select * from vendedoresdebcred '+
                                             'where vendedordebcred_tipo="Credito" and liquidacionvendedor_id="'+id+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select * from vendedoresdebcred '+
                                             'where vendedordebcred_tipo="Debito" and liquidacionvendedor_id="'+id+'" ';

    Princ.VCLReport1.Execute;
end;

procedure Tliquidaciones.btnquitardebcredClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQvendedoresdebcred.Delete;
          finally

          end;

      end;
end;

procedure Tliquidaciones.btnquitarenfacturaClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQEnFacturas.Delete;
          finally

          end;

      end;
end;

procedure Tliquidaciones.btnquitarenobservacionesClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQEnObservaciones.Delete;
          finally

          end;

      end;
end;

procedure Tliquidaciones.btnquitarpordefectoClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQPorDefecto.Delete;
          finally

          end;

      end;
end;

procedure Tliquidaciones.cliente_idSelect(Sender: TObject);
begin
//    cliente_dni.Text:=Princ.buscar('select cliente_dni from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_dni');
end;

function Tliquidaciones.control:boolean;
var
  error:integer;
begin
    error:=0;


//    if solic_numeroimpreso.Text='' then
//      error:=1;


//    case error of
//        1:begin
//              MessageDlg('Ingrese numero impreso.', mtError, [mbOK], 0);
//              solic_numeroimpreso.SetFocus;
//
//          end;
//
//    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
