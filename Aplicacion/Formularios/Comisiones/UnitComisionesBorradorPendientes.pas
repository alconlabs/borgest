unit UnitComisionesBorradorPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MoneyEdit, StdCtrls, Grids, DBGrids, UnitSqlComboBox, ComCtrls,
  ExtCtrls, AdvPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Math;

type
  TComisionesBorradorPendientes = class(TForm)
    btncancelar: TButton;
    btnaceptar: TButton;
    ZQDocumentosVentasPendientes: TZQuery;
    DTSDocumentosVentasPendientes: TDataSource;
    DBGrid1: TDBGrid;
    panelgrilla: TAdvPanel;
    lblpagado: TLabel;
    btnimputardocumentos: TButton;
    lblapagar: TLabel;
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
    ZQDocumentosVentasPendientesdocumentoventa_equipo1: TStringField;
    ZQDocumentosVentasPendientesdocumentoventa_equipo2: TStringField;
    ZQDocumentosVentasPendientesdocumentoventa_formapago: TStringField;
    ZQDocumentosVentasPendientesdocumentoventa_nrodetallepago: TStringField;
    ZQDocumentosVentasPendientesdocumentoventa_solicitudcliente: TStringField;
    ZQDocumentosVentasPendientesdocumentoventa_trabajorealizado: TStringField;
    ZQDocumentosVentasPendientescaja_id: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventa_recargo: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_descuento: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_id: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_descripcion: TStringField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_cantidad: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_precio: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_total: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_neto21: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_iva21: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_neto105: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_iva105: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_nogravado: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_estado: TStringField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_observacion: TStringField;
    ZQDocumentosVentasPendientesproducto_id: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_idorig: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventa_id_1: TIntegerField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_importe1: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_importe2: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_importe3: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_importe4: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_importe5: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_importe6: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_listaprecio: TIntegerField;
    ZQDocumentosVentasPendientesproducto_tipo: TStringField;
    ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_id: TIntegerField;
    ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_importeunit: TFloatField;
    ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_total: TFloatField;
    ZQDocumentosVentasPendientesdocumentoventadetalle_id_1: TIntegerField;
    ZQDocumentosVentasPendientespersonal_id_1: TIntegerField;
    ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_saldo: TFloatField;
    ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_pagado: TFloatField;
    ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_estado: TStringField;
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
    ZQDocumentosVentasPendientestipodocu_debcred: TStringField;
    ZQDocumentosVentasPendientestipodocufiscal_id: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_preimpresos: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_impresora: TStringField;
    ZQDocumentosVentasPendientestipodocu_copias: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_preview: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_prompt: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_ctacte: TIntegerField;
    ZQDocumentosVentasPendientestipodocu_archivoimpresion: TStringField;
    ZQDocumentosVentasPendientestipodocu_leyenda: TStringField;
    ZQDocumentosVentasPendientestipodocu_nombreabrev: TStringField;
    ZQDocumentosVentasPendientestipodocu_manual: TIntegerField;
    ZQDocumentosVentasPendientesliquidacionborradordetalle_importe: TFloatField;
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
    personal_id:string;
    where_tipodocu:string;
    documentoventa_pagado:real;
    documentoventa_apagar:real;
    procedure ActivarConsulta;
  end;

var
  ComisionesBorradorPendientes: TComisionesBorradorPendientes;

implementation

Uses Unitprinc;

{$R *.dfm}


procedure TComisionesBorradorPendientes.ActivarConsulta;
begin
    ZQDocumentosVentasPendientes.Active:=false;
    ZQDocumentosVentasPendientes.SQL.Clear;
    ZQDocumentosVentasPendientes.SQL.Add('select *, 0.00 as liquidacionborradordetalle_importe from documentosventas ');
    ZQDocumentosVentasPendientes.SQL.Add('inner join documentoventadetalles on documentosventas.documentoventa_id=documentoventadetalles.documentoventa_id ');
    ZQDocumentosVentasPendientes.SQL.Add('inner join docuvendetcomisionesvendedores on documentoventadetalles.documentoventadetalle_id=docuvendetcomisionesvendedores.documentoventadetalle_id ');
    ZQDocumentosVentasPendientes.SQL.Add('inner join tiposdocumento on documentosventas.tipodocu_id=tiposdocumento.tipodocu_id ');
    ZQDocumentosVentasPendientes.SQL.Add('where documentoventa_estado<>"ANULADA" and docuvendetcomisionesvendedores.personal_id="'+personal_id+'" ');
    ZQDocumentosVentasPendientes.SQL.Add('and docuvendetcomisionesvendedores.docuvendetcomisionvendedor_estado="PENDIENTE"');
    ZQDocumentosVentasPendientes.Active:=true;

    ZQDocumentosVentasPendientes.Active:=true;


        
