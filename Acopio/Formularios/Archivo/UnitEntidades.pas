unit UnitEntidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TEntidades = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    Label6: TLabel;
    entidad_calle: TEdit;
    entidad_razonsocial: TEdit;
    entidad_puerta: TDBAdvEdit;
    entidad_precodi: TDBAdvEdit;
    entidad_codi: TDBAdvEdit;
    entidad_nombfantasia: TEdit;
    Label21: TLabel;
    entidad_piso: TEdit;
    entidad_depto: TEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    localidad_codpostal: TEdit;
    Label24: TLabel;
    Panel1: TPanel;
    entidad_domiurbano: TRadioButton;
    Label25: TLabel;
    TabSheet1: TTabSheet;
    Label17: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    rubro_id: TSqlComboBox;
    calculoprecio_id: TSqlComboBox;
    producto_precioventabase: TDBAdvEdit;
    politicaprecio_id: TSqlComboBox;
    producto_neto1: TDBAdvEdit;
    producto_neto2: TDBAdvEdit;
    producto_neto3: TDBAdvEdit;
    producto_neto4: TDBAdvEdit;
    proveedor_id: TSqlComboBox;
    btncalculopreciodetaprod: TButton;
    Label2: TLabel;
    entidad_observaciones: TEdit;
    entidad_domirural: TRadioButton;
    Label7: TLabel;
    entidad_tipodocumento: TComboBox;
    entidad_tipoiva: TComboBox;
    Label28: TLabel;
    Label23: TLabel;
    entidad_nrodocumento: TEdit;
    Label29: TLabel;
    entidad_iibb: TEdit;
    entidad_inicioactividad: TDateTimePicker;
    Label31: TLabel;
    GroupBox1: TGroupBox;
    entidad_retieneiibbsi: TRadioButton;
    entidad_retieneiibbno: TRadioButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label32: TLabel;
    entidad_minagri: TEdit;
    Label33: TLabel;
    entidad_diretransporte: TEdit;
    Label34: TLabel;
    entidad_regiacopiador: TEdit;
    Label35: TLabel;
    entidad_regibalanza: TEdit;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label36: TLabel;
    entidad_nrocarnetmanejo: TEdit;
    Label37: TLabel;
    entidad_vencecarnet: TDateTimePicker;
    Label38: TLabel;
    Label39: TLabel;
    entidad_expedidocarnet: TEdit;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    btnguardar: TButton;
    btncancelar: TButton;
    TabSheet3: TTabSheet;
    Label42: TLabel;
    TabSheet4: TTabSheet;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    entidad_agretencionsi: TRadioButton;
    entidad_agretencionno: TRadioButton;
    Label49: TLabel;
    Label50: TLabel;
    entidad_convmultisi: TRadioButton;
    entidad_convmultino: TRadioButton;
    Label51: TLabel;
    Label52: TLabel;
    entidad_exportadorsi: TRadioButton;
    entidad_exportadorno: TRadioButton;
    Label53: TLabel;
    Label54: TLabel;
    entidad_inscregproductosi: TRadioButton;
    entidad_inscregproductono: TRadioButton;
    Label56: TLabel;
    provincia_codi: TSqlComboBox;
    localidad_codi: TSqlComboBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet5: TTabSheet;
    DBGrid3: TDBGrid;
    ZQClienteVehiculo: TZQuery;
    ZQentidad: TZQuery;
    ZQuery1: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQentidadAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;

  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  Entidades: TEntidades;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TEntidades.btncancelarClick(Sender: TObject);
begin
     if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure TEntidades.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar esta Entidad?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                eliminar;


          end;
    end;
end;

function TEntidades.control:boolean;
var
  error:integer;
  entidad_id_nombre:string;
  cliente_id_nombre:string;
