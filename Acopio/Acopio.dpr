program Acopio;

uses
  Forms,
  UnitPrinc in 'Formularios\UnitPrinc.pas' {Princ},
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
  UnitlistaRubros in 'Formularios\Archivo\UnitlistaRubros.pas' {listaRubros},
  UnitRubros in 'Formularios\Archivo\UnitRubros.pas' {Rubros},
  UnitlistaControlEntidad in 'Formularios\Archivo\UnitlistaControlEntidad.pas' {listaControlEntidad},
  UnitControlEntidad in 'Formularios\Archivo\UnitControlEntidad.pas' {ControlEntidad},
  UnitTipoDocumento in 'Formularios\Archivo\UnitTipoDocumento.pas' {tipodocumento},
  Unitsaldoclientes in 'Formularios\Ventas\Unitsaldoclientes.pas' {saldoclientes},
  Unitdetallectas in 'Formularios\Ventas\Unitdetallectas.pas' {detallectas},
  Unitestadodectas in 'Formularios\Ventas\Unitestadodectas.pas' {estadoctas},
  Unitdocumentoventabase in 'Formularios\Ventas\Unitdocumentoventabase.pas' {documentoventabase},
  UnitFacturarDocumentos in 'Formularios\Ventas\UnitFacturarDocumentos.pas' {FacturarDocumentos},
  Unitventadetalle2 in 'Formularios\Ventas\Unitventadetalle2.pas' {ventadetalle2},
  Unitbusquedaproductos in 'Formularios\Archivo\Unitbusquedaproductos.pas' {busquedaproductos},
  UnitProductos in 'Formularios\Archivo\UnitProductos.pas' {productos},
  Unitlocalidades in 'Formularios\Archivo\Unitlocalidades.pas' {localidades},
  Unitrecibosventa in 'Formularios\Ventas\Unitrecibosventa.pas' {recibosventa},
  UnitDocumentoBase in 'Formularios\Ventas\UnitDocumentoBase.pas' {DocumentoBase},
  UnitListaDocumentos in 'Formularios\Ventas\UnitListaDocumentos.pas' {listadocumentos},
  UnitListaContratosVentas in 'Formularios\Ventas\UnitListaContratosVentas.pas' {listacontratosventa},
  UnitContrato in 'Formularios\Ventas\UnitContrato.pas' {contrato},
  Unitlistaespeciesvariedades in 'Formularios\Archivo\Unitlistaespeciesvariedades.pas' {listaespeciesvariedades},
  UnitListaOrdendeCarga in 'Formularios\Ventas\UnitListaOrdendeCarga.pas' {listaordendecarga},
  UnitOrdenDeCarga in 'Formularios\Ventas\UnitOrdenDeCarga.pas' {OrdendeCarga},
  UnitDocumentosVentasPendientes in 'Formularios\Ventas\UnitDocumentosVentasPendientes.pas' {DocumentosVentasPendientes},
  UnitDocumentosPendientes in 'Formularios\Ventas\UnitDocumentosPendientes.pas' {DocumentosPendientes},
  UnitListaContratos in 'Formularios\Ventas\UnitListaContratos.pas' {listacontratos},
  UnitContratoVenta in 'Formularios\Ventas\UnitContratoVenta.pas' {contratoventa},
  UnitRecibo in 'Formularios\UnitRecibo.pas' {Recibo},
  Unitlistarecibos in 'Formularios\Unitlistarecibos.pas' {ListaRecibos},
  UnitCargarPagos in 'Formularios\UnitCargarPagos.pas' {CargarPagos},
  UnitNotaCreditoVenta in 'Formularios\UnitNotaCreditoVenta.pas' {NotaCreditoVenta},
  UnitlistaNotasCreditoVentas in 'Formularios\UnitlistaNotasCreditoVentas.pas' {ListaNotasCreditoVenta},
  UnitNotaDebitoVenta in 'Formularios\UnitNotaDebitoVenta.pas' {NotaDebitoVenta},
  UnitlistaNotasDebitoVentas in 'Formularios\UnitlistaNotasDebitoVentas.pas' {ListaNotasDebitoVenta},
  UnitlistaFacturasVentas in 'Formularios\UnitlistaFacturasVentas.pas' {ListaFacturasVenta},
  UnitFacturaVenta in 'Formularios\UnitFacturaVenta.pas' {FacturaVenta},
  UnitDocumentosDineroPendientes in 'Formularios\UnitDocumentosDineroPendientes.pas' {DocumentosDineroPendientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinc, Princ);
  Application.CreateForm(TFacturaVenta, FacturaVenta);
  Application.CreateForm(TDocumentosDineroPendientes, DocumentosDineroPendientes);
  Application.Run;
end.
