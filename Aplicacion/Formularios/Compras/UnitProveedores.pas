unit UnitProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tproveedores = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    Label17: TLabel;
    proveedor_domicilio: TEdit;
    Label19: TLabel;
    proveedor_telefono: TEdit;
    Label21: TLabel;
    Label23: TLabel;
    proveedor_mail: TEdit;
    condicioniva_id: TSqlComboBox;
    ZQproveedores: TZQuery;
    ZQuery1: TZQuery;
    Label1: TLabel;
    proveedor_nombre: TEdit;
    proveedor_documentotipo: TComboBox;
    proveedor_documentonro: TEdit;
    Label2: TLabel;
    proveedor_celular: TEdit;
    Label3: TLabel;
    proveedor_id: TEdit;
    Label5: TLabel;
    proveedor_condicionventa: TComboBox;
    localidad_id: TSqlComboBox;
    provincia_nombre: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    proveedor_tipo: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ZQproveedoresAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure localidad_idSelect(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
    id:string;
    abm:integer;
  end;

var
  proveedores: Tproveedores;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tproveedores.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from proveedores');
    ZQuery1.sql.add(' where proveedor_id=:proveedor_id');
    ZQuery1.parambyname('proveedor_id').asstring:=proveedor_id.text;
    ZQuery1.ExecSQL;

    MessageDlg('El proveedor fue eliminado', mtInformation, [mbOK], 0);
//    abm:=1;
//    Self.OnShow(self);

    close;


end;


procedure Tproveedores.modificar;
begin

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update proveedores set ');
    ZQuery1.sql.add('proveedor_nombre=:proveedor_nombre, ');
    ZQuery1.sql.add('proveedor_domicilio=:proveedor_domicilio, ');
    ZQuery1.sql.add('proveedor_documentonro=:proveedor_documentonro, ');
    ZQuery1.sql.add('proveedor_documentotipo=:proveedor_documentotipo, ');
    ZQuery1.sql.add('proveedor_telefono=:proveedor_telefono, ');
    ZQuery1.sql.add('proveedor_celular=:proveedor_celular, ');
    ZQuery1.sql.add('proveedor_mail=:proveedor_mail, ');
    ZQuery1.sql.add('condicioniva_id=:condicioniva_id, ');
    ZQuery1.sql.add('proveedor_condicionventa=:proveedor_condicionventa, ');
    ZQuery1.sql.add('proveedor_tipo=:proveedor_tipo, ');
    ZQuery1.sql.add('localidad_id=:localidad_id ');
    ZQuery1.sql.add(' where proveedor_id=:proveedor_id');

    ZQuery1.parambyname('proveedor_id').asstring:=id;
    ZQuery1.parambyname('proveedor_nombre').asstring:=proveedor_nombre.Text;
    ZQuery1.parambyname('proveedor_domicilio').asstring:=proveedor_domicilio.Text;
    ZQuery1.parambyname('proveedor_documentonro').asstring:=proveedor_documentonro.Text;
    ZQuery1.parambyname('proveedor_documentotipo').asstring:=proveedor_documentotipo.Text;
    ZQuery1.parambyname('proveedor_telefono').asstring:=proveedor_telefono.Text;
    ZQuery1.parambyname('proveedor_celular').asstring:=proveedor_celular.Text;
    ZQuery1.parambyname('proveedor_mail').asstring:=proveedor_mail.Text;
    ZQuery1.parambyname('condicioniva_id').asstring:=condicioniva_id.codigo;
    ZQuery1.parambyname('proveedor_condicionventa').AsInteger:=proveedor_condicionventa.ItemIndex;
    ZQuery1.parambyname('proveedor_tipo').AsString:=proveedor_tipo.Text;
    ZQuery1.parambyname('localidad_id').AsString:=localidad_id.codigo;

    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);


end;


