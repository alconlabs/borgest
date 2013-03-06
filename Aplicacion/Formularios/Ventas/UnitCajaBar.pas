unit UnitCajaBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids, DBAdvEd, AdvEdit, AdvEdBtn,
  EditCodi, ComCtrls, AdvMoneyEdit;

type
  TCajaBar = class(TABMbase)
    ZQDocumentosventas: TZQuery;
    DBGrid1: TDBGrid;
    DCSDocumentosventas: TDataSource;
    ZQDocumentoventadetalles: TZQuery;
    DSCDocumentoventadetalles: TDataSource;
    ZQDocumentoventa: TZQuery;
    Label1: TLabel;
    mozomesa: TEdit;
    btnabrirmesa: TButton;
    ZQDocumentopagos: TZQuery;
    Label3: TLabel;
    producto_id: TEditCodi;
    producto_nombre: TEdit;
    ventadetalle_preciounitario: TDBAdvEdit;
    btnagregardetalle: TButton;
    Label2: TLabel;
    caja_saldofinal: TDBAdvEdit;
    btncerrarmesa: TButton;
    btnfacturar: TButton;
    btnactualizar: TButton;
    btncerrarcaja: TButton;
    caja_estado: TLabel;
    PageControl1: TPageControl;
    TabVentas: TTabSheet;
    TabIngrEgr: TTabSheet;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SubTotal_ingresos: TAdvMoneyEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    DBGrid3: TDBGrid;
    Button7: TButton;
    Button6: TButton;
    Button5: TButton;
    SubTotal_egresos: TAdvMoneyEdit;
    ZQIngresos: TZQuery;
    DSCIngresos: TDataSource;
    ZQEgresos: TZQuery;
    DSCEgresos: TDataSource;
    btnpasarmesa: TButton;
    procedure DCSDocumentosventasDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnabrirmesaClick(Sender: TObject);
    procedure producto_idAfterSearch(Sender: TObject);
    procedure btnagregardetalleClick(Sender: TObject);
    procedure btncerrarmesaClick(Sender: TObject);
    procedure ZQDocumentosventasAfterOpen(DataSet: TDataSet);
    procedure btnfacturarClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure mozomesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure producto_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure producto_idKeyPress(Sender: TObject; var Key: Char);
    procedure producto_idClickBtn(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btncerrarcajaClick(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnpasarmesaClick(Sender: TObject);
  private
    { Private declarations }
    BARPUNTOVENTAID:string;
    BARTIPODOCUID:string;
    BARCLIENTEID:string;
    BARFACTURAPUNTOVENTAID:string;
    BARFACTURATIPODOCUID:string;
    caja_id:string;
    documentoventa_id_origen:string;
    documentoventa_id_destino:string;
    procedure ConvertirDocumentoVenta;
    procedure AbrirNuevaCaja;
    procedure HabilitarBotones(estado:boolean);
  public
    { Public declarations }
    producto_precioventa:string;
  end;

var
  CajaBar: TCajaBar;

implementation

Uses UnitPrinc, Unitventadetalle2, Unitbusquedaproductos, UnitCajaApertura;

{$R *.dfm}


procedure TCajaBar.HabilitarBotones(estado:boolean);
begin
    btnabrirmesa.Enabled:=estado;
    btncerrarmesa.Enabled:=estado;
    btnfacturar.Enabled:=estado;
    btnagregardetalle.Enabled:=estado;



end;

procedure TCajaBar.AbrirNuevaCaja;
begin
    CajaApertura:=TCajaApertura.Create(self);
    CajaApertura.liberar_al_cerrar:=false;
    if CajaApertura.ShowModal=mrOk then
      begin
          caja_id:=CajaApertura.caja_id;

          btnactualizar.Click;
      end;
    CajaApertura.Free;
end;

procedure TCajaBar.ConvertirDocumentoVenta;
var
  id_factura:string;
begin
  inherited;
    if (ZQDocumentosventas.FieldByName('documentoventa_estado').AsString='CERRADA') then
      begin
//          if (MessageDlg('Seguro desea facturar?', mtConfirmation, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
            begin
                ZQDocumentoventa.Active:=false;
                ZQDocumentoventa.ParamByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                ZQDocumentoventa.Active:=true;

                ZQDocumentoventa.Edit;
                ZQDocumentoventa.FieldByName('tipodocu_id').AsString:=BARFACTURATIPODOCUID;
                ZQDocumentoventa.FieldByName('documentoventa_estado').AsString:='PAGADA';
                ZQDocumentoventa.FieldByName('documentoventa_numero').AsString:=Princ.NumeroDocumento(BARFACTURATIPODOCUID,'');
                ZQDocumentoventa.Post;

                Princ.ModificarDocumentoVenta(ZQDocumentoventa,nil,nil,nil);

            end;
      end;

end;

procedure TCajaBar.btnabrirmesaClick(Sender: TObject);
var
  personal_id:string;
  documentoventa_listaprecio:string;
  id_mesaabierta:string;
begin
  inherited;
    personal_id:=Princ.buscar('select personal_id from personal where personal_id="'+copy(mozomesa.Text,0,2)+'"','personal_id');
    if personal_id<>'' then
      begin
          ZQDocumentoventa.Active:=false;
          ZQDocumentoventa.ParamByName('documentoventa_id').AsString:='-1';
          ZQDocumentoventa.Active:=true;
          ZQDocumentoventa.Insert;
          ZQDocumentoventa.FieldByName('documentoventa_trabajorealizado').AsString:='';
          ZQDocumentoventa.FieldByName('documentoventa_solicitudcliente').AsString:='';
          ZQDocumentoventa.FieldByName('documentoventa_nrodetallepago').AsString:='';
          ZQDocumentoventa.FieldByName('documentoventa_formapago').AsString:='';
          ZQDocumentoventa.FieldByName('documentoventa_equipo2').AsString:='';
          ZQDocumentoventa.FieldByName('documentoventa_equipo1').AsString:='';
          ZQDocumentoventa.FieldByName('documentoventa_listaprecio').AsString:=princ.buscar('select cliente_listaprecio from clientes where cliente_id="'+BARCLIENTEID+'"','cliente_listaprecio');
          ZQDocumentoventa.FieldByName('documentoventa_fechavenc').AsDateTime:=Princ.fechaservidor;
          ZQDocumentoventa.FieldByName('documentoventa_condicionventa').AsString:=princ.buscar('select cliente_condicionventa from clientes where cliente_id="'+BARCLIENTEID+'"','cliente_condicionventa');
          ZQDocumentoventa.FieldByName('tipodocu_id').AsString:=BARTIPODOCUID;
          ZQDocumentoventa.FieldByName('personal_id').AsString:=personal_id;
          ZQDocumentoventa.FieldByName('cliente_id').AsString:=BARCLIENTEID;
          ZQDocumentoventa.FieldByName('documentoventa_observacion').AsString:=mozomesa.Text;
          ZQDocumentoventa.FieldByName('documentoventa_saldo').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_pagado').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_estado').AsString:='ABIERTA';
          ZQDocumentoventa.FieldByName('documentoventa_total').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_netonogravado').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_iva105').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_neto105').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_iva21').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_neto21').AsString:='0';
          ZQDocumentoventa.FieldByName('documentoventa_hora').AsDateTime:=Princ.horaservidor;
          ZQDocumentoventa.FieldByName('documentoventa_fecha').AsDateTime:=Princ.fechaservidor;
          ZQDocumentoventa.FieldByName('documentoventa_numero').AsString:=Princ.NumeroDocumento(BARTIPODOCUID,'');
          ZQDocumentoventa.FieldByName('documentoventa_id').AsString:=Princ.codigo('documentosventas','documentoventa_id');
          ZQDocumentoventa.FieldByName('caja_id').AsString:=caja_id;
          ZQDocumentoventa.Post;

          id_mesaabierta:=Princ.AgregarDocumentoVenta(ZQDocumentoventa,nil,nil,nil);

          btnactualizar.Click;
          ZQDocumentosventas.Locate('documentoventa_id',id_mesaabierta,[]);

          mozomesa.Text:='';

          producto_id.SetFocus;

