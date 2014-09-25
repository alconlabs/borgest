unit UnitNotadeDebito2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit, GTBMemo;

type
  TNotadeDebito2 = class(TForm)
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
    ZQDocumentoventadetalles: TZQuery;
    DTSDocumentoventadetalle: TDataSource;
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
    ZQNotacredito: TZQuery;
    ZQExecSql: TZQuery;
    Labelsucursal: TLabel;
    sucursal_id: TSqlComboBox;
    documentoventa_observacion: TGTBMemo;
    Label13: TLabel;
    ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe3: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe4: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe5: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe6: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_listaprecio: TIntegerField;
    ZQDocumentoventadetallesAnterior: TZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField9: TFloatField;
    IntegerField4: TIntegerField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    IntegerField5: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    btnagregar: TButton;
    btnmodificar: TButton;
    btnquitar: TButton;
    DBGrid2: TDBGrid;
    ZQDocumentoventadetallesConceptos: TZQuery;
    IntegerField6: TIntegerField;
    StringField4: TStringField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    FloatField24: TFloatField;
    IntegerField9: TIntegerField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    IntegerField10: TIntegerField;
    DTSDocumentoventadetalleConceptos: TDataSource;
    btnagregarconceptos: TButton;
    btnmodificarconceptos: TButton;
    btnquitarconceptos: TButton;
    ZQDocumentoventadetallesproducto_tipo: TStringField;
    ZQDocumentoventadetallesConceptosproducto_tipo: TStringField;
    btnimprimir: TButton;
    ZQDocumentoventadetallesproducto_codigo: TStringField;
    ZQDocumentoventadetallesproducto_codigobarras: TStringField;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnagregarClick(Sender: TObject);
    procedure tipodocu_idChange(Sender: TObject);
    procedure tipodocu_idSelect(Sender: TObject);
    procedure puntoventa_idSelect(Sender: TObject);
    procedure cliente_idSelect(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sucursal_idSelect(Sender: TObject);
    procedure btnagregarconceptosClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
  protected
    eliminado:boolean;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
    procedure GenerarNC;
    procedure anular;
    procedure calculartotales;
  public
    { Public declarations }
    abm:integer;
    id:string;
    documentoventa_pagado, documentoventa_saldo:real;
    limpiar_al_guardar:boolean;
    tipodocu_nombre:string;
  end;

var
  NotadeDebito2: TNotadeDebito2;

implementation

uses UnitPrinc, Unitventadetalle, Unitventadetalle2, UnitventadetalleConcepto;

{$R *.dfm}

procedure TNotadeDebito2.GenerarNC;
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

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQDocumentoventadetalles.Edit;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
            ZQDocumentoventadetalles.Post;

            ZQDocumentoventadetalles.Next;
        end;

    MessageDlg('Se genero una Nota de Credito para anular la Factura.', mtInformation, [mbOK], 0);

end;

procedure TNotadeDebito2.anular;
begin
//    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
//      begin
//          GenerarNC;
//      end
//    else
//      begin
//          ZQDocumentoventadetalles.First;
//          while not ZQDocumentoventadetalles.Eof do
//              begin
//                  Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString, ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, true);
//                  ZQDocumentoventadetalles.Next;
//              end;
//
//          ZQExecSql.sql.clear;
//          ZQExecSql.sql.add('Update documentosventas set ');
//          ZQExecSql.sql.add('documentoventa_estado=:documentoventa_estado');
//          ZQExecSql.sql.add(' where documentoventa_id=:documentoventa_id');
//          ZQExecSql.parambyname('documentoventa_estado').asstring:='ANULADA';
//          ZQExecSql.parambyname('documentoventa_id').asstring:=id;
//          ZQExecSql.ExecSQL;
//
//          MessageDlg('La Factura fue anulada correctamente.', mtInformation, [mbOK], 0);
//
//      end;
end;


procedure TNotadeDebito2.calculartotales;
var
  bm:TBookmark;
begin

    ZQDocumentoventadetalles.First;

    if ZQDocumentoventadetalles.RecordCount>0 then
      begin
          documentoventa_neto21.Text:='0';
          documentoventa_iva21.Text:='0';
          documentoventa_neto105.Text:='0';
          documentoventa_iva105.Text:='0';
          documentoventa_total.Text:='0';

          bm:=ZQDocumentoventadetalles.GetBookmark;
          ZQDocumentoventadetalles.First;
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

    if ZQDocumentoventadetallesConceptos.RecordCount>0 then
      begin
          documentoventa_neto21.Text:='0';
          documentoventa_iva21.Text:='0';
          documentoventa_neto105.Text:='0';
          documentoventa_iva105.Text:='0';
          documentoventa_total.Text:='0';

          bm:=ZQDocumentoventadetallesConceptos.GetBookmark;
          ZQDocumentoventadetallesConceptos.First;
          while not ZQDocumentoventadetallesConceptos.Eof do
              begin
                  documentoventa_neto21.Text:=floattostr(roundto(documentoventa_neto21.Value+ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_neto21').AsFloat,-2));
                  documentoventa_iva21.Text:=floattostr(roundto(documentoventa_iva21.Value+ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_iva21').AsFloat,-2));
                  documentoventa_neto105.Text:=floattostr(roundto(documentoventa_neto105.Value+ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_neto105').AsFloat,-2));
                  documentoventa_iva105.Text:=floattostr(roundto(documentoventa_iva105.Value+ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_iva105').AsFloat,-2));
                  documentoventa_total.Text:=floattostr(roundto(documentoventa_total.Value+ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_total').AsFloat,-2));

                  ZQDocumentoventadetallesConceptos.Next;
              end;
          ZQDocumentoventadetallesConceptos.GotoBookmark(bm);
      end;

end;

procedure TNotadeDebito2.cliente_idSelect(Sender: TObject);
begin
    cliente_domicilio.Caption:=Princ.buscar('select cliente_domicilio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_domicilio');
    cliente_documentonro.Caption:=Princ.buscar('select cliente_documentonro from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_documentonro');
//    try
//      documentoventa_condicionventa.ItemIndex:=strtoint(Princ.buscar('select cliente_condicionventa from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_condicionventa'));
//    except
//    end;
    documentoventa_listaprecio.ItemIndex:=strtoint(Princ.buscar('select cliente_listaprecio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_listaprecio'));

    personal_id.Buscar(Princ.buscar('select personal_id from clientes where cliente_id="'+cliente_id.codigo+'"','personal_id'));

end;

procedure TNotadeDebito2.imprimir;
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                                   'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                                   'inner join paises on provincias.pais_id=paises.pais_id '+
                                                   'inner join condicioniva on clientes.condicioniva_id=condicioniva.condicioniva_id '+
                                                   'where documentosventas.documentoventa_id="'+id+'"';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select * from documentoventadetalles '+
                                                   'where producto_tipo="CONCEPTO" and documentoventadetalles.documentoventa_id="'+id+'"';


    Princ.VCLReport1.Execute;
end;


procedure TNotadeDebito2.eliminar;
begin
    eliminado:=Princ.BorrarDocumentoVenta(id);

end;



procedure TNotadeDebito2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure TNotadeDebito2.FormCreate(Sender: TObject);
begin
    id:='';
    limpiar_al_guardar:=true;

    

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

    eliminado:=false;

    documentoventa_condicionventa.ItemIndex:=strtoint(CONDICIONVENTA_CTACTE);

//    DBGrid1.Columns.Items[1].FieldName:=Princ.CAMPO_ID_PRODUCTO;

end;

procedure TNotadeDebito2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F4:btnagregar.Click;
        VK_F6:btnquitar.Click;
        VK_F9:btnguardar.Click;
    end;
end;

procedure TNotadeDebito2.FormShow(Sender: TObject);
begin
    if abm=1 then
      id:='';


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

    btnimprimir.Visible:=abm<>1;
    
    limpiar_al_guardar:=abm=1;
    PageControl1.ActivePage:=TabSheet1;
end;

procedure TNotadeDebito2.modificar;
var
  i:integer;
  documentoventadetalle_id:string;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentosventas set');
    ZQExecSql.SQL.Add('tipodocu_id=:tipodocu_id, ');
    ZQExecSql.SQL.Add('documentoventa_fecha=:documentoventa_fecha, ');
    ZQExecSql.SQL.Add('cliente_id=:cliente_id, ');
    ZQExecSql.SQL.Add('personal_id=:personal_id, ');
    ZQExecSql.SQL.Add('documentoventa_condicionventa=:documentoventa_condicionventa, ');
    ZQExecSql.SQL.Add('documentoventa_listaprecio=:documentoventa_listaprecio, ');
    ZQExecSql.SQL.Add('documentoventa_neto21=:documentoventa_neto21, ');
    ZQExecSql.SQL.Add('documentoventa_iva21=:documentoventa_iva21, ');
    ZQExecSql.SQL.Add('documentoventa_neto105=:documentoventa_neto105, ');
    ZQExecSql.SQL.Add('documentoventa_iva105=:documentoventa_iva105, ');
    ZQExecSql.SQL.Add('documentoventa_total=:documentoventa_total, ');
    ZQExecSql.SQL.Add('documentoventa_saldo=:documentoventa_saldo, ');
    ZQExecSql.SQL.Add('documentoventa_pagado=:documentoventa_pagado, ');
    ZQExecSql.SQL.Add('documentoventa_observacion=:documentoventa_observacion, ');
    ZQExecSql.SQL.Add('documentoventa_numero=:documentoventa_numero, ');
    ZQExecSql.SQL.Add('documentoventa_fechavenc=:documentoventa_fechavenc ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');

    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQExecSql.ParamByName('cliente_id').AsString:=cliente_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_neto21').AsString:=documentoventa_neto21.Text;
    ZQExecSql.ParamByName('documentoventa_iva21').AsString:=documentoventa_iva21.Text;
    ZQExecSql.ParamByName('documentoventa_neto105').AsString:=documentoventa_neto105.Text;
    ZQExecSql.ParamByName('documentoventa_iva105').AsString:=documentoventa_iva105.Text;
    ZQExecSql.ParamByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('documentoventa_pagado').AsString:='0';
    ZQExecSql.ParamByName('documentoventa_saldo').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('documentoventa_observacion').AsString:=documentoventa_observacion.Text;
    ZQExecSql.ParamByName('documentoventa_numero').AsString:=documentoventa_numero.Text;
    ZQExecSql.ParamByName('documentoventa_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date + strtoint(Princ.buscar('select cliente_diasvenc from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_diasvenc')));
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;


    ZQDocumentoventadetallesAnterior.Active:=false;
    ZQDocumentoventadetallesAnterior.ParamByName('documentoventa_id').AsString:=id;
    ZQDocumentoventadetallesAnterior.Active:=true;
    ZQDocumentoventadetallesAnterior.First;
    while not ZQDocumentoventadetallesAnterior.Eof do
        begin
            Princ.actualizarstock(ZQDocumentoventadetallesAnterior.FieldByName('producto_id').AsString,ZQDocumentoventadetallesAnterior.FieldByName('documentoventadetalle_cantidad').AsFloat,tipodocu_id.codigo,true);

            ZQDocumentoventadetallesAnterior.Next;
        end;




    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('delete from documentoventadetalles ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;

    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
    ZQExecSql.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
    ZQExecSql.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id) ');
    ZQExecSql.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
    ZQExecSql.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
    ZQExecSql.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id) ');

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            documentoventadetalle_id:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
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
            ZQExecSql.ExecSQL;

            Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString,ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat,tipodocu_id.codigo,false);

            ZQDocumentoventadetalles.Edit;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQDocumentoventadetalles.Post;

            ZQDocumentoventadetalles.Next;
        end;


    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('insert into documentoventadetalles set ');
    ZQExecSql.Sql.Add('producto_tipo=:producto_tipo, ');
    ZQExecSql.Sql.Add('documentoventadetalle_listaprecio=:documentoventadetalle_listaprecio, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe6=:documentoventadetalle_importe6, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe5=:documentoventadetalle_importe5, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe4=:documentoventadetalle_importe4, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe3=:documentoventadetalle_importe3, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe2=:documentoventadetalle_importe2, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe1=:documentoventadetalle_importe1, ');
    ZQExecSql.Sql.Add('documentoventa_id=:documentoventa_id, ');
    ZQExecSql.Sql.Add('documentoventadetalle_cantidadpendiente=:documentoventadetalle_cantidadpendiente, ');
    ZQExecSql.Sql.Add('documentoventadetalle_idorig=:documentoventadetalle_idorig, ');
    ZQExecSql.Sql.Add('producto_id=:producto_id, ');
    ZQExecSql.Sql.Add('documentoventadetalle_observacion=:documentoventadetalle_observacion, ');
    ZQExecSql.Sql.Add('documentoventadetalle_estado=:documentoventadetalle_estado, ');
    ZQExecSql.Sql.Add('documentoventadetalle_nogravado=:documentoventadetalle_nogravado, ');
    ZQExecSql.Sql.Add('documentoventadetalle_iva105=:documentoventadetalle_iva105, ');
    ZQExecSql.Sql.Add('documentoventadetalle_neto105=:documentoventadetalle_neto105, ');
    ZQExecSql.Sql.Add('documentoventadetalle_iva21=:documentoventadetalle_iva21, ');
    ZQExecSql.Sql.Add('documentoventadetalle_neto21=:documentoventadetalle_neto21, ');
    ZQExecSql.Sql.Add('documentoventadetalle_total=:documentoventadetalle_total, ');
    ZQExecSql.Sql.Add('documentoventadetalle_precio=:documentoventadetalle_precio, ');
    ZQExecSql.Sql.Add('documentoventadetalle_cantidad=:documentoventadetalle_cantidad, ');
    ZQExecSql.Sql.Add('documentoventadetalle_descripcion=:documentoventadetalle_descripcion, ');
    ZQExecSql.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id ');

    ZQDocumentoventadetallesConceptos.First;
    while not ZQDocumentoventadetallesConceptos.Eof do
        begin
            ZQExecSql.ParamByName('producto_tipo').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('producto_tipo').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_listaprecio').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_listaprecio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe6').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_importe6').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe5').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_importe5').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe4').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_importe4').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe3').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_importe3').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe2').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_importe2').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe1').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_importe1').AsString;
            ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
            ZQExecSql.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_idorig').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_observacion').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_observacion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_estado').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_estado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_nogravado').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_nogravado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva105').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto105').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva21').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto21').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_total').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_total').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_precio').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_precio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidad').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_descripcion').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.ExecSql;

            ZQDocumentoventadetallesConceptos.Next;
        end;


    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

