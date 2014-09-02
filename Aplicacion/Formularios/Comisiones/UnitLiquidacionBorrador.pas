unit UnitLiquidacionBorrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, Grids,
  DBGrids, MoneyEdit, Math;

type
  TLiquidacionBorrador = class(TABMbase)
    Label1: TLabel;
    liquidacionborrador_id: TEdit;
    Label2: TLabel;
    liquidacionborrador_fecha: TDateTimePicker;
    Label4: TLabel;
    personal_id: TSqlComboBox;
    ZQliquidacionborradordetalles: TZQuery;
    DTSliquidacionborradordetalles: TDataSource;
    Label10: TLabel;
    liquidacionborrador_total: TMoneyEdit;
    Label3: TLabel;
    liquidacionborrador_observaciones: TMemo;
    ZQliquidacionborradordetallesliquidacionborradordetalle_id: TIntegerField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_importe: TFloatField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_pagado: TFloatField;
    ZQliquidacionborradordetallesliquidacionborradordetalle_saldo: TFloatField;
    ZQliquidacionborradordetallesliquidacionborrador_id: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_id: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_id_1: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_importeunit: TFloatField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_total: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_id: TIntegerField;
    ZQliquidacionborradordetallespersonal_id: TIntegerField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_saldo: TFloatField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_pagado: TFloatField;
    ZQliquidacionborradordetallesdocuvendetcomisionvendedor_estado: TStringField;
    ZQliquidacionborradordetallesdocumentoventadetalle_id_1: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_descripcion: TStringField;
    ZQliquidacionborradordetallesdocumentoventadetalle_cantidad: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_precio: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_total: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_neto21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_iva21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_neto105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_iva105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_nogravado: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_estado: TStringField;
    ZQliquidacionborradordetallesdocumentoventadetalle_observacion: TStringField;
    ZQliquidacionborradordetallesproducto_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_idorig: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe1: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe2: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe3: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe4: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe5: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_importe6: TFloatField;
    ZQliquidacionborradordetallesdocumentoventadetalle_listaprecio: TIntegerField;
    ZQliquidacionborradordetallesproducto_tipo: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_id_1: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_numero: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_fecha: TDateField;
    ZQliquidacionborradordetallesdocumentoventa_hora: TTimeField;
    ZQliquidacionborradordetallesdocumentoventa_neto21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_iva21: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_neto105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_iva105: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_netonogravado: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_total: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_estado: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_pagado: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_saldo: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_observacion: TStringField;
    ZQliquidacionborradordetallescliente_id: TIntegerField;
    ZQliquidacionborradordetallespersonal_id_1: TIntegerField;
    ZQliquidacionborradordetallestipodocu_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_condicionventa: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_fechavenc: TDateField;
    ZQliquidacionborradordetallesdocumentoventa_listaprecio: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_equipo1: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_equipo2: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_formapago: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_nrodetallepago: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_solicitudcliente: TStringField;
    ZQliquidacionborradordetallesdocumentoventa_trabajorealizado: TStringField;
    ZQliquidacionborradordetallescaja_id: TIntegerField;
    ZQliquidacionborradordetallesdocumentoventa_recargo: TFloatField;
    ZQliquidacionborradordetallesdocumentoventa_descuento: TFloatField;
    Label5: TLabel;
    liquidacionborrador_equipo: TEdit;
    ZQliquidacionborradordetallesanterior: TZQuery;
    ZQliquidacionborradordetallesliquidacionborradordetalle_estado: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    btnagregar: TButton;
    btnquitar: TButton;
    Label6: TLabel;
    total_borradores: TEdit;
    DBGrid2: TDBGrid;
    DTSliquidacionborradordebcred: TDataSource;
    ZQliquidacionborradordebcred: TZQuery;
    ZQliquidacionborradordebcredliquidacionborradordebcred_id: TIntegerField;
    ZQliquidacionborradordebcredliquidacionborradordebcred_importe: TFloatField;
    ZQliquidacionborradordebcredliquidacionborrador_id: TIntegerField;
    Label7: TLabel;
    total_debcre: TEdit;
    btnagregardebcred: TButton;
    btnquitardebcred: TButton;
    ZQliquidacionborradordebcredliquidacionborradordebcred_descripcion: TStringField;
    ZQliquidacionborradordetallescliente_id_1: TIntegerField;
    ZQliquidacionborradordetallescliente_nombre: TStringField;
    ZQliquidacionborradordetallescliente_domicilio: TStringField;
    ZQliquidacionborradordetallescliente_documentonro: TStringField;
    ZQliquidacionborradordetallescliente_documentotipo: TStringField;
    ZQliquidacionborradordetallescliente_telefono: TStringField;
    ZQliquidacionborradordetallescliente_celular: TStringField;
    ZQliquidacionborradordetallescliente_mail: TStringField;
    ZQliquidacionborradordetallescondicioniva_id: TIntegerField;
    ZQliquidacionborradordetallescliente_listaprecio: TIntegerField;
    ZQliquidacionborradordetallescliente_condicionventa: TStringField;
    ZQliquidacionborradordetalleslocalidad_id: TIntegerField;
    ZQliquidacionborradordetallescliente_observaciones: TStringField;
    ZQliquidacionborradordetallespersonal_id_2: TIntegerField;
    ZQliquidacionborradordetallescliente_diasvenc: TIntegerField;
    btnimprimir: TButton;
    procedure btnagregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
    procedure btnagregardebcredClick(Sender: TObject);
    procedure btnquitardebcredClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularTotal;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  LiquidacionBorrador: TLiquidacionBorrador;

