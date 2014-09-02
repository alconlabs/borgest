unit UnitOrdenServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdocumentoventabase, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, GTBMemo, MoneyEdit, Grids, DBGrids, UnitSqlComboBox,
  ComCtrls, ExtCtrls, AdvPanel;

type
  Tordenservicio = class(Tdocumentoventabase)
    Label14: TLabel;
    documentoventa_solicitudcliente: TGTBMemo;
    documentoventa_trabajorealizado: TGTBMemo;
    Label16: TLabel;
    Label17: TLabel;
    btnimprimir: TButton;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure modificar1;
  public
    { Public declarations }
  end;

var
  ordenservicio: Tordenservicio;

implementation

uses Unitprinc;

{$R *.dfm}

procedure Tordenservicio.btnguardarClick(Sender: TObject);
begin
  inherited;
    if (abm=1) or (abm=2) then
      begin
          Modificar1;

          MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

          if Princ.buscar('select tipodocu_preimpresos from tiposdocumento where tipodocu_id="'+tipodocu_id.codigo+'"','tipodocu_preimpresos')='-1' then
            begin
                if (MessageDlg('Desea imprimir el comprobante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                      imprimir;

                  end;

            end;

      end;

    if abm=3 then
      begin
          if eliminado then
            MessageDlg('Los datos fueron borrados correctamente.', mtInformation, [mbOK], 0);

      end;

    if limpiar_al_guardar then
      begin
          Self.OnShow(self);
      end
    else
      begin
          Self.Close;
      end;

end;

procedure Tordenservicio.btnimprimirClick(Sender: TObject);
var
  tipodocu_archivoimpresion:string;
begin
    tipodocu_archivoimpresion:=Princ.GetConfigTipoDocumento(id,'','tipodocu_archivoimpresion');

    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+tipodocu_archivoimpresion;
    Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from documentosventas '+
                                             'left join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id '+
                                             'inner join clientes on documentosventas.cliente_id=clientes.cliente_id '+
                                             'left join clientevehiculo on clientes.cliente_id=clientevehiculo.cliente_id '+
                                             'where documentosventas.documentoventa_id="'+id+'"';


    Princ.VCLReport1.Execute;
end;

procedure Tordenservicio.FormShow(Sender: TObject);
begin
  inherited;
    btnimprimir.Visible:=abm<>1;
    if abm=1 then
    begin
        documentoventa_solicitudcliente.Text:='';
        documentoventa_trabajorealizado.Text:='';
    end
  else
    begin
        documentoventa_solicitudcliente.Text:=ZQuery2.FieldByName('documentoventa_solicitudcliente').AsString;
        documentoventa_trabajorealizado.Text:=ZQuery2.FieldByName('documentoventa_trabajorealizado').AsString;
    end;
end;

procedure Tordenservicio.modificar1;
begin
    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('begin');
    ZQExecSql.ExecSQL;

    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('update documentosventas set');
    ZQExecSql.SQL.Add('documentoventa_solicitudcliente=:documentoventa_solicitudcliente, ');
    ZQExecSql.SQL.Add('documentoventa_trabajorealizado=:documentoventa_trabajorealizado ');
    ZQExecSql.SQL.Add('where documentoventa_id=:documentoventa_id');
    ZQExecSql.ParamByName('documentoventa_solicitudcliente').AsString:=documentoventa_solicitudcliente.Text;
    ZQExecSql.ParamByName('documentoventa_trabajorealizado').AsString:=documentoventa_trabajorealizado.Text;
    ZQExecSql.ParamByName('documentoventa_id').AsString:=id;
    ZQExecSql.ExecSQL;


    ZQExecSql.SQL.Clear;
    ZQExecSql.SQL.Add('commit');
    ZQExecSql.ExecSQL;


end;

end.
