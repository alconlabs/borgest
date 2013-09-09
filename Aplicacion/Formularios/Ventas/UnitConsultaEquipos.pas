unit UnitConsultaEquipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, GTBComboBox, GBTEdit, ComCtrls, Grids, DBGrids,
  UnitSqlComboBox;

type
  TConsultaEquipos = class(TABMbase)
    equipo_tipo: TGTBComboBox;
    documentoventa_equipo: TGTBEdit;
    btnactualizar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    ZQDocumentosventas: TZQuery;
    DSCDocumentosventas: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
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
    ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe3: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe4: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe5: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_importe6: TFloatField;
    DSCDocumentoventadetalles: TDataSource;
    DBGrid3: TDBGrid;
    DSCProductos: TDataSource;
    ZQProductos: TZQuery;
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
    Label2: TLabel;
    equipo_observaciones: TMemo;
    btnimprimir: TButton;
    sucursal_id: TSqlComboBox;
    labelsucursal: TLabel;
    ZQTemporal: TZQuery;
    procedure btnactualizarClick(Sender: TObject);
    procedure DSCDocumentosventasDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    temporal_idproceso:string;
    procedure agregar;
    procedure modificar;
  public
    { Public declarations }
  end;

var
  ConsultaEquipos: TConsultaEquipos;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TConsultaEquipos.agregar;
begin
    id:=Princ.codigo('equipos','equipo_id');
    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('insert into equipos (equipo_id, equipo_tipo, equipo_numero, equipo_observaciones, sucursal_id)');
    ZQExecSQL.SQL.Add('values (:equipo_id, :equipo_tipo, :equipo_numero, :equipo_observaciones, :sucursal_id)');
    ZQExecSQL.ParamByName('equipo_id').AsString:=id;
    ZQExecSQL.ParamByName('equipo_tipo').AsString:=equipo_tipo.Text;
    ZQExecSQL.ParamByName('equipo_numero').AsString:=documentoventa_equipo.Text;
    ZQExecSQL.ParamByName('equipo_observaciones').AsString:=equipo_observaciones.Text;
    ZQExecSQL.ParamByName('sucursal_id').AsString:=sucursal_id.codigo;
    ZQExecSQL.ExecSQL;

end;


procedure TConsultaEquipos.modificar;
begin
    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('update equipos set ');
    ZQExecSQL.SQL.Add('equipo_tipo=:equipo_tipo, ');
    ZQExecSQL.SQL.Add('equipo_numero=:equipo_numero, ');
    ZQExecSQL.SQL.Add('equipo_observaciones=:equipo_observaciones, ');
    ZQExecSQL.SQL.Add('sucursal_id=:sucursal_id ');
    ZQExecSQL.SQL.Add('where equipo_id=:equipo_id ');
    ZQExecSQL.ParamByName('equipo_id').AsString:=id;
    ZQExecSQL.ParamByName('equipo_tipo').AsString:=equipo_tipo.Text;
    ZQExecSQL.ParamByName('equipo_numero').AsString:=documentoventa_equipo.Text;
    ZQExecSQL.ParamByName('equipo_observaciones').AsString:=equipo_observaciones.Text;
    ZQExecSQL.ParamByName('sucursal_id').AsString:=sucursal_id.codigo;
    ZQExecSQL.ExecSQL;

end;



procedure TConsultaEquipos.btnactualizarClick(Sender: TObject);
begin
  inherited;
    ZQDocumentosventas.Active:=false;
    ZQDocumentosventas.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       'inner join localidades on clientes.localidad_id=localidades.localidad_id '+
                       'inner join provincias on localidades.provincia_id=provincias.provincia_id '+
                       ' where tipodocu_nombre="Nota de Pedido" and '+
                       equipo_tipo.codigo+'="'+documentoventa_equipo.Text+'" '+Princ.empresa_where+
                       'order by clientes.cliente_nombre, documentosventas.documentoventa_fecha';

    ZQDocumentosventas.Active:=true;


    ZQProductos.Active:=false;
    ZQProductos.SQL.Text:='select * from documentosventas '+
                       'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       ' where tipodocu_nombre="Nota de Pedido" and '+
                       equipo_tipo.codigo+'="'+documentoventa_equipo.Text+'"';

    ZQProductos.Active:=true;

    ZQSelect.Active:=false;
    ZQSelect.SQL.Clear;
    ZQSelect.SQL.Add('select * from equipos where equipo_tipo="'+equipo_tipo.Text+'" and equipo_numero="'+documentoventa_equipo.Text+'" and sucursal_id="'+sucursal_id.codigo+'"');
    ZQSelect.Active:=true;
    id:=ZQSelect.FieldByName('equipo_id').AsString;
    equipo_observaciones.Text:=ZQSelect.FieldByName('equipo_observaciones').AsString;

