unit Unitfacturasventa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit, Menus, AdvMenus;

type
  Tfacturasventa = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    documentoventa_numero: TEdit;
    documentoventa_fecha: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    cliente_id: TSqlComboBox;
    Label4: TLabel;
    personal_id: TSqlComboBox;
    btncancelar: TButton;
    btnguardar: TButton;
    documentoventa_condicionventa: TComboBox;
    Label8: TLabel;
    Label15: TLabel;
    DBGrid1: TDBGrid;
    ZQDocumentoventadetalles: TZQuery;
    DTSDocumentoventadetalle: TDataSource;
    btnagregar: TButton;
    btnquitar: TButton;
    btnmodificar: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    puntoventa_id: TSqlComboBox;
    tipodocu_id: TSqlComboBox;
    documentoventa_neto21: TMoneyEdit;
    documentoventa_iva21: TMoneyEdit;
    documentoventa_neto105: TMoneyEdit;
    documentoventa_iva105: TMoneyEdit;
    documentoventa_total: TMoneyEdit;
    Label1: TLabel;
    cliente_domicilio: TLabel;
    Label11: TLabel;
    cliente_documentonro: TLabel;
    Label12: TLabel;
    documentoventa_listaprecio: TComboBox;
    ZQRecibo: TZQuery;
    ZQdocumentoventadocus: TZQuery;
    ZQDocumentopagos: TZQuery;
    DBGrid2: TDBGrid;
    btnagregarpago: TButton;
    btnquitarpago: TButton;
    DTSPagos: TDataSource;
    Label13: TLabel;
    ZQpagotarjeta: TZQuery;
    ZQDocumentopagosdocumentopago_id: TIntegerField;
    ZQDocumentopagosdocumentopago_nombre: TStringField;
    ZQDocumentopagosdocumentopago_importe: TFloatField;
    ZQDocumentopagostipopago_id: TIntegerField;
    ZQDocumentopagosdocumentoventa_id: TIntegerField;
    ZQDocumentopagostipopago_nombre: TStringField;
    ZQNotacredito: TZQuery;
    ZQExecSql: TZQuery;
    labelsucursal: TLabel;
    sucursal_id: TSqlComboBox;
    AdvPopupMenu1: TAdvPopupMenu;
    Facturarnotapedido: TMenuItem;
    Facturarpresupuesto: TMenuItem;
    btnherramientas: TAdvGlowButton;
    btnimprimirventa: TButton;
    btnagregarcliente: TButton;
    Label16: TLabel;
    documentoventa_fechavenc: TDateTimePicker;
    btnobservaciones: TButton;
    cliente_ultimaventa: TLabel;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure solic_cuotasExit(Sender: TObject);
    procedure solic_importecuotaExit(Sender: TObject);
    procedure solic_prestadoExit(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure tipodocu_idChange(Sender: TObject);
    procedure tipodocu_idSelect(Sender: TObject);
    procedure puntoventa_idSelect(Sender: TObject);
    procedure cliente_idSelect(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btnagregarpagoClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnquitarpagoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sucursal_idSelect(Sender: TObject);
    procedure FacturarnotapedidoClick(Sender: TObject);
    procedure btnimprimirventaClick(Sender: TObject);
    procedure btnagregarclienteClick(Sender: TObject);
    procedure FacturarpresupuestoClick(Sender: TObject);
    procedure btnobservacionesClick(Sender: TObject);
  private
    { Private declarations }
  protected
    VENTASCTDOPARCIALES:boolean;
    VENTASCTDOVENTANACTACTE:boolean;
    function control:boolean;
    function ControlAnular:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
    procedure GenerarNC;
    procedure anular;
    procedure MarcarComoFacturado(documento_idorig:string);
    procedure calculartotales;
    procedure calculartotalpagos;
    procedure FacturarDocumento(tipodocunombre:string);
  public
    { Public declarations }
    abm:integer;
    id:string;
    documentoventa_pagado, documentoventa_saldo:real;
    limpiar_al_guardar:boolean;
    id_facturado:string;
    documentoventa_observacion:tstrings;
  end;

var
  facturasventa: Tfacturasventa;

implementation

uses UnitPrinc, Unitventadetalle, Unitventadetalle2, UnitFacturarDocumentos,
  UnitObservaciones;

{$R *.dfm}


procedure Tfacturasventa.FacturarDocumento(tipodocunombre:string);
begin
    try
      FacturarDocumentos:= TFacturarDocumentos.Create(self);
    finally
      FacturarDocumentos.Caption:='Facturar Documentos - '+tipodocunombre;
      FacturarDocumentos.tipodocu_id:=Princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="'+tipodocunombre+'"','tipodocu_id');
      id_facturado:='';
      if FacturarDocumentos.ShowModal=mrOk then
        begin
            id_facturado:=FacturarDocumentos.ZQSelect.FieldByName('documentoventa_id').AsString;
            cliente_id.Buscar(FacturarDocumentos.ZQSelect.FieldByName('cliente_id').AsString);
            personal_id.Buscar(FacturarDocumentos.ZQSelect.FieldByName('personal_id').AsString);
            documentoventa_condicionventa.ItemIndex:=FacturarDocumentos.ZQSelect.FieldByName('documentoventa_condicionventa').AsInteger;
            documentoventa_listaprecio.ItemIndex:=FacturarDocumentos.ZQSelect.FieldByName('documentoventa_listaprecio').AsInteger;
            FacturarDocumentos.ZQDocumentoventadetalles.First;
            while not FacturarDocumentos.ZQDocumentoventadetalles.Eof do
                begin
                    princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, FacturarDocumentos.ZQDocumentoventadetalles);

                    FacturarDocumentos.ZQDocumentoventadetalles.Next;
                end;

            calculartotales;
            calculartotalpagos;

        end;
      FacturarDocumentos.Free;
    end;

end;


procedure Tfacturasventa.MarcarComoFacturado(documento_idorig:string);
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentosventas set documentoventa_estado=:documentovneta_estado ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id ');
    ZQExecSql.ParamByName('documentovneta_estado').AsString:='FACTURADA';
    ZQExecSql.ParamByName('documentoventa_id').AsString:=documento_idorig;
    ZQExecSql.ExecSQL;

end;

function Tfacturasventa.ControlAnular:boolean;
var
  error:integer;
begin
    error:=0;

    if (documentoventa_condicionventa.Text<>'Contado') and (documentoventa_pagado>0) then
      error:=1;



    
    Result:=error=0;
end;

procedure Tfacturasventa.GenerarNC;
var
  tipodocu_id_NC:string;
  NC_numero:string;
begin
    ZQNotacredito.Active:=false;
    ZQNotacredito.Active:=true;

    tipodocu_id_NC:=princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="Nota de Credito de Venta" and tipodocu_letra="'+tipodocu_id.Text+'"','tipodocu_id');

    NC_numero:=Princ.NumeroDocumento(tipodocu_id_NC,'');

    ZQNotacredito.Insert;
    ZQNotacredito.FieldByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;

    if ZQuery2.FieldByName('documentoventa_estado').AsString='PAGADA' then
      begin
          ZQNotacredito.FieldByName('documentoventa_estado').AsString:='PENDIENTE';
          ZQNotacredito.FieldByName('documentoventa_pagado').AsString:='0';
          ZQNotacredito.FieldByName('documentoventa_saldo').AsString:=documentoventa_total.Text;
      end
    else
      begin
          ZQNotacredito.FieldByName('documentoventa_estado').AsString:='PAGADA';
          ZQNotacredito.FieldByName('documentoventa_pagado').AsString:=documentoventa_total.Text;
          ZQNotacredito.FieldByName('documentoventa_saldo').AsString:='0';

      end;


    ZQNotacredito.FieldByName('documentoventa_fecha').AsDateTime:=date;
    ZQNotacredito.FieldByName('documentoventa_fechavenc').AsDateTime:=date;
    ZQNotacredito.FieldByName('documentoventa_hora').AsDateTime:=Now;
    ZQNotacredito.FieldByName('documentoventa_id').asstring:='0';
    ZQNotacredito.FieldByName('documentoventa_iva105').AsString:=documentoventa_iva105.Text;
    ZQNotacredito.FieldByName('documentoventa_iva21').AsString:=documentoventa_iva21.Text;
    ZQNotacredito.FieldByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;
    ZQNotacredito.FieldByName('documentoventa_neto105').AsString:=documentoventa_neto105.Text;
    ZQNotacredito.FieldByName('documentoventa_neto21').AsString:=documentoventa_neto21.Text;
    ZQNotacredito.FieldByName('documentoventa_netonogravado').AsString:='0';
    ZQNotacredito.FieldByName('documentoventa_numero').AsString:=NC_numero;
    ZQNotacredito.FieldByName('documentoventa_observacion').AsString:='';
    ZQNotacredito.FieldByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQNotacredito.FieldByName('personal_id').AsString:=personal_id.codigo;
    ZQNotacredito.FieldByName('tipodocu_id').AsString:=tipodocu_id_NC;
    ZQNotacredito.FieldByName('caja_id').AsString:='0';
    ZQNotacredito.FieldByName('cliente_id').AsString:=cliente_id.codigo;
    ZQNotacredito.Post;

    ZQdocumentoventadocus.Active:=false;
    ZQdocumentoventadocus.Active:=true;
//    if ZQuery2.FieldByName('documentoventa_estado').AsString='PENDIENTE' then
//      begin
          ZQdocumentoventadocus.Insert;
          ZQdocumentoventadocus.FieldByName('documentoventa_estado').asstring:='PAGADA';
          ZQdocumentoventadocus.FieldByName('documentoventa_id').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventa_idpago').asstring:=id;
          ZQdocumentoventadocus.FieldByName('documentoventa_pagado').asstring:=documentoventa_total.Text;
          ZQdocumentoventadocus.FieldByName('documentoventa_saldo').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventadoc_id').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').asstring:=documentoventa_total.Text;
          ZQdocumentoventadocus.Post;

