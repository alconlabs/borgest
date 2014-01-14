unit UnitProductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UnitNumEdit, Grids, DBGrids, MQuery, MoneyEdit;

type
  Tproductos = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label17: TLabel;
    Label21: TLabel;
    rubro_id: TSqlComboBox;
    ZQproductos: TZQuery;
    ZQuery1: TZQuery;
    Label1: TLabel;
    producto_nombre: TEdit;
    producto_estado: TComboBox;
    Label3: TLabel;
    producto_id: TEdit;
    Label4: TLabel;
    producto_codigo: TEdit;
    Label5: TLabel;
    producto_codigobarras: TEdit;
    lblNombrePrecio1: TLabel;
    Label7: TLabel;
    producto_observaciones: TMemo;
    Label2: TLabel;
    Label8: TLabel;
    tipoiva_id: TSqlComboBox;
    lblNombrePrecio2: TLabel;
    lblNombrePrecio3: TLabel;
    lblNombrePrecio4: TLabel;
    calculoprecio_id: TSqlComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    politicaprecio_id: TSqlComboBox;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    producto_precioventa1: TDBAdvEdit;
    producto_precioventa2: TDBAdvEdit;
    producto_precioventa3: TDBAdvEdit;
    producto_precioventa4: TDBAdvEdit;
    producto_preciocosto: TDBAdvEdit;
    producto_precioventabase: TDBAdvEdit;
    producto_neto1: TDBAdvEdit;
    producto_neto2: TDBAdvEdit;
    producto_neto3: TDBAdvEdit;
    producto_neto4: TDBAdvEdit;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MQproductodeposito: TMQuery;
    Label20: TLabel;
    MQproductodepositodeposito_id: TIntegerField;
    MQproductodepositodeposito_nombre: TStringField;
    MQproductodepositoproducto_id: TIntegerField;
    MQproductodepositoproducdepo_puntorepos: TFloatField;
    MQproductodepositoproducdepo_stockminimo: TFloatField;
    MQproductodepositoproducdepo_stockactual: TFloatField;
    ZQDepositos: TZQuery;
    ZQproductodeposito: TZQuery;
    Label22: TLabel;
    proveedor_id: TSqlComboBox;
    ZQCalculopreciodetaprod: TZQuery;
    btncalculopreciodetaprod: TButton;
    ZQCalculopreciodetaprodcalculopreciodetaprod_id: TIntegerField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_descripcion: TStringField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_orden: TIntegerField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_tipo: TStringField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_valor: TFloatField;
    ZQCalculopreciodetaprodproducto_id: TIntegerField;
    Label23: TLabel;
    producto_codigoreferencia: TEdit;
    MQproductodepositoproducdepo_stockinicial: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure ZQproductosAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure calculoprecio_idSelect(Sender: TObject);
    procedure producto_preciocostoExit(Sender: TObject);
    procedure producto_precioventabaseExit(Sender: TObject);
    procedure politicaprecio_idExit(Sender: TObject);
    procedure tipoiva_idExit(Sender: TObject);
    procedure calculoprecio_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncalculopreciodetaprodClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure calcularpreciosfinales(posicion:integer=0);
    procedure aplicarclaculopreciodetaprod;
  public
    { Public declarations }
    id:string;
    abm:integer;
    producto_tipo:string;
  protected
    { Protected declarations }
    controlar_codigos:boolean;
  end;

var
  productos: Tproductos;

implementation

uses Unitprinc, Unitcalculoprecioproducto;

{$R *.dfm}

procedure Tproductos.aplicarclaculopreciodetaprod;
var
  producto_preciotemp:real;
begin
    producto_preciotemp:=producto_precioventabase.FloatValue;
    while not ZQCalculopreciodetaprod.Eof do
        begin
            if ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_tipo').AsString='Porcentaje' then
              begin
                  producto_preciotemp:=producto_preciotemp+(producto_preciotemp*ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsFloat/100);
              end
            else
              begin
                  producto_preciotemp:=producto_preciotemp+ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsFloat;
              end;
            ZQCalculopreciodetaprod.Next;
        end;

    producto_precioventabase.FloatValue:=producto_preciotemp;

end;


procedure Tproductos.calcularpreciosfinales(posicion:integer=0);
var
  subtotal1, subtotal2, subtotal3, subtotal4, tipoiva_valor:real;
  politicaprecio_politica1, politicaprecio_politica2, politicaprecio_politica3, politicaprecio_politica4:real;
