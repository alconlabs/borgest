unit Unitnotacreditoventa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit;

type
  Tnotacreditoventa = class(TForm)
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
    DTSPagos: TDataSource;
    ZQpagotarjeta: TZQuery;
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
    ZQDocumentopagosdocumentopago_id: TIntegerField;
    ZQDocumentopagosdocumentopago_nombre: TStringField;
    ZQDocumentopagosdocumentopago_importe: TFloatField;
    ZQDocumentopagostipopago_id: TIntegerField;
    ZQDocumentopagosdocumentoventa_id: TIntegerField;
    ZQDocumentopagostipopago_nombre: TStringField;
    Label14: TLabel;
    sucursal_id: TSqlComboBox;
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
    procedure btncancelarClick(Sender: TObject);
    procedure sucursal_idSelect(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
    procedure calculartotales;
    procedure calculartotalpagos;
  public
    { Public declarations }
    abm:integer;
    id:string;
    documentoventa_pagado, documentoventa_saldo:real;
  end;

var
  notacreditoventa: Tnotacreditoventa;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}

procedure Tnotacreditoventa.calculartotalpagos;
begin
    documentoventa_saldo:=documentoventa_total.Value;
    documentoventa_pagado:=0;
    while not ZQDocumentopagos.Eof do
        begin
            documentoventa_pagado:=documentoventa_pagado+ZQDocumentopagos.FieldByName('documentopago_importe').AsFloat;

            documentoventa_saldo:=documentoventa_total.Value-documentoventa_pagado;


            ZQDocumentopagos.Next;
        end;

end;


procedure Tnotacreditoventa.calculartotales;
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

procedure Tnotacreditoventa.cliente_idSelect(Sender: TObject);
begin
    cliente_domicilio.Caption:=Princ.buscar('select cliente_domicilio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_domicilio');
    cliente_documentonro.Caption:=Princ.buscar('select cliente_documentonro from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_documentonro');
    documentoventa_listaprecio.ItemIndex:=strtoint(Princ.buscar('select cliente_listaprecio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_listaprecio'));

    if Princ.buscar('select condicioniva_id from clientes where cliente_id="'+cliente_id.codigo+'"','condicioniva_id')='2' then
      tipodocu_id.Buscar('A',true)
    else
      tipodocu_id.Buscar('B',true);
    
end;

procedure Tnotacreditoventa.imprimir;
begin

end;


procedure Tnotacreditoventa.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from documentoventadocus where documentoventa_id=:documentoventa_id');
    ZQuery2.ParamByName('documentoventa_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from documentoventadetalles where documentoventa_id=:documentoventa_id');
    ZQuery2.ParamByName('documentoventa_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from documentosventas where documentoventa_id=:documentoventa_id');
    ZQuery2.ParamByName('documentoventa_id').AsString:=id;
    ZQuery2.ExecSQL;


    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Tnotacreditoventa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tnotacreditoventa.FormCreate(Sender: TObject);
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
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="Nota de Credito de Venta"'+
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

procedure Tnotacreditoventa.FormShow(Sender: TObject);
begin
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

procedure Tnotacreditoventa.modificar;
var
  i:integer;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update solicitudes set ');
    ZQuery2.sql.add('cliente_id=:cliente_id, ');
    ZQuery2.sql.add('solic_cuotas=:solic_cuotas, ');
    ZQuery2.sql.add('solic_cuotatipo=:solic_cuotatipo, ');
    ZQuery2.sql.add('solic_fecha=:solic_fecha, ');
    ZQuery2.sql.add('solic_importecuota=:solic_importecuota, ');
    ZQuery2.sql.add('solic_total=:solic_total, ');
    ZQuery2.sql.add('solic_vencuno=:solic_vencuno, ');
    ZQuery2.sql.add('vendedor_id=:vendedor_id, ');
    ZQuery2.sql.add('solic_numero=:solic_numero, ');
    ZQuery2.sql.add('solic_numeroimpreso=:solic_numeroimpreso, ');
    ZQuery2.sql.add('solic_prestado=:solic_prestado, ');
    ZQuery2.sql.add('solic_total2=:solic_total2, ');
    ZQuery2.sql.add(' where solic_id=:solic_id');
