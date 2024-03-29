unit Unitbusquedaproductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tbusquedaproductos = class(TForm)
    panelgrilla: TAdvPanel;
    DBGrid1: TDBGrid;
    ZQGrilla: TZQuery;
    DSCProveedores: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    fil_producto_precioventa1: TEdit;
    fil_producto_id: TEdit;
    fil_producto_nombre: TEdit;
    fil_rubro_nombre: TEdit;
    ZQuery2: TZQuery;
    fil_producto_preciocosto: TEdit;
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
    fil_producto_codigo: TEdit;
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
    fil_producdepo_stockactual: TEdit;
    fil_proveedor_nombre: TEdit;
    procedure Button5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure buscarKeyPress(Sender: TObject; var Key: Char);
    procedure btnaceptarClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    abm:integer;
  public
    { Public declarations }
    producto_id:string;
    producto_codigoreferencia:string;
    ConfCampoBusqueda1:string;
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
                       'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                       'where 1=1 ';

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


    end;

    if tipo_busqueda.ItemIndex=0 then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+producto_campo+' like "'+buscar.Text+'%"'
    else
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+producto_campo+' like "%'+buscar.Text+'%"';


    if fil_producto_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and productos.producto_id like "%'+fil_producto_id.Text+'"';

    if fil_producto_codigo.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_codigo like "%'+fil_producto_codigo.Text+'"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "%'+fil_producto_nombre.Text+'%"';

    if fil_producto_preciocosto.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_preciocosto like "%'+fil_producto_preciocosto.Text+'%"';

    if fil_producto_precioventa1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa1 like "%'+fil_producto_precioventa1.Text+'%"';

    if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "%'+fil_rubro_nombre.Text+'%"';

    if fil_producdepo_stockactual.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producdepo_stockactual like "%'+fil_producdepo_stockactual.Text+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_nombre like "%'+fil_proveedor_nombre.Text+'%"';

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

procedure Tbusquedaproductos.FormCreate(Sender: TObject);
begin
    producto_codigoreferencia:='<>"-1"';
    ConfCampoBusqueda1:='producto_id';
end;

procedure Tbusquedaproductos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
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
begin
    DBGrid1.Columns.Items[3].Visible:=false;
    fil_producto_preciocosto.Text:='';
    fil_producto_preciocosto.Visible:=false;
end;

end.
