unit UnitListaAjustesdeStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaAjustedeStock = class(Tlistabase)
    fil_ajustestock_fecha: TGTBEdit;
    fil_personal_nombre: TGTBEdit;
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
  ListaAjustedeStock: TListaAjustedeStock;

implementation

uses UnitAjusteStock, UnitPrinc;

{$R *.dfm}

procedure TListaAjustedeStock.btneliminarClick(Sender: TObject);
begin
  inherited;
    try
      AjusteStock:=TAjusteStock.Create(self);
    finally
      AjusteStock.abm:=ABM_ELIMINAR;
      AjusteStock.id:=id;
      AjusteStock.Show;
    end;
end;

procedure TListaAjustedeStock.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from ajustestock '+
                       'inner join personal on ajustestock.personal_id=personal.personal_id '+
                       'where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and ajustestock_id like "'+primercaracter+fil_id.Text+'"';

    if fil_ajustestock_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and ajustestock_fecha like "'+primercaracter+fil_ajustestock_fecha.Text+'%"';

    if fil_personal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_nombre like "'+primercaracter+fil_personal_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by ajustestock_id desc';

    ZQGrilla.Active:=true;
end;

procedure TListaAjustedeStock.btnmodificarClick(Sender: TObject);
begin
  inherited;
    try
      AjusteStock:=TAjusteStock.Create(self);
    finally
      AjusteStock.abm:=ABM_MODIFICAR;
      AjusteStock.id:=id;
      AjusteStock.Show;
    end;
end;

procedure TListaAjustedeStock.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      AjusteStock:=TAjusteStock.Create(self);
    finally
      AjusteStock.abm:=ABM_AGREGAR;
      AjusteStock.id:=id;
      AjusteStock.Show;
    end;
end;

end.
