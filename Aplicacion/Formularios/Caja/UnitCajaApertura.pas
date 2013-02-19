unit UnitCajaApertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, UnitSqlComboBox;

type
  TCajaApertura = class(TABMbase)
    Label4: TLabel;
    personal_id: TSqlComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caja_id:string;
  end;

var
  CajaApertura: TCajaApertura;

implementation

Uses Unitprinc;

{$R *.dfm}

procedure TCajaApertura.btnguardarClick(Sender: TObject);
begin
  inherited;
    caja_id:=Princ.AbrirCaja(personal_id.codigo);
    self.ModalResult:=mrOk;
end;

procedure TCajaApertura.FormShow(Sender: TObject);
begin
  inherited;
    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;
end;

end.
