unit Unitdocumentocomprabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit, Menus, AdvMenus;

type
  Tdocumentocomprabase = class(TForm)
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
    DBGrid1: TDBGrid;
    ZQDocumentocompradetalles: TZQuery;
    DTSDocumentocompradetalle: TDataSource;
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
    documentocompra_neto21: TMoneyEdit;
    documentocompra_iva21: TMoneyEdit;
    documentocompra_neto105: TMoneyEdit;
    documentocompra_iva105: TMoneyEdit;
    documentocompra_total: TMoneyEdit;
    Label1: TLabel;
    proveedor_domicilio: TLabel;
    Label11: TLabel;
    proveedor_documentonro: TLabel;
    Label12: TLabel;
    documentocompra_listaprecio: TComboBox;
    ZQRecibo: TZQuery;
    ZQdocumentoventadocus: TZQuery;
    ZQDocumentopagos: TZQuery;
    DTSPagos: TDataSource;
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
    Label14: TLabel;
    documentocompra_otrosimpuestos: TMoneyEdit;
    documentocompra_puntoventa: TEdit;
    ZQDocumentocompradetallesAnterior: TZQuery;
    Label16: TLabel;
    Label17: TLabel;
    documentocompra_neto27: TMoneyEdit;
    documentocompra_iva27: TMoneyEdit;
    Label18: TLabel;
    Label19: TLabel;
    documentocompra_nogravado: TMoneyEdit;
    documentocompra_tishhperc: TMoneyEdit;
    Label20: TLabel;
    Label21: TLabel;
    documentocompra_ivaret: TMoneyEdit;
    documentocompra_ivaperc: TMoneyEdit;
    Label22: TLabel;
    Label23: TLabel;
    documentocompra_dgrret: TMoneyEdit;
    documentocompra_dgrperc: TMoneyEdit;
    Label13: TLabel;
    documentocompra_observacion: TMemo;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnagregarClick(Sender: TObject);
    procedure puntoventa_idSelect(Sender: TObject);
    procedure proveedor_idSelect(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btnagregarpagoClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnquitarpagoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sucursal_idSelect(Sender: TObject);
    procedure btnimprimirventaClick(Sender: TObject);
    procedure documentocompra_neto21Exit(Sender: TObject);
    procedure proveedor_idExit(Sender: TObject);
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
    procedure anular;
    procedure calculartotales;
    procedure calculartotalpagos;
    procedure calculartotal(posicion:integer);
  public
    { Public declarations }
    abm:integer;
    id:string;
    documentocompra_pagado, documentocompra_saldo:real;
    documentocompra_estado:string;
    limpiar_al_guardar:boolean;
    id_facturado:string;
    tipodocu_nombre:string;
  end;

var
  documentocomprabase: Tdocumentocomprabase;

implementation

uses UnitPrinc, Unitventadetalle, Unitcompradetalle, UnitFacturarDocumentos;

{$R *.dfm}



procedure Tdocumentocomprabase.calculartotal(posicion:integer);
begin
    if posicion<1 then
      documentocompra_iva21.Text:=floattostr(roundto(documentocompra_neto21.Value*21/100,-2));

    if posicion<3 then
      documentocompra_iva105.Text:=floattostr(roundto(documentocompra_neto105.Value*10.5/100,-2));

    if posicion<5 then
      documentocompra_iva27.Text:=floattostr(roundto(documentocompra_neto27.Value*27/100,-2));

    if posicion<13 then
      documentocompra_total.Text:=floattostr(roundto(documentocompra_neto21.Value+
                                             documentocompra_iva21.Value+
                                             documentocompra_neto105.Value+
                                             documentocompra_iva105.Value+
                                             documentocompra_neto27.Value+
                                             documentocompra_iva27.Value+
                                             documentocompra_nogravado.Value+
                                             documentocompra_tishhperc.Value+
                                             documentocompra_ivaret.Value+
                                             documentocompra_ivaperc.Value+
                                             documentocompra_dgrret.Value+
                                             documentocompra_dgrperc.Value+
                                             documentocompra_otrosimpuestos.Value,-2));
end;

function Tdocumentocomprabase.ControlAnular:boolean;
var
  error:integer;
begin
    error:=0;

    if (documentocompra_condicionventa.Text<>'Contado') and (documentocompra_pagado>0) then
      error:=1;



    
    Result:=error=0;
end;


procedure Tdocumentocomprabase.documentocompra_neto21Exit(Sender: TObject);
begin
    calculartotal((Sender as twincontrol).TabOrder);
end;

procedure Tdocumentocomprabase.anular;
begin
//    ZQExecSql.SQL.Clear;
//    ZQExecSql.SQL.Add('begin');
//    ZQExecSql.ExecSQL;
//
//    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
//      begin
//          GenerarNC;
//
//      end
//    else
//      begin
//          ZQDocumentocompradetalles.First;
//          while not ZQDocumentocompradetalles.Eof do
//              begin
//                  Princ.actualizarstock(ZQDocumentocompradetalles.FieldByName('producto_id').AsString, ZQDocumentocompradetalles.FieldByName('documentoventadetalle_cantidad').AsFloat, tipodocu_id.codigo, true);
//
//                  ZQDocumentocompradetalles.Next;
//              end;
//
//          ZQExecSql.sql.clear;
//          ZQExecSql.sql.add('Update documentosventas set ');
//          ZQExecSql.sql.add('documentocompra_estado=:documentocompra_estado');
//          ZQExecSql.sql.add(' where documentocompra_id=:documentocompra_id');
//          ZQExecSql.parambyname('documentocompra_estado').asstring:='ANULADA';
//          ZQExecSql.parambyname('documentocompra_id').asstring:=id;
//          ZQExecSql.ExecSQL;
//
//
//
//
//          MessageDlg('La Factura fue anulada correctamente.', mtInformation, [mbOK], 0);
//
//      end;
//    ZQExecSql.SQL.Clear;
//    ZQExecSql.SQL.Add('commit');
//    ZQExecSql.ExecSQL;

end;

procedure Tdocumentocomprabase.calculartotalpagos;
begin
    documentocompra_saldo:=documentocompra_total.Value;
    documentocompra_pagado:=0;
    documentocompra_estado:='PENDIENTE';
    if documentocompra_condicionventa.Text='Contado' then
      begin
          documentocompra_saldo:=0;
          documentocompra_pagado:=documentocompra_total.Value;
          documentocompra_estado:='PAGADA';
      end;

//    ZQDocumentopagos.First;
//    while not ZQDocumentopagos.Eof do
//        begin
//            documentocompra_pagado:=documentocompra_pagado+ZQDocumentopagos.FieldByName('documentopago_importe').AsFloat;
//
//            documentocompra_saldo:=roundto(documentocompra_total.Value-documentocompra_pagado,-2);
//
//
//            ZQDocumentopagos.Next;
//        end;
//
//    btnagregarpago.Enabled:=true;
//    if documentocompra_saldo=0 then
//       btnagregarpago.Enabled:=false;
end;


procedure Tdocumentocomprabase.calculartotales;
var
  bm:TBookmark;
begin
    bm:=ZQDocumentocompradetalles.GetBookmark;
    ZQDocumentocompradetalles.First;
    documentocompra_neto21.Text:='0';
    documentocompra_iva21.Text:='0';
    documentocompra_neto105.Text:='0';
    documentocompra_iva105.Text:='0';
    documentocompra_total.Text:='0';

    while not ZQDocumentocompradetalles.Eof do
        begin
            documentocompra_neto21.Text:=floattostr(roundto(documentocompra_neto21.Value+ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto21').AsFloat,-2));
            documentocompra_iva21.Text:=floattostr(roundto(documentocompra_iva21.Value+ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva21').AsFloat,-2));
            documentocompra_neto105.Text:=floattostr(roundto(documentocompra_neto105.Value+ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto105').AsFloat,-2));
            documentocompra_iva105.Text:=floattostr(roundto(documentocompra_iva105.Value+ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva105').AsFloat,-2));
            documentocompra_total.Text:=floattostr(roundto(documentocompra_total.Value+ZQDocumentocompradetalles.FieldByName('documentocompradetalle_total').AsFloat,-2));



            ZQDocumentocompradetalles.Next;
        end;

    ZQDocumentocompradetalles.GotoBookmark(bm);


end;

procedure Tdocumentocomprabase.proveedor_idExit(Sender: TObject);
begin
    if abm=ABM_AGREGAR then
      begin
          if Princ.ControlDocumentoComprarepetido(tipodocu_id.codigo,documentocompra_puntoventa.Text, documentocompra_numero.Text, proveedor_id.codigo) then
            begin
                if (MessageDlg('Ya existe otro comprobante con los mismos datos.'+#13+#10+'Desea continuar?', mtWarning, [mbOK, mbCancel], 0) = mrCancel) then
                  (Sender as TWinControl).SetFocus;
            end;

      end;
end;

procedure Tdocumentocomprabase.proveedor_idSelect(Sender: TObject);
begin
    proveedor_domicilio.Caption:=Princ.buscar('select proveedor_domicilio from proveedores where proveedor_id="'+proveedor_id.codigo+'"','proveedor_domicilio');
    proveedor_documentonro.Caption:=Princ.buscar('select proveedor_documentonro from proveedores where proveedor_id="'+proveedor_id.codigo+'"','proveedor_documentonro');
    try
      documentocompra_condicionventa.ItemIndex:=strtoint(Princ.buscar('select proveedor_condicionventa from proveedores where proveedor_id="'+proveedor_id.codigo+'"','proveedor_condicionventa'));
    except
    end;

//    documentocompra_listaprecio.ItemIndex:=strtoint(Princ.buscar('select proveedor_listaprecio from clientes where proveedor_id="'+proveedor_id.codigo+'"','proveedor_listaprecio'));

//    if Princ.buscar('select condicioniva_id from clientes where proveedor_id="'+proveedor_id.codigo+'"','condicioniva_id')='2' then
//      tipodocu_id.Buscar('A',true)
//    else
//      tipodocu_id.Buscar('B',true);
//
//    if tipodocu_id.Text='' then
//      try
//        tipodocu_id.ItemIndex:=0;
//      finally
//      end;
//
//    tipodocu_id.OnSelect(self);
end;

procedure Tdocumentocomprabase.imprimir;
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join documentoventadetalles on documentosventas.documentocompra_id=documentoventadetalles.documentocompra_id '+
                                             'inner join clientes on documentosventas.proveedor_id=clientes.proveedor_id '+
                                             'where documentosventas.documentocompra_id="'+id+'"';

    
    Princ.VCLReport1.Execute;
end;


procedure Tdocumentocomprabase.eliminar;
var
  recibo_id:string;
  se_puede_borrar:boolean;
  pagado:real;
begin
    se_puede_borrar:=true;
//    if documentocompra_condicionventa.Text='Contado' then
//      begin
//          se_puede_borrar:=true;
//          recibo_id:=Princ.buscar('select documentocompra_id from documentoventadocus where documentocompra_idpago="'+id+'"','documentocompra_id');
//          if recibo_id<>'' then
//            se_puede_borrar:=Princ.BorrarDocumentoCompra(recibo_id);
//      end;

    if se_puede_borrar then
      begin
//          pagado:=strtofloat(Princ.buscar('select documentocompra_pagado from documentosventas where documentocompra_id="'+id+'"','documentocompra_pagado'));
//          se_puede_borrar:= pagado=0;
//          if se_puede_borrar then
//            begin
                Princ.BorrarDocumentoCompra(id);

                MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
                Self.Close;
//            end;
      end;
    if not se_puede_borrar then
      MessageDlg('La factura todavia tiene pagos asociados, no se puede eliminar.', mtError, [mbOK], 0);



end;



procedure Tdocumentocomprabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tdocumentocomprabase.FormCreate(Sender: TObject);
begin
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
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;
     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

     documentocompra_numero.Text:='';

    documentocompra_fecha.Date:=date;

//    documentocompra_listaprecio.Items.Clear;
//    documentocompra_listaprecio.Items.Add(Princ.NOMBREPRECIO1);
//    documentocompra_listaprecio.Items.Add(Princ.NOMBREPRECIO2);
//    documentocompra_listaprecio.Items.Add(Princ.NOMBREPRECIO3);
//    documentocompra_listaprecio.Items.Add(Princ.NOMBREPRECIO4);
//    documentocompra_listaprecio.ItemIndex:=0;

    proveedor_id.llenarcombo;
    proveedor_id.ItemIndex:=-1;

    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;

end;

procedure Tdocumentocomprabase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F4:btnagregar.Click;
        VK_F6:btnquitar.Click;
        VK_F9:btnguardar.Click;
        VK_ESCAPE:btncancelar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tdocumentocomprabase.FormShow(Sender: TObject);
begin
    if abm=1 then
      id:='';

      
    btnherramientas.Visible:=abm=1;
    btnimprimirventa.Visible:=abm<>1;


    ZQuery2.Active:=false;
    ZQuery2.ParamByName('documentocompra_id').AsString:=id;
    ZQuery2.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;

    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tdocumentocomprabase.modificar;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('update documentoscompras set ');
    ZQExecSql.sql.add('documentocompra_numero=:documentocompra_numero, ');
    ZQExecSql.sql.add('documentocompra_fecha=:documentocompra_fecha, ');
    ZQExecSql.sql.add('documentocompra_hora=:documentocompra_hora, ');
    ZQExecSql.sql.add('documentocompra_neto21=:documentocompra_neto21, ');
    ZQExecSql.sql.add('documentocompra_iva21=:documentocompra_iva21, ');
    ZQExecSql.sql.add('documentocompra_neto105=:documentocompra_neto105, ');
    ZQExecSql.sql.add('documentocompra_iva105=:documentocompra_iva105, ');
    ZQExecSql.sql.add('documentocompra_total=:documentocompra_total, ');
    ZQExecSql.sql.add('documentocompra_estado=:documentocompra_estado, ');
    ZQExecSql.sql.add('documentocompra_pagado=:documentocompra_pagado, ');
    ZQExecSql.sql.add('documentocompra_saldo=:documentocompra_saldo, ');
    ZQExecSql.sql.add('proveedor_id=:proveedor_id, ');
    ZQExecSql.sql.add('personal_id=:personal_id, ');
    ZQExecSql.sql.add('tipodocu_id=:tipodocu_id, ');
    ZQExecSql.sql.add('documentocompra_condicionventa=:documentocompra_condicionventa, ');
    ZQExecSql.sql.add('documentocompra_fechavenc=:documentocompra_fechavenc, ');
    ZQExecSql.sql.add('documentocompra_puntoventa=:documentocompra_puntoventa, ');

    ZQExecSql.sql.add('documentocompra_neto27=:documentocompra_neto27, ');
    ZQExecSql.sql.add('documentocompra_iva27=:documentocompra_iva27, ');
    ZQExecSql.sql.add('documentocompra_nogravado=:documentocompra_nogravado, ');
    ZQExecSql.sql.add('documentocompra_tishhperc=:documentocompra_tishhperc, ');
    ZQExecSql.sql.add('documentocompra_ivaret=:documentocompra_ivaret, ');
    ZQExecSql.sql.add('documentocompra_ivaperc=:documentocompra_ivaperc, ');
    ZQExecSql.sql.add('documentocompra_dgrret=:documentocompra_dgrret, ');
    ZQExecSql.sql.add('documentocompra_dgrperc=:documentocompra_dgrperc, ');
    ZQExecSql.sql.add('documentocompra_otrosimpuestos=:documentocompra_otrosimpuestos, ');
    ZQExecSql.sql.add('documentocompra_observacion=:documentocompra_observacion ');

    ZQExecSql.sql.add('where documentocompra_id=:documentocompra_id ');
    ZQExecSql.ParamByName('documentocompra_id').AsString:=id;
    ZQExecSql.ParamByName('documentocompra_numero').AsString:=documentocompra_numero.Text;
    ZQExecSql.ParamByName('documentocompra_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentocompra_fecha.Date);
    ZQExecSql.ParamByName('documentocompra_hora').AsString:=timetostr(Princ.horaservidor);
    ZQExecSql.ParamByName('documentocompra_neto21').AsString:=documentocompra_neto21.Text;
    ZQExecSql.ParamByName('documentocompra_iva21').AsString:=documentocompra_iva21.Text;
    ZQExecSql.ParamByName('documentocompra_neto105').AsString:=documentocompra_neto105.Text;
    ZQExecSql.ParamByName('documentocompra_iva105').AsString:=documentocompra_iva105.Text;
    ZQExecSql.ParamByName('documentocompra_total').AsString:=documentocompra_total.Text;
    ZQExecSql.ParamByName('documentocompra_estado').AsString:=documentocompra_estado;
    ZQExecSql.ParamByName('documentocompra_pagado').AsFloat:=documentocompra_pagado;
    ZQExecSql.ParamByName('documentocompra_saldo').AsFloat:=documentocompra_saldo;
    ZQExecSql.ParamByName('proveedor_id').AsString:=proveedor_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentocompra_condicionventa').AsInteger:=documentocompra_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentocompra_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentocompra_fecha.Date+15);
    ZQExecSql.ParamByName('documentocompra_puntoventa').AsString:=documentocompra_puntoventa.Text;

    ZQExecSql.ParamByName('documentocompra_neto27').AsString:=documentocompra_neto27.Text;
    ZQExecSql.ParamByName('documentocompra_iva27').AsString:=documentocompra_iva27.Text;
    ZQExecSql.ParamByName('documentocompra_nogravado').AsString:=documentocompra_nogravado.Text;
    ZQExecSql.ParamByName('documentocompra_tishhperc').AsString:=documentocompra_tishhperc.Text;
    ZQExecSql.ParamByName('documentocompra_ivaret').AsString:=documentocompra_ivaret.Text;
    ZQExecSql.ParamByName('documentocompra_ivaperc').AsString:=documentocompra_ivaperc.Text;
    ZQExecSql.ParamByName('documentocompra_dgrret').AsString:=documentocompra_dgrret.Text;
    ZQExecSql.ParamByName('documentocompra_dgrperc').AsString:=documentocompra_dgrperc.Text;
    ZQExecSql.ParamByName('documentocompra_otrosimpuestos').AsString:=documentocompra_otrosimpuestos.Text;
    ZQExecSql.ParamByName('documentocompra_observacion').AsString:=documentocompra_observacion.Text;

    ZQExecSql.ExecSQL;


    ZQDocumentocompradetallesAnterior.Active:=false;
    ZQDocumentocompradetallesAnterior.ParamByName('documentocompra_id').AsString:=id;
    ZQDocumentocompradetallesAnterior.Active:=true;
    ZQDocumentocompradetallesAnterior.First;
    while not ZQDocumentocompradetallesAnterior.Eof do
        begin
            Princ.actualizarstock(ZQDocumentocompradetallesAnterior.FieldByName('producto_id').AsString,ZQDocumentocompradetallesAnterior.FieldByName('documentocompradetalle_cantidad').AsFloat,tipodocu_id.codigo,true);

            ZQDocumentocompradetallesAnterior.Next;
        end;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Text:='delete from documentocompradetalles where documentocompra_id="'+id+'"';
    ZQExecSql.ExecSQL;


    ZQDocumentocompradetalles.First;
    while not ZQDocumentocompradetalles.Eof do
        begin
            ZQExecSql.sql.clear;
            ZQExecSql.sql.add('Insert into documentocompradetalles (documentocompradetalle_id, documentocompradetalle_descripcion, documentocompradetalle_cantidad, documentocompradetalle_precio, ');
            ZQExecSql.sql.add('documentocompradetalle_total, documentocompradetalle_neto21, documentocompradetalle_iva21, documentocompradetalle_neto105, documentocompradetalle_iva105, ');
            ZQExecSql.sql.add('documentocompradetalle_estado, documentocompradetalle_observacion, producto_id, documentocompra_id) ');
            ZQExecSql.sql.add('values (:documentocompradetalle_id, :documentocompradetalle_descripcion, :documentocompradetalle_cantidad, :documentocompradetalle_precio, ');
            ZQExecSql.sql.add(':documentocompradetalle_total, :documentocompradetalle_neto21, :documentocompradetalle_iva21, :documentocompradetalle_neto105, :documentocompradetalle_iva105, ');
            ZQExecSql.sql.add(':documentocompradetalle_estado, :documentocompradetalle_observacion, :producto_id, :documentocompra_id) ');
            ZQExecSql.ParamByName('documentocompradetalle_id').AsString:=Princ.codigo('documentocompradetalles','documentocompradetalle_id');
            ZQExecSql.ParamByName('documentocompradetalle_descripcion').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_cantidad').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_precio').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_precio').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_total').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_total').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_neto21').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_iva21').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_neto105').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_iva105').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_estado').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_estado').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_observacion').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_observacion').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentocompradetalles.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentocompra_id').AsString:=id;
            ZQExecSql.ExecSQL;


            Princ.actualizarstock(ZQDocumentocompradetalles.FieldByName('producto_id').AsString, ZQDocumentocompradetalles.FieldByName('documentocompradetalle_cantidad').AsFloat, tipodocu_id.codigo, false);

            ZQDocumentocompradetalles.Next;
        end;


    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;


    MessageDlg('Datos guardados correctamente', mtInformation, [mbOK, mbCancel], 0);
//    Self.Close;
    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;


end;


procedure Tdocumentocomprabase.sucursal_idSelect(Sender: TObject);
begin
    puntoventa_id.Confsql.Text:='select * from puntodeventa where sucursal_id="'+sucursal_id.codigo+'" order by puntoventa_numero';
    puntoventa_id.llenarcombo;
    try
      puntoventa_id.ItemIndex:=0;
    except
      puntoventa_id.ItemIndex:=-1;
    end;

    puntoventa_id.OnSelect(self);
end;

procedure Tdocumentocomprabase.puntoventa_idSelect(Sender: TObject);
begin
    documentocompra_numero.Text:='';
    tipodocu_id.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+puntoventa_id.Codigo+'" and tipodocu_nombre="'+tipodocu_nombre+'"'+
                              'order by tipodocu_letra';

     tipodocu_id.llenarcombo;

     try
       tipodocu_id.ItemIndex:=0;
     except
       tipodocu_id.ItemIndex:=-1;
     end;

end;

procedure Tdocumentocomprabase.ZQuery2AfterOpen(DataSet: TDataSet);
begin
    if abm=1 then
      begin
          documentocompra_fecha.Date:=date;
          documentocompra_puntoventa.Text:='';
          documentocompra_numero.Text:='';
          proveedor_id.ItemIndex:=-1;
          personal_id.ItemIndex:=0;

          documentocompra_neto21.Text:='0';
          documentocompra_iva21.Text:='0';
          documentocompra_neto105.Text:='0';
          documentocompra_iva105.Text:='0';
          documentocompra_otrosimpuestos.Text:='0';
          documentocompra_total.Text:='0';
          documentocompra_observacion.Text:='';
          documentocompra_condicionventa.ItemIndex:=1;
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
          documentocompra_puntoventa.Text:=ZQuery2.FieldByName('documentocompra_puntoventa').AsString;
          documentocompra_numero.Text:=ZQuery2.FieldByName('documentocompra_numero').AsString;
          documentocompra_condicionventa.ItemIndex:=ZQuery2.FieldByName('documentocompra_condicionventa').AsInteger;
//          documentocompra_listaprecio.ItemIndex:=ZQuery2.FieldByName('documentocompra_listaprecio').AsInteger;

          personal_id.Buscar(ZQuery2.FieldByName('personal_id').AsString);

          documentocompra_neto21.Text:=ZQuery2.FieldByName('documentocompra_neto21').AsString;
          documentocompra_iva21.Text:=ZQuery2.FieldByName('documentocompra_iva21').AsString;
          documentocompra_neto105.Text:=ZQuery2.FieldByName('documentocompra_neto105').AsString;
          documentocompra_iva105.Text:=ZQuery2.FieldByName('documentocompra_iva105').AsString;

          documentocompra_neto27.Text:=ZQuery2.FieldByName('documentocompra_neto27').AsString;
          documentocompra_iva27.Text:=ZQuery2.FieldByName('documentocompra_iva27').AsString;
          documentocompra_nogravado.Text:=ZQuery2.FieldByName('documentocompra_nogravado').AsString;
          documentocompra_tishhperc.Text:=ZQuery2.FieldByName('documentocompra_tishhperc').AsString;
          documentocompra_ivaret.Text:=ZQuery2.FieldByName('documentocompra_ivaret').AsString;
          documentocompra_ivaperc.Text:=ZQuery2.FieldByName('documentocompra_ivaperc').AsString;
          documentocompra_dgrret.Text:=ZQuery2.FieldByName('documentocompra_dgrret').AsString;
          documentocompra_dgrperc.Text:=ZQuery2.FieldByName('documentocompra_dgrperc').AsString;

          documentocompra_otrosimpuestos.Text:=ZQuery2.FieldByName('documentocompra_otrosimpuestos').AsString;
          documentocompra_total.Text:=ZQuery2.FieldByName('documentocompra_total').AsString;
          documentocompra_observacion.Text:=ZQuery2.FieldByName('documentocompra_observacion').AsString;

      end;

    ZQDocumentocompradetalles.Active:=false;
    ZQDocumentocompradetalles.SQL.Text:='select * from documentocompradetalles left join productos on documentocompradetalles.producto_id=productos.producto_id where documentocompra_id="'+id+'"';
    ZQDocumentocompradetalles.Active:=true;

end;

procedure Tdocumentocomprabase.agregar;
var
  recibo_numero:string;
  tipodocu_id_recibo:string;
begin

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    id:=Princ.codigo('documentoscompras','documentocompra_id');

//    documentocompra_numero.Text:=Princ.NumeroDocumento(tipodocu_id.Codigo);
//    if strtobool(Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')) then
//      documentocompra_numero.Text:='0';


    ZQExecSql.sql.clear;
    ZQExecSql.sql.add('Insert into documentoscompras (documentocompra_id, documentocompra_numero, documentocompra_fecha, documentocompra_hora, ');
    ZQExecSql.sql.add('documentocompra_neto21, documentocompra_iva21, documentocompra_neto105, documentocompra_iva105, ');
    ZQExecSql.sql.add('documentocompra_total, documentocompra_estado, documentocompra_pagado, documentocompra_saldo, documentocompra_observacion, ');
    ZQExecSql.sql.add('proveedor_id, personal_id, tipodocu_id, documentocompra_condicionventa, documentocompra_fechavenc, documentocompra_puntoventa, ');
    ZQExecSql.sql.add('documentocompra_neto27, documentocompra_iva27, documentocompra_nogravado, ');
    ZQExecSql.sql.add('documentocompra_tishhperc, documentocompra_ivaret, documentocompra_ivaperc, ');
    ZQExecSql.sql.add('documentocompra_dgrret, documentocompra_dgrperc, documentocompra_otrosimpuestos) ');
    ZQExecSql.sql.add('values (:documentocompra_id, :documentocompra_numero, :documentocompra_fecha, :documentocompra_hora, ');
    ZQExecSql.sql.add(':documentocompra_neto21, :documentocompra_iva21, :documentocompra_neto105, :documentocompra_iva105, ');
    ZQExecSql.sql.add(':documentocompra_total, :documentocompra_estado, :documentocompra_pagado, :documentocompra_saldo, :documentocompra_observacion, ');
    ZQExecSql.sql.add(':proveedor_id, :personal_id, :tipodocu_id, :documentocompra_condicionventa, :documentocompra_fechavenc, :documentocompra_puntoventa, ');
    ZQExecSql.sql.add(':documentocompra_neto27, :documentocompra_iva27, :documentocompra_nogravado, ');
    ZQExecSql.sql.add(':documentocompra_tishhperc, :documentocompra_ivaret, :documentocompra_ivaperc, ');
    ZQExecSql.sql.add(':documentocompra_dgrret, :documentocompra_dgrperc, :documentocompra_otrosimpuestos) ');
    ZQExecSql.ParamByName('documentocompra_id').AsString:=id;
    ZQExecSql.ParamByName('documentocompra_numero').AsString:=documentocompra_numero.Text;
    ZQExecSql.ParamByName('documentocompra_fecha').AsString:=formatdatetime('yyyy-mm-dd',documentocompra_fecha.Date);
    ZQExecSql.ParamByName('documentocompra_hora').AsString:=timetostr(Princ.horaservidor);
    ZQExecSql.ParamByName('documentocompra_neto21').AsString:=documentocompra_neto21.Text;
    ZQExecSql.ParamByName('documentocompra_iva21').AsString:=documentocompra_iva21.Text;
    ZQExecSql.ParamByName('documentocompra_neto105').AsString:=documentocompra_neto105.Text;
    ZQExecSql.ParamByName('documentocompra_iva105').AsString:=documentocompra_iva105.Text;
//    ZQExecSql.ParamByName('documentocompra_netonogravado').AsString:='0';
    ZQExecSql.ParamByName('documentocompra_total').AsString:=documentocompra_total.Text;
    ZQExecSql.ParamByName('documentocompra_estado').AsString:=documentocompra_estado;
    ZQExecSql.ParamByName('documentocompra_pagado').AsFloat:=documentocompra_pagado;
    ZQExecSql.ParamByName('documentocompra_saldo').AsFloat:=documentocompra_saldo;
    ZQExecSql.ParamByName('proveedor_id').AsString:=proveedor_id.codigo;
    ZQExecSql.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSql.ParamByName('tipodocu_id').AsString:=tipodocu_id.codigo;
    ZQExecSql.ParamByName('documentocompra_condicionventa').AsInteger:=documentocompra_condicionventa.ItemIndex;
    ZQExecSql.ParamByName('documentocompra_fechavenc').AsString:=formatdatetime('yyyy-mm-dd',documentocompra_fecha.Date+15);
    ZQExecSql.ParamByName('documentocompra_puntoventa').AsString:=documentocompra_puntoventa.Text;

    ZQExecSql.ParamByName('documentocompra_neto27').AsString:=documentocompra_neto27.Text;
    ZQExecSql.ParamByName('documentocompra_iva27').AsString:=documentocompra_iva27.Text;
    ZQExecSql.ParamByName('documentocompra_nogravado').AsString:=documentocompra_nogravado.Text;
    ZQExecSql.ParamByName('documentocompra_tishhperc').AsString:=documentocompra_tishhperc.Text;
    ZQExecSql.ParamByName('documentocompra_ivaret').AsString:=documentocompra_ivaret.Text;
    ZQExecSql.ParamByName('documentocompra_ivaperc').AsString:=documentocompra_ivaperc.Text;
    ZQExecSql.ParamByName('documentocompra_dgrret').AsString:=documentocompra_dgrret.Text;
    ZQExecSql.ParamByName('documentocompra_dgrperc').AsString:=documentocompra_dgrperc.Text;
    ZQExecSql.ParamByName('documentocompra_otrosimpuestos').AsString:=documentocompra_otrosimpuestos.Text;
    ZQExecSql.ParamByName('documentocompra_observacion').AsString:=documentocompra_observacion.Text;

    ZQExecSql.ExecSQL;

//    Princ.ActualizarNumeroDocumento(tipodocu_id.codigo, documentocompra_numero.Text);

    ZQDocumentocompradetalles.First;
    while not ZQDocumentocompradetalles.Eof do
        begin
            ZQExecSql.sql.clear;
            ZQExecSql.sql.add('Insert into documentocompradetalles (documentocompradetalle_id, documentocompradetalle_descripcion, documentocompradetalle_cantidad, documentocompradetalle_precio, ');
            ZQExecSql.sql.add('documentocompradetalle_total, documentocompradetalle_neto21, documentocompradetalle_iva21, documentocompradetalle_neto105, documentocompradetalle_iva105, ');
            ZQExecSql.sql.add('documentocompradetalle_estado, documentocompradetalle_observacion, producto_id, documentocompra_id) ');
            ZQExecSql.sql.add('values (:documentocompradetalle_id, :documentocompradetalle_descripcion, :documentocompradetalle_cantidad, :documentocompradetalle_precio, ');
            ZQExecSql.sql.add(':documentocompradetalle_total, :documentocompradetalle_neto21, :documentocompradetalle_iva21, :documentocompradetalle_neto105, :documentocompradetalle_iva105, ');
            ZQExecSql.sql.add(':documentocompradetalle_estado, :documentocompradetalle_observacion, :producto_id, :documentocompra_id) ');
            ZQExecSql.ParamByName('documentocompradetalle_id').AsString:=Princ.codigo('documentocompradetalles','documentocompradetalle_id');
            ZQExecSql.ParamByName('documentocompradetalle_descripcion').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_descripcion').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_cantidad').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_cantidad').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_precio').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_precio').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_total').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_total').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_neto21').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto21').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_iva21').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva21').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_neto105').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_neto105').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_iva105').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_iva105').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_estado').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_estado').AsString;
            ZQExecSql.ParamByName('documentocompradetalle_observacion').AsString:=ZQDocumentocompradetalles.FieldByName('documentocompradetalle_observacion').AsString;
            ZQExecSql.ParamByName('producto_id').AsString:=ZQDocumentocompradetalles.FieldByName('producto_id').AsString;
            ZQExecSql.ParamByName('documentocompra_id').AsString:=id;
            ZQExecSql.ExecSQL;


            Princ.actualizarstock(ZQDocumentocompradetalles.FieldByName('producto_id').AsString, ZQDocumentocompradetalles.FieldByName('documentocompradetalle_cantidad').AsFloat, tipodocu_id.codigo, false);

            ZQDocumentocompradetalles.Next;
        end;


    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;

