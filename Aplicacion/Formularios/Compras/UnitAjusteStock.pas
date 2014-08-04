unit UnitAjusteStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, StdCtrls, UnitSqlComboBox, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, GTBMemo,
  Grids, DBGrids;

type
  TAjusteStock = class(TABMbase)
    Label15: TLabel;
    ajustestock_id: TEdit;
    Label2: TLabel;
    ajustestock_fecha: TDateTimePicker;
    Label4: TLabel;
    personal_id: TSqlComboBox;
    DBGrid1: TDBGrid;
    btnagregar: TButton;
    btnmodificar: TButton;
    btnquitar: TButton;
    Label13: TLabel;
    ajustestock_observaciones: TGTBMemo;
    ZQajustestockdetalles: TZQuery;
    DTSajustestockdetalles: TDataSource;
    ZQajustestockdetallesajustestockdetalle_id: TIntegerField;
    ZQajustestockdetallesajustestockdetalle_cantidad: TFloatField;
    ZQajustestockdetallesajustestock_id: TIntegerField;
    ZQajustestockdetallesproducto_id: TIntegerField;
    ZQajustestockdetallesproducto_id_1: TIntegerField;
    ZQajustestockdetallesproducto_nombre: TStringField;
    ZQajustestockdetallesproducto_observaciones: TStringField;
    ZQajustestockdetallesproducto_codigo: TStringField;
    ZQajustestockdetallesproducto_codigobarras: TStringField;
    ZQajustestockdetallesproducto_preciocosto: TFloatField;
    ZQajustestockdetallesproducto_precioventabase: TFloatField;
    ZQajustestockdetallesproducto_estado: TStringField;
    ZQajustestockdetallesproducto_precioventa1: TFloatField;
    ZQajustestockdetallestipoiva_id: TIntegerField;
    ZQajustestockdetallesrubro_id: TIntegerField;
    ZQajustestockdetallesproducto_precioventa2: TFloatField;
    ZQajustestockdetallesproducto_precioventa3: TFloatField;
    ZQajustestockdetallesproducto_precioventa4: TFloatField;
    ZQajustestockdetallescalculoprecio_id: TIntegerField;
    ZQajustestockdetallespoliticaprecio_id: TIntegerField;
    ZQajustestockdetallesproducto_neto1: TFloatField;
    ZQajustestockdetallesproducto_neto2: TFloatField;
    ZQajustestockdetallesproducto_neto3: TFloatField;
    ZQajustestockdetallesproducto_neto4: TFloatField;
    ZQajustestockdetallesproveedor_id: TIntegerField;
    ZQajustestockdetallesproducto_fechaactualizacionprecio: TDateField;
    ZQajustestockdetallesproducto_codigoreferencia: TStringField;
    ZQajustestockdetallesproducto_imprimir: TIntegerField;
    ZQajustestockdetallesproducto_tipo: TStringField;
    ZQajustestockdetallesAnterior: TZQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    FloatField4: TFloatField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    IntegerField9: TIntegerField;
    DateField1: TDateField;
    StringField6: TStringField;
    IntegerField10: TIntegerField;
    StringField7: TStringField;
    ZQajustestockdetallesproducto_codigobarras_1: TStringField;
    ZQajustestockdetallesmarca_id: TIntegerField;
    ZQajustestockdetallesseccion_id: TIntegerField;
    ZQajustestockdetallesproducto_talle: TStringField;
    ZQajustestockdetallesproducto_estadosinc: TStringField;
    ZQajustestockdetallesproducto_longitudcodigo: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnagregarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
  end;

var
  AjusteStock: TAjusteStock;

implementation

uses Unitprinc, UnitAjusteStockDetalle;

{$R *.dfm}


function TAjusteStock.control:boolean;
var
  error:integer;
begin
    error:=0;



    result:=error=0;
end;


procedure TAjusteStock.agregar;
begin
    id:=Princ.codigo('ajustestock','ajustestock_id');

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('BEGIN ');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into ajustestock set ');
    ZQExecSQL.Sql.Add('ajustestock_observaciones=:ajustestock_observaciones, ');
    ZQExecSQL.Sql.Add('personal_id=:personal_id, ');
    ZQExecSQL.Sql.Add('deposito_id=:deposito_id, ');
    ZQExecSQL.Sql.Add('ajustestock_estado=:ajustestock_estado, ');
    ZQExecSQL.Sql.Add('ajustestock_hora=:ajustestock_hora, ');
    ZQExecSQL.Sql.Add('ajustestock_fecha=:ajustestock_fecha, ');
    ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id ');
    ZQExecSQL.ParamByName('ajustestock_observaciones').AsString:=ajustestock_observaciones.Text;
    ZQExecSQL.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSQL.ParamByName('deposito_id').AsString:=Princ.dep_id;
    ZQExecSQL.ParamByName('ajustestock_estado').AsString:='EJECUTADO';
    ZQExecSQL.ParamByName('ajustestock_hora').AsString:=timetostr(Princ.horaservidor);
    ZQExecSQL.ParamByName('ajustestock_fecha').AsString:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);
    ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQajustestockdetalles.First;
    while not ZQajustestockdetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into ajustestockdetalles set ');
            ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
            ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id, ');
            ZQExecSQL.Sql.Add('ajustestockdetalle_cantidad=:ajustestockdetalle_cantidad, ');
            ZQExecSQL.Sql.Add('ajustestockdetalle_id=:ajustestockdetalle_id ');
            ZQExecSQL.ParamByName('producto_id').AsString:=ZQajustestockdetalles.FieldByName('producto_id').AsString;
            ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
            ZQExecSQL.ParamByName('ajustestockdetalle_cantidad').AsString:=ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsString;
            ZQExecSQL.ParamByName('ajustestockdetalle_id').AsString:=Princ.codigo('ajustestockdetalles','ajustestockdetalle_id');
            ZQExecSQL.ExecSql;

            Princ.actualizarstock(ZQajustestockdetalles.FieldByName('producto_id').AsString, ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsFloat,'',False);


            ZQajustestockdetalles.Next;
        end;


    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('COMMIT ');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    self.Close;

