unit Unitfacturaventasuperrapida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitfacturasventa, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel;

type
  Tfacturaventasuperrapida = class(Tfacturasventa)
    producto_id: TSqlComboBox;
    Label14: TLabel;
    Label16: TLabel;
    documentopago_importe: TMoneyEdit;
    procedure FormCreate(Sender: TObject);
    procedure cliente_idExit(Sender: TObject);
    procedure producto_idExit(Sender: TObject);
    procedure personal_idExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  facturaventasuperrapida: Tfacturaventasuperrapida;

implementation

{$R *.dfm}

procedure Tfacturaventasuperrapida.cliente_idExit(Sender: TObject);
begin
  inherited;
  Label3.Caption:=cliente_id.codigo;
end;

procedure Tfacturaventasuperrapida.FormCreate(Sender: TObject);
begin
  inherited;
  producto_id.llenarcombo;
  producto_id.ItemIndex:=-1;
  panelgrilla.StatusBar.Text:='F9-Guardar todo';
end;

procedure Tfacturaventasuperrapida.personal_idExit(Sender: TObject);
begin
  inherited;
  Label4.Caption:=personal_id.codigo;
end;

procedure Tfacturaventasuperrapida.producto_idExit(Sender: TObject);
begin
  inherited;
  Label14.Caption:=producto_id.codigo;
end;

end.