implementation

uses UnitComisionesBorradorPendientes, unitprinc,
  UnitLiquidacionBorradorDebCred;

{$R *.dfm}

procedure TLiquidacionBorrador.agregar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin');
    ZQExecSQL.ExecSQL;

    id:=Princ.codigo('liquidacionesborradores','liquidacionborrador_id');

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into liquidacionesborradores set ');
    ZQExecSQL.Sql.Add('liquidacionborrador_equipo=:liquidacionborrador_equipo, ');
    ZQExecSQL.Sql.Add('personal_id=:personal_id, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_observaciones=:liquidacionborrador_observaciones, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_total=:liquidacionborrador_total, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_fecha=:liquidacionborrador_fecha, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_equipo').AsString:=liquidacionborrador_equipo.Text;
    ZQExecSQL.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSQL.ParamByName('liquidacionborrador_observaciones').AsString:=liquidacionborrador_observaciones.Text;
    ZQExecSQL.ParamByName('liquidacionborrador_total').AsString:=liquidacionborrador_total.Text;
    ZQExecSQL.ParamByName('liquidacionborrador_fecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionborrador_fecha.Date);
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQliquidacionborradordetalles.First;
    while not ZQliquidacionborradordetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into liquidacionborradordetalles set ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id, ');
            ZQExecSQL.Sql.Add('liquidacionborrador_id=:liquidacionborrador_id, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_estado=:liquidacionborradordetalle_estado, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_saldo=:liquidacionborradordetalle_saldo, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_pagado=:liquidacionborradordetalle_pagado, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_importe=:liquidacionborradordetalle_importe, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_id=:liquidacionborradordetalle_id ');
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_id').AsString:=ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_id').AsString;
            ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_estado').AsString:='PENDIENTE';
            if ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat>0 then
              ZQExecSQL.ParamByName('liquidacionborradordetalle_estado').AsString:='PAGADA';
            ZQExecSQL.ParamByName('liquidacionborradordetalle_saldo').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_pagado').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_pagado').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_importe').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_id').AsString:=Princ.codigo('liquidacionborradordetalles','liquidacionborradordetalle_id');
            ZQExecSQL.ExecSql;

            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('update docuvendetcomisionesvendedores set ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_estado=:docuvendetcomisionvendedor_estado, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_pagado=docuvendetcomisionvendedor_pagado+:liquidacionborradordetalle_importe, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_saldo=docuvendetcomisionvendedor_saldo-:liquidacionborradordetalle_importe ');
            ZQExecSQL.Sql.Add('where docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_estado').AsString:='PAGADA';
            if roundto(ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat,-2)>0 then
              ZQExecSQL.ParamByName('docuvendetcomisionvendedor_estado').AsString:='PENDIENTE';

            ZQExecSQL.ParamByName('liquidacionborradordetalle_importe').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsString;
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_id').AsString:=ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_id').AsString;
            ZQExecSQL.ExecSql;

            ZQliquidacionborradordetalles.Next;
        end;


    ZQliquidacionborradordebcred.First;
    while not ZQliquidacionborradordebcred.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into liquidacionborradordebcred set ');
            ZQExecSQL.Sql.Add('liquidacionborrador_id=:liquidacionborrador_id, ');
            ZQExecSQL.Sql.Add('liquidacionborradordebcred_importe=:liquidacionborradordebcred_importe, ');
            ZQExecSQL.Sql.Add('liquidacionborradordebcred_descripcion=:liquidacionborradordebcred_descripcion, ');
            ZQExecSQL.Sql.Add('liquidacionborradordebcred_id=:liquidacionborradordebcred_id ');
            ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
            ZQExecSQL.ParamByName('liquidacionborradordebcred_importe').AsString:=ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_importe').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordebcred_descripcion').AsString:=ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_descripcion').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordebcred_id').AsString:=Princ.codigo('liquidacionborradordebcred','liquidacionborradordebcred_id');
            ZQExecSQL.ExecSql;

            ZQliquidacionborradordebcred.Next;
        end;



    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;

