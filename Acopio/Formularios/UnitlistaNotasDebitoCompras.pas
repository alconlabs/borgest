unit UnitlistaNotasDebitoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  TListaNotasDebitoCompra = class(Tlistabase)
    fil_puntoventa_numero: TGTBEdit;
    fil_documento_numero: TGTBEdit;
    fil_entidad_razonsocial: TGTBEdit;
    fil_documento_estado: TGTBEdit;
    fil_documento_total: TGTBEdit;
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
  ListaNotasDebitoCompra: TListaNotasDebitoCompra;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaNotasDebitoCompra.btnanularClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      Princ.AbrirDocumento(ZQGrilla.FieldByName(campo_id).AsString,TIPODOCU_NOTADEBITOCOMPRA,ABM_ANULAR);
end;

procedure TListaNotasDebitoCompra.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      Princ.AbrirDocumento(ZQGrilla.FieldByName(campo_id).AsString,TIPODOCU_NOTADEBITOCOMPRA,ABM_ELIMINAR);
end;

procedure TListaNotasDebitoCompra.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentos '+
                       'inner join entidades on documentos.entidad_id=entidades.entidad_id '+
                       'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       ' where tipodocu_nombre="'+TIPODOCU_NOTADEBITOCOMPRA+'" '+Princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_fecha like "%'+fil_id.Text+'"';
       
    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "%'+fil_puntoventa_numero.Text+'%"';

    if fil_documento_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_numero like "%'+fil_documento_numero.Text+'%"';

    if fil_entidad_razonsocial.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidades.entidad_razonsocial like "%'+fil_entidad_razonsocial.Text+'%"';

    if fil_documento_total.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_total like "%'+fil_documento_total.Text+'%"';

    if fil_documento_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_estado like "%'+fil_documento_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documento_fecha, documento_id';

    ZQGrilla.Active:=true;
end;

procedure TListaNotasDebitoCompra.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      Princ.AbrirDocumento(ZQGrilla.FieldByName(campo_id).AsString,TIPODOCU_NOTADEBITOCOMPRA,ABM_MODIFICAR);
end;

procedure TListaNotasDebitoCompra.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumento('',TIPODOCU_NOTADEBITOCOMPRA,ABM_AGREGAR);
end;

end.