begin

    if posicion<=1 then
      begin
          producto_precioventabase.FloatValue:=Princ.GetPrecioVentaBase(producto_preciocosto.FloatValue,calculoprecio_id.codigo);


      end;

    if posicion<=2 then
      aplicarclaculopreciodetaprod;

    if posicion<=3 then
      begin
          politicaprecio_politica1:=strtofloat(Princ.buscar('select politicaprecio_politica1 from politicasdeprecios where politicaprecio_id="'+politicaprecio_id.codigo+'"','politicaprecio_politica1'));
          politicaprecio_politica2:=strtofloat(Princ.buscar('select politicaprecio_politica2 from politicasdeprecios where politicaprecio_id="'+politicaprecio_id.codigo+'"','politicaprecio_politica2'));
          politicaprecio_politica3:=strtofloat(Princ.buscar('select politicaprecio_politica3 from politicasdeprecios where politicaprecio_id="'+politicaprecio_id.codigo+'"','politicaprecio_politica3'));
          politicaprecio_politica4:=strtofloat(Princ.buscar('select politicaprecio_politica4 from politicasdeprecios where politicaprecio_id="'+politicaprecio_id.codigo+'"','politicaprecio_politica4'));

          producto_neto1.FloatValue:=producto_precioventabase.FloatValue+(producto_precioventabase.FloatValue*politicaprecio_politica1/100);
          producto_neto2.FloatValue:=producto_precioventabase.FloatValue+(producto_precioventabase.FloatValue*politicaprecio_politica2/100);
          producto_neto3.FloatValue:=producto_precioventabase.FloatValue+(producto_precioventabase.FloatValue*politicaprecio_politica3/100);
          producto_neto4.FloatValue:=producto_precioventabase.FloatValue+(producto_precioventabase.FloatValue*politicaprecio_politica4/100);



      end;


    if posicion<=4 then
      begin
          tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva where tipoiva_id="'+tipoiva_id.codigo+'"','tipoiva_valor'));

          subtotal1:=producto_neto1.FloatValue+(producto_neto1.FloatValue*tipoiva_valor/100);
          subtotal2:=producto_neto2.FloatValue+(producto_neto2.FloatValue*tipoiva_valor/100);
          subtotal3:=producto_neto3.FloatValue+(producto_neto3.FloatValue*tipoiva_valor/100);
          subtotal4:=producto_neto4.FloatValue+(producto_neto4.FloatValue*tipoiva_valor/100);


      end;




    producto_precioventa1.FloatValue:=subtotal1;
    producto_precioventa2.FloatValue:=subtotal2;
    producto_precioventa3.FloatValue:=subtotal3;
    producto_precioventa4.FloatValue:=subtotal4;

end;


procedure Tproductos.calculoprecio_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_F2 then
      Princ.AbrirModificarCalculoprecios(calculoprecio_id.codigo);
end;

procedure Tproductos.calculoprecio_idSelect(Sender: TObject);
begin
    calcularpreciosfinales(1);
end;

procedure Tproductos.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('begin');
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from calculopreciodetaprod');
    ZQuery1.sql.add(' where producto_id=:producto_id');
    ZQuery1.parambyname('producto_id').asstring:=producto_id.text;
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from productodeposito');
    ZQuery1.sql.add(' where producto_id=:producto_id');
    ZQuery1.parambyname('producto_id').asstring:=producto_id.text;
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from productos');
    ZQuery1.sql.add(' where producto_id=:producto_id');
    ZQuery1.parambyname('producto_id').asstring:=producto_id.text;
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('commit');
    ZQuery1.ExecSQL;



    MessageDlg('El producto fue eliminado', mtInformation, [mbOK], 0);
//    abm:=1;
//    Self.OnShow(self);

    close;


end;