procedure TLiquidacionBorrador.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update liquidacionesborradores set ');
    ZQExecSQL.Sql.Add('liquidacionborrador_equipo=:liquidacionborrador_equipo, ');
    ZQExecSQL.Sql.Add('personal_id=:personal_id, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_observaciones=:liquidacionborrador_observaciones, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_total=:liquidacionborrador_total, ');
    ZQExecSQL.Sql.Add('liquidacionborrador_fecha=:liquidacionborrador_fecha ');
    ZQExecSQL.Sql.Add('where liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_equipo').AsString:=liquidacionborrador_equipo.Text;
    ZQExecSQL.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSQL.ParamByName('liquidacionborrador_observaciones').AsString:=liquidacionborrador_observaciones.Text;
    ZQExecSQL.ParamByName('liquidacionborrador_total').AsString:=liquidacionborrador_total.Text;
    ZQExecSQL.ParamByName('liquidacionborrador_fecha').AsString:=formatdatetime('yyyy-mm-dd',liquidacionborrador_fecha.Date);
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;


    ZQliquidacionborradordetallesanterior.Active:=false;
    ZQliquidacionborradordetallesanterior.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQliquidacionborradordetallesanterior.Active:=true;
    ZQliquidacionborradordetallesanterior.First;
    while not ZQliquidacionborradordetallesanterior.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('update docuvendetcomisionesvendedores set ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_estado=:docuvendetcomisionvendedor_estado, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_pagado=docuvendetcomisionvendedor_pagado-:liquidacionborradordetalle_importe, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_saldo=docuvendetcomisionvendedor_saldo+:liquidacionborradordetalle_importe ');
            ZQExecSQL.Sql.Add('where docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_estado').AsString:='PENDIENTE';
            ZQExecSQL.ParamByName('liquidacionborradordetalle_importe').AsString:=ZQliquidacionborradordetallesanterior.FieldByName('liquidacionborradordetalle_importe').AsString;
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_id').AsString:=ZQliquidacionborradordetallesanterior.FieldByName('docuvendetcomisionvendedor_id').AsString;
            ZQExecSQL.ExecSql;


            ZQliquidacionborradordetallesanterior.Next;
        end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from liquidacionborradordetalles ');
    ZQExecSQL.Sql.Add('where liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;


    ZQliquidacionborradordetalles.First;
    while not ZQliquidacionborradordetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into liquidacionborradordetalles set ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id, ');
            ZQExecSQL.Sql.Add('liquidacionborrador_id=:liquidacionborrador_id, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_estado=:liquidacionborradordetalle_estado, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_saldo=:liquidacionborradordetalle_saldo, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_pagado=:liquidacionborradordetalle_pagado, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_importe=:liquidacionborradordetalle_importe, ');
            ZQExecSQL.Sql.Add('liquidacionborradordetalle_id=:liquidacionborradordetalle_id ');
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_id').AsString:=ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_id').AsString;
            ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_estado').AsString:='PENDIENTE';
            if ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat>0 then
              ZQExecSQL.ParamByName('liquidacionborradordetalle_estado').AsString:='PAGADA';
            ZQExecSQL.ParamByName('liquidacionborradordetalle_saldo').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_pagado').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_pagado').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_importe').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordetalle_id').AsString:=Princ.codigo('liquidacionborradordetalles','liquidacionborradordetalle_id');
            ZQExecSQL.ExecSql;

            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('update docuvendetcomisionesvendedores set ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_estado=:docuvendetcomisionvendedor_estado, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_pagado=docuvendetcomisionvendedor_pagado+:liquidacionborradordetalle_importe, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_saldo=docuvendetcomisionvendedor_saldo-:liquidacionborradordetalle_importe ');
            ZQExecSQL.Sql.Add('where docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_estado').AsString:='PENDIENTE';
            if ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat>0 then
              ZQExecSQL.ParamByName('docuvendetcomisionvendedor_estado').AsString:='PAGADA';

            ZQExecSQL.ParamByName('liquidacionborradordetalle_importe').AsString:=ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsString;
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_id').AsString:=ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_id').AsString;
            ZQExecSQL.ExecSql;

            ZQliquidacionborradordetalles.Next;
        end;



    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from liquidacionborradordebcred ');
    ZQExecSQL.Sql.Add('where liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;


    ZQliquidacionborradordebcred.First;
    while not ZQliquidacionborradordebcred.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into liquidacionborradordebcred set ');
            ZQExecSQL.Sql.Add('liquidacionborrador_id=:liquidacionborrador_id, ');
            ZQExecSQL.Sql.Add('liquidacionborradordebcred_importe=:liquidacionborradordebcred_importe, ');
            ZQExecSQL.Sql.Add('liquidacionborradordebcred_descripcion=:liquidacionborradordebcred_descripcion, ');
            ZQExecSQL.Sql.Add('liquidacionborradordebcred_id=:liquidacionborradordebcred_id ');
            ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
            ZQExecSQL.ParamByName('liquidacionborradordebcred_importe').AsString:=ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_importe').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordebcred_descripcion').AsString:=ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_descripcion').AsString;
            ZQExecSQL.ParamByName('liquidacionborradordebcred_id').AsString:=Princ.codigo('liquidacionborradordebcred','liquidacionborradordebcred_id');
            ZQExecSQL.ExecSql;

            ZQliquidacionborradordebcred.Next;
        end;


    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;

