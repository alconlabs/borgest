unit Unitlistacurvas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  Tlistacurvas = class(Tlistabase)
    fil_curva_descripcion: TGTBEdit;
    fil_marca_nombre: TGTBEdit;
    fil_seccion_nombre: TGTBEdit;
    fil_rubro_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnclonarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listacurvas: Tlistacurvas;

implementation

uses unitprinc, UnitCurva;

{$R *.dfm}

procedure Tlistacurvas.btnclonarClick(Sender: TObject);
begin
  inherited;
    try
      Curva:=TCurva.Create(self);
    finally
      Curva.abm:=ABM_CLONAR;
      Curva.id:=ZQGrilla.FieldByName(campo_id).AsString;
      Curva.btnguardar.Caption:='Guardar';
      Curva.Show;
    end;
end;

procedure Tlistacurvas.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from curvas '+
                       'inner join marcas on curvas.marca_id=marcas.marca_id '+
                       'inner join secciones on curvas.seccion_id=secciones.seccion_id '+
                       'inner join rubros on curvas.rubro_id=rubros.rubro_id '+
                       'where 1=1 ';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and curva_id like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_id.Text,' ','%',false,0)+'%"';

    if fil_curva_descripcion.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and curva_descripcion like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_curva_descripcion.Text,' ','%',false,0)+'%"';

    if fil_marca_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and marca_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_marca_nombre.Text,' ','%',false,0)+'%"';

    if fil_seccion_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and seccion_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_seccion_nombre.Text,' ','%',false,0)+'%"';

    if fil_rubro_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rubro_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_rubro_nombre.Text,' ','%',false,0)+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by curva_descripcion';

    ZQGrilla.Active:=true;

end;

procedure Tlistacurvas.btnmodificarClick(Sender: TObject);
begin
  inherited;
    try
      Curva:=TCurva.Create(self);
    finally
      Curva.abm:=ABM_MODIFICAR;
      Curva.id:=ZQGrilla.FieldByName(campo_id).AsString;
      Curva.btnguardar.Caption:='Guardar';
      Curva.Show;
    end;
end;

procedure Tlistacurvas.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      Curva:=TCurva.Create(self);
    finally
      Curva.abm:=ABM_AGREGAR;
      Curva.btnguardar.Caption:='Guardar';
      Curva.Show;
    end;
end;

end.
