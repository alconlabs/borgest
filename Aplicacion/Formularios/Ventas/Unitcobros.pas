unit Unitcobros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ComCtrls, ExtCtrls,
  AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  Titles, MQuery;

type
  TCobros = class(TForm)
    panelgrilla: TAdvPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    cobro_fecha: TDateTimePicker;
    cliente_id: TSqlComboBox;
    vendedor_id: TSqlComboBox;
    cobro_importe: TDBAdvEdit;
    btncancelar: TButton;
    btnguardar: TButton;
    Label12: TLabel;
    cobro_observacion: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ZQSolicitudcuotas: TZQuery;
    Label1: TLabel;
    ZQCobros: TZQuery;
    MQsolicitudcuotas: TMQuery;
    tisolicitudcuotas: TTitles;
    Label5: TLabel;
    solic_id: TSqlComboBox;
    Label7: TLabel;
    total_saldo: TDBAdvEdit;
    cobro_numerorec: TDBAdvEdit;
    Label8: TLabel;
    procedure cliente_idSelect(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure solic_idChange(Sender: TObject);
  private
    { Private declarations }
    id:string;
  public
    { Public declarations }
  end;

var
  Cobros: TCobros;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TCobros.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TCobros.btnguardarClick(Sender: TObject);
var
  resto, pago, saldo, totalpagado:real;
  estado:string;
begin


    if (cobro_importe.FloatValue<=total_saldo.FloatValue) then
      begin
          if (cobro_importe.FloatValue>0) then
            begin
                ZQCobros.sql.clear;
                ZQCobros.sql.add('begin');
                ZQCobros.ExecSQL;

                id:=Princ.codigo('cobros','cobro_id');

                ZQCobros.sql.clear;
                ZQCobros.sql.add('Insert into cobros (cliente_id, cobro_estado, ');
                ZQCobros.sql.add('cobro_fecha, cobro_id, cobro_importe, ');
                ZQCobros.sql.add('cobro_imputado, cobro_observacion, cobro_saldo, ');
                ZQCobros.sql.add('vendedor_id, cobro_numerorec) values (:cliente_id, :cobro_estado, ');
                ZQCobros.sql.add(':cobro_fecha, :cobro_id, :cobro_importe, ');
                ZQCobros.sql.add(':cobro_imputado, :cobro_observacion, :cobro_saldo, ');
                ZQCobros.sql.add(':vendedor_id, :cobro_numerorec)');
                ZQCobros.parambyname('cobro_estado').asstring:='PAGADO';
                ZQCobros.parambyname('cobro_fecha').asstring:=formatdatetime('yyyy-mm-dd',cobro_fecha.Date);
                ZQCobros.parambyname('cobro_id').asstring:=id;
                ZQCobros.parambyname('cobro_importe').asstring:=cobro_importe.text;
                ZQCobros.parambyname('cobro_imputado').asstring:=cobro_importe.text;
                ZQCobros.parambyname('cobro_observacion').asstring:=cobro_observacion.text;
                ZQCobros.parambyname('cobro_saldo').asstring:='0';
                ZQCobros.parambyname('vendedor_id').asstring:=vendedor_id.codigo;
                ZQCobros.parambyname('cliente_id').asstring:=cliente_id.codigo;
                ZQCobros.parambyname('cobro_numerorec').asstring:=cobro_numerorec.Text;
                ZQCobros.ExecSQL;

                resto:=cobro_importe.FloatValue;

                MQsolicitudcuotas.First;
                while resto>0 do
                    begin
                        if resto>=MQsolicitudcuotas.FieldByName('soliccuota_saldo').AsFloat then
                          begin
                              resto:=resto-MQsolicitudcuotas.FieldByName('soliccuota_saldo').AsFloat;
                              pago:=MQsolicitudcuotas.FieldByName('soliccuota_saldo').AsFloat;
                              totalpagado:=MQsolicitudcuotas.FieldByName('soliccuota_importecuota').AsFloat;
                              saldo:=0;
                              estado:='PAGADA';
                          end
                        else
                          begin
                              pago:=resto;
                              totalpagado:=MQsolicitudcuotas.FieldByName('soliccuota_pago').AsFloat+resto;
                              saldo:=MQsolicitudcuotas.FieldByName('soliccuota_saldo').AsFloat-pago;
                              resto:=0;
                              estado:='PENDIENTE';

                          end;


                        ZQCobros.sql.clear;
                        ZQCobros.sql.add('Insert into cobrosolicitudcuotas (cobro_id, cobrosoliccuota_id, ');
                        ZQCobros.sql.add('cobrosoliccuota_importe, soliccuota_estado, soliccuota_fechavenc, ');
                        ZQCobros.sql.add('soliccuota_id, soliccuota_importecuota, soliccuota_pago, ');
                        ZQCobros.sql.add('soliccuota_saldo) values (:cobro_id, :cobrosoliccuota_id, ');
                        ZQCobros.sql.add(':cobrosoliccuota_importe, :soliccuota_estado, :soliccuota_fechavenc, ');
                        ZQCobros.sql.add(':soliccuota_id, :soliccuota_importecuota, :soliccuota_pago, ');
                        ZQCobros.sql.add(':soliccuota_saldo)');
                        ZQCobros.parambyname('cobro_id').asstring:=id;
                        ZQCobros.parambyname('cobrosoliccuota_id').asstring:=Princ.codigo('cobrosolicitudcuotas','cobrosoliccuota_id');
                        ZQCobros.parambyname('cobrosoliccuota_importe').AsFloat:=pago;
                        ZQCobros.parambyname('soliccuota_estado').asstring:=estado;
                        ZQCobros.parambyname('soliccuota_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',MQsolicitudcuotas.FieldByName('soliccuota_fechavenc').AsDateTime);
                        ZQCobros.parambyname('soliccuota_id').asstring:=MQsolicitudcuotas.FieldByName('soliccuota_id').AsString;
                        ZQCobros.parambyname('soliccuota_importecuota').asstring:=MQsolicitudcuotas.FieldByName('soliccuota_importecuota').AsString;
                        ZQCobros.parambyname('soliccuota_pago').AsFloat:=pago;
                        ZQCobros.parambyname('soliccuota_saldo').AsFloat:=saldo;
                        ZQCobros.ExecSQL;

                        ZQCobros.sql.clear;
                        ZQCobros.sql.add('Update solicitudcuotas set ');
                        ZQCobros.sql.add('soliccuota_estado=:soliccuota_estado, ');
                        ZQCobros.sql.add('soliccuota_pago=:soliccuota_pago, ');
                        ZQCobros.sql.add('soliccuota_saldo=:soliccuota_saldo');
                        ZQCobros.sql.add(' where soliccuota_id=:soliccuota_id');
                        ZQCobros.parambyname('soliccuota_estado').asstring:=estado;
                        ZQCobros.parambyname('soliccuota_pago').AsFloat:=totalpagado;
                        ZQCobros.parambyname('soliccuota_saldo').AsFloat:=saldo;
                        ZQCobros.parambyname('soliccuota_id').asstring:=MQsolicitudcuotas.FieldByName('soliccuota_id').AsString;
                        ZQCobros.ExecSQL;

                        MQsolicitudcuotas.Next;

                    end;

                ZQCobros.sql.clear;
                ZQCobros.sql.add('commit');
                ZQCobros.ExecSQL;

                MessageDlg('Cobro registrado', mtInformation, [mbOK], 0);
                cliente_id.Buscar('-1');
                cliente_id.OnSelect(self);
                cobro_importe.FloatValue:=0;
                cobro_numerorec.Text:='0';

            end
          else
            begin
                MessageDlg('Ingrese un monto a cobrar', mtError, [mbOK], 0);
                cobro_importe.SetFocus;

            end;


      end
    else
      begin
          MessageDlg('El importe a cobrar no puede ser mayor al saldo total.', mtError, [mbOK], 0);


      end;






end;

procedure TCobros.cliente_idSelect(Sender: TObject);
begin
    solic_id.Confsql.Text:='select *, concat(solic_numero, " - ", solic_fecha) as solic_nombre from solicitudes '+
                           ' where cliente_id=""';

    if cliente_id.Text<>'' then
      begin
          solic_id.Confsql.Text:='select *, concat(solic_numero, " - ", solic_fecha) as solic_nombre from solicitudes '+
                                 ' where cliente_id="'+cliente_id.codigo+'"';

      end;
    solic_id.llenarcombo;
    try
      solic_id.ItemIndex:=0;
      solic_idChange(self);
    except
    end;




end;

procedure TCobros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure TCobros.FormCreate(Sender: TObject);
begin
    vendedor_id.llenarcombo;
    cliente_id.llenarcombo;
    cobro_fecha.Date:=Princ.fechaservidor;

end;

procedure TCobros.solic_idChange(Sender: TObject);
begin
    tisolicitudcuotas.Memo.Text:='select solicitudes.solic_id, soliccuota_id, soliccuota_nrocuota, soliccuota_importecuota,  '+
                                 'soliccuota_pago, soliccuota_saldo, soliccuota_fechavenc,  0 as cobrosoliccuota_importe  '+
                                 'from solicitudcuotas '+
                                 'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.solic_id '+
                                 'where solicitudes.solic_id="'+solic_id.codigo+'" and soliccuota_estado="PENDIENTE" '+
                                 ' order by soliccuota_nrocuota';
    MQsolicitudcuotas.Active:=false;
    MQsolicitudcuotas.Active:=true;
    MQsolicitudcuotas.add(nil,tisolicitudcuotas);
    MQsolicitudcuotas.First;

    total_saldo.Text:=Princ.buscar('select sum(soliccuota_saldo) as saldo from solicitudcuotas '+
                                   'where solic_id="'+solic_id.codigo+'" and soliccuota_estado="PENDIENTE" '+
                                   'group by solic_id ', 'saldo');
end;

end.
