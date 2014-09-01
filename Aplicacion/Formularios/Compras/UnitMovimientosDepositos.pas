unit UnitMovimientosDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, GTBMemo, Grids, DBGrids, ComCtrls,
  UnitSqlComboBox;

type
  TMovimientosDepositos = class(TABMbase)
    Labelsucursal: TLabel;
    deposito_idorigen: TSqlComboBox;
    Label2: TLabel;
    movimientodeposito_fecha: TDateTimePicker;
    DBGrid1: TDBGrid;
    btnagregar: TButton;
    btnmodificar: TButton;
    btnquitar: TButton;
    Label13: TLabel;
    movimientodeposito_observaciones: TGTBMemo;
    Label1: TLabel;
    deposito_iddestino: TSqlComboBox;
    ZQmovimdepodetalles: TZQuery;
    DTSmovimdepodetalles: TDataSource;
    Button1: TButton;
    ZQmovimdepodetallesmovimdepodetalle_id: TIntegerField;
    ZQmovimdepodetallesmovimdepodetalle_cantidadenviar: TFloatField;
    ZQmovimdepodetallesmovimdepodetalle_cantidadrecibir: TFloatField;
    ZQmovimdepodetallesmovimdepodetalle_estado: TStringField;
    ZQmovimdepodetallesproducto_id: TIntegerField;
    ZQmovimdepodetallesmovimientodeposito_id: TIntegerField;
    ZQmovimdepodetallesproducto_id_1: TIntegerField;
    ZQmovimdepodetallesproducto_nombre: TStringField;
    ZQmovimdepodetallesproducto_observaciones: TStringField;
    ZQmovimdepodetallesproducto_codigo: TStringField;
    ZQmovimdepodetallesproducto_codigobarras: TStringField;
    ZQmovimdepodetallesproducto_preciocosto: TFloatField;
    ZQmovimdepodetallesproducto_precioventabase: TFloatField;
    ZQmovimdepodetallesproducto_estado: TStringField;
    ZQmovimdepodetallesproducto_precioventa1: TFloatField;
    ZQmovimdepodetallestipoiva_id: TIntegerField;
    ZQmovimdepodetallesrubro_id: TIntegerField;
    ZQmovimdepodetallesproducto_precioventa2: TFloatField;
    ZQmovimdepodetallesproducto_precioventa3: TFloatField;
    ZQmovimdepodetallesproducto_precioventa4: TFloatField;
    ZQmovimdepodetallescalculoprecio_id: TIntegerField;
    ZQmovimdepodetallespoliticaprecio_id: TIntegerField;
    ZQmovimdepodetallesproducto_neto1: TFloatField;
    ZQmovimdepodetallesproducto_neto2: TFloatField;
    ZQmovimdepodetallesproducto_neto3: TFloatField;
    ZQmovimdepodetallesproducto_neto4: TFloatField;
    ZQmovimdepodetallesproveedor_id: TIntegerField;
    ZQmovimdepodetallesproducto_fechaactualizacionprecio: TDateField;
    ZQmovimdepodetallesproducto_codigoreferencia: TStringField;
    ZQmovimdepodetallesproducto_imprimir: TIntegerField;
    ZQmovimdepodetallesproducto_tipo: TStringField;
    btnimprimir: TButton;
    ZQmovimdepodetallesAnterior: TZQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField6: TStringField;
    FloatField5: TFloatField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    IntegerField9: TIntegerField;
    DateField1: TDateField;
    StringField7: TStringField;
    IntegerField10: TIntegerField;
    StringField8: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
  public
    { Public declarations }
  end;

var
  MovimientosDepositos: TMovimientosDepositos;

implementation

uses Unitprinc, UnitProductosenStock;

{$R *.dfm}


procedure TMovimientosDepositos.modificar;
begin
    ZQmovimdepodetallesAnterior.Active:=false;
    ZQmovimdepodetallesAnterior.ParamByName('movimientodeposito_id').AsString:=id;
    ZQmovimdepodetallesAnterior.Active:=true;
    ZQmovimdepodetallesAnterior.First;
    while not ZQmovimdepodetallesAnterior.Eof do
    begin
        Princ.actualizarstock(ZQmovimdepodetallesAnterior.FieldByName('producto_id').AsString,ZQmovimdepodetallesAnterior.FieldByName('movimdepodetalle_cantidadenviar').AsFloat,'',false);
        ZQmovimdepodetallesAnterior.Next;
    end;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update movimientosdepositos set ');
    ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
    ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
    ZQExecSQL.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
    ZQExecSQL.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
    ZQExecSQL.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado, ');
    ZQExecSQL.Sql.Add('movimientodeposito_hora=:movimientodeposito_hora, ');
    ZQExecSQL.Sql.Add('movimientodeposito_fecha=:movimientodeposito_fecha ');
    ZQExecSQL.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
    ZQExecSQL.ParamByName('deposito_iddestino').AsString:=deposito_iddestino.codigo;
    ZQExecSQL.ParamByName('deposito_idorigen').AsString:=deposito_idorigen.codigo;
    ZQExecSQL.ParamByName('movimientodeposito_observaciones').AsString:=movimientodeposito_observaciones.Text;
    ZQExecSQL.ParamByName('movimientodeposito_hora').AsTime:=Time;
    ZQExecSQL.ParamByName('movimientodeposito_fecha').AsString:=FormatDateTime('yyyy-mm-dd',movimientodeposito_fecha.Date);
    ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQmovimdepodetalles.First;
    while not ZQmovimdepodetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into movimdepodetalles set ');
            ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
            ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
            ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=id;
            ZQExecSQL.ParamByName('producto_id').AsString:=ZQmovimdepodetalles.FieldByName('producto_id').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_estado').AsString:='ENVIADO';
            ZQExecSQL.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_id').AsString:=princ.codigo('movimdepodetalles','movimdepodetalle_id');
            ZQExecSQL.ExecSql;

            Princ.actualizarstock(ZQmovimdepodetalles.FieldByName('producto_id').AsString,ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat*-1,'',false);

            ZQmovimdepodetalles.Next;
        end;



