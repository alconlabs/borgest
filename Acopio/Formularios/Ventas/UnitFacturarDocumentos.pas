unit UnitFacturarDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids;

type
  TFacturarDocumentos = class(TABMbase)
    DBGrid1: TDBGrid;
    DSC: TDataSource;
    ZQDocumentoventadetalles: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DSCDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    tipodocu_id:string;
  end;

var
  FacturarDocumentos: TFacturarDocumentos;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TFacturarDocumentos.btnguardarClick(Sender: TObject);
begin
  inherited;
    if ZQSelect.Active then
      begin
          if ZQSelect.RecordCount>0 then
            begin
                ZQDocumentoventadetalles.First;
                while not ZQDocumentoventadetalles.Eof do
                    begin
                        ZQDocumentoventadetalles.Edit;
                        ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString:=ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString;
                        ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString:='0';
                        ZQDocumentoventadetalles.Post;

                        ZQDocumentoventadetalles.Next;
                    end;
                self.ModalResult:=mrOk;
            end;
      end;
end;

procedure TFacturarDocumentos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
    if ZQSelect.Active then
      begin
          if ZQSelect.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQSelect.FieldByName('documentoventa_id').AsString,ZQSelect.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TFacturarDocumentos.DSCDataChange(Sender: TObject; Field: TField);
begin
  inherited;
    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.ParamByName('documentoventa_id').AsString:=ZQSelect.FieldByName('documentoventa_id').AsString;
    ZQDocumentoventadetalles.Active:=true;

end;

procedure TFacturarDocumentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;

end;

procedure TFacturarDocumentos.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('tipodocu_id').AsString:=tipodocu_id;
    ZQSelect.Active:=true;
end;

end.
