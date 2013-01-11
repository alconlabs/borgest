unit Unitemisionrecibos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ComCtrls, ExtCtrls,
  AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  Titles, MQuery, CustomizeGrid, rpalias, rpcompobase, rpvclreport;

type
  Temisionrecibos = class(TForm)
    panelgrilla: TAdvPanel;
    Label2: TLabel;
    Label4: TLabel;
    soliccuota_fechavenc: TDateTimePicker;
    vendedor_id: TSqlComboBox;
    btncancelar: TButton;
    btnactualizar: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ZQSolicitudcuotas: TZQuery;
    Label1: TLabel;
    tisolicitudcuotas: TTitles;
    CustomizeGrid1: TCustomizeGrid;
    Button1: TButton;
    VCLReport1: TVCLReport;
    RpAlias1: TRpAlias;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure CustomizeGrid1PaintRow(DS: TDataSet; var RowColor: TColor;
      var ChangeColor: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fecha_hoy:tdate;
    id:string;
  public
    { Public declarations }
  end;

var
  emisionrecibos: Temisionrecibos;

implementation

uses Unitprinc;

{$R *.dfm}

procedure Temisionrecibos.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Temisionrecibos.Button1Click(Sender: TObject);
begin
    VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'reportes\ventas\recibo_cobro.rep';


    VCLReport1.Report.Datainfo.Items[0].sql:=tisolicitudcuotas.Memo.Text;
//                                             'select * from solicitudcuotas '+
//                                             'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.solic_id '+
//                                             'inner join clientes on solicitudes.cliente_id=clientes.cliente_id '+
//                                             'inner join vendedores on clientes.vendedor_id=vendedores.vendedor_id '+
//                                             'where vendedores.vendedor_id="'+vendedor_id.codigo+'" and ';
  //  VCLReport1.Report.Datainfo.Items[0].sql:=VCLReport1.Report.Datainfo.Items[0].sql+' order by soliccuota_fechavenc';

    VCLReport1.Execute;
end;

procedure Temisionrecibos.CustomizeGrid1PaintRow(DS: TDataSet;
  var RowColor: TColor; var ChangeColor: Boolean);
begin

    if ds.FieldByName('soliccuota_fechavenc').AsDateTime<fecha_hoy then
      begin
          ChangeColor:=true;
          RowColor:=clred;
      end;

end;

procedure Temisionrecibos.btnactualizarClick(Sender: TObject);
begin
    tisolicitudcuotas.Memo.Text:='select * '+
                                 'from solicitudcuotas '+
                                 'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.solic_id '+
                                 'inner join clientes on solicitudes.cliente_id=clientes.cliente_id '+
                                 'where soliccuota_estado="PENDIENTE" and '+
                                 'soliccuota_fechavenc<="'+formatdatetime('yyyy-mm-dd',soliccuota_fechavenc.Date)+'"';

    if vendedor_id.codigo<>'-1' then
      begin
          tisolicitudcuotas.Memo.Text:=tisolicitudcuotas.Memo.Text+' and vendedores.vendedor_id="'+vendedor_id.codigo+'" ';


      end;

    ZQSolicitudcuotas.Active:=false;
    ZQSolicitudcuotas.SQL:=tisolicitudcuotas.Memo;
    ZQSolicitudcuotas.Active:=true;

end;

procedure Temisionrecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Temisionrecibos.FormCreate(Sender: TObject);
begin
    fecha_hoy:=Princ.fechaservidor;
    vendedor_id.llenarcombo;
    vendedor_id.Buscar('-1');
    soliccuota_fechavenc.Date:=Princ.fechaservidor;
    

end;

end.
