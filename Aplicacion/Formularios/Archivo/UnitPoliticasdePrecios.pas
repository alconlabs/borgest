unit UnitPoliticasdePrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaPoliticasdePrecios = class(Tlistabase)
    fil_politicaprecio_nombre: TEdit;
    fil_politicaprecio_politica1: TEdit;
    fil_politicaprecio_politica2: TEdit;
    fil_politicaprecio_politica3: TEdit;
    fil_politicaprecio_politica4: TEdit;
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
  ListaPoliticasdePrecios: TListaPoliticasdePrecios;

implementation

uses UnitPoliticasPrecios;

{$R *.dfm}

procedure TListaPoliticasdePrecios.btneliminarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaPoliticasdePrecios.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from politicasdeprecios where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and politicaprecio_id like "%'+fil_id.Text+'"';

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

procedure TListaPoliticasdePrecios.btnmodificarClick(Sender: TObject);
begin
  inherited;
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

procedure TListaPoliticasdePrecios.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      politicasprecios:=Tpoliticasprecios.Create(self);
    finally
      politicasprecios.abm:=1;
      politicasprecios.btnguardar.Caption:='Guardar';
      politicasprecios.Show;
    end;
end;

end.
