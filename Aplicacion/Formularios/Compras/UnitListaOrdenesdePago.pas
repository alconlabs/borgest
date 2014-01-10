unit UnitListaOrdenesdePago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaOrdenesdePago = class(Tlistabase)
    fil_puntoventa_numero: TGTBEdit;
    fil_documentocompra_numero: TGTBEdit;
    fil_proveedor_nombre: TGTBEdit;
    fil_documentocompra_total: TGTBEdit;
    fil_documentocompra_estado: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
    procedure btnverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaOrdenesdePago: TListaOrdenesdePago;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaOrdenesdePago.btnanularClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_ORDENDEPAGO,ABM_ANULAR);
      end;
end;

procedure TListaOrdenesdePago.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_ORDENDEPAGO,ABM_ELIMINAR);
      end;
end;

procedure TListaOrdenesdePago.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentoscompras '+
                       'inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join proveedores on documentoscompras.proveedor_id=proveedores.proveedor_id '+
                       ' where tipodocu_nombre="'+TIPODOCU_ORDENDEPAGO+'" '+princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_fecha like "'+primercaracter+fil_id.Text+'"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "'+primercaracter+fil_puntoventa_numero.Text+'%"';

    if fil_documentocompra_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_numero like "'+primercaracter+fil_documentocompra_numero.Text+'%"';

    if fil_proveedor_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and proveedores.proveedor_nombre like "'+primercaracter+fil_proveedor_nombre.Text+'%"';

    if fil_documentocompra_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_total like "'+primercaracter+fil_documentocompra_total.Text+'%"';

    if fil_documentocompra_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentocompra_estado like "'+primercaracter+fil_documentocompra_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentocompra_fecha desc, documentocompra_id desc';

    ZQGrilla.Active:=true;
end;

procedure TListaOrdenesdePago.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoCompra(ZQGrilla.FieldByName('documentocompra_id').AsString,TIPODOCU_ORDENDEPAGO,ABM_MODIFICAR);
      end;
end;

procedure TListaOrdenesdePago.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoCompra('',TIPODOCU_ORDENDEPAGO,ABM_AGREGAR);
end;

procedure TListaOrdenesdePago.btnverClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,TIPODOCU_RECIBOVENTA,ABM_VER);
            end;
      end;
end;

end.