procedure TLiquidacionBorrador.eliminar;
begin

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('begin');
    ZQExecSQL.ExecSQL;

    ZQliquidacionborradordetallesanterior.Active:=false;
    ZQliquidacionborradordetallesanterior.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQliquidacionborradordetallesanterior.Active:=true;
    ZQliquidacionborradordetallesanterior.First;
    while not ZQliquidacionborradordetallesanterior.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('update docuvendetcomisionesvendedores set ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_estado=:docuvendetcomisionvendedor_estado, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_pagado=docuvendetcomisionvendedor_pagado-:liquidacionborradordetalle_importe, ');
            ZQExecSQL.Sql.Add('docuvendetcomisionvendedor_saldo=docuvendetcomisionvendedor_saldo+:liquidacionborradordetalle_importe ');
            ZQExecSQL.Sql.Add('where docuvendetcomisionvendedor_id=:docuvendetcomisionvendedor_id ');
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_estado').AsString:='PENDIENTE';
            ZQExecSQL.ParamByName('liquidacionborradordetalle_importe').AsString:=ZQliquidacionborradordetallesanterior.FieldByName('liquidacionborradordetalle_importe').AsString;
            ZQExecSQL.ParamByName('docuvendetcomisionvendedor_id').AsString:=ZQliquidacionborradordetallesanterior.FieldByName('docuvendetcomisionvendedor_id').AsString;
            ZQExecSQL.ExecSql;


            ZQliquidacionborradordetallesanterior.Next;
        end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from liquidacionborradordetalles ');
    ZQExecSQL.Sql.Add('where liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from liquidacionborradordebcred ');
    ZQExecSQL.Sql.Add('where liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from liquidacionesborradores ');
    ZQExecSQL.Sql.Add('where liquidacionborrador_id=:liquidacionborrador_id ');
    ZQExecSQL.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQExecSQL.ExecSql;


    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('commit');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos borrados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;



