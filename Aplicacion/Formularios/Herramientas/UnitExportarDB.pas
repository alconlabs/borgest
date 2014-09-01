unit UnitExportarDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitSincronizarDB, Titles, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ComCtrls, AdvListV, UnitSqlListView, ExtCtrls, AdvPanel;

type
  TExportarDB = class(TSincronizarDB)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExportarDB: TExportarDB;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TExportarDB.FormCreate(Sender: TObject);
begin
    try
    Princ.BaseRemota.Connect;
    except
    end;
    baseOrigen:=Princ.ZBase;
    baseDestino:=Princ.BaseRemota;
    tipo_sincronizacion:='EXPORTACION';
    tablasinc_tipooperacion:='EXPORTAR';

  inherited;

end;

end.
