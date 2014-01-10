unit UnitMovimientosdeStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, AdvEdit, AdvEdBtn, EditCodi, MQuery, Grids,
  DBGrids;

type
  TMovimientosdeStock = class(TABMbase)
    Label3: TLabel;
    producto_id: TEditCodi;
    producto_nombre: TEdit;
    DBGrid1: TDBGrid;
    DTSDocumentos: TDataSource;
    MQDocumentos: TMQuery;
    btnactualizar: TButton;
    Label1: TLabel;
    procedure producto_idClickBtn(Sender: TObject);
    procedure producto_idKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MovimientosdeStock: TMovimientosdeStock;

implementation

Uses Unitbusquedaproductos, UnitPrinc;

{$R *.dfm}

procedure TMovimientosdeStock.btnactualizarClick(Sender: TObject);
begin
  inherited;
    MQDocumentos.Active:=false;
    if producto_id.Text<>'' then
      begin
          MQDocumentos.Active:=true;
          ZQSelect.Active:=false;
          ZQSelect.SQL.Text:='select * from documentosventas '+
                             'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id  '+
                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                             'where documentoventadetalles.producto_id="'+producto_id.Text+'" and '+
                             'tiposdocumento.tipodocu_stock<>"0" and '+
                             'documentosventas.documentoventa_estado<>"ANULADA" '+Princ.empresa_where;

          ZQSelect.Active:=true;

          ZQSelect.First;
          while not ZQSelect.Eof do
              begin
                  MQDocumentos.Insert;
                  MQDocumentos.FieldByName('documento_id').AsString:=ZQSelect.FieldByName('documentoventa_id').AsString;
                  MQDocumentos.FieldByName('tipodocu_nombre').AsString:=ZQSelect.FieldByName('tipodocu_nombre').AsString;
                  MQDocumentos.FieldByName('tipodocu_tipo').AsString:=ZQSelect.FieldByName('tipodocu_tipo').AsString;
                  MQDocumentos.FieldByName('tipodocu_letra').AsString:=ZQSelect.FieldByName('tipodocu_letra').AsString;
                  MQDocumentos.FieldByName('tipodocu_stock').AsString:=ZQSelect.FieldByName('tipodocu_stock').AsString;
                  MQDocumentos.FieldByName('tipodocu_nombreabrev').AsString:=ZQSelect.FieldByName('tipodocu_nombreabrev').AsString;
                  MQDocumentos.FieldByName('puntoventa_numero').AsString:=ZQSelect.FieldByName('puntoventa_numero').AsString;
                  MQDocumentos.FieldByName('documento_numero').AsString:=ZQSelect.FieldByName('documentoventa_numero').AsString;
                  MQDocumentos.FieldByName('documento_fecha').AsString:=ZQSelect.FieldByName('documentoventa_fecha').AsString;
                  MQDocumentos.FieldByName('entidad_nombre').AsString:=ZQSelect.FieldByName('cliente_nombre').AsString;
                  MQDocumentos.Post;

                  ZQSelect.Next;
              end;


      end;



end;

procedure TMovimientosdeStock.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    if MQDocumentos.FieldByName('tipodocu_tipo').AsString='Venta' then
      begin
          Princ.AbrirDocumentoVenta(MQDocumentos.FieldByName('documento_id').AsString,MQDocumentos.FieldByName('tipodocu_nombre').AsString,ABM_VER);


      end;

end;

procedure TMovimientosdeStock.FormCreate(Sender: TObject);
begin
  inherited;
    producto_id.ConfSql.Text:='select * from productos left join politicasdeprecios on productos.politicaprecio_id=politicasdeprecios.politicaprecio_id where producto_tipo="PRODUCTO" order by producto_nombre';
    producto_id.ConfCampoBusqueda1:=Princ.CODIGOPRODUCTOBUSQUEDA1;
    producto_id.ConfCampoBusqueda2:=Princ.CODIGOPRODUCTOBUSQUEDA2;
    producto_id.ConfCampoBusqueda3:=Princ.CODIGOPRODUCTOBUSQUEDA3;
end;

procedure TMovimientosdeStock.producto_idClickBtn(Sender: TObject);
begin
  inherited;
    busquedaproductos:=Tbusquedaproductos.Create(self);
    busquedaproductos.ConfCampoBusqueda1:=producto_id.ConfCampoBusqueda1;
    if busquedaproductos.ShowModal=mrOk then
      begin
          producto_id.Text:=busquedaproductos.producto_id;
          producto_id.Search(busquedaproductos.producto_id);

      end;

    busquedaproductos.Free;
end;

procedure TMovimientosdeStock.producto_idKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if key='+' then
      begin
          key:=#0;
          producto_id.OnClickBtn(self);

      end;
end;

end.
