unit Unitlistacomisionesvendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, ComCtrls;

type
  Tlistacomisionesvendedores = class(Tlistabase)
    fil_liquidacionvendedor_fecha: TEdit;
    fil_personal_nombre: TEdit;
    fil_liquidacionvendedor_total: TEdit;
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
  listacomisionesvendedores: Tlistacomisionesvendedores;

implementation

uses Unitliquidaciones;

{$R *.dfm}

procedure Tlistacomisionesvendedores.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                liquidaciones:=Tliquidaciones.Create(self);
              finally
                liquidaciones.abm:=3;
                liquidaciones.id:=ZQGrilla.FieldByName('liquidacionvendedor_id').AsString;
                liquidaciones.btnguardar.Caption:='Eliminar';
                liquidaciones.Show;
              end;

         end;


      end;
end;

procedure Tlistacomisionesvendedores.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from liquidacionesvendedores '+
                       'inner join personal on liquidacionesvendedores.personal_id=personal.personal_id '+
                       'where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionvendedor_id like "%'+fil_id.Text+'%"';

    if fil_liquidacionvendedor_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionvendedor_fecha like "%'+fil_liquidacionvendedor_fecha.Text+'"';

    if fil_personal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_nombre like "%'+fil_personal_nombre.Text+'%"';

    if fil_liquidacionvendedor_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and liquidacionvendedor_total like "%'+fil_liquidacionvendedor_total.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by liquidacionvendedor_fecha';

    ZQGrilla.Active:=true;
end;

procedure Tlistacomisionesvendedores.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  liquidaciones:=Tliquidaciones.Create(self);
                finally
                  liquidaciones.abm:=2;
                  liquidaciones.id:=ZQGrilla.FieldByName('liquidacionvendedor_id').AsString;
                  liquidaciones.btnguardar.Caption:='Modificar';
                  liquidaciones.Show;
                end;
            end;


      end;
end;

procedure Tlistacomisionesvendedores.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      liquidaciones:=Tliquidaciones.Create(self);
    finally
      liquidaciones.abm:=1;
      liquidaciones.btnguardar.Caption:='Guardar';
      liquidaciones.Show;
    end;
end;

end.
