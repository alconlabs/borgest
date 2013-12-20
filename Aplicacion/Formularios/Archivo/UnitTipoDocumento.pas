unit UnitTipoDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, GTBComboBox, UnitSqlComboBox, Mask, AdvEdit,
  DBAdvEd, MoneyEdit;

type
  Ttipodocumento = class(TABMbase)
    Label3: TLabel;
    tipodocu_id: TEdit;
    Label1: TLabel;
    tipodocu_nombre: TEdit;
    Label6: TLabel;
    puntoventa_id: TSqlComboBox;
    Label4: TLabel;
    tipodocu_tipo: TGTBComboBox;
    Label5: TLabel;
    tipodocu_letra: TEdit;
    tipodocu_caja: TCheckBox;
    Label7: TLabel;
    tipodocu_stock: TGTBComboBox;
    tipodocu_iva: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    tipodocu_debcred: TGTBComboBox;
    Labeltipodocufiscal_id: TLabel;
    tipodocufiscal_id: TSqlComboBox;
    tipodocu_ultimonumero: TMoneyEdit;
    tipodocu_fiscal: TRadioButton;
    tipodocu_preimpresos: TRadioButton;
    GroupBoxImpresion: TGroupBox;
    Label17: TLabel;
    Label11: TLabel;
    tipodocu_impresora: TEdit;
    tipodocu_copias: TMoneyEdit;
    tipodocu_preview: TCheckBox;
    tipodocu_prompt: TCheckBox;
    Label2: TLabel;
    tipodocu_archivoimpresion: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    tipodocu_leyenda: TMemo;
    Label14: TLabel;
    Combo_tipodocu_nombre: TGTBComboBox;
    tipodocu_manual: TCheckBox;
    Label15: TLabel;
    tipodocu_nombreabrev: TEdit;
    Label16: TLabel;
    tipodocu_importemax: TMoneyEdit;
    procedure tipodocu_fiscalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
    procedure Combo_tipodocu_nombreChange(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  tipodocumento: Ttipodocumento;

implementation

Uses Unitprinc;

{$R *.dfm}

procedure Ttipodocumento.agregar;
begin
    id:=princ.codigo('tiposdocumento','tipodocu_id');
    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Insert into tiposdocumento (tipodocu_id, tipodocu_nombre, tipodocu_tipo, tipodocu_caja, ');
    ZQExecSQL.sql.add('tipodocu_stock, tipodocu_iva, tipodocu_fiscal, tipodocu_ultimonumero, ');
    ZQExecSQL.sql.add('puntoventa_id, tipodocu_letra, tipodocu_debcred, tipodocufiscal_id, ');
    ZQExecSQL.sql.add('tipodocu_preimpresos, tipodocu_impresora, tipodocu_copias, tipodocu_preview, ');
    ZQExecSQL.sql.add('tipodocu_prompt, tipodocu_ctacte, tipodocu_archivoimpresion, tipodocu_leyenda, tipodocu_manual, tipodocu_nombreabrev, tipodocu_importemax) ');
    ZQExecSQL.sql.add('values (:tipodocu_id, :tipodocu_nombre, :tipodocu_tipo, :tipodocu_caja, ');
    ZQExecSQL.sql.add(':tipodocu_stock, :tipodocu_iva, :tipodocu_fiscal, :tipodocu_ultimonumero, ');
    ZQExecSQL.sql.add(':puntoventa_id, :tipodocu_letra, :tipodocu_debcred, :tipodocufiscal_id, ');
    ZQExecSQL.sql.add(':tipodocu_preimpresos, :tipodocu_impresora, :tipodocu_copias, :tipodocu_preview, ');
    ZQExecSQL.sql.add(':tipodocu_prompt, :tipodocu_ctacte, :tipodocu_archivoimpresion, :tipodocu_leyenda, :tipodocu_manual, :tipodocu_nombreabrev, :tipodocu_importemax) ');
    ZQExecSQL.parambyname('tipodocu_id').asstring:=id;
    ZQExecSQL.parambyname('tipodocu_nombre').asstring:=tipodocu_nombre.Text;
    ZQExecSQL.parambyname('tipodocu_tipo').asstring:=tipodocu_tipo.codigo;
    ZQExecSQL.parambyname('tipodocu_caja').asstring:=booltostr(tipodocu_caja.Checked);
    ZQExecSQL.parambyname('tipodocu_stock').asstring:=tipodocu_stock.codigo;
    ZQExecSQL.parambyname('tipodocu_iva').asstring:=BoolToStr(tipodocu_iva.Checked);
    ZQExecSQL.parambyname('tipodocu_fiscal').asstring:=booltostr(tipodocu_fiscal.Checked);
    ZQExecSQL.parambyname('tipodocu_ultimonumero').asstring:=tipodocu_ultimonumero.Text;
    ZQExecSQL.parambyname('puntoventa_id').asstring:=puntoventa_id.codigo;
    ZQExecSQL.parambyname('tipodocu_letra').asstring:=tipodocu_letra.Text;
    ZQExecSQL.parambyname('tipodocu_debcred').asstring:=tipodocu_debcred.codigo;
    ZQExecSQL.parambyname('tipodocufiscal_id').asstring:=tipodocufiscal_id.codigo;
    ZQExecSQL.parambyname('tipodocu_preimpresos').asstring:=booltostr(tipodocu_preimpresos.Checked);
    ZQExecSQL.parambyname('tipodocu_impresora').asstring:=tipodocu_impresora.Text;
    ZQExecSQL.parambyname('tipodocu_copias').asstring:=tipodocu_copias.Text;
    ZQExecSQL.parambyname('tipodocu_preview').asstring:=booltostr(tipodocu_preview.Checked);
    ZQExecSQL.parambyname('tipodocu_prompt').asstring:=booltostr(tipodocu_prompt.Checked);
    ZQExecSQL.parambyname('tipodocu_ctacte').asstring:='0';
    ZQExecSQL.parambyname('tipodocu_archivoimpresion').asstring:=tipodocu_archivoimpresion.Text;
    ZQExecSQL.parambyname('tipodocu_leyenda').asstring:=tipodocu_leyenda.Text;
    ZQExecSQL.parambyname('tipodocu_manual').asstring:=booltostr(tipodocu_manual.Checked);
    ZQExecSQL.parambyname('tipodocu_nombreabrev').asstring:=tipodocu_nombreabrev.Text;
    ZQExecSQL.parambyname('tipodocu_importemax').asstring:=tipodocu_importemax.Text;
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

end;

procedure Ttipodocumento.modificar;
begin
    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('update tiposdocumento set ');
    ZQExecSQL.sql.add('tipodocu_nombre=:tipodocu_nombre, ');
    ZQExecSQL.sql.add('tipodocu_tipo=:tipodocu_tipo, ');
    ZQExecSQL.sql.add('tipodocu_caja=:tipodocu_caja, ');
    ZQExecSQL.sql.add('tipodocu_stock=:tipodocu_stock, ');
    ZQExecSQL.sql.add('tipodocu_iva=:tipodocu_iva, ');
    ZQExecSQL.sql.add('tipodocu_fiscal=:tipodocu_fiscal, ');
    ZQExecSQL.sql.add('tipodocu_ultimonumero=:tipodocu_ultimonumero, ');
    ZQExecSQL.sql.add('puntoventa_id=:puntoventa_id, ');
    ZQExecSQL.sql.add('tipodocu_letra=:tipodocu_letra, ');
    ZQExecSQL.sql.add('tipodocu_debcred=:tipodocu_debcred, ');
    ZQExecSQL.sql.add('tipodocufiscal_id=:tipodocufiscal_id, ');
    ZQExecSQL.sql.add('tipodocu_preimpresos=:tipodocu_preimpresos, ');
    ZQExecSQL.sql.add('tipodocu_impresora=:tipodocu_impresora, ');
    ZQExecSQL.sql.add('tipodocu_copias=:tipodocu_copias, ');
    ZQExecSQL.sql.add('tipodocu_preview=:tipodocu_preview, ');
    ZQExecSQL.sql.add('tipodocu_prompt=:tipodocu_prompt, ');
    ZQExecSQL.sql.add('tipodocu_ctacte=:tipodocu_ctacte, ');
    ZQExecSQL.sql.add('tipodocu_archivoimpresion=:tipodocu_archivoimpresion, ');
    ZQExecSQL.sql.add('tipodocu_leyenda=:tipodocu_leyenda, ');
    ZQExecSQL.sql.add('tipodocu_manual=:tipodocu_manual, ');
    ZQExecSQL.sql.add('tipodocu_nombreabrev=:tipodocu_nombreabrev, ');
    ZQExecSQL.sql.add('tipodocu_importemax=:tipodocu_importemax ');
    ZQExecSQL.sql.add('where tipodocu_id=:tipodocu_id');
    ZQExecSQL.parambyname('tipodocu_id').asstring:=id;
    ZQExecSQL.parambyname('tipodocu_nombre').asstring:=tipodocu_nombre.Text;
    ZQExecSQL.parambyname('tipodocu_tipo').asstring:=tipodocu_tipo.codigo;
    ZQExecSQL.parambyname('tipodocu_caja').asstring:=booltostr(tipodocu_caja.Checked);
    ZQExecSQL.parambyname('tipodocu_stock').asstring:=tipodocu_stock.codigo;
    ZQExecSQL.parambyname('tipodocu_iva').asstring:=BoolToStr(tipodocu_iva.Checked);
    ZQExecSQL.parambyname('tipodocu_fiscal').asstring:=booltostr(tipodocu_fiscal.Checked);
    ZQExecSQL.parambyname('tipodocu_ultimonumero').asstring:=tipodocu_ultimonumero.Text;
    ZQExecSQL.parambyname('puntoventa_id').asstring:=puntoventa_id.codigo;
    ZQExecSQL.parambyname('tipodocu_letra').asstring:=tipodocu_letra.Text;
    ZQExecSQL.parambyname('tipodocu_debcred').asstring:=tipodocu_debcred.codigo;
    ZQExecSQL.parambyname('tipodocufiscal_id').asstring:=tipodocufiscal_id.codigo;
    ZQExecSQL.parambyname('tipodocu_preimpresos').asstring:=booltostr(tipodocu_preimpresos.Checked);
    ZQExecSQL.parambyname('tipodocu_impresora').asstring:=tipodocu_impresora.Text;
    ZQExecSQL.parambyname('tipodocu_copias').asstring:=tipodocu_copias.Text;
    ZQExecSQL.parambyname('tipodocu_preview').asstring:=booltostr(tipodocu_preview.Checked);
    ZQExecSQL.parambyname('tipodocu_prompt').asstring:=booltostr(tipodocu_prompt.Checked);
    ZQExecSQL.parambyname('tipodocu_ctacte').asstring:='0';
    ZQExecSQL.parambyname('tipodocu_archivoimpresion').asstring:=tipodocu_archivoimpresion.Text;
    ZQExecSQL.parambyname('tipodocu_leyenda').asstring:=tipodocu_leyenda.Text;
    ZQExecSQL.parambyname('tipodocu_manual').asstring:=booltostr(tipodocu_manual.Checked);
    ZQExecSQL.parambyname('tipodocu_nombreabrev').asstring:=tipodocu_nombreabrev.Text;
    ZQExecSQL.parambyname('tipodocu_importemax').asstring:=tipodocu_importemax.Text;
    ZQExecSQL.ExecSQL;


    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;
end;

procedure Ttipodocumento.eliminar;
begin
    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('delete from tiposdocumento ');
    ZQExecSQL.sql.add('where tipodocu_id=:tipodocu_id');
    ZQExecSQL.parambyname('tipodocu_id').asstring:=id;
    ZQExecSQL.ExecSQL;
    
    MessageDlg('Datos eliminados.', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Ttipodocumento.btnguardarClick(Sender: TObject);
begin
  inherited;
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
              if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

    end;
end;

procedure Ttipodocumento.Combo_tipodocu_nombreChange(Sender: TObject);
begin
  inherited;
    tipodocu_nombre.Visible:=false;
    tipodocu_nombre.Text:=Combo_tipodocu_nombre.Text;
    if Combo_tipodocu_nombre.Text='Otro' then
      begin
          tipodocu_nombre.Text:='';
          tipodocu_nombre.Visible:=true;


      end;


end;

function Ttipodocumento.control:boolean;
var
  error:integer;
begin
    error:=0;


    result:=error=0;
end;


procedure Ttipodocumento.FormCreate(Sender: TObject);
begin
  inherited;
    puntoventa_id.Confsql.Text:='select * from puntodeventa where 1=1 '+Princ.empresa_where+' order by puntoventa_numero ';

    puntoventa_id.llenarcombo;
    puntoventa_id.ItemIndex:=0;

    tipodocufiscal_id.llenarcombo;
    tipodocufiscal_id.ItemIndex:=0;
end;

procedure Ttipodocumento.FormShow(Sender: TObject);
begin
  inherited;
    if abm=1 then
      begin
          tipodocu_id.Text:='';
          Combo_tipodocu_nombre.OnChange(self);
//          puntoventa_id.Buscar(ZQSelect.FieldByName('puntoventa_id').AsString);
//          tipodocu_tipo.Buscar(ZQSelect.FieldByName('tipodocu_tipo').AsString);
//          tipodocu_letra.Text:='';
//          tipodocu_stock.Buscar(ZQSelect.FieldByName('tipodocu_stock').AsString);
//          tipodocu_ultimonumero.Text:=ZQSelect.FieldByName('tipodocu_ultimonumero').AsString;
//          tipodocu_debcred.Buscar(ZQSelect.FieldByName('tipodocu_debcred').AsString);
//          tipodocu_caja.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_caja').AsString);
//          tipodocu_iva.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_iva').AsString);
//          tipodocu_fiscal.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_fiscal').AsString);
//          tipodocu_preimpresos.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_preimpresos').AsString);
//          tipodocu_manual.Checked:=not tipodocu_fiscal.Checked and not tipodocu_preimpresos.Checked;
//          tipodocu_manual.OnClick(self);
//          tipodocufiscal_id.Buscar(ZQSelect.FieldByName('tipodocufiscal_id').AsString);
//          tipodocu_impresora.Text:=ZQSelect.FieldByName('tipodocu_impresora').AsString;
//          tipodocu_copias.Text:=ZQSelect.FieldByName('tipodocu_copias').AsString;
//          tipodocu_preview.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_preview').AsString);
//          tipodocu_prompt.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_prompt').AsString);
//          tipodocu_archivoimpresion.Text:=ZQSelect.FieldByName('tipodocu_archivoimpresion').AsString;

      end
    else
      begin
          ZQSelect.Active:=false;
          ZQSelect.ParamByName('tipodocu_id').AsString:=id;
          ZQSelect.Active:=true;
      end;

end;

procedure Ttipodocumento.tipodocu_fiscalClick(Sender: TObject);
begin
  inherited;
    tipodocufiscal_id.Visible:= not tipodocu_preimpresos.Checked;
    Labeltipodocufiscal_id.Visible:=not tipodocu_preimpresos.Checked;
    GroupBoxImpresion.Visible:=not tipodocu_preimpresos.Checked;

    tipodocufiscal_id.Visible:=tipodocu_fiscal.Checked;
    Labeltipodocufiscal_id.Visible:=tipodocu_fiscal.Checked;
    GroupBoxImpresion.Visible:=tipodocu_preimpresos.Checked;


end;

procedure Ttipodocumento.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    tipodocu_id.Text:=id;
    Combo_tipodocu_nombre.Buscar(ZQSelect.FieldByName('tipodocu_nombre').AsString);
    Combo_tipodocu_nombre.OnChange(self);
    if Combo_tipodocu_nombre.ItemIndex=-1 then
      begin
          Combo_tipodocu_nombre.Buscar('Otro');
          Combo_tipodocu_nombre.OnChange(self);
          tipodocu_nombre.Text:=ZQSelect.FieldByName('tipodocu_nombre').AsString;

      end;

    puntoventa_id.Buscar(ZQSelect.FieldByName('puntoventa_id').AsString);
    tipodocu_tipo.Buscar(ZQSelect.FieldByName('tipodocu_tipo').AsString);
    tipodocu_letra.Text:=ZQSelect.FieldByName('tipodocu_letra').AsString;
    tipodocu_stock.Buscar(ZQSelect.FieldByName('tipodocu_stock').AsString);
    tipodocu_ultimonumero.Text:=ZQSelect.FieldByName('tipodocu_ultimonumero').AsString;
    tipodocu_debcred.Buscar(ZQSelect.FieldByName('tipodocu_debcred').AsString);
    tipodocu_caja.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_caja').AsString);
    tipodocu_iva.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_iva').AsString);
    tipodocu_fiscal.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_fiscal').AsString);
    tipodocu_preimpresos.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_preimpresos').AsString);
    tipodocu_manual.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_manual').AsString);
//    tipodocu_manual.OnClick(self);
    tipodocufiscal_id.Buscar(ZQSelect.FieldByName('tipodocufiscal_id').AsString);
    tipodocu_impresora.Text:=ZQSelect.FieldByName('tipodocu_impresora').AsString;
    tipodocu_copias.Text:=ZQSelect.FieldByName('tipodocu_copias').AsString;
    tipodocu_preview.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_preview').AsString);
    tipodocu_prompt.Checked:=strtobool(ZQSelect.FieldByName('tipodocu_prompt').AsString);
    tipodocu_archivoimpresion.Text:=ZQSelect.FieldByName('tipodocu_archivoimpresion').AsString;
    tipodocu_leyenda.Text:=ZQSelect.FieldByName('tipodocu_leyenda').AsString;
    tipodocu_nombreabrev.Text:=ZQSelect.FieldByName('tipodocu_nombreabrev').AsString;
    tipodocu_importemax.Text:=ZQSelect.FieldByName('tipodocu_importemax').AsString;

end;

end.

