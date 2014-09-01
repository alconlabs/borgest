unit UnitImportarDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitSincronizarDB, Titles, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ComCtrls, AdvListV, UnitSqlListView, ExtCtrls, AdvPanel;

type
  TImportarDB = class(TSincronizarDB)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportarDB: TImportarDB;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TImportarDB.FormCreate(Sender: TObject);
begin
    try
    Princ.BaseRemota.Connect;
    except
    end;
    baseOrigen:=Princ.BaseRemota;
    baseDestino:=Princ.ZBase;

    tipo_sincronizacion:='IMPORTACION';
    tablasinc_tipooperacion:='IMPORTAR';
  inherited;

end;

end.
