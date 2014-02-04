unit UnitDocumentosComprasPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Math;

type
  TDocumentosComprasPendientes = class(TForm)
    btncancelar: TButton;
    btnaceptar: TButton;
    ZQDocumentosComprasPendientes: TZQuery;
    DTSDocumentosComprasPendientes: TDataSource;
    DBGrid1: TDBGrid;
    panelgrilla: TAdvPanel;
    lblpagado: TLabel;
    btnimputardocumentos: TButton;
    lblapagar: TLabel;
    ZQDocumentosComprasPendientesdocumentocompra_id: TIntegerField;
    ZQDocumentosComprasPendientesdocumentocompra_numero: TIntegerField;
    ZQDocumentosComprasPendientesdocumentocompra_fecha: TDateField;
    ZQDocumentosComprasPendientesdocumentocompra_hora: TTimeField;
    ZQDocumentosComprasPendientesdocumentocompra_total: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_estado: TStringField;
    ZQDocumentosComprasPendientesdocumentocompra_pagado: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_saldo: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_observacion: TStringField;
    ZQDocumentosComprasPendientesdocumentocompra_condicionventa: TIntegerField;
    ZQDocumentosComprasPendientesdocumentocompra_fechavenc: TDateField;
    ZQDocumentosComprasPendientespersonal_id: TIntegerField;
    ZQDocumentosComprasPendientesproveedor_id: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_id: TIntegerField;
    ZQDocumentosComprasPendientesdocumentocompra_neto21: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_iva21: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_neto105: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_iva105: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_otrosimpuestos: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_puntoventa: TIntegerField;
    ZQDocumentosComprasPendientesdocumentocompra_neto27: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_iva27: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_nogravado: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_tishhperc: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_ivaret: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_ivaperc: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_dgrret: TFloatField;
    ZQDocumentosComprasPendientesdocumentocompra_dgrperc: TFloatField;
    ZQDocumentosComprasPendientestipodocu_id_1: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_nombre: TStringField;
    ZQDocumentosComprasPendientestipodocu_tipo: TStringField;
    ZQDocumentosComprasPendientestipodocu_caja: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_stock: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_iva: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_fiscal: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_ultimonumero: TIntegerField;
    ZQDocumentosComprasPendientespuntoventa_id: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_letra: TStringField;
    ZQDocumentosComprasPendientestipodocu_debcred: TStringField;
    ZQDocumentosComprasPendientestipodocufiscal_id: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_preimpresos: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_impresora: TStringField;
    ZQDocumentosComprasPendientestipodocu_copias: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_preview: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_prompt: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_ctacte: TIntegerField;
    ZQDocumentosComprasPendientestipodocu_archivoimpresion: TStringField;
    ZQDocumentosComprasPendientestipodocu_leyenda: TStringField;
    ZQDocumentosComprasPendientestipodocu_nombreabrev: TStringField;
    ZQDocumentosComprasPendientestipodocu_manual: TIntegerField;
    ZQDocumentosComprasPendientespuntoventa_id_1: TIntegerField;
    ZQDocumentosComprasPendientespuntoventa_numero: TIntegerField;
    ZQDocumentosComprasPendientespuntoventa_descripcion: TStringField;
    ZQDocumentosComprasPendientessucursal_id: TIntegerField;
    ZQDocumentosComprasPendientespuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQDocumentosComprasPendientespuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQDocumentosComprasPendientesdocumentocompradoc_importe: TFloatField;
    ZQDocumentosComprasPendientesdocumentocomprasaldo: TFloatField;
    procedure ZQDocumentosComprasPendientesBeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ZQDocumentosComprasPendientesAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DTSDocumentosComprasPendientesDataChange(Sender: TObject;
      Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    proveedor_id:string;
    where_tipodocu:string;
    documentocompra_pagado:real;
    documentocompra_apagar:real;
    procedure ActivarConsulta;
  end;

var
  DocumentosComprasPendientes: TDocumentosComprasPendientes;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TDocumentosComprasPendientes.ActivarConsulta;
begin
    ZQDocumentoscomprasPendientes.Active:=false;
    ZQDocumentoscomprasPendientes.SQL.Clear;
    ZQDocumentoscomprasPendientes.SQL.Add('select *, 0.00 as documentocompradoc_importe, ');
    ZQDocumentoscomprasPendientes.SQL.Add('if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompras.documentocompra_saldo,documentoscompras.documentocompra_saldo*(-1)) as documentocomprasaldo ');
    ZQDocumentoscomprasPendientes.SQL.Add('from documentoscompras ');
    ZQDocumentoscomprasPendientes.SQL.Add('inner join tiposdocumento on documentoscompras.tipodocu_id=tiposdocumento.tipodocu_id ');
    ZQDocumentoscomprasPendientes.SQL.Add('inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id ');
    ZQDocumentoscomprasPendientes.SQL.Add('where documentocompra_estado="PENDIENTE" and documentoscompras.proveedor_id="'+proveedor_id+'" ');
    ZQDocumentoscomprasPendientes.SQL.Add('and tiposdocumento.tipodocu_debcred<>"N/A" '+where_tipodocu+Princ.empresa_where);
    ZQDocumentoscomprasPendientes.Active:=true;

    ZQDocumentoscomprasPendientes.Active:=true;



end;

procedure TDocumentosComprasPendientes.Button1Click(Sender: TObject);
begin
    if documentocompra_apagar>0 then
      begin
          ZQDocumentoscomprasPendientes.First;
          while not (ZQDocumentoscomprasPendientes.Eof) and (documentocompra_apagar>0) do
              begin
                  if documentocompra_apagar<ZQDocumentoscomprasPendientes.FieldByName('documentocomprasaldo').AsFloat then
                    begin
                        ZQDocumentoscomprasPendientes.Edit;
                        ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=roundto(documentocompra_apagar,-2);
                        ZQDocumentoscomprasPendientes.Post;
                    end
                  else
                    begin
                        DBGrid1.OnEditButtonClick(self);
                    end;


                  documentocompra_apagar:=roundto(documentocompra_apagar-ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat,-2);

                  ZQDocumentoscomprasPendientes.Next;
              end;

          if documentocompra_apagar=0 then
            Self.ModalResult:=mrOk
          else
            Self.ModalResult:=mrRetry;

      end;

end;

procedure TDocumentosComprasPendientes.DBGrid1DblClick(Sender: TObject);
begin
    if ZQDocumentoscomprasPendientes.Active then
      begin
          if ZQDocumentoscomprasPendientes.RecordCount>0 then
            Princ.AbrirDocumentocompra(ZQDocumentoscomprasPendientes.FieldByName('documentocompra_id').AsString,ZQDocumentoscomprasPendientes.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TDocumentosComprasPendientes.DBGrid1EditButtonClick(Sender: TObject);
begin
    ZQDocumentoscomprasPendientes.Edit;
    if documentocompra_apagar>0 then
      begin
          if documentocompra_apagar-documentocompra_pagado<ZQDocumentoscomprasPendientes.FieldByName('documentocomprasaldo').AsFloat then
            ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=documentocompra_apagar-documentocompra_pagado
          else
            ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=roundto(ZQDocumentoscomprasPendientes.FieldByName('documentocomprasaldo').AsFloat,-2);
      end
    else
      ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=roundto(ZQDocumentoscomprasPendientes.FieldByName('documentocomprasaldo').AsFloat,-2);


    ZQDocumentoscomprasPendientes.Post;
end;

procedure TDocumentosComprasPendientes.DTSDocumentosComprasPendientesDataChange(
  Sender: TObject; Field: TField);
begin
    lblpagado.Caption:='Total Pagado: '+floattostr(documentocompra_pagado);
    lblapagar.Caption:='A pagar: '+floattostr(documentocompra_apagar);
end;

procedure TDocumentosComprasPendientes.FormCreate(Sender: TObject);
begin
    documentocompra_pagado:=0;
    where_tipodocu:=' and 1=1 ';
end;

procedure TDocumentosComprasPendientes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    case key of
        VK_F9:btnaceptar.Click;
    end;
end;

procedure TDocumentosComprasPendientes.FormShow(Sender: TObject);
begin
    DTSDocumentoscomprasPendientes.OnDataChange(Self,ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe'));
    btnimputardocumentos.Visible:=documentocompra_apagar>0;
    lblapagar.Visible:=documentocompra_apagar>0;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure TDocumentosComprasPendientes.ZQDocumentosComprasPendientesAfterPost(
  DataSet: TDataSet);
begin
    documentocompra_pagado:=roundto(documentocompra_pagado+ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat,-2);
end;

procedure TDocumentosComprasPendientes.ZQDocumentosComprasPendientesBeforePost(
  DataSet: TDataSet);
begin
    if (ZQDocumentoscomprasPendientes.FieldByName('documentocomprasaldo').AsFloat<0) and (ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat>0) then
      ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=roundto(ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat*-1,-2);

    if abs(ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat)>abs(ZQDocumentoscomprasPendientes.FieldByName('documentocomprasaldo').AsFloat) then
      begin
          ZQDocumentoscomprasPendientes.Cancel;
//          ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').AsFloat:=ZQDocumentoscomprasPendientes.FieldByName('documentocompra_saldo').AsFloat;
      end
    else
      begin
          documentocompra_pagado:=roundto(documentocompra_pagado-ZQDocumentoscomprasPendientes.FieldByName('documentocompradoc_importe').CurValue,-2);

      end;
    
end;

end.
