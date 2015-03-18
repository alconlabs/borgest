unit UnitListaNotasDeCreditodeCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, Buttons;

type
  TLIstaNotasDeCreditoDeCompras = class(Tlistabase)
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
  LIstaNotasDeCreditoDeCompras: TLIstaNotasDeCreditoDeCompras;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TLIstaNotasDeCreditoDeCompras.btnanularClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_NOTACREDITOCOMPRA,ABM_ANULAR);
      end;
end;

procedure TLIstaNotasDeCreditoDeCompras.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_NOTACREDITOCOMPRA,ABM_ELIMINAR);
      end;
end;

procedure TLIstaNotasDeCreditoDeCompras.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentoscompras '+
                       'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                       ' where tipodocu_nombre="'+TIPODOCU_NOTACREDITOCOMPRA+'" '+princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_fecha like "'+primercaracter+fil_id.Text+'"';

    if fil_documentocompra_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_numero like "'+primercaracter+fil_documentocompra_numero.Text+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedores.proveedor_nombre like "'+primercaracter+fil_proveedor_nombre.Text+'%"';

    if fil_documentocompra_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_total like "'+primercaracter+fil_documentocompra_total.Text+'%"';

    if fil_documentocompra_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_estado like "'+primercaracter+fil_documentocompra_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentocompra_fecha, documentocompra_numero';

    ZQGrilla.Active:=true;
end;

procedure TLIstaNotasDeCreditoDeCompras.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_NOTACREDITOCOMPRA,ABM_MODIFICAR);
      end;
end;

procedure TLIstaNotasDeCreditoDeCompras.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoCompra('',TIPODOCU_NOTACREDITOCOMPRA,ABM_AGREGAR);
end;

end.
