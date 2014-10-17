unit UnitSeleccionarProductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, UnitSqlComboBox, ComCtrls, AdvListV,
  UnitSqlListView, Titles, GTBComboBox;

type
  TSeleccionarProductos = class(TABMInibase)
    productos: TSqlListView;
    tiProdcutos: TTitles;
    btnimprimir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ArmarLeyendaBarraEstado;
  public
    { Public declarations }
    primercaracter:string;
    tipo_busqueda:integer;
    producto_nombre:string;
    producto_codigobarras:string;
    seccion_id:string;
    marca_id:string;
    rubro_id:string;

  end;

var
  SeleccionarProductos: TSeleccionarProductos;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TSeleccionarProductos.btnguardarClick(Sender: TObject);
begin
  inherited;
    productos.LlenarMQuery;
    while not productos.FQChequeados.Eof do
        begin

            productos.FQChequeados.Next;
        end;


end;

procedure TSeleccionarProductos.btnimprimirClick(Sender: TObject);
begin
  inherited;
    self.ModalResult:=mrok;
end;

procedure TSeleccionarProductos.FormCreate(Sender: TObject);
begin
  inherited;
    liberar_al_cerrar:=false;
    tiProdcutos.Titulos.Clear;
    tiProdcutos.Titulos.Add('id');
    tiProdcutos.Titulos.Add('Codigo');
    tiProdcutos.Titulos.Add('Producto');
    tiProdcutos.Titulos.Add(Princ.NOMBREPRECIO1);

    tiProdcutos.Campos.Clear;
    tiProdcutos.Campos.Add('producto_codigo');
    tiProdcutos.Campos.Add(princ.CAMPO_ID_PRODUCTO);
    tiProdcutos.Campos.Add('producto_nombre');
    tiProdcutos.Campos.Add('producto_precioventa1');

    tipo_busqueda:=1;
    ArmarLeyendaBarraEstado;

end;

procedure TSeleccionarProductos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key=VK_F2 then
      begin
          if tipo_busqueda=1 then
            tipo_busqueda:=2
          else
            tipo_busqueda:=1;
      end;

    ArmarLeyendaBarraEstado;
end;


procedure TSeleccionarProductos.FormShow(Sender: TObject);
var
  sql:string;
begin
  inherited;
    tipo_busqueda:=strtoint(Princ.GetConfiguracion('TIPOBUSQUEDA'));
    ArmarLeyendaBarraEstado;

    sql:='select producto_id, '+Princ.CAMPO_ID_PRODUCTO+', producto_nombre, producto_precioventa1 '+
                       'from productos '+
                       'where producto_tipo="PRODUCTO"';

     if producto_nombre<>'' then
      sql:=sql+' and productos.producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(producto_nombre,' ','%',false,0)+'%" ';


    if producto_codigobarras<>'' then
      sql:=sql+' and productos.producto_codigobarras like "%'+producto_codigobarras+'%" ';

    if seccion_id<>'-1' then
      sql:=sql+'and seccion_id="'+seccion_id+'" ';

    if marca_id<>'-1' then
      sql:=sql+'and marca_id="'+marca_id+'" ';

    if rubro_id<>'-1' then
      sql:=sql+'and rubro_id="'+rubro_id+'" ';

    sql:=sql+'order by producto_nombre, producto_codigobarras ';

    tiProdcutos.Memo.Text:=sql;
    productos.Fill;

end;

procedure TSeleccionarProductos.ArmarLeyendaBarraEstado;
begin
    case tipo_busqueda of
        1:begin
              panelgrilla.StatusBar.Text:='Tipo de busqueda (F2): Contenga a...';
          end;

        2:begin
              panelgrilla.StatusBar.Text:='Tipo de busqueda (F2): Comience con.';
          end;
    end;


end;


end.
