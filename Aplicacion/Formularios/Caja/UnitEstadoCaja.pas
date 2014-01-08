unit UnitEstadoCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids, ComCtrls, GTBGroupBox, Math,
  MoneyEdit, AdvEdit, AdvMoneyEdit;

type
  TEstadoCaja = class(TABMbase)
    GroupBoxVentasContado: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnimprimir: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    ZQIngresos: TZQuery;
    DSCIngresos: TDataSource;
    DBGrid2: TDBGrid;
    ZQEgresos: TZQuery;
    DSCEgresos: TDataSource;
    caja_fecha: TDateTimePicker;
    Label2: TLabel;
    btnvercaja: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button7: TButton;
    Button6: TButton;
    Button5: TButton;
    DBGrid3: TDBGrid;
    ZQDocumentosventas: TZQuery;
    DSCDocumentosventas: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    total_caja: TAdvMoneyEdit;
    SubTotal_ingresos: TAdvMoneyEdit;
    SubTotal_egresos: TAdvMoneyEdit;
    SubTotal_ventas: TAdvMoneyEdit;
    BtnImprimirResumenTarjetas: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnvercajaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure BtnImprimirResumenTarjetasClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularTotalIngresos;
    procedure CalcularTotalEgresos;
    procedure CalcularTotalVentas;
    procedure CalcularTotal;
  public
    { Public declarations }
  end;

var
  EstadoCaja: TEstadoCaja;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TEstadoCaja.CalcularTotalIngresos;
begin
    SubTotal_ingresos.Text:=floattostr(roundto(0.00,-2));
    ZQIngresos.First;
    while not ZQIngresos.Eof do
        begin
            SubTotal_ingresos.Text:=floattostr(strtofloat(SubTotal_ingresos.Text)+ZQIngresos.FieldByName('cajaasiento_importe').AsFloat);

            ZQIngresos.Next;
        end;
end;

procedure TEstadoCaja.CalcularTotalEgresos;
begin
    SubTotal_egresos.Text:=floattostr(0.0);
    ZQEgresos.First;
    while not ZQEgresos.Eof do
        begin
            SubTotal_egresos.Text:=floattostr(strtofloat(SubTotal_egresos.Text)+ZQEgresos.FieldByName('cajaasiento_importe').AsFloat);

            ZQEgresos.Next;
        end;
end;

procedure TEstadoCaja.CalcularTotalVentas;
begin
    SubTotal_ventas.Text:=floattostr(0.0);
    ZQDocumentosventas.First;
    while not ZQDocumentosventas.Eof do
        begin
            SubTotal_ventas.Text:=floattostr(strtofloat(SubTotal_ventas.Text)+ZQDocumentosventas.FieldByName('documentopago_importe').AsFloat);

            ZQDocumentosventas.Next;
        end;
end;

procedure TEstadoCaja.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
    if ZQDocumentosventas.Active then
      begin
          if ZQDocumentosventas.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQDocumentosventas.FieldByName('documentoventa_id').AsString,ZQDocumentosventas.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TEstadoCaja.CalcularTotal;
begin
    CalcularTotalIngresos;
    CalcularTotalEgresos;
    CalcularTotalVentas;
    total_caja.Text:=floattostr(roundto(strtofloat(SubTotal_ingresos.Text)-strtofloat(SubTotal_egresos.Text)+strtofloat(SubTotal_ventas.Text),-2));



end;