//          caja_saldo.Text:=Princ.buscar('select sum(documentoventa_pagado) as pagos from documentosventas where tipodocu_id="'+BARTIPODOCUID+'" and documentoventa_estado<>"ANULADA"','pagos');
      end
    else
      begin
          mozomesa.SetFocus;
      end;


end;

procedure TCajaBar.btnactualizarClick(Sender: TObject);
var
  bm:TBookmark;
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('caja_id').AsString:=caja_id;
    ZQSelect.Active:=true;
    if caja_id='' then
      begin
          AbrirNuevaCaja;



      end
    else
      begin
          bm:=nil;
          if ZQDocumentosventas.Active then
            bm:=ZQDocumentosventas.GetBookmark;
          ZQDocumentosventas.Active:=false;
          ZQDocumentosventas.SQL.Text:='select * from documentosventas '+
                                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                       'inner join personal on documentosventas.personal_id=personal.personal_id '+
                                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                       'where documentosventas.tipodocu_id="'+BARTIPODOCUID+'" '+Princ.empresa_where+
                                       ' and documentosventas.caja_id="'+caja_id+'"'+
                                       ' and documentoventa_estado<>"ANULADA" '+
                                       ' order by documentoventa_id';

          ZQDocumentosventas.Active:=true;

          if bm<>nil then
            begin
                try
                  ZQDocumentosventas.GotoBookmark(bm);
                finally
                end;

            end;

          ZQIngresos.Active:=false;
          ZQIngresos.ParamByName('caja_id').AsString:=caja_id;
          ZQIngresos.Active:=true;

          ZQEgresos.Active:=false;
          ZQEgresos.ParamByName('caja_id').AsString:=caja_id;
          ZQEgresos.Active:=true;

      end;
    HabilitarBotones(caja_estado.Caption='ABIERTA');
