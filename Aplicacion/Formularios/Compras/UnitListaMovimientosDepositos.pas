unit UnitListaMovimientosDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaMovimientosDepositos = class(Tlistabase)
    procedure btnnuevoClick(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaMovimientosDepositos: TListaMovimientosDepositos;

implementation

uses UnitMovimientosDepositos, Unitprinc, UnitMovimientosDepositosConfirma;

{$R *.dfm}

procedure TListaMovimientosDepositos.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;
end;

procedure TListaMovimientosDepositos.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.FieldByName('deposito_iddestino').AsString=princ.dep_id then
      begin
          try
            MovimientosDepositosConfirma:=TMovimientosDepositosConfirma.Create(self);
          finally
            MovimientosDepositosConfirma.abm:=ABM_MODIFICAR;
            MovimientosDepositosConfirma.id:=ZQGrilla.FieldByName(campo_id).AsString;
            MovimientosDepositosConfirma.Show;
          end;

      end
    else
      begin
          try
            MovimientosDepositos:=TMovimientosDepositos.Create(self);
          finally
            MovimientosDepositos.abm:=ABM_MODIFICAR;
            MovimientosDepositos.id:=ZQGrilla.FieldByName(campo_id).AsString;
            MovimientosDepositos.Show;
          end;


      end;


end;

procedure TListaMovimientosDepositos.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      MovimientosDepositos:=TMovimientosDepositos.Create(self);
    finally
      MovimientosDepositos.abm:=ABM_AGREGAR;
      MovimientosDepositos.id:='';
      MovimientosDepositos.Show;
    end;
end;

end.