end;



procedure Tdocumentocomprabase.btnagregarClick(Sender: TObject);
var
  tipoiva_valor:real;
begin
    //  VERIFICAR SI ES NECESARIO USAR OPCION DE CONF PARA TIPOS DE CARGA DE DETALLES

    try
      compradetalle:= Tcompradetalle.Create(self);
    finally
//      compradetalle.producto_precioventa:=inttostr(documentocompra_listaprecio.ItemIndex+1);
      if compradetalle.ShowModal=mrOk then
        begin

            princ.CargarDocumentoCompraDetalle(ZQDocumentocompradetalles, compradetalle.ZQDocumentocompradetalles);

        end;

      compradetalle.Free;
      calculartotales;
      calculartotalpagos;
    end;
end;

procedure Tdocumentocomprabase.btnagregarpagoClick(Sender: TObject);
begin
    calculartotalpagos;
    if Princ.CargarPago(documentocompra_saldo,ZQDocumentopagos, ZQpagotarjeta) then
      calculartotalpagos;
end;

procedure Tdocumentocomprabase.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tdocumentocomprabase.btnguardarClick(Sender: TObject);
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

procedure Tdocumentocomprabase.btnimprimirventaClick(Sender: TObject);
begin
    Self.imprimir;
end;

procedure Tdocumentocomprabase.btnquitarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQDocumentocompradetalles.Delete;
          finally
            calculartotales;
            calculartotalpagos;
          end;

      end;

