unit UnitListaTarjetasdeCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaTarjetasdeCredito = class(Tlistabase)
    fil_tarjeta_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaTarjetasdeCredito: TListaTarjetasdeCredito;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TListaTarjetasdeCredito.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from tarjetas '+
                       ' where 1=1';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tarjeta_id like "'+primercaracter+fil_id.Text+'"';

    if fil_tarjeta_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tarjeta_nombre like "'+primercaracter+fil_tarjeta_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by tarjeta_nombre';

    ZQGrilla.Active:=true;

end;

procedure TListaTarjetasdeCredito.btnmodificarClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirModificarTarjeta(id);
end;

procedure TListaTarjetasdeCredito.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoTarjeta;
end;

end.
