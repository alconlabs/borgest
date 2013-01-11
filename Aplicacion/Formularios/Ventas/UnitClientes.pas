unit UnitClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask,
  GTBComboBox;

type
  Tclientes = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    Label17: TLabel;
    cliente_domicilio: TEdit;
    Label19: TLabel;
    cliente_telefono: TEdit;
    Label21: TLabel;
    Label23: TLabel;
    cliente_mail: TEdit;
    condicioniva_id: TSqlComboBox;
    ZQclientes: TZQuery;
    ZQuery1: TZQuery;
    Label1: TLabel;
    cliente_nombre: TEdit;
    cliente_documentonro: TEdit;
    Label2: TLabel;
    cliente_celular: TEdit;
    Label3: TLabel;
    cliente_id: TEdit;
    Label4: TLabel;
    cliente_listaprecio: TComboBox;
    Label6: TLabel;
    localidad_id: TSqlComboBox;
    provincia_nombre: TLabel;
    cliente_cuit: TMaskEdit;
    cliente_documentotipo: TGTBComboBox;
    Label7: TLabel;
    cliente_observaciones: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    clientevehiculo_modelo: TEdit;
    Label10: TLabel;
    clientevehiculo_nrochasis: TEdit;
    Label11: TLabel;
    clientevehiculo_nromotor: TEdit;
    Label12: TLabel;
    clientevehiculo_observaciones: TMemo;
    clientevehiculo_fechaventa: TDateTimePicker;
    Label13: TLabel;
    clientevehiculo_marca: TEdit;
    ZQClienteVehiculo: TZQuery;
    Label5: TLabel;
    cliente_condicionventa: TComboBox;
    Label14: TLabel;
    personal_id: TSqlComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ZQclientesAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure localidad_idSelect(Sender: TObject);
    procedure cliente_documentotipoSelect(Sender: TObject);
    procedure condicioniva_idExit(Sender: TObject);
    procedure ZQClienteVehiculoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    CLIENTEVEHICULO:boolean;
    clientevehiculo_id:string;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure guardarclientevehiculo;
  public
    { Public declarations }
    id:string;
    abm:integer;
  end;

var
  clientes: Tclientes;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tclientes.guardarclientevehiculo;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Replace clientevehiculo set ');
    ZQuery1.sql.add('clientevehiculo_id=:clientevehiculo_id, ');
    ZQuery1.sql.add('clientevehiculo_fechaventa=:clientevehiculo_fechaventa, ');
    ZQuery1.sql.add('clientevehiculo_modelo=:clientevehiculo_modelo, ');
    ZQuery1.sql.add('clientevehiculo_nrochasis=:clientevehiculo_nrochasis, ');
    ZQuery1.sql.add('clientevehiculo_nromotor=:clientevehiculo_nromotor, ');
    ZQuery1.sql.add('clientevehiculo_observaciones=:clientevehiculo_observaciones, ');
    ZQuery1.sql.add('clientevehiculo_marca=:clientevehiculo_marca, ');
    ZQuery1.sql.add('cliente_id=:cliente_id');
    ZQuery1.parambyname('clientevehiculo_id').asstring:=clientevehiculo_id;
    ZQuery1.parambyname('clientevehiculo_fechaventa').asstring:=formatdatetime('yyyy-mm-dd',clientevehiculo_fechaventa.Date);
    ZQuery1.parambyname('clientevehiculo_modelo').asstring:=clientevehiculo_modelo.Text;
    ZQuery1.parambyname('clientevehiculo_nrochasis').asstring:=clientevehiculo_nrochasis.Text;
    ZQuery1.parambyname('clientevehiculo_nromotor').asstring:=clientevehiculo_nromotor.Text;
    ZQuery1.parambyname('clientevehiculo_observaciones').asstring:=clientevehiculo_observaciones.Text;
    ZQuery1.parambyname('clientevehiculo_marca').asstring:=clientevehiculo_marca.Text;
    ZQuery1.parambyname('cliente_id').asstring:=id;
    ZQuery1.ExecSQL;
end;

procedure Tclientes.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from clientes');
    ZQuery1.sql.add(' where cliente_id=:cliente_id');
    ZQuery1.parambyname('cliente_id').asstring:=cliente_id.text;
    ZQuery1.ExecSQL;

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from clientevehiculo');
    ZQuery1.sql.add(' where cliente_id=:cliente_id');
    ZQuery1.parambyname('cliente_id').asstring:=cliente_id.text;
    ZQuery1.ExecSQL;

    MessageDlg('El cliente fue eliminado', mtInformation, [mbOK], 0);