procedure Tproveedores.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tproveedores.btnguardarClick(Sender: TObject);
begin
    if control then
      begin
          case abm of
              1:begin
                    agregar;

                end;

              2:begin
                    modificar;

                end;

              3:begin
                    if (MessageDlg('Seguro desea eliminar este proveedor?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                      eliminar;


                end;
          end;




      end;
end;

function Tproveedores.control:boolean;
var
  error:integer;
  proveedor_id_dni:string;
begin
    error:=0;

//    if rubrocliente_id.Text='' then
//      error:=2;
//
//    if tipoiva_id.Text='' then
//      error:=3;
//
//    if cliente_domiciliocomerc.Text='' then
//      error:=7;
//
//    if cliente_ingresomensual.FloatValue=0 then
//      error:=6;
//
//    if cliente_domiciliopartcalle.Text='' then
//      error:=5;
//
//    if cliente_dni.Text='' then
//      error:=4;
//
//    if cliente_nombre.Text='' then
//      error:=1;
//
//
//
//    cliente_id_dni:=Princ.buscar('select cliente_id from clientes where cliente_dni="'+cliente_dni.Text+'"','cliente_id');
//    if abm=2then
//      cliente_id_dni:=Princ.buscar('select cliente_id from clientes where cliente_dni="'+cliente_dni.Text+'" and cliente_id<>"'+cliente_id.Text+'"','cliente_id');
//
//    if cliente_id_dni<>'' then
//      error:=9;
//
//
//
//
//
//    case error of
//        1:begin
//              MessageDlg('Ingrese el nombre', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet1;
//              cliente_nombre.SetFocus;
//
//          end;
//        2:begin
//              MessageDlg('Ingrese el rubro del cliente', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet2;
//              rubrocliente_id.SetFocus;
//
//          end;
//        3:begin
//              MessageDlg('Ingrese el tipo de IVA', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet2;
//              tipoiva_id.SetFocus;
//
//          end;
//        4:begin
//              MessageDlg('Ingrese el DNI', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet1;
//              cliente_dni.SetFocus;
//
//          end;
//        5:begin
//              MessageDlg('Ingrese el domicilio', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet1;
//              cliente_domiciliopartcalle.SetFocus;
//
//          end;
//        6:begin
//              MessageDlg('Ingrese el ingreso mensual', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet1;
//              cliente_ingresomensual.SetFocus;
//
//          end;
//        7:begin
//              MessageDlg('Ingrese el domicilio comercial', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet2;
//              cliente_domiciliocomerc.SetFocus;
//
//          end;
//        8:begin
//              MessageDlg('Ingrese el CUIT', mtError, [mbOK], 0);
//              PageControl1.ActivePage:=TabSheet2;
//              cliente_cuit.SetFocus;
//
//          end;
//
//        9:begin
//              if (MessageDlg('Existe otro cliente con el mismo DNI.'+#13+#10+'Desea continuar de todas formas?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
//                begin
//                    error:=0;
//
//                end
//              else
//                begin
//                    PageControl1.ActivePage:=TabSheet1;
//                    cliente_dni.SetFocus;
//
//                end;
//
//          end;
//
//    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;


procedure Tproveedores.agregar;
begin
    id:=Princ.codigo('proveedores','proveedor_id');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into proveedores (proveedor_id, proveedor_nombre, proveedor_domicilio, ');
    ZQuery1.sql.add('proveedor_documentonro, proveedor_documentotipo, proveedor_telefono, proveedor_celular, ');
    ZQuery1.sql.add('proveedor_mail, condicioniva_id, proveedor_condicionventa, proveedor_tipo, localidad_id) ');
    ZQuery1.sql.add('values (:proveedor_id, :proveedor_nombre, :proveedor_domicilio, ');
    ZQuery1.sql.add(':proveedor_documentonro, :proveedor_documentotipo, :proveedor_telefono, :proveedor_celular, ');
    ZQuery1.sql.add(':proveedor_mail, :condicioniva_id, :proveedor_condicionventa, :proveedor_tipo, :localidad_id) ');

    ZQuery1.parambyname('proveedor_id').asstring:=id;
    ZQuery1.parambyname('proveedor_nombre').asstring:=proveedor_nombre.Text;
    ZQuery1.parambyname('proveedor_domicilio').asstring:=proveedor_domicilio.Text;
    ZQuery1.parambyname('proveedor_documentonro').asstring:=proveedor_documentonro.Text;
    ZQuery1.parambyname('proveedor_documentotipo').asstring:=proveedor_documentotipo.Text;
    ZQuery1.parambyname('proveedor_telefono').asstring:=proveedor_telefono.Text;
    ZQuery1.parambyname('proveedor_celular').asstring:=proveedor_celular.Text;
    ZQuery1.parambyname('proveedor_mail').asstring:=proveedor_mail.Text;
    ZQuery1.parambyname('condicioniva_id').asstring:=condicioniva_id.codigo;
    ZQuery1.parambyname('proveedor_condicionventa').AsInteger:=proveedor_condicionventa.ItemIndex;
    ZQuery1.parambyname('proveedor_tipo').AsString:=proveedor_tipo.Text;
    ZQuery1.parambyname('localidad_id').AsString:=localidad_id.codigo;

    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);
end;

procedure Tproveedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tproveedores.FormCreate(Sender: TObject);
begin
    condicioniva_id.llenarcombo;
    try
      condicioniva_id.ItemIndex:=1;
    except
    end;

    localidad_id.llenarcombo;

end;

procedure Tproveedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tproveedores.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQproveedores.Active:=false;
          ZQproveedores.ParamByName('proveedor_id').AsString:=id;
          ZQproveedores.Active:=true;

      end
    else
      begin
          proveedor_id.Text:=Princ.codigo('proveedores','proveedor_id');
          proveedor_nombre.Text:='';
          proveedor_domicilio.Text:='';
          proveedor_telefono.Text:='';
          proveedor_mail.Text:='';
          proveedor_documentotipo.ItemIndex:=0;
          proveedor_documentonro.Text:='';
          proveedor_celular.Text:='';
          condicioniva_id.ItemIndex:=0;
          proveedor_condicionventa.ItemIndex:=0;

      end;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tproveedores.localidad_idSelect(Sender: TObject);
begin
    provincia_nombre.Caption:=Princ.buscar('select provincia_nombre from provincias inner join localidades on provincias.provincia_id=localidades.provincia_id where localidad_id="'+localidad_id.codigo+'"','provincia_nombre');
    
end;

procedure Tproveedores.ZQproveedoresAfterOpen(DataSet: TDataSet);
begin
    proveedor_id.Text:=id;
    proveedor_nombre.Text:=ZQproveedores.FieldByName('proveedor_nombre').AsString;
    proveedor_domicilio.Text:=ZQproveedores.FieldByName('proveedor_domicilio').AsString;
    proveedor_documentotipo.Text:=ZQproveedores.FieldByName('proveedor_documentotipo').AsString;
    proveedor_documentonro.Text:=ZQproveedores.FieldByName('proveedor_documentonro').AsString;
    proveedor_telefono.Text:=ZQproveedores.FieldByName('proveedor_telefono').AsString;
    proveedor_celular.Text:=ZQproveedores.FieldByName('proveedor_celular').AsString;
    condicioniva_id.Buscar(ZQproveedores.FieldByName('condicioniva_id').AsString);
    proveedor_mail.Text:=ZQproveedores.FieldByName('proveedor_mail').AsString;
    proveedor_condicionventa.ItemIndex:=ZQproveedores.FieldByName('proveedor_condicionventa').AsInteger;
    localidad_id.Buscar(ZQproveedores.FieldByName('localidad_id').AsString);
    localidad_id.OnSelect(self);
    proveedor_tipo.Text:=ZQproveedores.FieldByName('proveedor_tipo').AsString;

end;

end.
