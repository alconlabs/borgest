unit UnitlistaEntidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistatemplates, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, AdvGlowButton, ExtCtrls,
  AdvPanel;

type
  TlistaEntidades = class(Tlistatemplates)
    aplicar: TAdvGlowButton;
    fil_entidad_razonsocial: TEdit;
    fil_entidad_calle: TEdit;
    fil_entidad_puerta: TEdit;
    fil_entidad_piso: TEdit;
    fil_entidad_depto: TEdit;
    fil_localidad_nombre: TEdit;
    fil_provincia_nombre: TEdit;
    procedure btnnuevoClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure fil_idChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaEntidades: TlistaEntidades;

implementation

uses UnitEntidades;

{$R *.dfm}

procedure TlistaEntidades.aplicarClick(Sender: TObject);
begin
  inherited;
  ZQGrilla.SQL.Text:='select * from entidades '+
                     'inner join provincias on provincias.provincia_id=entidades.provincia_id ' +
                     'inner join localidades on localidades.provincia_id=provincias.provincia_id '+
                     'where 1=1 ';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidad_id like "%'+fil_id.Text+'%"';

    if fil_entidad_razonsocial.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidad_razonsocial like "%'+fil_entidad_razonsocial.Text+'%"';

    if fil_entidad_calle.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidad_calle like "%'+fil_entidad_calle.Text+'%"';

    if fil_entidad_puerta.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidad_puerta like "%'+fil_entidad_puerta.Text+'%"';

    if fil_entidad_piso.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidad_piso like "%'+fil_entidad_piso.Text+'%"';

    if fil_entidad_depto.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidad_depto like "%'+fil_entidad_depto.Text+'%"';

    if fil_localidad_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and localidad_nombre like "%'+fil_localidad_nombre.Text+'%"';

    if fil_provincia_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_nombre like "%'+fil_provincia_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by entidad_id';
    ZQGrilla.Active:=true;
end;

procedure TlistaEntidades.btnanularClick(Sender: TObject);
begin
  inherited;
     if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  entidades:=Tentidades.Create(self);
                finally
                  entidades.abm:=2;
                  //entidades.id:=ZQGrilla.FieldByName('producto_id').AsString;
                  entidades.btnguardar.Caption:='Modificar';
                  entidades.Show;
                end;
            end;


      end;
end;

procedure TlistaEntidades.btneditarClick(Sender: TObject);
begin
  inherited;
     if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  entidades:=Tentidades.Create(self);
                finally
                  entidades.abm:=2;
                  entidades.id:=ZQGrilla.FieldByName('entidad_id').AsString;
                  entidades.btnguardar.Caption:='Modificar';
                  entidades.Show;
                end;
            end;


      end;
end;

procedure TlistaEntidades.btneliminarClick(Sender: TObject);
begin
  inherited;
      if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                entidades:=Tentidades.Create(self);
              finally
                entidades.abm:=3;
                entidades.id:=ZQGrilla.FieldByName('entidad_id').AsString;
                entidades.btnguardar.Caption:='Eliminar';
                entidades.Show;
              end;

         end;


      end;


  end;

procedure TlistaEntidades.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      Entidades:=TEntidades.Create(self);
    finally
      Entidades.abm:=1;
      Entidades.btnguardar.Caption:='Guardar';
      Entidades.Show;
    end;

end;

procedure TlistaEntidades.fil_idChange(Sender: TObject);
begin
  inherited;
//  aplicar.Click;
end;

end.
