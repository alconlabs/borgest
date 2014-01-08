unit Unitcalculoprecio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit;

type
  Tcalculoprecio = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    btncancelar: TButton;
    btnguardar: TButton;
    Label15: TLabel;
    ZQCalculopreciodeta: TZQuery;
    DTSCalculopreciodeta: TDataSource;
    btnagregar: TButton;
    btnquitar: TButton;
    calculoprecio_id: TEdit;
    calculoprecio_nombre: TEdit;
    btnsubir: TButton;
    btnbajar: TButton;
    DBGrid1: TDBGrid;
    ZQCalculopreciodetacalculopreciodeta_id: TIntegerField;
    ZQCalculopreciodetacalculopreciodeta_descr: TStringField;
    ZQCalculopreciodetacalculopreciodeta_orden: TIntegerField;
    ZQCalculopreciodetacalculopreciodeta_tipo: TStringField;
    ZQCalculopreciodetacalculopreciodeta_valor: TFloatField;
    ZQCalculopreciodetacalculoprecio_id: TIntegerField;
    ZQProductos: TZQuery;
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQuery2AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnsubirClick(Sender: TObject);
    procedure btnbajarClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure ZQCalculopreciodetaBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    tipocuota:integer;
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
    procedure imprimir;
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  calculoprecio: Tcalculoprecio;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Tcalculoprecio.imprimir;
begin
end;


procedure Tcalculoprecio.eliminar;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('delete from calculopreciodeta ');
    ZQuery2.sql.add('where calculoprecio_id=:calculoprecio_id');
    ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('delete from calculoprecios where calculoprecio_id=:calculoprecio_id');
    ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos Eliminados', mtInformation, [mbOK], 0);
    Self.Close;

end;



procedure Tcalculoprecio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tcalculoprecio.FormCreate(Sender: TObject);
begin
    id:='';

end;

procedure Tcalculoprecio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tcalculoprecio.FormShow(Sender: TObject);
begin
    ZQuery2.Active:=false;
    ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
    ZQuery2.Active:=true;

   // if abm=4 then
//      btnguardar.Caption:='Imprimir';
//
//    if abm=3 then
//      btnguardar.Caption:='Eliminar';
    
end;

procedure Tcalculoprecio.modificar;
var
  i:integer;
