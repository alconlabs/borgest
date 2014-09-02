unit UnitOrdendePago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit;

type
  TOrdendePago = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    documentocompra_numero: TEdit;
    documentocompra_fecha: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    proveedor_id: TSqlComboBox;
    Label4: TLabel;
    personal_id: TSqlComboBox;
    btncancelar: TButton;
    btnguardar: TButton;
    documentocompra_condicionventa: TComboBox;
    Label8: TLabel;
    Label15: TLabel;
    DTSDocumentocompradocus: TDataSource;
    btnagregar: TButton;
    btnquitar: TButton;
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
    documentocompra_total: TMoneyEdit;
    Label1: TLabel;
    proveedor_domicilio: TLabel;
    Label11: TLabel;
    proveedor_documentonro: TLabel;
    ZQOrdendePago: TZQuery;
    ZQdocumentocompradocus: TZQuery;
    ZQDocumentocomprapagos: TZQuery;
    DBGrid2: TDBGrid;
    btnagregarpago: TButton;
    btnquitarpago: TButton;
    DTSPagos: TDataSource;
    Label13: TLabel;
    ZQpagotarjeta: TZQuery;
    DBGrid1: TDBGrid;
    ZQDocumentocompradetalles: TZQuery;
    ZQDocumentocompradetallesdocumentoventadetalle_id: TIntegerField;
    ZQDocumentocompradetallesdocumentoventadetalle_descripcion: TStringField;
    ZQDocumentocompradetallesdocumentoventadetalle_cantidad: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_precio: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_total: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_neto21: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_iva21: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_neto105: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_iva105: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_nogravado: TFloatField;
    ZQDocumentocompradetallesdocumentoventadetalle_estado: TStringField;
    ZQDocumentocompradetallesdocumentoventadetalle_observacion: TStringField;
    ZQDocumentocompradetallesproducto_id: TIntegerField;
    ZQDocumentocompradetallesdocumentoventadetalle_idorig: TIntegerField;
    ZQDocumentocompradetallesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQDocumentocompradetallesdocumentoventa_id: TIntegerField;
    Label14: TLabel;
    sucursal_id: TSqlComboBox;
    Label16: TLabel;
    Editdocumentocompra_pagado: TMoneyEdit;
    btntomardocumentosAuto: TButton;
    Label17: TLabel;
    documentocompra_totalimputado: TMoneyEdit;
    btnimprimir: TButton;
    ZQDocumentocomprapagosdocumentocomprapago_id: TIntegerField;
    ZQDocumentocomprapagosdocumentocomprapago_nombre: TStringField;
    ZQDocumentocomprapagosdocumentocomprapago_importe: TFloatField;
    ZQDocumentocomprapagostipopago_id: TIntegerField;
    ZQDocumentocomprapagosdocumentocompra_id: TIntegerField;
    ZQDocumentocomprapagostipopago_nombre: TStringField;
    ZQdocumentocompradocusdocumentocompradoc_id: TIntegerField;
    ZQdocumentocompradocusdocumentocompradoc_importe: TFloatField;
    ZQdocumentocompradocusdocumentocompra_pagado: TFloatField;
    ZQdocumentocompradocusdocumentocompra_saldo: TFloatField;
    ZQdocumentocompradocusdocumentocompra_estado: TStringField;
    ZQdocumentocompradocusdocumentocompra_id: TIntegerField;
    ZQdocumentocompradocusdocumentocompra_idpago: TIntegerField;
    ZQdocumentocompradocusdocumentocompradoc_tiporelacion: TStringField;
    ZQdocumentocompradocusdocumentocompra_id_1: TIntegerField;
    ZQdocumentocompradocusdocumentocompra_numero: TIntegerField;
    ZQdocumentocompradocusdocumentocompra_fecha: TDateField;
    ZQdocumentocompradocusdocumentocompra_hora: TTimeField;
    ZQdocumentocompradocusdocumentocompra_total: TFloatField;
    ZQdocumentocompradocusdocumentocompra_estado_1: TStringField;
    ZQdocumentocompradocusdocumentocompra_pagado_1: TFloatField;
    ZQdocumentocompradocusdocumentocompra_saldo_1: TFloatField;
    ZQdocumentocompradocusdocumentocompra_observacion: TStringField;
    ZQdocumentocompradocusdocumentocompra_condicionventa: TIntegerField;
    ZQdocumentocompradocusdocumentocompra_fechavenc: TDateField;
    ZQdocumentocompradocuspersonal_id: TIntegerField;
    ZQdocumentocompradocusproveedor_id: TIntegerField;
    ZQdocumentocompradocustipodocu_id: TIntegerField;
    ZQdocumentocompradocusdocumentocompra_neto21: TFloatField;
    ZQdocumentocompradocusdocumentocompra_iva21: TFloatField;
    ZQdocumentocompradocusdocumentocompra_neto105: TFloatField;
    ZQdocumentocompradocusdocumentocompra_iva105: TFloatField;
    ZQdocumentocompradocusdocumentocompra_otrosimpuestos: TFloatField;
    ZQdocumentocompradocusdocumentocompra_puntoventa: TIntegerField;
    ZQdocumentocompradocusdocumentocompra_neto27: TFloatField;
    ZQdocumentocompradocusdocumentocompra_iva27: TFloatField;
    ZQdocumentocompradocusdocumentocompra_nogravado: TFloatField;
    ZQdocumentocompradocusdocumentocompra_tishhperc: TFloatField;
    ZQdocumentocompradocusdocumentocompra_ivaret: TFloatField;
    ZQdocumentocompradocusdocumentocompra_ivaperc: TFloatField;
    ZQdocumentocompradocusdocumentocompra_dgrret: TFloatField;
    ZQdocumentocompradocusdocumentocompra_dgrperc: TFloatField;
    ZQdocumentocompradocustipodocu_id_1: TIntegerField;
    ZQdocumentocompradocustipodocu_nombre: TStringField;
    ZQdocumentocompradocustipodocu_tipo: TStringField;
    ZQdocumentocompradocustipodocu_caja: TIntegerField;
    ZQdocumentocompradocustipodocu_stock: TIntegerField;
    ZQdocumentocompradocustipodocu_iva: TIntegerField;
    ZQdocumentocompradocustipodocu_fiscal: TIntegerField;
    ZQdocumentocompradocustipodocu_ultimonumero: TIntegerField;
    ZQdocumentocompradocuspuntoventa_id: TIntegerField;
    ZQdocumentocompradocustipodocu_letra: TStringField;
    ZQdocumentocompradocustipodocu_debcred: TStringField;
    ZQdocumentocompradocustipodocufiscal_id: TIntegerField;
    ZQdocumentocompradocustipodocu_preimpresos: TIntegerField;
    ZQdocumentocompradocustipodocu_impresora: TStringField;
    ZQdocumentocompradocustipodocu_copias: TIntegerField;
    ZQdocumentocompradocustipodocu_preview: TIntegerField;
    ZQdocumentocompradocustipodocu_prompt: TIntegerField;
    ZQdocumentocompradocustipodocu_ctacte: TIntegerField;
    ZQdocumentocompradocustipodocu_archivoimpresion: TStringField;
    ZQdocumentocompradocustipodocu_leyenda: TStringField;
    ZQdocumentocompradocustipodocu_nombreabrev: TStringField;
    ZQdocumentocompradocustipodocu_manual: TIntegerField;
    ZQdocumentocompradocuspuntoventa_id_1: TIntegerField;
    ZQdocumentocompradocuspuntoventa_numero: TIntegerField;
    ZQdocumentocompradocuspuntoventa_descripcion: TStringField;
    ZQdocumentocompradocussucursal_id: TIntegerField;
    ZQdocumentocompradocuspuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQdocumentocompradocuspuntoventa_controladorfiscalpuerto: TIntegerField;
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
    procedure proveedor_idSelect(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btnagregarpagoClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure sucursal_idSelect(Sender: TObject);
    procedure btnquitarpagoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btntomardocumentosAutoClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    documentocompra_estado:string;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
  public
    { Public declarations }
    abm:integer;
    id:string;
    documentocompra_pagado, documentocompra_saldo:real;
    procedure calculartotales;
    procedure calculartotalpagos;
  end;

var
  OrdendePago: TOrdendePago;

implementation

uses UnitPrinc, Unitventadetalle, UnitDocumentosVentasPendientes;

{$R *.dfm}


procedure TOrdendePago.calculartotalpagos;
begin
    documentocompra_total.Value:=0;
    ZQDocumentocomprapagos.First;
    while not ZQDocumentocomprapagos.Eof do
        begin
            documentocompra_total.Value:=roundto(documentocompra_total.Value+ZQDocumentocomprapagos.FieldByName('documentocomprapago_importe').AsFloat,-2);

            ZQDocumentocomprapagos.Next;
        end;

    documentocompra_estado:='PENDIENTE';
    documentocompra_saldo:=roundto(documentocompra_total.Value-documentocompra_pagado,-2);
    if documentocompra_saldo=0 then
      documentocompra_estado:='PAGADA';

    Editdocumentocompra_pagado.Value:=documentocompra_total.Value;
end;


procedure TOrdendePago.calculartotales;
var
  bm:TBookmark;
begin
    bm:=ZQdocumentocompradocus.GetBookmark;
    ZQdocumentocompradocus.First;
//    documentocompra_neto21.Text:='0';
//    documentocompra_iva21.Text:='0';
//    documentocompra_neto105.Text:='0';
//    documentocompra_iva105.Text:='0';
    documentocompra_total.Text:='0';
    documentocompra_totalimputado.Text:='0';
    documentocompra_pagado:=0;

    while not ZQdocumentocompradocus.Eof do
        begin
            documentocompra_pagado:=roundto(documentocompra_pagado+ZQdocumentocompradocus.FieldByName('documentocompradoc_importe').AsFloat,-2);



            ZQdocumentocompradocus.Next;
        end;

    ZQdocumentocompradocus.GotoBookmark(bm);
    documentocompra_totalimputado.Value:=documentocompra_pagado;

end;

procedure TOrdendePago.proveedor_idSelect(Sender: TObject);
begin
    proveedor_domicilio.Caption:=Princ.buscar('select proveedor_domicilio from proveedores where proveedor_id="'+proveedor_id.codigo+'"','proveedor_domicilio');
    proveedor_documentonro.Caption:=Princ.buscar('select proveedor_documentonro from proveedores where proveedor_id="'+proveedor_id.codigo+'"','proveedor_documentonro');
end;

procedure TOrdendePago.imprimir;
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                                   'inner join clientes on documentosventas.proveedor_id=clientes.proveedor_id '+
                                                   'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                                   'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                                   'inner join paises on provincias.pais_id=paises.pais_id '+
                                                   'inner join condicioniva on clientes.condicioniva_id=condicioniva.condicioniva_id '+
                                                   'where documentosventas.documentocompra_id="'+id+'"';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select * from documentoventadocus '+
                                                   'inner join documentosventas on documentoventadocus.documentocompra_idpago=documentosventas.documentocompra_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where documentoventadocus.documentocompra_id="'+id+'"';

    Princ.VCLReport1.Report.Datainfo.Items[3].sql:='select documentopagos.*, tipopago_nombre from documentopagos '+
                                                   'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                                   'where documentopagos.documentocompra_id="'+id+'"';

    Princ.VCLReport1.Execute;
end;


procedure TOrdendePago.eliminar;
begin
    Princ.BorrarDocumentoCompra(id);

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure TOrdendePago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure TOrdendePago.FormCreate(Sender: TObject);
begin
    id:='';

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
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+TIPODOCU_ORDENDEPAGO+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;
     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     documentocompra_numero.Text:='';
     if tipodocu_id.ItemIndex=0 then
      documentocompra_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');


    documentocompra_fecha.Date:=date;

    proveedor_id.llenarcombo;
    proveedor_id.ItemIndex:=-1;
    
    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;

end;

procedure TOrdendePago.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F7:btnagregarpago.Click;
        VK_F8:btnquitarpago.Click;
        VK_F9:btnguardar.Click;
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TOrdendePago.FormShow(Sender: TObject);
begin
    btnimprimir.Visible:=abm<>1;

    ZQuery2.Active:=false;
    ZQuery2.ParamByName('documentocompra_id').AsString:=id;
    ZQuery2.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
        6:begin
              btnguardar.Enabled:=false;
              btnagregar.Enabled:=false;
              btnquitar.Enabled:=false;
              btnagregarpago.Enabled:=false;
              btnquitarpago.Enabled:=false;
              btntomardocumentosAuto.Enabled:=false;

          end;

    end;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure TOrdendePago.modificar;
var
  i:integer;
begin


    MessageDlg('No fue posible modificar los datos.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;

end;


procedure TOrdendePago.solic_cuotasExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure TOrdendePago.solic_importecuotaExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure TOrdendePago.solic_prestadoExit(Sender: TObject);
begin
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure TOrdendePago.sucursal_idSelect(Sender: TObject);
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

procedure TOrdendePago.puntoventa_idSelect(Sender: TObject);
begin
    documentocompra_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+TIPODOCU_ORDENDEPAGO+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;

     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     if tipodocu_id.ItemIndex>-1 then
      documentocompra_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');

end;

procedure TOrdendePago.tipodocu_idChange(Sender: TObject);
begin
    documentocompra_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TOrdendePago.tipodocu_idSelect(Sender: TObject);
begin
    documentocompra_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documentocompra_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TOrdendePago.ZQuery2AfterOpen(DataSet: TDataSet);
begin
    if abm=1 then
      begin
          documentocompra_fecha.Date:=date;
      end
    else
      begin
          documentocompra_fecha.Date:=ZQuery2.FieldByName('documentocompra_fecha').AsDateTime;
          sucursal_id.Buscar(ZQuery2.FieldByName('sucursal_id').AsString);
          sucursal_id.OnSelect(self);
          puntoventa_id.Buscar(ZQuery2.FieldByName('puntoventa_id').AsString);
          puntoventa_id.OnSelect(self);
          proveedor_id.Buscar(ZQuery2.FieldByName('proveedor_id').AsString);
          tipodocu_id.buscar(ZQuery2.FieldByName('tipodocu_id').AsString);
          tipodocu_id.OnSelect(self);
          documentocompra_numero.Text:=ZQuery2.FieldByName('documentocompra_numero').AsString;
          documentocompra_condicionventa.ItemIndex:=ZQuery2.FieldByName('documentocompra_condicionventa').AsInteger;

          personal_id.Buscar(ZQuery2.FieldByName('personal_id').AsString);

//          documentocompra_neto21.Text:=ZQuery2.FieldByName('documentocompra_neto21').AsString;
//          documentocompra_iva21.Text:=ZQuery2.FieldByName('documentocompra_iva21').AsString;
//          documentocompra_neto105.Text:=ZQuery2.FieldByName('documentocompra_neto105').AsString;
//          documentocompra_iva105.Text:=ZQuery2.FieldByName('documentocompra_iva105').AsString;
          documentocompra_total.Text:=ZQuery2.FieldByName('documentocompra_total').AsString;

      end;


//    ZQDocumentocompradetalles.Active:=false;
//    ZQDocumentocompradetalles.SQL.Text:='select * from documentoventadetalles where documentocompra_id="'+id+'"';
//    ZQDocumentocompradetalles.Active:=true;

    ZQDocumentocomprapagos.Active:=false;
    ZQDocumentocomprapagos.SQL.Text:='select documentocomprapagos.*, tipopago_nombre from documentocomprapagos '+
                               'inner join tipospago on documentocomprapagos.tipopago_id=tipospago.tipopago_id '+
                               'where documentocompra_id="'+id+'"';

    ZQDocumentocomprapagos.Active:=true;

    ZQdocumentocompradocus.Active:=false;
    ZQdocumentocompradocus.ParamByName('documentocompra_id').AsString:=id;

    ZQdocumentocompradocus.Active:=true;

//    ZQpagotarjeta.Active:=false;
//    ZQpagotarjeta.ParamByName('documentocompra_id').AsString:=id;
//    ZQpagotarjeta.Active:=true;

    calculartotales;
    calculartotalpagos;
end;

procedure TOrdendePago.agregar;
var
  i: Integer;
  recibo_numero:string;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('documentoscompras','documentocompra_id');

    documentocompra_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,documentocompra_numero.Text);


    ZQOrdendePago.Active:=false;
    ZQOrdendePago.Active:=true;

    recibo_numero:=Princ.NumeroDocumento(princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="'+TIPODOCU_ORDENDEPAGO+'"','tipodocu_id'),'');

    ZQOrdendePago.Insert;
    ZQOrdendePago.FieldByName('documentocompra_condicionventa').AsInteger:=documentocompra_condicionventa.ItemIndex;
    ZQOrdendePago.FieldByName('documentocompra_estado').AsString:=documentocompra_estado;
    ZQOrdendePago.FieldByName('documentocompra_fecha').AsDateTime:=documentocompra_fecha.Date;
    ZQOrdendePago.FieldByName('documentocompra_fechavenc').AsDateTime:=documentocompra_fecha.Date;
    ZQOrdendePago.FieldByName('documentocompra_hora').AsDateTime:=Now;
    ZQOrdendePago.FieldByName('documentocompra_id').asstring:=id;
    ZQOrdendePago.FieldByName('documentocompra_iva105').AsString:='0';
    ZQOrdendePago.FieldByName('documentocompra_iva21').AsString:='0';
    ZQOrdendePago.FieldByName('documentocompra_neto105').AsString:='0';
    ZQOrdendePago.FieldByName('documentocompra_neto21').AsString:='0';
    ZQOrdendePago.FieldByName('documentocompra_numero').AsString:=documentocompra_numero.Text;
    ZQOrdendePago.FieldByName('documentocompra_observacion').AsString:='';
    ZQOrdendePago.FieldByName('documentocompra_pagado').AsFloat:=documentocompra_pagado;
    ZQOrdendePago.FieldByName('documentocompra_saldo').AsFloat:=documentocompra_saldo;
    ZQOrdendePago.FieldByName('documentocompra_total').AsString:=documentocompra_total.Text;
    ZQOrdendePago.FieldByName('personal_id').AsString:=personal_id.codigo;
    ZQOrdendePago.FieldByName('tipodocu_id').AsString:=princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="'+TIPODOCU_ORDENDEPAGO+'"','tipodocu_id');
    ZQOrdendePago.FieldByName('proveedor_id').AsString:=proveedor_id.codigo;

    ZQOrdendePago.Post;

    Princ.AgregarOrdendePago(ZQOrdendePago,ZQdocumentocompradocus,ZQDocumentocomprapagos);

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;


    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;
end;



procedure TOrdendePago.btnagregarClick(Sender: TObject);
begin
    Princ.CargarDocumentoCompraDocu(proveedor_id.codigo,ZQdocumentocompradocus,documentocompra_pagado,false);

    calculartotales;
    calculartotalpagos;
end;

procedure TOrdendePago.btnagregarpagoClick(Sender: TObject);
begin
    calculartotales;
    if Princ.CargarCompraPago(documentocompra_pagado,ZQDocumentocomprapagos, nil) then
      calculartotalpagos;
end;

procedure TOrdendePago.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure TOrdendePago.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este Recibo?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;


    end;
end;

procedure TOrdendePago.btnimprimirClick(Sender: TObject);
begin
    imprimir;
end;

procedure TOrdendePago.btnquitarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQdocumentocompradocus.Delete;
          finally
            calculartotales;
          end;

      end;

end;

procedure TOrdendePago.btnquitarpagoClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este pago?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentocomprapagos.Delete;
          finally
            calculartotalpagos;
          end;



      end;
end;

procedure TOrdendePago.btntomardocumentosAutoClick(Sender: TObject);
begin
    Princ.CargarDocumentoCompraDocu(proveedor_id.codigo,ZQdocumentocompradocus,documentocompra_total.Value,true);

    calculartotales;
    calculartotalpagos;
end;

function TOrdendePago.control:boolean;
var
  error:integer;
begin
    error:=0;

    if roundto(documentocompra_pagado,-2)>roundto(documentocompra_total.Value,-2) then
      error:=1;

//    if solic_numeroimpreso.Text='' then
//      error:=1;


    case error of
        1:begin
              MessageDlg('Total de pagos no puede ser menor que el total de documentos imputados.', mtError, [mbOK], 0);
//              solic_numeroimpreso.SetFocus;

          end;

    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

procedure TOrdendePago.DBGrid1DblClick(Sender: TObject);
begin
    if ZQdocumentocompradocus.Active then
      begin
          if ZQdocumentocompradocus.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQdocumentocompradocus.FieldByName('documentocompra_idpago').AsString,ZQdocumentocompradocus.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

end.
