unit UnitDocumentosDineroPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDocumentosDineroPendientes = class(TForm)
    btncancelar: TButton;
    btnaceptar: TButton;
    ZQDocumentosPendientes: TZQuery;
    DTSDocumentosPendientes: TDataSource;
    DBGrid1: TDBGrid;
    panelgrilla: TAdvPanel;
    lblpagado: TLabel;
    btnimputardocumentos: TButton;
    lblapagar: TLabel;
    ZQDocumentosPendientesdocumento_id: TIntegerField;
    ZQDocumentosPendientesdocumento_fecha: TDateField;
    ZQDocumentosPendientesdocumento_fechavenc: TDateField;
    ZQDocumentosPendientesdocumento_hora: TTimeField;
    ZQDocumentosPendientesdocumento_numero: TIntegerField;
    ZQDocumentosPendientesdocumento_total: TFloatField;
    ZQDocumentosPendientesdocumento_saldo: TFloatField;
    ZQDocumentosPendientesdocumento_pagado: TFloatField;
    ZQDocumentosPendientesdocumento_estado: TStringField;
    ZQDocumentosPendientesdocumento_neto21: TFloatField;
    ZQDocumentosPendientesdocumento_iva21: TFloatField;
    ZQDocumentosPendientesdocumento_neto105: TFloatField;
    ZQDocumentosPendientesdocumento_iva105: TFloatField;
    ZQDocumentosPendientesdocumento_neto27: TFloatField;
    ZQDocumentosPendientesdocumento_iva27: TFloatField;
    ZQDocumentosPendientesdocumento_observaciones: TStringField;
    ZQDocumentosPendientesdocumento_ivaret: TFloatField;
    ZQDocumentosPendientesdocumento_ivaperc: TFloatField;
    ZQDocumentosPendientesdocumento_dgrret: TFloatField;
    ZQDocumentosPendientesdocumento_dgrperc: TFloatField;
    ZQDocumentosPendientesdocumento_otrosimpuestos: TFloatField;
    ZQDocumentosPendientesdocumento_calidad: TStringField;
    ZQDocumentosPendientesdocumento_documentacion: TStringField;
    ZQDocumentosPendientestipodocu_id: TIntegerField;
    ZQDocumentosPendientesentidad_id: TIntegerField;
    ZQDocumentosPendientesentidadtransportista_id: TIntegerField;
    ZQDocumentosPendientesespecie_id: TIntegerField;
    ZQDocumentosPendientesdocumento_fechacumplimiento: TDateField;
    ZQDocumentosPendientesdocumento_moneda: TStringField;
    ZQDocumentosPendientesdocumento_preciounitario: TFloatField;
    ZQDocumentosPendientesdocumento_lugarentrega: TStringField;
    ZQDocumentosPendientesdocumento_tipooperacion: TStringField;
    ZQDocumentosPendientesdocumento_condicioncalidad: TStringField;
    ZQDocumentosPendientesdocumento_tipodestino: TStringField;
    ZQDocumentosPendientesdocumento_numerocartaporte: TIntegerField;
    ZQDocumentosPendientesdocumento_kgbrutos: TFloatField;
    ZQDocumentosPendientesdocumento_tara: TFloatField;
    ZQDocumentosPendientesentidaddadorcarga_id: TIntegerField;
    ZQDocumentosPendientesdocumento_chofer: TStringField;
    ZQDocumentosPendientesdocumento_chofercuit: TStringField;
    ZQDocumentosPendientesdocumento_transpchasis: TStringField;
    ZQDocumentosPendientesdocumento_transpacoplado: TStringField;
    ZQDocumentosPendientesdocumento_transptarifaflete: TFloatField;
    ZQDocumentosPendientesdocumento_transpanticipo: TFloatField;
    ZQDocumentosPendientesdocumento_cartaportetarifaflete: TFloatField;
    ZQDocumentosPendientesdocumento_nogravado: TFloatField;
    ZQDocumentosPendientestipodocu_id_1: TIntegerField;
    ZQDocumentosPendientestipodocu_nombre: TStringField;
    ZQDocumentosPendientestipodocu_tipo: TStringField;
    ZQDocumentosPendientestipodocu_caja: TIntegerField;
    ZQDocumentosPendientestipodocu_stock: TIntegerField;
    ZQDocumentosPendientestipodocu_iva: TIntegerField;
    ZQDocumentosPendientestipodocu_fiscal: TIntegerField;
    ZQDocumentosPendientestipodocu_ultimonumero: TIntegerField;
    ZQDocumentosPendientestipodocu_letra: TStringField;
    ZQDocumentosPendientestipodocu_debcred: TStringField;
    ZQDocumentosPendientestipodocu_preimpresos: TIntegerField;
    ZQDocumentosPendientestipodocu_impresora: TStringField;
    ZQDocumentosPendientestipodocu_copias: TIntegerField;
    ZQDocumentosPendientestipodocu_preview: TIntegerField;
    ZQDocumentosPendientestipodocu_prompt: TIntegerField;
    ZQDocumentosPendientestipodocu_ctacte: TIntegerField;
    ZQDocumentosPendientestipodocu_archivoimpresion: TStringField;
    ZQDocumentosPendientestipodocu_leyenda: TStringField;
    ZQDocumentosPendientestipodocu_nombreabrev: TStringField;
    ZQDocumentosPendientestipodocu_manual: TIntegerField;
    ZQDocumentosPendientespuntoventa_id: TIntegerField;
    ZQDocumentosPendientestipodocu_tipoctacte: TStringField;
    ZQDocumentosPendientespuntoventa_id_1: TIntegerField;
    ZQDocumentosPendientespuntoventa_numero: TIntegerField;
    ZQDocumentosPendientespuntoventa_descripcion: TStringField;
    ZQDocumentosPendientespuntoventa_controladorfiscalmodelo: TIntegerField;
    ZQDocumentosPendientespuntoventa_controladorfiscalpuerto: TIntegerField;
    ZQDocumentosPendientessucursal_id: TIntegerField;
    ZQDocumentosPendientesdocumentodoc_importe: TFloatField;
    ZQDocumentosPendientesdocumentosaldo: TFloatField;
    procedure ZQDocumentosPendientesBeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ZQDocumentosPendientesAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DTSDocumentosPendientesDataChange(Sender: TObject;
      Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    entidad_id:string;
    where_tipodocu:string;
    documento_pagado:real;
    documento_apagar:real;
    tipodocu_tipo:string;
    procedure ActivarConsulta;
  end;

var
  DocumentosDineroPendientes: TDocumentosDineroPendientes;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TDocumentosDineroPendientes.ActivarConsulta;
begin
    ZQDocumentosPendientes.Active:=false;
    ZQDocumentosPendientes.SQL.Clear;
    ZQDocumentosPendientes.SQL.Add('select *, 0.00 as documentodoc_importe, ');
    ZQDocumentosPendientes.SQL.Add('if(tiposdocumento.tipodocu_debcred="DEBITO",documentos.documento_saldo,documentos.documento_saldo*(-1)) as documentosaldo ');
    ZQDocumentosPendientes.SQL.Add('from documentos ');
    ZQDocumentosPendientes.SQL.Add('inner join tiposdocumento on documentos.tipodocu_id=tiposdocumento.tipodocu_id ');
    ZQDocumentosPendientes.SQL.Add('inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id ');
    ZQDocumentosPendientes.SQL.Add('where documento_estado="PENDIENTE" and documentos.entidad_id="'+entidad_id+'" ');
    ZQDocumentosPendientes.SQL.Add('and tiposdocumento.tipodocu_debcred<>"N/A" '+where_tipodocu+' and tipodocu_tipo="'+tipodocu_tipo+'" '+Princ.empresa_where);
    ZQDocumentosPendientes.Active:=true;

    ZQDocumentosPendientes.Active:=true;


end;

procedure TDocumentosDineroPendientes.Button1Click(Sender: TObject);
begin
    if documento_apagar>0 then
      begin
          ZQDocumentosPendientes.First;
          while not (ZQDocumentosPendientes.Eof) and (documento_apagar>0) do
              begin
                  if documento_apagar<ZQDocumentosPendientes.FieldByName('documentosaldo').AsFloat then
                    begin
                        ZQDocumentosPendientes.Edit;
                        ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat:=documento_apagar;
                        ZQDocumentosPendientes.Post;
                    end
                  else
                    begin
                        DBGrid1.OnEditButtonClick(self);
                    end;


                  documento_apagar:=documento_apagar-ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat;

                  ZQDocumentosPendientes.Next;
              end;

          if documento_apagar=0 then
            Self.ModalResult:=mrOk
          else
            Self.ModalResult:=mrRetry;

      end;

end;

procedure TDocumentosDineroPendientes.DBGrid1DblClick(Sender: TObject);
begin
    if ZQDocumentosPendientes.Active then
      begin
          if ZQDocumentosPendientes.RecordCount>0 then
            Princ.AbrirDocumento(ZQDocumentosPendientes.FieldByName('documento_id').AsString,ZQDocumentosPendientes.FieldByName('tipodocu_nombre').AsString,2);
      end;
end;

procedure TDocumentosDineroPendientes.DBGrid1EditButtonClick(Sender: TObject);
begin
    ZQDocumentosPendientes.Edit;
    if documento_apagar>0 then
      begin
          if documento_apagar-documento_pagado<ZQDocumentosPendientes.FieldByName('documentosaldo').AsFloat then
            ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat:=documento_apagar-documento_pagado
          else
            ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat:=ZQDocumentosPendientes.FieldByName('documentosaldo').AsFloat;
      end
    else
      ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat:=ZQDocumentosPendientes.FieldByName('documentosaldo').AsFloat;


    ZQDocumentosPendientes.Post;
end;

procedure TDocumentosDineroPendientes.DTSDocumentosPendientesDataChange(
  Sender: TObject; Field: TField);
begin
    lblpagado.Caption:='Total Pagado: '+floattostr(documento_pagado);
    lblapagar.Caption:='A pagar: '+floattostr(documento_apagar);
end;

procedure TDocumentosDineroPendientes.FormCreate(Sender: TObject);
begin
    documento_pagado:=0;
    where_tipodocu:=' and 1=1 ';
end;

procedure TDocumentosDineroPendientes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_F9:btnaceptar.Click;
    end;
end;

procedure TDocumentosDineroPendientes.FormShow(Sender: TObject);
begin
    DTSDocumentosPendientes.OnDataChange(Self,ZQDocumentosPendientes.FieldByName('documentodoc_importe'));
    btnimputardocumentos.Visible:=documento_apagar>0;
    lblapagar.Visible:=documento_apagar>0;
end;

procedure TDocumentosDineroPendientes.ZQDocumentosPendientesAfterPost(
  DataSet: TDataSet);
begin
    documento_pagado:=documento_pagado+ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat;
end;

procedure TDocumentosDineroPendientes.ZQDocumentosPendientesBeforePost(
  DataSet: TDataSet);
begin
    if (ZQDocumentosPendientes.FieldByName('documentosaldo').AsFloat<0) and (ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat>0) then
      ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat:=ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat*-1;

    if abs(ZQDocumentosPendientes.FieldByName('documentodoc_importe').AsFloat)>abs(ZQDocumentosPendientes.FieldByName('documentosaldo').AsFloat) then
      begin
          ZQDocumentosPendientes.Cancel;
      end
    else
      begin
          documento_pagado:=documento_pagado-ZQDocumentosPendientes.FieldByName('documentodoc_importe').CurValue;

      end;
    
end;

end.
