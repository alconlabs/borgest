unit UnitEntidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Mask;

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
    entidad_id: TDBAdvEdit;
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
    retieneIIBB: TGroupBox;
    entidad_retieneiibbsi: TRadioButton;
    entidad_retieneiibbno: TRadioButton;
    retencionAFIP: TGroupBox;
    multilateral: TGroupBox;
    exportador: TGroupBox;
    Label32: TLabel;
    entidad_minagri: TEdit;
    Label33: TLabel;
    entidad_diretransporte: TEdit;
    Label34: TLabel;
    entidad_regiacopiador: TEdit;
    Label35: TLabel;
    entidad_regibalanza: TEdit;
    regproductores: TGroupBox;
    carnet: TGroupBox;
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
    provincia_id: TSqlComboBox;
    localidad_id: TSqlComboBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet5: TTabSheet;
    DBGrid3: TDBGrid;
    ZQentidad: TZQuery;
    ZQuery1: TZQuery;
    btnagregar: TButton;
    btnmodificar: TButton;
    btnquitar: TButton;
    ZQEntidadContactos: TZQuery;
    DSCgrilla: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    entidad_nrodocumento_cuit: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQentidadAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure provincia_idExit(Sender: TObject);
    procedure entidad_tipodocumentoChange(Sender: TObject);
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

uses UnitPrinc, UnitEntidadContactos;

{$R *.dfm}

procedure TEntidades.btnagregarClick(Sender: TObject);
begin
   try
      EntidadContactos:= TEntidadContactos.Create(self);
    finally
      if EntidadContactos.ShowModal=mrOk then
        begin

//            princ.CargarDocumentoVentaDetalle(ZQDocumentocompradetalles, compradetalle.ZQDocumentocompradetalles);

        end;

    end;
end;

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