end;


procedure TNotadeDebito2.sucursal_idSelect(Sender: TObject);
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

procedure TNotadeDebito2.puntoventa_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'"'+
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

procedure TNotadeDebito2.tipodocu_idChange(Sender: TObject);
begin
    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TNotadeDebito2.tipodocu_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure TNotadeDebito2.ZQuery2AfterOpen(DataSet: TDataSet);
begin
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
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'"'+
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

    if abm=1 then
      begin
          documentoventa_fecha.Date:=date;
          cliente_id.ItemIndex:=-1;
          personal_id.ItemIndex:=-1;

          documentoventa_neto21.Text:='0';
          documentoventa_iva21.Text:='0';
          documentoventa_neto105.Text:='0';
          documentoventa_iva105.Text:='0';
          documentoventa_total.Text:='0';
          documentoventa_observacion.Text:='';
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
          documentoventa_observacion.Text:=ZQuery2.FieldByName('documentoventa_observacion').AsString;
      end;


    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.SQL.Text:='select documentoventadetalles.*, productos.producto_codigo, productos.producto_codigobarras from documentoventadetalles inner join productos on documentoventadetalles.producto_id=productos.producto_id where documentoventa_id="'+id+'" and productos.producto_tipo="PRODUCTO"';
    ZQDocumentoventadetalles.Active:=true;

    ZQDocumentoventadetallesConceptos.Active:=false;
    ZQDocumentoventadetallesConceptos.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+id+'" and producto_tipo="CONCEPTO"';
    ZQDocumentoventadetallesConceptos.Active:=true;

    calculartotales;

    try
      cliente_id.SetFocus;
    except
      btnagregar.SetFocus;
    end;