begin
    error:=0;

    if abm=1 then
      begin
          entidad_id_nombre:=Princ.buscar('select entidad_codi from entidad where entidad_razonsocial="'+entidad_razonsocial.Text+'"','entidad_codi');
          if entidad_id_nombre<>'' then
            begin
                error:=3;
                if (MessageDlg('Ya existe una Entidad con el mismo nombre.'+#13+#10+'Desea continuar?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                  error:=0;
            end;
      end;

    if error=0 then
      result:=true
    else
      result:=false;
end;

procedure TEntidades.agregar;
begin
    id:=Princ.codigo('entidad','entidad_codi');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into entidad (entidad_codi,entidad_precodi, entidad_razonsocial, entidad_nombfantasia, ');
    ZQuery1.sql.add('entidad_calle, entidad_puerta, entidad_piso , entidad_depto, entidad_domiurbano, entidad_domirural, ');
    ZQuery1.sql.add('entidad_observaciones, provincia_codi, localidad_codi, entidad_tipodocumento, entidad_nrodocumento, ');
    ZQuery1.sql.add('entidad_iibb, entidad_inicioactividad, entidad_tipoiva, entidad_retieneiibb, entidad_agretencion, ');
    ZQuery1.sql.add('entidad_convmulti, entidad_exportador, entidad_minagri, entidad_diretransporte, entidad_regibalanza, ');
    ZQuery1.sql.add('entidad_regiacopiador, entidad_nrocarnetmanejo, entidad_vencecarnet, entidad_expedidocarnet, entidad_inscregproducto, ');
    ZQuery1.sql.add('entidad_convmulti, entidad_exportador, entidad_minagri, entidad_diretransporte, entidad_regibalanza ) ');
    ZQuery1.sql.add('values (:entidad_codi, :entidad_precodi, :entidad_razonsocial, :entidad_nombfantasia,');
    ZQuery1.sql.add(':entidad_calle, :entidad_puerta, :entidad_piso , :entidad_depto, :entidad_domiurbano, :entidad_domirural, ');
    ZQuery1.sql.add(':entidad_observaciones, :provincia_codi, :localidad_codi, :entidad_tipodocumento, :entidad_nrodocumento, ');
    ZQuery1.sql.add(':entidad_iibb, :entidad_inicioactividad, :entidad_tipoiva, :entidad_retieneiibb, :entidad_agretencion, ');
    ZQuery1.sql.add(':entidad_convmulti, :entidad_exportador, :entidad_minagri, :entidad_diretransporte, :entidad_regibalanza, ');
    ZQuery1.sql.add(':entidad_regiacopiador, :entidad_nrocarnetmanejo, :entidad_vencecarnet, :entidad_expedidocarnet, :entidad_inscregproducto, ');
    ZQuery1.sql.add(':entidad_convmulti, :entidad_exportador, :entidad_minagri, :entidad_diretransporte, :entidad_regibalanza) ');

    ZQuery1.parambyname('entidad_codi').asstring:=id;
    ZQuery1.parambyname('entidad_precodi').asstring:=entidad_precodi.Text;
    ZQuery1.parambyname('entidad_razonsocial').asstring:=entidad_razonsocial.Text;
    ZQuery1.parambyname('entidad_nombfantasia').asstring:=entidad_nombfantasia.Text;
    ZQuery1.parambyname('entidad_calle').asstring:=entidad_calle.Text;
    ZQuery1.parambyname('entidad_puerta').asstring:=entidad_puerta.Text;
    ZQuery1.parambyname('entidad_piso').asstring:=entidad_piso.Text;
    ZQuery1.parambyname('entidad_depto').asstring:=entidad_depto.Text;
    if entidad_domiurbano.Checked then
       ZQuery1.parambyname('entidad_domiurbano').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_domiurbano').asstring:='NO';

    if entidad_domirural.Checked then
       ZQuery1.parambyname('entidad_domirural').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_domirural').asstring:='NO';
    ZQuery1.parambyname('entidad_observaciones').asstring:=entidad_observaciones.Text;
    ZQuery1.parambyname('provincia_codi').asstring:=provincia_codi.codigo;
    ZQuery1.parambyname('localidad_codi').asstring:=localidad_codi.codigo;
    ZQuery1.parambyname('entidad_tipodocumento').asstring:=entidad_tipodocumento.Text;
    ZQuery1.parambyname('entidad_inicioactividad').asstring:=formatdatetime('yyyy-mm-dd',entidad_inicioactividad.Date);
    ZQuery1.parambyname('entidad_nrodocumento').asstring:=entidad_nrodocumento.Text;
    ZQuery1.parambyname('entidad_iibb').asstring:=entidad_iibb.Text;
    ZQuery1.parambyname('entidad_tipoiva').asstring:=entidad_tipoiva.Text;
    if entidad_retieneiibbsi.Checked then
       ZQuery1.parambyname('entidad_retieneiibb').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_retieneiibb').asstring:='NO';
    if entidad_agretencionsi.Checked then
       ZQuery1.parambyname('entidad_agretencion').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_agretencion').asstring:='NO';
    if entidad_convmultisi.Checked then
       ZQuery1.parambyname('entidad_convmulti').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_convmulti').asstring:='NO';

    if entidad_exportadorsi.Checked then
       ZQuery1.parambyname('entidad_exportador').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_exportador').asstring:='NO';

    if entidad_inscregproductosi.Checked then
       ZQuery1.parambyname('entidad_inscregproducto').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_inscregproducto').asstring:='NO';
    ZQuery1.parambyname('entidad_minagri').asstring:=entidad_minagri.Text;
    ZQuery1.parambyname('entidad_diretransporte').asstring:=entidad_diretransporte.Text;
    ZQuery1.parambyname('entidad_regibalanza').asstring:=entidad_regibalanza.Text;
    ZQuery1.parambyname('entidad_regiacopiador').asstring:=entidad_regiacopiador.Text;
    ZQuery1.parambyname('entidad_nrocarnetmanejo').asstring:=entidad_nrocarnetmanejo.Text;
    ZQuery1.parambyname('entidad_vencecarnet').asstring:=formatdatetime('yyyy-mm-dd',entidad_vencecarnet.Date);
    ZQuery1.parambyname('entidad_expedidocarnet').asstring:=entidad_expedidocarnet.Text;
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
//    Self.OnShow(self);
end;

procedure TEntidades.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from entidad');
    ZQuery1.sql.add(' where entidad_codi=:entidad_codi');
    ZQuery1.parambyname('entidad_codi').asstring:=entidad_codi.Text;
    ZQuery1.ExecSQL;

    MessageDlg('La Entidad fue eliminada', mtInformation, [mbOK], 0);
    close;
end;



procedure TEntidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   free;
end;

procedure TEntidades.FormCreate(Sender: TObject);
begin
//    provincia_codi.llenarcombo;
//    localidad_codi.llenarcombo;
    PageControl1.ActivePage:=TabSheet2;

end;

procedure TEntidades.modificar;
begin

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update entidad set ');
    ZQuery1.sql.add('entidad_precodi=:entidad_precodi, ');
    ZQuery1.sql.add('entidad_razonsocial=:entidad_razonsocial, ');
    ZQuery1.sql.add('entidad_nombfantasia=:entidad_nombfantasia, ');
    ZQuery1.sql.add('entidad_puerta=:entidad_puerta, ');
    ZQuery1.sql.add('entidad_piso=:entidad_piso, ');
    ZQuery1.sql.add('entidad_depto=:entidad_depto, ');
    ZQuery1.sql.add('entidad_domiurbano=:entidad_domiurbano, ');
    ZQuery1.sql.add('entidad_domirural=:entidad_domirural, ');
    ZQuery1.sql.add('entidad_observaciones=:entidad_observaciones, ');
    ZQuery1.sql.add('provincia_codi=:provincia_codi, ');
    ZQuery1.sql.add('localidad_codi=:localidad_codi, ');
    ZQuery1.sql.add('entidad_tipodocumento=:entidad_tipodocumento ');

    ZQuery1.sql.add('entidad_nrodocumento=:entidad_nrodocumento, ');
    ZQuery1.sql.add('entidad_iibb=:entidad_iibb, ');
    ZQuery1.sql.add('entidad_inicioactividad=:entidad_inicioactividad, ');
    ZQuery1.sql.add('entidad_tipoiva=:entidad_tipoiva, ');
    ZQuery1.sql.add('entidad_retieneiibb=:entidad_retieneiibb, ');
    ZQuery1.sql.add('entidad_agretencion=:entidad_agretencion, ');
    ZQuery1.sql.add('entidad_convmulti=:entidad_convmulti, ');
    ZQuery1.sql.add('entidad_exportador=:entidad_exportador, ');
    ZQuery1.sql.add('entidad_minagri=:entidad_minagri, ');
    ZQuery1.sql.add('entidad_diretransporte=:entidad_diretransporte, ');
    ZQuery1.sql.add('entidad_regibalanza=:entidad_regibalanza, ');
    ZQuery1.sql.add('entidad_regiacopiador=:entidad_regiacopiador, ');
    ZQuery1.sql.add('entidad_nrocarnetmanejo=:entidad_nrocarnetmanejo, ');
    ZQuery1.sql.add('entidad_vencecarnet=:entidad_vencecarnet, ');
    ZQuery1.sql.add('entidad_expedidocarnet=:entidad_expedidocarnet, ');
    ZQuery1.sql.add('entidad_inscregproducto=:entidad_inscregproducto ');
    ZQuery1.sql.add(' where entidad_codi=:entidad_codi');

    ZQuery1.parambyname('entidad_codi').asstring:=id;
    ZQuery1.parambyname('entidad_precodi').asstring:=entidad_precodi.Text;
    ZQuery1.parambyname('entidad_razonsocial').asstring:=entidad_razonsocial.Text;
    ZQuery1.parambyname('entidad_nombfantasia').asstring:=entidad_nombfantasia.Text;
    ZQuery1.parambyname('entidad_calle').asstring:=entidad_calle.Text;
    ZQuery1.parambyname('entidad_puerta').asstring:=entidad_puerta.Text;
    ZQuery1.parambyname('entidad_piso').asstring:=entidad_piso.Text;
    ZQuery1.parambyname('entidad_depto').asstring:=entidad_depto.Text;
    if entidad_domiurbano.Checked then
       ZQuery1.parambyname('entidad_domiurbano').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_domiurbano').asstring:='NO';

    if entidad_domirural.Checked then
       ZQuery1.parambyname('entidad_domirural').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_domirural').asstring:='NO';
    ZQuery1.parambyname('entidad_observaciones').asstring:=entidad_observaciones.Text;
    ZQuery1.parambyname('provincia_codi').asstring:=provincia_codi.codigo;
    ZQuery1.parambyname('localidad_codi').asstring:=localidad_codi.codigo;
    ZQuery1.parambyname('entidad_tipodocumento').asstring:=entidad_tipodocumento.Text;
    ZQuery1.parambyname('entidad_inicioactividad').asstring:=formatdatetime('yyyy-mm-dd',entidad_inicioactividad.Date);
    ZQuery1.parambyname('entidad_nrodocumento').asstring:=entidad_nrodocumento.Text;
    ZQuery1.parambyname('entidad_iibb').asstring:=entidad_iibb.Text;
    ZQuery1.parambyname('entidad_tipoiva').asstring:=entidad_tipoiva.Text;
    if entidad_retieneiibbsi.Checked then
       ZQuery1.parambyname('entidad_retieneiibb').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_retieneiibb').asstring:='NO';
    if entidad_agretencionsi.Checked then
       ZQuery1.parambyname('entidad_agretencion').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_agretencion').asstring:='NO';
    if entidad_convmultisi.Checked then
       ZQuery1.parambyname('entidad_convmulti').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_convmulti').asstring:='NO';

    if entidad_exportadorsi.Checked then
       ZQuery1.parambyname('entidad_exportador').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_exportador').asstring:='NO';

    if entidad_inscregproductosi.Checked then
       ZQuery1.parambyname('entidad_inscregproducto').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_inscregproducto').asstring:='NO';
    ZQuery1.parambyname('entidad_minagri').asstring:=entidad_minagri.Text;
    ZQuery1.parambyname('entidad_diretransporte').asstring:=entidad_diretransporte.Text;
    ZQuery1.parambyname('entidad_regibalanza').asstring:=entidad_regibalanza.Text;
    ZQuery1.parambyname('entidad_regiacopiador').asstring:=entidad_regiacopiador.Text;
    ZQuery1.parambyname('entidad_nrocarnetmanejo').asstring:=entidad_nrocarnetmanejo.Text;
    ZQuery1.parambyname('entidad_vencecarnet').asstring:=formatdatetime('yyyy-mm-dd',entidad_vencecarnet.Date);
    ZQuery1.parambyname('entidad_expedidocarnet').asstring:=entidad_expedidocarnet.Text;
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
//    Self.OnShow(self); }
end;


procedure TEntidades.ZQentidadAfterOpen(DataSet: TDataSet);
begin
    entidad_codi.Text:=id;

    entidad_precodi.Text:=ZQentidad.FieldByName('entidad_precodi').AsString;
    entidad_razonsocial.Text:=ZQentidad.FieldByName('entidad_razonsocial').AsString;
    entidad_nombfantasia.Text:=ZQentidad.FieldByName('entidad_nombfantasia').AsString;
    entidad_calle.Text:=ZQentidad.FieldByName('entidad_calle').AsString;
    entidad_puerta.Text:=ZQentidad.FieldByName('entidad_puerta').AsString;
    entidad_piso.Text:=ZQentidad.FieldByName('entidad_piso').AsString;
    entidad_depto.Text:=ZQentidad.FieldByName('entidad_depto').AsString;
    if ZQuery1.parambyname('entidad_domiurbano').asstring='SI' then
       entidad_domiurbano.Checked;
    if ZQuery1.parambyname('entidad_domirural').asstring='SI' then
       entidad_domirural.Checked;
    entidad_observaciones.Text:=ZQentidad.FieldByName('entidad_observaciones').AsString;
    provincia_codi.Buscar(ZQentidad.FieldByName('provincia_codi').AsString);
    localidad_codi.Buscar(ZQentidad.FieldByName('localidad_codi').AsString);
    entidad_tipodocumento.Text:=ZQentidad.FieldByName('entidad_tipodocumento').AsString;
    entidad_inicioactividad.date:=ZQentidad.FieldByName('entidad_inicioactividad').AsDateTime;
    entidad_tipoiva.Text:=ZQentidad.FieldByName('entidad_tipoiva').AsString;
    entidad_nrodocumento.Text:=ZQentidad.FieldByName('entidad_nrodocumento').AsString;
    entidad_iibb.Text:=ZQentidad.FieldByName('entidad_iibb').AsString;

    if ZQentidad.parambyname('entidad_retieneiibb').asstring='SI' then
    begin
       entidad_retieneiibbsi.Checked:=true;

    end;
    





    if entidad_retieneiibbsi.Checked then
       ZQuery1.parambyname('entidad_retieneiibb').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_retieneiibb').asstring:='NO';
    if entidad_agretencionsi.Checked then
       ZQuery1.parambyname('entidad_agretencion').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_agretencion').asstring:='NO';
    if entidad_convmultisi.Checked then
       ZQuery1.parambyname('entidad_convmulti').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_convmulti').asstring:='NO';

    if entidad_exportadorsi.Checked then
       ZQuery1.parambyname('entidad_exportador').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_exportador').asstring:='NO';

    if entidad_inscregproductosi.Checked then
       ZQuery1.parambyname('entidad_inscregproducto').asstring:='SI'
    else
       ZQuery1.parambyname('entidad_inscregproducto').asstring:='NO';
    ZQuery1.parambyname('entidad_minagri').asstring:=entidad_minagri.Text;
    ZQuery1.parambyname('entidad_diretransporte').asstring:=entidad_diretransporte.Text;
    ZQuery1.parambyname('entidad_regibalanza').asstring:=entidad_regibalanza.Text;
    ZQuery1.parambyname('entidad_regiacopiador').asstring:=entidad_regiacopiador.Text;
    ZQuery1.parambyname('entidad_nrocarnetmanejo').asstring:=entidad_nrocarnetmanejo.Text;
    ZQuery1.parambyname('entidad_vencecarnet').asstring:=formatdatetime('yyyy-mm-dd',entidad_vencecarnet.Date);
    ZQuery1.parambyname('entidad_expedidocarnet').asstring:=entidad_expedidocarnet.Text;



//    cliente_nombre.Text:=ZQclientes.FieldByName('cliente_nombre').AsString;
//    cliente_domicilio.Text:=ZQclientes.FieldByName('cliente_domicilio').AsString;
//    cliente_documentonro.Text:=ZQclientes.FieldByName('cliente_documentonro').AsString;
//    cliente_cuit.Text:=ZQclientes.FieldByName('cliente_documentonro').AsString;
//    cliente_documentotipo.Buscar(ZQclientes.FieldByName('cliente_documentotipo').AsString);
//    cliente_documentotipo.OnSelect(self);
//    cliente_telefono.Text:=ZQclientes.FieldByName('cliente_telefono').AsString;
//    cliente_celular.Text:=ZQclientes.FieldByName('cliente_celular').AsString;
//    condicioniva_id.Buscar(ZQclientes.FieldByName('condicioniva_id').AsString);
//    cliente_mail.Text:=ZQclientes.FieldByName('cliente_mail').AsString;
//    cliente_listaprecio.ItemIndex:=ZQclientes.FieldByName('cliente_listaprecio').AsInteger;
//    cliente_condicionventa.ItemIndex:=ZQclientes.FieldByName('cliente_condicionventa').AsInteger;
//    localidad_id.Buscar(ZQclientes.FieldByName('localidad_id').AsString);
//    localidad_id.OnSelect(self);
//    cliente_observaciones.Lines.Text:=ZQclientes.FieldByName('cliente_observaciones').AsString;
//    personal_id.Buscar(ZQclientes.FieldByName('personal_id').AsString);
end;

end.
