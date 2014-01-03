unit UnitListaCuponesTarjetasCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaCuponesTarjetasCredito = class(Tlistabase)
    fil_tarjeta_nombre: TGTBEdit;
    fil_cupontarjeta_importe: TGTBEdit;
    fil_cupontarjeta_cuotas: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaCuponesTarjetasCredito: TListaCuponesTarjetasCredito;

implementation

uses UnitCuponTarjetaCredito, unitprinc;

{$R *.dfm}

procedure TListaCuponesTarjetasCredito.btneliminarClick(Sender: TObject);
begin
  inherited;
    try
      CuponTarjetaCredito:=TCuponTarjetaCredito.Create(self);
    finally
      CuponTarjetaCredito.abm:=ABM_ELIMINAR;
      CuponTarjetaCredito.id:=ZQGrilla.FieldByName('cupontarjeta_id').AsString;
      CuponTarjetaCredito.btnguardar.Caption:='Guardar';
      CuponTarjetaCredito.Show;
    end;
end;

procedure TListaCuponesTarjetasCredito.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from cuponestarjetas '+
                       'inner join tarjetas on cuponestarjetas.tarjeta_id=tarjetas.tarjeta_id where 1=1';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cupontarjeta_id like "'+primercaracter+fil_id.Text+'"';

    if fil_tarjeta_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tarjeta_nombre like "'+primercaracter+fil_tarjeta_nombre.Text+'%"';

    if fil_cupontarjeta_importe.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cupontarjeta_importe like "'+primercaracter+fil_cupontarjeta_importe.Text+'%"';

    if fil_cupontarjeta_cuotas.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cupontarjeta_cuotas like "'+primercaracter+fil_cupontarjeta_cuotas.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by cupontarjeta_fecha desc';

    ZQGrilla.Active:=true;
end;

procedure TListaCuponesTarjetasCredito.btnmodificarClick(Sender: TObject);
begin
  inherited;
    try
      CuponTarjetaCredito:=TCuponTarjetaCredito.Create(self);
    finally
      CuponTarjetaCredito.abm:=ABM_MODIFICAR;
      CuponTarjetaCredito.id:=ZQGrilla.FieldByName('cupontarjeta_id').AsString;
      CuponTarjetaCredito.btnguardar.Caption:='Guardar';
      CuponTarjetaCredito.Show;
    end;
end;

procedure TListaCuponesTarjetasCredito.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      CuponTarjetaCredito:=TCuponTarjetaCredito.Create(self);
    finally
      CuponTarjetaCredito.abm:=ABM_AGREGAR;
      CuponTarjetaCredito.btnguardar.Caption:='Guardar';
      CuponTarjetaCredito.Show;
    end;
end;

procedure TListaCuponesTarjetasCredito.btnverClick(Sender: TObject);
begin
  inherited;
    try
      CuponTarjetaCredito:=TCuponTarjetaCredito.Create(self);
    finally
      CuponTarjetaCredito.abm:=ABM_VER;
      CuponTarjetaCredito.id:=ZQGrilla.FieldByName('cupontarjeta_id').AsString;
      CuponTarjetaCredito.btnguardar.Caption:='Guardar';
      CuponTarjetaCredito.Show;
    end;
end;

end.
