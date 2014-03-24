unit Unitdocumentoventabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit, GTBMemo;

type
  Tdocumentoventabase = class(TForm)
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
    ZQdocumentoventadocus: TZQuery;
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
    ZQDocumentoventadetallesproducto_tipo: TStringField;
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
    procedure btnmodificarClick(Sender: TObject);
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
  documentoventabase: Tdocumentoventabase;

implementation

uses UnitPrinc, Unitventadetalle, Unitventadetalle2;

{$R *.dfm}

procedure Tdocumentoventabase.GenerarNC;
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

            ZQDocumentoventadetalles.Next;
        end;
    Princ.AgregarDocumentoVenta(ZQNotacredito,ZQDocumentoventadetalles,ZQdocumentoventadocus,nil);

    MessageDlg('Se genero una Nota de Credito para anular la Factura.', mtInformation, [mbOK], 0);

end;

procedure Tdocumentoventabase.anular;
begin


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

          MessageDlg('La Documento Anulado correctamente.', mtInformation, [mbOK], 0);

      end;


end;


procedure Tdocumentoventabase.calculartotales;
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

procedure Tdocumentoventabase.cliente_idSelect(Sender: TObject);
begin
    cliente_domicilio.Caption:=Princ.buscar('select cliente_domicilio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_domicilio');
    cliente_documentonro.Caption:=Princ.buscar('select cliente_documentonro from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_documentonro');
    try
      documentoventa_condicionventa.ItemIndex:=strtoint(Princ.buscar('select cliente_condicionventa from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_condicionventa'));
    except
    end;
    documentoventa_listaprecio.ItemIndex:=strtoint(Princ.buscar('select cliente_listaprecio from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_listaprecio'));

    personal_id.Buscar(Princ.buscar('select personal_id from clientes where cliente_id="'+cliente_id.codigo+'"','personal_id'));

end;

procedure Tdocumentoventabase.imprimir;
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                                             'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                                             'inner join paises on provincias.pais_id=paises.pais_id '+
                                             'inner join condicioniva on clientes.condicioniva_id=condicioniva.condicioniva_id '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'where documentosventas.documentoventa_id="'+id+'"';


    Princ.VCLReport1.Execute;
end;


procedure Tdocumentoventabase.eliminar;
begin
    eliminado:=Princ.BorrarDocumentoVenta(id);

end;



procedure Tdocumentoventabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tdocumentoventabase.FormCreate(Sender: TObject);
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

//    DBGrid1.Columns.Items[1].FieldName:=Princ.CAMPO_ID_PRODUCTO;

end;

procedure Tdocumentoventabase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
        VK_F4:btnagregar.Click;
        VK_F6:btnquitar.Click;
        VK_F9:btnguardar.Click;
    end;
end;

procedure Tdocumentoventabase.FormShow(Sender: TObject);
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

    limpiar_al_guardar:=abm=1;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tdocumentoventabase.modificar;
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
    ZQExecSql.SQL.Add('documentoventa_fecha=:documentoventa_fecha ');
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
    ZQExecSql.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date);
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

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

end;


procedure Tdocumentoventabase.sucursal_idSelect(Sender: TObject);
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

procedure Tdocumentoventabase.puntoventa_idSelect(Sender: TObject);
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

procedure Tdocumentoventabase.tipodocu_idChange(Sender: TObject);
begin
    documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tdocumentoventabase.tipodocu_idSelect(Sender: TObject);
begin
    documentoventa_numero.Text:='';
    if tipodocu_id.ItemIndex>-1 then
      documentoventa_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo,'');
end;

procedure Tdocumentoventabase.ZQuery2AfterOpen(DataSet: TDataSet);
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
    ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+id+'"';
    ZQDocumentoventadetalles.Active:=true;

    calculartotales;

    try
      cliente_id.SetFocus;
    except
      btnagregar.SetFocus;
    end;
end;

procedure Tdocumentoventabase.agregar;
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
    ZQExecSql.ParamByName('documentoventa_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentoventa_fecha.Date+15);
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

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

end;



procedure Tdocumentoventabase.btnagregarClick(Sender: TObject);
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

procedure Tdocumentoventabase.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tdocumentoventabase.btnguardarClick(Sender: TObject);
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
end;

procedure Tdocumentoventabase.btnmodificarClick(Sender: TObject);
var
  tipoiva_valor:real;
begin
    try
      ventadetalle2:= Tventadetalle2.Create(self);
    finally
      ventadetalle2.ventadeta_cantidad.Value:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsFloat;
      ventadetalle2.producto_id.Text:=ZQDocumentoventadetalles.FieldByName('producto_id').AsString;
      ventadetalle2.producto_id.Search(ZQDocumentoventadetalles.FieldByName('producto_id').AsString);
      ventadetalle2.ventadetalle_preciounitario.FloatValue:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsFloat;
      ventadetalle2.calculartotal;

      ventadetalle2.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      ventadetalle2.documentoventadetalle_listaprecio:=documentoventa_listaprecio.ItemIndex;


      if ventadetalle2.ShowModal=mrOk then
        begin

            princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, ventadetalle2.ZQDocumentoventadetalles,2);

        end;

      ventadetalle2.Free;
      calculartotales;
    end;
end;
procedure Tdocumentoventabase.btnquitarClick(Sender: TObject);
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

function Tdocumentoventabase.control:boolean;
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


//    if solic_numeroimpreso.Text='' then
//      error:=1;


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
