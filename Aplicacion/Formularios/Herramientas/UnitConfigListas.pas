unit UnitConfigListas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids;

type
  TConfigListas = class(TABMbase)
    DBGrid1: TDBGrid;
    DTSconfigcolumnadetalles: TDataSource;
    ZQconfigcolumnadetalles: TZQuery;
    Label3: TLabel;
    configcolumna_nombre: TEdit;
    ZQconfigcolumnadetallesconfigcolumnadeta_id: TIntegerField;
    ZQconfigcolumnadetallesconfigcolumnadeta_campo: TStringField;
    ZQconfigcolumnadetallesconfigcolumnadeta_visible: TIntegerField;
    ZQconfigcolumnadetallesconfigcolumnadeta_titulo: TStringField;
    ZQconfigcolumnadetallesconfigcolumna_id: TIntegerField;
    ZQconfigcolumnadetallesestado: TStringField;
    Label1: TLabel;
    configcolumna_anchoventana: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    procedure modificar;
  public
    { Public declarations }
  end;

var
  ConfigListas: TConfigListas;

implementation

{$R *.dfm}

procedure TConfigListas.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update configcolumnas set ');
    ZQExecSQL.Sql.Add('configcolumna_anchoventana=:configcolumna_anchoventana ');
    ZQExecSQL.Sql.Add('where configcolumna_id=:configcolumna_id ');
    ZQExecSQL.ParamByName('configcolumna_anchoventana').AsString:=configcolumna_anchoventana.Text;
    ZQExecSQL.ParamByName('configcolumna_id').AsString:=id;
    ZQExecSQL.ExecSql;




    ZQconfigcolumnadetalles.First;
    while not ZQconfigcolumnadetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('update configcolumnadetalles set ');
            ZQExecSQL.Sql.Add('configcolumnadeta_visible=:configcolumnadeta_visible ');
            ZQExecSQL.Sql.Add('where configcolumnadeta_id=:configcolumnadeta_id ');
            ZQExecSQL.ParamByName('configcolumnadeta_visible').AsInteger:=0;
            if ZQconfigcolumnadetalles.FieldByName('estado').AsString='Visible' then
              ZQExecSQL.ParamByName('configcolumnadeta_visible').AsInteger:=-1;
            ZQExecSQL.ParamByName('configcolumnadeta_id').AsString:=ZQconfigcolumnadetalles.FieldByName('configcolumnadeta_id').AsString;
            ZQExecSQL.ExecSql;

            ZQconfigcolumnadetalles.Next;
        end;
end;

procedure TConfigListas.btnguardarClick(Sender: TObject);
begin
  inherited;
    modificar;
end;

procedure TConfigListas.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('configcolumna_id').AsString:=id;
    ZQSelect.Active:=true;
end;

procedure TConfigListas.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    configcolumna_nombre.Text:=ZQSelect.FieldByName('configcolumna_nombre').AsString;
    configcolumna_anchoventana.Text:=ZQSelect.FieldByName('configcolumna_anchoventana').AsString;

    configcolumna_anchoventana.Visible:=true;
    Label1.Visible:=true;

    if configcolumna_anchoventana.Text='0' then
      begin
          configcolumna_anchoventana.Visible:=false;
          Label1.Visible:=false;
      end;

    ZQconfigcolumnadetalles.Active:=false;
    ZQconfigcolumnadetalles.ParamByName('configcolumna_id').AsString:=id;
    ZQconfigcolumnadetalles.Active:=true;
end;

end.
