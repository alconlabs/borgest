unit UnitCargaStockCurva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Grids, DBGrids, StdCtrls, UnitSqlComboBox, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, AdvEdit,
  DBAdvEd, MQuery, Menus;

type
  TCargaStockCurvas = class(TABMbase)
    Label15: TLabel;
    Label3: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    producto_codigoarticulo: TEdit;
    producto_nombre: TEdit;
    marca_id: TSqlComboBox;
    seccion_id: TSqlComboBox;
    rubro_id: TSqlComboBox;
    lblNombrePrecio1: TLabel;
    producto_precioventa1: TDBAdvEdit;
    DBGrid2: TDBGrid;
    StringGrid1: TStringGrid;
    ZQProducto: TZQuery;
    ZQProductosTalles: TZQuery;
    btnaplicarstock: TButton;
    MQProductosTalles: TMQuery;
    Button1: TButton;
    DTSProductosTallesCodigos: TDataSource;
    MQProductosTallesproducto_id: TStringField;
    MQProductosTallesproducto_talle: TStringField;
    MQProductosTallesproducto_tallecodigo: TStringField;
    MQProductosTallesproducto_talleorden: TIntegerField;
    ZQCurva: TZQuery;
    PopupMenu1: TPopupMenu;
    Label4: TLabel;
    Eliminar1: TMenuItem;
    StringGridStock: TStringGrid;
    Label5: TLabel;
    ZQProductoDeposito: TZQuery;
    ZQDepositos: TZQuery;
    Label6: TLabel;
    producto_codigobarras: TEdit;
    Remito: TLabel;
    StringGridEnvio: TStringGrid;
    btnenviarstock: TButton;
    MQProductosTallesproducto_precioventa1: TFloatField;
    MQDepositosDestinos: TMQuery;
    ZQmovimdepodetalles: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure producto_nombreEnter(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnaplicarstockClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure seccion_idExit(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure producto_codigobarrasExit(Sender: TObject);
    procedure producto_precioventa1Exit(Sender: TObject);
    procedure btnenviarstockClick(Sender: TObject);
  private
    { Private declarations }
    longitud:integer;
    function ControlStock:boolean;
  public
    { Public declarations }
  end;

var
  CargaStockCurvas: TCargaStockCurvas;

implementation

uses Unitprinc;

{$R *.dfm}

function TCargaStockCurvas.ControlStock:boolean;
begin




end;

procedure TCargaStockCurvas.btnaplicarstockClick(Sender: TObject);
var
  cantidad:real;
  ajustestock_id:string;
begin
  inherited;
    if (MessageDlg('Seguro desea aplicar el stock?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          ajustestock_id:=princ.codigo('ajustestock','ajustestock_id');
          ZQExecSQL.Sql.Clear;
          ZQExecSQL.Sql.Add('insert into ajustestock set ');
          ZQExecSQL.Sql.Add('ajustestock_observaciones=:ajustestock_observaciones, ');
          ZQExecSQL.Sql.Add('personal_id=:personal_id, ');
          ZQExecSQL.Sql.Add('deposito_id=:deposito_id, ');
          ZQExecSQL.Sql.Add('ajustestock_estado=:ajustestock_estado, ');
          ZQExecSQL.Sql.Add('ajustestock_hora=:ajustestock_hora, ');
          ZQExecSQL.Sql.Add('ajustestock_fecha=:ajustestock_fecha, ');
          ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id ');
          ZQExecSQL.ParamByName('ajustestock_observaciones').AsString:='Desde Ventana Carga Stock Lector';
          ZQExecSQL.ParamByName('personal_id').AsString:=Princ.personal_id_logueado;
          ZQExecSQL.ParamByName('deposito_id').AsString:=Princ.dep_id;
          ZQExecSQL.ParamByName('ajustestock_estado').AsString:='EJECUTADO';
          ZQExecSQL.ParamByName('ajustestock_hora').AsString:=timetostr(Princ.horaservidor);
          ZQExecSQL.ParamByName('ajustestock_fecha').AsString:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);
          ZQExecSQL.ParamByName('ajustestock_id').AsString:=ajustestock_id;
          ZQExecSQL.ExecSql;


          ZQProductosTalles.First;
          while not ZQProductosTalles.Eof do
              begin
                  cantidad:=0;
                  if StringGrid1.Cells[ZQProductosTalles.RecNo-1,1]<>'' then
                    cantidad:=strtofloat(StringGrid1.Cells[ZQProductosTalles.RecNo-1,1]);


                  if cantidad>0 then
                    begin
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('insert into ajustestockdetalles set ');
                        ZQExecSQL.Sql.Add('producto_codigobarras=:producto_codigobarras, ');
                        ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
                        ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id, ');
                        ZQExecSQL.Sql.Add('ajustestockdetalle_cantidad=:ajustestockdetalle_cantidad, ');
                        ZQExecSQL.Sql.Add('ajustestockdetalle_id=:ajustestockdetalle_id ');
                        ZQExecSQL.ParamByName('producto_codigobarras').AsString:=ZQProductosTalles.FieldByName('producto_codigobarras').AsString;
                        ZQExecSQL.ParamByName('producto_id').AsString:=ZQProductosTalles.FieldByName('producto_id').AsString;
                        ZQExecSQL.ParamByName('ajustestock_id').AsString:=ajustestock_id;
                        ZQExecSQL.ParamByName('ajustestockdetalle_cantidad').AsString:='1';
                        ZQExecSQL.ParamByName('ajustestockdetalle_id').AsString:=princ.codigo('ajustestockdetalles','ajustestockdetalle_id');
                        ZQExecSQL.ExecSql;


                        Princ.actualizarstock(ZQProductosTalles.FieldByName('producto_id').AsString,cantidad, '',false);
                    end;




                  ZQProductosTalles.Next;
              end;

          MessageDlg('Stock Actualizado.', mtInformation, [mbOK], 0);

          producto_codigobarras.OnExit(self);
          StringGridEnvio.SetFocus;

      end;
end;

procedure TCargaStockCurvas.btnenviarstockClick(Sender: TObject);
var
  cantidad:real;
  movimientodeposito_id:string;
begin
  inherited;
    if (MessageDlg('Seguro desea realizar el envio?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          MQDepositosDestinos.First;
          while not MQDepositosDestinos.Eof do
              begin
                  ZQmovimdepodetalles.Active:=false;
                  ZQmovimdepodetalles.ParamByName('movimientodeposito_id').AsString:='-1';
                  ZQmovimdepodetalles.Active:=true;
                  ZQProductosTalles.First;

                  while not ZQProductosTalles.Eof do
                      begin
                          cantidad:=0;
                          if StringGridEnvio.Cells[ZQProductosTalles.RecNo,MQDepositosDestinos.RecNo]<>'' then
                            cantidad:=strtofloat(StringGridEnvio.Cells[ZQProductosTalles.RecNo,MQDepositosDestinos.RecNo]);

                          if cantidad>0 then
                            begin
                                ZQmovimdepodetalles.Insert;
                                ZQmovimdepodetalles.FieldByName('movimdepodetalle_id').AsString:='0';
                                ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat:=cantidad;
                                ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString:='0';
                                ZQmovimdepodetalles.FieldByName('movimdepodetalle_estado').AsString:='ENVIADO';
                                ZQmovimdepodetalles.FieldByName('producto_id').AsString:=ZQProductosTalles.FieldByName('producto_id').AsString;
                                ZQmovimdepodetalles.FieldByName('movimientodeposito_id').AsString:='0';

                                ZQmovimdepodetalles.Post;
                            end;

                          ZQProductosTalles.Next;
                      end;

                  if ZQmovimdepodetalles.RecordCount>0 then
                    begin
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('begin');
                        ZQExecSQL.ExecSQL;

                        movimientodeposito_id:=princ.codigo('movimientosdepositos','movimientodeposito_id');
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('insert into movimientosdepositos set ');
                        ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                        ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                        ZQExecSQL.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
                        ZQExecSQL.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
                        ZQExecSQL.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado, ');
                        ZQExecSQL.Sql.Add('movimientodeposito_hora=:movimientodeposito_hora, ');
                        ZQExecSQL.Sql.Add('movimientodeposito_fecha=:movimientodeposito_fecha, ');
                        ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id ');
                        ZQExecSQL.ParamByName('deposito_iddestino').AsString:=MQDepositosDestinos.FieldByName('deposito_id').AsString;
                        ZQExecSQL.ParamByName('deposito_idorigen').AsString:=princ.dep_id;
                        ZQExecSQL.ParamByName('movimientodeposito_observaciones').AsString:='GENERADO DESDE CARGA STOCK CURVAS';
                        ZQExecSQL.ParamByName('movimientodeposito_estadosinc').AsString:=Princ.GetConfiguracion('MOVIMDEPOESTADOSINCALCREAR');
                        ZQExecSQL.ParamByName('movimientodeposito_estado').AsString:='PENDIENTE';
                        ZQExecSQL.ParamByName('movimientodeposito_hora').AsTime:=Time;
                        ZQExecSQL.ParamByName('movimientodeposito_fecha').AsString:=FormatDateTime('yyyy-mm-dd',Date);
                        ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=movimientodeposito_id;
                        ZQExecSQL.ExecSql;

                        ZQmovimdepodetalles.First;
                        while not ZQmovimdepodetalles.Eof do
                            begin
                                ZQExecSQL.Sql.Clear;
                                ZQExecSQL.Sql.Add('insert into movimdepodetalles set ');
                                ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
                                ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
                                ZQExecSQL.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
                                ZQExecSQL.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
                                ZQExecSQL.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
                                ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                                ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                                ZQExecSQL.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
                                ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=movimientodeposito_id;
                                ZQExecSQL.ParamByName('producto_id').AsString:=ZQmovimdepodetalles.FieldByName('producto_id').AsString;
                                ZQExecSQL.ParamByName('movimdepodetalle_estado').AsString:='ENVIADO';
                                ZQExecSQL.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
                                ZQExecSQL.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                ZQExecSQL.ParamByName('movimdepodetalle_id').AsString:=princ.codigo('movimdepodetalles','movimdepodetalle_id');
                                ZQExecSQL.ParamByName('deposito_iddestino').AsString:=MQDepositosDestinos.FieldByName('deposito_id').AsString;
                                ZQExecSQL.ParamByName('deposito_idorigen').AsString:=princ.dep_id;
                                ZQExecSQL.ExecSql;

                                Princ.actualizarstock(ZQmovimdepodetalles.FieldByName('producto_id').AsString,ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat*-1,'',false);

                                ZQmovimdepodetalles.Next;
                            end;
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('commit');
                        ZQExecSQL.ExecSQL;

                    end;

                  MQDepositosDestinos.Next;
              end;
          MessageDlg('Envio realizado.', mtInformation, [mbOK], 0);
          producto_codigobarras.OnExit(self);
          producto_codigobarras.SetFocus;
      end;

end;

procedure TCargaStockCurvas.btnguardarClick(Sender: TObject);
var
  productoid:string;
begin
  inherited;
    if (MessageDlg('Seguro desea guardar cambios?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          MQProductosTalles.First;
          while not MQProductosTalles.Eof do
              begin
                  if MQProductosTalles.FieldByName('producto_id').AsString<>'' then
                    begin
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('update productos set ');
                        ZQExecSQL.Sql.Add('producto_talle=:producto_talle, ');
                        ZQExecSQL.Sql.Add('producto_codigobarras=:producto_codigobarras, ');
                        ZQExecSQL.Sql.Add('producto_longitudcodigo=:producto_longitudcodigo, ');
                        ZQExecSQL.Sql.Add('seccion_id=:seccion_id, ');
                        ZQExecSQL.Sql.Add('marca_id=:marca_id, ');
                        if MQProductosTalles.FieldByName('producto_precioventa1').AsFloat<>ZQProducto.FieldByName('producto_precioventa1').AsFloat then
                          ZQExecSQL.Sql.Add('producto_fechaactualizacionprecio=:producto_fechaactualizacionprecio, ');
                        ZQExecSQL.Sql.Add('rubro_id=:rubro_id, ');
                        ZQExecSQL.Sql.Add('producto_precioventa1=:producto_precioventa1, ');
                        ZQExecSQL.Sql.Add('producto_observaciones=:producto_observaciones, ');
                        ZQExecSQL.sql.add('producto_estadosinc="PENDIENTE", ');
                        ZQExecSQL.Sql.Add('producto_nombre=:producto_nombre ');
                        ZQExecSQL.Sql.Add('where producto_id=:producto_id ');
                        ZQExecSQL.ParamByName('producto_talle').AsString:=MQProductosTalles.FieldByName('producto_talle').AsString;
                        ZQExecSQL.ParamByName('seccion_id').AsString:=seccion_id.codigo;
                        ZQExecSQL.ParamByName('marca_id').AsString:=marca_id.codigo;
                        if MQProductosTalles.FieldByName('producto_precioventa1').AsFloat<>ZQProducto.FieldByName('producto_precioventa1').AsFloat then
                          ZQExecSQL.ParamByName('producto_fechaactualizacionprecio').AsString:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);
                        ZQExecSQL.ParamByName('rubro_id').AsString:=rubro_id.codigo;
                        ZQExecSQL.ParamByName('producto_precioventa1').AsString:=MQProductosTalles.FieldByName('producto_precioventa1').AsString;
                        ZQExecSQL.ParamByName('producto_observaciones').AsString:='modificado desde curvas/stock';
                        ZQExecSQL.ParamByName('producto_nombre').AsString:=producto_nombre.Text;
                        ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosTalles.FieldByName('producto_id').AsString;
                        ZQExecSQL.ParamByName('producto_codigobarras').AsString:=producto_codigoarticulo.Text+MQProductosTalles.FieldByName('producto_tallecodigo').AsString;
                        ZQExecSQL.ParamByName('producto_longitudcodigo').AsInteger:=length(producto_codigoarticulo.Text);
                        ZQExecSQL.ExecSql;

                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('update productos,marcas,rubros set ');
                        ZQExecSQL.sql.add('producto_estadosinc="PENDIENTE", ');
                        ZQExecSQL.Sql.Add('producto_talle=:talletitulo ');
                        ZQExecSQL.Sql.Add('where productos.marca_id=marcas.marca_id ');
                        ZQExecSQL.Sql.Add('productos.rubro_id=rubros.rubro_id  and marca_id=:marca_id ');
                        ZQExecSQL.Sql.Add('and producto_talle=:tallecodigo ');

                    end
                  else
                    begin
                        productoid:=Princ.codigo('productos','producto_id');
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('insert into productos set ');
                        ZQExecSQL.Sql.Add('producto_estadosinc=:producto_estadosinc, ');
                        ZQExecSQL.Sql.Add('producto_talle=:producto_talle, ');
                        ZQExecSQL.Sql.Add('seccion_id=:seccion_id, ');
                        ZQExecSQL.Sql.Add('marca_id=:marca_id, ');
                        ZQExecSQL.Sql.Add('producto_tipo=:producto_tipo, ');
                        ZQExecSQL.Sql.Add('producto_imprimir=:producto_imprimir, ');
                        ZQExecSQL.Sql.Add('producto_codigoreferencia=:producto_codigoreferencia, ');
                        ZQExecSQL.Sql.Add('producto_fechaactualizacionprecio=:producto_fechaactualizacionprecio, ');
                        ZQExecSQL.Sql.Add('proveedor_id=:proveedor_id, ');
                        ZQExecSQL.Sql.Add('producto_neto4=:producto_neto4, ');
                        ZQExecSQL.Sql.Add('producto_neto3=:producto_neto3, ');
                        ZQExecSQL.Sql.Add('producto_neto2=:producto_neto2, ');
                        ZQExecSQL.Sql.Add('producto_neto1=:producto_neto1, ');
                        ZQExecSQL.Sql.Add('politicaprecio_id=:politicaprecio_id, ');
                        ZQExecSQL.Sql.Add('calculoprecio_id=:calculoprecio_id, ');
                        ZQExecSQL.Sql.Add('producto_precioventa4=:producto_precioventa4, ');
                        ZQExecSQL.Sql.Add('producto_precioventa3=:producto_precioventa3, ');
                        ZQExecSQL.Sql.Add('producto_precioventa2=:producto_precioventa2, ');
                        ZQExecSQL.Sql.Add('rubro_id=:rubro_id, ');
                        ZQExecSQL.Sql.Add('tipoiva_id=:tipoiva_id, ');
                        ZQExecSQL.Sql.Add('producto_precioventa1=:producto_precioventa1, ');
                        ZQExecSQL.Sql.Add('producto_estado=:producto_estado, ');
                        ZQExecSQL.Sql.Add('producto_precioventabase=:producto_precioventabase, ');
                        ZQExecSQL.Sql.Add('producto_preciocosto=:producto_preciocosto, ');
                        ZQExecSQL.Sql.Add('producto_codigobarras=:producto_codigobarras, ');
                        ZQExecSQL.Sql.Add('producto_codigo=:producto_codigo, ');
                        ZQExecSQL.Sql.Add('producto_observaciones=:producto_observaciones, ');
                        ZQExecSQL.Sql.Add('producto_nombre=:producto_nombre, ');
                        ZQExecSQL.Sql.Add('producto_longitudcodigo=:producto_longitudcodigo, ');
                        ZQExecSQL.Sql.Add('producto_id=:producto_id ');
                        ZQExecSQL.ParamByName('producto_estadosinc').AsString:='PENDIENTE';
                        ZQExecSQL.ParamByName('producto_talle').AsString:=MQProductosTalles.FieldByName('producto_talle').AsString;
                        ZQExecSQL.ParamByName('seccion_id').AsString:=seccion_id.codigo;
                        ZQExecSQL.ParamByName('marca_id').AsString:=marca_id.codigo;
                        ZQExecSQL.ParamByName('producto_tipo').AsString:='PRODUCTO';
                        ZQExecSQL.ParamByName('producto_imprimir').AsString:='0';
                        ZQExecSQL.ParamByName('producto_codigoreferencia').AsString:='';
                        ZQExecSQL.ParamByName('producto_fechaactualizacionprecio').AsString:=formatdatetime('yyyy-mm-dd',Date);
                        ZQExecSQL.ParamByName('proveedor_id').AsString:='1';
                        ZQExecSQL.ParamByName('producto_neto4').AsString:='0';
                        ZQExecSQL.ParamByName('producto_neto3').AsString:='0';
                        ZQExecSQL.ParamByName('producto_neto2').AsString:='0';
                        ZQExecSQL.ParamByName('producto_neto1').AsString:='0';
                        ZQExecSQL.ParamByName('politicaprecio_id').AsString:='1';
                        ZQExecSQL.ParamByName('calculoprecio_id').AsString:='1';
                        ZQExecSQL.ParamByName('producto_precioventa4').AsString:='0';
                        ZQExecSQL.ParamByName('producto_precioventa3').AsString:='0';
                        ZQExecSQL.ParamByName('producto_precioventa2').AsString:='0';
                        ZQExecSQL.ParamByName('rubro_id').AsString:=rubro_id.codigo;
                        ZQExecSQL.ParamByName('tipoiva_id').AsString:='2';
                        ZQExecSQL.ParamByName('producto_precioventa1').AsString:=MQProductosTalles.FieldByName('producto_precioventa1').AsString;
                        ZQExecSQL.ParamByName('producto_estado').AsString:='DISPONIBLE';
                        ZQExecSQL.ParamByName('producto_precioventabase').AsString:='0';
                        ZQExecSQL.ParamByName('producto_preciocosto').AsString:='0';
                        ZQExecSQL.ParamByName('producto_codigobarras').AsString:=producto_codigoarticulo.Text+MQProductosTalles.FieldByName('producto_tallecodigo').AsString;;
                        ZQExecSQL.ParamByName('producto_codigo').AsString:=productoid;
                        ZQExecSQL.ParamByName('producto_observaciones').AsString:='INGRESADO DESDE CURVA STOCK';
                        ZQExecSQL.ParamByName('producto_nombre').AsString:=producto_nombre.Text;
                        ZQExecSQL.ParamByName('producto_id').AsString:=productoid;
                        ZQExecSQL.ParamByName('producto_longitudcodigo').AsInteger:=length(producto_codigoarticulo.Text);
                        ZQExecSQL.ExecSql;

                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('insert into productodeposito select 0, 0, :producto_id, deposito_id,0, 0, 0, "PENDIENTE" from depositos');
                        ZQExecSQL.ParamByName('producto_id').AsString:=productoid;
                        ZQExecSQL.ExecSQL;


                    end;

                  MQProductosTalles.Next;
              end;

          MessageDlg('Datos Guardados.', mtConfirmation, [mbOK], 0);
          MQProductosTalles.First;
          producto_codigobarras.Text:=producto_codigoarticulo.Text+MQProductosTalles.FieldByName('producto_tallecodigo').AsString;
          producto_codigobarras.OnExit(self);
          StringGrid1.SetFocus;
      end;

end;

procedure TCargaStockCurvas.Button1Click(Sender: TObject);
begin
  inherited;
    StringGrid1.Hide;
    btnaplicarstock.Hide;
    DBGrid2.Show;
    btnguardar.Show;
end;

procedure TCargaStockCurvas.Eliminar1Click(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar este talle?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          if MQProductosTalles.FieldByName('producto_id').AsString<>'' then
            begin
                try
                  ZQExecSQL.Sql.Clear;
                  ZQExecSQL.Sql.Add('delete from productodeposito ');
                  ZQExecSQL.Sql.Add('where producto_id=:producto_id ');
                  ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosTalles.FieldByName('producto_id').AsString;
                  ZQExecSQL.ExecSql;

                  ZQExecSQL.Sql.Clear;
                  ZQExecSQL.Sql.Add('delete from productos ');
                  ZQExecSQL.Sql.Add('where producto_id=:producto_id ');
                  ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosTalles.FieldByName('producto_id').AsString;
                  ZQExecSQL.ExecSql;
                except

                end;



            end;

          try
            MQProductosTalles.Delete;
          except

          end;




      end;
end;

procedure TCargaStockCurvas.producto_codigobarrasExit(Sender: TObject);
var
  filaenvio:integer;
begin
  inherited;
    ZQProducto.Active:=false;
    ZQProducto.SQL.Text:='select * from productos '+
//                          'inner join marcas on productos.marca_id=marcas.marca_id '+
                          'where producto_codigobarras="'+producto_codigobarras.Text+'"';
    ZQProducto.Active:=true;
    MQProductosTalles.Active:=false;
    MQProductosTalles.Active:=true;
    if ZQProducto.RecordCount>0 then
      begin
          id:=ZQProducto.FieldByName('producto_id').AsString;
          longitud:=ZQProducto.FieldByName('producto_longitudcodigo').AsInteger;
          StringGrid1.Show;
          btnaplicarstock.Show;
          DBGrid2.Hide;
          btnguardar.Hide;

          producto_codigoarticulo.Text:=copy(producto_codigobarras.Text,0,longitud);
          seccion_id.Buscar(ZQProducto.FieldByName('seccion_id').AsString);
          marca_id.Buscar(ZQProducto.FieldByName('marca_id').AsString);
          rubro_id.Buscar(ZQProducto.FieldByName('rubro_id').AsString);
          producto_nombre.Text:=ZQProducto.FieldByName('producto_nombre').AsString;
          producto_precioventa1.Text:=ZQProducto.FieldByName('producto_precioventa1').AsString;
          
          

          ZQProductosTalles.Active:=false;
          ZQProductosTalles.SQL.Text:='select *, substring(producto_codigobarras,"'+inttostr(longitud)+'"+1,length(producto_codigobarras)) as producto_tallecodigo from productos where producto_codigobarras like "'+producto_codigoarticulo.Text+'%"';
          ZQProductosTalles.Active:=true;
          StringGrid1.ColCount:=ZQProductosTalles.RecordCount;
//          StringGrid1.Rows.Clear;
//          StringGrid1.Cols.Clear;

          StringGridStock.ColCount:=ZQProductosTalles.RecordCount+1;
          StringGridEnvio.ColCount:=ZQProductosTalles.RecordCount+1;
          ZQProductosTalles.First;

          while not ZQProductosTalles.Eof do
              begin
                  StringGrid1.Cells[ZQProductosTalles.RecNo-1,0]:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                  StringGrid1.Cells[ZQProductosTalles.RecNo-1,1]:='0';


                  StringGridStock.Cells[ZQProductosTalles.RecNo,0]:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                  StringGridEnvio.Cells[ZQProductosTalles.RecNo,0]:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                  filaenvio:=1;
                  ZQProductoDeposito.Active:=false;
                  ZQProductoDeposito.SQL.Text:='select * from productodeposito where producto_id="'+ZQProductosTalles.FieldByName('producto_id').AsString+'" order by deposito_id';
                  ZQProductoDeposito.Active:=true;
                  ZQProductoDeposito.First;
                  while not ZQProductoDeposito.Eof do
                      begin
                          StringGridStock.Cells[ZQProductosTalles.RecNo,ZQProductoDeposito.RecNo]:=ZQProductoDeposito.FieldByName('producdepo_stockactual').AsString;

                          if ZQProductoDeposito.FieldByName('deposito_id').AsString<>Princ.dep_id then
                            begin
                                StringGridEnvio.Cells[ZQProductosTalles.RecNo,filaenvio]:='0';

                                filaenvio:=filaenvio+1;


                            end;


                          ZQProductoDeposito.Next;
                      end;



                  MQProductosTalles.Insert;
                  MQProductosTalles.FieldByName('producto_id').AsString:=ZQProductosTalles.FieldByName('producto_id').AsString;
                  MQProductosTalles.FieldByName('producto_talle').AsString:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                  MQProductosTalles.FieldByName('producto_tallecodigo').AsString:=ZQProductosTalles.FieldByName('producto_tallecodigo').AsString;
                  MQProductosTalles.FieldByName('producto_talleorden').AsString:='0';
                  MQProductosTalles.FieldByName('producto_precioventa1').AsString:=ZQProductosTalles.FieldByName('producto_precioventa1').AsString;
                  MQProductosTalles.Post;
                  
                  ZQProductosTalles.Next;
              end;
          StringGrid1.SetFocus;
      end
    else
      begin
          producto_codigoarticulo.Text:=producto_codigobarras.Text;
          seccion_id.Buscar('');
          marca_id.Buscar('');
          rubro_id.Buscar('');
          producto_nombre.Text:='';
          producto_precioventa1.Text:='0';
          StringGrid1.Hide;
          btnaplicarstock.Hide;
          DBGrid2.Show;
          btnguardar.Show;
          StringGridStock.ColCount:=2;
          StringGridEnvio.ColCount:=2;
          StringGridStock.RowCount:=1+ZQDepositos.RecordCount;
          StringGridEnvio.RowCount:=ZQDepositos.RecordCount;

      end;
end;

procedure TCargaStockCurvas.producto_nombreEnter(Sender: TObject);
begin
  inherited;
     producto_nombre.Text:=rubro_id.Text + ' ' +marca_id.Text+ ' ' +' Articulo '+producto_codigoarticulo.Text;  
end;

procedure TCargaStockCurvas.producto_precioventa1Exit(Sender: TObject);
begin
  inherited;
    MQProductosTalles.First;
    while not MQProductosTalles.Eof do
        begin
            MQProductosTalles.Edit;
            MQProductosTalles.FieldByName('producto_precioventa1').AsString:=producto_precioventa1.Text;
            MQProductosTalles.Post;

            MQProductosTalles.Next;
        end;
end;

procedure TCargaStockCurvas.seccion_idExit(Sender: TObject);
begin
  inherited;
    if ZQProducto.RecordCount=0 then
      begin
          if (seccion_id.codigo<>'-1') and (marca_id.codigo<>'-1') and (rubro_id.codigo<>'-1') then
            begin
                ZQCurva.Active:=false;
                ZQCurva.ParamByName('seccion_id').AsString:=seccion_id.codigo;
                ZQCurva.ParamByName('marca_id').AsString:=marca_id.codigo;
                ZQCurva.ParamByName('rubro_id').AsString:=rubro_id.codigo;
                ZQCurva.Active:=true;
                ZQCurva.First;
                MQProductosTalles.Active:=false;
                MQProductosTalles.Active:=true;
                while not ZQCurva.Eof do
                    begin
                        MQProductosTalles.Insert;
                        MQProductosTalles.FieldByName('producto_id').AsString:='';
                        MQProductosTalles.FieldByName('producto_talle').AsString:=ZQCurva.FieldByName('curvadetalle_talle').AsString;
                        MQProductosTalles.FieldByName('producto_tallecodigo').AsString:=ZQCurva.FieldByName('curvadetalle_talle').AsString;
                        MQProductosTalles.FieldByName('producto_talleorden').AsString:='0';
                        MQProductosTalles.FieldByName('producto_precioventa1').AsString:='0';

                        ZQCurva.Next;
                    end;

            end;



      end;

end;

procedure TCargaStockCurvas.FormCreate(Sender: TObject);
var
  filaenvio:integer;
begin
  inherited;
    seccion_id.llenarcombo;
    marca_id.llenarcombo;
    rubro_id.llenarcombo;

    ZQDepositos.Active:=false;
    ZQDepositos.Active:=true;


    StringGridStock.RowCount:=1+ZQDepositos.RecordCount;
    StringGridEnvio.RowCount:=ZQDepositos.RecordCount;
    filaenvio:=1;
    MQDepositosDestinos.Active:=false;
    MQDepositosDestinos.Active:=true;
    ZQDepositos.First;
    while not ZQDepositos.Eof do
        begin
            StringGridStock.Cells[0,ZQDepositos.RecNo]:=ZQDepositos.FieldByName('deposito_nombre').AsString;

            if ZQDepositos.FieldByName('deposito_id').AsString<>Princ.dep_id then
              begin
                  StringGridEnvio.Cells[0,filaenvio]:=ZQDepositos.FieldByName('deposito_nombre').AsString;
                  MQDepositosDestinos.Last;
                  MQDepositosDestinos.Next;
                  MQDepositosDestinos.Insert;
                  MQDepositosDestinos.FieldByName('deposito_id').AsString:=ZQDepositos.FieldByName('deposito_id').AsString;
                  MQDepositosDestinos.Post;

                  filaenvio:=filaenvio+1;
              end;


            ZQDepositos.Next;

        end;

end;

end.             9