begin
    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Update calculoprecios set ');
    ZQuery2.sql.add('calculoprecio_nombre=:calculoprecio_nombre ');
    ZQuery2.sql.add('where calculoprecio_id=:calculoprecio_id');
    ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
    ZQuery2.ParamByName('calculoprecio_nombre').AsString:=calculoprecio_nombre.Text;
    ZQuery2.ExecSQL;


    ZQuery2.sql.clear;
    ZQuery2.sql.add('delete from calculopreciodeta ');
    ZQuery2.sql.add('where calculoprecio_id=:calculoprecio_id');
    ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
    ZQuery2.ExecSQL;

    ZQCalculopreciodeta.First;
    while not ZQCalculopreciodeta.Eof do
        begin
            ZQuery2.SQL.Clear;
            ZQuery2.SQL.Add('insert into calculopreciodeta (calculopreciodeta_id, calculopreciodeta_descr, ');
            ZQuery2.SQL.Add('calculopreciodeta_orden, calculopreciodeta_tipo, calculopreciodeta_valor, calculoprecio_id) ');
            ZQuery2.SQL.Add('values (:calculopreciodeta_id, :calculopreciodeta_descr, ');
            ZQuery2.SQL.Add(':calculopreciodeta_orden, :calculopreciodeta_tipo, :calculopreciodeta_valor, :calculoprecio_id) ');
            ZQuery2.ParamByName('calculopreciodeta_id').AsString:=princ.codigo('calculopreciodeta','calculopreciodeta_id');
            ZQuery2.ParamByName('calculopreciodeta_descr').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_descr').AsString;
            ZQuery2.ParamByName('calculopreciodeta_orden').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsString;
            ZQuery2.ParamByName('calculopreciodeta_tipo').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_tipo').AsString;
            ZQuery2.ParamByName('calculopreciodeta_valor').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_valor').AsString;
            ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
            ZQuery2.ExecSQL;
            ZQCalculopreciodeta.Next;
        end;


    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    ZQProductos.Active:=false;
    ZQProductos.ParamByName('calculoprecio_id').AsString:=id;
    ZQProductos.Active:=true;
    
    if (MessageDlg('Desea actualizar los precios de los productos asociados a este calculo de precios?'+#10#13+'Se actualizaran '+inttostr(ZQProductos.RecordCount)+' productos', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          ZQProductos.Active:=false;
          ZQProductos.ParamByName('calculoprecio_id').AsString:=id;
          ZQProductos.Active:=true;

          Princ.CalcularPreciosProducto(ZQProductos, true);

      end;

    Self.Close;

end;


procedure Tcalculoprecio.ZQCalculopreciodetaBeforePost(DataSet: TDataSet);
begin
    ZQCalculopreciodeta.FieldByName('calculoprecio_id').AsInteger:=0;
    ZQCalculopreciodeta.FieldByName('calculopreciodeta_id').AsInteger:=0;
end;

procedure Tcalculoprecio.ZQuery2AfterOpen(DataSet: TDataSet);
begin
    if abm=1 then
      begin
          calculoprecio_id.Text:=Princ.codigo('calculoprecios','calculoprecio_id');
          calculoprecio_nombre.Text:='';
      end
    else
      begin
          calculoprecio_id.Text:=id;
          calculoprecio_nombre.Text:=ZQuery2.FieldByName('calculoprecio_nombre').AsString;
      end;


    ZQCalculopreciodeta.Active:=false;
    ZQCalculopreciodeta.SQL.Text:='select * from calculopreciodeta where calculoprecio_id="'+id+'" order by calculopreciodeta_orden';
    ZQCalculopreciodeta.Active:=true;

end;

procedure Tcalculoprecio.agregar;
var
  i: Integer;
begin

    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('begin');
    ZQuery2.ExecSQL;

    id:=Princ.codigo('calculoprecios','calculoprecio_id');

    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into calculoprecios (calculoprecio_id, calculoprecio_nombre) ');
    ZQuery2.sql.add('values (:calculoprecio_id, :calculoprecio_nombre)');
    ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
    ZQuery2.ParamByName('calculoprecio_nombre').AsString:=calculoprecio_nombre.Text;
    ZQuery2.ExecSQL;

    ZQCalculopreciodeta.First;
    while not ZQCalculopreciodeta.Eof do
        begin
            ZQuery2.SQL.Clear;
            ZQuery2.SQL.Add('insert into calculopreciodeta (calculopreciodeta_id, calculopreciodeta_descr, ');
            ZQuery2.SQL.Add('calculopreciodeta_orden, calculopreciodeta_tipo, calculopreciodeta_valor, calculoprecio_id) ');
            ZQuery2.SQL.Add('values (:calculopreciodeta_id, :calculopreciodeta_descr, ');
            ZQuery2.SQL.Add(':calculopreciodeta_orden, :calculopreciodeta_tipo, :calculopreciodeta_valor, :calculoprecio_id) ');
            ZQuery2.ParamByName('calculopreciodeta_id').AsString:=princ.codigo('calculopreciodeta','calculopreciodeta_id');
            ZQuery2.ParamByName('calculopreciodeta_descr').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_descr').AsString;
            ZQuery2.ParamByName('calculopreciodeta_orden').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsString;
            ZQuery2.ParamByName('calculopreciodeta_tipo').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_tipo').AsString;
            ZQuery2.ParamByName('calculopreciodeta_valor').AsString:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_valor').AsString;
            ZQuery2.ParamByName('calculoprecio_id').AsString:=id;
            ZQuery2.ExecSQL;
            ZQCalculopreciodeta.Next;
        end;



    ZQuery2.SQL.Clear;
    ZQuery2.SQL.Add('commit');
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);
    Self.Close;
end;



procedure Tcalculoprecio.btnagregarClick(Sender: TObject);
var
  ultimo:integer;
begin
    ultimo:=0;
    ZQCalculopreciodeta.Last;
    try
      ultimo:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger;
    except
      ultimo:=0;
    end;
    ZQCalculopreciodeta.Append;
    ZQCalculopreciodeta.FieldByName('calculoprecio_id').AsInteger:=0;
    ZQCalculopreciodeta.FieldByName('calculopreciodeta_id').AsInteger:=0;
    ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger:=ultimo+1;
    ZQCalculopreciodeta.FieldByName('calculopreciodeta_descr').AsString:='';
    ZQCalculopreciodeta.FieldByName('calculopreciodeta_tipo').AsString:='';
    ZQCalculopreciodeta.FieldByName('calculopreciodeta_valor').AsString:='0';

    ZQCalculopreciodeta.Post;
    
    DBGrid1.SelectedIndex:=1;
    DBGrid1.SetFocus;

end;

procedure Tcalculoprecio.btnbajarClick(Sender: TObject);
var
  bm1:TBookmark;
begin
    if not ZQCalculopreciodeta.Eof then
      begin
          bm1:=ZQCalculopreciodeta.GetBookmark;

          ZQCalculopreciodeta.Next;
          ZQCalculopreciodeta.Edit;
          ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger-1;
          ZQCalculopreciodeta.Post;

          ZQCalculopreciodeta.GotoBookmark(bm1);
          ZQCalculopreciodeta.Edit;
          ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger+1;
          ZQCalculopreciodeta.Post;
      end;


end;

procedure Tcalculoprecio.btncancelarClick(Sender: TObject);
begin
    Self.Close;
end;

procedure Tcalculoprecio.btnguardarClick(Sender: TObject);
begin
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
              if (MessageDlg('Seguro desea eliminar este calculo de precios?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;
          end;

        4:begin
              imprimir;
          end;


    end;
end;

procedure Tcalculoprecio.btnquitarClick(Sender: TObject);
begin

    try
      if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
        ZQCalculopreciodeta.Delete;
    finally
    end;
end;

procedure Tcalculoprecio.btnsubirClick(Sender: TObject);
var
  bm1:TBookmark;
begin
    if not ZQCalculopreciodeta.Bof then
      begin
          bm1:=ZQCalculopreciodeta.GetBookmark;

          ZQCalculopreciodeta.Prior;
          ZQCalculopreciodeta.Edit;
          ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger+1;
          ZQCalculopreciodeta.Post;

          ZQCalculopreciodeta.GotoBookmark(bm1);
          ZQCalculopreciodeta.Edit;
          ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger:=ZQCalculopreciodeta.FieldByName('calculopreciodeta_orden').AsInteger-1;
          ZQCalculopreciodeta.Post;
      end;

end;

function Tcalculoprecio.control:boolean;
var
  error:integer;
begin
    error:=0;


    if calculoprecio_nombre.Text='' then
      error:=1;


    case error of
        1:begin
              MessageDlg('Ingrese el nombre', mtError, [mbOK], 0);
              calculoprecio_nombre.SetFocus;

          end;

    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
