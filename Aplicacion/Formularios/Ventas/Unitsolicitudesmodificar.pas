unit Unitsolicitudesmodificar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles;

type
  Tsolicitudesmodificar = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    solic_numero: TEdit;
    solic_fecha: TDateTimePicker;
    cliente_id: TSqlComboBox;
    vendedor_id: TSqlComboBox;
    solic_total: TDBAdvEdit;
    solic_cuotas: TDBAdvEdit;
    solic_importecuota: TDBAdvEdit;
    solic_cuotatipo: TComboBox;
    solic_vencuno: TDateTimePicker;
    solic_prestado: TDBAdvEdit;
    solic_interesganado: TDBAdvEdit;
    solic_montoganado: TDBAdvEdit;
    Label13: TLabel;
    solic_fechaprimervenc: TDateTimePicker;
    Label14: TLabel;
    solic_porcprimervenc: TDBAdvEdit;
    Label15: TLabel;
    solic_importeprimervenc: TDBAdvEdit;
    Label16: TLabel;
    solic_total2: TDBAdvEdit;
    solic_estadovencimiento: TCheckBox;
    btnaplicarintereses: TButton;
    Label17: TLabel;
    solic_diasatraso: TDBAdvEdit;
    ZQuery1: TZQuery;
    lbl_solic_fechadesdeprimervenc: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    solic_pagos: TDBAdvEdit;
    Label21: TLabel;
    solic_saldo: TDBAdvEdit;
    Label22: TLabel;
    solic_cuotas2: TDBAdvEdit;
    Label23: TLabel;
    solic_importecuota2: TDBAdvEdit;
    TabSheet3: TTabSheet;
    DataSource1: TDataSource;
    ZQSolicitudcuotas: TZQuery;
    tisolicitudcuotas: TTitles;
    DBGrid1: TDBGrid;
    btnactualizar: TButton;
    Label18: TLabel;
    soliccuota_interescuota: TDBAdvEdit;
    btnaplicarinteresexcuotas: TButton;
    procedure FormShow(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure solic_cuotasExit(Sender: TObject);
    procedure solic_importecuotaExit(Sender: TObject);
    procedure solic_prestadoExit(Sender: TObject);
    procedure solic_estadovencimientoClick(Sender: TObject);
    procedure solic_fechaprimervencExit(Sender: TObject);
    procedure solic_porcprimervencExit(Sender: TObject);
    procedure btnaplicarinteresesClick(Sender: TObject);
    procedure solic_cuotas2Exit(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure btnaplicarinteresexcuotasClick(Sender: TObject);
  private
    { Private declarations }
    tipocuota:integer;
    function control:boolean;
    procedure modificar;
    procedure calcularintereses;
  public
    { Public declarations }
    abm:integer;
    id:string;
    soliccuota_id, soliccuota_nrocuota:string;
    solic_fechadesdeprimervenc:tdate;
  end;

var
  solicitudesmodificar: Tsolicitudesmodificar;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}

procedure Tsolicitudesmodificar.calcularintereses;
var
  cantidad_dias:real;

begin
    solic_fechadesdeprimervenc:=strtodate(Princ.buscar('select min(soliccuota_fechavenc) as fecha from solicitudcuotas where solic_id="'+id+'" and soliccuota_estado="PENDIENTE"','fecha'));
    soliccuota_id:=Princ.buscar('select min(soliccuota_id) as id from solicitudcuotas where solic_id="'+id+'" and soliccuota_estado="PENDIENTE"','id');
    solic_diasatraso.FloatValue:=solic_fechaprimervenc.Date-solic_fechadesdeprimervenc;

    lbl_solic_fechadesdeprimervenc.Caption:=datetostr(solic_fechadesdeprimervenc);
    solic_importeprimervenc.FloatValue:=(solic_porcprimervenc.FloatValue*solic_diasatraso.FloatValue)*solic_total.FloatValue/100;
    solic_total2.FloatValue:=solic_total.FloatValue+solic_importeprimervenc.FloatValue;

    solic_pagos.Text:=Princ.buscar('select sum(soliccuota_pago) as solic_pagos from solicitudcuotas where solic_id="'+id+'"','solic_pagos');
    solic_saldo.FloatValue:=solic_total2.FloatValue-solic_pagos.FloatValue;
    solic_cuotas2.Text:=Princ.buscar('select count(soliccuota_id) as solic_cuotas2 from solicitudcuotas where solic_id="'+id+'"','solic_cuotas2');
    solic_importecuota2.FloatValue:=solic_saldo.FloatValue/solic_cuotas2.IntValue;


end;



procedure Tsolicitudesmodificar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tsolicitudesmodificar.FormCreate(Sender: TObject);
begin
    id:='';
    cliente_id.llenarcombo;
    cliente_id.ItemIndex:=-1;
    
    vendedor_id.llenarcombo;
    vendedor_id.ItemIndex:=-1;

end;

procedure Tsolicitudesmodificar.FormShow(Sender: TObject);
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

procedure Tsolicitudesmodificar.modificar;
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
    ZQuery2.sql.add('solic_prestado=:solic_prestado ');
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
    ZQuery2.parambyname('solic_prestado').asstring:=solic_prestado.text;
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


procedure Tsolicitudesmodificar.solic_cuotas2Exit(Sender: TObject);
begin
    solic_importecuota2.FloatValue:=solic_saldo.FloatValue/solic_cuotas2.IntValue;
end;

procedure Tsolicitudesmodificar.solic_cuotasExit(Sender: TObject);
begin
    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;
end;

procedure Tsolicitudesmodificar.solic_estadovencimientoClick(Sender: TObject);
begin
    lbl_solic_fechadesdeprimervenc.Enabled:=solic_estadovencimiento.Checked;
    solic_fechaprimervenc.Enabled:=solic_estadovencimiento.Checked;
//    solic_diasatraso.Enabled:=solic_estadovencimiento.Checked;
    solic_porcprimervenc.Enabled:=solic_estadovencimiento.Checked;
//    solic_importeprimervenc.Enabled:=solic_estadovencimiento.Checked;
//    solic_total2.Enabled:=solic_estadovencimiento.Checked;
    btnaplicarintereses.Enabled:=solic_estadovencimiento.Checked;
    try
    solic_fechaprimervenc.SetFocus;
    except
    end;
end;

procedure Tsolicitudesmodificar.solic_fechaprimervencExit(Sender: TObject);
begin
    calcularintereses;
end;

procedure Tsolicitudesmodificar.solic_importecuotaExit(Sender: TObject);
begin
    solic_total.FloatValue:=solic_cuotas.IntValue*solic_importecuota.FloatValue;
    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;



end;

procedure Tsolicitudesmodificar.solic_porcprimervencExit(Sender: TObject);
begin
    calcularintereses;
end;

procedure Tsolicitudesmodificar.solic_prestadoExit(Sender: TObject);
begin
    solic_montoganado.FloatValue:=solic_total.FloatValue-solic_prestado.FloatValue;
    solic_interesganado.FloatValue:=solic_montoganado.FloatValue*100/solic_prestado.FloatValue;

end;

procedure Tsolicitudesmodificar.ZQuery2AfterOpen(DataSet: TDataSet);
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

          if ZQuery2.FieldByName('solic_estadovencimiento').AsString='NORMAL' then
            begin
                solic_fechaprimervenc.Date:=princ.fechaservidor;
                solic_estadovencimiento.Checked:=false;
                lbl_solic_fechadesdeprimervenc.Caption:=Princ.buscar('select min(soliccuota_fechavenc) as fecha from solicitudcuotas where solic_id="'+id+'" and soliccuota_estado="PENDIENTE"','fecha');
                btnaplicarintereses.Visible:=true;
            end
          else
            begin
                solic_estadovencimiento.Checked:=true;
                solic_estadovencimiento.Visible:=false;

                solic_fechaprimervenc.Date:=ZQuery2.FieldByName('solic_fechaprimervenc').AsDateTime;
                solic_diasatraso.Text:=ZQuery2.FieldByName('solic_diasatraso').AsString;
                solic_porcprimervenc.Text:=ZQuery2.FieldByName('solic_porcprimervenc').AsString;
                solic_importeprimervenc.Text:=ZQuery2.FieldByName('solic_importeprimervenc').AsString;
                solic_total2.Text:=ZQuery2.FieldByName('solic_total2').AsString;

                btnaplicarintereses.Visible:=false;


            end;



      end;


end;

procedure Tsolicitudesmodificar.btnactualizarClick(Sender: TObject);
begin
    tisolicitudcuotas.Memo.Text:='select *, (('+solic_importecuota.Text+'*'+soliccuota_interescuota.Text+'/100)*(DATEDIFF(CURDATE(),soliccuota_fechavenc))) as soliccuota_interes, '+
                                 '(('+solic_importecuota.Text+'*'+soliccuota_interescuota.Text+'/100)*(DATEDIFF(CURDATE(),soliccuota_fechavenc)))+soliccuota_saldo as soliccuota_saldonuevo, '+
                                 '('+solic_importecuota.Text+'*'+soliccuota_interescuota.Text+'/100) as soliccuota_interesdiario, '+
                                 '(DATEDIFF(CURDATE(),soliccuota_fechavenc)) as soliccuota_diasatraso '+
                                 'from solicitudcuotas '+
                                 'where soliccuota_estado="PENDIENTE" and '+
                                 'soliccuota_fechavenc<CURDATE() and '+
                                 'solic_id="'+id+'" '+
                                 'order by soliccuota_nrocuota';



    ZQSolicitudcuotas.Active:=false;
    ZQSolicitudcuotas.SQL:=tisolicitudcuotas.Memo;
    ZQSolicitudcuotas.Active:=true;
end;

procedure Tsolicitudesmodificar.btnaplicarinteresesClick(Sender: TObject);
var
  i:integer;
  //soliccuota_id:string;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update solicitudes set ');
    ZQuery1.sql.add('solic_diasatraso=:solic_diasatraso, ');
    ZQuery1.sql.add('solic_estadovencimiento=:solic_estadovencimiento, ');
    ZQuery1.sql.add('solic_fechaprimervenc=:solic_fechaprimervenc, ');
    ZQuery1.sql.add('solic_importeprimervenc=:solic_importeprimervenc, ');
    ZQuery1.sql.add('solic_porcprimervenc=:solic_porcprimervenc, ');
    ZQuery1.sql.add('solic_total2=:solic_total2, ');
    ZQuery1.sql.add('solic_fechadesdeprimervenc=:solic_fechadesdeprimervenc ');
    ZQuery1.sql.add(' where solic_id=:solic_id');
    ZQuery1.parambyname('solic_diasatraso').asstring:=solic_diasatraso.text;
    ZQuery1.parambyname('solic_estadovencimiento').asstring:='APLICADO';
    ZQuery1.parambyname('solic_fechaprimervenc').asstring:=formatdatetime('yyyy-mm-dd',solic_fechaprimervenc.Date);
    ZQuery1.parambyname('solic_importeprimervenc').asstring:=solic_importeprimervenc.text;
    ZQuery1.parambyname('solic_porcprimervenc').asstring:=solic_porcprimervenc.text;
    ZQuery1.parambyname('solic_total2').asstring:=solic_total2.text;
    ZQuery1.parambyname('solic_fechadesdeprimervenc').asstring:=formatdatetime('yyyy-mm-dd',solic_fechadesdeprimervenc);
    ZQuery1.parambyname('solic_id').asstring:=id;
    ZQuery1.ExecSQL;


    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update solicitudcuotas set ');
    ZQuery1.sql.add('soliccuota_estado="PAGADA", ');
    ZQuery1.sql.add('soliccuota_importecuota=soliccuota_pago, ');
    ZQuery1.sql.add('soliccuota_saldo=0');
    ZQuery1.sql.add(' where soliccuota_id=:soliccuota_id');
    ZQuery1.parambyname('soliccuota_id').asstring:=soliccuota_id;
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from solicitudcuotas');
    ZQuery1.sql.add(' where solic_id=:solic_id and ');
    ZQuery1.sql.add('soliccuota_id>:soliccuota_id');
    ZQuery1.parambyname('solic_id').asstring:=id;
    ZQuery1.parambyname('soliccuota_id').asstring:=soliccuota_id;
    ZQuery1.ExecSQL;




    soliccuota_nrocuota:=Princ.buscar('select max(soliccuota_nrocuota) as cuota from solicitudcuotas where solic_id="'+id+'" ','cuota');


    for i := 1 to solic_cuotas2.IntValue do
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
          ZQuery2.parambyname('soliccuota_fechavenc').asstring:=formatdatetime('yyyy-mm-dd',solic_fechaprimervenc.Date+(tipocuota*(i-1)));
          ZQuery2.parambyname('soliccuota_id').asstring:=Princ.codigo('solicitudcuotas','soliccuota_id');
          ZQuery2.parambyname('soliccuota_importecuota').asstring:=solic_importecuota2.text;
          ZQuery2.parambyname('soliccuota_nrocuota').AsInteger:=i+strtoint(soliccuota_nrocuota);
          ZQuery2.parambyname('soliccuota_pago').asstring:='0';
          ZQuery2.parambyname('soliccuota_saldo').asstring:=solic_importecuota2.text;
          ZQuery2.ExecSQL;

      end;





    MessageDlg('Intereses aplicados.', mtInformation, [mbOK], 0);

end;

procedure Tsolicitudesmodificar.btnaplicarinteresexcuotasClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea aplicar los intereses a las cuotas vencidas?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          ZQSolicitudcuotas.First;
          while not ZQSolicitudcuotas.Eof do
              begin
                  ZQuery2.sql.clear;
                  ZQuery2.sql.add('update solicitudcuotas set ');
                  ZQuery2.sql.add('soliccuota_importecuota=:soliccuota_importecuota, ');
                  ZQuery2.sql.add('soliccuota_saldo=:soliccuota_saldo ');
                  ZQuery2.sql.add('where soliccuota_id=:soliccuota_id');
                  ZQuery2.parambyname('soliccuota_id').asstring:=ZQSolicitudcuotas.FieldByName('soliccuota_id').AsString;
                  ZQuery2.parambyname('soliccuota_importecuota').AsFloat:=ZQSolicitudcuotas.FieldByName('soliccuota_importecuota').AsFloat+ZQSolicitudcuotas.FieldByName('soliccuota_interes').AsFloat;
                  ZQuery2.parambyname('soliccuota_saldo').asstring:=ZQSolicitudcuotas.FieldByName('soliccuota_saldonuevo').AsString;




                  ZQSolicitudcuotas.Next;
              end;

          MessageDlg('Los importes de las cuotas fueron actualizados correctamente.', mtInformation, [mbOK], 0);
      end;

end;

procedure Tsolicitudesmodificar.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

function Tsolicitudesmodificar.control:boolean;
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
