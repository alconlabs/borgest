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
    btneliminar: TButton;
    procedure btnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnreportezClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
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

procedure Timpresorafiscalcola.btneliminarClick(Sender: TObject);
begin
    if ZQDocumentosventas.RecordCount>0 then
      begin
          if (MessageDlg('Seguro desea eliminar este comprobante?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
            begin
                if not Princ.BorrarDocumentoVenta(ZQDocumentosventas.FieldByName('documentoventa_id').AsString) then
                  MessageDlg('No se pudo eliminar el comprobante. Verifique comprobantes asociados', mtInformation, [mbOK], 0);
                btnactualizar.Click;
                btnactualizar.SetFocus;


            end;


      end;


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
