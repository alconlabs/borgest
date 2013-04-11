unit UnitComisionesVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, BaseGrid, AdvGrid,
  DBAdvGrid, MQuery;

type
  TComisionesVendedores = class(Tlistabase)
    DTSComisiones: TDataSource;
    ZQComisionesVendedores: TZQuery;
    DBAdvGrid1: TDBAdvGrid;
    fil_producto_nombre: TEdit;
    fil_producto_preciocosto: TEdit;
    fil_producto_precioventa1: TEdit;
    fil_rubro_nombre: TEdit;
    ZQComisionesVendedorespersonal_id: TIntegerField;
    ZQComisionesVendedorespersonal_nombre: TStringField;
    ZQComisionesVendedorespersonal_domicilio: TStringField;
    ZQComisionesVendedorespersonal_telefono: TStringField;
    ZQComisionesVendedorespersonal_celular: TStringField;
    ZQComisionesVendedorespersonal_mail: TStringField;
    ZQComisionesVendedorespersonal_usuario: TStringField;
    ZQComisionesVendedorespersonal_pass: TStringField;
    ZQComisionesVendedoresperfil_id: TIntegerField;
    ZQComisionesVendedorescomisionvendedor_id: TIntegerField;
    ZQComisionesVendedorescomisionvendedor_tipo: TStringField;
    ZQComisionesVendedorescomisionvendedor_valor: TFloatField;
    ZQComisionesVendedorespersonal_id_1: TIntegerField;
    ZQComisionesVendedoresproducto_id: TIntegerField;
    ZQComisionesVendedoresproducto_id_1: TIntegerField;
    ZQComisionesVendedoresproducto_nombre: TStringField;
    ZQComisionesVendedoresproducto_observaciones: TStringField;
    ZQComisionesVendedoresproducto_codigo: TStringField;
    ZQComisionesVendedoresproducto_codigobarras: TStringField;
    ZQComisionesVendedoresproducto_preciocosto: TFloatField;
    ZQComisionesVendedoresproducto_precioventabase: TFloatField;
    ZQComisionesVendedoresproducto_estado: TStringField;
    ZQComisionesVendedoresproducto_precioventa1: TFloatField;
    ZQComisionesVendedorestipoiva_id: TIntegerField;
    ZQComisionesVendedoresrubro_id: TIntegerField;
    ZQComisionesVendedoresproducto_precioventa2: TFloatField;
    ZQComisionesVendedoresproducto_precioventa3: TFloatField;
    ZQComisionesVendedoresproducto_precioventa4: TFloatField;
    ZQComisionesVendedorescalculoprecio_id: TIntegerField;
    ZQComisionesVendedorespoliticaprecio_id: TIntegerField;
    ZQComisionesVendedoresproducto_neto1: TFloatField;
    ZQComisionesVendedoresproducto_neto2: TFloatField;
    ZQComisionesVendedoresproducto_neto3: TFloatField;
    ZQComisionesVendedoresproducto_neto4: TFloatField;
    ZQComisionesVendedoresproveedor_id: TIntegerField;
    ZQComisionesVendedoresproducto_fechaactualizacionprecio: TDateField;
    ZQComisionesVendedoresproducto_codigoreferencia: TStringField;
    ZQComisionesVendedoresproducto_imprimir: TIntegerField;
    ZQPersonal: TZQuery;
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure ZQComisionesVendedoresBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    function control:boolean;
    procedure modificar;
  public
    { Public declarations }
  end;

var
  ComisionesVendedores: TComisionesVendedores;

implementation

Uses UnitPrinc;

{$R *.dfm}


function TComisionesVendedores.control:boolean;
var
  error:integer;
begin
    error:=0;

    result:=error=0;

end;


