unit Unitgeneranuevasolicitud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery;

type
  Tgeneranuevasolicitud = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    cliente_id: TSqlComboBox;
    Label4: TLabel;
    vendedor_id: TSqlComboBox;
    solic_total: TDBAdvEdit;
    btncancelar: TButton;
    btnguardar: TButton;
    Label5: TLabel;
    solic_cuotas: TDBAdvEdit;
    solic_importecuota: TDBAdvEdit;
    Label7: TLabel;
    solic_cuotatipo: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    solic_vencuno: TDateTimePicker;
    solic_interesganado: TDBAdvEdit;
    solic_montoganado: TDBAdvEdit;
    Label13: TLabel;
    cobro_fecha: TDateTimePicker;
    Label15: TLabel;
    solic_id: TSqlComboBox;
    DBGrid1: TDBGrid;
    MQsolicitudcuotas: TMQuery;
    tisolicitudcuotas: TTitles;
    ZQCobros: TZQuery;
    ZQSolicitudcuotas: TZQuery;
    DataSource1: TDataSource;
    Label16: TLabel;
    total_saldo: TDBAdvEdit;
    solic_numero: TDBAdvEdit;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure solic_cuotasExit(Sender: TObject);
    procedure solic_importecuotaExit(Sender: TObject);
    procedure SqlComboBox1Select(Sender: TObject);
    procedure solic_idChange(Sender: TObject);
    procedure cliente_idSelect(Sender: TObject);
    procedure total_saldoExit(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    function control:boolean;
    procedure regenerarsolicitud;
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  generanuevasolicitud: Tgeneranuevasolicitud;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}



procedure Tgeneranuevasolicitud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tgeneranuevasolicitud.FormCreate(Sender: TObject);
begin
    vendedor_id.llenarcombo;
    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=-1;

    cobro_fecha.Date:=Princ.fechaservidor;

end;

procedure Tgeneranuevasolicitud.FormShow(Sender: TObject);
begin
///    ZQuery2.Active:=false;
///    ZQuery2.ParamByName('solic_id').AsString:=id;
///    ZQuery2.Active:=true;

   // if abm=4 then
//      btnguardar.Caption:='Imprimir';
//
//    if abm=3 then
//      btnguardar.Caption:='Eliminar';

end;



procedure Tgeneranuevasolicitud.regenerarsolicitud;
var
  i:integer;
  nrocuota:integer;
begin

    ///////modifica las cuotas de las solicitudes a regenerada

//    MQsolicitudcuotas.First;
//    While not MQsolicitudcuotas.Eof do
//    begin

//        if MQsolicitudcuotas.FieldByName('soliccuota_estado').AsString='PENDIENTE' then
//        begin

//          ZQuery2.sql.clear;
//          ZQuery2.sql.add('Update solicitudcuotas set ');
//          ZQuery2.sql.add('soliccuota_estado=:soliccuota_estado');
//          ZQuery2.sql.add(' where soliccuota_id=:soliccuota_id');
//          ZQuery2.parambyname('soliccuota_estado').asstring:='REGENERADA';
//          ZQuery2.parambyname('soliccuota_id').asstring:=MQsolicitudcuotas.FieldByName('soliccuota_id').AsString;
//          ZQuery2.ExecSQL;

//        end;


//    MQsolicitudcuotas.Next;
//    end;

//    ZQuery2.sql.clear;
//    ZQuery2.sql.add('Update solicitudes set ');
//    ZQuery2.sql.add('solic_estado=:solic_estado');
//    ZQuery2.sql.add(' where so lic_id=:solic_id');
//    ZQuery2.parambyname('solic_estado').asstring:='PAGADA';
//    ZQuery2.parambyname('solic_id').asstring:=solic_id.codigo;
//    ZQuery2.ExecSQL;



    ////carga de solicitud
//    id:=solic_numero.Text;
//    id:=Princ.codigo('solicitudes','solic_id');

//    ZQuery2.sql.clear;
//    ZQuery2.sql.add('Insert into solicitudes (cliente_id, solic_cuotas, ');
//    ZQuery2.sql.add('solic_estado, solic_fecha, solic_id, ');
//    ZQuery2.sql.add('solic_importecuota, solic_total, vendedor_id, solic_vencuno, solic_cuotatipo, solic_numero, solic_prestado, solic_total2) ');
//    ZQuery2.sql.add('values (:cliente_id, :solic_cuotas, ');
//    ZQuery2.sql.add(':solic_estado, :solic_fecha, :solic_id, ');
//    ZQuery2.sql.add(':solic_importecuota, :solic_total, :vendedor_id, :solic_vencuno, :solic_cuotatipo, :solic_numero, :solic_prestado, :solic_total2)');
//    ZQuery2.parambyname('cliente_id').asstring:=cliente_id.codigo;
//    ZQuery2.parambyname('solic_cuotas').asstring:=solic_cuotas.text;
//    ZQuery2.parambyname('solic_estado').asstring:='PENDIENTE';
//    ZQuery2.parambyname('solic_fecha').asstring:=formatdatetime('yyyy-mm-dd',cobro_fecha.Date);
//    ZQuery2.parambyname('solic_id').asstring:=id;
//    ZQuery2.parambyname('solic_importecuota').asstring:=solic_importecuota.text;
//    ZQuery2.parambyname('solic_total').asstring:=solic_total.text;
//    ZQuery2.parambyname('vendedor_id').asstring:=vendedor_id.codigo;
//    ZQuery2.parambyname('solic_vencuno').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date);
//    ZQuery2.parambyname('solic_cuotatipo').AsInteger:=solic_cuotatipo.ItemIndex;
//    ZQuery2.parambyname('solic_numero').asstring:=Princ.codigo('solicitudes','solic_numero');
//   ZQuery2.parambyname('solic_prestado').asstring:=total_saldo.text;
//    ZQuery2.parambyname('solic_total2').asstring:=solic_total.text;
//    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from solicitudcuotas where solic_id=:solic_id and soliccuota_estado="PENDIENTE" ');
    ZQuery2.ParamByName('solic_id').AsString:=solic_id.codigo;
    ZQuery2.ExecSQL;

    if princ.buscar('select * from solicitudcuotas where solic_id='+solic_id.codigo+'','soliccuota_nrocuota')<>'' then
    begin
         nrocuota:=strtoint(princ.buscar('select * from solicitudcuotas where solic_id='+solic_id.codigo+'','soliccuota_nrocuota'));
         nrocuota:=nrocuota+1;
    end
    else
       nrocuota:=1;