end;

procedure TComisionesBorradorPendientes.Button1Click(Sender: TObject);
begin
    if documentoventa_apagar>0 then
      begin
          ZQDocumentosVentasPendientes.First;
          while not (ZQDocumentosVentasPendientes.Eof) and (documentoventa_apagar>0) do
              begin
                  if documentoventa_apagar<ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat then
                    begin
                        ZQDocumentosVentasPendientes.Edit;
                        ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat:=roundto(documentoventa_apagar,-2);
                        ZQDocumentosVentasPendientes.Post;
                    end
                  else
                    begin
                        DBGrid1.OnEditButtonClick(self);
                    end;


                  documentoventa_apagar:=roundto(documentoventa_apagar-ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2);

                  ZQDocumentosVentasPendientes.Next;
              end;

          if documentoventa_apagar=0 then
            Self.ModalResult:=mrOk
          else
            Self.ModalResult:=mrRetry;

      end;

end;

procedure TComisionesBorradorPendientes.DBGrid1DblClick(Sender: TObject);
begin
    if ZQDocumentosVentasPendientes.Active then
      begin
          if ZQDocumentosVentasPendientes.RecordCount>0 then
            Princ.AbrirDocumentoVenta(ZQDocumentosVentasPendientes.FieldByName('documentoventa_id').AsString,ZQDocumentosVentasPendientes.FieldByName('tipodocu_nombre').AsString,ABM_VER);
      end;
end;

procedure TComisionesBorradorPendientes.DBGrid1EditButtonClick(Sender: TObject);
begin
    ZQDocumentosVentasPendientes.Edit;
    if documentoventa_apagar>0 then
      begin
          if documentoventa_apagar-documentoventa_pagado<ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat then
            ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat:=documentoventa_apagar-documentoventa_pagado
          else
            ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat:=roundto(ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat,-2);
      end
    else
      ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat:=roundto(ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat,-2);


    ZQDocumentosVentasPendientes.Post;
end;

procedure TComisionesBorradorPendientes.DTSDocumentosVentasPendientesDataChange(
  Sender: TObject; Field: TField);
begin
    lblpagado.Caption:='Total Pagado: '+floattostr(documentoventa_pagado);
    lblapagar.Caption:='A pagar: '+floattostr(documentoventa_apagar);
end;

procedure TComisionesBorradorPendientes.FormCreate(Sender: TObject);
begin
    documentoventa_pagado:=0;
    where_tipodocu:=' and 1=1 ';
end;

procedure TComisionesBorradorPendientes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case key of
        VK_F9:btnaceptar.Click;
    end;
end;

procedure TComisionesBorradorPendientes.FormShow(Sender: TObject);
begin
    DTSDocumentosVentasPendientes.OnDataChange(Self,ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe'));
    btnimputardocumentos.Visible:=documentoventa_apagar>0;
    lblapagar.Visible:=documentoventa_apagar>0;
end;

procedure TComisionesBorradorPendientes.ZQDocumentosVentasPendientesAfterPost(
  DataSet: TDataSet);
begin
    documentoventa_pagado:=roundto(documentoventa_pagado+ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2);
end;

procedure TComisionesBorradorPendientes.ZQDocumentosVentasPendientesBeforePost(
  DataSet: TDataSet);
begin
    if (ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat<0) and (ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat>0) then
      ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat:=roundto(ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat*-1,-2);

    if abs(roundto(ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat,-2))>abs(roundto(ZQDocumentosVentasPendientes.FieldByName('docuvendetcomisionvendedor_saldo').AsFloat,-2)) then
      begin
          ZQDocumentosVentasPendientes.Cancel;
//          ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').AsFloat:=ZQDocumentosVentasPendientes.FieldByName('documentoventa_saldo').AsFloat;
      end
    else
      begin
          documentoventa_pagado:=roundto(documentoventa_pagado-ZQDocumentosVentasPendientes.FieldByName('liquidacionborradordetalle_importe').CurValue,-2);

      end;
    
end;

end.
