unit UnitListaProductos1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaProductos1 = class(Tlistabase)
    fil_producto_nombre: TGTBEdit;
    fil_producto_preciocosto: TGTBEdit;
    fil_producto_precioventa1: TGTBEdit;
    fil_rubro_nombre: TGTBEdit;
    fil_proveedor_nombre: TGTBEdit;
    fil_producto_precioventa2: TGTBEdit;
    fil_producto_precioventa3: TGTBEdit;
    fil_producto_precioventa4: TGTBEdit;
    fil_producdepo_stockactual: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnverClick(Sender: TObject);
  private
    { Private declarations }
    producto_tipo:string;
  public
    { Public declarations }
  end;

var
  ListaProductos1: TListaProductos1;

implementation

uses UnitPrinc, UnitProductos;

{$R *.dfm}

procedure TListaProductos1.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                productos:=Tproductos.Create(self);
              finally
                productos.abm:=3;
                productos.id:=ZQGrilla.FieldByName('producto_id').AsString;
                productos.btnguardar.Caption:='Eliminar';
                productos.Show;
              end;

         end;


      end;
end;

procedure TListaProductos1.btnfiltrarClick(Sender: TObject);
begin
  inherited;

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from productos '+
                       'inner join rubros on productos.rubro_id=rubros.rubro_id '+
                       'inner join proveedores on productos.proveedor_id=proveedores.proveedor_id '+
                       'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                       'where 1=1 and producto_tipo="PRODUCTO" and productodeposito.deposito_id="'+Princ.dep_id+'" ';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+Princ.CAMPO_ID_PRODUCTO+' like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_id.Text,' ','%',false,0)+'%"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%',false,0)+'%"';

    if fil_producto_preciocosto.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_preciocosto like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_producto_preciocosto.Text,' ','%',false,0)+'%"';

    if fil_producto_precioventa1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa1 like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_producto_precioventa1.Text,' ','%',false,0)+'%"';

    if fil_producto_precioventa2.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa2 like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_producto_precioventa2.Text,' ','%',false,0)+'%"';

    if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_rubro_nombre.Text,' ','%',false,0)+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_proveedor_nombre.Text,' ','%',false,0)+'%"';

    if Princ.GetConfiguracion('MOSTRARPRODUCTOSOCULTOS')<>'-1' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'and producto_estado="DISPONIBLE" ';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by producto_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaProductos1.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  productos:=Tproductos.Create(self);
                finally
                  productos.abm:=2;
                  productos.id:=ZQGrilla.FieldByName('producto_id').AsString;
                  productos.btnguardar.Caption:='Modificar';
                  productos.Show;
                end;
            end;
      end;
end;

procedure TListaProductos1.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      productos:=Tproductos.Create(self);
    finally
      productos.abm:=1;
      productos.btnguardar.Caption:='Guardar';
      productos.Show;
    end;
end;

procedure TListaProductos1.btnverClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  productos:=Tproductos.Create(self);
                finally
                  productos.abm:=ABM_VER;
                  productos.id:=ZQGrilla.FieldByName('producto_id').AsString;
                  productos.btnguardar.Caption:='Modificar';
                  productos.Show;
                end;
            end;
      end;
end;

procedure TListaProductos1.FormCreate(Sender: TObject);
begin
  inherited;
    DBGrid1.Columns.Items[0].FieldName:=Princ.CAMPO_ID_PRODUCTO;

end;

procedure TListaProductos1.FormShow(Sender: TObject);
begin
  inherited;
    DBGrid1.Columns.Items[2].Visible:=false;
    fil_producto_preciocosto.Text:='';
    fil_producto_preciocosto.Visible:=false;
end;

end.