end;

procedure TCajaBar.btnagregardetalleClick(Sender: TObject);
begin
  inherited;
    if (producto_id.Text<>'') and (ZQDocumentosventas.RecordCount>0) then
      begin
          if ZQDocumentosventas.FieldByName('documentoventa_estado').AsString='ABIERTA' then
            begin
                try
                  ventadetalle2:= Tventadetalle2.Create(self);
                finally
                  ventadetalle2.producto_precioventa:='1';
                  ventadetalle2.ventadeta_cantidad.Text:='1';
                  ventadetalle2.producto_id.Search(producto_id.Text);
                  ventadetalle2.producto_nombre.Text:=producto_nombre.Text;
                  ventadetalle2.ventadetalle_preciounitario.Text:=ventadetalle_preciounitario.Text;
                  ventadetalle2.calculartotal;
                  ventadetalle2.CargarQuery;
                  princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, ventadetalle2.ZQDocumentoventadetalles);
                end;
                ventadetalle2.Free;

                ZQDocumentoventa.Active:=false;
                ZQDocumentoventa.ParamByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                ZQDocumentoventa.Active:=true;
                Princ.ModificarDocumentoVenta(ZQDocumentoventa,ZQDocumentoventadetalles,nil,nil);

                btnactualizar.Click;

                producto_id.Text:='';
                producto_id.Search(producto_id.Text);

            end;

      end;
    producto_id.SetFocus;
end;

procedure TCajaBar.btncerrarcajaClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea cerrar la Caja?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          Princ.CerrarCaja(caja_id,caja_saldofinal.FloatValue);
      end;
end;

