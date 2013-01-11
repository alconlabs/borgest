program Gestion;

uses
  Forms,
  UnitPrinc in 'Formularios\UnitPrinc.pas' {Princ},
  Unitvendedores in 'Formularios\Archivo\Unitvendedores.pas' {vendedores},
  Unitlistasolicitudes in 'Formularios\Ventas\Unitlistasolicitudes.pas' {listasolicitudes},
  Unitlistaclientes in 'Formularios\Ventas\Unitlistaclientes.pas' {listaclientes},
  Unitsolicitudes in 'Formularios\Ventas\Unitsolicitudes.pas' {solicitudes},
  Unitestadodectas in 'Formularios\Ventas\Unitestadodectas.pas' {estadoctas},
  Unitinformesventas in 'Formularios\Ventas\Unitinformesventas.pas' {informesventas},
  Unitventadetalle in 'Formularios\Ventas\Unitventadetalle.pas' {ventadetalle},
  UnitClientes in 'Formularios\Ventas\UnitClientes.pas' {clientes},
  Unitcobros in 'Formularios\Ventas\Unitcobros.pas' {Cobros},
  Unitemisionrecibos in 'Formularios\Ventas\Unitemisionrecibos.pas' {emisionrecibos},
  Unitlocalidades in 'Formularios\Archivo\Unitlocalidades.pas' {localidades},
  Unitconsultarvencidos in 'Formularios\Ventas\Unitconsultarvencidos.pas' {consultarvencidos},
  Unitsolicitudesmodificar in 'Formularios\Ventas\Unitsolicitudesmodificar.pas' {solicitudesmodificar},
  Unitgeneranuevasolicitud in 'Formularios\Ventas\Unitgeneranuevasolicitud.pas' {generanuevasolicitud},
  Unitcobradores in 'Formularios\Archivo\Unitcobradores.pas' {cobradores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinc, Princ);
  Application.Run;
end.
