unit UnitlistaRoles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistatemplates, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, AdvGlowButton, ExtCtrls,
  AdvPanel;

type
  TlistaRoles = class(Tlistatemplates)
    fil_rol_nombre: TEdit;
    aplicar: TAdvGlowButton;
    procedure btnnuevoClick(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaRoles: TlistaRoles;

implementation

uses UnitPrinc, UnitRoles;

{$R *.dfm}

procedure TlistaRoles.aplicarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.SQL.Text:='select * from roles '+
                     'where 1=1 ';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rol_id like "%'+fil_id.Text+'%"';

    if fil_rol_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and rol_nombre like "%'+fil_rol_nombre.Text+'%"';


    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by rol_nombre';
    ZQGrilla.Active:=true;
end;

procedure TlistaRoles.btneditarClick(Sender: TObject);
begin
  inherited;
   if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  roles:=Troles.Create(self);
                finally
                  roles.abm:=2;
                  roles.id:=ZQGrilla.FieldByName('rol_id').AsString;
                  roles.btnguardar.Caption:='Modificar';
                  roles.Show;
                end;

            end;


      end;

end;

procedure TlistaRoles.btneliminarClick(Sender: TObject);
begin
  inherited;
  if ZQGrilla.active then
      begin

          if ZQGrilla.RecordCount>0 then
            begin
                try
                  roles:=Troles.Create(self);
                finally
                  roles.abm:=3;
                  roles.id:=ZQGrilla.FieldByName('rol_id').AsString;
                  roles.btnguardar.Caption:='Eliminar';
                  roles.Show;
                end;
            end;


      end;
end;

procedure TlistaRoles.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      Roles:=TRoles.Create(self);
    finally
      Roles.abm:=1;
      Roles.btnguardar.Caption:='Guardar';
      Roles.Show;
    end;
end;

procedure TlistaRoles.FormActivate(Sender: TObject);
begin
  inherited;
   aplicar.OnClick(self);
end;

end.
