unit UnitConsultaStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids;

type
  TConsultaStock = class(TABMbase)
    DBGrid1: TDBGrid;
    DSCProductos: TDataSource;
    ZQSelectproducto_id: TIntegerField;
    ZQSelectproducto_nombre: TStringField;
    ZQSelectproducto_observaciones: TStringField;
    ZQSelectproducto_codigo: TStringField;
    ZQSelectproducto_codigobarras: TStringField;
    ZQSelectproducto_preciocosto: TFloatField;
    ZQSelectproducto_precioventabase: TFloatField;
    ZQSelectproducto_estado: TStringField;
    ZQSelectproducto_precioventa1: TFloatField;
    ZQSelecttipoiva_id: TIntegerField;
    ZQSelectrubro_id: TIntegerField;
    ZQSelectproducto_precioventa2: TFloatField;
    ZQSelectproducto_precioventa3: TFloatField;
    ZQSelectproducto_precioventa4: TFloatField;
    ZQSelectcalculoprecio_id: TIntegerField;
    ZQSelectpoliticaprecio_id: TIntegerField;
    ZQSelectproducto_neto1: TFloatField;
    ZQSelectproducto_neto2: TFloatField;
    ZQSelectproducto_neto3: TFloatField;
    ZQSelectproducto_neto4: TFloatField;
    ZQSelectproveedor_id: TIntegerField;
    ZQSelectproducto_fechaactualizacionprecio: TDateField;
    ZQSelectproducto_codigoreferencia: TStringField;
    ZQSelectproducto_imprimir: TIntegerField;
    ZQSelectproducto_tipo: TStringField;
    ZQSelectproducdepo_id: TIntegerField;
    ZQSelectproducdepo_stockactual: TFloatField;
    ZQSelectproducto_id_1: TIntegerField;
    ZQSelectdeposito_id: TIntegerField;
    ZQSelectproducdepo_stockminimo: TFloatField;
    ZQSelectproducdepo_puntorepos: TFloatField;
    ZQSelectproducdepo_stockinicial: TFloatField;
    Button1: TButton;
    producdepo_stockactual: TCheckBox;
    producdepo_stockminimo: TCheckBox;
    producdepo_puntorepos: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaStock: TConsultaStock;

implementation

Uses Unitprinc;

{$R *.dfm}

procedure TConsultaStock.Button1Click(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select * from productos '+
                       'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                       'where productodeposito.deposito_id="'+princ.dep_id+'"';

    if producdepo_puntorepos.Checked then
      begin
          ZQSelect.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQSelect.SQL.Text,' productodeposito.producdepo_stockactual<=productodeposito.producdepo_puntorepos');
      end;

    if producdepo_stockminimo.Checked then
      begin
          ZQSelect.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQSelect.SQL.Text,' productodeposito.producdepo_stockactual<=productodeposito.producdepo_stockminimo');
      end;

    if producdepo_stockactual.Checked then
      begin
          ZQSelect.SQL.Text:=Princ.GTBUtilidades1.AgregarWhere(ZQSelect.SQL.Text,' productodeposito.producdepo_stockactual>0');
      end;


    ZQSelect.Active:=true;

end;

procedure TConsultaStock.Label1Click(Sender: TObject);
begin
  inherited;
    producdepo_puntorepos.Checked:= not producdepo_puntorepos.Checked; 
end;

procedure TConsultaStock.Label2Click(Sender: TObject);
begin
  inherited;
    producdepo_stockminimo.Checked:= not producdepo_stockminimo.Checked;
end;

procedure TConsultaStock.Label3Click(Sender: TObject);
begin
  inherited;
    producdepo_stockactual.Checked:= not producdepo_stockactual.Checked;
end;

end.