procedure Tproductos.modificar;
var
  producdepo_id:string;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('begin');
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update productos set ');
    ZQuery1.sql.add('producto_nombre=:producto_nombre, ');
    ZQuery1.sql.add('producto_observaciones=:producto_observaciones, ');
    ZQuery1.sql.add('producto_codigo=:producto_codigo, ');
    ZQuery1.sql.add('producto_codigobarras=:producto_codigobarras, ');
    ZQuery1.sql.add('producto_preciocosto=:producto_preciocosto, ');
    ZQuery1.sql.add('producto_estado=:producto_estado, ');
    ZQuery1.sql.add('producto_precioventa1=:producto_precioventa1, ');
    ZQuery1.sql.add('producto_precioventa2=:producto_precioventa2, ');
    ZQuery1.sql.add('producto_precioventa3=:producto_precioventa3, ');
    ZQuery1.sql.add('producto_precioventa4=:producto_precioventa4, ');
    ZQuery1.sql.add('tipoiva_id=:tipoiva_id, ');
    ZQuery1.sql.add('rubro_id=:rubro_id, ');
    ZQuery1.sql.add('calculoprecio_id=:calculoprecio_id, ');
    ZQuery1.sql.add('politicaprecio_id=:politicaprecio_id, ');
    ZQuery1.sql.add('producto_precioventabase=:producto_precioventabase, ');
    ZQuery1.sql.add('producto_neto1=:producto_neto1, ');
    ZQuery1.sql.add('producto_neto2=:producto_neto2, ');
    ZQuery1.sql.add('producto_neto3=:producto_neto3, ');
    ZQuery1.sql.add('producto_neto4=:producto_neto4, ');
    ZQuery1.sql.add('proveedor_id=:proveedor_id, ');
    ZQuery1.sql.add('producto_fechaactualizacionprecio=:producto_fechaactualizacionprecio, ');
    ZQuery1.sql.add('producto_codigoreferencia=:producto_codigoreferencia, ');
    ZQuery1.sql.add('producto_tipo=:producto_tipo ');

    ZQuery1.sql.add('where producto_id=:producto_id');
    ZQuery1.parambyname('producto_id').asstring:=id;
    ZQuery1.parambyname('producto_nombre').asstring:=producto_nombre.Text;
    ZQuery1.parambyname('producto_observaciones').asstring:=producto_observaciones.Lines.Text;
    ZQuery1.parambyname('producto_codigo').asstring:=producto_codigo.Text;
    ZQuery1.parambyname('producto_codigobarras').asstring:=producto_codigobarras.Text;
    ZQuery1.parambyname('producto_preciocosto').asstring:=producto_preciocosto.Text;
    ZQuery1.parambyname('producto_estado').asstring:=producto_estado.Text;
    ZQuery1.parambyname('producto_precioventa1').asstring:=producto_precioventa1.Text;
    ZQuery1.parambyname('producto_precioventa2').asstring:=producto_precioventa2.Text;
    ZQuery1.parambyname('producto_precioventa3').asstring:=producto_precioventa3.Text;
    ZQuery1.parambyname('producto_precioventa4').asstring:=producto_precioventa4.Text;
    ZQuery1.parambyname('tipoiva_id').asstring:=tipoiva_id.codigo;
    ZQuery1.parambyname('rubro_id').asstring:=rubro_id.codigo;
    ZQuery1.parambyname('calculoprecio_id').asstring:=calculoprecio_id.codigo;
    ZQuery1.parambyname('politicaprecio_id').asstring:=politicaprecio_id.codigo;
    ZQuery1.parambyname('producto_precioventabase').asstring:=producto_precioventabase.Text;
    ZQuery1.parambyname('producto_neto1').asstring:=producto_neto1.Text;
    ZQuery1.parambyname('producto_neto2').asstring:=producto_neto2.Text;
    ZQuery1.parambyname('producto_neto3').asstring:=producto_neto3.Text;
    ZQuery1.parambyname('producto_neto4').asstring:=producto_neto4.Text;

    ZQuery1.parambyname('producto_fechaactualizacionprecio').asstring:=formatdatetime('yyyy-mm-dd',ZQproductos.FieldByName('producto_fechaactualizacionprecio').AsDateTime);
    if producto_preciocosto.Text<>ZQproductos.FieldByName('producto_preciocosto').AsString then
      ZQuery1.parambyname('producto_fechaactualizacionprecio').asstring:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);

    ZQuery1.parambyname('proveedor_id').asstring:=proveedor_id.codigo;
    ZQuery1.parambyname('producto_codigoreferencia').asstring:=producto_codigoreferencia.Text;
    ZQuery1.parambyname('producto_tipo').asstring:=producto_tipo;
    ZQuery1.ExecSQL;


    MQproductodeposito.First;
    while not MQproductodeposito.Eof do
        begin
            producdepo_id:=princ.buscar('select producdepo_id from productodeposito where producto_id="'+id+'" and deposito_id="'+MQproductodeposito.FieldByName('deposito_id').AsString+'"','producdepo_id');
            if producdepo_id='' then
              begin
                  ZQuery1.sql.clear;
                  ZQuery1.sql.add('Insert into productodeposito (deposito_id, ');
                  ZQuery1.sql.add('producdepo_puntorepos, producdepo_stockactual, ');
                  ZQuery1.sql.add('producdepo_stockminimo, producto_id, producdepo_id, producdepo_stockinicial) ');
                  ZQuery1.sql.add('values (:deposito_id, ');
                  ZQuery1.sql.add(':producdepo_puntorepos, :producdepo_stockactual, ');
                  ZQuery1.sql.add(':producdepo_stockminimo, :producto_id, :producdepo_id, :producdepo_stockinicial)');
                  ZQuery1.parambyname('deposito_id').asstring:=MQproductodeposito.FieldByName('deposito_id').AsString;
                  ZQuery1.parambyname('producdepo_puntorepos').asstring:=MQproductodeposito.FieldByName('producdepo_puntorepos').AsString;
                  ZQuery1.parambyname('producdepo_stockactual').asstring:=MQproductodeposito.FieldByName('producdepo_stockactual').AsString;
                  ZQuery1.parambyname('producdepo_stockminimo').asstring:=MQproductodeposito.FieldByName('producdepo_stockminimo').AsString;
                  ZQuery1.parambyname('producdepo_stockinicial').asstring:=MQproductodeposito.FieldByName('producdepo_stockinicial').AsString;
                  ZQuery1.parambyname('producto_id').asstring:=id;
                  ZQuery1.parambyname('producdepo_id').asstring:=Princ.codigo('productodeposito','producdepo_id');
                  ZQuery1.ExecSQL;


              end
            else
              begin
                  ZQuery1.sql.clear;
                  ZQuery1.sql.add('Update productodeposito set ');
                  ZQuery1.sql.add('producdepo_puntorepos=:producdepo_puntorepos, ');
                  ZQuery1.sql.add('producdepo_stockactual=:producdepo_stockactual, ');
                  ZQuery1.sql.add('producdepo_stockminimo=:producdepo_stockminimo, ');
                  ZQuery1.sql.add('producdepo_stockinicial=:producdepo_stockinicial');
                  ZQuery1.sql.add(' where producdepo_id=:producdepo_id');
                  ZQuery1.parambyname('producdepo_puntorepos').asstring:=MQproductodeposito.FieldByName('producdepo_puntorepos').AsString;
                  ZQuery1.parambyname('producdepo_stockactual').asstring:=MQproductodeposito.FieldByName('producdepo_stockactual').AsString;
                  ZQuery1.parambyname('producdepo_stockminimo').asstring:=MQproductodeposito.FieldByName('producdepo_stockminimo').AsString;
                  ZQuery1.parambyname('producdepo_id').asstring:=producdepo_id;
                  ZQuery1.parambyname('producdepo_stockinicial').asstring:=MQproductodeposito.FieldByName('producdepo_stockinicial').AsString;
                  ZQuery1.ExecSQL;



              end;









            MQproductodeposito.Next;
        end;


    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from calculopreciodetaprod');
    ZQuery1.sql.add(' where producto_id=:producto_id');
    ZQuery1.parambyname('producto_id').asstring:=producto_id.text;
    ZQuery1.ExecSQL;


    ZQCalculopreciodetaprod.First;
    while not ZQCalculopreciodetaprod.Eof do
        begin
            ZQuery1.sql.clear;
            ZQuery1.sql.add('Insert into calculopreciodetaprod (calculopreciodetaprod_descripcion, ');
            ZQuery1.sql.add('calculopreciodetaprod_id, calculopreciodetaprod_orden, ');
            ZQuery1.sql.add('calculopreciodetaprod_tipo, calculopreciodetaprod_valor, ');
            ZQuery1.sql.add('producto_id) values (:calculopreciodetaprod_descripcion, ');
            ZQuery1.sql.add(':calculopreciodetaprod_id, :calculopreciodetaprod_orden, ');
            ZQuery1.sql.add(':calculopreciodetaprod_tipo, :calculopreciodetaprod_valor, ');
            ZQuery1.sql.add(':producto_id)');
            ZQuery1.parambyname('calculopreciodetaprod_descripcion').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_descripcion').AsString;
            ZQuery1.parambyname('calculopreciodetaprod_id').asstring:=princ.codigo('calculopreciodetaprod','calculopreciodetaprod_id');
            ZQuery1.parambyname('calculopreciodetaprod_orden').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsString;
            ZQuery1.parambyname('calculopreciodetaprod_tipo').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_tipo').AsString;
            ZQuery1.parambyname('calculopreciodetaprod_valor').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsString;
            ZQuery1.parambyname('producto_id').asstring:=id;
            ZQuery1.ExecSQL;

            ZQCalculopreciodetaprod.Next;
        end;


    ZQuery1.sql.clear;
    ZQuery1.sql.add('commit');
    ZQuery1.ExecSQL;


    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);


