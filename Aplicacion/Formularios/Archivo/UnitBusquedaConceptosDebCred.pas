unit UnitBusquedaConceptosDebCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitbusquedabase, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls,
  AdvPanel;

type
  TBusquedaConceptosDebCred = class(Tbusquedabase)
    fil_producto_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BusquedaConceptosDebCred: TBusquedaConceptosDebCred;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TBusquedaConceptosDebCred.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from productos inner join rubros on productos.rubro_id=rubros.rubro_id '+
                       'where 1=1 and producto_tipo="CONCEPTO" ';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and productos.producto_id like "%'+Princ.GTBUtilidades1.Reemplazar(fil_id.Text,' ','%')+'"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%')+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by producto_nombre';

    ZQGrilla.Active:=true;

    DBGrid1.SetFocus;
end;

procedure TBusquedaConceptosDebCred.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if key=#13 then
      begin
          if ZQGrilla.RecordCount>0 then
            btnaceptar.Click;
      end;
end;

end.
