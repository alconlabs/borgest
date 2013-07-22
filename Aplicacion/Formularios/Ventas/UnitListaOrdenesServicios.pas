unit UnitListaOrdenesServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel, GBTEdit, ComCtrls;

type
  TListaOrdenesServicios = class(Tlistabase)
    fil_puntoventa_numero: TEdit;
    fil_documentoventa_numero: TEdit;
    fil_cliente_nombre: TEdit;
    fil_clientevehiculo_marca: TEdit;
    fil_clientevehiculo_modelo: TEdit;
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
  ListaOrdenesServicios: TListaOrdenesServicios;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaOrdenesServicios.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,tipodocu_nombre,3);
      end;
end;

procedure TListaOrdenesServicios.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       'inner join clientevehiculo on clientes.cliente_id=clientevehiculo.cliente_id '+
                       ' where tipodocu_nombre="'+tipodocu_nombre+'" '+princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_fecha like "'+primercaracter+fil_id.Text+'"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "'+primercaracter+fil_puntoventa_numero.Text+'%"';

    if fil_documentoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documentoventa_numero like "'+primercaracter+fil_documentoventa_numero.Text+'%"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientes.cliente_nombre like "'+primercaracter+fil_cliente_nombre.Text+'%"';

    if fil_clientevehiculo_marca.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientevehiculo_marca like "'+primercaracter+fil_clientevehiculo_marca.Text+'%"';

    if fil_clientevehiculo_modelo.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and clientevehiculo_modelo like "'+primercaracter+fil_clientevehiculo_modelo.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documentoventa_fecha, documentoventa_id';

    ZQGrilla.Active:=true;
end;

procedure TListaOrdenesServicios.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQGrilla.FieldByName('documentoventa_id').AsString,tipodocu_nombre,2);
      end;
end;

procedure TListaOrdenesServicios.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirDocumentoVenta('',tipodocu_nombre,1);
end;

end.
