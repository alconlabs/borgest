unit Unitlistaproveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid;

type
  Tlistaproveedores = class(TForm)
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
    fil_proveedor_domicilio: TEdit;
    fil_proveedor_id: TEdit;
    fil_proveedor_nombre: TEdit;
    fil_proveedor_telefono: TEdit;
    ZQuery2: TZQuery;
    fil_proveedor_mail: TEdit;
    fil_proveedor_documentonro: TEdit;
    CustomizeGrid1: TCustomizeGrid;
    procedure btncrearClick(Sender: TObject);
    procedure btnmodiClick(Sender: TObject);
    procedure btnelimiClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  listaproveedores: Tlistaproveedores;

implementation

uses UnitPrinc, Unitproveedores;

{$R *.dfm}

procedure Tlistaproveedores.eliminar;
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



procedure Tlistaproveedores.FormCreate(Sender: TObject);
begin
    abm:=0;
//    Panelabm.Visible:=false;
end;

procedure Tlistaproveedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tlistaproveedores.modificar;
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


procedure Tlistaproveedores.agregar;
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



function Tlistaproveedores.control:boolean;
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

procedure Tlistaproveedores.btnelimiClick(Sender: TObject);
begin
    if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                proveedores:=Tproveedores.Create(self);
              finally
                proveedores.abm:=3;
                proveedores.id:=ZQGrilla.FieldByName('proveedor_id').AsString;
                proveedores.btnguardar.Caption:='Eliminar';
                proveedores.Show;
              end;

         end;


      end;


end;

procedure Tlistaproveedores.btnmodiClick(Sender: TObject);
begin
     if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  proveedores:=Tproveedores.Create(self);
                finally
                  proveedores.abm:=2;
                  proveedores.id:=ZQGrilla.FieldByName('proveedor_id').AsString;
                  proveedores.btnguardar.Caption:='Modificar';
                  proveedores.Show;
                end;
            end;


      end;



end;

procedure Tlistaproveedores.btncrearClick(Sender: TObject);
begin
    try
      proveedores:=Tproveedores.Create(self);
    finally
      proveedores.abm:=1;
      proveedores.btnguardar.Caption:='Guardar';
      proveedores.Show;
    end;

end;

procedure Tlistaproveedores.Button5Click(Sender: TObject);
begin

    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from proveedores where 1=1';
    if fil_proveedor_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_id like "%'+fil_proveedor_id.Text+'"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_nombre like "%'+fil_proveedor_nombre.Text+'%"';

    if fil_proveedor_documentonro.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_documentonro like "%'+fil_proveedor_documentonro.Text+'%"';

    if fil_proveedor_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_domicilio like "%'+fil_proveedor_domicilio.Text+'%"';

    if fil_proveedor_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_telefono like "%'+fil_proveedor_telefono.Text+'%"';

    if fil_proveedor_mail.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_mail like "%'+fil_proveedor_mail.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by proveedor_nombre';

    ZQGrilla.Active:=true;
end;

end.