//    if inttostr(nrocuota)='' then
//       nrocuota:=1
//    else
//       nrocuota:=nrocuota+1;


    case solic_cuotatipo.ItemIndex of
        0:begin
              tipocuota:=7;
          end;
        1:begin
              tipocuota:=14;
          end;
        2:begin
              tipocuota:=1;
          end;
        3:begin
              tipocuota:=30;
          end;

    end;



    for i := 1 to solic_cuotas.IntValue do
      begin

          ZQuery2.sql.clear;
          ZQuery2.sql.add('Insert into solicitudcuotas (solic_id, soliccuota_estado, ');
          ZQuery2.sql.add('soliccuota_fechavenc, soliccuota_id, soliccuota_importecuota, ');
          ZQuery2.sql.add('soliccuota_nrocuota, soliccuota_pago, soliccuota_saldo) values (');
          ZQuery2.sql.add(':solic_id, :soliccuota_estado, :soliccuota_fechavenc, ');
          ZQuery2.sql.add(':soliccuota_id, :soliccuota_importecuota, :soliccuota_nrocuota, ');
          ZQuery2.sql.add(':soliccuota_pago, :soliccuota_saldo)');
          ZQuery2.parambyname('solic_id').asstring:=solic_id.codigo;
          ZQuery2.parambyname('soliccuota_estado').asstring:='PENDIENTE';
          ZQuery2.parambyname('soliccuota_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date+(tipocuota*(i-1)));
          ZQuery2.parambyname('soliccuota_id').asstring:=Princ.codigo('solicitudcuotas','soliccuota_id');
          ZQuery2.parambyname('soliccuota_importecuota').asstring:=solic_importecuota.text;
          ZQuery2.parambyname('soliccuota_nrocuota').AsInteger:=nrocuota;
          ZQuery2.parambyname('soliccuota_pago').asstring:='0';
          ZQuery2.parambyname('soliccuota_saldo').asstring:=solic_importecuota.text;
          ZQuery2.ExecSQL;

          nrocuota:=nrocuota+1;
     end;

   MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
   Self.Close;

end;


procedure Tgeneranuevasolicitud.solic_cuotasExit(Sender: TObject);
begin
//    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
//    solic_montoganado.FloatValue:=solic_total.FloatValue-total_saldo.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/total_saldo.FloatValue;

    solic_importecuota.FloatValue:=total_saldo.FloatValue/solic_cuotas.FloatValue;



end;

procedure Tgeneranuevasolicitud.solic_idChange(Sender: TObject);
begin
   tisolicitudcuotas.Memo.Text:='select solicitudes.solic_id, soliccuota_id, soliccuota_nrocuota, soliccuota_importecuota,  '+
                                 'soliccuota_pago, soliccuota_saldo, soliccuota_fechavenc,  0 as cobrosoliccuota_importe,  '+
                                 'soliccuota_estado from solicitudcuotas '+
                                 'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.solic_id '+
                                 'where solicitudes.solic_id="'+solic_id.codigo+'" and soliccuota_estado="PENDIENTE" '+
                                 ' order by soliccuota_nrocuota';
    MQsolicitudcuotas.Active:=false;
    MQsolicitudcuotas.Active:=true;
    MQsolicitudcuotas.add(nil,tisolicitudcuotas);
    MQsolicitudcuotas.First;
    solic_numero.text:=solic_id.codigo;

    total_saldo.Text:=Princ.buscar('select sum(soliccuota_saldo) as saldo from solicitudcuotas '+
                                   'where solic_id="'+solic_id.codigo+'" and soliccuota_estado="PENDIENTE" '+
                                   'group by solic_id ', 'saldo');
end;

procedure Tgeneranuevasolicitud.solic_importecuotaExit(Sender: TObject);
begin
    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
    solic_montoganado.FloatValue:=solic_total.FloatValue-total_saldo.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/total_saldo.FloatValue;



end;

procedure Tgeneranuevasolicitud.SqlComboBox1Select(Sender: TObject);
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

procedure Tgeneranuevasolicitud.total_saldoExit(Sender: TObject);
begin
//    solic_montoganado.FloatValue:=solic_total.FloatValue-total_saldo.FloatValue;
//    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/total_saldo.FloatValue;

end;



procedure Tgeneranuevasolicitud.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Tgeneranuevasolicitud.btnguardarClick(Sender: TObject);
begin
    self.regenerarsolicitud;

end;

procedure Tgeneranuevasolicitud.cliente_idSelect(Sender: TObject);
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

function Tgeneranuevasolicitud.control:boolean;
var
  error:integer;
begin
    error:=0;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