procedure TEntidades.btnquitarClick(Sender: TObject);
begin
  if (MessageDlg('Seguro desea quitar este registro?', mtWarning, [mbOK, mbCancel], 0) = mrOk) then
      begin
          try
            ZQEntidadContactos.Delete;
          finally
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
          entidad_id_nombre:=Princ.buscar('select entidad_id from entidades where entidad_razonsocial="'+entidad_razonsocial.Text+'"','entidad_id');
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
    id:=Princ.codigo('entidades','entidad_id');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into entidades (entidad_id,entidad_precodi, entidad_razonsocial, entidad_nombfantasia, ');
    ZQuery1.sql.add('entidad_calle, entidad_puerta, entidad_piso , entidad_depto, entidad_domiurbano, entidad_domirural, ');
    ZQuery1.sql.add('entidad_observaciones, provincia_id, localidad_id, entidad_tipodocumento, entidad_nrodocumento, ');
    ZQuery1.sql.add('entidad_iibb, entidad_inicioactividad, entidad_tipoiva, entidad_retieneiibb, entidad_agretencion, ');
    ZQuery1.sql.add('entidad_convmulti, entidad_exportador, entidad_minagri, entidad_diretransporte, entidad_regibalanza, ');
    ZQuery1.sql.add('entidad_regiacopiador, entidad_nrocarnetmanejo, entidad_vencecarnet, entidad_expedidocarnet, entidad_inscregproducto) ');
    ZQuery1.sql.add('values (:entidad_id, :entidad_precodi, :entidad_razonsocial, :entidad_nombfantasia,');
    ZQuery1.sql.add(':entidad_calle, :entidad_puerta, :entidad_piso , :entidad_depto, :entidad_domiurbano, :entidad_domirural, ');
    ZQuery1.sql.add(':entidad_observaciones, :provincia_id, :localidad_id, :entidad_tipodocumento, :entidad_nrodocumento, ');
    ZQuery1.sql.add(':entidad_iibb, :entidad_inicioactividad, :entidad_tipoiva, :entidad_retieneiibb, :entidad_agretencion, ');
    ZQuery1.sql.add(':entidad_convmulti, :entidad_exportador, :entidad_minagri, :entidad_diretransporte, :entidad_regibalanza, ');
    ZQuery1.sql.add(':entidad_regiacopiador, :entidad_nrocarnetmanejo, :entidad_vencecarnet, :entidad_expedidocarnet, :entidad_inscregproducto) ');

    ZQuery1.parambyname('entidad_id').asstring:=id;
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
    ZQuery1.parambyname('provincia_id').asstring:=provincia_id.codigo;
    ZQuery1.parambyname('localidad_id').asstring:=localidad_id.codigo;
    ZQuery1.parambyname('entidad_tipodocumento').asstring:=entidad_tipodocumento.Text;
    ZQuery1.parambyname('entidad_inicioactividad').asstring:=formatdatetime('yyyy-mm-dd',entidad_inicioactividad.Date);
    ZQuery1.parambyname('entidad_nrodocumento').asstring:=entidad_nrodocumento.Text;

    if entidad_tipodocumento.Text='CUIT' then
      ZQuery1.parambyname('entidad_nrodocumento').asstring:=entidad_nrodocumento_cuit.Text;

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
    close;
//    Self.OnShow(self);
end;

procedure TEntidades.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from entidades');
    ZQuery1.sql.add(' where entidad_id=:entidad_id');
    ZQuery1.parambyname('entidad_id').asstring:=entidad_id.Text;
    ZQuery1.ExecSQL;

    MessageDlg('La Entidad fue eliminada', mtInformation, [mbOK], 0);
    close;
end;



procedure TEntidades.entidad_tipodocumentoChange(Sender: TObject);
begin
    entidad_nrodocumento_cuit.Visible:=false;
    entidad_nrodocumento.Visible:=true;
    if entidad_tipodocumento.Text='CUIT' then
      begin
          entidad_nrodocumento_cuit.Visible:=true;
          entidad_nrodocumento.Visible:=false;
      end;
end;

procedure TEntidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   free;
end;

procedure TEntidades.FormCreate(Sender: TObject);
begin
    provincia_id.llenarcombo;
    localidad_id.llenarcombo;
    PageControl1.ActivePage:=TabSheet2;

end;

procedure TEntidades.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQentidad.Active:=false;
          ZQentidad.ParamByName('entidad_id').AsString:=id;
          ZQentidad.Active:=true;
      end
    else
      begin
          entidad_id.Text:=Princ.codigo('entidades','entidad_id');


      end;
end;

procedure TEntidades.modificar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update entidades set ');
    ZQuery1.sql.add('entidad_precodi=:entidad_precodi, ');
    ZQuery1.sql.add('entidad_razonsocial=:entidad_razonsocial, ');
    ZQuery1.sql.add('entidad_nombfantasia=:entidad_nombfantasia, ');
    ZQuery1.sql.add('entidad_calle=:entidad_calle, ');
    ZQuery1.sql.add('entidad_puerta=:entidad_puerta, ');
    ZQuery1.sql.add('entidad_piso=:entidad_piso, ');
    ZQuery1.sql.add('entidad_depto=:entidad_depto, ');
    ZQuery1.sql.add('entidad_domiurbano=:entidad_domiurbano, ');
    ZQuery1.sql.add('entidad_domirural=:entidad_domirural, ');
    ZQuery1.sql.add('entidad_observaciones=:entidad_observaciones, ');
    ZQuery1.sql.add('provincia_id=:provincia_id, ');
    ZQuery1.sql.add('localidad_id=:localidad_id, ');
    ZQuery1.sql.add('entidad_tipodocumento=:entidad_tipodocumento, ');
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
    ZQuery1.sql.add(' where entidad_id=:entidad_id');

    ZQuery1.parambyname('entidad_id').asstring:=id;
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
    ZQuery1.parambyname('provincia_id').asstring:=provincia_id.codigo;
    ZQuery1.parambyname('localidad_id').asstring:=localidad_id.codigo;
    ZQuery1.parambyname('entidad_tipodocumento').asstring:=entidad_tipodocumento.Text;
    ZQuery1.parambyname('entidad_inicioactividad').asstring:=formatdatetime('yyyy-mm-dd',entidad_inicioactividad.Date);
    ZQuery1.parambyname('entidad_nrodocumento').asstring:=entidad_nrodocumento.Text;

    if entidad_tipodocumento.Text='CUIT' then
      ZQuery1.parambyname('entidad_nrodocumento').asstring:=entidad_nrodocumento_cuit.Text;

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
    close;
end;


procedure TEntidades.provincia_idExit(Sender: TObject);
begin
    self.localidad_id.Confsql.Text:='select * from localidades where provincia_id='+provincia_id.codigo+' '+
                                      'order by localidad_nombre ';
    localidad_id.llenarcombo;
end;

procedure TEntidades.ZQentidadAfterOpen(DataSet: TDataSet);
begin
    entidad_id.Text:=id;

    entidad_precodi.Text:=ZQentidad.FieldByName('entidad_precodi').AsString;
    entidad_razonsocial.Text:=ZQentidad.FieldByName('entidad_razonsocial').AsString;
    entidad_nombfantasia.Text:=ZQentidad.FieldByName('entidad_nombfantasia').AsString;
    entidad_calle.Text:=ZQentidad.FieldByName('entidad_calle').AsString;
    entidad_puerta.Text:=ZQentidad.FieldByName('entidad_puerta').AsString;
    entidad_piso.Text:=ZQentidad.FieldByName('entidad_piso').AsString;
    entidad_depto.Text:=ZQentidad.FieldByName('entidad_depto').AsString;
       entidad_domiurbano.Checked:=true;
    if ZQentidad.fieldbyname('entidad_domirural').asstring='SI' then
       entidad_domirural.Checked:=true;
    entidad_observaciones.Text:=ZQentidad.FieldByName('entidad_observaciones').AsString;
    provincia_id.Buscar(ZQentidad.FieldByName('provincia_id').AsString);
    localidad_id.Buscar(ZQentidad.FieldByName('localidad_id').AsString);
    entidad_tipodocumento.Text:=ZQentidad.FieldByName('entidad_tipodocumento').AsString;
    entidad_inicioactividad.date:=ZQentidad.FieldByName('entidad_inicioactividad').AsDateTime;
    entidad_tipoiva.Text:=ZQentidad.FieldByName('entidad_tipoiva').AsString;
    entidad_nrodocumento.Text:=ZQentidad.FieldByName('entidad_nrodocumento').AsString;
    entidad_nrodocumento_cuit.Text:=ZQentidad.FieldByName('entidad_nrodocumento').AsString;
    entidad_tipodocumento.OnSelect(self);
    entidad_iibb.Text:=ZQentidad.FieldByName('entidad_iibb').AsString;

    if ZQentidad.FieldByName('entidad_retieneiibb').asstring='SI' then
     begin
       entidad_retieneiibbsi.Checked:=true;
       entidad_retieneiibbno.Checked:=false;
     end
    else
     begin
       entidad_retieneiibbsi.Checked:=false;
       entidad_retieneiibbno.Checked:=true;
     end;

    if ZQentidad.FieldByName('entidad_agretencion').asstring='SI' then
     begin
       entidad_agretencionsi.Checked:=true;
       entidad_agretencionno.Checked:=false;
     end
    else
     begin
       entidad_agretencionsi.Checked:=false;
       entidad_agretencionno.Checked:=true;
     end;

    if ZQentidad.FieldByName('entidad_convmulti').asstring='SI' then
     begin
       entidad_convmultisi.Checked:=true;
       entidad_convmultino.Checked:=false;
     end
    else
     begin
       entidad_convmultisi.Checked:=false;
       entidad_convmultino.Checked:=true;
     end;

    if ZQentidad.FieldByName('entidad_exportador').asstring='SI' then
     begin
       entidad_exportadorsi.Checked:=true;
       entidad_exportadorno.Checked:=false;
     end
    else
     begin
       entidad_exportadorsi.Checked:=false;
       entidad_exportadorno.Checked:=true;
     end;

    if ZQentidad.FieldByName('entidad_inscregproducto').asstring='SI' then
     begin
       entidad_inscregproductosi.Checked:=true;
       entidad_inscregproductono.Checked:=false;
     end
    else
     begin
       entidad_inscregproductosi.Checked:=false;
       entidad_inscregproductono.Checked:=true;
     end;

    entidad_minagri.Text:=ZQentidad.FieldByName('entidad_minagri').AsString;
    entidad_diretransporte.Text:=ZQentidad.FieldByName('entidad_diretransporte').AsString;
    entidad_regibalanza.Text:=ZQentidad.FieldByName('entidad_regibalanza').AsString;
    entidad_regiacopiador.Text:=ZQentidad.FieldByName('entidad_regiacopiador').AsString;
    entidad_nrocarnetmanejo.Text:=ZQentidad.FieldByName('entidad_nrocarnetmanejo').AsString;

    entidad_vencecarnet.date:=ZQentidad.FieldByName('entidad_vencecarnet').AsDateTime;
    entidad_expedidocarnet.Text:=ZQentidad.FieldByName('entidad_expedidocarnet').AsString;
end;

end.