end;

procedure TNotadeDebito2.agregar;
var
  i: Integer;
  recibo_numero:string;
  tipodocu_id_recibo:string;
  documentoventadetalle_id:string;
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
    ZQExecSql.sql.add('documentoventa_total, documentoventa_estado, documentoventa_pagado, documentoventa_saldo, ');
    ZQExecSql.sql.add('cliente_id, personal_id, tipodocu_id, documentoventa_condicionventa, documentoventa_fechavenc, documentoventa_listaprecio, documentoventa_observacion) ');
    ZQExecSql.sql.add('values (:documentoventa_id, :documentoventa_numero, :documentoventa_fecha, :documentoventa_hora, ');
    ZQExecSql.sql.add(':documentoventa_neto21, :documentoventa_iva21, :documentoventa_neto105, :documentoventa_iva105, :documentoventa_netonogravado, ');
    ZQExecSql.sql.add(':documentoventa_total, :documentoventa_estado, :documentoventa_pagado, :documentoventa_saldo, ');
    ZQExecSql.sql.add(':cliente_id, :personal_id, :tipodocu_id, :documentoventa_condicionventa, :documentoventa_fechavenc, :documentoventa_listaprecio, :documentoventa_observacion)');
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
    ZQExecSql.ParamByName('documentoventa_saldo').AsString:=documentoventa_total.Text;
    ZQExecSql.ParamByName('cliente_id').AsString:=cliente_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date + strtoint(Princ.buscar('select cliente_diasvenc from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_diasvenc')));
    ZQExecSql.ParamByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;
    ZQExecSql.ParamByName('documentoventa_observacion').AsString:=documentoventa_observacion.Text;
    ZQExecSql.ExecSQL;

    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo, documentoventa_numero.Text);

    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
    ZQExecSql.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
    ZQExecSql.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id, documentoventadetalle_listaprecio) ');
    ZQExecSql.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
    ZQExecSql.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
    ZQExecSql.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id, :documentoventadetalle_listaprecio) ');

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            documentoventadetalle_id:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
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

            ZQDocumentoventadetalles.Edit;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:=documentoventadetalle_id;
            ZQDocumentoventadetalles.Post;

            Princ.actualizarstock(ZQDocumentoventadetalles.FieldByName('producto_id').AsString, ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, false);

            ZQDocumentoventadetalles.Next;
        end;



    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('insert into documentoventadetalles set ');
    ZQExecSql.Sql.Add('producto_tipo=:producto_tipo, ');
    ZQExecSql.Sql.Add('documentoventadetalle_listaprecio=:documentoventadetalle_listaprecio, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe6=:documentoventadetalle_importe6, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe5=:documentoventadetalle_importe5, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe4=:documentoventadetalle_importe4, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe3=:documentoventadetalle_importe3, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe2=:documentoventadetalle_importe2, ');
    ZQExecSql.Sql.Add('documentoventadetalle_importe1=:documentoventadetalle_importe1, ');
    ZQExecSql.Sql.Add('documentoventa_id=:documentoventa_id, ');
    ZQExecSql.Sql.Add('documentoventadetalle_cantidadpendiente=:documentoventadetalle_cantidadpendiente, ');
    ZQExecSql.Sql.Add('documentoventadetalle_idorig=:documentoventadetalle_idorig, ');
    ZQExecSql.Sql.Add('producto_id=:producto_id, ');
    ZQExecSql.Sql.Add('documentoventadetalle_observacion=:documentoventadetalle_observacion, ');
    ZQExecSql.Sql.Add('documentoventadetalle_estado=:documentoventadetalle_estado, ');
    ZQExecSql.Sql.Add('documentoventadetalle_nogravado=:documentoventadetalle_nogravado, ');
    ZQExecSql.Sql.Add('documentoventadetalle_iva105=:documentoventadetalle_iva105, ');
    ZQExecSql.Sql.Add('documentoventadetalle_neto105=:documentoventadetalle_neto105, ');
    ZQExecSql.Sql.Add('documentoventadetalle_iva21=:documentoventadetalle_iva21, ');
    ZQExecSql.Sql.Add('documentoventadetalle_neto21=:documentoventadetalle_neto21, ');
    ZQExecSql.Sql.Add('documentoventadetalle_total=:documentoventadetalle_total, ');
    ZQExecSql.Sql.Add('documentoventadetalle_precio=:documentoventadetalle_precio, ');
    ZQExecSql.Sql.Add('documentoventadetalle_cantidad=:documentoventadetalle_cantidad, ');
    ZQExecSql.Sql.Add('documentoventadetalle_descripcion=:documentoventadetalle_descripcion, ');
    ZQExecSql.Sql.Add('documentoventadetalle_id=:documentoventadetalle_id ');

    ZQDocumentoventadetallesConceptos.First;
    while not ZQDocumentoventadetallesConceptos.Eof do
        begin
            ZQExecSql.ParamByName('producto_tipo').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('producto_tipo').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_listaprecio').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_listaprecio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe6').AsString:='0';
            ZQExecSql.ParamByName('documentoventadetalle_importe5').AsString:='0';
            ZQExecSql.ParamByName('documentoventadetalle_importe4').AsString:='0';
            ZQExecSql.ParamByName('documentoventadetalle_importe3').AsString:='0';
            ZQExecSql.ParamByName('documentoventadetalle_importe2').AsString:='0';
            ZQExecSql.ParamByName('documentoventadetalle_importe1').AsString:='0';
            ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
            ZQExecSql.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_idorig').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_observacion').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_observacion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_estado').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_estado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_nogravado').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_nogravado').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva105').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto105').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_iva21').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_neto21').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_total').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_total').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_precio').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_precio').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_cantidad').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_descripcion').AsString:=ZQDocumentoventadetallesConceptos.FieldByName('documentoventadetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQExecSql.ExecSql;

            ZQDocumentoventadetallesConceptos.Next;
        end;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    
