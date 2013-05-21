unit UnitNotaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel, GBTEdit;

type
  TNotaPedido = class(Tdocumentoventabase)
    documentoventa_formapago: TGTBMemo;
    Label14: TLabel;
    documentoventa_equipo1: TGTBEdit;
    Label16: TLabel;
    Label17: TLabel;
    documentoventa_equipo2: TGTBEdit;
    btnimprimir: TButton;
    ZQDocumentoventadetallesproducto_tipo: TStringField;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Modificar1;
  public
    { Public declarations }
  end;

var
  NotaPedido: TNotaPedido;

implementation

Uses UnitPrinc, UnitNotaPedidoDetalle;

{$R *.dfm}


procedure TNotaPedido.FormShow(Sender: TObject);
begin
  inherited;
  if abm=1 then
    begin
        documentoventa_formapago.Text:='';
        documentoventa_equipo1.Text:='';
        documentoventa_equipo2.Text:='';
    end
  else
    begin
        documentoventa_formapago.Text:=ZQuery2.FieldByName('documentoventa_formapago').AsString;
        documentoventa_equipo1.Text:=ZQuery2.FieldByName('documentoventa_equipo1').AsString;
        documentoventa_equipo2.Text:=ZQuery2.FieldByName('documentoventa_equipo2').AsString;
    end;

end;

procedure TNotaPedido.Modificar1;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentosventas set');
    ZQExecSql.SQL.Add('documentoventa_formapago=:documentoventa_formapago, ');
    ZQExecSql.SQL.Add('documentoventa_equipo1=:documentoventa_equipo1, ');
    ZQExecSql.SQL.Add('documentoventa_equipo2=:documentoventa_equipo2 ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');
    ZQExecSql.ParamByName('documentoventa_formapago').AsString:=documentoventa_formapago.Text;
    ZQExecSql.ParamByName('documentoventa_equipo1').AsString:=documentoventa_equipo1.Text;
    ZQExecSql.ParamByName('documentoventa_equipo2').AsString:=documentoventa_equipo2.Text;
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;



    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentoventadetalles set');
    ZQExecSql.SQL.Add('documentoventadetalle_importe1=:documentoventadetalle_importe1, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe2=:documentoventadetalle_importe2, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe3=:documentoventadetalle_importe3, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe4=:documentoventadetalle_importe4, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe5=:documentoventadetalle_importe5, ');
    ZQExecSql.SQL.Add('documentoventadetalle_importe6=:documentoventadetalle_importe6 ');
    ZQExecSql.SQL.Add('where documentoventadetalle_id=:documentoventadetalle_id');
    ZQDocumentoventadetalles.First;
    while not ZQDocumentoventadetalles.Eof do
        begin
            ZQExecSql.ParamByName('documentoventadetalle_importe1').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe1').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe2').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe2').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe3').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe4').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe5').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe5').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_importe6').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe6').AsString;
            ZQExecSql.ParamByName('documentoventadetalle_id').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
            ZQExecSql.ExecSQL;
            ZQDocumentoventadetalles.Next;
        end;
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;


end;

procedure TNotaPedido.btnagregarClick(Sender: TObject);
begin
      try
      NotapedidoDetalle:= TNotapedidoDetalle.Create(self);
    finally
      NotapedidoDetalle.producto_precioventa:=inttostr(documentoventa_listaprecio.ItemIndex+1);
      if NotapedidoDetalle.ShowModal=mrOk then
        begin

            princ.CargarDocumentoVentaDetalle(ZQDocumentoventadetalles, NotapedidoDetalle.ZQDocumentoventadetalles);

        end;

      NotapedidoDetalle.Free;
      calculartotales;
    end;

end;

procedure TNotaPedido.btnguardarClick(Sender: TObject);
begin
  inherited;
    if (abm=1) or (abm=2) then
      begin
          Modificar1;

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

procedure TNotaPedido.btnimprimirClick(Sender: TObject);
begin
  inherited;
    self.imprimir;
end;

end.