function TLiquidacionBorrador.control:boolean;
var
  error:integer;
begin
    error:=0;



    result:=error=0;
end;

procedure TLiquidacionBorrador.CalcularTotal;
var
  temp_total_borradores:real;
  temp_total_debcred:real;
begin
    temp_total_borradores:=0;
    ZQliquidacionborradordetalles.First;
    while not ZQliquidacionborradordetalles.Eof do
        begin
            temp_total_borradores:=temp_total_borradores+ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsFloat;

            ZQliquidacionborradordetalles.Next;
        end;


    temp_total_debcred:=0;
    ZQliquidacionborradordebcred.First;
    while not ZQliquidacionborradordebcred.Eof do
        begin
            temp_total_debcred:=temp_total_debcred+ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_importe').AsFloat;

            ZQliquidacionborradordebcred.Next;
        end;


    total_borradores.Text:=floattostr(temp_total_borradores);
    total_debcre.Text:=floattostr(temp_total_debcred);
    liquidacionborrador_total.Value:=temp_total_borradores+temp_total_debcred;
end;

procedure TLiquidacionBorrador.btnagregarClick(Sender: TObject);
begin
  inherited;
    ComisionesBorradorPendientes:=TComisionesBorradorPendientes.Create(self);
    ComisionesBorradorPendientes.personal_id:=personal_id.codigo;
    ComisionesBorradorPendientes.ActivarConsulta;
    ZQliquidacionborradordetalles.First;
    while not ZQliquidacionborradordetalles.Eof do
        begin
            if ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Locate('documentoventa_id',ZQliquidacionborradordetalles.FieldByName('documentoventa_idpago').AsString,[]) then
              begin
                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Edit;
                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat:=roundto(ZQliquidacionborradordetalles.FieldByName('documentoventadoc_importe').AsFloat,-2);

                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Post;

              end;

            ZQliquidacionborradordetalles.Next;
        end;

    ComisionesBorradorPendientes.Showmodal;

    if ComisionesBorradorPendientes.ModalResult=mrOk then
      begin
          ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.First;
          while not ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Eof do
              begin
                  if ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat<>0 then
                    begin
                        if ZQliquidacionborradordetalles.Locate('docuvendetcomisionvendedor_id',ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_id').AsString,[]) then
                          ZQliquidacionborradordetalles.Edit
                        else
                          ZQliquidacionborradordetalles.Insert;

                        ZQliquidacionborradordetalles.FieldByName('documentoventa_fecha').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_fecha').AsString;
                        ZQliquidacionborradordetalles.FieldByName('documentoventa_numero').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_numero').AsString;
                        ZQliquidacionborradordetalles.FieldByName('cliente_nombre').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('cliente_nombre').AsString;
                        ZQliquidacionborradordetalles.FieldByName('documentoventa_equipo1').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('documentoventa_equipo1').AsString;
                        ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_total').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_total').AsString;
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_pagado').AsFloat:=roundto(ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_pagado').AsFloat+ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2);
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat:=roundto(ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat-ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2);;
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_importe').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsString;
                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_id').AsString:='0';
//                        ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_estado').AsString:='PENDIENTE';
//                        if ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_saldo').AsFloat=0 then
//                          ZQliquidacionborradordetalles.FieldByName('liquidacionborradordetalle_estado').AsString:='PAGADA';

                        ZQliquidacionborradordetalles.FieldByName('liquidacionborrador_id').AsString:='0';
                        ZQliquidacionborradordetalles.FieldByName('docuvendetcomisionvendedor_id').AsString:=ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_id').AsString;
                        ZQliquidacionborradordetalles.Post;


                    end;



                  ComisionesBorradorPendientes.ZQDocumentosVentasPendientes.Next;
              end;


      end
    else

    ComisionesBorradorPendientes.Free;
    CalcularTotal;
end;

