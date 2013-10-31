unit UnitListaLiquidacionesBorradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaLiquidacionesBorradores = class(Tlistabase)
    fil_liquidacionborrador_fecha: TGTBEdit;
    fil_personal_nombre: TGTBEdit;
    fil_liquidacionborrador_total: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaLiquidacionesBorradores: TListaLiquidacionesBorradores;

implementation

uses UnitLiquidacionBorrador, Unitprinc;

{$R *.dfm}

procedure TListaLiquidacionesBorradores.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from liquidacionesborradores '+
                       'inner join personal on liquidacionesborradores.personal_id=personal.personal_id where 1=1 ';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionborrador_id like "'+primercaracter+fil_id.Text+'"';

    if fil_liquidacionborrador_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionborrador_fecha like "'+primercaracter+fil_liquidacionborrador_fecha.Text+'%"';

    if fil_personal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_nombre like "'+primercaracter+fil_personal_nombre.Text+'%"';

    if fil_liquidacionborrador_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionborrador_total like "'+primercaracter+fil_liquidacionborrador_total.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by liquidacionborrador_fecha desc, liquidacionborrador_id desc';

    ZQGrilla.Active:=true;

end;

procedure TListaLiquidacionesBorradores.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      LiquidacionBorrador:=TLiquidacionBorrador.Create(self);
    finally
      LiquidacionBorrador.id:='';
      LiquidacionBorrador.abm:=ABM_AGREGAR;
      LiquidacionBorrador.Show;
    end;
end;

end.