end;

procedure TMovimientosDepositos.agregar;
begin
    id:=princ.codigo('movimientosdepositos','movimientodeposito_id');
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into movimientosdepositos set ');
    ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
    ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
    ZQExecSQL.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
    ZQExecSQL.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
    ZQExecSQL.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado, ');
    ZQExecSQL.Sql.Add('movimientodeposito_hora=:movimientodeposito_hora, ');
    ZQExecSQL.Sql.Add('movimientodeposito_fecha=:movimientodeposito_fecha, ');
    ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id ');
    ZQExecSQL.ParamByName('deposito_iddestino').AsString:=deposito_iddestino.codigo;
    ZQExecSQL.ParamByName('deposito_idorigen').AsString:=deposito_idorigen.codigo;
    ZQExecSQL.ParamByName('movimientodeposito_observaciones').AsString:=movimientodeposito_observaciones.Text;
    ZQExecSQL.ParamByName('movimientodeposito_estadosinc').AsString:=Princ.GetConfiguracion('MOVIMDEPOESTADOSINCALCREAR');
    ZQExecSQL.ParamByName('movimientodeposito_estado').AsString:='PENDIENTE';
    ZQExecSQL.ParamByName('movimientodeposito_hora').AsTime:=Time;
    ZQExecSQL.ParamByName('movimientodeposito_fecha').AsString:=FormatDateTime('yyyy-mm-dd',movimientodeposito_fecha.Date);
    ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=id;
    ZQExecSQL.ExecSql;

    ZQmovimdepodetalles.First;
    while not ZQmovimdepodetalles.Eof do
        begin
            ZQExecSQL.Sql.Clear;
            ZQExecSQL.Sql.Add('insert into movimdepodetalles set ');
            ZQExecSQL.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
            ZQExecSQL.Sql.Add('producto_id=:producto_id, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
            ZQExecSQL.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
            ZQExecSQL.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
            ZQExecSQL.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
            ZQExecSQL.ParamByName('movimientodeposito_id').AsString:=id;
            ZQExecSQL.ParamByName('producto_id').AsString:=ZQmovimdepodetalles.FieldByName('producto_id').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_estado').AsString:='ENVIADO';
            ZQExecSQL.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
            ZQExecSQL.ParamByName('movimdepodetalle_id').AsString:=princ.codigo('movimdepodetalles','movimdepodetalle_id');
            ZQExecSQL.ParamByName('deposito_iddestino').AsString:=deposito_iddestino.codigo;
            ZQExecSQL.ParamByName('deposito_idorigen').AsString:=deposito_idorigen.codigo;
            ZQExecSQL.ExecSql;

            Princ.actualizarstock(ZQmovimdepodetalles.FieldByName('producto_id').AsString,ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat*-1,'',false);

            ZQmovimdepodetalles.Next;
        end;


MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);

end;


function TMovimientosDepositos.control:boolean;
var
  error:integer;
begin
    error:=0;

    if deposito_idorigen.codigo='' then
      error:=1;

    if deposito_iddestino.codigo='' then
      error:=2;

    if deposito_idorigen.codigo=deposito_iddestino.codigo then
      error:=3;

    case error of
        1:begin
              MessageDlg('Debe seleccionar un deposito origen.', mtError, [mbOK], 0);
              deposito_idorigen.SetFocus;
          end;
        2:begin
              MessageDlg('Debe seleccionar un deposito destino.', mtError, [mbOK], 0);
              deposito_iddestino.SetFocus;
          end;
        3:begin
              MessageDlg('Debe seleccionar depositos distintos.', mtError, [mbOK], 0);
              deposito_idorigen.SetFocus;
          end;
    end;


    Result:=error=0;

end;