//      end;

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQDocumentoventadetalles.Edit;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
            ZQDocumentoventadetalles.Post;

            Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString, ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, true);

            ZQDocumentoventadetalles.Next;
        end;
    Princ.AgregarDocumentoVenta(ZQNotacredito,ZQDocumentoventadetalles,ZQdocumentoventadocus,nil);

    MessageDlg('Se genero una Nota de Credito para anular la Factura.', mtInformation, [mbOK], 0);

end;

procedure Tfacturasventa.anular;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
      begin
          GenerarNC;

      end
    else
      begin
          ZQDocumentoventadetalles.First;
          while not ZQDocumentoventadetalles.Eof do
              begin
                  Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString, ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, true);

                  ZQDocumentoventadetalles.Next;
              end;

          ZQExecSql.sql.clear;
          ZQExecSql.sql.add('Update documentosventas set ');
          ZQExecSql.sql.add('documentoventa_estado=:documentoventa_estado');
          ZQExecSql.sql.add(' where documentoventa_id=:documentoventa_id');
          ZQExecSql.parambyname('documentoventa_estado').asstring:='ANULADA';
          ZQExecSql.parambyname('documentoventa_id').asstring:=id;
          ZQExecSql.ExecSQL;




          MessageDlg('La Factura fue anulada correctamente.', mtInformation, [mbOK], 0);

      end;
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