end;


procedure Tproductos.politicaprecio_idExit(Sender: TObject);
begin
    calcularpreciosfinales(3);
end;

procedure Tproductos.producto_preciocostoExit(Sender: TObject);
begin
    calcularpreciosfinales;
end;

procedure Tproductos.producto_precioventabaseExit(Sender: TObject);
begin
    calcularpreciosfinales(2);
end;

procedure Tproductos.tipoiva_idExit(Sender: TObject);
begin
    calcularpreciosfinales(4);
end;

procedure Tproductos.btncalculopreciodetaprodClick(Sender: TObject);
var
  i:integer;
begin
    calculoprecioproductos:= Tcalculoprecioproductos.Create(self);
    calculoprecioproductos.producto_id:=id;
    if calculoprecioproductos.ShowModal=mrOk then
      begin
          ZQCalculopreciodetaprod.Active:=false;
          ZQCalculopreciodetaprod.SQL.Text:='select * from calculopreciodetaprod where 1=2 order by calculopreciodetaprod_orden';
          ZQCalculopreciodetaprod.Active:=true;
          calculoprecioproductos.ZQCalculopreciodetaprod.First;

          while not calculoprecioproductos.ZQCalculopreciodetaprod.Eof do
              begin
                  ZQCalculopreciodetaprod.Insert;
                  for i := 0 to ZQCalculopreciodetaprod.FieldCount - 1 do
                    ZQCalculopreciodetaprod.Fields.Fields[i].Value:=calculoprecioproductos.ZQCalculopreciodetaprod.Fields.Fields[i].Value;

                  ZQCalculopreciodetaprod.Post;
                  calculoprecioproductos.ZQCalculopreciodetaprod.Next;
              end;
          calcularpreciosfinales(2);
      end;

    calculoprecioproductos.Free;
