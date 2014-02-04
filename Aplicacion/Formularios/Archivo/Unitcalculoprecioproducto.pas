unit Unitcalculoprecioproducto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, DbSqlCombo, BaseGrid, AdvGrid, DBAdvGrid, math,
  MoneyEdit;

type
  Tcalculoprecioproductos = class(TForm)
    ZQuery2: TZQuery;
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    ZQCalculopreciodetaprod: TZQuery;
    DTSCalculopreciodeta: TDataSource;
    btnagregar: TButton;
    btnquitar: TButton;
    btnsubir: TButton;
    btnbajar: TButton;
    DBGrid1: TDBGrid;
    ZQProductos: TZQuery;
    ZQCalculopreciodetaprodcalculopreciodetaprod_id: TIntegerField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_descripcion: TStringField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_orden: TIntegerField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_tipo: TStringField;
    ZQCalculopreciodetaprodcalculopreciodetaprod_valor: TFloatField;
    ZQCalculopreciodetaprodproducto_id: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnsubirClick(Sender: TObject);
    procedure btnbajarClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnquitarClick(Sender: TObject);
    procedure ZQCalculopreciodetaprodBeforePost(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
    procedure ZQCalculopreciodetaprodBeforeInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    ultimo:integer;
    function control:boolean;
  public
    { Public declarations }
    abm:integer;
    id:string;
    producto_id:string;
  end;

var
  calculoprecioproductos: Tcalculoprecioproductos;

implementation

uses UnitPrinc, Unitventadetalle;

{$R *.dfm}


procedure Tcalculoprecioproductos.FormCreate(Sender: TObject);
begin
    id:='';

end;

procedure Tcalculoprecioproductos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tcalculoprecioproductos.FormShow(Sender: TObject);
begin
    ZQCalculopreciodetaprod.Active:=false;
    ZQCalculopreciodetaprod.SQL.Text:='select * from calculopreciodetaprod where producto_id="'+producto_id+'" order by calculopreciodetaprod_orden';
    ZQCalculopreciodetaprod.Active:=true;
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tcalculoprecioproductos.ZQCalculopreciodetaprodBeforeInsert(
  DataSet: TDataSet);
begin
    ultimo:=ZQCalculopreciodetaprod.RecordCount;

end;

procedure Tcalculoprecioproductos.ZQCalculopreciodetaprodBeforePost(DataSet: TDataSet);
begin
    ZQCalculopreciodetaprod.FieldByName('producto_id').AsString:=producto_id;
end;

procedure Tcalculoprecioproductos.btnagregarClick(Sender: TObject);
begin
//    ultimo:=0;
//    ZQCalculopreciodetaprod.Last;
//    try
//      ultimo:=ZQCalculopreciodetaprod.FieldByName('calculopreciodeta_orden').AsInteger;
//    except
//      ultimo:=0;
//    end;
    ZQCalculopreciodetaprod.Append;
    ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_id').AsInteger:=0;
    ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger:=ultimo+1;
    ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_descripcion').AsString:='';
    ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_tipo').AsString:='';
    ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_valor').AsString:='0';

    ZQCalculopreciodetaprod.Post;

    DBGrid1.SelectedIndex:=1;
    DBGrid1.SetFocus;

end;

procedure Tcalculoprecioproductos.btnbajarClick(Sender: TObject);
var
  bm1:TBookmark;
begin
    if not ZQCalculopreciodetaprod.Eof then
      begin
          bm1:=ZQCalculopreciodetaprod.GetBookmark;

          ZQCalculopreciodetaprod.Next;
          ZQCalculopreciodetaprod.Edit;
          ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger-1;
          ZQCalculopreciodetaprod.Post;

          ZQCalculopreciodetaprod.GotoBookmark(bm1);
          ZQCalculopreciodetaprod.Edit;
          ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger+1;
          ZQCalculopreciodetaprod.Post;
      end;


end;

procedure Tcalculoprecioproductos.btnguardarClick(Sender: TObject);
begin
    if control then
      self.ModalResult:=mrOk
end;

procedure Tcalculoprecioproductos.btnquitarClick(Sender: TObject);
begin
    try
      if (MessageDlg('Seguro desea quitar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
        ZQCalculopreciodetaprod.Delete;
    finally
    end;
end;

procedure Tcalculoprecioproductos.btnsubirClick(Sender: TObject);
var
  bm1:TBookmark;
begin
    if not ZQCalculopreciodetaprod.Bof then
      begin
          bm1:=ZQCalculopreciodetaprod.GetBookmark;

          ZQCalculopreciodetaprod.Prior;
          ZQCalculopreciodetaprod.Edit;
          ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger+1;
          ZQCalculopreciodetaprod.Post;

          ZQCalculopreciodetaprod.GotoBookmark(bm1);
          ZQCalculopreciodetaprod.Edit;
          ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger:=ZQCalculopreciodetaprod.FieldByName('calculopreciodetaprod_orden').AsInteger-1;
          ZQCalculopreciodetaprod.Post;
      end;

end;

function Tcalculoprecioproductos.control:boolean;
var
  error:integer;
begin
    error:=0;

//    if calculoprecio_nombre.Text='' then
//      error:=1;
//
//
//    case error of
//        1:begin
//              MessageDlg('Ingrese el nombre', mtError, [mbOK], 0);
//              calculoprecio_nombre.SetFocus;
//
//          end;
//
//    end;


    if error=0 then
      result:=true
    else
      result:=false;

end;

end.
