unit UnitRemitoVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel;

type
  Tremitoventa = class(Tdocumentoventabase)
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  remitoventa: Tremitoventa;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure Tremitoventa.btnguardarClick(Sender: TObject);
begin
  inherited;
    if (abm=1) or (abm=2) then
      begin
          MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

          if Princ.buscar('select tipodocu_preimpresos from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_preimpresos')='-1' then
            begin
                if (MessageDlg('Desea imprimir el comprobante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                      imprimir;

                  end;

            end;

      end;

    if abm=3 then
      begin
          if eliminado then
            MessageDlg('Los datos fueron borrados correctamente.', mtInformation, [mbOK], 0);
      end;

    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;
end;

end.
