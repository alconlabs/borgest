unit UnitListaProveedores1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaProveedores1 = class(Tlistabase)
    fil_proveedor_nombre: TEdit;
    fil_proveedor_documentonro: TEdit;
    fil_proveedor_domicilio: TEdit;
    fil_proveedor_telefono: TEdit;
    fil_proveedor_mail: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaProveedores1: TListaProveedores1;

implementation

uses UnitProveedores;

{$R *.dfm}

procedure TListaProveedores1.btneliminarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaProveedores1.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from proveedores where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedor_id like "%'+fil_id.Text+'"';

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

procedure TListaProveedores1.btnmodificarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaProveedores1.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      proveedores:=Tproveedores.Create(self);
    finally
      proveedores.abm:=1;
      proveedores.btnguardar.Caption:='Guardar';
      proveedores.Show;
    end;
end;

end.
