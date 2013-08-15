unit UnitActualizarProductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UnitNumEdit, Grids, DBGrids, MQuery, Menus, math, ComObj;

type
  TActualizarProductos = class(TForm)
    panelgrilla: TAdvPanel;
    PgCtrlSettings: TPageControl;
    ZQproductos: TZQuery;
    ZQuery1: TZQuery;
    DTSExcel: TDataSource;
    MQproductodeposito: TMQuery;
    MQproductodepositodeposito_id: TIntegerField;
    MQproductodepositodeposito_nombre: TStringField;
    MQproductodepositoproducto_id: TIntegerField;
    MQproductodepositoproducdepo_puntorepos: TFloatField;
    MQproductodepositoproducdepo_stockminimo: TFloatField;
    MQproductodepositoproducdepo_stockactual: TFloatField;
    ZQDepositos: TZQuery;
    ZQproductodeposito: TZQuery;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    fil_producto_id: TEdit;
    fil_producto_codigo: TEdit;
    fil_producto_codigobarras: TEdit;
    TabSheet1: TTabSheet;
    PgCtrlGrids: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    MQNuevos: TMQuery;
    Label1: TLabel;
    fil_producto_nombre: TEdit;
    Label21: TLabel;
    fil_rubro_id: TSqlComboBox;
    Label12: TLabel;
    fil_calculoprecio_id: TSqlComboBox;
    btnexaminar: TButton;
    Label2: TLabel;
    archivo_excel: TEdit;
    btnabrirarchivo: TButton;
    fil_politicaprecio_id: TSqlComboBox;
    Label14: TLabel;
    Label8: TLabel;
    fil_tipoiva_id: TSqlComboBox;
    DTSDisminuir: TDataSource;
    Hojas: TComboBox;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    btnagregarnuevos: TButton;
    btnincrementarprecios: TButton;
    btndisminuirprecios: TButton;
    Label7: TLabel;
    fil_proveedor_id: TSqlComboBox;
    Label9: TLabel;
    xls_rubro_id: TSqlComboBox;
    Label10: TLabel;
    xls_proveedor_id: TSqlComboBox;
    Label11: TLabel;
    xls_calculoprecio_id: TSqlComboBox;
    Label13: TLabel;
    xls_politicaprecio_id: TSqlComboBox;
    Label15: TLabel;
    xls_tipoiva_id: TSqlComboBox;
    Label16: TLabel;
    columna_codigo: TComboBox;
    Label17: TLabel;
    columna_descripcion: TComboBox;
    Label18: TLabel;
    columna_preciocompra: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    fila_inicio: TDBAdvEdit;
    tipo_codigo: TComboBox;
    fila_fin: TDBAdvEdit;
    MQIncrementar: TMQuery;
    MQDisminuir: TMQuery;
    DTSNuevos: TDataSource;
    DTSIncrementar: TDataSource;
    MQNuevosproducto_id: TIntegerField;
    MQNuevosproducto_nombre: TStringField;
    MQNuevosproducto_codigo: TStringField;
    MQNuevosproducto_codigobarras: TStringField;
    MQNuevosproducto_preciocosto: TFloatField;
    MQNuevosproducto_precioventabase: TFloatField;
    MQNuevosproducto_precioventa1: TFloatField;
    MQNuevosproducto_precioventa2: TFloatField;
    MQNuevosproducto_precioventa3: TFloatField;
    MQNuevosproducto_precioventa4: TFloatField;
    MQNuevoscalculoprecio_id: TIntegerField;
    MQNuevospoliticaprecio_id: TIntegerField;
    MQNuevostipoiva_id: TIntegerField;
    MQNuevosrubro_id: TIntegerField;
    MQNuevosproveedor_id: TIntegerField;
    MQNuevosproducto_neto1: TFloatField;
    MQNuevosproducto_neto2: TFloatField;
    MQNuevosproducto_neto3: TFloatField;
    MQNuevosproducto_neto4: TFloatField;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    TabSheet6: TTabSheet;
    MQSincambios: TMQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DTSSincambios: TDataSource;
    DBGrid4: TDBGrid;
    MQNuevosproducto_estado: TStringField;
    MQNuevosproducto_observaciones: TStringField;
    MQIncrementarproducto_id: TIntegerField;
    MQIncrementarproducto_nombre: TStringField;
    MQIncrementarproducto_codigo: TStringField;
    MQIncrementarproducto_codigobarras: TStringField;
    MQIncrementarproducto_preciocostoprev: TFloatField;
    MQIncrementarproducto_precioventa1prev: TFloatField;
    MQIncrementarproducto_precioventa2prev: TFloatField;
    MQIncrementarproducto_precioventa3prev: TFloatField;
    MQIncrementarproducto_precioventa4prev: TFloatField;
    MQIncrementarproducto_preciocosto: TFloatField;
    MQIncrementarproducto_precioventabase: TFloatField;
    MQIncrementarproducto_precioventa1: TFloatField;
    MQIncrementarproducto_precioventa2: TFloatField;
    MQIncrementarproducto_precioventa3: TFloatField;
    MQIncrementarproducto_precioventa4: TFloatField;
    MQIncrementarcalculoprecio_id: TIntegerField;
    MQIncrementarpoliticaprecio_id: TIntegerField;
    MQIncrementartipoiva_id: TIntegerField;
    MQIncrementarrubro_id: TIntegerField;
    MQIncrementarproveedor_id: TIntegerField;
    MQIncrementarproducto_neto1: TFloatField;
    MQIncrementarproducto_neto2: TFloatField;
    MQIncrementarproducto_neto3: TFloatField;
    MQIncrementarproducto_neto4: TFloatField;
    Label22: TLabel;
    Label23: TLabel;
    sufijo: TEdit;
    prefijo: TEdit;
    btnquitardisminuir: TButton;
    btnquitarincrementar: TButton;
    btnquitarnuevo: TButton;
    lblcantidadnuevos: TLabel;
    lblcantidadincrementar: TLabel;
    lblcantidadisminuir: TLabel;
    lblcantidadsincambios: TLabel;
    MQIncrementardiferencia: TFloatField;
    btnverarchivo: TButton;
    columna_codigoreferencia: TComboBox;
    Label24: TLabel;
    MQNuevosproducto_codigoreferencia: TStringField;
    Label26: TLabel;
    columna_stockactual: TComboBox;
    MQNuevosproducdepo_stockactual: TFloatField;
    MQIncrementarproducdepo_stockactual: TFloatField;
    MQDisminuirproducto_id: TIntegerField;
    MQDisminuirproducto_nombre: TStringField;
    MQDisminuirproducto_codigo: TStringField;
    MQDisminuirproducto_codigobarras: TStringField;
    MQDisminuirproducto_preciocostoprev: TFloatField;
    MQDisminuirproducto_precioventa1prev: TFloatField;
    MQDisminuirproducto_precioventa2prev: TFloatField;
    MQDisminuirproducto_precioventa3prev: TFloatField;
    MQDisminuirproducto_precioventa4prev: TFloatField;
    MQDisminuirproducto_preciocosto: TFloatField;
    MQDisminuirproducto_precioventabase: TFloatField;
    MQDisminuirproducto_precioventa1: TFloatField;
    MQDisminuirproducto_precioventa2: TFloatField;
    MQDisminuirproducto_precioventa3: TFloatField;
    MQDisminuirproducto_precioventa4: TFloatField;
    MQDisminuircalculoprecio_id: TIntegerField;
    MQDisminuirpoliticaprecio_id: TIntegerField;
    MQDisminuirtipoiva_id: TIntegerField;
    MQDisminuirrubro_id: TIntegerField;
    MQDisminuirproveedor_id: TIntegerField;
    MQDisminuirproducto_neto1: TFloatField;
    MQDisminuirproducto_neto2: TFloatField;
    MQDisminuirproducto_neto3: TFloatField;
    MQDisminuirproducto_neto4: TFloatField;
    MQDisminuirdiferencia: TFloatField;
    MQDisminuirproducdepo_stockactual: TFloatField;
    MQSincambiosproducdepo_stockminimo: TFloatField;
    MQSincambiosproducdepo_stockactual: TFloatField;
    MQIncrementarproducto_codigoreferencia: TStringField;
    MQDisminuirproducto_codigoreferencia: TStringField;
    MQSincambiosproducto_codigoreferencia: TStringField;
    btncodigosreferenciaincrementar: TButton;
    btncodigosreferenciadisminuir: TButton;
    btncodigosreferenciasincambios: TButton;
    PanelGrillasExcel: TPanel;
    DBGrid5: TDBGrid;
    btnfiltrar: TButton;
    ZQProductosAactualizar: TZQuery;
    DTSProductosAactualizar: TDataSource;
    GroupBox1: TGroupBox;
    Label25: TLabel;
    porc_nuevopreciocompra: TDBAdvEdit;
    Label27: TLabel;
    btnAplcarPCompra: TButton;
    Label28: TLabel;
    Label29: TLabel;
    GroupBox2: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    porc_nuevoprecioventa: TDBAdvEdit;
    btnAplicarPVenta: TButton;
    GroupBox3: TGroupBox;
    Label35: TLabel;
    btnAplicarCalculo: TButton;
    nuevo_calculoprecio_id: TSqlComboBox;
    GroupBox4: TGroupBox;
    Label34: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    btnAplicarPolitica: TButton;
    btnquitarAactualizar: TButton;
    nuevo_politicaprecio_id: TSqlComboBox;
    btnrecalculartodo: TButton;
    bnteliminarproductos: TButton;
    GroupBox5: TGroupBox;
    Label37: TLabel;
    BtnAplicarRubro: TButton;
    nuevo_rubro_id: TSqlComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnexaminarClick(Sender: TObject);
    procedure btnabrirarchivoClick(Sender: TObject);
    procedure tipo_codigoSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnagregarnuevosClick(Sender: TObject);
    procedure btnincrementarpreciosClick(Sender: TObject);
    procedure btndisminuirpreciosClick(Sender: TObject);
    procedure btnquitardisminuirClick(Sender: TObject);
    procedure btnquitarincrementarClick(Sender: TObject);
    procedure btnquitarnuevoClick(Sender: TObject);
    procedure btnverarchivoClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnquitarAactualizarClick(Sender: TObject);
    procedure btnAplcarPCompraClick(Sender: TObject);
    procedure btnAplicarPVentaClick(Sender: TObject);
    procedure btnAplicarCalculoClick(Sender: TObject);
    procedure btnAplicarPoliticaClick(Sender: TObject);
    procedure btnrecalculartodoClick(Sender: TObject);
    procedure bnteliminarproductosClick(Sender: TObject);
  private
    { Private declarations }
    destino:string;
  public
    { Public declarations }
    id:string;
    abm:integer;
    campo_codigo:string;
  end;