//    ZQuery2.parambyname('cliente_id').asstring:=cliente_id.codigo;
//    ZQuery2.parambyname('solic_cuotas').asstring:=solic_cuotas.text;
//    ZQuery2.parambyname('solic_cuotatipo').AsInteger:=solic_cuotatipo.ItemIndex;
//    ZQuery2.parambyname('solic_fecha').asstring:=formatdatetime('yyyy-mm-dd',solic_fecha.Date);
//    ZQuery2.parambyname('solic_importecuota').asstring:=solic_importecuota.text;
//    ZQuery2.parambyname('solic_total').asstring:=solic_total.text;
//    ZQuery2.parambyname('solic_vencuno').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date);
//    ZQuery2.parambyname('vendedor_id').asstring:=vendedor_id.codigo;
//    ZQuery2.parambyname('solic_id').asstring:=id;
//    ZQuery2.parambyname('solic_numero').asstring:=solic_numero.text;
//    ZQuery2.parambyname('solic_numeroimpreso').asstring:=solic_numeroimpreso.text;
//    ZQuery2.parambyname('solic_prestado').asstring:=solic_prestado.text;
//    ZQuery2.parambyname('solic_total2').asstring:=solic_total.text;
//    ZQuery2.ExecSQL;




//    case solic_cuotatipo.ItemIndex of
//        0:begin
//              tipocuota:=7;
//          end;
//        1:begin
//              tipocuota:=14;
//          end;
//        2:begin
//              tipocuota:=1;
//          end;
//    end;


    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from solicitudcuotas');
    ZQuery2.sql.add(' where solic_id=:solic_id');
    ZQuery2.parambyname('solic_id').asstring:=id;
    ZQuery2.ExecSQL;



//    for i := 1 to solic_cuotas.IntValue do
//      begin
//          ZQuery2.sql.clear;
//          ZQuery2.sql.add('Insert into solicitudcuotas (solic_id, soliccuota_estado, ');
//          ZQuery2.sql.add('soliccuota_fechavenc, soliccuota_id, soliccuota_importecuota, ');
//          ZQuery2.sql.add('soliccuota_nrocuota, soliccuota_pago, soliccuota_saldo) values (');
//          ZQuery2.sql.add(':solic_id, :soliccuota_estado, :soliccuota_fechavenc, ');
//          ZQuery2.sql.add(':soliccuota_id, :soliccuota_importecuota, :soliccuota_nrocuota, ');
//          ZQuery2.sql.add(':soliccuota_pago, :soliccuota_saldo)');
//          ZQuery2.parambyname('solic_id').asstring:=id;
//          ZQuery2.parambyname('soliccuota_estado').asstring:='PENDIENTE';
//          ZQuery2.parambyname('soliccuota_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date+(tipocuota*(i-1)));
//          ZQuery2.parambyname('soliccuota_id').asstring:=Princ.codigo('solicitudcuotas','soliccuota_id');
//          ZQuery2.parambyname('soliccuota_importecuota').asstring:=solic_importecuota.text;
//          ZQuery2.parambyname('soliccuota_nrocuota').AsInteger:=i;
//          ZQuery2.parambyname('soliccuota_pago').asstring:='0';
//          ZQuery2.parambyname('soliccuota_saldo').asstring:=solic_importecuota.text;
//          ZQuery2.ExecSQL;
//
//      end;



//    ZQuery2.SQL.Clear;
//    ZQuery2.SQL.Add('commit');
//    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;

end;


procedure Tnotacreditoventa.solic_cuotasExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure Tnotacreditoventa.solic_importecuotaExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure Tnotacreditoventa.solic_prestadoExit(Sender: TObject);
begin
//    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure Tnotacreditoventa.sucursal_idSelect(Sender: TObject);
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

procedure Tnotacreditoventa.puntoventa_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="Nota de Credito de Venta"'+
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

