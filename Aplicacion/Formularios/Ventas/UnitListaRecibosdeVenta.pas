unit UnitListaRecibosdeVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaRecibosdeVenta = class(Tlistabase)
    fil_puntoventa_numero: TEdit;
    fil_documentoventa_numero: TEdit;
    fil_cliente_nombre: TEdit;
    fil_documentoventa_total: TEdit;
    fil_documentoventa_estado: TEdit;
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
  ListaRecibosdeVenta: TListaRecibosdeVenta;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaRecibosdeVenta.btnanularClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,TIPODOCU_RECIBOVENTA,ABM_ANULAR);
            end;
      end;
end;

procedure TListaRecibosdeVenta.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,TIPODOCU_RECIBOVENTA,ABM_ELIMINAR);
            end;
      end;
end;

procedure TListaRecibosdeVenta.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       ' where tipodocu_nombre="'+TIPODOCU_RECIBOVENTA+'" '+princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_fecha like "'+primercaracter+fil_id.Text+'"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "'+primercaracter+fil_puntoventa_numero.Text+'%"';

    if fil_documentoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_numero like "'+primercaracter+fil_documentoventa_numero.Text+'%"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientes.cliente_nombre like "'+primercaracter+fil_cliente_nombre.Text+'%"';

    if fil_documentoventa_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_total like "'+primercaracter+fil_documentoventa_total.Text+'%"';

    if fil_documentoventa_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_estado like "'+primercaracter+fil_documentoventa_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentoventa_fecha, documentoventa_id';

    ZQGrilla.Active:=true;
end;

procedure TListaRecibosdeVenta.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,TIPODOCU_RECIBOVENTA,ABM_MODIFICAR);
            end;
      end;
end;

procedure TListaRecibosdeVenta.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoVenta('',TIPODOCU_RECIBOVENTA,ABM_AGREGAR);
end;

end.
