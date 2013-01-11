unit UnitDocumentoVentaExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitfacturasventa, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel, DBAdvEd, AdvEdit, AdvEdBtn, EditCodi, AdvMoneyEdit, Math,
  GBTEdit, Menus, AdvMenus, AdvGlowButton, ZAbstractTable;

type
  TDocumentoVentaExcel = class(Tfacturasventa)
    producto_id: TEditCodi;
    Label14: TLabel;
    producto_nombre: TEdit;
    Label16: TLabel;
    ventadetalle_preciounitario: TDBAdvEdit;
    btnguardarlinea: TButton;
    DTSDocumentosventas: TDataSource;
    DBGrid3: TDBGrid;
    ZQDocumentosventas: TZQuery;
    ZQIngresos: TZQuery;
    DSCIngresos: TDataSource;
    ZQEgresos: TZQuery;
    DSCEgresos: TDataSource;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    DBGrid4: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SubTotal_ingresos: TAdvMoneyEdit;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    DBGrid5: TDBGrid;
    Button7: TButton;
    Button6: TButton;
    Button5: TButton;
    SubTotal_egresos: TAdvMoneyEdit;
    Label19: TLabel;
    total_caja: TAdvMoneyEdit;
    btnvercaja: TButton;
    Label20: TLabel;
    SubTotal_ventas: TAdvMoneyEdit;
    btnborrarventa: TButton;
    btnbuscarclientes: TButton;
    btnagregarcliente: TButton;
    cliente_nombre: TGTBEdit;
    documentopago_importe: TDBAdvEdit;
    Label21: TLabel;
    ZTcajaasientosIngreso: TZTable;
    ZTcajaasientosIngresocajaasiento_id: TIntegerField;
    ZTcajaasientosIngresocajaasiento_descripcion: TStringField;
    ZTcajaasientosIngresocajaasiento_tipo: TStringField;
    ZTcajaasientosIngresocajaasiento_fecha: TDateField;
    ZTcajaasientosIngresocajaasiento_importe: TFloatField;
    ZTcajaasientosIngresoconcepto_id: TIntegerField;
    ZTconceptos: TZTable;
    ZTconceptosconcepto_id: TIntegerField;
    ZTconceptosconcepto_descripcion: TStringField;
    ZTcajaasientosIngresoconcepto_descripcion: TStringField;
    ZQIngresoscajaasiento_id: TIntegerField;
    ZQIngresoscajaasiento_descripcion: TStringField;
    ZQIngresoscajaasiento_tipo: TStringField;
    ZQIngresoscajaasiento_fecha: TDateField;
    ZQIngresoscajaasiento_importe: TFloatField;
    ZQIngresosconcepto_id: TIntegerField;
    ZQIngresosconcepto_descripcion: TStringField;
    btnguardaringresos: TButton;
    ZTcajaasientosEgreso: TZTable;
    btnguargaregresos: TButton;
    ZTcajaasientosEgresocajaasiento_id: TIntegerField;
    ZTcajaasientosEgresocajaasiento_descripcion: TStringField;
    ZTcajaasientosEgresocajaasiento_tipo: TStringField;
    ZTcajaasientosEgresocajaasiento_fecha: TDateField;
    ZTcajaasientosEgresocajaasiento_importe: TFloatField;
    ZTcajaasientosEgresoconcepto_id: TIntegerField;
    ZTcajaasientosEgresoconcepto_descripcion: TStringField;
    btnimprimir: TButton;
    procedure btnguardarlineaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnvercajaClick(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure producto_idClickBtn(Sender: TObject);
    procedure btnborrarventaClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnbuscarclientesClick(Sender: TObject);
    procedure cliente_nombreKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarclienteClick(Sender: TObject);
    procedure producto_idAfterSearch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSCIngresosDataChange(Sender: TObject; Field: TField);
    procedure ZTcajaasientosIngresoconcepto_descripcionChange(Sender: TField);
    procedure btnguardaringresosClick(Sender: TObject);
    procedure btnguargaregresosClick(Sender: TObject);
    procedure ZTcajaasientosEgresoconcepto_descripcionChange(Sender: TField);
    procedure DSCEgresosDataChange(Sender: TObject; Field: TField);
    procedure btnimprimirClick(Sender: TObject);
    procedure DBGrid4KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure documentoventa_fechaExit(Sender: TObject);
    procedure cliente_nombreExit(Sender: TObject);
    procedure ventadetalle_preciounitarioExit(Sender: TObject);
  private
    { Private declarations }
    cajaasiento_idsiguiente:integer;
    llenando_campos_ingresos:boolean;
    llenando_campos_egresos:boolean;
    procedure CalcularTotalIngresos;
    procedure CalcularTotalEgresos;
    procedure CalcularTotalVentas;
    procedure CalcularTotal;
  public
    { Public declarations }
  end;

var
  DocumentoVentaExcel: TDocumentoVentaExcel;

implementation

uses Unitventadetalle2, UnitPrinc, Unitbusquedaproductos, UnitBusquedaClientes,
  UnitClientes, Unitrecibosventa;

{$R *.dfm}

procedure TDocumentoVentaExcel.CalcularTotalIngresos;
begin
    SubTotal_ingresos.Text:=floattostr(roundto(0.00,-2));
    ZQIngresos.First;
    while not ZQIngresos.Eof do
        begin
            SubTotal_ingresos.Text:=floattostr(strtofloat(SubTotal_ingresos.Text)+ZQIngresos.FieldByName('cajaasiento_importe').AsFloat);

            ZQIngresos.Next;
        end;
end;

procedure TDocumentoVentaExcel.CalcularTotalEgresos;
begin
    SubTotal_egresos.Text:=floattostr(0.0);
    ZQEgresos.First;
    while not ZQEgresos.Eof do
        begin
            SubTotal_egresos.Text:=floattostr(strtofloat(SubTotal_egresos.Text)+ZQEgresos.FieldByName('cajaasiento_importe').AsFloat);

            ZQEgresos.Next;
        end;
end;

procedure TDocumentoVentaExcel.CalcularTotalVentas;
begin
    SubTotal_ventas.Text:=floattostr(0.0);
    ZQDocumentosventas.First;
    while not ZQDocumentosventas.Eof do
        begin
            SubTotal_ventas.Text:=floattostr(strtofloat(SubTotal_ventas.Text)+ZQDocumentosventas.FieldByName('documentoventa_pagado').AsFloat);

            ZQDocumentosventas.Next;
        end;
end;



procedure TDocumentoVentaExcel.cliente_nombreExit(Sender: TObject);
var
  key:char;
begin
  inherited;
    key:=#13;
    cliente_nombre.OnKeyPress(self,key);
end;

procedure TDocumentoVentaExcel.cliente_nombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if key=#13 then
      begin
          try
            clientes:=Tclientes.Create(self);
          finally
            clientes.abm:=1;
            clientes.OnShow(self);
            clientes.cliente_nombre.Text:=cliente_nombre.Text;
            clientes.btnguardar.Click;
            btnvercaja.Click;
            cliente_id.Buscar(clientes.id);
            clientes.Close;
            btnbuscarclientes.SetFocus;
          end;
      end;

    if key=#27 then
      btnvercaja.Click;


end;

procedure TDocumentoVentaExcel.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
    if ZQDocumentosventas.Active then
      begin
          if ZQDocumentosventas.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQDocumentosventas.FieldByName('documentoventa_id').AsString,ZQDocumentosventas.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TDocumentoVentaExcel.DBGrid4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if key=#13 then
      begin
          if ZTcajaasientosIngreso.UpdatesPending then
            begin
                try
                  ZTcajaasientosIngreso.ApplyUpdates;
                  btnvercaja.Click;
                finally
                end;

            end;

      end;

end;

procedure TDocumentoVentaExcel.DBGrid5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if key=#13 then
      begin
          if ZTcajaasientosEgreso.UpdatesPending then
            begin
                try
                  ZTcajaasientosEgreso.ApplyUpdates;
                  btnvercaja.Click;
                finally
                end;

            end;

      end;
end;

procedure TDocumentoVentaExcel.documentoventa_fechaExit(Sender: TObject);
begin
  inherited;
    btnguardarlinea.Enabled:=true;

    if documentoventa_fecha.Date<>Date then
      btnguardarlinea.Enabled:=false;
end;

procedure TDocumentoVentaExcel.DSCEgresosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    btnguargaregresos.Enabled:=ZTcajaasientosEgreso.UpdatesPending;
end;

procedure TDocumentoVentaExcel.DSCIngresosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    btnguardaringresos.Enabled:=ZTcajaasientosIngreso.UpdatesPending;
end;

procedure TDocumentoVentaExcel.CalcularTotal;
begin
    CalcularTotalIngresos;
    CalcularTotalEgresos;
    CalcularTotalVentas;
    total_caja.Text:=floattostr(roundto(strtofloat(SubTotal_ingresos.Text)-strtofloat(SubTotal_egresos.Text)+strtofloat(SubTotal_ventas.Text),-2));



end;


procedure TDocumentoVentaExcel.btnagregarclienteClick(Sender: TObject);
begin
  inherited;
    cliente_id.Visible:=false;
    cliente_nombre.Visible:=true;
    cliente_nombre.SetFocus;
end;

procedure TDocumentoVentaExcel.btnborrarventaClick(Sender: TObject);
begin
  inherited;
    if ZQDocumentosventas.Active then
      begin
          if ZQDocumentosventas.RecordCount>0 then
            begin
                Self.id:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                Self.abm:=3;
                btnguardar.Click;
            end;
      end;
end;

procedure TDocumentoVentaExcel.btnbuscarclientesClick(Sender: TObject);
begin
  inherited;
    busquedaclientes:=Tbusquedaclientes.Create(self);
    busquedaclientes.campo_id:='cliente_id';
    if busquedaclientes.ShowModal=mrOk then
      begin
          cliente_id.Buscar(busquedaclientes.id);
      end;
end;

procedure TDocumentoVentaExcel.btnguardaringresosClick(Sender: TObject);
begin
  inherited;
    if ZTcajaasientosIngreso.UpdatesPending then
      begin
          ZTcajaasientosIngreso.ApplyUpdates;
          btnvercaja.Click;
      end;


end;

procedure TDocumentoVentaExcel.btnguardarlineaClick(Sender: TObject);
begin
    if (ventadetalle_preciounitario.FloatValue>0) and (producto_nombre.Text<>'') then
      begin
          inherited;
            try
              ventadetalle2:= Tventadetalle2.Create(self);
            finally
              ventadetalle2.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
              ventadetalle2.ventadeta_cantidad.Text:='1';
              ventadetalle2.producto_id.Search(producto_id.Text);
              ventadetalle2.producto_nombre.Text:=producto_nombre.Text;
              ventadetalle2.ventadetalle_preciounitario.Text:=ventadetalle_preciounitario.Text;
              ventadetalle2.calculartotal;
              ventadetalle2.CargarQuery;
              princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, ventadetalle2.ZQDocumentoventadetalles);
            end;
            ventadetalle2.Free;
            calculartotales;

            ZQDocumentopagos.Insert;
            ZQDocumentopagos.FieldByName('documentopago_id').AsString:='0';
            ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:='EFECTIVO';
            ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=documentopago_importe.Text;
            ZQDocumentopagos.FieldByName('tipopago_id').AsString:='1';
            ZQDocumentopagos.FieldByName('tipopago_nombre').AsString:='EFECTIVO';
            ZQDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
            ZQDocumentopagos.Post;

            calculartotalpagos;
            btnguardar.Click;
            btnvercaja.Click;
      end
    else
      begin
          try
            recibosventa:=Trecibosventa.Create(self);
          finally
            recibosventa.abm:=1;

            recibosventa.OnShow(self);

            recibosventa.cliente_id.Buscar(cliente_id.codigo);
            recibosventa.personal_id.Buscar(personal_id.codigo);

            recibosventa.ZQDocumentopagos.Insert;
            recibosventa.ZQDocumentopagos.FieldByName('documentopago_id').AsString:='0';
            recibosventa.ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:='EFECTIVO';
            recibosventa.ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=documentopago_importe.Text;
            recibosventa.ZQDocumentopagos.FieldByName('tipopago_id').AsString:='1';
            recibosventa.ZQDocumentopagos.FieldByName('tipopago_nombre').AsString:='EFECTIVO';
            recibosventa.ZQDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
            recibosventa.ZQDocumentopagos.Post;

            recibosventa.calculartotalpagos;

            recibosventa.btntomardocumentosAuto.Click;

            recibosventa.btnguardar.Click;

            try
              recibosventa.Free;
            except
            end;



          end;

      end;
