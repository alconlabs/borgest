unit UnitImprimirFichasClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel;

type
  TImprimirFichasClientes = class(TABMbase)
    Label11: TLabel;
    provincia_id: TSqlComboBox;
    Label6: TLabel;
    localidad_id: TSqlComboBox;
    procedure provincia_idSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImprimirFichasClientes: TImprimirFichasClientes;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TImprimirFichasClientes.btnguardarClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'ficha_clientes.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from clientes '+
                                                   'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                                   'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                                   'where 1=1 ';

    if provincia_id.codigo<>'-1' then
      begin
          Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and provincias.provincia_id="'+provincia_id.codigo+'"';
      end;

    if localidad_id.codigo<>'-1' then
      begin
          Princ.VCLReport1.Report.Datainfo.Items[0].sql:=Princ.VCLReport1.Report.Datainfo.Items[0].sql+' and localidades.localidad_id="'+localidad_id.codigo+'"';
      end;

    Princ.VCLReport1.Execute;
end;

procedure TImprimirFichasClientes.FormCreate(Sender: TObject);
begin
  inherited;
    provincia_id.llenarcombo;
    provincia_id.ItemIndex:=0;
    localidad_id.llenarcombo;
    localidad_id.ItemIndex:=0;
end;

procedure TImprimirFichasClientes.provincia_idSelect(Sender: TObject);
begin
  inherited;
    localidad_id.Confsql.Text:='select * from localidades where provincia_id="'+provincia_id.codigo+'"';
    localidad_id.llenarcombo;
    localidad_id.ItemIndex:=0;
end;

end.
