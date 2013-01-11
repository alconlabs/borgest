unit UnitImpresoraFiscalcola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid, OleServer,
  FiscalPrinterLib_TLB;

type
  Timpresorafiscalcola = class(TForm)
    impresorafiscal: TAdvPanel;
    btnimprimir: TButton;
    DBGrid1: TDBGrid;
    DSCDocumentosventas: TDataSource;
    ZQDocumentosventas: TZQuery;
    btnreportez: TButton;
    btncancelar: TButton;
    btnactualizar: TButton;
    puntoventa_id: TSqlComboBox;
    Label15: TLabel;
    procedure btnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnreportezClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  impresorafiscalcola: Timpresorafiscalcola;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Timpresorafiscalcola.btnactualizarClick(Sender: TObject);
begin
    self.OnShow(self);
end;

procedure Timpresorafiscalcola.btnimprimirClick(Sender: TObject);
begin
    Princ.ImprimirFiscal(ZQDocumentosventas.FieldByName('documentoventa_id').AsString);
    ZQDocumentosventas.Active:=false;
    ZQDocumentosventas.Active:=true;
end;

procedure Timpresorafiscalcola.btnreportezClick(Sender: TObject);
begin
    Princ.ImprimirFiscal('-1',puntoventa_id.codigo);
    ZQDocumentosventas.Active:=false;
    ZQDocumentosventas.Active:=true;
end;

procedure Timpresorafiscalcola.FormShow(Sender: TObject);
begin
    ZQDocumentosventas.Active:=false;
    ZQDocumentosventas.Active:=true;

    puntoventa_id.llenarcombo;
    puntoventa_id.ItemIndex:=0;
end;

end.
