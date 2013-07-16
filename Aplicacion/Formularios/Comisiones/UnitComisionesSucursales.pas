unit UnitComisionesSucursales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, BaseGrid, AdvGrid,
  DBAdvGrid, MQuery, ComCtrls;

type
  TComisionesSucursales = class(Tlistabase)
    DTSComisiones: TDataSource;
    ZQComisionesSucursales: TZQuery;
    fil_producto_nombre: TEdit;
    fil_producto_preciocosto: TEdit;
    fil_producto_precioventa1: TEdit;
    fil_rubro_nombre: TEdit;
    ZQSucursales: TZQuery;
    ZQComisionesSucursalessucursal_id: TIntegerField;
    ZQComisionesSucursalessucursal_nombre: TStringField;
    ZQComisionesSucursalessucursal_domicilio: TStringField;
    ZQComisionesSucursalessucursal_telefono: TStringField;
    ZQComisionesSucursalesempresa_id: TIntegerField;
    ZQComisionesSucursalessucursal_tipoliquidvendedor: TStringField;
    ZQComisionesSucursalessucursal_tipoliquidsucursal: TStringField;
    ZQComisionesSucursalescomisionsucursal_id: TIntegerField;
    ZQComisionesSucursalescomisionsucursal_tipo: TStringField;
    ZQComisionesSucursalescomisionsucursal_valor: TFloatField;
    ZQComisionesSucursalessucursal_id_1: TIntegerField;
    ZQComisionesSucursalesproducto_id: TIntegerField;
    ZQComisionesSucursalesproducto_id_1: TIntegerField;
    ZQComisionesSucursalesproducto_nombre: TStringField;
    ZQComisionesSucursalesproducto_observaciones: TStringField;
    ZQComisionesSucursalesproducto_codigo: TStringField;
    ZQComisionesSucursalesproducto_codigobarras: TStringField;
    ZQComisionesSucursalesproducto_preciocosto: TFloatField;
    ZQComisionesSucursalesproducto_precioventabase: TFloatField;
    ZQComisionesSucursalesproducto_estado: TStringField;
    ZQComisionesSucursalesproducto_precioventa1: TFloatField;
    ZQComisionesSucursalestipoiva_id: TIntegerField;
    ZQComisionesSucursalesrubro_id: TIntegerField;
    ZQComisionesSucursalesproducto_precioventa2: TFloatField;
    ZQComisionesSucursalesproducto_precioventa3: TFloatField;
    ZQComisionesSucursalesproducto_precioventa4: TFloatField;
    ZQComisionesSucursalescalculoprecio_id: TIntegerField;
    ZQComisionesSucursalespoliticaprecio_id: TIntegerField;
    ZQComisionesSucursalesproducto_neto1: TFloatField;
    ZQComisionesSucursalesproducto_neto2: TFloatField;
    ZQComisionesSucursalesproducto_neto3: TFloatField;
    ZQComisionesSucursalesproducto_neto4: TFloatField;
    ZQComisionesSucursalesproveedor_id: TIntegerField;
    ZQComisionesSucursalesproducto_fechaactualizacionprecio: TDateField;
    ZQComisionesSucursalesproducto_codigoreferencia: TStringField;
    ZQComisionesSucursalesproducto_imprimir: TIntegerField;
    DBAdvGrid1: TDBAdvGrid;
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure ZQComisionesSucursalesBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    function control:boolean;
    procedure modificar;
  public
    { Public declarations }
  end;

var
  ComisionesSucursales: TComisionesSucursales;

implementation

Uses UnitPrinc;

{$R *.dfm}


function TComisionesSucursales.control:boolean;
var
  error:integer;
begin
    error:=0;

    result:=error=0;

end;