end;

procedure Tfacturasventa.calculartotalpagos;
begin
    documentoventa_saldo:=documentoventa_total.Value;
    documentoventa_pagado:=0;
    ZQDocumentopagos.First;
    while not ZQDocumentopagos.Eof do
        begin
            documentoventa_pagado:=documentoventa_pagado+ZQDocumentopagos.FieldByName('documentopago_importe').AsFloat;

            documentoventa_saldo:=roundto(documentoventa_total.Value-documentoventa_pagado,-2);


            ZQDocumentopagos.Next;
        end;

    btnagregarpago.Enabled:=true;
    if documentoventa_saldo=0 then
       btnagregarpago.Enabled:=false;
end;


procedure Tfacturasventa.calculartotales;
var
  bm:TBookmark;
begin
    bm:=ZQDocumentoventadetalles.GetBookmark;
    ZQDocumentoventadetalles.First;
    documentoventa_neto21.Text:='0';
    documentoventa_iva21.Text:='0';
    documentoventa_neto105.Text:='0';
    documentoventa_iva105.Text:='0';
    documentoventa_total.Text:='0';

    while not ZQDocumentoventadetalles.Eof do
        begin
            documentoventa_neto21.Text:=floattostr(roundto(documentoventa_neto21.Value+ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat,-2));
            documentoventa_iva21.Text:=floattostr(roundto(documentoventa_iva21.Value+ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat,-2));
            documentoventa_neto105.Text:=floattostr(roundto(documentoventa_neto105.Value+ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat,-2));
            documentoventa_iva105.Text:=floattostr(roundto(documentoventa_iva105.Value+ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat,-2));
            documentoventa_total.Text:=floattostr(roundto(documentoventa_total.Value+ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsFloat,-2));



            ZQDocumentoventadetalles.Next;
        end;

    ZQDocumentoventadetalles.GotoBookmark(bm);


end;