procedure Tnotacreditoventa.tipodocu_idChange(Sender: TObject);
begin
    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tnotacreditoventa.tipodocu_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tnotacreditoventa.ZQuery2AfterOpen(DataSet: TDataSet);
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
          cliente_id.Buscar(ZQuery2.FieldByName('cliente_id').AsString);
          tipodocu_id.buscar(ZQuery2.FieldByName('tipodocu_id').AsString);
          documentoventa_numero.Text:=ZQuery2.FieldByName('documentoventa_numero').AsString;
          documentoventa_condicionventa.ItemIndex:=ZQuery2.FieldByName('documentoventa_condicionventa').AsInteger;
          documentoventa_listaprecio.ItemIndex:=ZQuery2.FieldByName('documentoventa_listaprecio').AsInteger;

          personal_id.Buscar(ZQuery2.FieldByName('personal_id').AsString);

          documentoventa_neto21.Text:=ZQuery2.FieldByName('documentoventa_neto21').AsString;
          documentoventa_iva21.Text:=ZQuery2.FieldByName('documentoventa_iva21').AsString;
          documentoventa_neto105.Text:=ZQuery2.FieldByName('documentoventa_neto105').AsString;
          documentoventa_iva105.Text:=ZQuery2.FieldByName('documentoventa_iva105').AsString;
          documentoventa_total.Text:=ZQuery2.FieldByName('documentoventa_total').AsString;

      end;


    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+id+'"';
    ZQDocumentoventadetalles.Active:=true;

    ZQDocumentopagos.Active:=false;
    ZQDocumentopagos.SQL.Text:='select documentopagos.*, tipopago_nombre from documentopagos '+
                               'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                               'where documentoventa_id="'+id+'"';

    ZQDocumentopagos.Active:=true;

end;

