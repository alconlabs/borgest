unit Unitlistaproductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tlistaproductos = class(TForm)
    panelgrilla: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    btnelimi: TButton;
    btnmodi: TButton;
    btncrear: TButton;
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
    fil_proveedor_nombre: TEdit;
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
    ZQGrillaproducto_codigoreferencia: TStringField;
    ZQGrillaproducto_imprimir: TIntegerField;
    ZQGrillarubro_id_1: TIntegerField;
    ZQGrillarubro_nombre: TStringField;
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
    procedure btncrearClick(Sender: TObject);
    procedure btnmodiClick(Sender: TObject);
    procedure btnelimiClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQGrillaBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure fil_producto_idKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    abm:integer;
    producto_tipo:string;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  listaproductos: Tlistaproductos;

implementation

uses UnitPrinc, UnitProductos;

{$R *.dfm}

procedure Tlistaproductos.eliminar;
begin
//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('delete from proveedores ');
//    ZQuery2.SQL.Add('where proveedor_id=:proveedor_id');
//    ZQuery2.ParamByName('proveedor_id').AsString:=ZQproveedores.FieldByName('proveedor_id').AsString;
//    ZQuery2.ExecSQL;
//
//
//    ZQproveedores.Active:=false;
//    ZQproveedores.Active:=true;
//
//    Panelabm.Visible:=false;


end;



procedure Tlistaproductos.fil_producto_idKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then
      Button5.Click;
end;

procedure Tlistaproductos.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistaproductos.FormShow(Sender: TObject);
var
  i:integer;
begin
    DBGrid1.Columns.Items[2].Visible:=false;
    fil_producto_preciocosto.Text:='';
    fil_producto_preciocosto.Visible:=false;
    
    for i:=0 to panelfiltros.ControlCount-1 do
      begin
          if panelfiltros.Controls[i] is TEdit then
            (panelfiltros.Controls[i] as TEdit).OnKeyPress:=fil_producto_idKeyPress;

      end;
end;

procedure Tlistaproductos.modificar;
begin

//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('update proveedores ');
//    ZQuery2.SQL.Add('set proveedor_nombre=:proveedor_nombre, ');
//    ZQuery2.SQL.Add('proveedor_domicilio=:proveedor_domicilio, ');
//    ZQuery2.SQL.Add('proveedor_telefono=:proveedor_telefono, ');
//    ZQuery2.SQL.Add('proveedor_cuit=:proveedor_cuit ');
//    ZQuery2.SQL.Add('where proveedor_id=:proveedor_id');
//    ZQuery2.ParamByName('proveedor_id').AsString:=proveedor_id.Text;
//    ZQuery2.ParamByName('proveedor_nombre').AsString:=proveedor_nombre.Text;
//    ZQuery2.ParamByName('proveedor_domicilio').AsString:=proveedor_domicilio.Text;
//    ZQuery2.ParamByName('proveedor_telefono').AsString:=proveedor_telefono.Text;
//    ZQuery2.ParamByName('proveedor_cuit').AsString:=proveedor_cuit.Text;
//    ZQuery2.ExecSQL;
//
//    Panelabm.Visible:=false;


end;


procedure Tlistaproductos.ZQGrillaBeforeOpen(DataSet: TDataSet);
begin
    DBGrid1.Columns.Items[0].FieldName:=Princ.CAMPO_ID_PRODUCTO;
//    DBGrid1.Columns.Items[0].FieldName
end;

procedure Tlistaproductos.agregar;
begin

//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('insert into proveedores ');
//    ZQuery2.SQL.Add('values (:proveedor_id, :proveedor_nombre, ');
//    ZQuery2.SQL.Add(':proveedor_domicilio, :proveedor_telefono, :proveedor_cuit)');
//    ZQuery2.ParamByName('proveedor_id').AsString:=princ.codigo('proveedores','proveedor_id');
//    ZQuery2.ParamByName('proveedor_nombre').AsString:=proveedor_nombre.Text;
//    ZQuery2.ParamByName('proveedor_domicilio').AsString:=proveedor_domicilio.Text;
//    ZQuery2.ParamByName('proveedor_telefono').AsString:=proveedor_telefono.Text;
//    ZQuery2.ParamByName('proveedor_cuit').AsString:=proveedor_cuit.Text;
//    ZQuery2.ExecSQL;
//
//    Panelabm.Visible:=false;


end;



function Tlistaproductos.control:boolean;
var
  error:integer;
begin
    error:=0;

//    if proveedor_nombre.Text='' then
//      error:=1;
//
//    case error of
//        1:begin
//              MessageDlg('Ingrese el nombre del proveedor', mtError, [mbOK], 0);
//          end;
//
//
//
//
//    end;
//
    if error=0 then
      result:=true
    else
      result:=false;

end;

procedure Tlistaproductos.btnelimiClick(Sender: TObject);
begin
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

procedure Tlistaproductos.btnmodiClick(Sender: TObject);
begin
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

procedure Tlistaproductos.btncrearClick(Sender: TObject);
begin
    try
      productos:=Tproductos.Create(self);
    finally
      productos.abm:=1;
      productos.btnguardar.Caption:='Guardar';
      productos.Show;
    end;

end;

procedure Tlistaproductos.Button5Click(Sender: TObject);
begin
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from productos inner join rubros on productos.rubro_id=rubros.rubro_id inner join proveedores on productos.proveedor_id=proveedores.proveedor_id where 1=1 and producto_tipo="PRODUCTO"';
    if fil_producto_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and '+Princ.CAMPO_ID_PRODUCTO+' like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_id.Text,' ','%')+'%"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%')+'%"';

    if fil_producto_preciocosto.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_preciocosto like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_preciocosto.Text,' ','%')+'%"';

    if fil_producto_precioventa1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_precioventa1 like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_precioventa1.Text,' ','%')+'%"';

    if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_rubro_nombre.Text,' ','%')+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_proveedor_nombre.Text,' ','%')+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by producto_nombre';

    ZQGrilla.Active:=true;
end;

end.
