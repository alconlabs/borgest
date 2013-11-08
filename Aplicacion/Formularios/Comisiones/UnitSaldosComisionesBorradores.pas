unit UnitSaldosComisionesBorradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, UnitSqlComboBox, MQuery, Grids, DBGrids;

type
  TSaldosComisionesBorradores = class(TABMbase)
    Label4: TLabel;
    personal_id: TSqlComboBox;
    DBGrid1: TDBGrid;
    DTSDetalles: TDataSource;
    MQDetalles: TMQuery;
    MQDetallesid: TIntegerField;
    MQDetallesfecha: TDateField;
    MQDetallestipo: TStringField;
    MQDetallesimporte: TFloatField;
    MQDetallestipodocu_nombre: TStringField;
    MQDetallesnumero: TStringField;
    MQDetallesorden: TIntegerField;
    MQDetallesacumulado: TFloatField;
    MQDetallesdetalle_id: TIntegerField;
    MQDetallesequipo: TStringField;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaldosComisionesBorradores: TSaldosComisionesBorradores;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TSaldosComisionesBorradores.btnguardarClick(Sender: TObject);
var
  acumulado:real;
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select * from documentosventas '+
                       'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                       'inner join docuvendetcomisionesvendedores on documentoventadetalles.documentoventadetalle_id=docuvendetcomisionesvendedores.documentoventadetalle_id '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'where tiposdocumento.tipodocu_nombre="'+TIPODOCU_NOTAPEDIDOCOMISIONES+'" and '+
                       'docuvendetcomisionesvendedores.personal_id="'+personal_id.codigo+'" and docuvendetcomisionesvendedores.docuvendetcomisionvendedor_total>0';
    ZQSelect.Active:=true;
    ZQSelect.First;
    MQDetalles.Active:=false;
    MQDetalles.Active:=true;
    while not ZQSelect.Eof do
        begin
            MQDetalles.Insert;
            MQDetalles.FieldByName('id').AsString:=ZQSelect.FieldByName('documentoventa_id').AsString;
            MQDetalles.FieldByName('fecha').AsDateTime:=ZQSelect.FieldByName('documentoventa_fecha').AsDateTime;
            MQDetalles.FieldByName('tipo').AsString:='Borrador';
            MQDetalles.FieldByName('numero').AsString:=ZQSelect.FieldByName('documentoventa_numero').AsString;
            MQDetalles.FieldByName('importe').AsString:=ZQSelect.FieldByName('docuvendetcomisionvendedor_total').AsString;
            MQDetalles.FieldByName('tipodocu_nombre').AsString:=TIPODOCU_NOTAPEDIDOCOMISIONES;
            MQDetalles.FieldByName('orden').AsInteger:=1;
            MQDetalles.FieldByName('acumulado').AsFloat:=0;
            MQDetalles.FieldByName('detalle_id').AsString:=ZQSelect.FieldByName('docuvendetcomisionvendedor_id').AsString;
            MQDetalles.FieldByName('equipo').AsString:=ZQSelect.FieldByName('documentoventa_equipo1').AsString;
            MQDetalles.Post;


            ZQSelect.Next;
        end;



    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select * from liquidacionesborradores '+
                       'where liquidacionesborradores.personal_id="'+personal_id.codigo+'" ';
    ZQSelect.Active:=true;
    ZQSelect.First;
    while not ZQSelect.Eof do
        begin
            MQDetalles.Insert;
            MQDetalles.FieldByName('id').AsString:=ZQSelect.FieldByName('liquidacionborrador_id').AsString;
            MQDetalles.FieldByName('fecha').AsDateTime:=ZQSelect.FieldByName('liquidacionborrador_fecha').AsDateTime;
            MQDetalles.FieldByName('tipo').AsString:='Liquidacion';
            MQDetalles.FieldByName('numero').AsString:=ZQSelect.FieldByName('liquidacionborrador_id').AsString;
            MQDetalles.FieldByName('importe').AsFloat:=ZQSelect.FieldByName('liquidacionborrador_total').AsFloat*-1;
            MQDetalles.FieldByName('tipodocu_nombre').AsString:='Liquidacion Borradores';
            MQDetalles.FieldByName('acumulado').AsFloat:=0;
            MQDetalles.FieldByName('detalle_id').AsString:=ZQSelect.FieldByName('liquidacionborrador_id').AsString;
            MQDetalles.FieldByName('equipo').AsString:=ZQSelect.FieldByName('liquidacionborrador_equipo').AsString;
            MQDetalles.Post;


            ZQSelect.Next;
        end;

    acumulado:=0;
    MQDetalles.First;
    while not MQDetalles.Eof do
    begin
        acumulado:=acumulado+MQDetalles.FieldByName('importe').AsFloat;

        MQDetalles.Edit;
        MQDetalles.FieldByName('acumulado').AsFloat:=acumulado;
        MQDetalles.Post;

        MQDetalles.Next;

    end;

end;

procedure TSaldosComisionesBorradores.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    if MQDetalles.FieldByName('tipodocu_nombre').AsString=TIPODOCU_NOTAPEDIDOCOMISIONES then
      begin
          Princ.AbrirDocumentoVenta(MQDetalles.FieldByName('id').AsString,TIPODOCU_NOTAPEDIDOCOMISIONES,ABM_VER);


      end;

end;

procedure TSaldosComisionesBorradores.FormShow(Sender: TObject);
begin
  inherited;
    personal_id.llenarcombo;
end;

end.
