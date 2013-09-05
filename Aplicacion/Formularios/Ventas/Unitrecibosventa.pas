unit Unitrecibosventa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit;

type
  Trecibosventa = class(TForm)
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
    DTSDocumentoventadocus: TDataSource;
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
    DBGrid1: TDBGrid;
    ZQDocumentoventadetalles: TZQuery;
    ZQDocumentoventadetallesdocumentoventadetalle_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_descripcion: TStringField;
    ZQDocumentoventadetallesdocumentoventadetalle_cantidad: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_neto21: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_iva21: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_neto105: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_iva105: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_nogravado: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_estado: TStringField;
    ZQDocumentoventadetallesdocumentoventadetalle_observacion: TStringField;
    ZQDocumentoventadetallesproducto_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_idorig: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQDocumentoventadetallesdocumentoventa_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventadoc_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventadoc_importe: TFloatField;
    ZQdocumentoventadocusdocumentoventa_pagado: TFloatField;
    ZQdocumentoventadocusdocumentoventa_saldo: TFloatField;
    ZQdocumentoventadocusdocumentoventa_estado: TStringField;
    ZQdocumentoventadocusdocumentoventa_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_idpago: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_id_1: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_numero: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_fecha: TDateField;
    ZQdocumentoventadocusdocumentoventa_hora: TTimeField;
    ZQdocumentoventadocusdocumentoventa_neto21: TFloatField;
    ZQdocumentoventadocusdocumentoventa_iva21: TFloatField;
    ZQdocumentoventadocusdocumentoventa_neto105: TFloatField;
    ZQdocumentoventadocusdocumentoventa_iva105: TFloatField;
    ZQdocumentoventadocusdocumentoventa_netonogravado: TFloatField;
    ZQdocumentoventadocusdocumentoventa_total: TFloatField;
    ZQdocumentoventadocusdocumentoventa_estado_1: TStringField;
    ZQdocumentoventadocusdocumentoventa_pagado_1: TFloatField;
    ZQdocumentoventadocusdocumentoventa_saldo_1: TFloatField;
    ZQdocumentoventadocusdocumentoventa_observacion: TStringField;
    ZQdocumentoventadocuscliente_id: TIntegerField;
    ZQdocumentoventadocuspersonal_id: TIntegerField;
    ZQdocumentoventadocustipodocu_id: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_condicionventa: TIntegerField;
    ZQdocumentoventadocusdocumentoventa_fechavenc: TDateField;
    ZQdocumentoventadocusdocumentoventa_listaprecio: TIntegerField;
    ZQdocumentoventadocustipodocu_id_1: TIntegerField;
    ZQdocumentoventadocustipodocu_nombre: TStringField;
    ZQdocumentoventadocustipodocu_tipo: TStringField;
    ZQdocumentoventadocustipodocu_caja: TIntegerField;
    ZQdocumentoventadocustipodocu_stock: TIntegerField;
    ZQdocumentoventadocustipodocu_iva: TIntegerField;
    ZQdocumentoventadocustipodocu_fiscal: TIntegerField;
    ZQdocumentoventadocustipodocu_ultimonumero: TIntegerField;
    ZQdocumentoventadocuspuntoventa_id: TIntegerField;
    ZQdocumentoventadocustipodocu_letra: TStringField;
    ZQdocumentoventadocuspuntoventa_id_1: TIntegerField;
    ZQdocumentoventadocuspuntoventa_numero: TIntegerField;
    ZQdocumentoventadocuspuntoventa_descripcion: TStringField;
    ZQdocumentoventadocussucursal_id: TIntegerField;
    ZQDocumentopagosdocumentopago_id: TIntegerField;
    ZQDocumentopagosdocumentopago_nombre: TStringField;
    ZQDocumentopagosdocumentopago_importe: TFloatField;
    ZQDocumentopagostipopago_id: TIntegerField;
    ZQDocumentopagosdocumentoventa_id: TIntegerField;
    ZQDocumentopagostipopago_nombre: TStringField;
    Label14: TLabel;
    sucursal_id: TSqlComboBox;
    Label16: TLabel;
    Editdocumentoventa_pagado: TMoneyEdit;
    btntomardocumentosAuto: TButton;
    Label17: TLabel;
    documentoventa_totalimputado: TMoneyEdit;
    Label18: TLabel;
    documentoventa_nrodetallepago: TEdit;
    btnimprimir: TButton;
    ZQdocumentoventadocusdocumentoventadoc_tiporelacion: TStringField;
    ZQdocumentoventadocusdocumentoventa_equipo1: TStringField;
    ZQdocumentoventadocusdocumentoventa_equipo2: TStringField;
    ZQdocumentoventadocusdocumentoventa_formapago: TStringField;
    ZQdocumentoventadocusdocumentoventa_nrodetallepago: TStringField;
    ZQdocumentoventadocusdocumentoventa_solicitudcliente: TStringField;
    ZQdocumentoventadocusdocumentoventa_trabajorealizado: TStringField;
    ZQdocumentoventadocuscaja_id: TIntegerField;
    ZQdocumentoventadocustipodocu_debcred: TStringField;
    ZQdocumentoventadocustipodocufiscal_id: TIntegerField;
    ZQdocumentoventadocustipodocu_preimpresos: TIntegerField;
    ZQdocumentoventadocustipodocu_impresora: TStringField;
    ZQdocumentoventadocustipodocu_copias: TIntegerField;
    ZQdocumentoventadocustipodocu_preview: TIntegerField;
    ZQdocumentoventadocustipodocu_prompt: TIntegerField;
    ZQdocumentoventadocustipodocu_ctacte: TIntegerField;
    ZQdocumentoventadocustipodocu_archivoimpresion: TStringField;
    ZQdocumentoventadocustipodocu_leyenda: TStringField;
    ZQdocumentoventadocustipodocu_nombreabrev: TStringField;
    ZQdocumentoventadocustipodocu_manual: TIntegerField;
    ZQdocumentoventadocuspuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQdocumentoventadocuspuntoventa_controladorfiscalpuerto: TIntegerField;
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
    procedure sucursal_idSelect(Sender: TObject);
    procedure btnquitarpagoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btntomardocumentosAutoClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    documentoventa_estado:string;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
  public
    { Public declarations }
    abm:integer;
    id:string;
    documentoventa_pagado, documentoventa_saldo:real;
    procedure calculartotales;
    procedure calculartotalpagos;
  end;

