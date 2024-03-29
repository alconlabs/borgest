unit Unitbusquedaproductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid, GBTEdit;

type
  Tbusquedaproductos = class(TForm)
    panelgrilla: TAdvPanel;
    DBGrid1: TDBGrid;
    ZQGrilla: TZQuery;
    DSCProveedores: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    ZQuery2: TZQuery;
    CustomizeGrid1: TCustomizeGrid;
    ZQGrillaproducto_id: TIntegerField;
    ZQGrillaproducto_nombre: TStringField;
    ZQGrillaproducto_observaciones: TStringField;
    ZQGrillaproducto_codigo: TStringField;
    ZQGrillaproducto_codigobarras: TStringField;
    ZQGrillaproducto_preciocosto: TFloatField;
    ZQGrillaproducto_precioventabase: TFloatField;
    ZQGrillaproducto_estado: TStringField;
    ZQGrillaproducto_precioventa1: TFloatField;
    ZQGrillatipoiva_id: TIntegerField;
    ZQGrillarubro_id: TIntegerField;
    ZQGrillaproducto_precioventa2: TFloatField;
    ZQGrillaproducto_precioventa3: TFloatField;
    ZQGrillaproducto_precioventa4: TFloatField;
    ZQGrillacalculoprecio_id: TIntegerField;
    ZQGrillapoliticaprecio_id: TIntegerField;
    ZQGrillaproducto_neto1: TFloatField;
    ZQGrillaproducto_neto2: TFloatField;
    ZQGrillaproducto_neto3: TFloatField;
    ZQGrillaproducto_neto4: TFloatField;
    ZQGrillaproveedor_id: TIntegerField;
    ZQGrillaproducto_fechaactualizacionprecio: TDateField;
    ZQGrillarubro_id_1: TIntegerField;
    ZQGrillarubro_nombre: TStringField;
    panelbusqueda: TAdvPanel;
    btnbuscar: TButton;
    campo: TComboBox;
    buscar: TEdit;
    tipo_busqueda: TComboBox;
    btnaceptar: TButton;
    AdvPanel1: TAdvPanel;
    btncancelar: TButton;
    ZQGrillaproducto_codigoreferencia: TStringField;
    ZQGrillaproducto_imprimir: TIntegerField;
    ZQGrillaproveedor_id_1: TIntegerField;
    ZQGrillaproveedor_nombre: TStringField;
    ZQGrillaproveedor_domicilio: TStringField;
    ZQGrillaproveedor_documentonro: TStringField;
    ZQGrillaproveedor_documentotipo: TStringField;
    ZQGrillaproveedor_telefono: TStringField;
    ZQGrillaproveedor_celular: TStringField;
    ZQGrillaproveedor_mail: TStringField;
    ZQGrillacondicioniva_id: TIntegerField;
    ZQGrillaproveedor_condicionventa: TStringField;
    ZQGrillaproveedor_tipo: TStringField;
    ZQGrillalocalidad_id: TIntegerField;
    ZQGrillaproducdepo_id: TIntegerField;
    ZQGrillaproducdepo_stockactual: TFloatField;
    ZQGrillaproducto_id_1: TIntegerField;
    ZQGrilladeposito_id: TIntegerField;
    ZQGrillaproducdepo_stockminimo: TFloatField;
    ZQGrillaproducdepo_puntorepos: TFloatField;
    fil_producto_precioventa1: TGTBEdit;
    fil_producto_id: TGTBEdit;
    fil_producto_nombre: TGTBEdit;
    fil_rubro_nombre: TGTBEdit;
    fil_producto_preciocosto: TGTBEdit;
    fil_producto_codigo: TGTBEdit;
    fil_producdepo_stockactual: TGTBEdit;
    fil_proveedor_nombre: TGTBEdit;
    fil_producto_precioventa2: TGTBEdit;
    fil_producto_fechaactualizacionprecio: TGTBEdit;
    Panel1: TPanel;
    ZQGrillaproducto_tipo: TStringField;
    ZQGrillamarca_id: TIntegerField;
    ZQGrillaseccion_id: TIntegerField;
    ZQGrillaproducto_talle: TStringField;
    ZQGrillaproducto_estadosinc: TStringField;
    ZQGrillaproducto_longitudcodigo: TIntegerField;
    ZQGrillaproducdepo_stockinicial: TFloatField;
    ZQGrillaproducdepo_estadosinc: TStringField;
    ZQGrillaproducdepo_id_1: TIntegerField;
    ZQGrillaproducdepo_stockactual_1: TFloatField;
    ZQGrillaproducto_id_2: TIntegerField;
    ZQGrilladeposito_id_1: TIntegerField;
    ZQGrillaproducdepo_stockminimo_1: TFloatField;
    ZQGrillaproducdepo_puntorepos_1: TFloatField;
    ZQGrillaproducdepo_stockinicial_1: TFloatField;
    ZQGrillaproducdepo_estadosinc_1: TStringField;
    procedure Button5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure buscarKeyPress(Sender: TObject; var Key: Char);
    procedure btnaceptarClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fil_producto_idKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    abm:integer;
  public
    { Public declarations }
    producto_id:string;
    producto_codigoreferencia:string;
    ConfCampoBusqueda1:string;
    producto_estado:string;
  end;

var
  busquedaproductos: Tbusquedaproductos;

implementation

uses UnitPrinc, UnitProductos;

{$R *.dfm}

procedure Tbusquedaproductos.buscarKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      begin
          btnbuscar.Click;
          if ZQGrilla.RecordCount>0 then
            DBGrid1.SetFocus
          else
            buscar.SetFocus;

      end;
