unit Unitsolicitudes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd;

type
  Tsolicitudes = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label1: TLabel;
    solic_numero: TEdit;
    solic_fecha: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    cliente_id: TSqlComboBox;
    Label4: TLabel;
    vendedor_id: TSqlComboBox;
    Label6: TLabel;
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
    Label10: TLabel;
    solic_prestado: TDBAdvEdit;
    solic_interesganado: TDBAdvEdit;
    Label11: TLabel;
    Label12: TLabel;
    solic_montoganado: TDBAdvEdit;
    Label13: TLabel;
    cliente_dni: TEdit;
    Label14: TLabel;
    solic_numeroimpreso: TEdit;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure solic_cuotasExit(Sender: TObject);
    procedure solic_importecuotaExit(Sender: TObject);
    procedure solic_prestadoExit(Sender: TObject);
    procedure cliente_idSelect(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  solicitudes: Tsolicitudes;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Tsolicitudes.imprimir;
begin
end;


procedure Tsolicitudes.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;


    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from solicitudcuotas where solic_id=:solic_id');
    ZQuery2.ParamByName('solic_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from solicitudes where solic_id=:solic_id');
    ZQuery2.ParamByName('solic_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Tsolicitudes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tsolicitudes.FormCreate(Sender: TObject);
begin
    id:='';
    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=-1;
    
    vendedor_id.llenarcombo;
    vendedor_id.ItemIndex:=-1;

end;

procedure Tsolicitudes.FormShow(Sender: TObject);
begin
    ZQuery2.Active:=false;
    ZQuery2.ParamByName('solic_id').AsString:=id;
    ZQuery2.Active:=true;

   // if abm=4 then
//      btnguardar.Caption:='Imprimir';
//
//    if abm=3 then
//      btnguardar.Caption:='Eliminar';
    
end;

procedure Tsolicitudes.modificar;
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
    ZQuery2.parambyname('cliente_id').asstring:=cliente_id.codigo;
    ZQuery2.parambyname('solic_cuotas').asstring:=solic_cuotas.text;
    ZQuery2.parambyname('solic_cuotatipo').AsInteger:=solic_cuotatipo.ItemIndex;
    ZQuery2.parambyname('solic_fecha').asstring:=formatdatetime('yyyy-mm-dd',solic_fecha.Date);
    ZQuery2.parambyname('solic_importecuota').asstring:=solic_importecuota.text;
    ZQuery2.parambyname('solic_total').asstring:=solic_total.text;
    ZQuery2.parambyname('solic_vencuno').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date);
    ZQuery2.parambyname('vendedor_id').asstring:=vendedor_id.codigo;
    ZQuery2.parambyname('solic_id').asstring:=id;
    ZQuery2.parambyname('solic_numero').asstring:=solic_numero.text;
    ZQuery2.parambyname('solic_numeroimpreso').asstring:=solic_numeroimpreso.text;
    ZQuery2.parambyname('solic_prestado').asstring:=solic_prestado.text;
    ZQuery2.parambyname('solic_total2').asstring:=solic_total.text;
    ZQuery2.ExecSQL;




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
    end;


    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from solicitudcuotas');
    ZQuery2.sql.add(' where solic_id=:solic_id');
    ZQuery2.parambyname('solic_id').asstring:=id;
    ZQuery2.ExecSQL;



    for i := 1 to solic_cuotas.IntValue do
      begin
          ZQuery2.sql.clear;
          ZQuery2.sql.add('Insert into solicitudcuotas (solic_id, soliccuota_estado, ');
          ZQuery2.sql.add('soliccuota_fechavenc, soliccuota_id, soliccuota_importecuota, ');
          ZQuery2.sql.add('soliccuota_nrocuota, soliccuota_pago, soliccuota_saldo) values (');
          ZQuery2.sql.add(':solic_id, :soliccuota_estado, :soliccuota_fechavenc, ');
          ZQuery2.sql.add(':soliccuota_id, :soliccuota_importecuota, :soliccuota_nrocuota, ');
          ZQuery2.sql.add(':soliccuota_pago, :soliccuota_saldo)');
          ZQuery2.parambyname('solic_id').asstring:=id;
          ZQuery2.parambyname('soliccuota_estado').asstring:='PENDIENTE';
          ZQuery2.parambyname('soliccuota_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date+(tipocuota*(i-1)));
          ZQuery2.parambyname('soliccuota_id').asstring:=Princ.codigo('solicitudcuotas','soliccuota_id');
          ZQuery2.parambyname('soliccuota_importecuota').asstring:=solic_importecuota.text;
          ZQuery2.parambyname('soliccuota_nrocuota').AsInteger:=i;
          ZQuery2.parambyname('soliccuota_pago').asstring:='0';
          ZQuery2.parambyname('soliccuota_saldo').asstring:=solic_importecuota.text;
          ZQuery2.ExecSQL;

      end;



    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;

end;


procedure Tsolicitudes.solic_cuotasExit(Sender: TObject);
begin
    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure Tsolicitudes.solic_importecuotaExit(Sender: TObject);
begin
    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure Tsolicitudes.solic_prestadoExit(Sender: TObject);
begin
    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure Tsolicitudes.ZQuery2AfterOpen(DataSet: TDataSet);
begin
    if abm=1 then
      begin
          solic_fecha.Date:=date;
          solic_vencuno.date:=date;
          solic_numero.Text:=Princ.codigo('solicitudes','solic_numero');
      end
    else
      begin
          solic_numero.Text:=ZQuery2.FieldByName('solic_numero').AsString;
          solic_numeroimpreso.Text:=ZQuery2.FieldByName('solic_numeroimpreso').AsString;
          solic_fecha.Date:=ZQuery2.FieldByName('solic_fecha').AsDateTime;
          solic_vencuno.Date:=ZQuery2.FieldByName('solic_vencuno').AsDateTime;
          cliente_id.Buscar(ZQuery2.FieldByName('cliente_id').AsString);
          vendedor_id.Buscar(ZQuery2.FieldByName('vendedor_id').AsString);
          solic_cuotas.Text:=ZQuery2.FieldByName('solic_cuotas').AsString;
          solic_importecuota.Text:=ZQuery2.FieldByName('solic_importecuota').AsString;
          solic_total.Text:=ZQuery2.FieldByName('solic_total').AsString;
          solic_prestado.Text:=ZQuery2.FieldByName('solic_prestado').AsString;
          solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
          solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
      end;


end;

procedure Tsolicitudes.agregar;
var
  i: Integer;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('solicitudes','solic_id');

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into solicitudes (cliente_id, solic_cuotas, ');
    ZQuery2.sql.add('solic_estado, solic_fecha, solic_id, solic_numeroimpreso, ');
    ZQuery2.sql.add('solic_importecuota, solic_total, vendedor_id, solic_vencuno, solic_cuotatipo, solic_numero, solic_prestado, solic_total2) ');
    ZQuery2.sql.add('values (:cliente_id, :solic_cuotas, ');
    ZQuery2.sql.add(':solic_estado, :solic_fecha, :solic_id, :solic_numeroimpreso, ');
    ZQuery2.sql.add(':solic_importecuota, :solic_total, :vendedor_id, :solic_vencuno, :solic_cuotatipo, :solic_numero, :solic_prestado, :solic_total2)');
    ZQuery2.parambyname('cliente_id').asstring:=cliente_id.codigo;
    ZQuery2.parambyname('solic_cuotas').asstring:=solic_cuotas.text;
    ZQuery2.parambyname('solic_estado').asstring:='PENDIENTE';
    ZQuery2.parambyname('solic_fecha').asstring:=formatdatetime('yyyy-mm-dd',solic_fecha.Date);
    ZQuery2.parambyname('solic_id').asstring:=id;
    ZQuery2.parambyname('solic_importecuota').asstring:=solic_importecuota.text;
    ZQuery2.parambyname('solic_total').asstring:=solic_total.text;
    ZQuery2.parambyname('vendedor_id').asstring:=vendedor_id.codigo;
    ZQuery2.parambyname('solic_vencuno').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date);
    ZQuery2.parambyname('solic_cuotatipo').AsInteger:=solic_cuotatipo.ItemIndex;
    ZQuery2.parambyname('solic_numero').asstring:=solic_numero.text;
    ZQuery2.parambyname('solic_numeroimpreso').asstring:=solic_numeroimpreso.text;
    ZQuery2.parambyname('solic_prestado').asstring:=solic_prestado.text;
    ZQuery2.parambyname('solic_total2').asstring:=solic_total.text;
    ZQuery2.ExecSQL;

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
          ZQuery2.parambyname('solic_id').asstring:=id;
          ZQuery2.parambyname('soliccuota_estado').asstring:='PENDIENTE';
          ZQuery2.parambyname('soliccuota_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',solic_vencuno.Date+(tipocuota*(i-1)));
          ZQuery2.parambyname('soliccuota_id').asstring:=Princ.codigo('solicitudcuotas','soliccuota_id');
          ZQuery2.parambyname('soliccuota_importecuota').asstring:=solic_importecuota.text;
          ZQuery2.parambyname('soliccuota_nrocuota').AsInteger:=i;
          ZQuery2.parambyname('soliccuota_pago').asstring:='0';
          ZQuery2.parambyname('soliccuota_saldo').asstring:=solic_importecuota.text;
          ZQuery2.ExecSQL;

      end;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;
end;



procedure Tsolicitudes.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Tsolicitudes.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar esta solicitud?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;


    end;
end;

procedure Tsolicitudes.cliente_idSelect(Sender: TObject);
begin
    cliente_dni.Text:=Princ.buscar('select cliente_dni from clientes where cliente_id="'+cliente_id.codigo+'"','cliente_dni');
end;

function Tsolicitudes.control:boolean;
var
  error:integer;
begin
    error:=0;


    if solic_numeroimpreso.Text='' then
      error:=1;


    case error of
        1:begin
              MessageDlg('Ingrese numero impreso.', mtError, [mbOK], 0);
              solic_numeroimpreso.SetFocus;

          end;

    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
