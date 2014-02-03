unit UnitEstadoIVAs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Titles, ComCtrls, AdvListV, UnitSqlListView, StdCtrls,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel,
  MoneyEdit;

type
  TEstadoIVAs = class(TABMbase)
    Label1: TLabel;
    Label2: TLabel;
    desde_fecha: TDateTimePicker;
    hasta_fecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    documentocompra_neto21: TMoneyEdit;
    documentocompra_iva21: TMoneyEdit;
    documentocompra_neto105: TMoneyEdit;
    documentocompra_iva105: TMoneyEdit;
    documentocompra_neto27: TMoneyEdit;
    documentocompra_iva27: TMoneyEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    documentoventa_neto21: TMoneyEdit;
    documentoventa_iva21: TMoneyEdit;
    documentoventa_neto105: TMoneyEdit;
    documentoventa_iva105: TMoneyEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    diferencia_neto21: TMoneyEdit;
    diferencia_iva21: TMoneyEdit;
    diferencia_neto105: TMoneyEdit;
    diferencia_iva105: TMoneyEdit;
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EstadoIVAs: TEstadoIVAs;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TEstadoIVAs.btnguardarClick(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select *, '+
                       'sum(if(tipodocu_debcred="DEBITO",documentoventa_neto21,-1*documentoventa_neto21)) as neto21, '+
                       'sum(if(tipodocu_debcred="DEBITO",documentoventa_neto105,-1*documentoventa_neto105)) as neto105, '+
                       'sum(if(tipodocu_debcred="DEBITO",documentoventa_iva21,-1*documentoventa_iva21)) as iva21, '+
                       'sum(if(tipodocu_debcred="DEBITO",documentoventa_iva105,-1*documentoventa_iva105)) as iva105, '+
                       'sum(if(tipodocu_debcred="DEBITO",documentoventa_total,-1*documentoventa_total)) as total '+
                       'from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'where tiposdocumento.tipodocu_iva=-1 and documentosventas.documentoventa_numero>0 and '+
                       'tipodocu_debcred<>"N/A" and '+
                       'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                       'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                       ' order by documentoventa_fecha, tipodocu_letra, documentoventa_numero';

    ZQSelect.Active:=true;
    if ZQSelect.RecordCount>0 then
      begin
          documentoventa_neto21.Text:=ZQSelect.FieldByName('neto21').AsString;
          documentoventa_iva21.Text:=ZQSelect.FieldByName('iva21').AsString;
          documentoventa_neto105.Text:=ZQSelect.FieldByName('neto105').AsString;
          documentoventa_iva105.Text:=ZQSelect.FieldByName('iva105').AsString;

      end;



    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select *, '+
                       'sum(if(tipodocu_debcred="CREDITO",documentocompra_neto21,-1*documentocompra_neto21)) as neto21, '+
                       'sum(if(tipodocu_debcred="CREDITO",documentocompra_iva21,-1*documentocompra_iva21)) as iva21, '+
                       'sum(if(tipodocu_debcred="CREDITO",documentocompra_neto105,-1*documentocompra_neto105)) as neto105, '+
                       'sum(if(tipodocu_debcred="CREDITO",documentocompra_iva105,-1*documentocompra_iva105)) as iva105, '+
                       'sum(if(tipodocu_debcred="CREDITO",documentocompra_neto27,-1*documentocompra_neto27)) as neto27, '+
                       'sum(if(tipodocu_debcred="CREDITO",documentocompra_iva27,-1*documentocompra_iva27)) as iva27 '+
                       'from documentoscompras '+
                       'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'where tiposdocumento.tipodocu_iva=-1 and '+
                       'tipodocu_debcred<>"N/A" and '+
                       'documentoscompras.documentocompra_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                       'documentoscompras.documentocompra_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                       ' order by documentocompra_fecha, tipodocu_letra, documentocompra_numero';

    ZQSelect.Active:=true;
    if ZQSelect.RecordCount>0 then
      begin
          documentocompra_neto21.Text:=ZQSelect.FieldByName('neto21').AsString;
          documentocompra_iva21.Text:=ZQSelect.FieldByName('iva21').AsString;
          documentocompra_neto105.Text:=ZQSelect.FieldByName('neto105').AsString;
          documentocompra_iva105.Text:=ZQSelect.FieldByName('iva105').AsString;
          documentocompra_neto27.Text:=ZQSelect.FieldByName('neto27').AsString;
          documentocompra_iva27.Text:=ZQSelect.FieldByName('iva27').AsString;

      end;


    diferencia_neto21.Value:=documentoventa_neto21.Value-documentocompra_neto21.Value;
    diferencia_iva21.Value:=documentoventa_iva21.Value-documentocompra_iva21.Value;
    diferencia_neto105.Value:=documentoventa_neto105.Value-documentocompra_neto105.Value;
    diferencia_iva105.Value:=documentoventa_iva105.Value-documentocompra_iva105.Value;

end;

procedure TEstadoIVAs.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=strtodate('01/'+FormatDateTime('mm/yyyy',Date));
    hasta_fecha.Date:=Date;
end;

end.
