unit UnitNotaPedidoDetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitventadetalle2, Menus, AdvMenus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvGlowButton, StdCtrls, AdvEdBtn, EditCodi,
  AdvEdit, DBAdvEd, ExtCtrls, AdvPanel, MoneyEdit;

type
  TNotapedidoDetalle = class(Tventadetalle2)
    Label4: TLabel;
    documentoventadetalle_importe3: TDBAdvEdit;
    Label5: TLabel;
    documentoventadetalle_importe5: TDBAdvEdit;
    Label7: TLabel;
    documentoventadetalle_importe1: TDBAdvEdit;
    Label8: TLabel;
    documentoventadetalle_importe4: TDBAdvEdit;
    Label9: TLabel;
    documentoventadetalle_importe6: TDBAdvEdit;
    Label10: TLabel;
    documentoventadetalle_importe2: TDBAdvEdit;
    procedure ventadetalle_preciounitarioExit(Sender: TObject);
    procedure ventadeta_cantidadExit(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CargarQuery1;
  public
    { Public declarations }
    procedure calculartotal1;
  end;

var
  NotapedidoDetalle: TNotapedidoDetalle;

implementation

Uses UnitPrinc;

{$R *.dfm}


procedure TNotapedidoDetalle.CargarQuery1;
begin
    ZQDocumentoventadetalles.First;
    ZQDocumentoventadetalles.Edit;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe1').AsString:=documentoventadetalle_importe1.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe2').AsString:=documentoventadetalle_importe2.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe3').AsString:=documentoventadetalle_importe3.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe4').AsString:=documentoventadetalle_importe4.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe5').AsString:=documentoventadetalle_importe5.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_importe6').AsString:=documentoventadetalle_importe6.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString:='PEDIDO';
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString:=ventadeta_cantidad.Text;
    ZQDocumentoventadetalles.Post;



end;


procedure TNotapedidoDetalle.btnaceptarClick(Sender: TObject);
begin
    CargarQuery;
    CargarQuery1;
    Self.ModalResult:=mrOk;
end;

procedure TNotapedidoDetalle.calculartotal1;
begin
    documentoventadetalle_importe2.FloatValue:=documentoventadetalle_importe1.FloatValue+ventadetalle_preciounitario.FloatValue;
    documentoventadetalle_importe4.FloatValue:=ventadetalle_preciounitario.FloatValue+documentoventadetalle_importe1.FloatValue+documentoventadetalle_importe3.FloatValue;
    documentoventadetalle_importe5.FloatValue:=ventadeta_cantidad.Value*ventadetalle_preciounitario.FloatValue;
    ventadetalle_total.FloatValue:=documentoventadetalle_importe2.FloatValue*ventadeta_cantidad.Value;


end;

procedure TNotapedidoDetalle.ventadetalle_preciounitarioExit(Sender: TObject);
begin
    calculartotal1;

end;

procedure TNotapedidoDetalle.ventadeta_cantidadExit(Sender: TObject);
begin
    calculartotal1;

end;

end.
