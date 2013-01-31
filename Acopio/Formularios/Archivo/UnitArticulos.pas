unit UnitArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TArticulos = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    articulo_descreducida: TEdit;
    articulo_desc: TEdit;
    articulo_codi: TDBAdvEdit;
    Label2: TLabel;
    articulo_observaciones: TEdit;
    btnguardar: TButton;
    btncancelar: TButton;
    Label6: TLabel;
    articulo_unidad: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    rubro_codi: TSqlComboBox;
    ZQuery1: TZQuery;
    ZArticulos: TZQuery;
    Label5: TLabel;
    articulo_tipoiva: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZArticulosAfterOpen(DataSet: TDataSet);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;

  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  Articulos: TArticulos;

implementation

uses UnitPrinc;

{$R *.dfm}



procedure TArticulos.FormCreate(Sender: TObject);
begin
   rubro_codi.llenarcombo;
end;


procedure TArticulos.FormShow(Sender: TObject);
begin
   if abm<>1 then
      begin
          ZArticulos.Active:=false;
          ZArticulos.ParamByName('articulo_codi').AsString:=id;
          ZArticulos.Active:=true;
      end;
    articulo_desc.SetFocus;
end;


procedure TArticulos.btncancelarClick(Sender: TObject);
begin
   if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;

end;

procedure TArticulos.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este Artículo?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                eliminar;


          end;
    end;
end;

function TArticulos.control:boolean;
var
  error:integer;
  articulo_id_nombre:string;
begin
    error:=0;

    if abm=1 then
      begin
          articulo_id_nombre:=Princ.buscar('select articulo_codi from articulos where articulo_desc="'+articulo_desc.Text+'"','articulo_codi');
          if articulo_id_nombre<>'' then
            begin
                error:=3;
                if (MessageDlg('Ya existe un Artículo con el mismo nombre.'+#13+#10+'Desea continuar?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                  error:=0;
            end;
      end;

    if error=0 then
      result:=true
    else
      result:=false;
end;

procedure TArticulos.agregar;
begin
    id:=Princ.codigo('Articulos','articulo_codi');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into articulos (articulo_codi, articulo_desc, articulo_descreducida, articulo_unidad, ');
    ZQuery1.sql.add('articulo_tipoiva, articulo_observaciones, rubro_codi) ');
    ZQuery1.sql.add('values (:articulo_codi, :articulo_desc, :articulo_descreducida, :articulo_unidad,');
    ZQuery1.sql.add(':articulo_tipoiva, :articulo_observaciones, :rubro_codi) ');

    ZQuery1.parambyname('articulo_codi').asstring:=id;
    ZQuery1.parambyname('articulo_desc').asstring:=articulo_desc.Text;
    ZQuery1.parambyname('articulo_descreducida').asstring:=articulo_descreducida.Text;
    ZQuery1.parambyname('articulo_unidad').asstring:=articulo_unidad.Text;
    ZQuery1.parambyname('articulo_tipoiva').asstring:=articulo_tipoiva.Text;
    ZQuery1.parambyname('articulo_observaciones').asstring:=articulo_observaciones.Text;
    ZQuery1.parambyname('rubro_codi').asstring:=rubro_codi.codigo;
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    close;
end;

procedure TArticulos.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from articulos');
    ZQuery1.sql.add(' where articulo_codi=:articulo_codi');
    ZQuery1.parambyname('articulo_codi').asstring:=articulo_codi.Text;
    ZQuery1.ExecSQL;

    MessageDlg('El artículo fue eliminado', mtInformation, [mbOK], 0);
    close;
end;

procedure TArticulos.modificar;
begin

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update articulos set ');
    ZQuery1.sql.add('articulo_codi=:articulo_codi, ');
    ZQuery1.sql.add('articulo_desc=:articulo_desc, ');
    ZQuery1.sql.add('articulo_descreducida=:articulo_descreducida, ');
    ZQuery1.sql.add('articulo_unidad=:articulo_unidad, ');
    ZQuery1.sql.add('articulo_tipoiva=:articulo_tipoiva, ');
    ZQuery1.sql.add('articulo_observaciones=:articulo_observaciones, ');
    ZQuery1.sql.add('rubro_codi=:rubro_codi ');
    ZQuery1.sql.add('where articulo_codi=:articulo_codi');

    ZQuery1.parambyname('articulo_codi').asstring:=id;
    ZQuery1.parambyname('articulo_desc').asstring:=articulo_desc.Text;
    ZQuery1.parambyname('articulo_descreducida').asstring:=articulo_descreducida.Text;
    ZQuery1.parambyname('articulo_unidad').asstring:=articulo_unidad.Text;
    ZQuery1.parambyname('articulo_tipoiva').asstring:=articulo_tipoiva.Text;
    ZQuery1.parambyname('articulo_observaciones').asstring:=articulo_observaciones.Text;
    ZQuery1.parambyname('rubro_codi').asstring:=rubro_codi.codigo;
    ZQuery1.ExecSQL;
    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    close;
end;



procedure TArticulos.ZArticulosAfterOpen(DataSet: TDataSet);
begin
    articulo_codi.Text:=id;
    articulo_desc.Text:=ZArticulos.FieldByName('articulo_desc').AsString;
    articulo_descreducida.Text:=ZArticulos.FieldByName('articulo_descreducida').AsString;
    articulo_unidad.Text:=ZArticulos.FieldByName('articulo_unidad').AsString;
    articulo_tipoiva.Text:=ZArticulos.FieldByName('articulo_tipoiva').AsString;
    articulo_observaciones.Text:=ZArticulos.FieldByName('articulo_observaciones').AsString;
    rubro_codi.Buscar(ZArticulos.FieldByName('rubro_codi').AsString);
end;

end.
