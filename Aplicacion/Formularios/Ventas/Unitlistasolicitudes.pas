unit Unitlistasolicitudes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tlistasolicitudes = class(TForm)
    panelgrilla: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ZQGrilla: TZQuery;
    DSCProveedores: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    fil_cliente_nombre: TEdit;
    fil_solic_fecha: TEdit;
    fil_solic_numero: TEdit;
    fil_solic_cuotas: TEdit;
    ZQuery2: TZQuery;
    fil_solic_importecuota: TEdit;
    fil_solic_total: TEdit;
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
  listasolicitudes: Tlistasolicitudes;

implementation

uses UnitPrinc, Unitsolicitudes;

{$R *.dfm}

procedure Tlistasolicitudes.eliminar;
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



procedure Tlistasolicitudes.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistasolicitudes.modificar;
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


procedure Tlistasolicitudes.agregar;
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



function Tlistasolicitudes.control:boolean;
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

procedure Tlistasolicitudes.Button2Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          try
            solicitudes:=Tsolicitudes.Create(self);
          finally
            solicitudes.abm:=3;
            solicitudes.id:=ZQGrilla.FieldByName('solic_id').AsString;
            solicitudes.btnguardar.caption:='Eliminar';
            solicitudes.Show;
          end;

      end;

end;

procedure Tlistasolicitudes.Button3Click(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          try
            solicitudes:=Tsolicitudes.Create(self);
          finally
            solicitudes.abm:=2;
            solicitudes.id:=ZQGrilla.FieldByName('solic_id').AsString;
            solicitudes.btnguardar.Caption:='Modificar';
            solicitudes.Show;
          end;

      end;

end;

procedure Tlistasolicitudes.Button4Click(Sender: TObject);
begin
    try
      solicitudes:=Tsolicitudes.Create(self);
    finally
      solicitudes.abm:=1;
      solicitudes.btnguardar.Caption:='Guardar';
      solicitudes.Show;
    end;

end;

procedure Tlistasolicitudes.Button5Click(Sender: TObject);
begin

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from solicitudes inner join clientes on solicitudes.cliente_id=clientes.cliente_id where 1=1';
    if fil_solic_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and solic_fecha like "%'+fil_solic_fecha.Text+'"';

    if fil_solic_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and solic_numero like "%'+fil_solic_numero.Text+'%"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientes.cliente_nombre like "%'+fil_cliente_nombre.Text+'%"';

    if fil_solic_cuotas.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and solic_cuotas like "%'+fil_solic_cuotas.Text+'%"';

    if fil_solic_importecuota.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and solic_importecuota like "%'+fil_solic_importecuota.Text+'%"';

    if fil_solic_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and solic_total like "%'+fil_solic_total.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by solic_fecha, solic_id';

    ZQGrilla.Active:=true;
end;

end.