end;

procedure TAjusteStock.modificar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('BEGIN ');
    ZQExecSQL.ExecSQL;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update ajustestock set ');
    ZQExecSQL.Sql.Add('ajustestock_observaciones=:ajustestock_observaciones, ');
    ZQExecSQL.Sql.Add('personal_id=:personal_id, ');
    ZQExecSQL.Sql.Add('deposito_id=:deposito_id, ');
    ZQExecSQL.Sql.Add('ajustestock_estado=:ajustestock_estado, ');
    ZQExecSQL.Sql.Add('ajustestock_hora=:ajustestock_hora, ');
    ZQExecSQL.Sql.Add('ajustestock_fecha=:ajustestock_fecha ');
    ZQExecSQL.Sql.Add('where ajustestock_id=:ajustestock_id ');
    ZQExecSQL.ParamByName('ajustestock_observaciones').AsString:=ajustestock_observaciones.Text;
    ZQExecSQL.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQExecSQL.ParamByName('deposito_id').AsString:=Princ.dep_id;
    ZQExecSQL.ParamByName('ajustestock_estado').AsString:='EJECUTADO';
    ZQExecSQL.ParamByName('ajustestock_hora').AsString:=timetostr(Princ.horaservidor);
    ZQExecSQL.ParamByName('ajustestock_fecha').AsString:=formatdatetime('yyyy-mm-dd',Princ.fechaservidor);
    ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQajustestockdetallesAnterior.Active:=false;
    ZQajustestockdetallesAnterior.ParamByName('ajustestock_id').AsString:=id;
    ZQajustestockdetallesAnterior.Active:=true;
    ZQajustestockdetallesAnterior.First;
    while not ZQajustestockdetallesAnterior.Eof do
        begin
            Princ.actualizarstock(ZQajustestockdetallesAnterior.FieldByName('producto_id').AsString, ZQajustestockdetallesAnterior.FieldByName('ajustestockdetalle_cantidad').AsFloat,'',True);

            ZQajustestockdetallesAnterior.Next;
        end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from ajustestockdetalles ');
    ZQExecSQL.Sql.Add('where ajustestock_id=:ajustestock_id ');
    ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQajustestockdetalles.First;
    while not ZQajustestockdetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into ajustestockdetalles set ');
            ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
            ZQExecSQL.Sql.Add('ajustestock_id=:ajustestock_id, ');
            ZQExecSQL.Sql.Add('ajustestockdetalle_cantidad=:ajustestockdetalle_cantidad, ');
            ZQExecSQL.Sql.Add('ajustestockdetalle_id=:ajustestockdetalle_id ');
            ZQExecSQL.ParamByName('producto_id').AsString:=ZQajustestockdetalles.FieldByName('producto_id').AsString;
            ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
            ZQExecSQL.ParamByName('ajustestockdetalle_cantidad').AsString:=ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsString;
            ZQExecSQL.ParamByName('ajustestockdetalle_id').AsString:=Princ.codigo('ajustestockdetalles','ajustestockdetalle_id');
            ZQExecSQL.ExecSql;

            Princ.actualizarstock(ZQajustestockdetalles.FieldByName('producto_id').AsString, ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsFloat,'',False);

            ZQajustestockdetalles.Next;
        end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('COMMIT ');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

    self.Close;

end;

procedure TAjusteStock.eliminar;
begin
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('BEGIN ');
    ZQExecSQL.ExecSQL;

    ZQajustestockdetallesAnterior.Active:=false;
    ZQajustestockdetallesAnterior.ParamByName('ajustestock_id').AsString:=id;
    ZQajustestockdetallesAnterior.Active:=true;
    ZQajustestockdetallesAnterior.First;
    while not ZQajustestockdetallesAnterior.Eof do
        begin
            Princ.actualizarstock(ZQajustestockdetallesAnterior.FieldByName('producto_id').AsString, ZQajustestockdetallesAnterior.FieldByName('ajustestockdetalle_cantidad').AsFloat,'',True);

            ZQajustestockdetallesAnterior.Next;
        end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from ajustestockdetalles ');
    ZQExecSQL.Sql.Add('where ajustestock_id=:ajustestock_id ');
    ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('delete from ajustestock ');
    ZQExecSQL.Sql.Add('where ajustestock_id=:ajustestock_id ');
    ZQExecSQL.ParamByName('ajustestock_id').AsString:=id;
    ZQExecSQL.ExecSql;


    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('COMMIT ');
    ZQExecSQL.ExecSQL;

    MessageDlg('Datos eliminados correctamente.', mtInformation, [mbOK], 0);

    self.Close;

