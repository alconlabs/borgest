unit UnitDocumentosVentasPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDocumentosVentasPendientes = class(TForm)
    btncancelar: TButton;
    btnaceptar: TButton;
    ZQDocumentosVentasPendientes: TZQuery;
    DTSDocumentosVentasPendientes: TDataSource;
    DBGrid1: TDBGrid;
    ZQDocumentosVentasPendientesdocumentoventa_id: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventa_numero: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventa_fecha: TDateField;
    ZQDocumentosVentasPendientesdocumentoventa_hora: TTimeField;
    ZQDocumentosVentasPendientesdocumentoventa_neto21: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_iva21: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_neto105: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_iva105: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_netonogravado: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_total: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_estado: TStringField;
    ZQDocumentosVentasPendientesdocumentoventa_pagado: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_saldo: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_observacion: TStringField;
    ZQDocumentosVentasPendientescliente_id: TIntegerField;
    ZQDocumentosVentasPendientespersonal_id: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_id: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventa_condicionventa: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventa_fechavenc: TDateField;
    ZQDocumentosVentasPendientesdocumentoventa_listaprecio: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_id_1: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_nombre: TStringField;
    ZQDocumentosVentasPendientestipodocu_tipo: TStringField;
    ZQDocumentosVentasPendientestipodocu_caja: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_stock: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_iva: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_fiscal: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_ultimonumero: TIntegerField;
    ZQDocumentosVentasPendientespuntoventa_id: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_letra: TStringField;
    ZQDocumentosVentasPendientespuntoventa_id_1: TIntegerField;
    ZQDocumentosVentasPendientespuntoventa_numero: TIntegerField;
    ZQDocumentosVentasPendientespuntoventa_descripcion: TStringField;
    ZQDocumentosVentasPendientessucursal_id: TIntegerField;
    panelgrilla: TAdvPanel;
    ZQDocumentosVentasPendientestipodocu_debcred: TStringField;
    ZQDocumentosVentasPendientesdocumentoventadoc_importe: TFloatField;
    lblpagado: TLabel;
    btnimputardocumentos: TButton;
    lblapagar: TLabel;
    procedure ZQDocumentosVentasPendientesBeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ZQDocumentosVentasPendientesAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DTSDocumentosVentasPendientesDataChange(Sender: TObject;
      Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    cliente_id:string;
    documentoventa_pagado:real;
    documentoventa_apagar:real;
    procedure ActivarConsulta;
  end;

var
  DocumentosVentasPendientes: TDocumentosVentasPendientes;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TDocumentosVentasPendientes.ActivarConsulta;
begin
    ZQDocumentosVentasPendientes.Active:=false;
    ZQDocumentosVentasPendientes.SQL.Clear;
    ZQDocumentosVentasPendientes.SQL.Add('select *, 0.00 as documentoventadoc_importe ');
    ZQDocumentosVentasPendientes.SQL.Add('from documentosventas ');
    ZQDocumentosVentasPendientes.SQL.Add('inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id ');
    ZQDocumentosVentasPendientes.SQL.Add('inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id ');
    ZQDocumentosVentasPendientes.SQL.Add('where documentoventa_estado="PENDIENTE" and documentosventas.cliente_id="'+cliente_id+'" ');
    ZQDocumentosVentasPendientes.SQL.Add('and tiposdocumento.tipodocu_debcred<>"N/A" '+Princ.empresa_where);
    ZQDocumentosVentasPendientes.Active:=true;

    ZQDocumentosVentasPendientes.Active:=true;



end;

procedure TDocumentosVentasPendientes.Button1Click(Sender: TObject);
begin
    if documentoventa_apagar>0 then
      begin
          ZQDocumentosVentasPendientes.First;
          while not (ZQDocumentosVentasPendientes.Eof) and (documentoventa_apagar>0) do
              begin
                  if documentoventa_apagar<ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat then
                    begin
                        ZQDocumentosVentasPendientes.Edit;
                        ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat:=documentoventa_apagar;
                        ZQDocumentosVentasPendientes.Post;
                    end
                  else
                    begin
                        DBGrid1.OnEditButtonClick(self);
                    end;


                  documentoventa_apagar:=documentoventa_apagar-ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat;

                  ZQDocumentosVentasPendientes.Next;
              end;

          if documentoventa_apagar=0 then
            Self.ModalResult:=mrOk
          else
            Self.ModalResult:=mrRetry;

      end;

end;

procedure TDocumentosVentasPendientes.DBGrid1DblClick(Sender: TObject);
begin
    if ZQDocumentosVentasPendientes.Active then
      begin
          if ZQDocumentosVentasPendientes.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQDocumentosVentasPendientes.FieldByName('documentoventa_id').AsString,ZQDocumentosVentasPendientes.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TDocumentosVentasPendientes.DBGrid1EditButtonClick(Sender: TObject);
begin
    ZQDocumentosVentasPendientes.Edit;
    ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat:=ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat;
    ZQDocumentosVentasPendientes.Post;
end;

procedure TDocumentosVentasPendientes.DTSDocumentosVentasPendientesDataChange(
  Sender: TObject; Field: TField);
begin
    lblpagado.Caption:='Total Pagado: '+floattostr(documentoventa_pagado);
    lblapagar.Caption:='A pagar: '+floattostr(documentoventa_apagar);
end;

procedure TDocumentosVentasPendientes.FormCreate(Sender: TObject);
begin
    documentoventa_pagado:=0;
end;

procedure TDocumentosVentasPendientes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_F9:btnaceptar.Click;
    end;
end;

procedure TDocumentosVentasPendientes.FormShow(Sender: TObject);
begin
    DTSDocumentosVentasPendientes.OnDataChange(Self,ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe'));
    btnimputardocumentos.Visible:=documentoventa_apagar>0;
    lblapagar.Visible:=documentoventa_apagar>0;
end;

procedure TDocumentosVentasPendientes.ZQDocumentosVentasPendientesAfterPost(
  DataSet: TDataSet);
begin
    documentoventa_pagado:=documentoventa_pagado+ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat;
end;

procedure TDocumentosVentasPendientes.ZQDocumentosVentasPendientesBeforePost(
  DataSet: TDataSet);
begin
    if ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat>ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat then
      begin
          ZQDocumentosVentasPendientes.Cancel;
//          ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').AsFloat:=ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat;
      end
    else
      begin
          documentoventa_pagado:=documentoventa_pagado-ZQDocumentosVentasPendientes.FieldByName('documentoventadoc_importe').CurValue;

      end;
    
end;

end.
