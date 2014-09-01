unit UnitLibroIvaVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, ComCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, AdvListV, UnitSqlListView,
  Titles;

type
  TLibroIvaVentas = class(TABMInibase)
    Label1: TLabel;
    Label2: TLabel;
    desde_fecha: TDateTimePicker;
    hasta_fecha: TDateTimePicker;
    tipodocu_id: TSqlListView;
    Titles1: TTitles;
    Label3: TLabel;
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LibroIvaVentas: TLibroIvaVentas;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TLibroIvaVentas.btnguardarClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'libro_iva_ventas.rep';
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);
    tipodocu_id.GenerarWhere;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, '+
                                                   'if(documentoventa_estado<>"ANULADA",if(tipodocu_debcred="DEBITO",documentoventa_neto21,-1*documentoventa_neto21),0)as neto21, '+
                                                   'if(documentoventa_estado<>"ANULADA",if(tipodocu_debcred="DEBITO",documentoventa_neto105,-1*documentoventa_neto105),0) as neto105, '+
                                                   'if(documentoventa_estado<>"ANULADA",if(tipodocu_debcred="DEBITO",documentoventa_iva21,-1*documentoventa_iva21),0) as iva21, '+
                                                   'if(documentoventa_estado<>"ANULADA",if(tipodocu_debcred="DEBITO",documentoventa_iva105,-1*documentoventa_iva105),0) as iva105, '+
                                                   'if(documentoventa_estado<>"ANULADA",if(tipodocu_debcred="DEBITO",documentoventa_total,-1*documentoventa_total),0) as total, '+
                                                   'if(documentoventa_estado<>"ANULADA",clientes.cliente_nombre,"ANULADA") as clientenombre '+
                                                   'from documentosventas '+
                                                   'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                                   'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tiposdocumento.tipodocu_iva=-1 and documentosventas.documentoventa_numero>0 and '+
                                                   'tipodocu_debcred<>"N/A" and '+
                                                   'documentosventas.documentoventa_fecha >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                                   'documentosventas.documentoventa_fecha <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                                   ' and '+tipodocu_id.where+
                                                   ' order by documentoventa_fecha, tipodocu_letra, documentoventa_numero';



    Princ.VCLReport1.Execute;
end;

procedure TLibroIvaVentas.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=date-30;
    hasta_fecha.Date:=date;

    Titles1.Memo.Text:='select *, concat(tipodocu_nombreabrev, " ", tipodocu_letra) as tipodocu_descripcion from tiposdocumento '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'where tipodocu_tipo="Venta" and tipodocu_iva=-1 '+
                       Princ.empresa_where;
    tipodocu_id.Fill;
end;

end.