procedure TCajaBar.btncerrarmesaClick(Sender: TObject);
begin
  inherited;
    if (ZQDocumentosventas.RecordCount>0) then
      begin

          if (MessageDlg('Seguro desea cerrar esta mesa?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
            begin
                ZQDocumentopagos.Active:=false;
                ZQDocumentopagos.ParamByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                ZQDocumentopagos.Active:=true;

                ZQDocumentopagos.Insert;
                ZQDocumentopagos.FieldByName('documentopago_id').AsString:=Princ.codigo('documentopagos','documentopago_id');
                ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:='EFECTIVO';
                ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=ZQDocumentosventas.FieldByName('documentoventa_total').AsString;
                ZQDocumentopagos.FieldByName('tipopago_id').AsString:='1';
                ZQDocumentopagos.FieldByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                ZQDocumentopagos.Post;

                ZQDocumentoventa.Active:=false;
                ZQDocumentoventa.ParamByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                ZQDocumentoventa.Active:=true;

                ZQDocumentoventa.Edit;
                ZQDocumentoventa.FieldByName('documentoventa_estado').AsString:='CERRADA';
                ZQDocumentoventa.FieldByName('documentoventa_saldo').AsString:='0';
                ZQDocumentoventa.FieldByName('documentoventa_pagado').AsString:=ZQDocumentosventas.FieldByName('documentoventa_total').AsString;
                ZQDocumentoventa.Post;

                Princ.ModificarDocumentoVenta(ZQDocumentoventa,nil,nil,ZQDocumentopagos);

                if (MessageDlg('Desea imprimir?', mtConfirmation, [mbOK, mbCancel], 0)= mrOk ) then
                  Princ.ImprimirDocumentoVenta(ZQDocumentosventas.FieldByName('documentoventa_id').AsString);

                btnactualizar.Click;

            end;

      end;
end;

procedure TCajaBar.btnfacturarClick(Sender: TObject);
var
  id_factura:string;
begin
  inherited;
    if (ZQDocumentosventas.RecordCount>0) then
      begin
          if (ZQDocumentosventas.FieldByName('documentoventa_estado').AsString='CERRADA') then
            begin
                if (MessageDlg('Seguro desea facturar esta mesa?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                  begin
                      ZQDocumentoventa.Active:=false;
                      ZQDocumentoventa.ParamByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                      ZQDocumentoventa.Active:=true;

                      ZQDocumentoventa.Edit;
                      ZQDocumentoventa.FieldByName('documentoventa_estado').AsString:='FACTURADA';
                      ZQDocumentoventa.Post;

                      Princ.ModificarDocumentoVenta(ZQDocumentoventa,nil,nil,nil);

      //                if (MessageDlg('Desea imprimir?', mtConfirmation, [mbOK, mbCancel], 0) in [mrOk, mrCancel]) then
                        Princ.ImprimirDocumentoVenta(ZQDocumentosventas.FieldByName('documentoventa_id').AsString);

                      btnactualizar.Click;

                  end;

            end;

      end;

end;

procedure TCajaBar.btnpasarmesaClick(Sender: TObject);
begin
  inherited;
    if ZQDocumentosventas.FieldByName('documentoventa_estado').AsString='ABIERTA' then
      begin
          if documentoventa_id_origen='' then
            begin
                documentoventa_id_origen:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                btnpasarmesa.Caption:='Confirmar Paso de mesa';

            end
          else
            begin
                if ZQDocumentosventas.FieldByName('documentoventa_id').AsString<>documentoventa_id_origen then
                  begin
                      documentoventa_id_destino:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;

                      ZQDocumentoventadetalles.Active:=false;
                      if ZQDocumentosventas.Active then
                        begin
                            ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles '+
                                                               'where documentoventa_id in ("'+documentoventa_id_origen+'","'+documentoventa_id_destino+'") ';
                            ZQDocumentoventadetalles.Active:=true;

                            ZQDocumentoventadetalles.First;
                            while not ZQDocumentoventadetalles.Eof do
                                begin
                                    ZQDocumentoventadetalles.Edit;
                                    ZQDocumentoventadetalles.FieldByName('documentoventa_id').AsString:=documentoventa_id_destino;
                                    ZQDocumentoventadetalles.Post;

                                    ZQDocumentoventadetalles.Next;
                                end;

                            ZQDocumentoventa.Active:=false;
                            ZQDocumentoventa.ParamByName('documentoventa_id').AsString:=documentoventa_id_destino;
                            ZQDocumentoventa.Active:=true;

                            Princ.ModificarDocumentoVenta(ZQDocumentoventa,ZQDocumentoventadetalles,nil,nil);

                            ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles '+
                                                               'where documentoventa_id=:documentoventa_id';


                            ZQDocumentoventa.Active:=false;
                            ZQDocumentoventa.ParamByName('documentoventa_id').AsString:=documentoventa_id_origen;
                            ZQDocumentoventa.Active:=true;

                            ZQDocumentoventa.Edit;
                            ZQDocumentoventa.FieldByName('documentoventa_estado').AsString:='ANULADA';
                            ZQDocumentoventa.FieldByName('documentoventa_observacion').AsString:='TRASPASO DE MESA';
                            ZQDocumentoventa.Post;

                            Princ.ModificarDocumentoVenta(ZQDocumentoventa,nil,nil,nil);

                            btnactualizar.Click;

                        end;



                  end;



            end;

      end;

end;

procedure TCajaBar.Button2Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoCajaAsientoIngreso(caja_id);
    btnactualizar.Click;
end;

procedure TCajaBar.Button5Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoCajaAsientoEgreso(caja_id);
    btnactualizar.Click;
end;

procedure TCajaBar.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    if ZQDocumentosventas.RecordCount>0 then

      begin
          if (ZQDocumentosventas.FieldByName('documentoventa_estado').AsString='CERRADA') then
            begin
                ConvertirDocumentoVenta;

                ZQDocumentosventas.Active:=false;
                btnactualizar.Click;
            end;
      end;
end;

procedure TCajaBar.DCSDocumentosventasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    ZQDocumentoventadetalles.Active:=false;
    if ZQDocumentosventas.Active then
      begin
          ZQDocumentoventadetalles.ParamByName('documentoventa_id').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
          ZQDocumentoventadetalles.Active:=true;
      end;
end;

procedure TCajaBar.FormCreate(Sender: TObject);
begin
  inherited;
    BARPUNTOVENTAID:=Princ.GetConfiguracion('BARPUNTOVENTAID');
    BARTIPODOCUID:=Princ.GetConfiguracion('BARTIPODOCUID');
    BARFACTURAPUNTOVENTAID:=Princ.GetConfiguracion('BARFACTURAPUNTOVENTAID');
    BARFACTURATIPODOCUID:=Princ.GetConfiguracion('BARFACTURATIPODOCUID');
    BARCLIENTEID:=Princ.GetConfiguracion('BARCLIENTEID');
    producto_precioventa:='1';
    caja_id:=Princ.buscar('select caja_id from cajas where caja_estado="ABIERTA"','caja_id');

end;

procedure TCajaBar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=VK_F3 then
      btnabrirmesa.Click;

    if key=VK_F4 then
      btnagregardetalle.Click;

    if key=VK_F5 then
      btnactualizar.Click;

    if key=VK_F6 then
      btncerrarmesa.Click;

    if key=VK_F7 then
      btnfacturar.Click;

end;

procedure TCajaBar.FormShow(Sender: TObject);
begin
  inherited;

    btnactualizar.Click;

//    caja_saldo.Text:=Princ.buscar('select sum(documentoventa_pagado) as pagos from documentosventas where tipodocu_id="'+BARTIPODOCUID+'" and documentoventa_estado<>"ANULADA"','pagos');
end;

procedure TCajaBar.mozomesaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=13 then
      begin
          btnabrirmesa.Click;
          ZQDocumentosventas.Last;

      end;
end;

procedure TCajaBar.producto_idAfterSearch(Sender: TObject);
begin
  inherited;
    ventadetalle_preciounitario.Text:=producto_id.valor('producto_precioventa'+producto_precioventa);
    if producto_id.Text<>'' then
      btnagregardetalle.SetFocus
    else
      producto_id.SetFocus;

end;

procedure TCajaBar.producto_idClickBtn(Sender: TObject);
begin
  inherited;
    busquedaproductos:=Tbusquedaproductos.Create(self);
    busquedaproductos.ConfCampoBusqueda1:=producto_id.ConfCampoBusqueda1;
    if busquedaproductos.ShowModal=mrOk then
      begin
          producto_id.Text:=busquedaproductos.producto_id;
          producto_id.Search(busquedaproductos.producto_id);

      end;

    busquedaproductos.Free;
end;

procedure TCajaBar.producto_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=13 then
      producto_id.Search(producto_id.Text);
end;

procedure TCajaBar.producto_idKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if key='+' then
      begin
          key:=#0;
          producto_id.OnClickBtn(self);

      end;
end;

procedure TCajaBar.ZQDocumentosventasAfterOpen(DataSet: TDataSet);
begin
  inherited;
    caja_saldofinal.Text:=Princ.buscar('select sum(documentoventa_pagado) as pagos from documentosventas where tipodocu_id="'+BARTIPODOCUID+'" and documentoventa_estado<>"ANULADA" and caja_id="'+caja_id+'"','pagos');
end;

procedure TCajaBar.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    caja_estado.caption:=ZQSelect.FieldByName('caja_estado').AsString;
end;

end.
