program Borgest;

uses
  Forms,
  UnitPrinc in 'Formularios\UnitPrinc.pas' {Princ},
  Unitestadodectas in 'Formularios\Ventas\Unitestadodectas.pas' {estadoctas},
  Unitventadetalle in 'Formularios\Ventas\Unitventadetalle.pas' {ventadetalle},
  UnitClientes in 'Formularios\Ventas\UnitClientes.pas' {clientes},
  UnitProductos in 'Formularios\Archivo\UnitProductos.pas' {productos},
  Unitcalculoprecio in 'Formularios\Archivo\Unitcalculoprecio.pas' {calculoprecio},
  UnitPoliticasPrecios in 'Formularios\Archivo\UnitPoliticasPrecios.pas' {politicasprecios},
  UnitCargarPagos in 'Formularios\Ventas\UnitCargarPagos.pas' {CargarPagos},
  Unitrecibosventa in 'Formularios\Ventas\Unitrecibosventa.pas' {recibosventa},
  UnitDocumentosVentasPendientes in 'Formularios\Ventas\UnitDocumentosVentasPendientes.pas' {DocumentosVentasPendientes},
  Unitdetallectas in 'Formularios\Ventas\Unitdetallectas.pas' {detallectas},
  UnitImpresoraFiscal in 'Formularios\Ventas\UnitImpresoraFiscal.pas' {impresorafiscal},
  UnitConfiguracion in 'Formularios\Herramientas\UnitConfiguracion.pas' {configuracion},
  UnitImpresoraFiscalcola in 'Formularios\Ventas\UnitImpresoraFiscalcola.pas' {impresorafiscalcola},
  Unitlistanotacreditoventa in 'Formularios\Ventas\Unitlistanotacreditoventa.pas' {listanotacreditoventa},
  UnitActualizarProductos in 'Formularios\Archivo\UnitActualizarProductos.pas' {ActualizarProductos},
  Unitlistaproveedores in 'Formularios\Compras\Unitlistaproveedores.pas' {listaproveedores},
  UnitProveedores in 'Formularios\Compras\UnitProveedores.pas' {proveedores},
  Unitventadetalle2 in 'Formularios\Ventas\Unitventadetalle2.pas' {ventadetalle2},
  Unitbusquedaproductos in 'Formularios\Archivo\Unitbusquedaproductos.pas' {busquedaproductos},
  UnitServicios in 'Formularios\Archivo\UnitServicios.pas' {servicios},
  Unitfacturaventarapida in 'Formularios\Ventas\Unitfacturaventarapida.pas' {facturasventarapida},
  Unitlistabase in 'Formularios\Unitlistabase.pas' {listabase},
  UnitABMbase in 'Formularios\UnitABMbase.pas' {ABMbase},
  UnitListaTiposDocumentos in 'Formularios\Archivo\UnitListaTiposDocumentos.pas' {listatiposdocumentos},
  UnitEstadoCaja in 'Formularios\Caja\UnitEstadoCaja.pas' {EstadoCaja},
  UnitCajaAsiento in 'Formularios\Caja\UnitCajaAsiento.pas' {CajaAsiento},
  UnitCajaAsientoIngreso in 'Formularios\Caja\UnitCajaAsientoIngreso.pas' {CajaAsientoIngreso},
  UnitcajaAsientoEgreso in 'Formularios\Caja\UnitcajaAsientoEgreso.pas' {CajaAsientoEgreso},
  UnitProgresoBase in 'Formularios\UnitProgresoBase.pas' {ProgresoBase},
  UnitActualizarSistema in 'Formularios\Herramientas\UnitActualizarSistema.pas' {ABMbase1},
  Unitcalculoprecioproducto in 'Formularios\Archivo\Unitcalculoprecioproducto.pas' {calculoprecioproductos},
  Unitdocumentoventabase in 'Formularios\Ventas\Unitdocumentoventabase.pas' {documentoventabase},
  Unitfacturaventasuperrapida in 'Formularios\Ventas\Unitfacturaventasuperrapida.pas' {facturaventasuperrapida},
  UnitMostrarExcel in 'Formularios\Archivo\UnitMostrarExcel.pas' {MostrarExcel},
  UnitDocumentoVentaExcel in 'Formularios\Ventas\UnitDocumentoVentaExcel.pas' {DocumentoVentaExcel},
  UnitMenuConfig in 'Formularios\Herramientas\UnitMenuConfig.pas' {MenuConfig},
  UnitNotaPedido in 'Formularios\Ventas\UnitNotaPedido.pas' {NotaPedido},
  UnitListaNotasPedido in 'Formularios\Ventas\UnitListaNotasPedido.pas' {ListaNotasPedido},
  UnitNotaPedidoDetalle in 'Formularios\Ventas\UnitNotaPedidoDetalle.pas' {NotapedidoDetalle},
  UnitConsultaEquipos in 'Formularios\Ventas\UnitConsultaEquipos.pas' {ConsultaEquipos},
  Unitbusquedabase in 'Formularios\Unitbusquedabase.pas' {busquedabase},
  UnitBusquedaClientes in 'Formularios\Ventas\UnitBusquedaClientes.pas' {busquedaclientes},
  UnitProductosBasico in 'Formularios\Archivo\UnitProductosBasico.pas' {ProductosBasico},
  UnitListaSucursales in 'Formularios\Archivo\UnitListaSucursales.pas' {listasucursales},
  UnitListaPuntosdeVenta in 'Formularios\Archivo\UnitListaPuntosdeVenta.pas' {listapuntosdeventa},
  UnitTipoDocumento in 'Formularios\Archivo\UnitTipoDocumento.pas' {tipodocumento},
  UnitFacturarDocumentos in 'Formularios\Ventas\UnitFacturarDocumentos.pas' {FacturarDocumentos},
  UnitPersonal in 'Formularios\Archivo\UnitPersonal.pas' {personal},
  UnitListaPerfiles in 'Formularios\Archivo\UnitListaPerfiles.pas' {ListaPerfiles},
  UnitPerfil in 'Formularios\Herramientas\UnitPerfil.pas' {Perfil},
  Unitsaldoclientes in 'Formularios\Ventas\Unitsaldoclientes.pas' {saldoclientes},
  Unitlistafacturascompra in 'Formularios\Compras\Unitlistafacturascompra.pas' {listafacturascompra},
  Unitfacturasventa in 'Formularios\Ventas\Unitfacturasventa.pas' {facturasventa},
  UnitListaServices in 'Formularios\Ventas\UnitListaServices.pas' {Listaservices},
  UnitABMInibase in 'Formularios\UnitABMInibase.pas' {ABMInibase},
  Unitinformesventas in 'Formularios\Ventas\Unitinformesventas.pas' {InformesVentas},
  UnitOrdenServicio in 'Formularios\Ventas\UnitOrdenServicio.pas' {ordenservicio},
  UnitListaOrdenesServicios in 'Formularios\Ventas\UnitListaOrdenesServicios.pas' {ListaOrdenesServicios},
  UnitImprimirListaPrecios in 'UnitImprimirListaPrecios.pas' {ImprimirListaPrecios},
  UnitListaPresupuestos in 'Formularios\Ventas\UnitListaPresupuestos.pas' {ListaPresupuestos},
  UnitPresupuesto in 'Formularios\Ventas\UnitPresupuesto.pas' {presupuesto},
  Unitcompradetalle in 'Formularios\Compras\Unitcompradetalle.pas' {compradetalle},
  UnitDetallePagos in 'Formularios\Ventas\UnitDetallePagos.pas' {DetallePagos},
  UnitLibroIvaVentas in 'Formularios\Ventas\UnitLibroIvaVentas.pas' {LibroIvaVentas},
  UnitCajaBar in 'Formularios\Ventas\UnitCajaBar.pas' {CajaBar},
  UnitCajaApertura in 'Formularios\Caja\UnitCajaApertura.pas' {CajaApertura},
  UnitLogin in 'Formularios\UnitLogin.pas' {login},
  UnitLibroIvaCompras in 'Formularios\Compras\UnitLibroIvaCompras.pas' {LibroIvaCompras},
  Unitprovincias in 'Formularios\Archivo\Unitprovincias.pas' {provincias},
  UnitComisionesVendedores in 'Formularios\Comisiones\UnitComisionesVendedores.pas' {ComisionesVendedores},
  Unitvendedoresdebcred in 'Formularios\Comisiones\Unitvendedoresdebcred.pas' {vendedoresdebcred},
  Unitsucursalesdebcred in 'Formularios\Comisiones\Unitsucursalesdebcred.pas' {sucursalesdebcred},
  Unitnotacreditoventa in 'Formularios\Ventas\Unitnotacreditoventa.pas' {notacreditoventa},
  UnitListaNotaDebitoVenta in 'Formularios\Ventas\UnitListaNotaDebitoVenta.pas' {listanotadebitoventa},
  UnitNotaDebitoVenta in 'Formularios\Ventas\UnitNotaDebitoVenta.pas' {NotaDebitoVenta},
  UnitRemitoVenta in 'Formularios\Ventas\UnitRemitoVenta.pas' {remitoventa},
  UnitListaRemitoVenta in 'Formularios\Ventas\UnitListaRemitoVenta.pas' {listaremitosventa},
  Unitlistacomisionesvendedores in 'Formularios\Comisiones\Unitlistacomisionesvendedores.pas' {listacomisionesvendedores},
  Unitliquidaciones in 'Formularios\Comisiones\Unitliquidaciones.pas' {liquidaciones},
  UnitlistaComisionesSucursales in 'Formularios\Comisiones\UnitlistaComisionesSucursales.pas' {listacomisionessucursales},
  UnitComisionesSucursales in 'Formularios\Comisiones\UnitComisionesSucursales.pas' {ComisionesSucursales},
  Unitliquidacionessucu in 'Formularios\Comisiones\Unitliquidacionessucu.pas' {liquidacionessucu},
  UnitObservaciones in 'Formularios\Ventas\UnitObservaciones.pas' {observaciones},
  UnitNotadeCredito2 in 'Formularios\Ventas\UnitNotadeCredito2.pas' {NotadeCredito2},
  UnitListaDebCred in 'Formularios\Ventas\UnitListaDebCred.pas' {listaconceptosdebcred},
  UnitConceptoDebCred in 'Formularios\Archivo\UnitConceptoDebCred.pas' {ConceptoDebCred},
  UnitventadetalleConcepto in 'Formularios\Ventas\UnitventadetalleConcepto.pas' {ventadetalleconcepto},
  UnitNotadeDebito2 in 'Formularios\Ventas\UnitNotadeDebito2.pas' {NotadeDebito2},
  UnitEmpresa in 'Formularios\Archivo\UnitEmpresa.pas' {empresa},
  UnitBusquedaConceptosDebCred in 'Formularios\Archivo\UnitBusquedaConceptosDebCred.pas' {BusquedaConceptosDebCred},
  UnitAplicarRecibosPendientes in 'Formularios\Ventas\UnitAplicarRecibosPendientes.pas' {AplicarRecibosPendientes},
  UnitNotaPedidoComisiones in 'Formularios\Comisiones\UnitNotaPedidoComisiones.pas' {NotaPedidoComisiones},
  UnitListaNotasPedidoComisiones in 'Formularios\Comisiones\UnitListaNotasPedidoComisiones.pas' {ListaNotasPedidoComisiones},
  UnitListaClientes1 in 'Formularios\Archivo\UnitListaClientes1.pas' {ListaClientes1},
  UnitListaProductos1 in 'Formularios\Archivo\UnitListaProductos1.pas' {ListaProductos1},
  UnitListaCalculosPrecios1 in 'Formularios\Archivo\UnitListaCalculosPrecios1.pas' {ListaCalculosPrecios1},
  UnitListaPoliticasdePrecios in 'Formularios\Archivo\UnitListaPoliticasdePrecios.pas' {ListaPoliticasdePrecios},
  UnitListaProveedores1 in 'Formularios\Archivo\UnitListaProveedores1.pas' {ListaProveedores1},
  Unitlistalocalidades in 'Formularios\Archivo\Unitlistalocalidades.pas' {ListaLocalidades},
  UnitListaProvincias in 'Formularios\Archivo\UnitListaProvincias.pas' {ListaProvincias},
  UnitListaFacturasDeVenta in 'Formularios\Ventas\UnitListaFacturasDeVenta.pas' {ListaFacturasDeVenta},
  UnitListaRecibosdeVenta in 'Formularios\Ventas\UnitListaRecibosdeVenta.pas' {ListaRecibosdeVenta},
  UnitListaFacturasdeCompras in 'Formularios\Compras\UnitListaFacturasdeCompras.pas' {LIstaFacturasDeCompras},
  Unitfacturascompra in 'Formularios\Compras\Unitfacturascompra.pas' {facturacompra},
  UnitListaNotasCreditodeVentas in 'Formularios\Ventas\UnitListaNotasCreditodeVentas.pas' {ListaNotasCreditodeVentas},
  UnitListaTarjetasdeCredito in 'Formularios\Archivo\UnitListaTarjetasdeCredito.pas' {ListaTarjetasdeCredito},
  UnitTarjetaCredito in 'Formularios\Archivo\UnitTarjetaCredito.pas' {TarjetaCredito},
  UnitCargaDetallePagos in 'Formularios\Ventas\UnitCargaDetallePagos.pas' {CargaDetallePagos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Borgest - Sistema de Gestion Comercial';
  Application.CreateForm(TPrinc, Princ);
  Application.Run;
end.
