unit UnitListaPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaPresupuestos = class(Tlistabase)
    fil_puntoventa_numero: TEdit;
    fil_documentoventa_numero: TEdit;
    fil_cliente_nombre: TEdit;
    fil_documentoventa_total: TEdit;
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
  ListaPresupuestos: TListaPresupuestos;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TListaPresupuestos.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,tipodocu_nombre,3);
      end;
end;

procedure TListaPresupuestos.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       ' where tipodocu_nombre="'+tipodocu_nombre+'" '+princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_fecha like "%'+fil_id.Text+'"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "%'+fil_puntoventa_numero.Text+'%"';

    if fil_documentoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_numero like "%'+fil_documentoventa_numero.Text+'%"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientes.cliente_nombre like "%'+fil_cliente_nombre.Text+'%"';

    if fil_documentoventa_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_total like "%'+fil_documentoventa_total.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentoventa_fecha, documentoventa_id';

    ZQGrilla.Active:=true;
end;

procedure TListaPresupuestos.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,tipodocu_nombre,2);
      end;
end;

procedure TListaPresupuestos.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoVenta('',tipodocu_nombre,1);
end;

end.
