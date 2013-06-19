unit UnitImprimirListaPrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMInibase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, UnitSqlComboBox, ComCtrls, AdvListV,
  UnitSqlListView, Titles, GTBComboBox;

type
  TImprimirListaPrecios = class(TABMInibase)
    Label21: TLabel;
    rubro_id: TSqlComboBox;
    Label22: TLabel;
    proveedor_id: TSqlComboBox;
    btnfiltrar: TButton;
    productos: TSqlListView;
    tiProdcutos: TTitles;
    btnimprimir: TButton;
    producto_precioventa: TGTBComboBox;
    Label1: TLabel;
    producto_nombre: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImprimirListaPrecios: TImprimirListaPrecios;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TImprimirListaPrecios.btncancelarClick(Sender: TObject);
begin
    tiProdcutos.Memo.Text:='select * from productos '+
                      'inner join proveedores on productos.proveedor_id=proveedores.proveedor_id '+
                      'inner join rubros on productos.rubro_id=rubros.rubro_id '+
                      'where 1=1';

    if rubro_id.Text<>'Todos' then
      tiProdcutos.Memo.Text:=tiProdcutos.Memo.Text+' and rubros.rubro_id="'+rubro_id.codigo+'"';

    if proveedor_id.Text<>'Todos' then
      tiProdcutos.Memo.Text:=tiProdcutos.Memo.Text+' and proveedores.proveedor_id="'+proveedor_id.codigo+'"';

    if producto_nombre.Text<>'' then
      tiProdcutos.Memo.Text:=tiProdcutos.Memo.Text+' and productos.producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(producto_nombre.Text,' ','%')+'%"';

    tiProdcutos.Memo.Text:=tiProdcutos.Memo.Text+' order by producto_nombre';

    productos.Fill;
end;

procedure TImprimirListaPrecios.btnguardarClick(Sender: TObject);
begin
  inherited;
    productos.LlenarMQuery;
    ZQExecSQL.SQL.Clear;
    ZQExecSQL.SQL.Add('update productos set');
    ZQExecSQL.SQL.Add('producto_imprimir=:producto_imprimir');
    ZQExecSQL.SQL.Add('where producto_id=:producto_id');
    while not productos.FQChequeados.Eof do
        begin
            ZQExecSQL.ParamByName('producto_imprimir').AsString:=booltostr(True);
            ZQExecSQL.ParamByName('producto_id').AsString:=productos.FQChequeados.FieldByName('producto_id').AsString;
            ZQExecSQL.ExecSQL;

            productos.FQChequeados.Next;
        end;


end;

procedure TImprimirListaPrecios.btnimprimirClick(Sender: TObject);
var
  productoids:string;
begin
  inherited;
    productos.LlenarMQuery;
    productos.GenerarWhere;

    if producto_precioventa.ItemIndex<4 then
      begin
          Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\lista_precios_productos.rep';
          Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select *, '+producto_precioventa.codigo+' as precio from productos '+
                                                         'inner join rubros on productos.rubro_id=rubros.rubro_id '+
                                                         'where 1=1 and '+productos.where+' order by producto_nombre';

      end
    else
      begin
          Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\listado_productos.rep';
          Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from productos '+
                                                         'inner join rubros on productos.rubro_id=rubros.rubro_id '+
                                                         'where 1=1 and '+productos.where+' order by producto_nombre';
      end;



    Princ.VCLReport1.Execute;
end;

procedure TImprimirListaPrecios.FormCreate(Sender: TObject);
begin
  inherited;
    rubro_id.llenarcombo;
    rubro_id.ItemIndex:=0;

    proveedor_id.llenarcombo;
    proveedor_id.ItemIndex:=0;

    producto_precioventa.Items.Clear;
    producto_precioventa.Items.Add(Princ.NOMBREPRECIO1);
    producto_precioventa.Items.Add(Princ.NOMBREPRECIO2);
    producto_precioventa.Items.Add(Princ.NOMBREPRECIO3);
    producto_precioventa.Items.Add(Princ.NOMBREPRECIO4);
    producto_precioventa.Items.Add('SIN PRECIOS');
    producto_precioventa.ItemIndex:=0;

    tiProdcutos.Titulos.Clear;
    tiProdcutos.Titulos.Add('Codigo');
    tiProdcutos.Titulos.Add('Producto');
    tiProdcutos.Titulos.Add('Proveedor');
    tiProdcutos.Titulos.Add('Rubro');
    tiProdcutos.Titulos.Add('P. Costo');


    tiProdcutos.Titulos.Add(Princ.NOMBREPRECIO1);
    tiProdcutos.Titulos.Add(Princ.NOMBREPRECIO2);
    tiProdcutos.Titulos.Add(Princ.NOMBREPRECIO3);
    tiProdcutos.Titulos.Add(Princ.NOMBREPRECIO4);

end;

end.
