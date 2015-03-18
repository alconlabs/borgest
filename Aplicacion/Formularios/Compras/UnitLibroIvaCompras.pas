unit UnitLibroIvaCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, ComCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, AdvListV, UnitSqlListView;

type
  TLibroIvaCompras = class(TABMInibase)
    Label1: TLabel;
    Label2: TLabel;
    desde_fecha: TDateTimePicker;
    hasta_fecha: TDateTimePicker;
    procedure btnguardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LibroIvaCompras: TLibroIvaCompras;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TLibroIvaCompras.btnguardarClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'libro_iva_compras.rep';
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Params.ParamByName('DESDE_FECHA').AsString:=datetostr(desde_fecha.Date);
    Princ.VCLReport1.Report.Params.ParamByName('HASTA_FECHA').AsString:=datetostr(hasta_fecha.Date);

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_neto21,documentocompra_neto21) as neto21, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_iva21,documentocompra_iva21) as iva21, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_neto105,documentocompra_neto105) as neto105, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_iva105,documentocompra_iva105) as iva105, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_neto27,documentocompra_neto27) as neto27, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_iva27,documentocompra_iva27) as iva27, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_nogravado,documentocompra_nogravado) as nogravado, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_tishhperc,documentocompra_tishhperc) as tishhperc, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_ivaret,documentocompra_ivaret) as ivaret, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_ivaperc,documentocompra_ivaperc) as ivaperc, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_dgrret,documentocompra_dgrret) as dgrret, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_dgrperc,documentocompra_dgrperc) as dgrperc, '+
                                                   'if(tipodocu_debcred="CREDITO",-1*documentocompra_otrosimpuestos,documentocompra_otrosimpuestos) as otrosimpuestos '+
                                                   'from documentoscompras '+
                                                   'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                                                   'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                                                   'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                                   'where tiposdocumento.tipodocu_iva=-1 and '+
                                                   'tipodocu_debcred<>"N/A" and '+
                                                   'documentoscompras.documentocompra_fechaiva >="'+FormatDateTime('yyyy-mm-dd',desde_fecha.Date)+'" and '+
                                                   'documentoscompras.documentocompra_fechaiva <="'+FormatDateTime('yyyy-mm-dd',hasta_fecha.Date)+'" '+Princ.empresa_where+
                                                   ' order by documentocompra_fecha, tipodocu_letra, documentocompra_numero';

    Princ.VCLReport1.Execute;
end;

procedure TLibroIvaCompras.FormCreate(Sender: TObject);
begin
  inherited;
    desde_fecha.Date:=date;
    hasta_fecha.Date:=date;
end;

end.