end;

procedure Tdocumentocomprabase.btnquitarpagoClick(Sender: TObject);
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

function Tdocumentocomprabase.control:boolean;
var
  error:integer;
begin
    error:=0;

    if documentocompra_puntoventa.Text='' then
      error:=10;

//    if ZQDocumentocompradetalles.RecordCount<1 then
//      error:=9;

//    if documentocompra_listaprecio.ItemIndex=-1 then
//      error:=8;

    if documentocompra_condicionventa.ItemIndex=-1 then
      error:=7;

    if personal_id.ItemIndex=-1 then
      error:=6;

    if proveedor_id.ItemIndex=-1 then
      error:=5;

    if documentocompra_numero.Text='' then
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
              MessageDlg('Seleccione un Punto de venta', mtError, [mbOK], 0);
          end;
        3:begin
              MessageDlg('Seleccione tipo de Documento', mtError, [mbOK], 0);
          end;
        4:begin
              MessageDlg('Verifique numeracion', mtError, [mbOK], 0);
          end;
        5:begin
              MessageDlg('Seleccione un proveedor', mtError, [mbOK], 0);
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
              MessageDlg('Ingrese detalle de compra', mtError, [mbOK], 0);
          end;
       10:begin
              MessageDlg('Ingrese Punto de venta del Comprobante', mtError, [mbOK], 0);
          end;
    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