procedure TComisionesSucursales.modificar;
begin
    ZQComisionesSucursales.First;
    while not ZQComisionesSucursales.Eof do
        begin
            if ZQComisionesSucursales.FieldByName('comisionsucursal_id').AsString='0' then
              begin
                  ZQuery2.Sql.Clear;
                  ZQuery2.Sql.Add('insert into comisionessucursal set ');
                  ZQuery2.Sql.Add('producto_id=:producto_id, ');
                  ZQuery2.Sql.Add('sucursal_id=:sucursal_id, ');
                  ZQuery2.Sql.Add('comisionsucursal_valor=:comisionsucursal_valor, ');
                  ZQuery2.Sql.Add('comisionsucursal_tipo=:comisionsucursal_tipo, ');
                  ZQuery2.Sql.Add('comisionsucursal_id=:comisionsucursal_id ');
                  ZQuery2.ParamByName('producto_id').AsString:=ZQGrilla.FieldByName('producto_id').AsString;
                  ZQuery2.ParamByName('sucursal_id').AsString:=ZQComisionesSucursales.FieldByName('sucursal_id').AsString;
                  ZQuery2.ParamByName('comisionsucursal_valor').AsString:=ZQComisionesSucursales.FieldByName('comisionsucursal_valor').AsString;
                  ZQuery2.ParamByName('comisionsucursal_tipo').AsString:=ZQComisionesSucursales.FieldByName('comisionsucursal_tipo').AsString;
                  ZQuery2.ParamByName('comisionsucursal_id').AsString:=Princ.codigo('comisionessucursal','comisionsucursal_id');
                  ZQuery2.ExecSql;


              end
            else
              begin
                  ZQuery2.Sql.Clear;
                  ZQuery2.Sql.Add('update comisionessucursal set ');
                  ZQuery2.Sql.Add('comisionsucursal_valor=:comisionsucursal_valor, ');
                  ZQuery2.Sql.Add('comisionsucursal_tipo=:comisionsucursal_tipo ');
                  ZQuery2.Sql.Add('where comisionsucursal_id=:comisionsucursal_id ');
                  ZQuery2.ParamByName('comisionsucursal_valor').AsString:=ZQComisionesSucursales.FieldByName('comisionsucursal_valor').AsString;
                  ZQuery2.ParamByName('comisionsucursal_tipo').AsString:=ZQComisionesSucursales.FieldByName('comisionsucursal_tipo').AsString;
                  ZQuery2.ParamByName('comisionsucursal_id').AsString:=ZQComisionesSucursales.FieldByName('comisionsucursal_id').AsString;
                  ZQuery2.ExecSql;


              end;

            ZQComisionesSucursales.Next;
        end;

    Panelabm.Visible:=false;


end;

procedure TComisionesSucursales.ZQComisionesSucursalesBeforePost(
  DataSet: TDataSet);
begin
  inherited;
    ZQComisionesSucursales.FieldByName('producto_id').AsString:=ZQGrilla.FieldByName('producto_id').AsString;
    if ZQComisionesSucursales.FieldByName('comisionsucursal_id').AsString='' then
      ZQComisionesSucursales.FieldByName('comisionsucursal_id').AsString:='0';
end;

procedure TComisionesSucursales.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from productos inner join rubros on productos.rubro_id=rubros.rubro_id where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+Princ.CAMPO_ID_PRODUCTO+' like "%'+fil_id.Text+'%"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "%'+fil_producto_nombre.Text+'%"';

    if fil_producto_preciocosto.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_preciocosto like "%'+fil_producto_preciocosto.Text+'%"';

    if fil_producto_precioventa1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa1 like "%'+fil_producto_precioventa1.Text+'%"';

    if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "%'+fil_rubro_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by producto_nombre';

    ZQGrilla.Active:=true;
end;

procedure TComisionesSucursales.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin  //agregar
              if control then
                begin
                    abm:=0;

                    Panelabm.Visible:=false;

                end;


          end;
        2:begin  //modificar
              if control then
                begin
                    modificar;
                    abm:=0;

                    Panelabm.Visible:=false;

                end;

          end;

    end;
end;

procedure TComisionesSucursales.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;

          ZQComisionesSucursales.Active:=false;
          ZQComisionesSucursales.ParamByName('producto_id').AsString:=ZQGrilla.FieldByName('producto_id').AsString;
          ZQComisionesSucursales.Active:=true;

          ZQSucursales.Active:=false;
          ZQSucursales.Active:=true;
          ZQSucursales.First;
          while not ZQSucursales.Eof do
              begin
                  if not ZQComisionesSucursales.Locate('sucursal_id',ZQSucursales.FieldByName('sucursal_id').AsString, []) then
                    begin
                        ZQComisionesSucursales.Insert;
                        ZQComisionesSucursales.FieldByName('sucursal_id').AsString:=ZQSucursales.FieldByName('sucursal_id').AsString;
                        ZQComisionesSucursales.FieldByName('sucursal_nombre').AsString:=ZQSucursales.FieldByName('sucursal_nombre').AsString;
                        ZQComisionesSucursales.Post;
                    end;

                  ZQSucursales.Next;
              end;

          Panelabm.Visible:=true;
      end;
end;

procedure TComisionesSucursales.FormCreate(Sender: TObject);
begin
  inherited;
    btnnuevo.Visible:=false;
    btneliminar.Visible:=false;
    btnanular.Visible:=false;
end;

end.
