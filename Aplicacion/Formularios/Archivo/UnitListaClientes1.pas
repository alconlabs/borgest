unit UnitListaClientes1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaClientes1 = class(Tlistabase)
    fil_cliente_nombre: TEdit;
    fil_cliente_documentonro: TEdit;
    fil_cliente_domicilio: TEdit;
    fil_cliente_telefono: TEdit;
    fil_cliente_mail: TEdit;
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
  ListaClientes1: TListaClientes1;

implementation

uses UnitClientes;

{$R *.dfm}

procedure TListaClientes1.btneliminarClick(Sender: TObject);
begin
  inherited;
   if ZQGrilla.active then
      begin
         if ZQGrilla.RecordCount>0 then
         begin
              try
                clientes:=Tclientes.Create(self);
              finally
                clientes.abm:=3;
                clientes.id:=ZQGrilla.FieldByName('cliente_id').AsString;
                clientes.btnguardar.Caption:='Eliminar';
                clientes.Show;
              end;

         end;


      end;
end;

procedure TListaClientes1.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from clientes where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_id like "'+primercaracter+fil_id.Text+'"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_nombre like "'+primercaracter+fil_cliente_nombre.Text+'%"';

    if fil_cliente_documentonro.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_documentonro like "'+primercaracter+fil_cliente_documentonro.Text+'%"';

    if fil_cliente_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_domicilio like "'+primercaracter+fil_cliente_domicilio.Text+'%"';

    if fil_cliente_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_telefono like "'+primercaracter+fil_cliente_telefono.Text+'%"';

    if fil_cliente_mail.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_mail like "'+primercaracter+fil_cliente_mail.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by cliente_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaClientes1.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  clientes:=Tclientes.Create(self);
                finally
                  clientes.abm:=2;
                  clientes.id:=ZQGrilla.FieldByName('cliente_id').AsString;
                  clientes.btnguardar.Caption:='Modificar';
                  clientes.Show;
                end;
            end;


      end;
end;

procedure TListaClientes1.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      clientes:=Tclientes.Create(self);
    finally
      clientes.abm:=1;
      clientes.btnguardar.Caption:='Guardar';
      clientes.Show;
    end;
end;

end.
