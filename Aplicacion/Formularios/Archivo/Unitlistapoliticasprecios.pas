unit Unitlistapoliticasprecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tlistapoliticasprecios = class(TForm)
    panelgrilla: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    btnelimi: TButton;
    btnmodi: TButton;
    btncrear: TButton;
    ZQGrilla: TZQuery;
    DSC: TDataSource;
    panelfiltros: TAdvPanel;
    Button5: TButton;
    fil_politicaprecio_politica2: TEdit;
    fil_politicaprecio_id: TEdit;
    fil_politicaprecio_nombre: TEdit;
    fil_politicaprecio_politica4: TEdit;
    ZQuery2: TZQuery;
    fil_politicaprecio_politica1: TEdit;
    fil_politicaprecio_politica3: TEdit;
    CustomizeGrid1: TCustomizeGrid;
    procedure btncrearClick(Sender: TObject);
    procedure btnmodiClick(Sender: TObject);
    procedure btnelimiClick(Sender: TObject);
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
  listapoliticasprecios: Tlistapoliticasprecios;

implementation

uses UnitPrinc, UnitPoliticasPrecios;

{$R *.dfm}

procedure Tlistapoliticasprecios.eliminar;
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



procedure Tlistapoliticasprecios.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistapoliticasprecios.modificar;
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


procedure Tlistapoliticasprecios.agregar;
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



function Tlistapoliticasprecios.control:boolean;
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

procedure Tlistapoliticasprecios.btnelimiClick(Sender: TObject);
begin
    if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                politicasprecios:=Tpoliticasprecios.Create(self);
              finally
                politicasprecios.abm:=3;
                politicasprecios.id:=ZQGrilla.FieldByName('politicaprecio_id').AsString;
                politicasprecios.btnguardar.Caption:='Eliminar';
                politicasprecios.Show;
              end;

         end;


      end;


end;

procedure Tlistapoliticasprecios.btnmodiClick(Sender: TObject);
begin
     if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  politicasprecios:=Tpoliticasprecios.Create(self);
                finally
                  politicasprecios.abm:=2;
                  politicasprecios.id:=ZQGrilla.FieldByName('politicaprecio_id').AsString;
                  politicasprecios.btnguardar.Caption:='Modificar';
                  politicasprecios.Show;
                end;
            end;


      end;



end;

procedure Tlistapoliticasprecios.btncrearClick(Sender: TObject);
begin
    try
      politicasprecios:=Tpoliticasprecios.Create(self);
    finally
      politicasprecios.abm:=1;
      politicasprecios.btnguardar.Caption:='Guardar';
      politicasprecios.Show;
    end;

end;

procedure Tlistapoliticasprecios.Button5Click(Sender: TObject);
begin

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from politicasdeprecios where 1=1';
    if fil_politicaprecio_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_id like "%'+fil_politicaprecio_id.Text+'"';

    if fil_politicaprecio_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_nombre like "%'+fil_politicaprecio_nombre.Text+'%"';

    if fil_politicaprecio_politica1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_politica1 like "%'+fil_politicaprecio_politica1.Text+'%"';

    if fil_politicaprecio_politica2.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_politica2 like "%'+fil_politicaprecio_politica2.Text+'%"';

    if fil_politicaprecio_politica3.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_politica3 like "%'+fil_politicaprecio_politica3.Text+'%"';

    if fil_politicaprecio_politica4.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_politica4 like "%'+fil_politicaprecio_politica4.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by politicaprecio_nombre';

    ZQGrilla.Active:=true;
end;

end.
