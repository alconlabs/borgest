unit UnitEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Mask, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel;

type
  Tempresa = class(TABMbase)
    Label3: TLabel;
    empresa_id: TEdit;
    Label1: TLabel;
    empresa_nombre: TEdit;
    Label17: TLabel;
    empresa_domicilio: TEdit;
    empresa_cuit: TMaskEdit;
    Label19: TLabel;
    empresa_telefono: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  empresa: Tempresa;

implementation

{$R *.dfm}

procedure Tempresa.btnguardarClick(Sender: TObject);
begin
  inherited;
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update empresas set ');
    ZQExecSQL.Sql.Add('empresa_cuit=:empresa_cuit, ');
    ZQExecSQL.Sql.Add('empresa_telefono=:empresa_telefono, ');
    ZQExecSQL.Sql.Add('empresa_domicilio=:empresa_domicilio, ');
    ZQExecSQL.Sql.Add('empresa_nombre=:empresa_nombre ');
    ZQExecSQL.ParamByName('empresa_cuit').AsString:=empresa_cuit.Text;
    ZQExecSQL.ParamByName('empresa_telefono').AsString:=empresa_telefono.Text;
    ZQExecSQL.ParamByName('empresa_domicilio').AsString:=empresa_domicilio.Text;
    ZQExecSQL.ParamByName('empresa_nombre').AsString:=empresa_nombre.Text;
    ZQExecSQL.ExecSql;

    MessageDlg('Datos guardados correctamente', mtInformation, [mbOK], 0);
    self.Close;

end;

procedure Tempresa.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.Active:=true;
end;

procedure Tempresa.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    id:=ZQSelect.FieldByName('empresa_id').AsString;
    empresa_id.Text:=ZQSelect.FieldByName('empresa_id').AsString;
    empresa_nombre.Text:=ZQSelect.FieldByName('empresa_nombre').AsString;
    empresa_domicilio.Text:=ZQSelect.FieldByName('empresa_domicilio').AsString;
    empresa_telefono.Text:=ZQSelect.FieldByName('empresa_telefono').AsString;
    empresa_cuit.Text:=ZQSelect.FieldByName('empresa_cuit').AsString;
end;

end.
