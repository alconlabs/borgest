unit UnitListaConfigListas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaConfigListas = class(Tlistabase)
    fil_configcolumna_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaConfigListas: TListaConfigListas;

implementation

uses UnitConfigListas;

{$R *.dfm}

procedure TListaConfigListas.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from configcolumnas '+
                       ' where 1=1';

    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and configcolumna_id like "'+primercaracter+fil_id.Text+'"';

    if fil_configcolumna_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and configcolumna_nombre like "'+primercaracter+fil_configcolumna_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by configcolumna_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaConfigListas.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  ConfigListas:=TConfigListas.Create(self);
                finally
                  ConfigListas.abm:=2;
                  ConfigListas.id:=ZQGrilla.FieldByName(campo_id).AsString;
                  ConfigListas.btnguardar.Caption:='Modificar';
                  ConfigListas.Show;
                end;
            end;
      end;
end;

end.
