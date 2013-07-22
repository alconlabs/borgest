unit UnitlistaComisionesSucursales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, ComCtrls;

type
  Tlistacomisionessucursales = class(Tlistabase)
    fil_liquidacionsucursal_fecha: TEdit;
    fil_sucursal_nombre: TEdit;
    fil_liquidacionsucursal_total: TEdit;
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
  listacomisionessucursales: Tlistacomisionessucursales;

implementation

uses Unitliquidacionessucu;

{$R *.dfm}

procedure Tlistacomisionessucursales.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                liquidacionessucu:=Tliquidacionessucu.Create(self);
              finally
                liquidacionessucu.abm:=3;
                liquidacionessucu.id:=ZQGrilla.FieldByName('liquidacionsucursal_id').AsString;
                liquidacionessucu.btnguardar.Caption:='Eliminar';
                liquidacionessucu.Show;
              end;

         end;


      end;
end;

procedure Tlistacomisionessucursales.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from liquidacionessucursales '+
                       'inner join sucursales on liquidacionessucursales.sucursal_id=sucursales.sucursal_id '+
                       'where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionsucursal_id like "'+primercaracter+fil_id.Text+'%"';

    if fil_liquidacionsucursal_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionsucursal_fecha like "'+primercaracter+fil_liquidacionsucursal_fecha.Text+'"';

    if fil_sucursal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_nombre like "'+primercaracter+fil_sucursal_nombre.Text+'%"';

    if fil_liquidacionsucursal_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionsucursal_total like "'+primercaracter+fil_liquidacionsucursal_total.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by liquidacionsucursal_fecha';

    ZQGrilla.Active:=true;
end;

procedure Tlistacomisionessucursales.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  liquidacionessucu:=Tliquidacionessucu.Create(self);
                finally
                  liquidacionessucu.abm:=2;
                  liquidacionessucu.id:=ZQGrilla.FieldByName('liquidacionsucursal_id').AsString;
                  liquidacionessucu.btnguardar.Caption:='Modificar';
                  liquidacionessucu.Show;
                end;
            end;


      end;
end;

procedure Tlistacomisionessucursales.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      liquidacionessucu:=Tliquidacionessucu.Create(self);
    finally
      liquidacionessucu.abm:=1;
      liquidacionessucu.btnguardar.Caption:='Guardar';
      liquidacionessucu.Show;
    end;
end;

end.