procedure Tfacturasventa.cliente_idSelect(Sender: TObject);
begin
    cliente_domicilio.Caption:=Princ.buscar('select cliente_domicilio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_domicilio');
    cliente_documentonro.Caption:=Princ.buscar('select cliente_documentonro from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_documentonro');
    try
      documentoventa_condicionventa.ItemIndex:=strtoint(Princ.buscar('select cliente_condicionventa from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_condicionventa'));
    except
    end;

    documentoventa_listaprecio.ItemIndex:=strtoint(Princ.buscar('select cliente_listaprecio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_listaprecio'));
    personal_id.Buscar(Princ.buscar('select personal_id from clientes where cliente_id="'+cliente_id.codigo+'"','personal_id'));

    documentoventa_fechavenc.Date:=documentoventa_fecha.Date + strtoint(Princ.buscar('select cliente_diasvenc from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_diasvenc'));

    cliente_ultimaventa.Caption:='';

    cliente_ultimaventa.Caption:=Princ.buscar('select documentoventa_fecha from documentosventas '+
                                              'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                              'where tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'" and cliente_id="'+cliente_id.codigo+'"','documentoventa_fecha');

    if Princ.buscar('select condicioniva_id from clientes where cliente_id="'+cliente_id.codigo+'"','condicioniva_id')='2' then
      tipodocu_id.Buscar('A',true)
    else
      tipodocu_id.Buscar('B',true);

    if tipodocu_id.Text='' then
      try
        tipodocu_id.ItemIndex:=0;
      finally
      end;

    tipodocu_id.OnSelect(self);
end;

procedure Tfacturasventa.imprimir;
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\'+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                             'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                             'inner join paises on provincias.pais_id=paises.pais_id '+
                                             'where documentosventas.documentoventa_id="'+id+'"';

    Princ.VCLReport1.Execute;
end;


procedure Tfacturasventa.eliminar;
var
  recibo_id:string;
  se_puede_borrar:boolean;
  pagado:real;
begin
    se_puede_borrar:=true;
    if documentoventa_condicionventa.Text='Contado' then
      begin
          se_puede_borrar:=true;
          recibo_id:=Princ.buscar('select documentoventa_id from documentoventadocus where documentoventa_idpago="'+id+'"','documentoventa_id');
          if recibo_id<>'' then
            se_puede_borrar:=Princ.BorrarDocumentoVenta(recibo_id);
      end;

    if se_puede_borrar then
      begin
          pagado:=strtofloat(Princ.buscar('select documentoventa_pagado from documentosventas where documentoventa_id="'+id+'"','documentoventa_pagado'));
          se_puede_borrar:= pagado=0;
          if se_puede_borrar then
            begin
                Princ.BorrarDocumentoVenta(id);

                MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
                Self.Close;
            end;
      end;
    if not se_puede_borrar then
      MessageDlg('La factura todavia tiene pagos asociados, no se puede eliminar.', mtError, [mbOK], 0);



end;



procedure Tfacturasventa.FacturarnotapedidoClick(Sender: TObject);
begin
    FacturarDocumento('Nota de Pedido');

//    try
//      FacturarDocumentos:= TFacturarDocumentos.Create(self);
//    finally
//      FacturarDocumentos.tipodocu_id:=Princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="Nota de Pedido"','tipodocu_id');
//      id_facturado:='';
//      if FacturarDocumentos.ShowModal=mrOk then
//        begin
//            id_facturado:=FacturarDocumentos.ZQSelect.FieldByName('documentoventa_id').AsString;
//            cliente_id.Buscar(FacturarDocumentos.ZQSelect.FieldByName('cliente_id').AsString);
//            personal_id.Buscar(FacturarDocumentos.ZQSelect.FieldByName('personal_id').AsString);
//            documentoventa_condicionventa.ItemIndex:=FacturarDocumentos.ZQSelect.FieldByName('documentoventa_condicionventa').AsInteger;
//            documentoventa_listaprecio.ItemIndex:=FacturarDocumentos.ZQSelect.FieldByName('documentoventa_listaprecio').AsInteger;
//            FacturarDocumentos.ZQDocumentoventadetalles.First;
//            while not FacturarDocumentos.ZQDocumentoventadetalles.Eof do
//                begin
//                    princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, FacturarDocumentos.ZQDocumentoventadetalles);
//
//                    FacturarDocumentos.ZQDocumentoventadetalles.Next;
//                end;
//
//            calculartotales;
//            calculartotalpagos;
//
//        end;
//      FacturarDocumentos.Free;
//    end;
end;

procedure Tfacturasventa.FacturarpresupuestoClick(Sender: TObject);
begin
    FacturarDocumento('Presupuesto');
end;