end;

procedure TDocumentoVentaExcel.btnguargaregresosClick(Sender: TObject);
begin
  inherited;
        if ZTcajaasientosEgreso.UpdatesPending then
      begin
          ZTcajaasientosEgreso.ApplyUpdates;
          btnvercaja.Click;
      end;
end;

procedure TDocumentoVentaExcel.btnimprimirClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\caja.rep';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from cajaasientos '+
                                                   'inner join conceptos on cajaasientos.concepto_id=conceptos.concepto_id '+
                                                   'where cajaasiento_tipo="INGRESO" and '+
                                                   'cajaasiento_fecha="'+formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date)+'"';

    Princ.VCLReport1.Report.Datainfo.Items[1].sql:='select * from cajaasientos '+
                                                   'inner join conceptos on cajaasientos.concepto_id=conceptos.concepto_id '+
                                                   'where cajaasiento_tipo="EGRESO" and '+
                                                   'cajaasiento_fecha="'+formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date)+'"';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select * from documentosventas '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join personal on documentosventas.personal_id=personal.personal_id '+
                                                   'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tipodocu_nombre="Factura de Venta" '+Princ.empresa_where+
                                                   'and documentoventa_estado<>"ANULADA" '+
                                                   'and documentosventas.documentoventa_fecha="'+formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date)+'"'+
                                                   'group by documentosventas.documentoventa_id';

    Princ.VCLReport1.Report.Params.ParamByName('total_caja').AsString:=total_caja.Text;


    Princ.VCLReport1.Execute;
