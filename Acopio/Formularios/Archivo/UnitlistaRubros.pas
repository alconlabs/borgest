unit UnitlistaRubros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistatemplates, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, AdvGlowButton, ExtCtrls,
  AdvPanel;

type
  TlistaRubros = class(Tlistatemplates)
    fil_rubro_nombre: TEdit;
    aplicar: TAdvGlowButton;
    procedure btnnuevoClick(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaRubros: TlistaRubros;

implementation

uses UnitRubros;

{$R *.dfm}

procedure TlistaRubros.aplicarClick(Sender: TObject);
begin
  inherited;
   ZQGrilla.SQL.Text:='select * from rubros '+
                     'where 1=1 ';
   if fil_id.Text<>'' then
     ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_codi like "%'+fil_id.Text+'%"';

   if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "%'+fil_rubro_nombre.Text+'%"';

   ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by rubro_codi';
   ZQGrilla.Active:=true;
end;

procedure TlistaRubros.btnnuevoClick(Sender: TObject);
begin
  inherited;
try
      rubros:=Trubros.Create(self);
    finally
      rubros.abm:=1;
      rubros.btnguardar.Caption:='Guardar';
      rubros.Show;
    end;
end;

end.
