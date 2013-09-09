unit UnitDetallePagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, Grids, DBGrids, GTBMemo,
  UnitSqlComboBox;

type
  TDetallePagos = class(TABMbase)
    Label18: TLabel;
    documentoventa_nrodetallepago: TEdit;
    Label2: TLabel;
    documentoventa_fecha: TDateTimePicker;
    DBGrid2: TDBGrid;
    Label13: TLabel;
    btnbuscar: TButton;
    DTSPagos: TDataSource;
    Label1: TLabel;
    documentoventa_observacion: TGTBMemo;
    Label11: TLabel;
    sucursal_id: TSqlComboBox;
    procedure btnbuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DetallePagos: TDetallePagos;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TDetallePagos.btnbuscarClick(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select * from documentosventas '+
                       'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                       'where documentosventas.documentoventa_nrodetallepago="'+documentoventa_nrodetallepago.Text+'" and '+
                       'sucursal_id="'+ sucursal_id.codigo +'" '+Princ.empresa_where;

    ZQSelect.Active:=true;
end;

procedure TDetallePagos.btnguardarClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'consulta_detalle_pagos.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id '+
                                             'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'where documentosventas.documentoventa_nrodetallepago="'+documentoventa_nrodetallepago.Text+'" and '+
                                             'sucursal_id="'+ sucursal_id.codigo +'" '+Princ.empresa_where;

    Princ.VCLReport1.Report.Params.ParamByName('fecha').Value:=documentoventa_fecha.Date;
    Princ.VCLReport1.Report.Params.ParamByName('observaciones').AsString:=documentoventa_observacion.Lines.Text;
    Princ.VCLReport1.Report.Params.ParamByName('documentoventa_nrodetallepago').AsString:=documentoventa_nrodetallepago.Text;
    Princ.VCLReport1.Report.Params.ParamByName('sucursal_nombre').AsString:=sucursal_id.Text;



    Princ.VCLReport1.Execute;
end;

procedure TDetallePagos.FormCreate(Sender: TObject);
begin
  inherited;
    documentoventa_fecha.Date:=Date;
    sucursal_id.llenarcombo;
    sucursal_id.ItemIndex:=0;
end;

end.
