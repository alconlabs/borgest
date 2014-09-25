unit UnitCargaStockLector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Grids, DBGrids, StdCtrls, UnitSqlComboBox, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, AdvEdit,
  DBAdvEd, MQuery, Menus, ComCtrls;

type
  TCargaStockLector = class(TABMbase)
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
    ZQProducto: TZQuery;
    ZQProductosTalles: TZQuery;
    MQProductosTalles: TMQuery;
    DTSProductosTallesCodigos: TDataSource;
    MQProductosTallesproducto_id: TStringField;
    MQProductosTallesproducto_talle: TStringField;
    MQProductosTallesproducto_tallecodigo: TStringField;
    MQProductosTallesproducto_talleorden: TIntegerField;
    ZQCurva: TZQuery;
    PopupMenu1: TPopupMenu;
    Eliminar1: TMenuItem;
    ZQProductoDeposito: TZQuery;
    ZQDepositos: TZQuery;
    Label6: TLabel;
    producto_codigobarras: TEdit;
    MQProductosStock: TMQuery;
    MQProductosNuevos: TMQuery;
    DTSProductosStock: TDataSource;
    DTSProductosNuevos: TDataSource;
    MQProductosStockproducto_id: TStringField;
    MQProductosStockproducto_codigobarras: TStringField;
    MQProductosStockproducto_nombre: TStringField;
    MQProductosNuevosproducto_id: TStringField;
    MQProductosNuevosproducto_codigobarras: TStringField;
    MQProductosNuevosproducto_nombre: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    BtnAgregarStock: TButton;
    btnlimpiar: TButton;
    BtnAgregarStockNuevos: TButton;
    Button1: TButton;
    Button2: TButton;
    MQProductosNuevosproducto_estadostock: TStringField;
    MQProductosTallesproducto_precioventa1: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure producto_nombreEnter(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure seccion_idExit(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure producto_codigobarrasExit(Sender: TObject);
    procedure BtnAgregarStockClick(Sender: TObject);
    procedure TabSheet1Hide(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnlimpiarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnAgregarStockNuevosClick(Sender: TObject);
    procedure producto_precioventa1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    longitud:integer;
    procedure LimpiarVentana;
    procedure MostrarDatosProducto(codigobarras:string);
  public
    { Public declarations }
  end;

var
  CargaStockLector: TCargaStockLector;

implementation

uses Unitprinc;

{$R *.dfm}



procedure TCargaStockLector.MostrarDatosProducto(codigobarras: string);
begin
    LimpiarVentana;
    btnguardar.Enabled:=true;
    ZQProducto.Active:=false;
    ZQProducto.SQL.Text:='select * from productos '+
                          'where producto_codigobarras="'+codigobarras+'"';
    ZQProducto.Active:=true;
    if ZQProducto.RecordCount>0 then
      begin
          btnguardar.Enabled:=true;
          seccion_id.Buscar(ZQProducto.FieldByName('seccion_id').AsString);
          marca_id.Buscar(ZQProducto.FieldByName('marca_id').AsString);
          rubro_id.Buscar(ZQProducto.FieldByName('rubro_id').AsString);
          producto_nombre.Text:=ZQProducto.FieldByName('producto_nombre').AsString;
          producto_precioventa1.Text:=ZQProducto.FieldByName('producto_precioventa1').AsString;
          id:=ZQProducto.FieldByName('producto_id').AsString;
          longitud:=ZQProducto.FieldByName('producto_longitudcodigo').AsInteger;

          producto_codigoarticulo.Text:=copy(ZQProducto.FieldByName('producto_codigobarras').AsString,0,longitud);

          if longitud>0 then
            begin
                ZQProductosTalles.Active:=false;
                ZQProductosTalles.SQL.Text:='select *, substring(producto_codigobarras,"'+inttostr(longitud)+'"+1,length(producto_codigobarras)) as producto_tallecodigo from productos where producto_codigobarras like "'+producto_codigoarticulo.Text+'%"';
                ZQProductosTalles.Active:=true;
                ZQProductosTalles.First;
                MQProductosTalles.Active:=false;
                MQProductosTalles.Active:=true;
                while not ZQProductosTalles.Eof do
                    begin
                        MQProductosTalles.Insert;
                        MQProductosTalles.FieldByName('producto_id').AsString:=ZQProductosTalles.FieldByName('producto_id').AsString;
                        MQProductosTalles.FieldByName('producto_talle').AsString:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                        MQProductosTalles.FieldByName('producto_tallecodigo').AsString:=ZQProductosTalles.FieldByName('producto_tallecodigo').AsString;
                        MQProductosTalles.FieldByName('producto_precioventa1').AsString:=ZQProductosTalles.FieldByName('producto_precioventa1').AsString;
                        MQProductosTalles.FieldByName('producto_talleorden').AsString:='0';
                        MQProductosTalles.Post;

                        ZQProductosTalles.Next;
                    end;
            end;

      end
    else
      begin
          producto_codigoarticulo.Text:=codigobarras;



      end;

end;

procedure TCargaStockLector.LimpiarVentana;
begin
    producto_codigobarras.Text:='';
    producto_codigoarticulo.Text:='';
    //seccion_id.ItemIndex:=-1;
//    marca_id.ItemIndex:=-1;
//    rubro_id.ItemIndex:=-1;
//    producto_nombre.Text:='';
//    producto_precioventa1.FloatValue:=0;
    MQProductosTalles.Active:=false;
    MQProductosTalles.Active:=true;
//    DBGrid2.Hide;




end;

procedure TCargaStockLector.BtnAgregarStockClick(Sender: TObject);
var
  ajustestock_id:string;
begin
  inherited;
    if MQProductosStock.RecordCount>0 then
      begin
          if (MessageDlg('Seguro desea aplicar stock a estos productos?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
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

                MQProductosStock.First;
                while not MQProductosStock.Eof do
                    begin
                        ZQExecSQL.Sql.Clear;
                        ZQExecSQL.Sql.Add('insert into ajustestockdetalles set ');
                        ZQExecSQL.Sql.Add('producto_codigobarras=:producto_codigobarras, ');
                        ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
                        ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id, ');
                        ZQExecSQL.Sql.Add('ajustestockdetalle_cantidad=:ajustestockdetalle_cantidad, ');
                        ZQExecSQL.Sql.Add('ajustestockdetalle_id=:ajustestockdetalle_id ');
                        ZQExecSQL.ParamByName('producto_codigobarras').AsString:=MQProductosStock.FieldByName('producto_codigobarras').AsString;
                        ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosStock.FieldByName('producto_id').AsString;
                        ZQExecSQL.ParamByName('ajustestock_id').AsString:=ajustestock_id;
                        ZQExecSQL.ParamByName('ajustestockdetalle_cantidad').AsString:='1';
                        ZQExecSQL.ParamByName('ajustestockdetalle_id').AsString:=princ.codigo('ajustestockdetalles','ajustestockdetalle_id');
                        ZQExecSQL.ExecSql;

                        Princ.actualizarstock(MQProductosStock.FieldByName('producto_id').AsString,1, '',false);

                        MQProductosStock.Next;
                    end;


            end;


      end;

    MessageDlg('Stock agregado', mtInformation, [mbOK], 0);
    LimpiarVentana;
    MQProductosStock.Active:=false;
    MQProductosStock.Active:=true;

    producto_codigobarras.SetFocus;

end;

procedure TCargaStockLector.BtnAgregarStockNuevosClick(Sender: TObject);
var
  ajustestock_id:string;
begin
  inherited;
    if MQProductosNuevos.RecordCount>0 then
      begin
          if (MessageDlg('Seguro desea aplicar stock a estos productos?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
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

                MQProductosNuevos.First;
                while not MQProductosNuevos.Eof do
                    begin
                        if MQProductosNuevos.FieldByName('producto_estadostock').AsString='PENDIENTE' then
                          begin
                              ZQProducto.Active:=false;
                              ZQProducto.SQL.Text:='select * from productos '+
                                                    'where producto_codigobarras="'+MQProductosNuevos.FieldByName('producto_codigobarras').AsString+'"';
                              ZQProducto.Active:=true;
                              if ZQProducto.RecordCount>0 then
                                begin
                                    MQProductosNuevos.Edit;
                                    MQProductosNuevos.FieldByName('producto_id').AsString:=ZQProducto.FieldByName('producto_id').AsString;
                                    MQProductosNuevos.FieldByName('producto_nombre').AsString:=ZQProducto.FieldByName('producto_nombre').AsString;
                                    MQProductosNuevos.FieldByName('producto_estadostock').AsString:='AGREGADO';
                                    MQProductosNuevos.Post;
                                end;
                              ZQProducto.Active:=false;

                              if MQProductosNuevos.FieldByName('producto_id').AsString<>'' then
                                begin
                                    ZQExecSQL.Sql.Clear;
                                    ZQExecSQL.Sql.Add('insert into ajustestockdetalles set ');
                                    ZQExecSQL.Sql.Add('producto_codigobarras=:producto_codigobarras, ');
                                    ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
                                    ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id, ');
                                    ZQExecSQL.Sql.Add('ajustestockdetalle_cantidad=:ajustestockdetalle_cantidad, ');
                                    ZQExecSQL.Sql.Add('ajustestockdetalle_id=:ajustestockdetalle_id ');
                                    ZQExecSQL.ParamByName('producto_codigobarras').AsString:=MQProductosNuevos.FieldByName('producto_codigobarras').AsString;
                                    ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosNuevos.FieldByName('producto_id').AsString;
                                    ZQExecSQL.ParamByName('ajustestock_id').AsString:=ajustestock_id;
                                    ZQExecSQL.ParamByName('ajustestockdetalle_cantidad').AsString:='1';
                                    ZQExecSQL.ParamByName('ajustestockdetalle_id').AsString:=princ.codigo('ajustestockdetalles','ajustestockdetalle_id');
                                    ZQExecSQL.ExecSql;

                                    Princ.actualizarstock(MQProductosNuevos.FieldByName('producto_id').AsString,1, '',false);

                                end;

                          end;

                        MQProductosNuevos.Next;
                    end;


            end;


      end;

    MessageDlg('Stock agregado', mtInformation, [mbOK], 0);
    LimpiarVentana;
//    BtnAgregarStockNuevos.Enabled:=true;
    producto_codigobarras.SetFocus;

end;

procedure TCargaStockLector.btnguardarClick(Sender: TObject);
var
  productoid:string;
begin
  inherited;
    if (MessageDlg('Seguro desea guardar cambios?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          MQProductosTalles.First;
          while not MQProductosTalles.Eof do
              begin
                  productoid:=Princ.buscar('select producto_id from productos where producto_codigobarras="'+producto_codigoarticulo.Text+MQProductosTalles.FieldByName('producto_tallecodigo').AsString+'"','producto_id');
                  if productoid<>'' then
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
                        ZQExecSQL.ParamByName('producto_observaciones').AsString:='INGRESADO DESDE CARGA STOCK LECTOR';
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
          LimpiarVentana;
          btnguardar.Enabled:=false;
      end;

end;

procedure TCargaStockLector.btnlimpiarClick(Sender: TObject);
begin
  inherited;
    LimpiarVentana;
end;

procedure TCargaStockLector.Button1Click(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea limpiar la lista de codigos?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          LimpiarVentana;
          MQProductosStock.Active:=false;
          MQProductosStock.Active:=true;

          producto_codigobarras.SetFocus;


      end;
end;

procedure TCargaStockLector.Button2Click(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea limpiar la lista de codigos?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          LimpiarVentana;
          MQProductosNuevos.Active:=false;
          MQProductosNuevos.Active:=true;

          producto_codigobarras.SetFocus;


      end;
end;

procedure TCargaStockLector.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    MostrarDatosProducto(MQProductosStock.FieldByName('producto_codigobarras').AsString);
end;

procedure TCargaStockLector.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
    MostrarDatosProducto(MQProductosNuevos.FieldByName('producto_codigobarras').AsString);
end;

procedure TCargaStockLector.Eliminar1Click(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea quitar de la lista?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQProductosStock.Delete;
          except

          end;




      end;
end;

procedure TCargaStockLector.producto_codigobarrasExit(Sender: TObject);
begin
  inherited;
    if producto_codigobarras.Text<>'' then
      begin
          ZQProducto.Active:=false;
          ZQProducto.SQL.Text:='select * from productos '+
                                'where producto_codigobarras="'+producto_codigobarras.Text+'"';
          ZQProducto.Active:=true;
          if ZQProducto.RecordCount>0 then
            begin
                MQProductosStock.Last;
                MQProductosStock.Next;
                MQProductosStock.Append;
                MQProductosStock.FieldByName('producto_id').AsString:=ZQProducto.FieldByName('producto_id').AsString;
                MQProductosStock.FieldByName('producto_codigobarras').AsString:=ZQProducto.FieldByName('producto_codigobarras').AsString;
                MQProductosStock.FieldByName('producto_nombre').AsString:=ZQProducto.FieldByName('producto_nombre').AsString;
                MQProductosStock.Post;
            end
          else
            begin
                MQProductosNuevos.Last;
                MQProductosNuevos.Next;
                MQProductosNuevos.Append;
                MQProductosNuevos.FieldByName('producto_id').AsString:='';
                MQProductosNuevos.FieldByName('producto_codigobarras').AsString:=producto_codigobarras.Text;
                MQProductosNuevos.FieldByName('producto_nombre').AsString:='';
                MQProductosNuevos.FieldByName('producto_estadostock').AsString:='PENDIENTE';
                MQProductosNuevos.Post;
            end;

          LimpiarVentana;

          producto_codigobarras.SetFocus;



      end;







//
//           BtnAgregarStock.SetFocus;
//      end
//    else
//      begin
//
//          producto_codigoarticulo.Text:=producto_codigobarras.Text;
//          DBGrid2.Show;
//          btnguardar.Show;
//
//      end;
end;

procedure TCargaStockLector.producto_nombreEnter(Sender: TObject);
begin
  inherited;
     producto_nombre.Text:=rubro_id.Text + ' ' +marca_id.Text+ ' ' +' Articulo '+producto_codigoarticulo.Text;  
end;

procedure TCargaStockLector.producto_precioventa1Exit(Sender: TObject);
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

procedure TCargaStockLector.seccion_idExit(Sender: TObject);
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

procedure TCargaStockLector.TabSheet1Hide(Sender: TObject);
begin
  inherited;
    LimpiarVentana;
end;

procedure TCargaStockLector.TabSheet2Hide(Sender: TObject);
begin
  inherited;
    LimpiarVentana;
end;

procedure TCargaStockLector.FormCreate(Sender: TObject);
begin
  inherited;
    seccion_id.llenarcombo;
    marca_id.llenarcombo;
    rubro_id.llenarcombo;

    MQProductosStock.Active:=false;
    MQProductosNuevos.Active:=false;

    MQProductosStock.Active:=true;
    MQProductosNuevos.Active:=true;


end;

end.             