procedure TLiquidacionBorrador.btnagregardebcredClick(Sender: TObject);
begin
  inherited;
    LiquidacionBorradorDebCred:=TLiquidacionBorradorDebCred.Create(self);
    if LiquidacionBorradorDebCred.ShowModal=mrOk then
      begin
          ZQliquidacionborradordebcred.Insert;
          ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_id').AsString:='0';
          ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_descripcion').AsString:=LiquidacionBorradorDebCred.liquidacionborradordebcred_descripcion.Text;
          ZQliquidacionborradordebcred.FieldByName('liquidacionborradordebcred_importe').AsString:=LiquidacionBorradorDebCred.liquidacionborradordebcred_importe.Text;
          ZQliquidacionborradordebcred.FieldByName('liquidacionborrador_id').AsString:='0';
          ZQliquidacionborradordebcred.Post;

      end;
    LiquidacionBorradorDebCred.Free;
    CalcularTotal;
end;

procedure TLiquidacionBorrador.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        ABM_AGREGAR:begin
            if control then
              agregar;
        end;

        ABM_MODIFICAR:begin
            if control then
              modificar;
        end;

        ABM_ELIMINAR:begin
        if (MessageDlg('Seguro desea eliminar esta liquidacion?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
          eliminar;
        end;

    end;
end;

procedure TLiquidacionBorrador.btnimprimirClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'liquidacion_borradores.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from liquidacionesborradores '+
                                                   'inner join personal on liquidacionesborradores.personal_id=personal.personal_id '+
                                                   'inner join liquidacionborradordetalles on liquidacionesborradores.liquidacionborrador_id=liquidacionborradordetalles.liquidacionborrador_id '+
                                                   'inner join docuvendetcomisionesvendedores on liquidacionborradordetalles.docuvendetcomisionvendedor_id=docuvendetcomisionesvendedores.docuvendetcomisionvendedor_id '+
                                                   'inner join documentoventadetalles on docuvendetcomisionesvendedores.documentoventadetalle_id=documentoventadetalles.documentoventadetalle_id '+
                                                   'inner join documentosventas on documentoventadetalles.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'where liquidacionesborradores.liquidacionborrador_id="'+id+'"';

    Princ.VCLReport1.Report.Datainfo.Items[1].sql:='select * from liquidacionborradordebcred '+
                                                   'where liquidacionborradordebcred.liquidacionborrador_id="'+id+'"';

    Princ.VCLReport1.Execute;
end;

procedure TLiquidacionBorrador.btnquitardebcredClick(Sender: TObject);
begin
  inherited;
    if ZQliquidacionborradordebcred.RecordCount>0 then
      begin
          if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
            begin
                ZQliquidacionborradordebcred.Delete;

                CalcularTotal;
            end;
      end;
end;

procedure TLiquidacionBorrador.FormCreate(Sender: TObject);
begin
  inherited;
    personal_id.llenarcombo;
end;

procedure TLiquidacionBorrador.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQSelect.Active:=true;
    PageControl1.ActivePage:=TabSheet1;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;
end;

procedure TLiquidacionBorrador.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=ABM_AGREGAR then
      begin
          liquidacionborrador_id.Text:=Princ.codigo('liquidacionesborradores','liquidacionborrador_id');
          liquidacionborrador_fecha.Date:=Date;
          liquidacionborrador_equipo.Text:='';
          liquidacionborrador_observaciones.Text:='';

      end
    else
      begin
          personal_id.Buscar(ZQSelect.FieldByName('personal_id').AsString);
          liquidacionborrador_id.Text:=ZQSelect.FieldByName('liquidacionborrador_id').AsString;
          liquidacionborrador_fecha.Date:=ZQSelect.FieldByName('liquidacionborrador_fecha').AsDateTime;
          liquidacionborrador_equipo.Text:=ZQSelect.FieldByName('liquidacionborrador_equipo').AsString;
          liquidacionborrador_observaciones.Text:=ZQSelect.FieldByName('liquidacionborrador_observaciones').AsString;


      end;


    ZQliquidacionborradordetalles.Active:=false;
    ZQliquidacionborradordetalles.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQliquidacionborradordetalles.Active:=true;

    ZQliquidacionborradordebcred.Active:=false;
    ZQliquidacionborradordebcred.ParamByName('liquidacionborrador_id').AsString:=id;
    ZQliquidacionborradordebcred.Active:=true;



    CalcularTotal;
end;

end.