procedure TMovimientosDepositos.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        ABM_AGREGAR:begin
            if control then
              agregar;
        end;

        ABM_MODIFICAR:begin
            if control then
              modificar;
        end;

    end;

    if (MessageDlg('Desea imprimir Remito?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          btnimprimir.Click;


      end;

    Self.Close;
end;

procedure TMovimientosDepositos.btnimprimirClick(Sender: TObject);
begin
  inherited;
    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'remito_motoslabanda.rep';
    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from movimientosdepositos '+
                                             'inner join movimdepodetalles on movimientosdepositos.movimientodeposito_id=movimdepodetalles.movimientodeposito_id '+
                                             'inner join productos on movimdepodetalles.producto_id=productos.producto_id '+
                                             'where movimientosdepositos.movimientodeposito_id="'+id+'"';


    Princ.VCLReport1.Execute;
end;

procedure TMovimientosDepositos.btnquitarClick(Sender: TObject);
begin
  inherited;
    if ZQmovimdepodetalles.RecordCount>0 then
      begin
          if (MessageDlg('Seguro desea quitar este item?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
            begin
                try
                  ZQmovimdepodetalles.Delete;
                except
                end;
            end;
      end;

end;

procedure TMovimientosDepositos.Button1Click(Sender: TObject);
begin
  inherited;
    ProductosenStock:=TProductosenStock.Create(self);
    ProductosenStock.ConfCampoBusqueda1:='producto_codigo';
    ProductosenStock.deposito_iddestino:=deposito_iddestino.codigo;
    if ProductosenStock.ShowModal=mrOk then
      begin
          ProductosenStock.ZQGrilla.Filtered:=false;
          ProductosenStock.ZQGrilla.Filter:='movimdepodetallecantidadenviar>0';
          ProductosenStock.ZQGrilla.Filtered:=true;
          ProductosenStock.ZQGrilla.First;
          while not ProductosenStock.ZQGrilla.Eof do
              begin
                  ZQmovimdepodetalles.Insert;

                  ZQmovimdepodetalles.FieldByName('movimdepodetalle_id').AsString:='0';
                  ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString:=ProductosenStock.ZQGrilla.FieldByName('movimdepodetallecantidadenviar').AsString;
                  ZQmovimdepodetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString:='0';
                  ZQmovimdepodetalles.FieldByName('movimdepodetalle_estado').AsString:='ENVIADO';
                  ZQmovimdepodetalles.FieldByName('producto_id').AsString:=ProductosenStock.ZQGrilla.FieldByName('producto_id').AsString;
                  ZQmovimdepodetalles.FieldByName('movimientodeposito_id').AsString:='0';
                  ZQmovimdepodetalles.FieldByName('producto_nombre').AsString:=ProductosenStock.ZQGrilla.FieldByName('producto_nombre').AsString;

                  ZQmovimdepodetalles.Post;
                  ProductosenStock.ZQGrilla.Next;
              end;

          ProductosenStock.ZQGrilla.Filtered:=false;
      end;

    ProductosenStock.Free;
end;

procedure TMovimientosDepositos.FormCreate(Sender: TObject);
begin
  inherited;
    deposito_idorigen.llenarcombo;
    deposito_idorigen.Buscar(princ.dep_id);

    deposito_iddestino.Confsql.Text:='select * from depositos where deposito_id<>"'+princ.dep_id+'" order by deposito_nombre';
    deposito_iddestino.llenarcombo;
    deposito_iddestino.ItemIndex:=0;

    btnimprimir.Visible:=false;
    if abm<>ABM_AGREGAR then
      btnimprimir.Visible:=true;


end;

procedure TMovimientosDepositos.FormShow(Sender: TObject);
begin
  inherited;
    if abm=1 then
      id:='';


    ZQSelect.Active:=false;
    ZQSelect.ParamByName('movimientodeposito_id').AsString:=id;
    ZQSelect.Active:=true;

    case abm of
        1:btnguardar.Caption:='Guardar';
        2:btnguardar.Caption:='Guardar';
        3:btnguardar.Caption:='Eliminar';
        4:btnguardar.Caption:='Imprimir';
        5:btnguardar.Caption:='Anular';
    end;

    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure TMovimientosDepositos.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=ABM_AGREGAR then
      begin
          movimientodeposito_fecha.Date:=date;
          movimientodeposito_observaciones.Text:='';
      end
    else
      begin
          deposito_idorigen.Buscar(ZQSelect.FieldByName('deposito_idorigen').AsString);
          deposito_iddestino.Buscar(ZQSelect.FieldByName('deposito_iddestino').AsString);
          movimientodeposito_fecha.Date:=ZQSelect.FieldByName('movimientodeposito_fecha').AsDateTime;
          movimientodeposito_observaciones.Text:=ZQSelect.FieldByName('movimientodeposito_observaciones').AsString;
      end;

    ZQmovimdepodetalles.Active:=false;
    ZQmovimdepodetalles.ParamByName('movimientodeposito_id').AsString:=id;
    ZQmovimdepodetalles.Active:=true;

    

end;

end.