procedure TEstadoCaja.btnimprimirClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_caja.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select documentopagos.*, tipospago.*,  sum(documentopago_importe) as importe from documentopagos '+
                                                   'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                                   'inner join documentosventas on documentopagos.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tipopago_caja=-1 and '+
                                                   'documentosventas.documentoventa_fecha="'+formatdatetime('yyyy-mm-dd',caja_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_estado<>"ANULADA"'+Princ.empresa_where+
                                                   ' group by documentopagos.tipopago_id '+
                                                   'order by documentopagos.tipopago_id ';


    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select documentopagos.*, tipospago.*,  sum(documentopago_importe) as importe,  '+
                                                   'count(documentopagos.documentopago_nombre) as cantidad '+
                                                   'from documentopagos '+
                                                   'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                                   'inner join documentosventas on documentopagos.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tipopago_caja=-1 and tipospago.tipopago_id=2 and '+
                                                   'documentosventas.documentoventa_fecha="'+formatdatetime('yyyy-mm-dd',caja_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_estado<>"ANULADA"'+Princ.empresa_where+
                                                   ' group by documentopagos.documentopago_nombre '+
                                                   'order by documentopagos.documentopago_nombre ';









    Princ.VCLReport1.Execute;
end;

procedure TEstadoCaja.BtnImprimirResumenTarjetasClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'informe_caja_tarjetas.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select documentopagos.*, tipospago.*,  sum(documentopago_importe) as importe,  '+
                                                   'count(documentopagos.documentopago_nombre) as cantidad '+
                                                   'from documentopagos '+
                                                   'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                                   'inner join documentosventas on documentopagos.documentoventa_id=documentosventas.documentoventa_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tipopago_caja=-1 and tipospago.tipopago_id=2 and '+
                                                   'documentosventas.documentoventa_fecha="'+formatdatetime('yyyy-mm-dd',caja_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_estado<>"ANULADA"'+Princ.empresa_where+
                                                   ' group by documentopagos.documentopago_nombre '+
                                                   'order by documentopagos.documentopago_nombre ';

    Princ.VCLReport1.Report.Datainfo.Items[2].sql:='select *, sum(cupontarjeta_importe) as importe, count(cupontarjeta_id) as cantidad from cuponestarjetas  '+
                                                   'inner join tarjetas on cuponestarjetas.tarjeta_id=tarjetas.tarjeta_id '+
                                                   'where cupontarjeta_fecha ="'+formatdatetime('yyyy-mm-dd',caja_fecha.Date)+'" '+
                                                   'group by cuponestarjetas.tarjeta_id, cuponestarjetas.cupontarjeta_cuotas ';






    Princ.VCLReport1.Execute;
end;

procedure TEstadoCaja.btnvercajaClick(Sender: TObject);
begin
  inherited;
    ZQIngresos.Active:=false;
    ZQIngresos.ParamByName('cajaasiento_fecha').AsString:=formatdatetime('yyyy-mm-dd',caja_fecha.Date);
    ZQIngresos.Active:=true;

    ZQEgresos.Active:=false;
    ZQEgresos.ParamByName('cajaasiento_fecha').AsString:=formatdatetime('yyyy-mm-dd',caja_fecha.Date);
    ZQEgresos.Active:=true;

    ZQDocumentosventas.Active:=false;
    ZQDocumentosventas.SQL.Text:='select * from documentosventas '+
                                 'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                 'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                 'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                 'inner join documentopagos on documentosventas.documentoventa_id=documentopagos.documentoventa_id '+
                                 'where documentosventas.documentoventa_fecha=:documentoventa_fecha '+Princ.empresa_where;
    ZQDocumentosventas.ParamByName('documentoventa_fecha').AsString:=formatdatetime('yyyy-mm-dd',caja_fecha.Date);
    ZQDocumentosventas.Active:=true;

    CalcularTotal;

end;

procedure TEstadoCaja.Button2Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoCajaAsientoIngreso('0');
    btnvercaja.Click;
end;

procedure TEstadoCaja.Button3Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirModificarCajaAsientoIngreso(ZQIngresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TEstadoCaja.Button4Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirEliminarCajaAsiento(ZQIngresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TEstadoCaja.Button5Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoCajaAsientoEgreso('0');
    btnvercaja.Click;
end;

procedure TEstadoCaja.Button6Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirModificarCajaAsientoEgreso(ZQEgresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TEstadoCaja.Button7Click(Sender: TObject);
begin
  inherited;
    Princ.AbrirEliminarCajaAsiento(ZQEgresos.FieldByName('cajaasiento_id').AsString);
    btnvercaja.Click;
end;

procedure TEstadoCaja.FormShow(Sender: TObject);
begin
  inherited;
    caja_fecha.Date:=princ.fechaservidor;
    btnvercaja.Click;
end;

end.
