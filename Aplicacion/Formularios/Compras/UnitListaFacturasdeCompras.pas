unit UnitListaFacturasdeCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TLIstaFacturasDeCompras = class(Tlistabase)
    fil_documentocompra_numero: TEdit;
    fil_proveedor_nombre: TEdit;
    fil_documentocompra_total: TEdit;
    fil_documentocompra_estado: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LIstaFacturasDeCompras: TLIstaFacturasDeCompras;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TLIstaFacturasDeCompras.btnanularClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_FACTURACOMPRA,ABM_ANULAR);
      end;
end;

procedure TLIstaFacturasDeCompras.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_FACTURACOMPRA,ABM_ELIMINAR);
      end;
end;

procedure TLIstaFacturasDeCompras.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentoscompras '+
                       'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                       ' where tipodocu_nombre="Factura de Compra" '+princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_fecha like "%'+fil_id.Text+'"';

    if fil_documentocompra_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_numero like "%'+fil_documentocompra_numero.Text+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedores.proveedor_nombre like "%'+fil_proveedor_nombre.Text+'%"';

    if fil_documentocompra_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_total like "%'+fil_documentocompra_total.Text+'%"';

    if fil_documentocompra_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_estado like "%'+fil_documentocompra_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentocompra_fecha, documentocompra_numero';

    ZQGrilla.Active:=true;
end;

procedure TLIstaFacturasDeCompras.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_FACTURACOMPRA,ABM_MODIFICAR);
      end;
end;

procedure TLIstaFacturasDeCompras.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoCompra('',TIPODOCU_FACTURACOMPRA,ABM_AGREGAR);
end;

end.
