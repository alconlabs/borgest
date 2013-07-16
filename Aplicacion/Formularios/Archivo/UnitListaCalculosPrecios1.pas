unit UnitListaCalculosPrecios1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaCalculosPrecios1 = class(Tlistabase)
    fil_calculoprecio_nombre: TEdit;
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
  ListaCalculosPrecios1: TListaCalculosPrecios1;

implementation

uses UnitPrinc, Unitcalculoprecio;

{$R *.dfm}

procedure TListaCalculosPrecios1.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
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
end;

procedure TListaCalculosPrecios1.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from calculoprecios '+
                       ' where 1=1';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and calculoprecio_id like "%'+fil_id.Text+'"';

    if fil_calculoprecio_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and calculoprecio_nombre like "%'+fil_calculoprecio_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by calculoprecio_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaCalculosPrecios1.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirModificarCalculoprecios(ZQGrilla.FieldByName('calculoprecio_id').AsString);
      end;
end;

procedure TListaCalculosPrecios1.btnnuevoClick(Sender: TObject);
begin
  inherited;
    princ.AbrirNuevoCalculoprecios;
end;

end.
