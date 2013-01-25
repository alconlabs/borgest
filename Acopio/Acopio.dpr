program Acopio;

uses
  Forms,
  UnitPrinc in 'Formularios\UnitPrinc.pas' {Princ},
  Unitlocalidades in 'Formularios\Archivo\Unitlocalidades.pas' {localidades},
  UnitConfiguracion in 'Formularios\Herramientas\UnitConfiguracion.pas' {configuracion},
  UnitEmpresa in 'Formularios\Archivo\UnitEmpresa.pas' {empresa},
  Unitlistabase in 'Formularios\Unitlistabase.pas' {listabase},
  UnitABMbase in 'Formularios\UnitABMbase.pas' {ABMbase},
  UnitListaTiposDocumentos in 'Formularios\Archivo\UnitListaTiposDocumentos.pas' {listatiposdocumentos},
  UnitMenuConfig in 'Formularios\Herramientas\UnitMenuConfig.pas' {MenuConfig},
  Unitbusquedabase in 'Formularios\Unitbusquedabase.pas' {busquedabase},
  UnitListaSucursales in 'Formularios\Archivo\UnitListaSucursales.pas' {listasucursales},
  UnitListaPuntosdeVenta in 'Formularios\Archivo\UnitListaPuntosdeVenta.pas' {listapuntosdeventa},
  UnitPersonal in 'Formularios\Archivo\UnitPersonal.pas' {personal},
  UnitListaPerfiles in 'Formularios\Archivo\UnitListaPerfiles.pas' {ListaPerfiles},
  UnitPerfil in 'Formularios\Herramientas\UnitPerfil.pas' {Perfil},
  UnitABMInibase in 'Formularios\UnitABMInibase.pas' {ABMInibase},
  Unitlistatemplates in 'Formularios\Unitlistatemplates.pas' {listatemplates},
  UnitEntidades in 'Formularios\Archivo\UnitEntidades.pas' {Entidades},
  UnitRoles in 'Formularios\Archivo\UnitRoles.pas' {Roles},
  UnitlistaRoles in 'Formularios\Archivo\UnitlistaRoles.pas' {listaRoles},
  UnitArticulos in 'Formularios\Archivo\UnitArticulos.pas' {Articulos},
  UnitlistaEntidades in 'Formularios\Archivo\UnitlistaEntidades.pas' {listaEntidades},
  UnitEntidadContactos in 'Formularios\Archivo\UnitEntidadContactos.pas' {EntidadContactos},
  Unitbusquedaproductos in 'Formularios\Archivo\Unitbusquedaproductos.pas' {busquedaproductos},
  UnitlistaRubros in 'Formularios\Archivo\UnitlistaRubros.pas' {listaRubros},
  UnitRubros in 'Formularios\Archivo\UnitRubros.pas' {Rubros};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinc, Princ);
  Application.CreateForm(TEntidades, Entidades);
  Application.CreateForm(TRoles, Roles);
  Application.CreateForm(TlistaRoles, listaRoles);
  Application.CreateForm(TArticulos, Articulos);
  Application.CreateForm(TlistaEntidades, listaEntidades);
  Application.CreateForm(TEntidadContactos, EntidadContactos);
  Application.CreateForm(Tbusquedaproductos, busquedaproductos);
  Application.CreateForm(TlistaRubros, listaRubros);
  Application.CreateForm(TRubros, Rubros);
  Application.Run;
end.