procedure Tnotacreditoventa.agregar;
var
  i: Integer;
  recibo_numero:string;
  tipodocu_id_recibo:string;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('documentosventas','documentoventa_id');

    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,documentoventa_numero.Text);
    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
      documentoventa_numero.Text:='0';


    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into documentosventas (documentoventa_id, documentoventa_numero, documentoventa_fecha, documentoventa_hora, ');
    ZQuery2.sql.add('documentoventa_neto21, documentoventa_iva21, documentoventa_neto105, documentoventa_iva105, documentoventa_netonogravado, ');
    ZQuery2.sql.add('documentoventa_total, documentoventa_estado, documentoventa_pagado, documentoventa_saldo, documentoventa_observacion, ');
    ZQuery2.sql.add('cliente_id, personal_id, tipodocu_id, documentoventa_condicionventa, documentoventa_fechavenc, documentoventa_listaprecio) ');
    ZQuery2.sql.add('values (:documentoventa_id, :documentoventa_numero, :documentoventa_fecha, :documentoventa_hora, ');
    ZQuery2.sql.add(':documentoventa_neto21, :documentoventa_iva21, :documentoventa_neto105, :documentoventa_iva105, :documentoventa_netonogravado, ');
    ZQuery2.sql.add(':documentoventa_total, :documentoventa_estado, :documentoventa_pagado, :documentoventa_saldo, :documentoventa_observacion, ');
    ZQuery2.sql.add(':cliente_id, :personal_id, :tipodocu_id, :documentoventa_condicionventa, :documentoventa_fechavenc, :documentoventa_listaprecio)');
    ZQuery2.ParamByName('documentoventa_id').AsString:=id;
    ZQuery2.ParamByName('documentoventa_numero').AsString:=documentoventa_numero.Text;
    ZQuery2.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
    ZQuery2.ParamByName('documentoventa_hora').AsString:=timetostr(Time);
    ZQuery2.ParamByName('documentoventa_neto21').AsString:=documentoventa_neto21.Text;
    ZQuery2.ParamByName('documentoventa_iva21').AsString:=documentoventa_iva21.Text;
    ZQuery2.ParamByName('documentoventa_neto105').AsString:=documentoventa_neto105.Text;
    ZQuery2.ParamByName('documentoventa_iva105').AsString:=documentoventa_iva105.Text;
    ZQuery2.ParamByName('documentoventa_netonogravado').AsString:='0';
    ZQuery2.ParamByName('documentoventa_total').AsString:=documentoventa_total.Text;
    ZQuery2.ParamByName('documentoventa_estado').AsString:='PENDIENTE';
    ZQuery2.ParamByName('documentoventa_pagado').AsString:='0';
    ZQuery2.ParamByName('documentoventa_saldo').AsString:=documentoventa_total.Text;;
    ZQuery2.ParamByName('documentoventa_observacion').AsString:='';
    ZQuery2.ParamByName('cliente_id').AsString:=cliente_id.codigo;
    ZQuery2.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQuery2.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQuery2.ParamByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
    ZQuery2.ParamByName('documentoventa_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date+15);
    ZQuery2.ParamByName('documentoventa_listaprecio').AsInteger:=documentoventa_listaprecio.ItemIndex;

    ZQuery2.ExecSQL;

    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo, documentoventa_numero.Text);

    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQuery2.sql.clear;
            ZQuery2.sql.add('Insert into documentoventadetalles (documentoventadetalle_id, documentoventadetalle_descripcion, documentoventadetalle_cantidad, documentoventadetalle_precio, ');
            ZQuery2.sql.add('documentoventadetalle_total, documentoventadetalle_neto21, documentoventadetalle_iva21, documentoventadetalle_neto105, documentoventadetalle_iva105, documentoventadetalle_nogravado, ');
            ZQuery2.sql.add('documentoventadetalle_estado, documentoventadetalle_observacion, producto_id, documentoventadetalle_idorig, documentoventadetalle_cantidadpendiente, documentoventa_id) ');
            ZQuery2.sql.add('values (:documentoventadetalle_id, :documentoventadetalle_descripcion, :documentoventadetalle_cantidad, :documentoventadetalle_precio, ');
            ZQuery2.sql.add(':documentoventadetalle_total, :documentoventadetalle_neto21, :documentoventadetalle_iva21, :documentoventadetalle_neto105, :documentoventadetalle_iva105, :documentoventadetalle_nogravado, ');
            ZQuery2.sql.add(':documentoventadetalle_estado, :documentoventadetalle_observacion, :producto_id, :documentoventadetalle_idorig, :documentoventadetalle_cantidadpendiente, :documentoventa_id) ');
            ZQuery2.ParamByName('documentoventadetalle_id').AsString:=Princ.codigo('documentoventadetalles','documentoventadetalle_id');
            ZQuery2.ParamByName('documentoventadetalle_descripcion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString;
            ZQuery2.ParamByName('documentoventadetalle_cantidad').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
            ZQuery2.ParamByName('documentoventadetalle_precio').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
            ZQuery2.ParamByName('documentoventadetalle_total').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString;
            ZQuery2.ParamByName('documentoventadetalle_neto21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsString;
            ZQuery2.ParamByName('documentoventadetalle_iva21').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsString;
            ZQuery2.ParamByName('documentoventadetalle_neto105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsString;
            ZQuery2.ParamByName('documentoventadetalle_iva105').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsString;
            ZQuery2.ParamByName('documentoventadetalle_nogravado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString;
            ZQuery2.ParamByName('documentoventadetalle_estado').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString;
            ZQuery2.ParamByName('documentoventadetalle_observacion').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString;
            ZQuery2.ParamByName('producto_id').AsString:=ZQDocumentoventadetalles.FieldByName('producto_id').AsString;
            ZQuery2.ParamByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString;
            ZQuery2.ParamByName('documentoventadetalle_cantidadpendiente').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString;
            ZQuery2.ParamByName('documentoventa_id').AsString:=id;
            ZQuery2.ExecSQL;


            ZQDocumentoventadetalles.Next;
        end;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;



    if documentoventa_condicionventa.ItemIndex=0 then
      begin
          ZQRecibo.Active:=false;
          ZQRecibo.Active:=true;

          tipodocu_id_recibo:=princ.buscar('select tipodocu_id from tiposdocumento where puntoventa_id="'+puntoventa_id.codigo+'" and tipodocu_nombre="Recibo de Venta"','tipodocu_id');

          recibo_numero:=Princ.NumeroDocumento(tipodocu_id_recibo,'');

          ZQRecibo.Insert;
          ZQRecibo.FieldByName('documentoventa_condicionventa').AsInteger:=documentoventa_condicionventa.ItemIndex;
          ZQRecibo.FieldByName('documentoventa_estado').AsString:='PAGADA';
          ZQRecibo.FieldByName('documentoventa_fecha').AsDateTime:=date;
          ZQRecibo.FieldByName('documentoventa_fechavenc').AsDateTime:=date;
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
          ZQRecibo.FieldByName('documentoventa_pagado').AsString:=documentoventa_total.Text;
          ZQRecibo.FieldByName('documentoventa_saldo').AsString:='0';
          ZQRecibo.FieldByName('documentoventa_total').AsString:=documentoventa_total.Text;
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
          ZQdocumentoventadocus.FieldByName('documentoventa_pagado').asstring:=documentoventa_total.Text;
          ZQdocumentoventadocus.FieldByName('documentoventa_saldo').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventadoc_id').asstring:='0';
          ZQdocumentoventadocus.FieldByName('documentoventadoc_importe').asstring:=documentoventa_total.Text;
          ZQdocumentoventadocus.Post;


          //ZQDocumentopagos.Insert;
//          ZQDocumentopagos.FieldByName('documentopago_id').asstring:='0';
//          ZQDocumentopagos.FieldByName('documentopago_importe').asstring:=documentoventa_total.Text;
//          ZQDocumentopagos.FieldByName('documentopago_nombre').asstring:='EVECTIVO';
//          ZQDocumentopagos.FieldByName('documentoventa_id').asstring:='0';
//          ZQDocumentopagos.FieldByName('tipopago_id').asstring:='1';
//          ZQDocumentopagos.Post;

          Princ.AgregarRecibo(ZQRecibo,ZQdocumentoventadocus,ZQDocumentopagos);




      end;
    

//    if Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')='-1' then
//      Princ.ImprimirFiscal(id);
    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK], 0);
    Self.Close;
end;



procedure Tnotacreditoventa.btnagregarClick(Sender: TObject);
var
  tipoiva_valor:real;
begin
    try
      ventadetalle:= Tventadetalle.Create(self);
    finally
      ventadetalle.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      if ventadetalle.ShowModal=mrOk then
        begin
            ZQDocumentoventadetalles.Append;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:='0';
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString:=ventadetalle.producto_id.Text;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString:=ventadetalle.ventadeta_cantidad.Text;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString:=ventadetalle.ventadetalle_preciounitario.Text;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString:=ventadetalle.ventadetalle_total.Text;

            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=0;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=0;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=0;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=0;

            tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva inner join productos on tipoiva.tipoiva_id=productos.tipoiva_id where producto_id="'+ventadetalle.producto_id.codigo+'"','tipoiva_valor'));
            if tipoiva_valor>10.5 then
              begin
                  ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=100*ventadetalle.ventadetalle_total.FloatValue/(100+tipoiva_valor);
                  ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=tipoiva_valor*ventadetalle.ventadetalle_total.FloatValue/(100+tipoiva_valor);
              end
            else
              begin
                  ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=100*ventadetalle.ventadetalle_total.FloatValue/(100+tipoiva_valor);
                  ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=tipoiva_valor*ventadetalle.ventadetalle_total.FloatValue/(100+tipoiva_valor);
              end;

            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString:='0';
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString:='FACTURADO';
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString:='';
            ZQDocumentoventadetalles.FieldByName('producto_id').AsString:=ventadetalle.producto_id.codigo;
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString:='0';
            ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString:='0';
            ZQDocumentoventadetalles.FieldByName('documentoventa_id').AsString:='0';
            ZQDocumentoventadetalles.Post;

        end;

      ventadetalle.Free;
      calculartotales;
    end;
end;

procedure Tnotacreditoventa.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tnotacreditoventa.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar esta solicitud?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;


    end;
end;

procedure Tnotacreditoventa.btnquitarClick(Sender: TObject);
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

function Tnotacreditoventa.control:boolean;
var
  error:integer;
begin
    error:=0;


//    if solic_numeroimpreso.Text='' then
//      error:=1;


    case error of
        1:begin
              MessageDlg('Ingrese numero impreso.', mtError, [mbOK], 0);
//              solic_numeroimpreso.SetFocus;

          end;

    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