end;

procedure TConsultaEquipos.btnguardarClick(Sender: TObject);
begin
  inherited;
    if id='' then
      agregar
    else
      modificar;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);


end;

procedure TConsultaEquipos.btnimprimirClick(Sender: TObject);
var
  orden:integer;
begin
  inherited;
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

    temporal_idproceso:=Princ.codigo('temporales','temporal_idproceso');

    orden:=0;
    ZQDocumentosventas.First;
    while not ZQDocumentosventas.Eof do
        begin
            ZQDocumentoventadetalles.First;
            Princ.ZQExcecSQL.Sql.Clear;
            Princ.ZQExcecSQL.Sql.Add('insert into temporales set ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string9=:temporal_string9, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string8=:temporal_string8, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string6=:temporal_string6, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int2=:temporal_int2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_int3=:temporal_int3, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float3=:temporal_float3, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float2=:temporal_float2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_float1=:temporal_float1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string5=:temporal_string5, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string4=:temporal_string4, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string3=:temporal_string3, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
            Princ.ZQExcecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
            Princ.ZQExcecSQL.ParamByName('temporal_string9').AsString:=ZQDocumentosventas.FieldByName('documentoventa_observacion').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string8').AsString:=ZQDocumentosventas.FieldByName('documentoventa_formapago').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string6').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_int2').AsInteger:=orden;
            orden:=orden+1;
            Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float3').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float2').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string5').AsString:=ZQDocumentosventas.FieldByName('cliente_documentonro').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string4').AsString:=ZQDocumentosventas.FieldByName('provincia_nombre').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string3').AsString:=ZQDocumentosventas.FieldByName('localidad_nombre').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:=ZQDocumentosventas.FieldByName('cliente_domicilio').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:=ZQDocumentosventas.FieldByName('cliente_nombre').AsString;
            Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
            Princ.ZQExcecSQL.ExecSql;
            orden:=orden+1;



            ZQDocumentoventadetalles.Next;
            while not ZQDocumentoventadetalles.Eof do
                begin
                    Princ.ZQExcecSQL.ParamByName('temporal_string9').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_string8').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_string6').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_int2').AsInteger:=orden;
                    orden:=orden+1;
                    Princ.ZQExcecSQL.ParamByName('temporal_int3').AsString:=ZQDocumentosventas.FieldByName('documentoventa_id').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_float3').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_float2').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_float1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString;
                    Princ.ZQExcecSQL.ParamByName('temporal_string5').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_string4').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_string3').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_string2').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_string1').AsString:='';
                    Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
                    Princ.ZQExcecSQL.ExecSql;
                    orden:=orden+1;
                    ZQDocumentoventadetalles.Next;
                end;

            ZQDocumentosventas.Next;
        end;







    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'equipo.rep';
    Princ.VCLReport1.Report.Datainfo.Items[1].sql:='select * from temporales '+
                                                   'where temporal_idproceso='+temporal_idproceso+
                                                   ' order by temporal_int3, temporal_string6 ';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from equipos '+
                                                   'inner join sucursales on equipos.sucursal_id=sucursales.sucursal_id '+
                                                   'inner join empresas on sucursales.empresa_id=empresas.empresa_id '+
                                                   'where equipo_id='+id;


    Princ.VCLReport1.Execute;

    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;




end;

procedure TConsultaEquipos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    if ZQDocumentosventas.Active then
      begin
          if ZQDocumentosventas.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQDocumentosventas.FieldByName('documentoventa_id').AsString,ZQDocumentosventas.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TConsultaEquipos.DSCDocumentosventasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.SQL.Text:='select * from documentoventadetalles where documentoventa_id="'+ZQDocumentosventas.FieldByName('documentoventa_id').AsString+'" order by documentoventadetalle_descripcion';
    ZQDocumentoventadetalles.Active:=true;
end;

procedure TConsultaEquipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;
end;

procedure TConsultaEquipos.FormCreate(Sender: TObject);
begin
  inherited;
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=0;
    PageControl1.ActivePage:=TabSheet1;
end;

end.
