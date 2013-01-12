unit UnitDetallePagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, Grids, DBGrids, GTBMemo;

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
    ZQSelect.ParamByName('documentoventa_nrodetallepago').AsString:=documentoventa_nrodetallepago.Text;
    ZQSelect.Active:=true;
end;

procedure TDetallePagos.btnguardarClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=ExtractFilePath(Application.ExeName)+'\reportes\consulta_detalle_pagos.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select documentopagos.*, tipopago_nombre from documentopagos '+
                                             'inner join tipospago on documentopagos.tipopago_id=tipospago.tipopago_id '+
                                             'inner join documentosventas on documentopagos.documentoventa_id=documentosventas.documentoventa_id '+
                                             'where documentosventas.documentoventa_nrodetallepago="'+documentoventa_nrodetallepago.Text+'"';

    Princ.VCLReport1.Report.Params.ParamByName('fecha').Value:=documentoventa_fecha.Date;
    Princ.VCLReport1.Report.Params.ParamByName('observaciones').AsString:=documentoventa_observacion.Text;



    Princ.VCLReport1.Execute;
end;

procedure TDetallePagos.FormCreate(Sender: TObject);
begin
  inherited;
    documentoventa_fecha.Date:=Date;
end;

end.