//    abm:=1;
//    Self.OnShow(self);

    close;


end;


procedure Tclientes.modificar;
begin

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update clientes set ');
    ZQuery1.sql.add('cliente_nombre=:cliente_nombre, ');
    ZQuery1.sql.add('cliente_domicilio=:cliente_domicilio, ');
    ZQuery1.sql.add('cliente_documentonro=:cliente_documentonro, ');
    ZQuery1.sql.add('cliente_documentotipo=:cliente_documentotipo, ');
    ZQuery1.sql.add('cliente_telefono=:cliente_telefono, ');
    ZQuery1.sql.add('cliente_celular=:cliente_celular, ');
    ZQuery1.sql.add('cliente_mail=:cliente_mail, ');
    ZQuery1.sql.add('condicioniva_id=:condicioniva_id, ');
    ZQuery1.sql.add('cliente_listaprecio=:cliente_listaprecio, ');
    ZQuery1.sql.add('cliente_condicionventa=:cliente_condicionventa, ');
    ZQuery1.sql.add('localidad_id=:localidad_id, ');
    ZQuery1.sql.add('cliente_observaciones=:cliente_observaciones ');
//    ZQuery1.sql.add('personal_id=:personal_id ');
    ZQuery1.sql.add(' where cliente_id=:cliente_id');

    ZQuery1.parambyname('cliente_id').asstring:=id;
    ZQuery1.parambyname('cliente_nombre').asstring:=cliente_nombre.Text;
    ZQuery1.parambyname('cliente_domicilio').asstring:=cliente_domicilio.Text;
    ZQuery1.parambyname('cliente_documentonro').asstring:=cliente_documentonro.Text;

    if cliente_documentotipo.Text='CUIT' then
      ZQuery1.parambyname('cliente_documentonro').asstring:=cliente_cuit.Text;

    ZQuery1.parambyname('cliente_documentotipo').asstring:=cliente_documentotipo.codigo;
    ZQuery1.parambyname('cliente_telefono').asstring:=cliente_telefono.Text;
    ZQuery1.parambyname('cliente_celular').asstring:=cliente_celular.Text;
    ZQuery1.parambyname('cliente_mail').asstring:=cliente_mail.Text;
    ZQuery1.parambyname('condicioniva_id').asstring:=condicioniva_id.codigo;
    ZQuery1.parambyname('cliente_listaprecio').AsInteger:=cliente_listaprecio.ItemIndex;
    ZQuery1.parambyname('cliente_condicionventa').AsInteger:=cliente_condicionventa.ItemIndex;
    ZQuery1.parambyname('localidad_id').asstring:=localidad_id.codigo;
    ZQuery1.parambyname('cliente_observaciones').asstring:=cliente_observaciones.Lines.Text;
//    ZQuery1.parambyname('personal_id').asstring:=personal_id.codigo;
    ZQuery1.ExecSQL;

    if CLIENTEVEHICULO then
      guardarclientevehiculo;


    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);


end;


procedure Tclientes.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tclientes.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este cliente?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                eliminar;


          end;
    end;
end;

procedure Tclientes.cliente_documentotipoSelect(Sender: TObject);
begin
    cliente_cuit.Visible:=false;
    cliente_documentonro.Visible:=true;
    if cliente_documentotipo.Text='CUIT' then
      begin
          cliente_cuit.Left:=106;
          cliente_cuit.Visible:=true;
          cliente_documentonro.Visible:=false;
      end;
end;

procedure Tclientes.condicioniva_idExit(Sender: TObject);
begin
    if condicioniva_id.codigo='2' then
      self.cliente_documentotipo.Buscar('CUIT');
    cliente_documentotipo.OnSelect(self); 
    
end;

function Tclientes.control:boolean;
var
  error:integer;
  cliente_id_dni:string;
  cliente_id_nombre:string;
