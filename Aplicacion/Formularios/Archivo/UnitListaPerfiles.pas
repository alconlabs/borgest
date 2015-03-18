unit UnitListaPerfiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, ComCtrls, Buttons;

type
  TListaPerfiles = class(Tlistabase)
    fil_perfil_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnclonarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaPerfiles: TListaPerfiles;

implementation

uses UnitPrinc, UnitPerfil;

{$R *.dfm}

procedure TListaPerfiles.btnclonarClick(Sender: TObject);
begin
  inherited;
    try
      Perfil:=TPerfil.Create(self);
    finally
      Perfil.abm:=ABM_CLONAR;
      Perfil.id:=ZQGrilla.FieldByName('perfil_id').AsString;
      Perfil.btnguardar.Caption:='Clonar';
      Perfil.Show;
    end;
end;

procedure TListaPerfiles.btneliminarClick(Sender: TObject);
begin
  inherited;
    try
      Perfil:=TPerfil.Create(self);
    finally
      Perfil.abm:=ABM_ELIMINAR;
      Perfil.id:=ZQGrilla.FieldByName('perfil_id').AsString;
      Perfil.btnguardar.Caption:='Eliminar';
      Perfil.Show;
    end;
end;

procedure TListaPerfiles.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from perfiles '+
                       ' where 1=1';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and perfil_id like "'+primercaracter+fil_id.Text+'"';

    if fil_perfil_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and perfil_nombre like "'+primercaracter+fil_perfil_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by perfil_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaPerfiles.btnmodificarClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirModificarPerfil(ZQGrilla.FieldByName('perfil_id').AsString);
end;

procedure TListaPerfiles.btnnuevoClick(Sender: TObject);
begin
  inherited;
    princ.AbrirNuevoPerfil;
end;

end.