procedure TComisionesVendedores.modificar;
begin
    ZQComisionesVendedores.First;
    while not ZQComisionesVendedores.Eof do
        begin
            if ZQComisionesVendedores.FieldByName('comisionvendedor_id').AsString='0' then
              begin
                  ZQuery2.Sql.Clear;
                  ZQuery2.Sql.Add('insert into comisionesvendedor set ');
                  ZQuery2.Sql.Add('producto_id=:producto_id, ');
                  ZQuery2.Sql.Add('personal_id=:personal_id, ');
                  ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
                  ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo, ');
                  ZQuery2.Sql.Add('comisionvendedor_id=:comisionvendedor_id ');
                  ZQuery2.ParamByName('producto_id').AsString:=ZQGrilla.FieldByName('producto_id').AsString;
                  ZQuery2.ParamByName('personal_id').AsString:=ZQComisionesVendedores.FieldByName('personal_id').AsString;
                  ZQuery2.ParamByName('comisionvendedor_valor').AsString:=ZQComisionesVendedores.FieldByName('comisionvendedor_valor').AsString;
                  ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=ZQComisionesVendedores.FieldByName('comisionvendedor_tipo').AsString;
                  ZQuery2.ParamByName('comisionvendedor_id').AsString:=Princ.codigo('comisionesvendedor','comisionvendedor_id');
                  ZQuery2.ExecSql;


              end
            else
              begin
                  ZQuery2.Sql.Clear;
                  ZQuery2.Sql.Add('update comisionesvendedor set ');
                  ZQuery2.Sql.Add('comisionvendedor_valor=:comisionvendedor_valor, ');
                  ZQuery2.Sql.Add('comisionvendedor_tipo=:comisionvendedor_tipo ');
                  ZQuery2.Sql.Add('where comisionvendedor_id=:comisionvendedor_id ');
                  ZQuery2.ParamByName('comisionvendedor_valor').AsString:=ZQComisionesVendedores.FieldByName('comisionvendedor_valor').AsString;
                  ZQuery2.ParamByName('comisionvendedor_tipo').AsString:=ZQComisionesVendedores.FieldByName('comisionvendedor_tipo').AsString;
                  ZQuery2.ParamByName('comisionvendedor_id').AsString:=ZQComisionesVendedores.FieldByName('comisionvendedor_id').AsString;
                  ZQuery2.ExecSql;


              end;

            ZQComisionesVendedores.Next;
        end;

    Panelabm.Visible:=false;


end;

procedure TComisionesVendedores.ZQComisionesVendedoresBeforePost(
  DataSet: TDataSet);
begin
  inherited;
    ZQComisionesVendedores.FieldByName('producto_id').AsString:=ZQGrilla.FieldByName('producto_id').AsString;
    ZQComisionesVendedores.FieldByName('comisionvendedor_id').AsString:='0';
end;

procedure TComisionesVendedores.btnfiltrarClick(Sender: TObject);
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

procedure TComisionesVendedores.btnguardarClick(Sender: TObject);
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

procedure TComisionesVendedores.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;

          ZQComisionesVendedores.Active:=false;
          ZQComisionesVendedores.ParamByName('producto_id').AsString:=ZQGrilla.FieldByName('producto_id').AsString;
          ZQComisionesVendedores.Active:=true;

          ZQPersonal.Active:=false;
          ZQPersonal.Active:=true;
          ZQPersonal.First;
          while not ZQPersonal.Eof do
              begin
                  if not ZQComisionesVendedores.Locate('personal_id',ZQPersonal.FieldByName('personal_id').AsString, []) then
                    begin
                        ZQComisionesVendedores.Insert;
                        ZQComisionesVendedores.FieldByName('personal_id').AsString:=ZQPersonal.FieldByName('personal_id').AsString;
                        ZQComisionesVendedores.FieldByName('personal_nombre').AsString:=ZQPersonal.FieldByName('personal_nombre').AsString;
                        ZQComisionesVendedores.Post;
                    end;

                  ZQPersonal.Next;
              end;

          Panelabm.Visible:=true;
      end;
end;

procedure TComisionesVendedores.FormCreate(Sender: TObject);
begin
  inherited;
    btnnuevo.Visible:=false;
    btneliminar.Visible:=false;
    btnanular.Visible:=false;
end;

end.