end;

procedure Tbusquedaproductos.btnaceptarClick(Sender: TObject);
begin
    princ.ultima_busqueda_productos:=buscar.Text;
    producto_id:=ZQGrilla.FieldByName(ConfCampoBusqueda1).AsString;
    self.ModalResult:=mrOk;

end;

procedure Tbusquedaproductos.Button5Click(Sender: TObject);
var
  producto_campo:string;
begin
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from productos inner join rubros on productos.rubro_id=rubros.rubro_id '+
                       'inner join proveedores on productos.proveedor_id=proveedores.proveedor_id '+
                       'inner join productodeposito on productos.producto_id=productodeposito.producto_id and deposito_id="'+Princ.dep_id+'"'+
                       'left join productodeposito as deposito2 on productos.producto_id=deposito2.producto_id and deposito2.deposito_id="'+Princ.SEGUNDODEPOSITODEFECTO+'" '+
                       'where 1=1  and '+producto_estado+' and producto_tipo="PRODUCTO" ';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'and producto_codigoreferencia '+producto_codigoreferencia;

    case campo.ItemIndex of
        0:begin
              producto_campo:='productos.producto_id';

          end;
        1:begin
              producto_campo:='producto_codigo';

          end;
        2:begin
              producto_campo:='producto_codigobarras';

          end;
        3:begin
              producto_campo:='producto_nombre';
          end;
        4:begin
              producto_campo:='producto_codigoreferencia';
          end;


    end;

    if tipo_busqueda.ItemIndex=1 then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+producto_campo+' like "'+Princ.GTBUtilidades1.Reemplazar(buscar.Text,' ','%',false,0)+'%"'
    else
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+producto_campo+' like "%'+Princ.GTBUtilidades1.Reemplazar(buscar.Text,' ','%',false,0)+'%"';


    if fil_producto_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and productos.producto_id like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_id.Text,' ','%',false,0)+'"';

    if fil_producto_codigo.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_codigo like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_codigo.Text,' ','%',false,0)+'"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%',false,0)+'%"';

    if fil_producto_preciocosto.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_preciocosto like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_preciocosto.Text,' ','%',false,0)+'%"';

    if fil_producto_precioventa1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa1 like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_precioventa1.Text,' ','%',false,0)+'%"';

    if fil_producto_precioventa2.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa2 like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_precioventa2.Text,' ','%',false,0)+'%"';

    if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_rubro_nombre.Text,' ','%',false,0)+'%"';

    if fil_producdepo_stockactual.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producdepo_stockactual like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producdepo_stockactual.Text,' ','%',false,0)+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_proveedor_nombre.Text,' ','%',false,0)+'%"';

    if fil_producto_fechaactualizacionprecio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_fechaactualizacionprecio like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_fechaactualizacionprecio.Text,' ','%',false,0)+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by producto_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tbusquedaproductos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      begin
          if ZQGrilla.RecordCount>0 then
            btnaceptar.Click
          else
            buscar.SetFocus;


      end;
end;

procedure Tbusquedaproductos.DBGrid1TitleClick(Column: TColumn);
begin
    ZQGrilla.IndexFieldNames:=Column.FieldName;
end;

procedure Tbusquedaproductos.fil_producto_idKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then
      Button5.Click;
end;

procedure Tbusquedaproductos.FormCreate(Sender: TObject);
begin
    producto_codigoreferencia:='<>"-1"';
    ConfCampoBusqueda1:='producto_id';
    buscar.Text:=princ.ultima_busqueda_productos;
    producto_estado:=' (producto_estado="DISPONIBLE" or producto_estado="REVISAR") ';
end;

procedure Tbusquedaproductos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    if key=VK_F2 then
      begin
          if campo.ItemIndex=campo.Items.Count-1 then
            campo.ItemIndex:=0
          else
            campo.ItemIndex:=campo.ItemIndex+1;

          buscar.SetFocus;

      end;

    if key=VK_F3 then
      begin
          case tipo_busqueda.ItemIndex of
              0:begin
                    tipo_busqueda.ItemIndex:=1;

                end;
              1:begin
                    tipo_busqueda.ItemIndex:=0;

                end;

          end;

          buscar.SetFocus;

      end;
end;

procedure Tbusquedaproductos.FormShow(Sender: TObject);
var
  i: Integer;
  grid_col:integer;
begin
    tipo_busqueda.ItemIndex:=strtoint(Princ.GetConfiguracion('TIPOBUSQUEDA'))-1;

    Princ.ConfigurarColumnas(self.DBGrid1);

    DBGrid1.Columns.Items[3].Visible:=false;
    fil_producto_preciocosto.Text:='';
    fil_producto_preciocosto.Visible:=false;

    for i:=0 to panelfiltros.ControlCount-1 do
      begin
          if panelfiltros.Controls[i] is TEdit then
            (panelfiltros.Controls[i] as TEdit).OnKeyPress:=fil_producto_idKeyPress;

          if panelfiltros.Controls[i] is TGTBEdit then
            begin
                if (panelfiltros.Controls[i] as TGTBEdit).FieldName<>'' then
                  begin
                      for grid_col := 0 to DBGrid1.Columns.Count-1 do
                        begin
                            if DBGrid1.Columns.Items[grid_col].FieldName=(panelfiltros.Controls[i] as TGTBEdit).FieldName then
                              (panelfiltros.Controls[i] as TGTBEdit).Visible:=DBGrid1.Columns.Items[grid_col].Visible;

                        end;

                  end;
            end;



      end;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

end.
