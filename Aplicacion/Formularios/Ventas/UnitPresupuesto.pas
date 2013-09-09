unit UnitPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel;

type
  Tpresupuesto = class(Tdocumentoventabase)
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  presupuesto: Tpresupuesto;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure Tpresupuesto.btnguardarClick(Sender: TObject);
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

          //if Princ.buscar('select tipodocu_fiscal from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_fiscal')='-1' then
//            begin
//                if limpiar_al_guardar then
//                  begin
//                      id:='';
//                      Self.OnShow(self);
//                  end
//                else
//                  begin
//                      Self.Close;
//                  end;
//            end;
      end;

    if abm=3 then
      MessageDlg('Datos eliminados correctamente.', mtInformation, [mbOK], 0);




    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;

end;

procedure Tpresupuesto.FormShow(Sender: TObject);
begin
  inherited;
    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
        6:begin
              btnguardar.Enabled:=false;
              btnagregar.Enabled:=false;
              btnquitar.Enabled:=false;
              btnmodificar.Enabled:=false;


          end;

    end;
end;

end.