var
  ActualizarProductos: TActualizarProductos;

implementation

uses Unitprinc;

{$R *.dfm}


procedure TActualizarProductos.btnagregarnuevosClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea agregar estos productos?', mtConfirmation, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
      begin
          btnagregarnuevos.Enabled:=false;
          Princ.AgregarProductos(MQNuevos);

      end;
end;

procedure TActualizarProductos.btnAplcarPCompraClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea actualizar precios?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          btnAplcarPCompra.Enabled:=false;
          ZQProductosAactualizar.First;
          while not ZQProductosAactualizar.Eof do
              begin
                  ZQProductosAactualizar.Edit;
                  ZQProductosAactualizar.FieldByName('producto_preciocosto').AsFloat:=roundto(ZQProductosAactualizar.FieldByName('producto_preciocosto').AsFloat+(ZQProductosAactualizar.FieldByName('producto_preciocosto').AsFloat*porc_nuevopreciocompra.FloatValue/100),-2);
                  ZQProductosAactualizar.Post;

                  ZQProductosAactualizar.Next;
              end;
          Princ.CalcularPreciosProducto(ZQProductosAactualizar,true);

      end;
end;

procedure TActualizarProductos.btnAplicarCalculoClick(Sender: TObject);
begin
    if nuevo_calculoprecio_id.codigo<>'-1' then
      begin
          if (MessageDlg('Seguro desea actualizar precios?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
            begin
                btnAplicarCalculo.Enabled:=false;
                ZQProductosAactualizar.First;
                while not ZQProductosAactualizar.Eof do
                    begin
                        ZQProductosAactualizar.Edit;
                        ZQProductosAactualizar.FieldByName('calculoprecio_id').AsString:=nuevo_calculoprecio_id.codigo;
                        ZQProductosAactualizar.Post;

                        ZQProductosAactualizar.Next;
                    end;
                Princ.CalcularPreciosProducto(ZQProductosAactualizar,true);

            end;

      end;

end;

procedure TActualizarProductos.btnAplicarPoliticaClick(Sender: TObject);
begin
    if nuevo_politicaprecio_id.codigo<>'-1' then
      begin
          if (MessageDlg('Seguro desea actualizar precios?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
            begin
                btnAplicarPolitica.Enabled:=false;
                ZQProductosAactualizar.First;
                while not ZQProductosAactualizar.Eof do
                    begin
                        ZQProductosAactualizar.Edit;
                        ZQProductosAactualizar.FieldByName('politicaprecio_id').AsString:=nuevo_politicaprecio_id.codigo;
                        ZQProductosAactualizar.Post;

                        ZQProductosAactualizar.Next;
                    end;
                Princ.CalcularPreciosProducto(ZQProductosAactualizar,true);


            end;


      end;
end;

procedure TActualizarProductos.btnAplicarPVentaClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea actualizar precios?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          btnAplicarPVenta.Enabled:=false;
          ZQProductosAactualizar.First;
          while not ZQProductosAactualizar.Eof do
              begin
                  ZQProductosAactualizar.Edit;
                  ZQProductosAactualizar.FieldByName('producto_precioventa1').AsFloat:=roundto(ZQProductosAactualizar.FieldByName('producto_precioventa1').AsFloat+(ZQProductosAactualizar.FieldByName('producto_precioventa1').AsFloat*porc_nuevoprecioventa.FloatValue/100),-2);
                  ZQProductosAactualizar.FieldByName('producto_precioventa2').AsFloat:=roundto(ZQProductosAactualizar.FieldByName('producto_precioventa2').AsFloat+(ZQProductosAactualizar.FieldByName('producto_precioventa2').AsFloat*porc_nuevoprecioventa.FloatValue/100),-2);
                  ZQProductosAactualizar.FieldByName('producto_precioventa3').AsFloat:=roundto(ZQProductosAactualizar.FieldByName('producto_precioventa3').AsFloat+(ZQProductosAactualizar.FieldByName('producto_precioventa3').AsFloat*porc_nuevoprecioventa.FloatValue/100),-2);
                  ZQProductosAactualizar.FieldByName('producto_precioventa4').AsFloat:=roundto(ZQProductosAactualizar.FieldByName('producto_precioventa4').AsFloat+(ZQProductosAactualizar.FieldByName('producto_precioventa4').AsFloat*porc_nuevoprecioventa.FloatValue/100),-2);
                  ZQProductosAactualizar.Post;

                  ZQProductosAactualizar.Next;
              end;

      end;


    Princ.ActualizarPrecios(ZQProductosAactualizar);
end;

procedure TActualizarProductos.btndisminuirpreciosClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea actualizar estos precios?', mtConfirmation, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
      begin
          btndisminuirprecios.Enabled:=false;
          Princ.ActualizarPrecios(MQDisminuir);

      end;
end;

procedure TActualizarProductos.btnexaminarClick(Sender: TObject);
begin
    btnverarchivo.Enabled:=false;
    Princ.OpenDialog1.Filter:='Excel|*.xls|Excel|*.xlsx';
    if Princ.OpenDialog1.Execute() then
      begin
          Princ.ADODataSet1.Active:=false;
          Princ.ADOTable1.Active:=false;
          Princ.ADOConnection1.Connected:=false;

          archivo_excel.Text:=Princ.OpenDialog1.FileName;
          if destino<>'' then
            begin
                try
                  Deletefile(destino);
                finally
                end;

            end;


          destino:=PChar(ExtractFilePath(Application.ExeName)+'importaciones\'+formatdatetime('yyyymmdd-hhnnss',now)+'.xls');
          CopyFile(PChar(Princ.OpenDialog1.FileName), PChar(destino), false);

          Princ.EXCEL_FILE:=destino;

          Princ.ADOConnection1.Connected:=true;

          Princ.ADOConnection1.GetTableNames(Hojas.Items,False);

          Hojas.ItemIndex:=0;
          btnverarchivo.Enabled:=true;
      end;

    Princ.OpenDialog1.Filter:='';
end;

procedure TActualizarProductos.btnfiltrarClick(Sender: TObject);
begin
    ZQProductosAactualizar.Active:=false;
    ZQProductosAactualizar.SQL.Text:='select * from productos '+
                                     'inner join rubros on productos.rubro_id=rubros.rubro_id '+
                                     'inner join proveedores on productos.proveedor_id=proveedores.proveedor_id '+
                                     'inner join politicasdeprecios on productos.politicaprecio_id=politicasdeprecios.politicaprecio_id '+
                                     'inner join calculoprecios on productos.calculoprecio_id=calculoprecios.calculoprecio_id '+
                                     'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id ';

    if fil_producto_id.Text<>'' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.producto_id like "%'+fil_producto_id.Text+'%"');

    if fil_producto_codigo.Text<>'' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.producto_codigo like "%'+fil_producto_codigo.Text+'%"');

    if fil_producto_codigobarras.Text<>'' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.producto_codigobarras like "%'+fil_producto_codigobarras.Text+'%"');

    if fil_producto_nombre.Text<>'' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%')+'%"');

    if fil_proveedor_id.codigo<>'-1' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.proveedor_id="'+fil_proveedor_id.codigo+'"');

    if fil_calculoprecio_id.codigo<>'-1' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.calculoprecio_id="'+fil_calculoprecio_id.codigo+'"');

    if fil_rubro_id.codigo<>'-1' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.rubro_id="'+fil_rubro_id.codigo+'"');

    if fil_politicaprecio_id.codigo<>'-1' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.politicaprecio_id="'+fil_politicaprecio_id.codigo+'"');

    if fil_tipoiva_id.codigo<>'-1' then
      ZQProductosAactualizar.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQProductosAactualizar.SQL.Text,'productos.tipoiva_id="'+fil_tipoiva_id.codigo+'"');




    btnAplcarPCompra.Enabled:=true;
    btnAplicarPVenta.Enabled:=true;
    btnAplicarCalculo.Enabled:=true;
    btnAplicarPolitica.Enabled:=true;

    ZQProductosAactualizar.Active:=true;

end;

procedure TActualizarProductos.btnincrementarpreciosClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea actualizar estos precios?', mtConfirmation, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
      begin
          btnincrementarprecios.Enabled:=false;
          Princ.ActualizarPrecios(MQIncrementar);

      end;
end;

procedure TActualizarProductos.btnquitarAactualizarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar de la lista?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQProductosAactualizar.Delete;
          except
          end;
      end;
end;

procedure TActualizarProductos.btnquitardisminuirClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar de la lista?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQDisminuir.Delete;
          except
          end;
      end;
end;

procedure TActualizarProductos.btnquitarincrementarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar de la lista?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQIncrementar.Delete;
          except
          end;
      end;
end;

procedure TActualizarProductos.btnquitarnuevoClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar de la lista?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            MQNuevos.Delete;
          except
          end;
      end;
end;

procedure TActualizarProductos.btnrecalculartodoClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea actualizar los precios de todos los productos?'+#13+#10+'Se pedira una segunda confirmacion.', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          if (MessageDlg('Esta por modificar los precios de todos los productos.'+#13+#10+'Se recomienda realizar una copia de respaldo de la base de datos.'+#13+#10+'Desea continuar?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
            begin

                Princ.CalcularPreciosProducto(ZQProductosAactualizar,true);

            end;



      end;
end;

procedure TActualizarProductos.btnverarchivoClick(Sender: TObject);
begin
    Princ.ADODataSet1.Active:=false;
    Princ.ADOConnection1.Connected:=false;
    Princ.ADOConnection1.Connected:=true;
//    Princ.ADODataSet1.CommandText:=hojas.Text;
//    Princ.ADODataSet1.Active:=true;
    Princ.ADOTable1.TableName:=Hojas.Text;
    Princ.ADOTable1.Active:=true;

    Princ.MostrarVentanaExcel;
end;

procedure TActualizarProductos.DBGrid5DblClick(Sender: TObject);
begin
    if ZQProductosAactualizar.Active then
      begin
          if ZQProductosAactualizar.RecordCount>0 then
            begin
                Princ.AbrirModificarProducto(ZQProductosAactualizar.FieldByName('producto_id').AsString);
            end;
      end;
end;

procedure TActualizarProductos.bnteliminarproductosClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea eliminar estos productos?'+#13+#10+'Se pedira una segunda confirmacion.', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          if (MessageDlg('Esta por ELIMIAR estos productos.'+#13+#10+'Se recomienda realizar una copia de respaldo de la base de datos.'+#13+#10+'Desea continuar?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
            begin
                ZQProductosAactualizar.First;
                while not ZQProductosAactualizar.Eof do
                    begin
                        Princ.ZQExcecSQL.Sql.Clear;
                        Princ.ZQExcecSQL.Sql.Add('BEGIN ');
                        Princ.ZQExcecSQL.ExecSql;

                        Princ.ZQExcecSQL.Sql.Clear;
                        Princ.ZQExcecSQL.Sql.Add('delete from productodeposito ');
                        Princ.ZQExcecSQL.Sql.Add('where producto_id=:producto_id ');
                        Princ.ZQExcecSQL.ParamByName('producto_id').AsString:=ZQProductosAactualizar.FieldByName('producto_id').AsString;
                        Princ.ZQExcecSQL.ExecSql;

                        Princ.ZQExcecSQL.Sql.Clear;
                        Princ.ZQExcecSQL.Sql.Add('delete from documentoventadetalles ');
                        Princ.ZQExcecSQL.Sql.Add('where producto_id=:producto_id ');
                        Princ.ZQExcecSQL.ParamByName('producto_id').AsString:=ZQProductosAactualizar.FieldByName('producto_id').AsString;
                        Princ.ZQExcecSQL.ExecSql;

                        Princ.ZQExcecSQL.Sql.Clear;
                        Princ.ZQExcecSQL.Sql.Add('delete from documentocompradetalles ');
                        Princ.ZQExcecSQL.Sql.Add('where producto_id=:producto_id ');
                        Princ.ZQExcecSQL.ParamByName('producto_id').AsString:=ZQProductosAactualizar.FieldByName('producto_id').AsString;
                        Princ.ZQExcecSQL.ExecSql;

                        Princ.ZQExcecSQL.Sql.Clear;
                        Princ.ZQExcecSQL.Sql.Add('delete from productos ');
                        Princ.ZQExcecSQL.Sql.Add('where producto_id=:producto_id ');
                        Princ.ZQExcecSQL.ParamByName('producto_id').AsString:=ZQProductosAactualizar.FieldByName('producto_id').AsString;
                        Princ.ZQExcecSQL.ExecSql;

                        Princ.ZQExcecSQL.Sql.Clear;
                        Princ.ZQExcecSQL.Sql.Add('COMMIT ');
                        Princ.ZQExcecSQL.ExecSql;


                        ZQProductosAactualizar.Next;
                    end;

                MessageDlg('Productos eliminados.', mtInformation, [mbOK], 0);  

            end;



      end;
end;

procedure TActualizarProductos.btnabrirarchivoClick(Sender: TObject);
var
  producto_codigobuscado:string;
begin
    if princ.ADOConnection1.Connected then
      begin
          Princ.ADODataSet1.CommandText:=hojas.Text;
          Princ.ADODataSet1.Active:=true;

          princ.ProgressMax:=Self.fila_fin.IntValue;

          Princ.ADODataSet1.RecNo:=fila_inicio.IntValue-1;
          MQNuevos.Active:=false;
          MQNuevos.Active:=true;

          MQIncrementar.Active:=false;
          MQIncrementar.Active:=true;

          MQDisminuir.Active:=false;
          MQDisminuir.Active:=true;

          MQSincambios.Active:=false;
          MQSincambios.Active:=true;

          ZQproductos.SQL.Text:='select * from productos where '+campo_codigo+'=:id';

//          Princ.MostrarProgreso;
          while (Princ.ADODataSet1.RecNo<=fila_fin.IntValue-1) and (not Princ.ADODataSet1.Eof) do
              begin
                  if Princ.ADODataSet1.Fields[columna_codigo.ItemIndex].AsString<>'' then
                    begin
                        Princ.ProgressPos:=Princ.ADODataSet1.RecNo;
                        ZQproductos.Active:=false;
                        ZQproductos.ParamByName('id').AsString:=prefijo.Text + Princ.ADODataSet1.Fields[columna_codigo.ItemIndex].AsString + sufijo.Text;
                        ZQproductos.Active:=true;

                        if ZQproductos.RecordCount<1 then
                          begin   //PRODUCTO NUEVO
                              MQNuevos.Insert;
                              MQNuevos.FieldByName('producto_id').AsString:='0';
                              MQNuevos.FieldByName('producto_codigo').AsString:='0';
                              MQNuevos.FieldByName('producto_codigobarras').AsString:='0';
                              MQNuevos.FieldByName(campo_codigo).AsString:=trim(prefijo.Text + Princ.ADODataSet1.Fields[columna_codigo.ItemIndex].AsString + sufijo.Text);
                              MQNuevos.FieldByName('producto_nombre').AsString:=Princ.ADODataSet1.Fields[columna_descripcion.ItemIndex].AsString;
                              MQNuevos.FieldByName('producto_preciocosto').AsString:=Princ.ADODataSet1.Fields[columna_preciocompra.ItemIndex].AsString;
                              MQNuevos.FieldByName('calculoprecio_id').AsString:=xls_calculoprecio_id.codigo;
                              MQNuevos.FieldByName('politicaprecio_id').AsString:=xls_politicaprecio_id.codigo;
                              MQNuevos.FieldByName('tipoiva_id').AsString:=xls_tipoiva_id.codigo;
                              MQNuevos.FieldByName('rubro_id').AsString:=xls_rubro_id.codigo;
                              MQNuevos.FieldByName('proveedor_id').AsString:=xls_proveedor_id.codigo;
                              MQNuevos.FieldByName('producto_estado').AsString:='DISPONIBLE';
                              MQNuevos.FieldByName('producto_observaciones').AsString:='Importado desde Excel';
                              MQNuevos.FieldByName('producto_codigoreferencia').AsString:='';
                              if columna_codigoreferencia.ItemIndex>-1 then
                                MQNuevos.FieldByName('producto_codigoreferencia').AsString:=Princ.ADODataSet1.Fields[columna_codigoreferencia.ItemIndex].AsString;

                              MQNuevos.FieldByName('producdepo_stockactual').AsString:='0';
                              if columna_stockactual.ItemIndex>-1 then
                                MQNuevos.FieldByName('producdepo_stockactual').AsString:=Princ.ADODataSet1.Fields[columna_stockactual.ItemIndex].AsString;

                              MQNuevos.Post;
                          end
                        else
                          begin   //PRODUCTO A ACTUALIZAR
                              if roundto(ZQproductos.FieldByName('producto_preciocosto').AsFloat,-2)<roundto(Princ.ADODataSet1.Fields[columna_preciocompra.ItemIndex].AsFloat,-2) then
                                begin
                                    MQIncrementar.Insert;
                                    MQIncrementar.FieldByName('producto_id').AsString:=ZQproductos.FieldByName('producto_id').AsString;
                                    MQIncrementar.FieldByName('producto_codigo').AsString:=ZQproductos.FieldByName('producto_codigo').AsString;
                                    MQIncrementar.FieldByName('producto_codigobarras').AsString:=ZQproductos.FieldByName('producto_codigobarras').AsString;
                                    MQIncrementar.FieldByName('producto_nombre').AsString:=ZQproductos.FieldByName('producto_nombre').AsString;
                                    MQIncrementar.FieldByName('producto_preciocostoprev').AsString:=ZQproductos.FieldByName('producto_preciocosto').AsString;
                                    MQIncrementar.FieldByName('producto_preciocosto').AsFloat:=roundto(Princ.ADODataSet1.Fields[columna_preciocompra.ItemIndex].AsFloat,-2);
                                    MQIncrementar.FieldByName('calculoprecio_id').AsString:=ZQproductos.FieldByName('calculoprecio_id').AsString;
                                    MQIncrementar.FieldByName('politicaprecio_id').AsString:=ZQproductos.FieldByName('politicaprecio_id').AsString;
                                    MQIncrementar.FieldByName('tipoiva_id').AsString:=ZQproductos.FieldByName('tipoiva_id').AsString;
                                    MQIncrementar.FieldByName('rubro_id').AsString:=ZQproductos.FieldByName('rubro_id').AsString;
                                    MQIncrementar.FieldByName('proveedor_id').AsString:=ZQproductos.FieldByName('proveedor_id').AsString;
                                    MQIncrementar.FieldByName('diferencia').AsFloat:=MQIncrementar.FieldByName('producto_preciocostoprev').AsFloat-MQIncrementar.FieldByName('producto_preciocosto').AsFloat;
                                    MQIncrementar.FieldByName('producto_codigoreferencia').AsString:='';
                                    if columna_codigoreferencia.ItemIndex>-1 then
                                      MQIncrementar.FieldByName('producto_codigoreferencia').AsString:=Princ.ADODataSet1.Fields[columna_codigoreferencia.ItemIndex].AsString;
                                    MQIncrementar.Post;
                                end
                              else
                                begin
                                    if roundto(ZQproductos.FieldByName('producto_preciocosto').AsFloat,-2)=roundto(Princ.ADODataSet1.Fields[columna_preciocompra.ItemIndex].AsFloat,-2) then
                                      begin
                                          MQSincambios.Insert;
                                          MQSincambios.FieldByName('producto_id').AsString:=ZQproductos.FieldByName('producto_id').AsString;
                                          MQSincambios.FieldByName('producto_nombre').AsString:=ZQproductos.FieldByName('producto_nombre').AsString;
                                          MQSincambios.FieldByName('producto_codigo').AsString:=ZQproductos.FieldByName('producto_codigo').AsString;
                                          MQSincambios.FieldByName('producto_codigobarras').AsString:=ZQproductos.FieldByName('producto_codigobarras').AsString;
                                          MQSincambios.FieldByName('producto_preciocosto').AsString:=ZQproductos.FieldByName('producto_preciocosto').AsString;
                                          MQSincambios.FieldByName('producto_precioventabase').AsString:=ZQproductos.FieldByName('producto_precioventabase').AsString;
                                          MQSincambios.FieldByName('producto_precioventa1').AsString:=ZQproductos.FieldByName('producto_precioventa1').AsString;
                                          MQSincambios.FieldByName('producto_precioventa2').AsString:=ZQproductos.FieldByName('producto_precioventa2').AsString;
                                          MQSincambios.FieldByName('producto_precioventa3').AsString:=ZQproductos.FieldByName('producto_precioventa3').AsString;
                                          MQSincambios.FieldByName('producto_precioventa4').AsString:=ZQproductos.FieldByName('producto_precioventa4').AsString;
                                          MQSincambios.FieldByName('calculoprecio_id').AsString:=ZQproductos.FieldByName('calculoprecio_id').AsString;
                                          MQSincambios.FieldByName('politicaprecio_id').AsString:=ZQproductos.FieldByName('politicaprecio_id').AsString;
                                          MQSincambios.FieldByName('tipoiva_id').AsString:=ZQproductos.FieldByName('tipoiva_id').AsString;
                                          MQSincambios.FieldByName('rubro_id').AsString:=ZQproductos.FieldByName('rubro_id').AsString;
                                          MQSincambios.FieldByName('proveedor_id').AsString:=ZQproductos.FieldByName('proveedor_id').AsString;
                                          MQSincambios.FieldByName('producto_neto1').AsString:=ZQproductos.FieldByName('producto_neto1').AsString;
                                          MQSincambios.FieldByName('producto_neto2').AsString:=ZQproductos.FieldByName('producto_neto2').AsString;
                                          MQSincambios.FieldByName('producto_neto3').AsString:=ZQproductos.FieldByName('producto_neto3').AsString;
                                          MQSincambios.FieldByName('producto_neto4').AsString:=ZQproductos.FieldByName('producto_neto4').AsString;
                                          MQSincambios.FieldByName('producto_codigoreferencia').AsString:='';
                                          if columna_codigoreferencia.ItemIndex>-1 then
                                            MQSincambios.FieldByName('producto_codigoreferencia').AsString:=Princ.ADODataSet1.Fields[columna_codigoreferencia.ItemIndex].AsString;
                                          MQSincambios.Post;
                                      end
                                    else
                                      begin
                                          MQDisminuir.Insert;
                                          MQDisminuir.FieldByName('producto_id').AsString:=ZQproductos.FieldByName('producto_id').AsString;
                                          MQDisminuir.FieldByName('producto_codigo').AsString:=ZQproductos.FieldByName('producto_codigo').AsString;
                                          MQDisminuir.FieldByName('producto_codigobarras').AsString:=ZQproductos.FieldByName('producto_codigobarras').AsString;
                                          MQDisminuir.FieldByName('producto_nombre').AsString:=ZQproductos.FieldByName('producto_nombre').AsString;
                                          MQDisminuir.FieldByName('producto_preciocostoprev').AsString:=ZQproductos.FieldByName('producto_preciocosto').AsString;
                                          MQDisminuir.FieldByName('producto_preciocosto').AsFloat:=roundto(Princ.ADODataSet1.Fields[columna_preciocompra.ItemIndex].AsFloat,-2);
                                          MQDisminuir.FieldByName('calculoprecio_id').AsString:=ZQproductos.FieldByName('calculoprecio_id').AsString;
                                          MQDisminuir.FieldByName('politicaprecio_id').AsString:=ZQproductos.FieldByName('politicaprecio_id').AsString;
                                          MQDisminuir.FieldByName('tipoiva_id').AsString:=ZQproductos.FieldByName('tipoiva_id').AsString;
                                          MQDisminuir.FieldByName('rubro_id').AsString:=ZQproductos.FieldByName('rubro_id').AsString;
                                          MQDisminuir.FieldByName('proveedor_id').AsString:=ZQproductos.FieldByName('proveedor_id').AsString;
                                          MQDisminuir.FieldByName('diferencia').AsFloat:=MQDisminuir.FieldByName('producto_preciocostoprev').AsFloat-MQDisminuir.FieldByName('producto_preciocosto').AsFloat;
                                          MQDisminuir.FieldByName('producto_codigoreferencia').AsString:='';
                                          if columna_codigoreferencia.ItemIndex>-1 then
                                            MQDisminuir.FieldByName('producto_codigoreferencia').AsString:=Princ.ADODataSet1.Fields[columna_codigoreferencia.ItemIndex].AsString;
                                          MQDisminuir.Post;
                                      end;
                                end;
                          end;
                    end;

                  Princ.ADODataSet1.Next;
              end;

          Princ.CalcularPreciosProducto(MQNuevos);
          Princ.CalcularPreciosProducto(MQIncrementar);
          Princ.CalcularPreciosProducto(MQDisminuir);

          lblcantidadnuevos.Caption:=inttostr(MQNuevos.RecordCount)+' Registros';
          lblcantidadincrementar.Caption:=inttostr(MQIncrementar.RecordCount)+' Registros';
          lblcantidadisminuir.Caption:=inttostr(MQDisminuir.RecordCount)+' Registros';
          lblcantidadsincambios.Caption:=inttostr(MQSincambios.RecordCount)+' Registros';

          btnagregarnuevos.Enabled:=true;
          btnincrementarprecios.Enabled:=true;
          btndisminuirprecios.Enabled:=true;
      end;
end;

procedure TActualizarProductos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if destino<>'' then
      begin
          Princ.ADODataSet1.Active:=false;
          Princ.ADOConnection1.Connected:=false;

          Deletefile(destino);

      end;
end;

procedure TActualizarProductos.FormCreate(Sender: TObject);
begin
    fil_rubro_id.llenarcombo;
    fil_rubro_id.Buscar('-1');

    fil_calculoprecio_id.llenarcombo;
    fil_calculoprecio_id.Buscar('-1');

    fil_politicaprecio_id.llenarcombo;
    fil_politicaprecio_id.Buscar('-1');

    fil_tipoiva_id.llenarcombo;
    fil_tipoiva_id.Buscar('-1');

    fil_proveedor_id.llenarcombo;
    fil_proveedor_id.Buscar('-1');


    xls_rubro_id.llenarcombo;
    xls_rubro_id.Buscar('-1');

    xls_calculoprecio_id.llenarcombo;
    xls_calculoprecio_id.Buscar('-1');

    xls_politicaprecio_id.llenarcombo;
    xls_politicaprecio_id.Buscar('-1');

    xls_tipoiva_id.llenarcombo;
    xls_tipoiva_id.Buscar('-1');

    xls_proveedor_id.llenarcombo;
    xls_proveedor_id.Buscar('-1');

    destino:='';

    nuevo_calculoprecio_id.llenarcombo;
    nuevo_politicaprecio_id.llenarcombo;
    nuevo_rubro_id.llenarcombo;
end;

procedure TActualizarProductos.tipo_codigoSelect(Sender: TObject);
begin
    case tipo_codigo.ItemIndex of
        0:begin
              campo_codigo:='producto_id';
          end;

        1:begin
              campo_codigo:='producto_codigo';
          end;

        2:begin
              campo_codigo:='producto_codigobarras';
          end;
    end;

    ZQproductos.SQL.Text:='select * from productos where '+campo_codigo+'=:codigo';
end;

end.