procedure Tfacturasventa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tfacturasventa.FormCreate(Sender: TObject);
begin
    documentoventa_observacion:=tstringlist.Create;
    documentoventa_observacion.Text:='';

    id:='';
    limpiar_al_guardar:=true;

    sucursal_id.llenarcombo;
    sucursal_id.Buscar(Princ.sucursal_actual);

    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';

    puntoventa_id.llenarcombo;
    try
      puntoventa_id.ItemIndex:=0;
    except
      puntoventa_id.ItemIndex:=-1;
    end;


    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="Factura de Venta"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;
     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     documentoventa_numero.Text:='';
     if tipodocu_id.ItemIndex=0 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');


    documentoventa_fecha.Date:=date;

    documentoventa_listaprecio.Items.Clear;
    documentoventa_listaprecio.Items.Add(Princ.NOMBREPRECIO1);
    documentoventa_listaprecio.Items.Add(Princ.NOMBREPRECIO2);
    documentoventa_listaprecio.Items.Add(Princ.NOMBREPRECIO3);
    documentoventa_listaprecio.Items.Add(Princ.NOMBREPRECIO4);
    documentoventa_listaprecio.ItemIndex:=0;

    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=-1;
    
    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;

    VENTASCTDOPARCIALES:=strtobool(Princ.GetConfiguracion('VENTASCTDOPARCIALES'));
    VENTASCTDOVENTANACTACTE:=strtobool(Princ.GetConfiguracion('VENTASCTDOVENTANACTACTE'));

end;

procedure Tfacturasventa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F4:btnagregar.Click;
        VK_F6:btnquitar.Click;
        VK_F7:btnagregarpago.Click;
        VK_F8:btnquitarpago.Click;
        VK_F9:btnguardar.Click;
    end;
end;

procedure Tfacturasventa.FormShow(Sender: TObject);
begin
    btnherramientas.Visible:=abm=1;
    btnimprimirventa.Visible:=abm<>1;

    cliente_ultimaventa.Caption:='';

    ZQuery2.Active:=false;
    ZQuery2.ParamByName('documentoventa_id').AsString:=id;
    ZQuery2.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;
end;

procedure Tfacturasventa.modificar;
begin


    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;
//    if limpiar_al_guardar then
//      begin
//          id:='';
//          Self.OnShow(self);
//      end
//    else
//      begin
//          Self.Close;
//      end;


end;


procedure Tfacturasventa.solic_cuotasExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure Tfacturasventa.solic_importecuotaExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure Tfacturasventa.solic_prestadoExit(Sender: TObject);
begin
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure Tfacturasventa.sucursal_idSelect(Sender: TObject);
begin
    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';
    puntoventa_id.llenarcombo;
    try
       puntoventa_id.ItemIndex:=0;
     except
       puntoventa_id.ItemIndex:=-1;
     end;

    puntoventa_id.OnSelect(self);
end;

procedure Tfacturasventa.puntoventa_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+TIPODOCU_FACTURAVENTA+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;

     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     if tipodocu_id.ItemIndex>-1 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');

end;

procedure Tfacturasventa.tipodocu_idChange(Sender: TObject);
begin
    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tfacturasventa.tipodocu_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');


    documentoventa_observacion.Text:=Princ.GetConfigTipoDocumento('',tipodocu_id.codigo,'tipodocu_leyenda');  
end;