begin
    error:=0;

    if abm=1 then
      begin
          cliente_id_nombre:=Princ.buscar('select cliente_id from clientes where cliente_nombre="'+cliente_nombre.Text+'"','cliente_id');
          if cliente_id_nombre<>'' then
            begin
                error:=3;
                if (MessageDlg('Ya existe un cliente con el mismo nombre.'+#13+#10+'Desea continuar?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                  error:=0;
            end;
      end;

    if (error=0) and (cliente_cuit.Visible) then
      begin
          if not Princ.EsCUITValido(princ.QuitarEspecialesNros(cliente_cuit.Text)) then
            error:=2;

      end;

    if (condicioniva_id.codigo='2') and (cliente_documentotipo.Text<>'CUIT') then
      error:=1;

    case error of
        1:begin
              MessageDlg('Si el cliente es Responsable Inscripto,'+#10#13+'el tipo de Documento deberia ser CUIT', mtError, [mbOK], 0);
//              cliente_documentotipo.SetFocus;

          end;

        2:begin
              MessageDlg('CUIT invalido, verifique el numero de CUIT', mtError, [mbOK], 0);
//              cliente_cuit.SetFocus;

          end;

    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;


procedure Tclientes.agregar;
begin
    id:=Princ.codigo('clientes','cliente_id');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into clientes (cliente_id, cliente_nombre, cliente_domicilio, ');
    ZQuery1.sql.add('cliente_documentonro, cliente_documentotipo, cliente_telefono, cliente_celular, ');
    ZQuery1.sql.add('cliente_mail, condicioniva_id, cliente_listaprecio, cliente_condicionventa, localidad_id, cliente_observaciones) ');
    ZQuery1.sql.add('values (:cliente_id, :cliente_nombre, :cliente_domicilio, ');
    ZQuery1.sql.add(':cliente_documentonro, :cliente_documentotipo, :cliente_telefono, :cliente_celular, ');
    ZQuery1.sql.add(':cliente_mail, :condicioniva_id, :cliente_listaprecio, :cliente_condicionventa, :localidad_id, :cliente_observaciones) ');

    ZQuery1.parambyname('cliente_id').asstring:=id;
    ZQuery1.parambyname('cliente_nombre').asstring:=cliente_nombre.Text;
    ZQuery1.parambyname('cliente_domicilio').asstring:=cliente_domicilio.Text;
    ZQuery1.parambyname('cliente_documentonro').asstring:=cliente_documentonro.Text;

    if cliente_documentotipo.Text='CUIT' then
      ZQuery1.parambyname('cliente_documentonro').asstring:=cliente_cuit.Text;

    ZQuery1.parambyname('cliente_documentotipo').asstring:=cliente_documentotipo.codigo;
    ZQuery1.parambyname('cliente_telefono').asstring:=cliente_telefono.Text;
    ZQuery1.parambyname('cliente_celular').asstring:=cliente_celular.Text;
    ZQuery1.parambyname('cliente_mail').asstring:=cliente_mail.Text;
    ZQuery1.parambyname('condicioniva_id').asstring:=condicioniva_id.codigo;
    ZQuery1.parambyname('cliente_listaprecio').AsInteger:=cliente_listaprecio.ItemIndex;
    ZQuery1.parambyname('cliente_condicionventa').AsInteger:=cliente_condicionventa.ItemIndex;
    ZQuery1.parambyname('localidad_id').asstring:=localidad_id.codigo;
    ZQuery1.parambyname('cliente_observaciones').asstring:=cliente_observaciones.Lines.Text;
//    ZQuery1.parambyname('personal_id').asstring:=personal_id.codigo;

    ZQuery1.ExecSQL;

    if CLIENTEVEHICULO then
      guardarclientevehiculo;


    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);
end;

procedure Tclientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tclientes.FormCreate(Sender: TObject);
begin
    condicioniva_id.llenarcombo;
    try
      condicioniva_id.ItemIndex:=0;
    except
    end;

    localidad_id.llenarcombo;

    cliente_listaprecio.Items.Clear;
    cliente_listaprecio.Items.Add(Princ.NOMBREPRECIO1);
    cliente_listaprecio.Items.Add(Princ.NOMBREPRECIO2);
    cliente_listaprecio.Items.Add(Princ.NOMBREPRECIO3);
    cliente_listaprecio.Items.Add(Princ.NOMBREPRECIO4);
    cliente_listaprecio.ItemIndex:=0;
    PageControl1.ActivePage:=TabSheet1;
    CLIENTEVEHICULO:=strtobool(Princ.GetConfiguracion('CLIENTEVEHICULO'));
    TabSheet2.TabVisible:=CLIENTEVEHICULO;
//    personal_id.llenarcombo;
//    personal_id.ItemIndex:=0;

end;

procedure Tclientes.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQclientes.Active:=false;
          ZQclientes.ParamByName('cliente_id').AsString:=id;
          ZQclientes.Active:=true;
          if CLIENTEVEHICULO then
            begin
                ZQClienteVehiculo.Active:=false;
                ZQClienteVehiculo.ParamByName('cliente_id').AsString:=id;
                ZQClienteVehiculo.Active:=true;

            end;
      end
    else
      begin
          cliente_id.Text:=Princ.codigo('clientes','cliente_id');
          cliente_nombre.Text:='';
          cliente_domicilio.Text:='';
          cliente_telefono.Text:='';
          cliente_mail.Text:='';
          cliente_documentotipo.ItemIndex:=0;
          cliente_documentonro.Text:='';
          cliente_celular.Text:='';
          condicioniva_id.ItemIndex:=1;
          cliente_listaprecio.ItemIndex:=0;
          cliente_condicionventa.ItemIndex:=0;
          localidad_id.ItemIndex:=0;

          if CLIENTEVEHICULO then
            begin
                clientevehiculo_id:=Princ.codigo('clientevehiculo','clientevehiculo_id');
                clientevehiculo_fechaventa.Date:=date;
                clientevehiculo_modelo.Text:='';
                clientevehiculo_nrochasis.Text:='';
                clientevehiculo_nromotor.Text:='';
                clientevehiculo_observaciones.Text:='';
                clientevehiculo_marca.Text:='';
            end;

      end;
end;

procedure Tclientes.localidad_idSelect(Sender: TObject);
begin
    provincia_nombre.Caption:=Princ.buscar('select provincia_nombre from provincias inner join localidades on provincias.provincia_id=localidades.provincia_id where localidad_id="'+localidad_id.codigo+'"','provincia_nombre');
end;

procedure Tclientes.ZQclientesAfterOpen(DataSet: TDataSet);
begin
    cliente_id.Text:=id;
    cliente_nombre.Text:=ZQclientes.FieldByName('cliente_nombre').AsString;
    cliente_domicilio.Text:=ZQclientes.FieldByName('cliente_domicilio').AsString;
    cliente_documentonro.Text:=ZQclientes.FieldByName('cliente_documentonro').AsString;
    cliente_cuit.Text:=ZQclientes.FieldByName('cliente_documentonro').AsString;
    cliente_documentotipo.Buscar(ZQclientes.FieldByName('cliente_documentotipo').AsString);
    cliente_documentotipo.OnSelect(self);
    cliente_telefono.Text:=ZQclientes.FieldByName('cliente_telefono').AsString;
    cliente_celular.Text:=ZQclientes.FieldByName('cliente_celular').AsString;
    condicioniva_id.Buscar(ZQclientes.FieldByName('condicioniva_id').AsString);
    cliente_mail.Text:=ZQclientes.FieldByName('cliente_mail').AsString;
    cliente_listaprecio.ItemIndex:=ZQclientes.FieldByName('cliente_listaprecio').AsInteger;
    cliente_condicionventa.ItemIndex:=ZQclientes.FieldByName('cliente_condicionventa').AsInteger;
    localidad_id.Buscar(ZQclientes.FieldByName('localidad_id').AsString);
    localidad_id.OnSelect(self);
    cliente_observaciones.Lines.Text:=ZQclientes.FieldByName('cliente_observaciones').AsString;
//    personal_id.Buscar(ZQclientes.FieldByName('personal_id').AsString);
end;

procedure Tclientes.ZQClienteVehiculoAfterOpen(DataSet: TDataSet);
begin
    clientevehiculo_id:=ZQClienteVehiculo.FieldByName('clientevehiculo_id').AsString;
    if clientevehiculo_id='' then
      begin
          clientevehiculo_fechaventa.Date:=date;
          clientevehiculo_id:=Princ.codigo('clientevehiculo','clientevehiculo_id');
      end
    else
      begin
          clientevehiculo_fechaventa.Date:=ZQClienteVehiculo.FieldByName('clientevehiculo_fechaventa').AsDateTime;
      end;

    clientevehiculo_modelo.Text:=ZQClienteVehiculo.FieldByName('clientevehiculo_modelo').AsString;
    clientevehiculo_nrochasis.Text:=ZQClienteVehiculo.FieldByName('clientevehiculo_nrochasis').AsString;
    clientevehiculo_nromotor.Text:=ZQClienteVehiculo.FieldByName('clientevehiculo_nromotor').AsString;
    clientevehiculo_observaciones.Text:=ZQClienteVehiculo.FieldByName('clientevehiculo_observaciones').AsString;
    clientevehiculo_marca.Text:=ZQClienteVehiculo.FieldByName('clientevehiculo_marca').AsString;
end;

end.
