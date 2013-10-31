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
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select * from documentosventas '+
                       'inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                       'inner join docuvendetcomisionesvendedores on documentoventadetalles.documentoventadetalle_id=docuvendetcomisionesvendedores.documentoventadetalle_id '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'where tiposdocumento.tipodocu_nombre="'+TIPODOCU_NOTAPEDIDOCOMISIONES+'" and '+
                       'docuvendetcomisionesvendedores.personal_id="'+personal_id.codigo+'" ';
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
            MQDetalles.FieldByName('numero').AsString:=ZQSelect.FieldByName('documentoventa_equipo1').AsString;
            MQDetalles.FieldByName('importe').AsString:=ZQSelect.FieldByName('docuvendetcomisionvendedor_total').AsString;
            MQDetalles.FieldByName('tipodocu_nombre').AsString:=TIPODOCU_NOTAPEDIDOCOMISIONES;
            MQDetalles.Post;


            ZQSelect.Next;
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
