unit UnitEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask;

type
  Tempresa = class(TForm)
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
    Label3: TLabel;
    cliente_id: TEdit;
    Label6: TLabel;
    localidad_id: TSqlComboBox;
    provincia_nombre: TLabel;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure ZQclientesAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure localidad_idSelect(Sender: TObject);
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
  empresa: Tempresa;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tempresa.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from clientes');
    ZQuery1.sql.add(' where cliente_id=:cliente_id');
    ZQuery1.parambyname('cliente_id').asstring:=cliente_id.text;
    ZQuery1.ExecSQL;

    MessageDlg('El cliente fue eliminado', mtInformation, [mbOK], 0);
//    abm:=1;
//    Self.OnShow(self);

    close;


end;


procedure Tempresa.modificar;
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
    ZQuery1.sql.add('localidad_id=:localidad_id ');
    ZQuery1.sql.add(' where cliente_id=:cliente_id');

    ZQuery1.parambyname('cliente_id').asstring:=id;
    ZQuery1.parambyname('cliente_nombre').asstring:=cliente_nombre.Text;
    ZQuery1.parambyname('cliente_domicilio').asstring:=cliente_domicilio.Text;
//    ZQuery1.parambyname('cliente_documentonro').asstring:=cliente_documentonro.Text;
//    ZQuery1.parambyname('cliente_documentotipo').asstring:=cliente_documentotipo.Text;
    ZQuery1.parambyname('cliente_telefono').asstring:=cliente_telefono.Text;
//    ZQuery1.parambyname('cliente_celular').asstring:=cliente_celular.Text;
    ZQuery1.parambyname('cliente_mail').asstring:=cliente_mail.Text;
    ZQuery1.parambyname('condicioniva_id').asstring:=condicioniva_id.codigo;
//    ZQuery1.parambyname('cliente_listaprecio').AsInteger:=cliente_listaprecio.ItemIndex;
//    ZQuery1.parambyname('cliente_condicionventa').AsInteger:=cliente_condicionventa.ItemIndex;
    ZQuery1.parambyname('localidad_id').asstring:=localidad_id.codigo;

    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);


end;


procedure Tempresa.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tempresa.btnguardarClick(Sender: TObject);
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
                    if (MessageDlg('Seguro desea eliminar este cliente?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                      eliminar;


                end;
          end;




      end;
end;

function Tempresa.control:boolean;
var
  error:integer;
  cliente_id_dni:string;
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


procedure Tempresa.agregar;
begin
    id:=Princ.codigo('clientes','cliente_id');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into clientes (cliente_id, cliente_nombre, cliente_domicilio, ');
    ZQuery1.sql.add('cliente_documentonro, cliente_documentotipo, cliente_telefono, cliente_celular, ');
    ZQuery1.sql.add('cliente_mail, condicioniva_id, cliente_listaprecio, cliente_condicionventa, localidad_id) ');
    ZQuery1.sql.add('values (:cliente_id, :cliente_nombre, :cliente_domicilio, ');
    ZQuery1.sql.add(':cliente_documentonro, :cliente_documentotipo, :cliente_telefono, :cliente_celular, ');
    ZQuery1.sql.add(':cliente_mail, :condicioniva_id, :cliente_listaprecio, :cliente_condicionventa, :localidad_id) ');

    ZQuery1.parambyname('cliente_id').asstring:=id;
    ZQuery1.parambyname('cliente_nombre').asstring:=cliente_nombre.Text;
    ZQuery1.parambyname('cliente_domicilio').asstring:=cliente_domicilio.Text;
//    ZQuery1.parambyname('cliente_documentonro').asstring:=cliente_documentonro.Text;
//    ZQuery1.parambyname('cliente_documentotipo').asstring:=cliente_documentotipo.Text;
    ZQuery1.parambyname('cliente_telefono').asstring:=cliente_telefono.Text;
//    ZQuery1.parambyname('cliente_celular').asstring:=cliente_celular.Text;
    ZQuery1.parambyname('cliente_mail').asstring:=cliente_mail.Text;
    ZQuery1.parambyname('condicioniva_id').asstring:=condicioniva_id.codigo;
//    ZQuery1.parambyname('cliente_listaprecio').AsInteger:=cliente_listaprecio.ItemIndex;
//    ZQuery1.parambyname('cliente_condicionventa').AsInteger:=cliente_condicionventa.ItemIndex;
    ZQuery1.parambyname('localidad_id').asstring:=localidad_id.codigo;

    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);
end;

procedure Tempresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tempresa.FormCreate(Sender: TObject);
begin
    condicioniva_id.llenarcombo;
    try
      condicioniva_id.ItemIndex:=1;
    except
    end;

    localidad_id.llenarcombo;

end;

procedure Tempresa.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQclientes.Active:=false;
          ZQclientes.ParamByName('cliente_id').AsString:=id;
          ZQclientes.Active:=true;

      end
    else
      begin
          cliente_id.Text:=Princ.codigo('clientes','cliente_id');
          cliente_nombre.Text:='';
          cliente_domicilio.Text:='';
          cliente_telefono.Text:='';
          cliente_mail.Text:='';
//          cliente_documentotipo.ItemIndex:=0;
//          cliente_documentonro.Text:='';
//          cliente_celular.Text:='';
          condicioniva_id.ItemIndex:=0;
//          cliente_listaprecio.ItemIndex:=0;
//          cliente_condicionventa.ItemIndex:=0;

      end;
end;

procedure Tempresa.localidad_idSelect(Sender: TObject);
begin
    provincia_nombre.Caption:=Princ.buscar('select provincia_nombre from provincias inner join localidades on provincias.provincia_id=localidades.provincia_id where localidad_id="'+localidad_id.codigo+'"','provincia_nombre');
end;

procedure Tempresa.ZQclientesAfterOpen(DataSet: TDataSet);
begin
    cliente_id.Text:=id;
    cliente_nombre.Text:=ZQclientes.FieldByName('cliente_nombre').AsString;
    cliente_domicilio.Text:=ZQclientes.FieldByName('cliente_domicilio').AsString;
//    cliente_documentotipo.Text:=ZQclientes.FieldByName('cliente_documentotipo').AsString;
//    cliente_documentonro.Text:=ZQclientes.FieldByName('cliente_documentonro').AsString;
    cliente_telefono.Text:=ZQclientes.FieldByName('cliente_telefono').AsString;
//    cliente_celular.Text:=ZQclientes.FieldByName('cliente_celular').AsString;
    condicioniva_id.Buscar(ZQclientes.FieldByName('condicioniva_id').AsString);
    cliente_mail.Text:=ZQclientes.FieldByName('cliente_mail').AsString;
//    cliente_listaprecio.ItemIndex:=ZQclientes.FieldByName('cliente_listaprecio').AsInteger;
//    cliente_condicionventa.ItemIndex:=ZQclientes.FieldByName('cliente_condicionventa').AsInteger;
    localidad_id.Buscar(ZQclientes.FieldByName('localidad_id').AsString);
    localidad_id.OnSelect(self);
end;

end.