end;

procedure TDocumentoVentaExcel.btnvercajaClick(Sender: TObject);
begin
  inherited;
    cliente_id.Visible:=true;
    cliente_nombre.Visible:=false;
    cliente_nombre.Top:=cliente_id.Top;
    cliente_id.llenarcombo;
    ZQIngresos.Active:=false;
    ZQIngresos.ParamByName('cajaasiento_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQIngresos.Active:=true;

    ZQEgresos.Active:=false;
    ZQEgresos.ParamByName('cajaasiento_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQEgresos.Active:=true;

    ZQDocumentosventas.Active:=false;
    ZQDocumentosventas.SQL.Text:='select * from documentosventas '+
                                 'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                 'inner join personal on documentosventas.personal_id=personal.personal_id '+
                                 'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                 'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                 'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                 'where documentosventas.documentoventa_fecha=:documentoventa_fecha '+
                                 'and tipodocu_nombre="Factura de Venta" '+
                                 'and documentoventa_estado<>"ANULADA" '+Princ.empresa_where+
                                 'group by documentosventas.documentoventa_id ';

    ZQDocumentosventas.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQDocumentosventas.Active:=true;

    ZTconceptos.Active:=false;
    ZTconceptos.Active:=true;

    ZTcajaasientosIngreso.Active:=false;
    ZTcajaasientosIngreso.Active:=true;

    ZTcajaasientosIngreso.Filtered:=false;
    ZTcajaasientosIngreso.Filter:='cajaasiento_tipo='+quotedstr('INGRESO')+' and cajaasiento_fecha='+quotedstr(formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date));
    ZTcajaasientosIngreso.Filtered:=true;

    ZTcajaasientosEgreso.Active:=false;
    ZTcajaasientosEgreso.Active:=true;

    ZTcajaasientosEgreso.Filtered:=false;
    ZTcajaasientosEgreso.Filter:='cajaasiento_tipo='+quotedstr('EGRESO')+' and cajaasiento_fecha='+quotedstr(formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date));
    ZTcajaasientosEgreso.Filtered:=true;

    CalcularTotal;

    btnguardarlinea.Enabled:=true;

    if documentoventa_fecha.Date<>date then
      btnguardarlinea.Enabled:=false;

    if producto_id.Text='' then
      producto_id.Search(Princ.buscar('select min(producto_id) as id from productos','id'));

