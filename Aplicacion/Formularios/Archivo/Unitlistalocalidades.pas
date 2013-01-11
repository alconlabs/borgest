unit Unitlistalocalidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tlistalocalidades = class(TForm)
    panelgrilla: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ZQGrilla: TZQuery;
    DSC: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    fil_localidad_id: TEdit;
    fil_localidad_nombre: TEdit;
    ZQuery2: TZQuery;
    CustomizeGrid1: TCustomizeGrid;
    fil_provincia_nombre: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    abm:integer;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  listalocalidades: Tlistalocalidades;

implementation

uses UnitPrinc, Unitcalculoprecio;

{$R *.dfm}

procedure Tlistalocalidades.eliminar;
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



procedure Tlistalocalidades.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistalocalidades.modificar;
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


procedure Tlistalocalidades.agregar;
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



function Tlistalocalidades.control:boolean;
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

procedure Tlistalocalidades.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          try
            calculoprecio:=Tcalculoprecio.Create(self);
          finally
            calculoprecio.abm:=3;
            calculoprecio.id:=ZQGrilla.FieldByName('calculoprecio_id').AsString;
            calculoprecio.btnguardar.caption:='Eliminar';
            calculoprecio.Show;
          end;

      end;

end;

procedure Tlistalocalidades.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          try
            calculoprecio:=Tcalculoprecio.Create(self);
          finally
            calculoprecio.abm:=2;
            calculoprecio.id:=ZQGrilla.FieldByName('calculoprecio_id').AsString;
            calculoprecio.btnguardar.Caption:='Modificar';
            calculoprecio.Show;
          end;

      end;

end;

procedure Tlistalocalidades.Button4Click(Sender: TObject);
begin
    try
      calculoprecio:=Tcalculoprecio.Create(self);
    finally
      calculoprecio.abm:=1;
      calculoprecio.btnguardar.Caption:='Guardar';
      calculoprecio.Show;
    end;

end;

procedure Tlistalocalidades.Button5Click(Sender: TObject);
begin

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from localidades '+
                       'inner join provincias on localidades.provinca_id=provincias.provincia_id '+
                       'where 1=1';

    if fil_localidad_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_id like "%'+fil_localidad_id.Text+'"';

    if fil_localidad_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_nombre like "%'+fil_localidad_nombre.Text+'%"';

    if fil_provincia_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_nombre like "%'+fil_provincia_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by localidad_nombre';

    ZQGrilla.Active:=true;
end;

end.