end;

procedure Tproductos.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tproductos.btnguardarClick(Sender: TObject);
begin
    if control then
      begin
          case abm of
              1:begin
                    agregar;

                end;

              2:begin
                    modificar;

                end;

              3:begin
                    if (MessageDlg('Seguro desea eliminar este cliente?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                      eliminar;


                end;
          end;




      end;
end;

function Tproductos.control:boolean;
var
  error:integer;
  cliente_id_dni:string;
begin
    error:=0;

    if (producto_codigo.Text<>'') and (controlar_codigos) then
      begin
          if not Princ.ControlCodigoProducto(producto_codigo.Text,id,'producto_codigo',false) then
            error:=1;

      end;

    if (producto_codigobarras.Text<>'') and (controlar_codigos) then
      begin
          if not Princ.ControlCodigoProducto(producto_codigobarras.Text,id,'producto_codigobarras',false) then
            error:=2;

      end;


    case error of
        1:begin
              MessageDlg('Codigo2 Repetido en otro producto', mtError, [mbOK], 0);
              producto_codigo.SetFocus;

          end;
        2:begin
              MessageDlg('Codigo de barras repetido en otro producto', mtError, [mbOK], 0);
              producto_codigobarras.SetFocus;

          end;

    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;


procedure Tproductos.agregar;
begin
    id:=Princ.codigo('productos','producto_id');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('begin');
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into productos (calculoprecio_id, politicaprecio_id, ');
    ZQuery1.sql.add('producto_codigo, producto_codigobarras, producto_estado, ');
    ZQuery1.sql.add('producto_id, producto_neto1, producto_neto2, producto_neto3, ');
    ZQuery1.sql.add('producto_neto4, producto_nombre, producto_observaciones, ');
    ZQuery1.sql.add('producto_preciocosto, producto_precioventa1, producto_precioventa2, ');
    ZQuery1.sql.add('producto_precioventa3, producto_precioventa4, producto_precioventabase, ');
    ZQuery1.sql.add('proveedor_id, rubro_id, tipoiva_id, producto_fechaactualizacionprecio, producto_codigoreferencia, producto_tipo) ');
    ZQuery1.sql.add('values (:calculoprecio_id, ');
    ZQuery1.sql.add(':politicaprecio_id, :producto_codigo, :producto_codigobarras, ');
    ZQuery1.sql.add(':producto_estado, :producto_id, :producto_neto1, ');
    ZQuery1.sql.add(':producto_neto2, :producto_neto3, :producto_neto4, ');
    ZQuery1.sql.add(':producto_nombre, :producto_observaciones, :producto_preciocosto, ');
    ZQuery1.sql.add(':producto_precioventa1, :producto_precioventa2, :producto_precioventa3, ');
    ZQuery1.sql.add(':producto_precioventa4, :producto_precioventabase, :proveedor_id, ');
    ZQuery1.sql.add(':rubro_id, :tipoiva_id, :producto_fechaactualizacionprecio, :producto_codigoreferencia, :producto_tipo)');

    ZQuery1.parambyname('producto_id').asstring:=id;
    ZQuery1.parambyname('producto_nombre').asstring:=producto_nombre.Text;
    ZQuery1.parambyname('producto_observaciones').asstring:=producto_observaciones.Lines.Text;
    ZQuery1.parambyname('producto_codigo').asstring:=producto_codigo.Text;
    ZQuery1.parambyname('producto_codigobarras').asstring:=producto_codigobarras.Text;
    ZQuery1.parambyname('producto_preciocosto').asstring:=producto_preciocosto.Text;
    ZQuery1.parambyname('producto_estado').asstring:=producto_estado.Text;
    ZQuery1.parambyname('producto_precioventa1').asstring:=producto_precioventa1.Text;
    ZQuery1.parambyname('producto_precioventa2').asstring:=producto_precioventa2.Text;
    ZQuery1.parambyname('producto_precioventa3').asstring:=producto_precioventa3.Text;
    ZQuery1.parambyname('producto_precioventa4').asstring:=producto_precioventa4.Text;
    ZQuery1.parambyname('tipoiva_id').asstring:=tipoiva_id.codigo;
    ZQuery1.parambyname('rubro_id').asstring:=rubro_id.codigo;
    ZQuery1.parambyname('calculoprecio_id').asstring:=calculoprecio_id.codigo;
    ZQuery1.parambyname('politicaprecio_id').asstring:=politicaprecio_id.codigo;
    ZQuery1.parambyname('producto_precioventabase').asstring:=producto_precioventabase.Text;
    ZQuery1.parambyname('producto_neto1').asstring:=producto_neto1.Text;
    ZQuery1.parambyname('producto_neto2').asstring:=producto_neto2.Text;
    ZQuery1.parambyname('producto_neto3').asstring:=producto_neto3.Text;
    ZQuery1.parambyname('producto_neto4').asstring:=producto_neto4.Text;
    ZQuery1.parambyname('proveedor_id').asstring:=proveedor_id.codigo;
    ZQuery1.parambyname('producto_fechaactualizacionprecio').asstring:=formatdatetime('yyyy-mm-dd',date);
    ZQuery1.parambyname('producto_codigoreferencia').asstring:=producto_codigoreferencia.Text;
    ZQuery1.parambyname('producto_tipo').asstring:=producto_tipo;

    ZQuery1.ExecSQL;


    MQproductodeposito.First;
    while not MQproductodeposito.Eof do
        begin
            ZQuery1.sql.clear;
            ZQuery1.sql.add('Insert into productodeposito (deposito_id, ');
            ZQuery1.sql.add('producdepo_puntorepos, producdepo_stockactual, ');
            ZQuery1.sql.add('producdepo_stockminimo, producto_id, producdepo_id, producdepo_stockinicial) ');
            ZQuery1.sql.add('values (:deposito_id, ');
            ZQuery1.sql.add(':producdepo_puntorepos, :producdepo_stockactual, ');
            ZQuery1.sql.add(':producdepo_stockminimo, :producto_id, :producdepo_id, :producdepo_stockinicial)');
            ZQuery1.parambyname('deposito_id').asstring:=MQproductodeposito.FieldByName('deposito_id').AsString;
            ZQuery1.parambyname('producdepo_puntorepos').asstring:=MQproductodeposito.FieldByName('producdepo_puntorepos').AsString;
            ZQuery1.parambyname('producdepo_stockactual').asstring:=MQproductodeposito.FieldByName('producdepo_stockactual').AsString;
            ZQuery1.parambyname('producdepo_stockminimo').asstring:=MQproductodeposito.FieldByName('producdepo_stockminimo').AsString;
            ZQuery1.parambyname('producdepo_stockinicial').asstring:=MQproductodeposito.FieldByName('producdepo_stockinicial').AsString;
            ZQuery1.parambyname('producto_id').asstring:=id;
            ZQuery1.parambyname('producdepo_id').asstring:='0';
            ZQuery1.ExecSQL;

            MQproductodeposito.Next;
        end;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from calculopreciodetaprod');
    ZQuery1.sql.add(' where producto_id=:producto_id');
    ZQuery1.parambyname('producto_id').asstring:=producto_id.text;
    ZQuery1.ExecSQL;

    ZQCalculopreciodetaprod.First;
    while not ZQCalculopreciodetaprod.Eof do
        begin
            ZQuery1.sql.clear;
            ZQuery1.sql.add('Insert into calculopreciodetaprod (calculopreciodetaprod_descripcion, ');
            ZQuery1.sql.add('calculopreciodetaprod_id, calculopreciodetaprod_orden, ');
            ZQuery1.sql.add('calculopreciodetaprod_tipo, calculopreciodetaprod_valor, ');
            ZQuery1.sql.add('producto_id) values (:calculopreciodetaprod_descripcion, ');
            ZQuery1.sql.add(':calculopreciodetaprod_id, :calculopreciodetaprod_orden, ');
            ZQuery1.sql.add(':calculopreciodetaprod_tipo, :calculopreciodetaprod_valor, ');
            ZQuery1.sql.add(':producto_id)');
            ZQuery1.parambyname('calculopreciodetaprod_descripcion').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_descripcion').AsString;
            ZQuery1.parambyname('calculopreciodetaprod_id').asstring:=princ.codigo('calculopreciodetaprod','calculopreciodetaprod_id');
            ZQuery1.parambyname('calculopreciodetaprod_orden').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsString;
            ZQuery1.parambyname('calculopreciodetaprod_tipo').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_tipo').AsString;
            ZQuery1.parambyname('calculopreciodetaprod_valor').asstring:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsString;
            ZQuery1.parambyname('producto_id').asstring:=id;
            ZQuery1.ExecSQL;

            ZQCalculopreciodetaprod.Next;
        end;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('commit');
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);
end;

procedure Tproductos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tproductos.FormCreate(Sender: TObject);
begin
    rubro_id.llenarcombo;
    try
      rubro_id.ItemIndex:=1;
    except
    end;

    proveedor_id.llenarcombo;
    try
      proveedor_id.ItemIndex:=1;
    except
    end;

    tipoiva_id.llenarcombo;
    try
      tipoiva_id.ItemIndex:=1;
    except
    end;

    calculoprecio_id.llenarcombo;
    try
      calculoprecio_id.ItemIndex:=0;
    except
    end;

    politicaprecio_id.llenarcombo;
    try
      politicaprecio_id.ItemIndex:=0;
    except
    end;

    lblNombrePrecio1.Caption:=Princ.NOMBREPRECIO1;
    lblNombrePrecio2.Caption:=Princ.NOMBREPRECIO2;
    lblNombrePrecio3.Caption:=Princ.NOMBREPRECIO3;
    lblNombrePrecio4.Caption:=Princ.NOMBREPRECIO4;

    producto_tipo:='PRODUCTO';

    controlar_codigos:=true;

end;

procedure Tproductos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F9:btnguardar.Click;
    end;
end;

procedure Tproductos.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQproductos.Active:=false;
          ZQproductos.ParamByName('producto_id').AsString:=id;
          ZQproductos.Active:=true;

      end
    else
      begin
          id:='';
          producto_id.Text:=Princ.codigo('productos','producto_id');
          producto_nombre.Text:='';
          producto_observaciones.Lines.Text:='';
          producto_codigo.Text:=producto_id.Text;
          producto_codigobarras.Text:=producto_id.Text;
          producto_preciocosto.Text:='0';
          calculoprecio_id.ItemIndex:=0;
          politicaprecio_id.ItemIndex:=0;
          tipoiva_id.ItemIndex:=0;
          producto_precioventa1.Text:='0';
          producto_precioventa2.Text:='0';
          producto_precioventa3.Text:='0';
          producto_precioventa4.Text:='0';
          producto_codigoreferencia.Text:='';
          calcularpreciosfinales(0);

          rubro_id.ItemIndex:=1;
          proveedor_id.ItemIndex:=0;
          producto_estado.ItemIndex:=0;

      end;

    MQproductodeposito.Active:=false;
    MQproductodeposito.Active:=true;

    ZQDepositos.Active:=false;
    ZQDepositos.Active:=true;
    while not ZQDepositos.Eof do
        begin
            MQproductodeposito.Insert;
            MQproductodeposito.FieldByName('deposito_id').AsString:=ZQDepositos.FieldByName('deposito_id').AsString;
            MQproductodeposito.FieldByName('deposito_nombre').AsString:=ZQDepositos.FieldByName('deposito_nombre').AsString;
            MQproductodeposito.FieldByName('producto_id').AsString:=id;
            MQproductodeposito.FieldByName('producdepo_puntorepos').AsString:='0';
            MQproductodeposito.FieldByName('producdepo_stockminimo').AsString:='0';
            MQproductodeposito.FieldByName('producdepo_stockactual').AsString:='0';
            MQproductodeposito.FieldByName('producdepo_stockinicial').AsString:='0';
            ZQproductodeposito.Active:=false;
            ZQproductodeposito.ParamByName('producto_id').AsString:=id;
            ZQproductodeposito.ParamByName('deposito_id').AsString:=ZQDepositos.FieldByName('deposito_id').AsString;
            ZQproductodeposito.Active:=true;
            ZQproductodeposito.First;

            if not ZQproductodeposito.Eof then
              begin
                  MQproductodeposito.FieldByName('producdepo_puntorepos').AsString:=ZQproductodeposito.FieldByName('producdepo_puntorepos').AsString;
                  MQproductodeposito.FieldByName('producdepo_stockminimo').AsString:=ZQproductodeposito.FieldByName('producdepo_stockminimo').AsString;
                  MQproductodeposito.FieldByName('producdepo_stockactual').AsString:=ZQproductodeposito.FieldByName('producdepo_stockactual').AsString;
                  MQproductodeposito.FieldByName('producdepo_stockinicial').AsString:=ZQproductodeposito.FieldByName('producdepo_stockinicial').AsString;


              end;

            ZQDepositos.Next;
        end;
    ZQCalculopreciodetaprod.Active:=false;
    ZQCalculopreciodetaprod.SQL.Text:='select * from calculopreciodetaprod where producto_id="'+id+'" order by calculopreciodetaprod_orden';
    ZQCalculopreciodetaprod.Active:=true;

    if not Princ.PRODUCTOSTOCKINICIAL then
      begin
          DBGrid1.Columns.Items[1].Visible:=false;


      end;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        6:begin
              btnguardar.Enabled:=false;
              btncalculopreciodetaprod.Enabled:=false;
          end;

    end;


end;

procedure Tproductos.ZQproductosAfterOpen(DataSet: TDataSet);
begin
    producto_id.Text:=id;
    producto_nombre.Text:=ZQproductos.FieldByName('producto_nombre').AsString;
    producto_observaciones.Lines.Text:=ZQproductos.FieldByName('producto_observaciones').AsString;
    producto_codigo.Text:=ZQproductos.FieldByName('producto_codigo').AsString;
    producto_codigobarras.Text:=ZQproductos.FieldByName('producto_codigobarras').AsString;
    rubro_id.Buscar(ZQproductos.FieldByName('rubro_id').AsString);
    proveedor_id.Buscar(ZQproductos.FieldByName('proveedor_id').AsString);
    producto_estado.Text:=ZQproductos.FieldByName('producto_estado').AsString;
    calculoprecio_id.Buscar(ZQproductos.FieldByName('calculoprecio_id').AsString);
    politicaprecio_id.Buscar(ZQproductos.FieldByName('politicaprecio_id').AsString);
    tipoiva_id.Buscar(ZQproductos.FieldByName('tipoiva_id').AsString);
    producto_preciocosto.Text:=ZQproductos.FieldByName('producto_preciocosto').AsString;
    producto_precioventa1.Text:=ZQproductos.FieldByName('producto_precioventa1').AsString;
    producto_precioventa2.Text:=ZQproductos.FieldByName('producto_precioventa2').AsString;
    producto_precioventa3.Text:=ZQproductos.FieldByName('producto_precioventa3').AsString;
    producto_precioventa4.Text:=ZQproductos.FieldByName('producto_precioventa4').AsString;
    producto_precioventabase.Text:=ZQproductos.FieldByName('producto_precioventabase').AsString;
    producto_neto1.Text:=ZQproductos.FieldByName('producto_neto1').AsString;
    producto_neto2.Text:=ZQproductos.FieldByName('producto_neto2').AsString;
    producto_neto3.Text:=ZQproductos.FieldByName('producto_neto3').AsString;
    producto_neto4.Text:=ZQproductos.FieldByName('producto_neto4').AsString;
    producto_codigoreferencia.Text:=ZQproductos.FieldByName('producto_codigoreferencia').AsString;

end;

end.
