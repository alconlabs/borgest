unit Unitconsultarvencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ComCtrls, ExtCtrls,
  AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  Titles, MQuery, CustomizeGrid, rpalias, rpcompobase, rpvclreport;

type
  Tconsultarvencidos = class(TForm)
    panelgrilla: TAdvPanel;
    Label2: TLabel;
    soliccuota_fechavenc: TDateTimePicker;
    cliente_id: TSqlComboBox;
    btncancelar: TButton;
    btnactualizar: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ZQSolicitudcuotas: TZQuery;
    tisolicitudcuotas: TTitles;
    Button1: TButton;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fecha_hoy:tdate;
    id:string;
  public
    { Public declarations }
  end;

var
  consultarvencidos: Tconsultarvencidos;

implementation

uses Unitprinc, Unitsolicitudesmodificar;

{$R *.dfm}

procedure Tconsultarvencidos.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Tconsultarvencidos.Button1Click(Sender: TObject);
begin
    try
      solicitudesmodificar:=Tsolicitudesmodificar.Create(self);
    finally
      solicitudesmodificar.id:=ZQSolicitudcuotas.FieldByName('solic_id').AsString;
      solicitudesmodificar.Show;
    end;
end;

procedure Tconsultarvencidos.btnactualizarClick(Sender: TObject);
begin
    tisolicitudcuotas.Memo.Text:='select *, sum(soliccuota_pago) as pago, sum(soliccuota_saldo) as saldo, min(soliccuota_fechavenc) as venc '+
                                 'from solicitudcuotas '+
                                 'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.solic_id '+
                                 'inner join clientes on solicitudes.cliente_id=clientes.cliente_id '+
                                 'where soliccuota_estado="PENDIENTE" and '+
                                 'soliccuota_fechavenc<"'+formatdatetime('yyyy-mm-dd',soliccuota_fechavenc.Date)+'" and '+
                                 'solic_estadovencimiento="NORMAL" ';


    if cliente_id.codigo<>'-1' then
      begin
          tisolicitudcuotas.Memo.Text:=tisolicitudcuotas.Memo.Text+' and clientes.cliente_id="'+cliente_id.codigo+'" ';

      end;

    tisolicitudcuotas.Memo.Text:=tisolicitudcuotas.Memo.Text+'group by solicitudes.solic_id';


    ZQSolicitudcuotas.Active:=false;
    ZQSolicitudcuotas.SQL:=tisolicitudcuotas.Memo;
    ZQSolicitudcuotas.Active:=true;

end;

procedure Tconsultarvencidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tconsultarvencidos.FormCreate(Sender: TObject);
begin
    fecha_hoy:=Princ.fechaservidor;
    cliente_id.llenarcombo;
    cliente_id.Buscar('-1');
    soliccuota_fechavenc.Date:=Princ.fechaservidor;
    

end;

end.
