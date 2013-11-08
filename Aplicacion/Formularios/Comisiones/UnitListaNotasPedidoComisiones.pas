unit UnitListaNotasPedidoComisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel, GBTEdit, ComCtrls;

type
  TListaNotasPedidoComisiones = class(Tlistabase)
    fil_puntoventa_numero: TEdit;
    fil_documentoventa_equipo1: TEdit;
    fil_cliente_nombre: TEdit;
    fil_documentoventa_total: TEdit;
    fil_documentoventa_numero: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipodocu_nombre:string;
  end;

var
  ListaNotasPedidoComisiones: TListaNotasPedidoComisiones;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaNotasPedidoComisiones.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,tipodocu_nombre,ABM_ELIMINAR);
      end;
end;

procedure TListaNotasPedidoComisiones.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       ' where tipodocu_nombre="'+tipodocu_nombre+'" '+princ.empresa_where;


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

    if fil_documentoventa_equipo1.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_equipo1 like "'+primercaracter+fil_documentoventa_equipo1.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentoventa_numero desc';

    ZQGrilla.Active:=true;
end;

procedure TListaNotasPedidoComisiones.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,tipodocu_nombre,ABM_MODIFICAR);
      end;
end;

procedure TListaNotasPedidoComisiones.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoVenta('',tipodocu_nombre,ABM_AGREGAR);
end;

end.