procedure Tfacturasventa.ZQuery2AfterOpen(DataSet: TDataSet);
begin
    if abm=1 then
      begin
          documentoventa_fecha.Date:=date;

          cliente_id.ItemIndex:=-1;
          personal_id.ItemIndex:=0;
          documentoventa_fechavenc.Date:=date+15;
          documentoventa_neto21.Text:='0';
          documentoventa_iva21.Text:='0';
          documentoventa_neto105.Text:='0';
          documentoventa_iva105.Text:='0';
          documentoventa_total.Text:='0';

          documentoventa_observacion.Text:=Princ.GetConfigTipoDocumento('',tipodocu_id.codigo,'tipodocu_leyenda');

      end
    else
      begin
          documentoventa_fecha.Date:=ZQuery2.FieldByName('documentoventa_fecha').AsDateTime;

          sucursal_id.Buscar(ZQuery2.FieldByName('sucursal_id').AsString);
          sucursal_id.OnSelect(self);
          puntoventa_id.Buscar(ZQuery2.FieldByName('puntoventa_id').AsString);
          puntoventa_id.OnSelect(self);
          cliente_id.Buscar(ZQuery2.FieldByName('cliente_id').AsString);
          tipodocu_id.buscar(ZQuery2.FieldByName('tipodocu_id').AsString);
          tipodocu_id.OnSelect(self);
          documentoventa_fechavenc.Date:=ZQuery2.FieldByName('documentoventa_fechavenc').AsDateTime;
          documentoventa_numero.Text:=ZQuery2.FieldByName('documentoventa_numero').AsString;
          documentoventa_condicionventa.ItemIndex:=ZQuery2.FieldByName('documentoventa_condicionventa').AsInteger;
          documentoventa_listaprecio.ItemIndex:=ZQuery2.FieldByName('documentoventa_listaprecio').AsInteger;

          personal_id.Buscar(ZQuery2.FieldByName('personal_id').AsString);

          documentoventa_neto21.Text:=ZQuery2.FieldByName('documentoventa_neto21').AsString;
          documentoventa_iva21.Text:=ZQuery2.FieldByName('documentoventa_iva21').AsString;
          documentoventa_neto105.Text:=ZQuery2.FieldByName('documentoventa_neto105').AsString;
          documentoventa_iva105.Text:=ZQuery2.FieldByName('documentoventa_iva105').AsString;
          documentoventa_total.Text:=ZQuery2.FieldByName('documentoventa_total').AsString;

          documentoventa_observacion.Text:=ZQuery2.FieldByName('documentoventa_observacion').AsString;

      end;


    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+id+'"';
    ZQDocumentoventadetalles.Active:=true;

    ZQDocumentopagos.Active:=false;
    ZQDocumentopagos.SQL.Text:='select documentopagos.*, tipopago_nombre from documentopagos '+
                               'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                               'where documentoventa_id="'+id+'"';

    ZQDocumentopagos.Active:=true;

    calculartotales;
    calculartotalpagos;

    try
      cliente_id.SetFocus;
    except
      btnagregar.SetFocus;
    end;
end;

procedure Tfacturasventa.agregar;
var
  recibo_numero:string;
  tipodocu_id_recibo:string;
