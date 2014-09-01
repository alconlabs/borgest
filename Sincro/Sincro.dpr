program Sincro;

uses
  Forms,
  UnitPrinc in 'UnitPrinc.pas' {Princ},
  UnitABMbase in '..\Aplicacion\Formularios\UnitABMbase.pas' {ABMbase},
  UnitSincronizarDB in '..\Aplicacion\Formularios\Herramientas\UnitSincronizarDB.pas' {SincronizarDB},
  UnitExportarDB in '..\Aplicacion\Formularios\Herramientas\UnitExportarDB.pas' {ExportarDB},
  UnitImportarDB in '..\Aplicacion\Formularios\Herramientas\UnitImportarDB.pas' {ImportarDB};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.CreateForm(TPrinc, Princ);
  Application.Run;
end.
