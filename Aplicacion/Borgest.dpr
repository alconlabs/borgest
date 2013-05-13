program Borgest;

uses
  Forms,
  UnitPrinc in 'Formularios\UnitPrinc.pas' {Princ},
  Unitvendedores in 'Formularios\Archivo\Unitvendedores.pas' {vendedores},
  Unitlistasolicitudes in 'Formularios\Ventas\Unitlistasolicitudes.pas' {listasolicitudes},
  Unitlistaclientes in 'Formularios\Ventas\Unitlistaclientes.pas' {listaclientes},
  Unitsolicitudes in 'Formularios\Ventas\Unitsolicitudes.pas' {solicitudes},
  Unitestadodectas in 'Formularios\Ventas\Unitestadodectas.pas' {estadoctas},
  Unitventadetalle in 'Formularios\Ventas\Unitventadetalle.pas' {ventadetalle},
  UnitClientes in 'Formularios\Ventas\UnitClientes.pas' {clientes},
  Unitcobros in 'Formularios\Ventas\Unitcobros.pas' {Cobros},
  Unitemisionrecibos in 'Formularios\Ventas\Unitemisionrecibos.pas' {emisionrecibos},
  Unitlocalidades in 'Formularios\Archivo\Unitlocalidades.pas' {localidades},
  Unitconsultarvencidos in 'Formularios\Ventas\Unitconsultarvencidos.pas' {consultarvencidos},
  Unitsolicitudesmodificar in 'Formularios\Ventas\Unitsolicitudesmodificar.pas' {solicitudesmodificar},
  Unitgeneranuevasolicitud in 'Formularios\Ventas\Unitgeneranuevasolicitud.pas' {generanuevasolicitud},
  Unitcobradores in 'Formularios\Archivo\Unitcobradores.pas' {cobradores},
  Unitlistaproductos in 'Formularios\Archivo\Unitlistaproductos.pas' {listaproductos},
  UnitProductos in 'Formularios\Archivo\UnitProductos.pas' {productos},
  Unitlistafacturasventa in 'Formularios\Ventas\Unitlistafacturasventa.pas' {listafacturasventa},
  Unitfacturascompra in 'Formularios\Compras\Unitfacturascompra.pas' {facturacompra},
  Unitcalculoprecio in 'Formularios\Archivo\Unitcalculoprecio.pas' {calculoprecio},
  Unitlistapoliticasprecios in 'Formularios\Archivo\Unitlistapoliticasprecios.pas' {listapoliticasprecios},
  UnitPoliticasPrecios in 'Formularios\Archivo\UnitPoliticasPrecios.pas' {politicasprecios},
  UnitCargarPagos in 'Formularios\Ventas\UnitCargarPagos.pas' {CargarPagos},
  Unitlistarecibosventa in 'Formularios\Ventas\Unitlistarecibosventa.pas' {listarecibosventa},
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
  Unitlistacalculoprecios in 'Formularios\Archivo\Unitlistacalculoprecios.pas' {listacalculoprecios},
  UnitEmpresa in 'Formularios\Archivo\UnitEmpresa.pas' {empresa},
  Unitventadetalle2 in 'Formularios\Ventas\Unitventadetalle2.pas' {ventadetalle2},
  Unitbusquedaproductos in 'Formularios\Archivo\Unitbusquedaproductos.pas' {busquedaproductos},
  Unitlistaservicios in 'Formularios\Archivo\Unitlistaservicios.pas' {listaservicios},
  UnitServicios in 'Formularios\Archivo\UnitServicios.pas' {servicios},
  Unitfacturaventarapida in 'Formularios\Ventas\Unitfacturaventarapida.pas' {facturasventarapida},
  Unitlistabase in 'Formularios\Unitlistabase.pas' {listabase},
  UnitABMbase in 'Formularios\UnitABMbase.pas' {ABMbase},
  UnitListaTiposDocumentos in 'Formularios\Archivo\UnitListaTiposDocumentos.pas' {listatiposdocumentos},
  UnitEstadoCaja in 'Formularios\Caja\UnitEstadoCaja.pas' {EstadoCaja},
  Unitlistacontrataciones in 'Formularios\Ventas\Unitlistacontrataciones.pas' {listacontrataciones},
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
  UnitObservaciones in 'Formularios\Ventas\UnitObservaciones.pas' {observaciones};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinc, Princ);
  Application.CreateForm(Tliquidacionessucu, liquidacionessucu);
  Application.CreateForm(Tobservaciones, observaciones);
  Application.Run;
end.