var
  recibosventa: Trecibosventa;

implementation

uses UnitPrinc, Unitventadetalle, UnitDocumentosVentasPendientes;

{$R *.dfm}


procedure Trecibosventa.calculartotalpagos;
begin
    documentoventa_total.Value:=0;
    ZQDocumentopagos.First;
    while not ZQDocumentopagos.Eof do
        begin
            documentoventa_total.Value:=roundto(documentoventa_total.Value+ZQDocumentopagos.FieldByName('documentopago_importe').AsFloat,-2);

            ZQDocumentopagos.Next;
        end;

    documentoventa_estado:='PENDIENTE';
    documentoventa_saldo:=documentoventa_total.Value-documentoventa_pagado;
    if documentoventa_saldo=0 then
      documentoventa_estado:='PAGADA';

    Editdocumentoventa_pagado.Value:=documentoventa_total.Value;
end;


procedure Trecibosventa.calculartotales;
var
  bm:TBookmark;
begin
    bm:=ZQdocumentoventadocus.GetBookmark;
    ZQdocumentoventadocus.First;
    documentoventa_neto21.Text:='0';
    documentoventa_iva21.Text:='0';
    documentoventa_neto105.Text:='0';
    documentoventa_iva105.Text:='0';
    documentoventa_total.Text:='0';
    documentoventa_totalimputado.Text:='0';
    documentoventa_pagado:=0;

    while not ZQdocumentoventadocus.Eof do
        begin
            documentoventa_pagado:=roundto(documentoventa_pagado+ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').AsFloat,-2);



            ZQdocumentoventadocus.Next;
        end;

    ZQdocumentoventadocus.GotoBookmark(bm);
    documentoventa_totalimputado.Value:=documentoventa_pagado;

end;

procedure Trecibosventa.cliente_idSelect(Sender: TObject);
begin
    cliente_domicilio.Caption:=Princ.buscar('select cliente_domicilio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_domicilio');
    cliente_documentonro.Caption:=Princ.buscar('select cliente_documentonro from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_documentonro');
    documentoventa_listaprecio.ItemIndex:=strtoint(Princ.buscar('select cliente_listaprecio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_listaprecio'));
    personal_id.Buscar(Princ.buscar('select personal_id from clientes where cliente_id="'+cliente_id.codigo+'"','personal_id'));
end;

procedure Trecibosventa.imprimir;
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\'+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                                   'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                                   'inner join paises on provincias.pais_id=paises.pais_id '+
                                                   'inner join condicioniva on clientes.condicioniva_id=condicioniva.condicioniva_id '+
                                                   'where documentosventas.documentoventa_id="'+id+'"';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select * from documentoventadocus '+
                                                   'inner join documentosventas on documentoventadocus.documentoventa_idpago=documentosventas.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where documentoventadocus.documentoventa_id="'+id+'"';

    Princ.VCLReport1.Report.Datainfo.Items[3].sql:='select documentopagos.*, tipopago_nombre from documentopagos '+
                                                   'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                                   'where documentopagos.documentoventa_id="'+id+'"';

    Princ.VCLReport1.Execute;
end;


procedure Trecibosventa.eliminar;
begin
    Princ.BorrarDocumentoVenta(id);

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Trecibosventa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Trecibosventa.FormCreate(Sender: TObject);
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
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="Recibo de Venta"'+
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

    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=-1;
    
    personal_id.llenarcombo;
    personal_id.ItemIndex:=-1;

end;

procedure Trecibosventa.FormShow(Sender: TObject);
begin
    btnimprimir.Visible:=abm<>1;

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

procedure Trecibosventa.modificar;
var
  i:integer;
begin


    MessageDlg('No fue posible modificar los datos.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;

end;


procedure Trecibosventa.solic_cuotasExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure Trecibosventa.solic_importecuotaExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure Trecibosventa.solic_prestadoExit(Sender: TObject);
begin
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure Trecibosventa.sucursal_idSelect(Sender: TObject);
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

procedure Trecibosventa.puntoventa_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="Recibo de Venta"'+
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

procedure Trecibosventa.tipodocu_idChange(Sender: TObject);
begin
    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Trecibosventa.tipodocu_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Trecibosventa.ZQuery2AfterOpen(DataSet: TDataSet);
begin
    if abm=1 then
      begin
          documentoventa_fecha.Date:=date;
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
          documentoventa_numero.Text:=ZQuery2.FieldByName('documentoventa_numero').AsString;
          documentoventa_condicionventa.ItemIndex:=ZQuery2.FieldByName('documentoventa_condicionventa').AsInteger;
          documentoventa_listaprecio.ItemIndex:=ZQuery2.FieldByName('documentoventa_listaprecio').AsInteger;

          personal_id.Buscar(ZQuery2.FieldByName('personal_id').AsString);

          documentoventa_neto21.Text:=ZQuery2.FieldByName('documentoventa_neto21').AsString;
          documentoventa_iva21.Text:=ZQuery2.FieldByName('documentoventa_iva21').AsString;
          documentoventa_neto105.Text:=ZQuery2.FieldByName('documentoventa_neto105').AsString;
          documentoventa_iva105.Text:=ZQuery2.FieldByName('documentoventa_iva105').AsString;
          documentoventa_total.Text:=ZQuery2.FieldByName('documentoventa_total').AsString;
          documentoventa_nrodetallepago.Text:=ZQuery2.FieldByName('documentoventa_nrodetallepago').AsString;

      end;


    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+id+'"';
    ZQDocumentoventadetalles.Active:=true;

    ZQDocumentopagos.Active:=false;
    ZQDocumentopagos.SQL.Text:='select documentopagos.*, tipopago_nombre from documentopagos '+
                               'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                               'where documentoventa_id="'+id+'"';

    ZQDocumentopagos.Active:=true;
    ZQdocumentoventadocus.Active:=false;
    ZQdocumentoventadocus.ParamByName('documentoventa_id').AsString:=id;

    ZQdocumentoventadocus.Active:=true;

    ZQpagotarjeta.Active:=false;
    ZQpagotarjeta.ParamByName('documentoventa_id').AsString:=id;
    ZQpagotarjeta.Active:=true;


end;

procedure Trecibosventa.agregar;
var
  i: Integer;
  recibo_numero:string;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('documentosventas','documentoventa_id');

    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,documentoventa_numero.Text);


    ZQRecibo.Active:=false;
    ZQRecibo.Active:=true;

    recibo_numero:=Princ.NumeroDocumento(princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="Recibo de Venta"','tipodocu_id'),'');

    ZQRecibo.Insert;
    ZQRecibo.FieldByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQRecibo.FieldByName('documentoventa_estado').AsString:=documentoventa_estado;
    ZQRecibo.FieldByName('documentoventa_fecha').AsDateTime:=documentoventa_fecha.Date;
    ZQRecibo.FieldByName('documentoventa_fechavenc').AsDateTime:=documentoventa_fecha.Date;
    ZQRecibo.FieldByName('documentoventa_hora').AsDateTime:=Now;
    ZQRecibo.FieldByName('documentoventa_id').asstring:=id;
    ZQRecibo.FieldByName('documentoventa_iva105').AsString:='0';
    ZQRecibo.FieldByName('documentoventa_iva21').AsString:='0';
    ZQRecibo.FieldByName('documentoventa_listaprecio').AsInteger:=0;
    ZQRecibo.FieldByName('documentoventa_neto105').AsString:='0';
    ZQRecibo.FieldByName('documentoventa_neto21').AsString:='0';
    ZQRecibo.FieldByName('documentoventa_netonogravado').AsString:='0';
    ZQRecibo.FieldByName('documentoventa_numero').AsString:=documentoventa_numero.Text;
    ZQRecibo.FieldByName('documentoventa_observacion').AsString:='';
    ZQRecibo.FieldByName('documentoventa_pagado').AsFloat:=documentoventa_pagado;
    ZQRecibo.FieldByName('documentoventa_saldo').AsFloat:=documentoventa_saldo;
    ZQRecibo.FieldByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQRecibo.FieldByName('personal_id').AsString:=personal_id.codigo;
    ZQRecibo.FieldByName('tipodocu_id').AsString:=princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="Recibo de Venta"','tipodocu_id');
    ZQRecibo.FieldByName('cliente_id').AsString:=cliente_id.codigo;
    ZQRecibo.FieldByName('documentoventa_nrodetallepago').AsString:=documentoventa_nrodetallepago.Text;

    ZQRecibo.Post;

//          ZQdocumentoventadocus.Active:=false;
//          ZQdocumentoventadocus.Active:=true;
//          ZQdocumentoventadocus.Insert;
//          ZQdocumentoventadocus.FieldByName('documentoventa_estado').asstring:='PAGADA';
//          ZQdocumentoventadocus.FieldByName('documentoventa_id').asstring:='0';
//          ZQdocumentoventadocus.FieldByName('documentoventa_idpago').asstring:=id;
//          ZQdocumentoventadocus.FieldByName('documentoventa_pagado').asstring:=documentoventa_total.Text;
//          ZQdocumentoventadocus.FieldByName('documentoventa_saldo').asstring:='0';
//          ZQdocumentoventadocus.FieldByName('documentoventadoc_id').asstring:='0';
//          ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').asstring:=documentoventa_total.Text;
//          ZQdocumentoventadocus.Post;


    //ZQDocumentopagos.Insert;
//          ZQDocumentopagos.FieldByName('documentopago_id').asstring:='0';
//          ZQDocumentopagos.FieldByName('documentopago_importe').asstring:=documentoventa_total.Text;
//          ZQDocumentopagos.FieldByName('documentopago_nombre').asstring:='EVECTIVO';
//          ZQDocumentopagos.FieldByName('documentoventa_id').asstring:='0';
//          ZQDocumentopagos.FieldByName('tipopago_id').asstring:='1';
//          ZQDocumentopagos.Post;

    Princ.AgregarRecibo(ZQRecibo,ZQdocumentoventadocus,ZQDocumentopagos);

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;


    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;
end;



procedure Trecibosventa.btnagregarClick(Sender: TObject);
begin
    Princ.CargarDocumentoVentaDocu(cliente_id.codigo,ZQdocumentoventadocus,documentoventa_pagado,false);

    calculartotales;
    calculartotalpagos;
end;

procedure Trecibosventa.btnagregarpagoClick(Sender: TObject);
begin
    calculartotales;
    if Princ.CargarPago(documentoventa_pagado,ZQDocumentopagos, ZQpagotarjeta) then
      calculartotalpagos;
end;

procedure Trecibosventa.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Trecibosventa.btnguardarClick(Sender: TObject);
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

procedure Trecibosventa.btnimprimirClick(Sender: TObject);
begin
    imprimir;
end;

procedure Trecibosventa.btnquitarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQdocumentoventadocus.Delete;
          finally
            calculartotales;
          end;

      end;

end;

procedure Trecibosventa.btnquitarpagoClick(Sender: TObject);
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

procedure Trecibosventa.btntomardocumentosAutoClick(Sender: TObject);
begin
    Princ.CargarDocumentoVentaDocu(cliente_id.codigo,ZQdocumentoventadocus,documentoventa_total.Value,true);

    calculartotales;
    calculartotalpagos;
end;

function Trecibosventa.control:boolean;
var
  error:integer;
begin
    error:=0;

    if roundto(documentoventa_pagado,-2)>roundto(documentoventa_total.Value,-2) then
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

procedure Trecibosventa.DBGrid1DblClick(Sender: TObject);
begin
    if ZQdocumentoventadocus.Active then
      begin
          if ZQdocumentoventadocus.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQdocumentoventadocus.FieldByName('documentoventa_idpago').AsString,ZQdocumentoventadocus.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

end.