end;

procedure TDocumentoVentaExcel.Button2Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoCajaAsientoIngreso;
    btnvercaja.Click;
end;

procedure TDocumentoVentaExcel.Button3Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirModificarCajaAsientoIngreso(ZQIngresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TDocumentoVentaExcel.Button4Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirEliminarCajaAsiento(ZQIngresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TDocumentoVentaExcel.Button5Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoCajaAsientoEgreso;
    btnvercaja.Click;
end;

procedure TDocumentoVentaExcel.Button6Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirModificarCajaAsientoEgreso(ZQEgresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TDocumentoVentaExcel.Button7Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirEliminarCajaAsiento(ZQEgresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TDocumentoVentaExcel.FormCreate(Sender: TObject);
begin
  inherited;
    cajaasiento_idsiguiente:=0;
    llenando_campos_ingresos:=false;
end;

procedure TDocumentoVentaExcel.FormShow(Sender: TObject);
begin
  inherited;
    btnvercaja.Click;
    btnherramientas.Visible:=false;
end;

procedure TDocumentoVentaExcel.producto_idAfterSearch(Sender: TObject);
begin
  inherited;
     ventadetalle_preciounitario.Text:='0';
     documentopago_importe.Text:=ventadetalle_preciounitario.Text;
//    ventadetalle_preciounitario.Text:=producto_id.valor('producto_precioventa'+inttostr(documentoventa_listaprecio.ItemIndex+1));
//    documentopago_importe.Text:=ventadetalle_preciounitario.Text;
end;

procedure TDocumentoVentaExcel.producto_idClickBtn(Sender: TObject);
begin
    busquedaproductos:=Tbusquedaproductos.Create(self);
    if busquedaproductos.ShowModal=mrOk then
      begin
          producto_id.Search(busquedaproductos.producto_id);

      end;

    busquedaproductos.Free;

end;

procedure TDocumentoVentaExcel.ventadetalle_preciounitarioExit(Sender: TObject);
begin
  inherited;
    documentopago_importe.Text:=ventadetalle_preciounitario.Text;
end;

procedure TDocumentoVentaExcel.ZQuery2AfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=1 then
      begin
          ventadetalle_preciounitario.Text:='0';
          documentopago_importe.Text:=ventadetalle_preciounitario.Text;

      end;
end;

procedure TDocumentoVentaExcel.ZTcajaasientosEgresoconcepto_descripcionChange(
  Sender: TField);
begin
  inherited;
        if (ZTcajaasientosEgreso.State=dsInsert) and (not llenando_campos_egresos) then
      begin
          llenando_campos_egresos:=true;
          if cajaasiento_idsiguiente=0 then
            cajaasiento_idsiguiente:=strtoint(Princ.codigo('cajaasientos','cajaasiento_id'))
          else
            cajaasiento_idsiguiente:=cajaasiento_idsiguiente+1;

          ZTcajaasientosEgreso.FieldByName('cajaasiento_id').AsInteger:=cajaasiento_idsiguiente;
          ZTcajaasientosEgreso.FieldByName('cajaasiento_fecha').AsDateTime:=documentoventa_fecha.Date;
          ZTcajaasientosEgreso.FieldByName('cajaasiento_tipo').AsString:='EGRESO';

          llenando_campos_egresos:=false;
      end;
end;

procedure TDocumentoVentaExcel.ZTcajaasientosIngresoconcepto_descripcionChange(
  Sender: TField);
begin
  inherited;
    if (ZTcajaasientosIngreso.State=dsInsert) and (not llenando_campos_ingresos) then
      begin
          llenando_campos_ingresos:=true;
          if cajaasiento_idsiguiente=0 then
            cajaasiento_idsiguiente:=strtoint(Princ.codigo('cajaasientos','cajaasiento_id'))
          else
            cajaasiento_idsiguiente:=cajaasiento_idsiguiente+1;

          ZTcajaasientosIngreso.FieldByName('cajaasiento_id').AsInteger:=cajaasiento_idsiguiente;
          ZTcajaasientosIngreso.FieldByName('cajaasiento_fecha').AsDateTime:=documentoventa_fecha.Date;
          ZTcajaasientosIngreso.FieldByName('cajaasiento_tipo').AsString:='INGRESO';

          llenando_campos_ingresos:=false;
      end;
end;

end.
