unit UnitlistaControlEntidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistatemplates, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, AdvGlowButton, ExtCtrls,
  AdvPanel;

type
  TlistaControlEntidad = class(Tlistatemplates)
    aplicar: TAdvGlowButton;
    procedure btnnuevoClick(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaControlEntidad: TlistaControlEntidad;

implementation

uses UnitControlEntidad, Unitprinc;

{$R *.dfm}

procedure TlistaControlEntidad.aplicarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;
end;

procedure TlistaControlEntidad.btneditarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  ControlEntidad:=TControlEntidad.Create(self);
                finally
                  ControlEntidad.abm:=ABM_MODIFICAR;
                  ControlEntidad.id:=ZQGrilla.FieldByName('entidadrol_id').AsString;
                  ControlEntidad.btnguardar.Caption:='Modificar';
                  ControlEntidad.Show;
                end;
            end;
      end;
end;

procedure TlistaControlEntidad.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  ControlEntidad:=TControlEntidad.Create(self);
                finally
                  ControlEntidad.abm:=ABM_ELIMINAR;
                  ControlEntidad.id:=ZQGrilla.FieldByName('entidadrol_id').AsString;
                  ControlEntidad.btnguardar.Caption:='Eliminar';
                  ControlEntidad.Show;
                end;
            end;
      end;
end;

procedure TlistaControlEntidad.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      ControlEntidad:=TControlEntidad.Create(self);
    finally
      ControlEntidad.abm:=1;
      ControlEntidad.btnguardar.Caption:='Guardar';
      ControlEntidad.Show;
    end;
end;

end.