begin

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    id:=Princ.codigo('documentosventas','documentoventa_id');

    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,documentoventa_numero.Text);
    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
      documentoventa_numero.Text:='0';


    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Insert into documentosventas (documentoventa_id, documentoventa_numero, documentoventa_fecha, documentoventa_hora, ');
    ZQExecSql.sql.add('documentoventa_neto21, documentoventa_iva21, documentoventa_neto105, documentoventa_iva105, documentoventa_netonogravado, ');
    ZQExecSql.sql.add('documentoventa_total, documentoventa_estado, documentoventa_pagado, documentoventa_saldo, documentoventa_observacion, ');
    ZQExecSql.sql.add('cliente_id, personal_id, tipodocu_id, documentoventa_condicionventa, documentoventa_fechavenc, documentoventa_listaprecio) ');
    ZQExecSql.sql.add('values (:documentoventa_id, :documentoventa_numero, :documentoventa_fecha, :documentoventa_hora, ');
    ZQExecSql.sql.add(':documentoventa_neto21, :documentoventa_iva21, :documentoventa_neto105, :documentoventa_iva105, :documentoventa_netonogravado, ');
    ZQExecSql.sql.add(':documentoventa_total, :documentoventa_estado, :documentoventa_pagado, :documentoventa_saldo, :documentoventa_observacion, ');
    ZQExecSql.sql.add(':cliente_id, :personal_id, :tipodocu_id, :documentoventa_condicionventa, :documentoventa_fechavenc, :documentoventa_listaprecio)');
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ParamByName('documentoventa_numero').AsString:=documentoventa_numero.Text;
    ZQExecSql.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQExecSql.ParamByName('documentoventa_hora').AsString:=timetostr(Princ.horaservidor);
    ZQExecSql.ParamByName('documentoventa_neto21').AsString:=documentoventa_neto21.Text;
    ZQExecSql.ParamByName('documentoventa_iva21').AsString:=documentoventa_iva21.Text;
    ZQExecSql.ParamByName('documentoventa_neto105').AsString:=documentoventa_neto105.Text;
    ZQExecSql.ParamByName('documentoventa_iva105').AsString:=documentoventa_iva105.Text;
    ZQExecSql.ParamByName('documentoventa_netonogravado').AsString:='0';
    ZQExecSql.ParamByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('documentoventa_estado').AsString:='PENDIENTE';
    ZQExecSql.ParamByName('documentoventa_pagado').AsString:='0';
    ZQExecSql.ParamByName('documentoventa_saldo').AsString:=documentoventa_total.Text;;
    ZQExecSql.ParamByName('documentoventa_observacion').AsString:=documentoventa_observacion.Text;
    ZQExecSql.ParamByName('cliente_id').AsString:=cliente_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fechavenc.Date);
    ZQExecSql.ParamByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;

    ZQExecSql.ExecSQL;

    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo, documentoventa_numero.Text);

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQExecSql.sql.clear;
            ZQExecSql.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
            ZQExecSql.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
            ZQExecSql.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id, documentoventadetalle_listaprecio) ');
            ZQExecSql.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
            ZQExecSql.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
            ZQExecSql.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id, :documentoventadetalle_listaprecio) ');
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.ParamByName('documentoventadetalle_descripcion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidad').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_precio').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_total').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_nogravado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_estado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_observacion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentoventadetalles.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
            ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
            ZQExecSql.ParamByName('documentoventadetalle_listaprecio').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_listaprecio').AsString;
            ZQExecSql.ExecSQL;


            Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString, ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, false);

            ZQDocumentoventadetalles.Next;
        end;


    if id_facturado<>'' then
      begin
          MarcarComoFacturado(id_facturado);
      end;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

    if (ZQDocumentopagos.RecordCount<1) and (documentoventa_condicionventa.Text='Contado') then
      begin
          ZQDocumentopagos.Insert;
          ZQDocumentopagos.FieldByName('documentopago_id').AsString:='0';
          ZQDocumentopagos.FieldByName('documentopago_nombre').AsString:='EFECTIVO';
          ZQDocumentopagos.FieldByName('documentopago_importe').AsString:=documentoventa_total.Text;
          ZQDocumentopagos.FieldByName('tipopago_id').AsString:='1';
          ZQDocumentopagos.FieldByName('tipopago_nombre').AsString:='EFECTIVO';
          ZQDocumentopagos.FieldByName('documentoventa_id').AsString:='0';
          ZQDocumentopagos.Post;

      end;

    calculartotalpagos;

    if (ZQDocumentopagos.RecordCount>0) then
      begin
          ZQRecibo.Active:=false;
          ZQRecibo.Active:=true;
          tipodocu_id_recibo:=princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="Recibo de Venta"','tipodocu_id');
          recibo_numero:=Princ.NumeroDocumento(tipodocu_id_recibo,'');
          ZQRecibo.Insert;
          ZQRecibo.FieldByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
          ZQRecibo.FieldByName('documentoventa_estado').AsString:='PAGADA';
          ZQRecibo.FieldByName('documentoventa_fecha').AsDateTime:=date;
          ZQRecibo.FieldByName('documentoventa_fechavenc').AsDateTime:=documentoventa_fecha.Date;
          ZQRecibo.FieldByName('documentoventa_hora').AsDateTime:=Now;
          ZQRecibo.FieldByName('documentoventa_id').asstring:=id;
          ZQRecibo.FieldByName('documentoventa_iva105').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_iva21').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;
          ZQRecibo.FieldByName('documentoventa_neto105').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_neto21').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_netonogravado').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_numero').AsString:=recibo_numero;
          ZQRecibo.FieldByName('documentoventa_observacion').AsString:='';
          ZQRecibo.FieldByName('documentoventa_pagado').AsFloat:=documentoventa_pagado;
          ZQRecibo.FieldByName('documentoventa_saldo').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_total').AsFloat:=documentoventa_pagado;
          ZQRecibo.FieldByName('personal_id').AsString:=personal_id.codigo;
          ZQRecibo.FieldByName('tipodocu_id').AsString:=tipodocu_id_recibo;
          ZQRecibo.FieldByName('cliente_id').AsString:=cliente_id.codigo;
          ZQRecibo.Post;

          ZQdocumentoventadocus.Active:=false;
          ZQdocumentoventadocus.Active:=true;
          ZQdocumentoventadocus.Insert;
          ZQdocumentoventadocus.FieldByName('documentoventa_estado').asstring:='PAGADA';
          ZQdocumentoventadocus.FieldByName('documentoventa_id').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventa_idpago').asstring:=id;
          ZQdocumentoventadocus.FieldByName('documentoventa_pagado').AsFloat:=documentoventa_pagado;
          ZQdocumentoventadocus.FieldByName('documentoventa_saldo').AsFloat:=documentoventa_saldo;
          ZQdocumentoventadocus.FieldByName('documentoventadoc_id').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat:=documentoventa_pagado;
          ZQdocumentoventadocus.Post;

          Princ.AgregarRecibo(ZQRecibo,ZQdocumentoventadocus,ZQDocumentopagos);



      end;




    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    if Princ.buscar('select tipodocu_preimpresos from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_preimpresos')='-1' then
      begin
          if (MessageDlg('Desea imprimir el comprobante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
            begin
                imprimir;
            end;

      end;

      if limpiar_al_guardar then
        begin
            id:='';
            Self.OnShow(self);
        end
      else
        begin
            Self.Close;
        end;

end;



procedure Tfacturasventa.btnagregarClick(Sender: TObject);
var
  tipoiva_valor:real;
begin
    //  VERIFICAR SI ES NECESARIO USAR OPCION DE CONF PARA TIPOS DE CARGA DE DETALLES

    try
      ventadetalle2:= Tventadetalle2.Create(self);
    finally
      ventadetalle2.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      ventadetalle2.documentoventadetalle_listaprecio:=documentoventa_listaprecio.ItemIndex;
      if ventadetalle2.ShowModal=mrOk then
        begin

            princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, ventadetalle2.ZQDocumentoventadetalles);

        end;

      ventadetalle2.Free;
      calculartotales;
      calculartotalpagos;
    end;
end;

procedure Tfacturasventa.btnagregarclienteClick(Sender: TObject);
begin
    Princ.AbrirNuevoCliente;
end;

procedure Tfacturasventa.btnagregarpagoClick(Sender: TObject);
begin
    calculartotalpagos;
    if Princ.CargarPago(documentoventa_saldo,ZQDocumentopagos) then
      calculartotalpagos;
end;

procedure Tfacturasventa.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tfacturasventa.btnguardarClick(Sender: TObject);
begin
    calculartotalpagos;
    case abm of
        1:begin
              if control then
                agregar;

          end;

        2:begin
              if control then
                modificar;

          end;

        3:begin
              if (MessageDlg('Seguro desea eliminar esta Factura?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

          4:begin
              imprimir;
          end;

          5:begin
              if (MessageDlg('Seguro desea anular esta Factura?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                anular;
          end;

    end;

end;

procedure Tfacturasventa.btnimprimirventaClick(Sender: TObject);
begin
    Self.imprimir;
end;

procedure Tfacturasventa.btnobservacionesClick(Sender: TObject);
begin
    try
      observaciones:= Tobservaciones.Create(self);
      observaciones.liberar_al_cerrar:=false;
      observaciones.documentoventa_observacion.Text:=documentoventa_observacion.Text;
    finally
      if observaciones.ShowModal=mrOk then
        begin
            documentoventa_observacion.Text:=observaciones.documentoventa_observacion.Text;
        end;

    end;

end;

procedure Tfacturasventa.btnquitarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentoventadetalles.Delete;
          finally
            calculartotales;
            calculartotalpagos;
          end;

      end;

end;

procedure Tfacturasventa.btnquitarpagoClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este pago?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentopagos.Delete;
          finally
            calculartotalpagos;
          end;



      end;
end;

function Tfacturasventa.control:boolean;
var
  error:integer;
begin
    error:=0;

    if ZQDocumentoventadetalles.RecordCount<1 then
      error:=9;

    if documentoventa_listaprecio.ItemIndex=-1 then
      error:=8;

    if documentoventa_condicionventa.ItemIndex=-1 then
      error:=7;

    if personal_id.ItemIndex=-1 then
      error:=6;

    if cliente_id.ItemIndex=-1 then
      error:=5;

    if documentoventa_numero.Text='' then
      error:=4;

    if tipodocu_id.ItemIndex=-1 then
      error:=3;

    if puntoventa_id.ItemIndex=-1 then
      error:=2;

    if sucursal_id.ItemIndex=-1 then
      error:=1;


    case error of
        1:begin
              MessageDlg('Seleccione una sucursal', mtError, [mbOK], 0);
          end;
        2:begin
              MessageDlg('Verifique numeracion', mtError, [mbOK], 0);
          end;
        3:begin
              MessageDlg('Verifique numeracion', mtError, [mbOK], 0);
          end;
        4:begin
              MessageDlg('Verifique numeracion', mtError, [mbOK], 0);
          end;
        5:begin
              MessageDlg('Seleccione un cliente', mtError, [mbOK], 0);
          end;
        6:begin
              MessageDlg('Seleccione un vendedor', mtError, [mbOK], 0);
          end;
        7:begin
              MessageDlg('Seleccione Condicion de venta', mtError, [mbOK], 0);
          end;
        8:begin
              MessageDlg('Seleccione una lista de precios', mtError, [mbOK], 0);
          end;
        9:begin
              MessageDlg('Ingrese detalle de venta', mtError, [mbOK], 0);
          end;
    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
