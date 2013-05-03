unit Unitliquidacionessucu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, BaseGrid, AdvGrid, DBAdvGrid, Titles,
  AdvListV, UnitSqlListView, MQuery, math, rpcompobase, rpvclreport;

type
  Tliquidacionessucu = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label1: TLabel;
    liquidacionsucursal_id: TEdit;
    liquidacionsucursal_fecha: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    sucursal_id: TSqlComboBox;
    btncancelar: TButton;
    btnguardar: TButton;
    Label3: TLabel;
    liquidacionsucursal_desdefecha: TDateTimePicker;
    Label13: TLabel;
    liquidacionsucursal_hastafecha: TDateTimePicker;
    btnactualizar: TButton;
    Label21: TLabel;
    liquidacionsucursal_total: TDBAdvEdit;
    DSCliquisucudeta: TDataSource;
    MQliquisucudeta: TMQuery;
    ZQliquidacionessucursales: TZQuery;
    btncalcular: TButton;
    ZQfacturasventa: TZQuery;
    ZQcomisionessucursales: TZQuery;
    ZQControlDetalle: TZQuery;
    ZQliquivendedeta: TZQuery;
    btnimprimir: TButton;
    VCLReport1: TVCLReport;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    btnquitar: TButton;
    btnquitardebcred: TButton;
    DBGrid4: TDBGrid;
    ZQsucursalesdebcred: TZQuery;
    DSCsucursalesdebcred: TDataSource;
    Label7: TLabel;
    liquidacionsucursal_subtotal2: TDBAdvEdit;
    Label5: TLabel;
    liquidacionsucursal_subtotal1: TDBAdvEdit;
    MQliquisucudetaliquisucudeta_id: TIntegerField;
    MQliquisucudetadocumentoventadetalle_id: TStringField;
    MQliquisucudetaproducto_id: TStringField;
    MQliquisucudetacomisionsucursal_tipo: TStringField;
    MQliquisucudetacomisionsucursal_valor: TFloatField;
    MQliquisucudetaliquidacionsucursal_id: TIntegerField;
    MQliquisucudetaliquisucudeta_importe: TFloatField;
    MQliquisucudetadocumentoventadetalle_precio: TFloatField;
    MQliquisucudetapuntoventa_numero: TStringField;
    MQliquisucudetadocumentoventa_fecha: TDateField;
    MQliquisucudetadocumentoventa_numero: TIntegerField;
    MQliquisucudetacliente_nombre: TStringField;
    MQliquisucudetadocumentoventadetalle_descripcion: TStringField;
    MQliquisucudetadocumentoventadetalle_cantidad: TFloatField;
    MQliquisucudetaliquisucudeta_porcentajeliquid: TFloatField;
    MQliquisucudetadocumentoventa_pagado: TFloatField;
    MQliquisucudetadocumentoventa_saldo: TFloatField;
    ZQsucursalesdebcredsucursaldebcred_id: TIntegerField;
    ZQsucursalesdebcredsucursaldebcred_fecha: TDateField;
    ZQsucursalesdebcredsucursaldebcred_descripcion: TStringField;
    ZQsucursalesdebcredsucursaldebcred_tipo: TStringField;
    ZQsucursalesdebcredsucursaldebcred_importe: TFloatField;
    ZQsucursalesdebcredsucursaldebcred_estado: TStringField;
    ZQsucursalesdebcredliquidacionsucursal_id: TIntegerField;
    ZQsucursalesdebcredsucursal_id: TIntegerField;
    ZQsucursalesdebcredimporte: TFloatField;
    TabSheet3: TTabSheet;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure cliente_idSelect(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure btncalcularClick(Sender: TObject);
    procedure ZQliquidacionessucursalesAfterOpen(DataSet: TDataSet);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure sucursal_idSelect(Sender: TObject);
    procedure btnquitardebcredClick(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    EsVendedorPorDefecto:boolean;
    porcentajeliquid:real;
    porcentajeliquid_max:real;
    sucursaltipliqsuc_tipo:string;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
    function ControlDetalle(documentoventadetalle_id: string; producto_id: string):boolean;
    procedure PasarAMQuery(Qorig:TDataset;QDest:TDataset; detalle_tipo:string);
    procedure PasarAMQuery2(QDest:TDataset);
    procedure CargarDetalle;
    procedure CalcularTotal(detalle:Tdataset; subtotal:TDBAdvEdit);
    procedure TraerDetalles;
    procedure TraerDebitosCreditos;
    procedure CargarsucursalesDebCred;
    procedure CalcularTotalDebCred;
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  liquidacionessucu: Tliquidacionessucu;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}



procedure Tliquidacionessucu.CalcularTotalDebCred;
begin
    liquidacionsucursal_subtotal2.FloatValue:=0;
    ZQsucursalesdebcred.First;
    while not ZQsucursalesdebcred.Eof do
        begin
            liquidacionsucursal_subtotal2.FloatValue:=liquidacionsucursal_subtotal2.FloatValue+ZQsucursalesdebcred.FieldByName('importe').AsFloat;

            ZQsucursalesdebcred.Next;
        end;


end;


procedure Tliquidacionessucu.CargarsucursalesDebCred;
begin
    ZQsucursalesdebcred.Active:=false;
    ZQsucursalesdebcred.SQL.Text:='select *, if(sucursaldebcred_tipo="Debito",sucursaldebcred_importe*-1,sucursaldebcred_importe) as importe '+
                                  'from sucursalesdebcred '+
                                  'where (sucursaldebcred_fecha between "'+formatdatetime('yyyy-mm-dd',liquidacionsucursal_desdefecha.Date)+'" and "'+formatdatetime('yyyy-mm-dd',liquidacionsucursal_hastafecha.Date)+'") '+
                                  'and (liquidacionsucursal_id=0 or liquidacionsucursal_id="'+id+'")';
    ZQsucursalesdebcred.Active:=true;
end;



procedure Tliquidacionessucu.TraerDebitosCreditos;
begin
    ZQsucursalesdebcred.Active:=false;
    ZQsucursalesdebcred.SQL.Text:='select *, if(sucursaldebcred_tipo="Debito",sucursaldebcred_importe*-1,sucursaldebcred_importe) as importe '+
                               'from sucursalesdebcred '+
                               'where liquidacionsucursal_id="'+id+'"';

    ZQsucursalesdebcred.Active:=true;
end;


procedure Tliquidacionessucu.PasarAMQuery2(QDest: TDataSet);
var
  Qorig:TZQuery;
  i:integer;
begin
    Qorig:= TZQuery.Create(self);
    Qorig.Connection:=Princ.ZBase;
    Qorig.Active:=false;
    Qorig.SQL.Text:='select * from liquisucudeta '+
                    'inner join documentoventadetalles on liquisucudeta.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                    'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                    'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                    'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                    'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                    'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                    'where liquidacionsucursal_id="'+id+'"';
    Qorig.Active:=true;

    QDest.Active:=false;
    QDest.Active:=true;

    Qorig.First;
    while not Qorig.Eof do
        begin
            QDest.Insert;
            for i := 0 to QDest.FieldCount-1 do
              begin
                  QDest.Fields.Fields[i].Value:=Qorig.FieldByName(QDest.Fields.Fields[i].FieldName).Value;
              end;


            QDest.Post;

            Qorig.Next;
        end;
    Qorig.Free;
end;


procedure Tliquidacionessucu.sucursal_idSelect(Sender: TObject);
begin
    sucursaltipliqsuc_tipo:=Princ.buscar('select sucursal_tipoliquidsucursal from sucursales where sucursal_id="'+sucursal_id.codigo+'"','sucursal_tipoliquidsucursal');
end;

procedure Tliquidacionessucu.TraerDetalles;
begin
    PasarAMQuery2(MQliquisucudeta);

    TraerDebitosCreditos;

    btncalcular.Click;


end;

procedure Tliquidacionessucu.CalcularTotal(detalle:Tdataset; subtotal:TDBAdvEdit);
begin
    subtotal.FloatValue:=0;
    detalle.First;
    while not detalle.Eof do
        begin
            if detalle.FieldByName('comisionsucursal_tipo').AsString='Porcentaje' then
              begin
                  detalle.Edit;
                  detalle.FieldByName('liquisucudeta_importe').AsFloat:=roundto((detalle.FieldByName('documentoventadetalle_precio').AsFloat*detalle.FieldByName('liquisucudeta_porcentajeliquid').AsFloat/100)*detalle.FieldByName('comisionsucursal_valor').AsFloat/100,-2);
                  detalle.Post;


              end;

            if detalle.FieldByName('comisionsucursal_tipo').AsString='Cantidad' then
              begin
                  detalle.Edit;
                  detalle.FieldByName('liquisucudeta_importe').AsFloat:=roundto(detalle.FieldByName('documentoventadetalle_cantidad').AsFloat*detalle.FieldByName('comisionsucursal_valor').AsFloat*detalle.FieldByName('liquisucudeta_porcentajeliquid').AsFloat/100,-2);
                  detalle.Post;

              end;

            subtotal.FloatValue:=subtotal.FloatValue+detalle.FieldByName('liquisucudeta_importe').AsFloat;

            detalle.Next;
        end;


end;




procedure Tliquidacionessucu.CargarDetalle;
var
  where:string;
begin
    MQliquisucudeta.Active:=false;
    MQliquisucudeta.Active:=true;
//    if suc_codi.codigo=Princ.buscar('select config_valor from config where config_nombre="defecto_ven_codi"','config_valor') then
      begin
          where := 'where documentoventa_estado<>"ANULADA" and '+
                   '(documentoventa_fecha between "'+formatdatetime('yyyy-mm-dd',liquidacionsucursal_desdefecha.Date)+'" and '+
                   '"'+formatdatetime('yyyy-mm-dd',liquidacionsucursal_hastafecha.Date)+'") and '+
                   'puntodeventa.sucursal_id="'+sucursal_id.codigo+'" and tipodocu_nombre="Factura de Venta"';

          ZQfacturasventa.Active:=false;
          ZQfacturasventa.SQL.Text:='select *, '+
                                    '(documentoventa_pagado*100/documentoventa_total) as liquisucudeta_porcentajeliquid '+
                                    'from documentosventas '+
                                    'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                    'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                    'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                    'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                    'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                    where;
          ZQfacturasventa.Active:=true;


          PasarAMQuery(ZQfacturasventa,MQliquisucudeta, 'Por Defecto');


      end;





end;


function Tliquidacionessucu.ControlDetalle(documentoventadetalle_id: string; producto_id: string):boolean;
var
  id_encontrado:string;
begin
    ZQControlDetalle.Active:=false;
    ZQControlDetalle.SQL.Text:='select sum(liquisucudeta_porcentajeliquid) as porcentajeliquid from liquisucudeta '+
                               'inner join documentoventadetalles on liquisucudeta.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                               'where liquisucudeta.documentoventadetalle_id="'+documentoventadetalle_id+'" and '+
                               'producto_id="'+producto_id+'" and '+
                               'liquidacionsucursal_id<>"'+id+'"'+
                               'group by liquisucudeta.documentoventadetalle_id,producto_id';

    ZQControlDetalle.Active:=true;

    porcentajeliquid:=ZQControlDetalle.FieldByName('porcentajeliquid').AsFloat;


    if porcentajeliquid<100 then
      begin
         result:=true;
      end
    else
      begin
          result:=false;
      end;

end;


procedure Tliquidacionessucu.PasarAMQuery(Qorig: TDataSet; QDest: TDataSet; detalle_tipo:string);
begin
    Qorig.First;
    while not Qorig.Eof do
        begin
            if ControlDetalle(Qorig.FieldByName('documentoventadetalle_id').AsString, Qorig.FieldByName('producto_id').AsString) then
              begin
                  ZQcomisionessucursales.Active:=false;
                  ZQcomisionessucursales.SQL.Text:='select * from comisionessucursal '+
                                         'where sucursal_id="'+sucursal_id.codigo+'" and '+
                                         'producto_id="'+Qorig.FieldByName('producto_id').AsString+'"';
                  ZQcomisionessucursales.Active:=true;
                  ZQcomisionessucursales.First;

                  QDest.Insert;
                  QDest.FieldByName('liquisucudeta_id').AsString:='0';
                  QDest.FieldByName('documentoventadetalle_id').AsString:=Qorig.FieldByName('documentoventadetalle_id').AsString;
                  QDest.FieldByName('producto_id').AsString:=Qorig.FieldByName('producto_id').AsString;
                  QDest.FieldByName('comisionsucursal_tipo').AsString:=ZQcomisionessucursales.FieldByName('comisionsucursal_tipo').AsString;
                  QDest.FieldByName('comisionsucursal_valor').AsString:=ZQcomisionessucursales.FieldByName('comisionsucursal_valor').AsString;
                  QDest.FieldByName('liquidacionsucursal_id').AsString:='0';
                  QDest.FieldByName('documentoventa_fecha').AsDateTime:=Qorig.FieldByName('documentoventa_fecha').AsDateTime;
                  QDest.FieldByName('documentoventa_numero').AsString:=Qorig.FieldByName('documentoventa_numero').AsString;
                  QDest.FieldByName('cliente_nombre').AsString:=Qorig.FieldByName('cliente_nombre').AsString;
                  QDest.FieldByName('documentoventadetalle_descripcion').AsString:=Qorig.FieldByName('documentoventadetalle_descripcion').AsString;
                  QDest.FieldByName('documentoventadetalle_cantidad').AsString:=Qorig.FieldByName('documentoventadetalle_cantidad').AsString;
                  QDest.FieldByName('documentoventadetalle_precio').AsString:=Qorig.FieldByName('documentoventadetalle_total').AsString;
                  if sucursaltipliqsuc_tipo='Neto' then
                    QDest.FieldByName('facvendet_prec').AsFloat:=Qorig.FieldByName('documentoventadetalle_neto21').AsFloat;

                  QDest.FieldByName('liquisucudeta_importe').AsString:='0';
                  QDest.FieldByName('liquisucudeta_porcentajeliquid').AsFloat:=Qorig.FieldByName('liquisucudeta_porcentajeliquid').AsFloat-porcentajeliquid;
                  QDest.FieldByName('documentoventa_pagado').AsString:=Qorig.FieldByName('documentoventa_pagado').AsString;
                  QDest.FieldByName('documentoventa_saldo').AsString:=Qorig.FieldByName('documentoventa_saldo').AsString;
                  QDest.FieldByName('puntoventa_numero').AsString:=Qorig.FieldByName('puntoventa_numero').AsString;

                  QDest.Post;

              end;
            Qorig.Next;
        end;
end;

procedure Tliquidacionessucu.imprimir;
begin
end;


procedure Tliquidacionessucu.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquisucudeta');
    ZQuery2.sql.add(' where liquidacionsucursal_id=:liquidacionsucursal_id');
    ZQuery2.parambyname('liquidacionsucursal_id').asstring:=id;
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquidacionessucursales');
    ZQuery2.sql.add(' where liquidacionsucursal_id=:liquidacionsucursal_id');
    ZQuery2.parambyname('liquidacionsucursal_id').asstring:=id;
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from sucursalesdebcred');
    ZQuery2.sql.add(' where liquidacionsucursal_id=:liquidacionsucursal_id');
    ZQuery2.parambyname('liquidacionsucursal_id').asstring:=id;
    ZQuery2.ExecSQL;




    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Tliquidacionessucu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tliquidacionessucu.FormCreate(Sender: TObject);
begin
    id:='';
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=-1;

end;

procedure Tliquidacionessucu.FormShow(Sender: TObject);
begin
    ZQliquidacionessucursales.Active:=false;
    ZQliquidacionessucursales.ParamByName('liquidacionsucursal_id').AsString:=id;
    ZQliquidacionessucursales.Active:=true;

//    btnimprimir.Enabled:=false;
//    if abm=4 then
//      btnimprimir.Enabled:=true;

    if abm=3 then
      btnguardar.Caption:='Eliminar';

end;

procedure Tliquidacionessucu.modificar;
var
  i:integer;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from liquisucudeta');
    ZQuery2.sql.add(' where liquidacionsucursal_id=:liquidacionsucursal_id');
    ZQuery2.parambyname('liquidacionsucursal_id').asstring:=id;
    ZQuery2.ExecSQL;

    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into liquisucudeta set ');
    ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
    ZQuery2.Sql.Add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
    ZQuery2.Sql.Add('liquisucudeta_porcentajeliquid=:liquisucudeta_porcentajeliquid, ');
    ZQuery2.Sql.Add('liquisucudeta_importe=:liquisucudeta_importe, ');
    ZQuery2.Sql.Add('comisionsucursal_valor=:comisionsucursal_valor, ');
    ZQuery2.Sql.Add('comisionsucursal_tipo=:comisionsucursal_tipo, ');
    ZQuery2.Sql.Add('liquisucudeta_id=:liquisucudeta_id ');

    MQliquisucudeta.First;
    while not MQliquisucudeta.Eof do
        begin
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQliquisucudeta.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionsucursal_id').AsString:=id;
            ZQuery2.ParamByName('liquisucudeta_porcentajeliquid').AsString:=MQliquisucudeta.FieldByName('liquisucudeta_porcentajeliquid').AsString;
            ZQuery2.ParamByName('liquisucudeta_importe').AsString:=MQliquisucudeta.FieldByName('liquisucudeta_importe').AsString;
            ZQuery2.ParamByName('comisionsucursal_valor').AsString:=MQliquisucudeta.FieldByName('comisionsucursal_valor').AsString;
            ZQuery2.ParamByName('comisionsucursal_tipo').AsString:=MQliquisucudeta.FieldByName('comisionsucursal_tipo').AsString;
            ZQuery2.ParamByName('liquisucudeta_id').AsString:=Princ.codigo('liquisucudeta','liquisucudeta_id');
            ZQuery2.ExecSql;

            MQliquisucudeta.Next;
        end;




    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update sucursalesdebcred set ');
    ZQuery2.Sql.Add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
    ZQuery2.Sql.Add('sucursaldebcred_estado=:sucursaldebcred_estado ');
    ZQuery2.Sql.Add('where liquidacionsucursal_id=:liquidacionsucursal_id1 ');
    ZQuery2.ParamByName('liquidacionsucursal_id').AsString:='0';
    ZQuery2.ParamByName('sucursaldebcred_estado').AsString:='PENDIENTE';
    ZQuery2.ParamByName('liquidacionsucursal_id1').AsString:=id;
    ZQuery2.ExecSql;


    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update sucursalesdebcred set ');
    ZQuery2.sql.add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
    ZQuery2.sql.add('sucursaldebcred_estado=:sucursaldebcred_estado');
    ZQuery2.sql.add(' where sucursaldebcred_id=:sucursaldebcred_id');

    ZQsucursalesdebcred.First;
    while not ZQsucursalesdebcred.Eof do
        begin
            ZQuery2.parambyname('liquidacionsucursal_id').asstring:=id;
            ZQuery2.parambyname('sucursaldebcred_estado').asstring:='LIQUIDADO';
            ZQuery2.parambyname('sucursaldebcred_id').asstring:=ZQsucursalesdebcred.FieldByName('sucursaldebcred_id').AsString;
            ZQuery2.ExecSQL;

            ZQsucursalesdebcred.Next;
        end;



    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update liquidacionessucursales set ');
    ZQuery2.Sql.Add('sucursal_id=:sucursal_id, ');
    ZQuery2.Sql.Add('sucursaltipliqsuc_estado=:sucursaltipliqsuc_estado, ');
    ZQuery2.Sql.Add('sucursaltipliqsuc_tipo=:sucursaltipliqsuc_tipo, ');
    ZQuery2.Sql.Add('liquidacionsucursal_total=:liquidacionsucursal_total, ');
    ZQuery2.Sql.Add('liquidacionsucursal_hastafecha=:liquidacionsucursal_hastafecha, ');
    ZQuery2.Sql.Add('liquidacionsucursal_desdefecha=:liquidacionsucursal_desdefecha, ');
    ZQuery2.Sql.Add('liquidacionsucursal_fecha=:liquidacionsucursal_fecha ');
    ZQuery2.Sql.Add('where liquidacionsucursal_id=:liquidacionsucursal_id ');
    ZQuery2.ParamByName('sucursal_id').AsString:=sucursal_id.codigo;
    ZQuery2.ParamByName('sucursaltipliqsuc_estado').AsString:='PENDIENTE';
    ZQuery2.parambyname('sucursaltipliqsuc_tipo').asstring:=sucursaltipliqsuc_tipo;
    ZQuery2.ParamByName('liquidacionsucursal_total').AsString:=liquidacionsucursal_total.Text;
    ZQuery2.ParamByName('liquidacionsucursal_hastafecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionsucursal_hastafecha.Date);
    ZQuery2.ParamByName('liquidacionsucursal_desdefecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionsucursal_desdefecha.Date);
    ZQuery2.ParamByName('liquidacionsucursal_fecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionsucursal_fecha.Date);
    ZQuery2.ParamByName('liquidacionsucursal_id').AsString:=id;
    ZQuery2.ExecSql;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;


    MessageDlg('Los datos fueron guardados correctamente.', mtInformation, [mbOK], 0);


//    if (MessageDlg('Datos guardados correctamente.'+#13+#10+'Desea imprimir esta liquidacion?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
//      begin
//          btnguardar.Enabled:=false;
//          btnimprimir.Click;
//
//      end
//    else
      Self.Close;

end;


procedure Tliquidacionessucu.ZQliquidacionessucursalesAfterOpen(DataSet: TDataSet);
var
  i:integer;
begin
    if abm=1 then
      begin
          liquidacionsucursal_id.Text:=Princ.codigo('liquidacionessucursales','liquidacionsucursal_id');
          liquidacionsucursal_fecha.Date:=date;
          liquidacionsucursal_desdefecha.Date:=date;
          liquidacionsucursal_hastafecha.Date:=date;

      end
    else
      begin
          liquidacionsucursal_id.Text:=ZQliquidacionessucursales.FieldByName('liquidacionsucursal_id').AsString;
          liquidacionsucursal_fecha.Date:=ZQliquidacionessucursales.FieldByName('liquidacionsucursal_fecha').AsDateTime;
          liquidacionsucursal_desdefecha.Date:=ZQliquidacionessucursales.FieldByName('liquidacionsucursal_desdefecha').AsDateTime;
          liquidacionsucursal_hastafecha.Date:=ZQliquidacionessucursales.FieldByName('liquidacionsucursal_hastafecha').AsDateTime;
          sucursal_id.Buscar(ZQliquidacionessucursales.FieldByName('sucursal_id').AsString);
          sucursaltipliqsuc_tipo:=ZQliquidacionessucursales.FieldByName('sucursaltipliqsuc_tipo').AsString;

          TraerDetalles;

      end;


end;
procedure Tliquidacionessucu.agregar;
var
  i: Integer;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('liquidacionessucursales','liquidacionsucursal_id');

    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into liquidacionessucursales set ');
    ZQuery2.Sql.Add('sucursal_id=:sucursal_id, ');
    ZQuery2.Sql.Add('sucursaltipliqsuc_estado=:sucursaltipliqsuc_estado, ');
    ZQuery2.Sql.Add('sucursaltipliqsuc_tipo=:sucursaltipliqsuc_tipo, ');
    ZQuery2.Sql.Add('liquidacionsucursal_total=:liquidacionsucursal_total, ');
    ZQuery2.Sql.Add('liquidacionsucursal_hastafecha=:liquidacionsucursal_hastafecha, ');
    ZQuery2.Sql.Add('liquidacionsucursal_desdefecha=:liquidacionsucursal_desdefecha, ');
    ZQuery2.Sql.Add('liquidacionsucursal_fecha=:liquidacionsucursal_fecha, ');
    ZQuery2.Sql.Add('liquidacionsucursal_id=:liquidacionsucursal_id ');
    ZQuery2.ParamByName('sucursal_id').AsString:=sucursal_id.codigo;
    ZQuery2.ParamByName('sucursaltipliqsuc_estado').AsString:='PENDIENTE';
    ZQuery2.ParamByName('sucursaltipliqsuc_tipo').AsString:=sucursaltipliqsuc_tipo;
    ZQuery2.ParamByName('liquidacionsucursal_total').AsString:=liquidacionsucursal_total.Text;
    ZQuery2.ParamByName('liquidacionsucursal_hastafecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionsucursal_hastafecha.Date);
    ZQuery2.ParamByName('liquidacionsucursal_desdefecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionsucursal_desdefecha.Date);
    ZQuery2.ParamByName('liquidacionsucursal_fecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionsucursal_fecha.Date);
    ZQuery2.ParamByName('liquidacionsucursal_id').AsString:=id;
    ZQuery2.ExecSql;



    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into liquisucudeta set ');
    ZQuery2.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id, ');
    ZQuery2.Sql.Add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
    ZQuery2.Sql.Add('liquisucudeta_porcentajeliquid=:liquisucudeta_porcentajeliquid, ');
    ZQuery2.Sql.Add('liquisucudeta_importe=:liquisucudeta_importe, ');
    ZQuery2.Sql.Add('comisionsucursal_valor=:comisionsucursal_valor, ');
    ZQuery2.Sql.Add('comisionsucursal_tipo=:comisionsucursal_tipo, ');
    ZQuery2.Sql.Add('liquisucudeta_id=:liquisucudeta_id ');



    MQliquisucudeta.First;
    while not MQliquisucudeta.Eof do
        begin
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=MQliquisucudeta.FieldByName('documentoventadetalle_id').AsString;
            ZQuery2.ParamByName('liquidacionsucursal_id').AsString:=id;
            ZQuery2.ParamByName('liquisucudeta_porcentajeliquid').AsString:=MQliquisucudeta.FieldByName('liquisucudeta_porcentajeliquid').AsString;
            ZQuery2.ParamByName('liquisucudeta_importe').AsString:=MQliquisucudeta.FieldByName('liquisucudeta_importe').AsString;
            ZQuery2.ParamByName('comisionsucursal_valor').AsString:=MQliquisucudeta.FieldByName('comisionsucursal_valor').AsString;
            ZQuery2.ParamByName('comisionsucursal_tipo').AsString:=MQliquisucudeta.FieldByName('comisionsucursal_tipo').AsString;
            ZQuery2.ParamByName('liquisucudeta_id').AsString:=Princ.codigo('liquisucudeta','liquisucudeta_id');
            ZQuery2.ExecSql;

            MQliquisucudeta.Next;
        end;

    ZQsucursalesdebcred.First;
    while not ZQsucursalesdebcred.Eof do
        begin
            ZQuery2.sql.clear;
            ZQuery2.sql.add('Update sucursalesdebcred set ');
            ZQuery2.sql.add('liquidacionsucursal_id=:liquidacionsucursal_id, ');
            ZQuery2.sql.add('sucursaldebcred_estado=:sucursaldebcred_estado');
            ZQuery2.sql.add(' where sucursaldebcred_id=:sucursaldebcred_id');
            ZQuery2.parambyname('liquidacionsucursal_id').asstring:=id;
            ZQuery2.parambyname('sucursaldebcred_estado').asstring:='LIQUIDADO';
            ZQuery2.parambyname('sucursaldebcred_id').asstring:=ZQsucursalesdebcred.FieldByName('sucursaldebcred_id').AsString;
            ZQuery2.ExecSQL;

            ZQsucursalesdebcred.Next;
        end;


    ZQuery2.SQL.Clear;


    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Los datos fueron guardados correctamente.', mtInformation, [mbOK], 0);

//    if (MessageDlg('Datos guardados correctamente.'+#13+#10+'Desea imprimir esta liquidacion?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
//      begin
//          btnguardar.Enabled:=false;
//          btnimprimir.Click;
//
//      end
//    else
      Self.Close;
end;



procedure Tliquidacionessucu.btnactualizarClick(Sender: TObject);
begin
    CargarDetalle;
    CargarsucursalesDebCred;
end;

procedure Tliquidacionessucu.btncalcularClick(Sender: TObject);
begin
    CalcularTotal(MQliquisucudeta,liquidacionsucursal_subtotal1);
    CalcularTotalDebCred;
    liquidacionsucursal_total.FloatValue:=liquidacionsucursal_subtotal1.FloatValue+liquidacionsucursal_subtotal2.FloatValue;
end;

procedure Tliquidacionessucu.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Tliquidacionessucu.btnguardarClick(Sender: TObject);
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

procedure Tliquidacionessucu.btnimprimirClick(Sender: TObject);
begin
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\liquidacion_sucursal.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from liquidacionessucursales '+
                                                   'inner join liquisucudeta on liquidacionessucursales.liquidacionsucursal_id=liquisucudeta.liquidacionsucursal_id '+
                                                   'inner join documentoventadetalles on liquisucudeta.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                                                   'inner join productos on documentoventadetalles.producto_id=productos.producto_id '+
                                                   'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id '+
                                                   'where liquidacionessucursales.liquidacionsucursal_id="'+id+'" '+
                                                   'order by documentoventa_fecha,documentoventa_numero, documentoventadetalle_descripcion';

    Princ.VCLReport1.Report.Datainfo.Items[1].sql:='select * from sucursalesdebcred '+
                                             'where sucursaldebcred_tipo="Credito" and liquidacionsucursal_id="'+id+'" ';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select * from sucursalesdebcred '+
                                             'where sucursaldebcred_tipo="Debito" and liquidacionsucursal_id="'+id+'" ';

    Princ.VCLReport1.Execute;
end;

procedure Tliquidacionessucu.btnquitarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQliquisucudeta.Delete;
          finally

          end;

      end;
end;

procedure Tliquidacionessucu.btnquitardebcredClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQsucursalesdebcred.Delete;
          finally

          end;

      end;
end;

procedure Tliquidacionessucu.cliente_idSelect(Sender: TObject);
begin
//    cliente_dni.Text:=Princ.buscar('select cliente_dni from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_dni');
end;

function Tliquidacionessucu.control:boolean;
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