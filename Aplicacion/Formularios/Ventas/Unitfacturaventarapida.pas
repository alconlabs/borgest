unit Unitfacturaventarapida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitfacturasventa, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel, Menus, AdvMenus, AdvGlowButton;

type
  Tfacturasventarapida = class(Tfacturasventa)
    documentoventa_total2: TMoneyEdit;
    Label14: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  facturasventarapida: Tfacturasventarapida;

implementation

uses Unitprinc;

{$R *.dfm}

procedure Tfacturasventarapida.btnagregarClick(Sender: TObject);
begin
  inherited;
  documentoventa_total2.Value:=documentoventa_total.Value;

end;

procedure Tfacturasventarapida.btnguardarClick(Sender: TObject);
begin
    if documentoventa_saldo>0 then
      begin
          ZQDocumentopagos.Insert;
          ZQDocumentopagos.FieldByName('documentopago_id').asstring:='0';
          ZQDocumentopagos.FieldByName('documentopago_importe').AsFloat:=documentoventa_saldo;
          ZQDocumentopagos.FieldByName('documentopago_nombre').asstring:='EVECTIVO';
          ZQDocumentopagos.FieldByName('documentoventa_id').asstring:='0';
          ZQDocumentopagos.FieldByName('tipopago_id').asstring:='1';
          ZQDocumentopagos.Post;
          calculartotalpagos;

      end;


  inherited;
  documentoventa_total2.Value:=0;
end;

procedure Tfacturasventarapida.btnquitarClick(Sender: TObject);
begin
  inherited;
  documentoventa_total2.Value:=documentoventa_total.Value;
end;

procedure Tfacturasventarapida.FormShow(Sender: TObject);
begin
  inherited;

  sucursal_id.Buscar(Princ.buscar('select sucursal_id from puntodeventa where puntoventa_id="'+princ.GetConfiguracion('VENTARAPIDAPUNTOVENTAID')+'"','sucursal_id'));
  sucursal_id.OnSelect(self);

  puntoventa_id.Buscar(princ.GetConfiguracion('VENTARAPIDAPUNTOVENTAID'));
  puntoventa_id.OnSelect(self);

  cliente_id.Buscar(princ.GetConfiguracion('VENTARAPIDACLIENTEID'));
  cliente_id.OnSelect(self);

  tipodocu_id.Buscar(princ.GetConfiguracion('VENTARAPIDATIPODOCUID'));
  tipodocu_id.OnSelect(self);

  personal_id.Buscar(princ.GetConfiguracion('VENTARAPIDAPERSONALID'));

  btnherramientas.Visible:=false;
  btnagregarcliente.Visible:=false;
end;

end.
