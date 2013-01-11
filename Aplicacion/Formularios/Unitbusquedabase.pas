unit Unitbusquedabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid, GBTEdit;

type
  Tbusquedabase = class(TForm)
    panelgrilla: TAdvPanel;
    DBGrid1: TDBGrid;
    ZQGrilla: TZQuery;
    DSCGrilla: TDataSource;
    panelfiltros: TAdvPanel;
    btnfiltrar: TButton;
    ZQuery2: TZQuery;
    CustomizeGrid1: TCustomizeGrid;
    btnaceptar: TButton;
    AdvPanel1: TAdvPanel;
    btncancelar: TButton;
    fil_id: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
  private
    { Private declarations }
    abm:integer;
  public
    { Public declarations }
    campo_id:string;
    id:string;
    producto_codigoreferencia:string;
  end;

var
  busquedabase: Tbusquedabase;

implementation

uses UnitPrinc, UnitProductos;

{$R *.dfm}

procedure Tbusquedabase.btnaceptarClick(Sender: TObject);
begin
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                id:=ZQGrilla.FieldByName(campo_id).AsString;
                self.ModalResult:=mrOk;
            end;
      end;
end;

procedure Tbusquedabase.btnfiltrarClick(Sender: TObject);
begin
    ZQGrilla.Active:=false;
end;

end.