end;


procedure TAjusteStock.btnagregarClick(Sender: TObject);
begin
  inherited;
    try
      AjusteStockDetalle:= TAjusteStockDetalle.Create(self);
    finally
      AjusteStockDetalle.producto_precioventa:=inttostr(1);
      AjusteStockDetalle.documentoventadetalle_listaprecio:=0;
      if AjusteStockDetalle.ShowModal=mrOk then
        begin
            ZQajustestockdetalles.Append;
            ZQajustestockdetalles.FieldByName('ajustestockdetalle_id').AsString:='0';
            ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsString:=AjusteStockDetalle.ventadeta_cantidad.Text;
            ZQajustestockdetalles.FieldByName('ajustestock_id').AsString:=id;
            ZQajustestockdetalles.FieldByName('producto_id').AsString:=AjusteStockDetalle.producto_id.Text;
            ZQajustestockdetalles.FieldByName('producto_nombre').AsString:=AjusteStockDetalle.producto_nombre.Text;
            ZQajustestockdetalles.Post;

        end;

      AjusteStockDetalle.Free;
    end;
end;

procedure TAjusteStock.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin
              if control then
                agregar;

          end;

        2:begin
              if control then
                modificar;

          end;

        3:begin
              if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

    end;
end;

procedure TAjusteStock.btnmodificarClick(Sender: TObject);
begin
  inherited;
    try
      AjusteStockDetalle:= TAjusteStockDetalle.Create(self);
    finally
      AjusteStockDetalle.producto_precioventa:=inttostr(1);
      AjusteStockDetalle.documentoventadetalle_listaprecio:=0;
      AjusteStockDetalle.ventadeta_cantidad.Value:=ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsFloat;
      AjusteStockDetalle.producto_id.Text:=ZQajustestockdetalles.FieldByName('producto_id').AsString;
      AjusteStockDetalle.producto_id.Search(ZQajustestockdetalles.FieldByName('producto_id').AsString);
//      AjusteStockDetalle.producto_id.AfterSearch(self);
      AjusteStockDetalle.calculartotal;

      if AjusteStockDetalle.ShowModal=mrOk then
        begin
            ZQajustestockdetalles.Edit;
            ZQajustestockdetalles.FieldByName('ajustestockdetalle_id').AsString:='0';
            ZQajustestockdetalles.FieldByName('ajustestockdetalle_cantidad').AsString:=AjusteStockDetalle.ventadeta_cantidad.Text;
            ZQajustestockdetalles.FieldByName('ajustestock_id').AsString:=id;
            ZQajustestockdetalles.FieldByName('producto_id').AsString:=AjusteStockDetalle.producto_id.Text;
            ZQajustestockdetalles.FieldByName('producto_nombre').AsString:=AjusteStockDetalle.producto_nombre.Text;
            ZQajustestockdetalles.Post;

        end;

      AjusteStockDetalle.Free;
    end;
end;

procedure TAjusteStock.btnquitarClick(Sender: TObject);
begin
  inherited;
    if ZQajustestockdetalles.RecordCount>0 then
      begin
          if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
            begin
                try
                  ZQajustestockdetalles.Delete;
                except
                end;
            end;
      end;
end;

procedure TAjusteStock.FormCreate(Sender: TObject);
begin
  inherited;
    id:='';

    personal_id.llenarcombo;
    personal_id.ItemIndex:=0;


end;

procedure TAjusteStock.FormShow(Sender: TObject);
begin
  inherited;
    if abm=1 then
      id:='';


    ZQSelect.Active:=false;
    ZQSelect.ParamByName('ajustestock_id').AsString:=id;
    ZQSelect.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;

end;

procedure TAjusteStock.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=1 then
      begin
          ajustestock_id.Text:=Princ.codigo('ajustestock','ajustestock_id');
          ajustestock_fecha.Date:=date;
          personal_id.ItemIndex:=-1;
          ajustestock_observaciones.Text:='';

      end
    else
      begin
          ajustestock_id.Text:=ZQSelect.FieldByName('ajustestock_id').AsString;
          ajustestock_fecha.Date:=ZQSelect.FieldByName('ajustestock_fecha').AsDateTime;
          personal_id.Buscar(ZQSelect.FieldByName('personal_id').AsString);
          ajustestock_observaciones.Text:=ZQSelect.FieldByName('ajustestock_observaciones').AsString;
          
      end;


    ZQajustestockdetalles.Active:=false;
    ZQajustestockdetalles.ParamByName('ajustestock_id').AsString:=id;
    ZQajustestockdetalles.Active:=true;
end;

end.