end;



procedure TNotadeDebito2.btnagregarClick(Sender: TObject);
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
    end;
end;

procedure TNotadeDebito2.btnagregarconceptosClick(Sender: TObject);
begin
    try
      ventadetalleconcepto:= Tventadetalleconcepto.Create(self);
    finally
      ventadetalleconcepto.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      ventadetalleconcepto.documentoventadetalle_listaprecio:=documentoventa_listaprecio.ItemIndex;
      if ventadetalleconcepto.ShowModal=mrOk then
        begin
            princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetallesConceptos, ventadetalleconcepto.ZQDocumentoventadetalles);

        end;

      ventadetalleconcepto.Free;
      calculartotales;
    end;
end;

procedure TNotadeDebito2.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure TNotadeDebito2.btnguardarClick(Sender: TObject);
begin
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
              if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
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

    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;
end;

procedure TNotadeDebito2.btnimprimirClick(Sender: TObject);
begin
    imprimir;
end;

procedure TNotadeDebito2.btnquitarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentoventadetalles.Delete;
          finally
            calculartotales;
          end;

      end;

end;

function TNotadeDebito2.control:boolean;
var
  error:integer;
begin
    error:=0;

    if abm=2 then
      begin
          if ZQuery2.FieldByName('documentoventa_pagado').AsFloat>0 then
            error:=2

      end;

    if abm=5 then
      begin
          if ZQuery2.FieldByName('documentoventa_pagado').AsFloat>0 then
            error:=3
      end;

    case error of
        1:begin
              MessageDlg('Ingrese numero impreso.', mtError, [mbOK], 0);
//              solic_numeroimpreso.SetFocus;

          end;
        2:begin
              MessageDlg('No se puede modificar el documento porque tiene pagos asociados.', mtError, [mbOK], 0);

          end;
        3:begin
              MessageDlg('No se puede eliminar el documento porque tiene pagos asociados.', mtError, [mbOK], 0);

          end;
    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
