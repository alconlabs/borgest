unit UnitPoliticasPrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, ComCtrls, ExtCtrls, AdvPanel,
  UnitSqlComboBox, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UnitNumEdit;

type
  Tpoliticasprecios = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnguardar: TButton;
    ZQpoliticasdeprecio: TZQuery;
    ZQuery1: TZQuery;
    Label1: TLabel;
    politicaprecio_nombre: TEdit;
    Label3: TLabel;
    politicaprecio_id: TEdit;
    Label6: TLabel;
    politicaprecio_politica1: TNumEdit;
    politicaprecio_obse: TMemo;
    Label2: TLabel;
    Label9: TLabel;
    politicaprecio_politica2: TNumEdit;
    Label10: TLabel;
    politicaprecio_politica3: TNumEdit;
    Label11: TLabel;
    politicaprecio_politica4: TNumEdit;
    ZQProductos: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure ZQpoliticasdeprecioAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function control:boolean;
    procedure agregar;
    procedure modificar;
    procedure eliminar;
  public
    { Public declarations }
    id:string;
    abm:integer;
  end;

var
  politicasprecios: Tpoliticasprecios;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tpoliticasprecios.eliminar;
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Delete from politicasdeprecios');
    ZQuery1.sql.add(' where politicaprecio_id=:politicaprecio_id');
    ZQuery1.parambyname('politicaprecio_id').asstring:=id;
    ZQuery1.ExecSQL;

    MessageDlg('La politica fue eliminada', mtInformation, [mbOK], 0);
//    abm:=1;
//    Self.OnShow(self);

    close;


end;


procedure Tpoliticasprecios.modificar;
begin

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Update politicasdeprecios set ');
    ZQuery1.sql.add('politicaprecio_nombre=:politicaprecio_nombre, ');
    ZQuery1.sql.add('politicaprecio_politica1=:politicaprecio_politica1, ');
    ZQuery1.sql.add('politicaprecio_politica2=:politicaprecio_politica2, ');
    ZQuery1.sql.add('politicaprecio_politica3=:politicaprecio_politica3, ');
    ZQuery1.sql.add('politicaprecio_politica4=:politicaprecio_politica4, ');
    ZQuery1.sql.add('politicaprecio_obse=:politicaprecio_obse ');
    ZQuery1.sql.add('where politicaprecio_id=:politicaprecio_id');

    ZQuery1.parambyname('politicaprecio_id').asstring:=id;
    ZQuery1.parambyname('politicaprecio_nombre').asstring:=politicaprecio_nombre.Text;
    ZQuery1.parambyname('politicaprecio_politica1').asstring:=politicaprecio_politica1.Text;
    ZQuery1.parambyname('politicaprecio_politica2').asstring:=politicaprecio_politica2.Text;
    ZQuery1.parambyname('politicaprecio_politica3').asstring:=politicaprecio_politica3.Text;
    ZQuery1.parambyname('politicaprecio_politica4').asstring:=politicaprecio_politica4.Text;
    ZQuery1.parambyname('politicaprecio_obse').asstring:=politicaprecio_obse.Lines.Text;
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    ZQProductos.Active:=false;
    ZQProductos.ParamByName('politicaprecio_id').AsString:=id;
    ZQProductos.Active:=true;

    if (MessageDlg('Desea actualizar los precios de los productos asociados a esta politica de precios?'+#10#13+'Se actualizaran '+inttostr(ZQProductos.RecordCount)+' productos', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin


          Princ.CalcularPreciosProducto(ZQProductos, true);

      end;

    Self.OnShow(self);


end;


procedure Tpoliticasprecios.btncancelarClick(Sender: TObject);
begin
    if (MessageDlg('Seguro desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      Self.Close;
end;

procedure Tpoliticasprecios.btnguardarClick(Sender: TObject);
begin
    if control then
      begin
          case abm of
              1:begin
                    agregar;

                end;

              2:begin
                    modificar;

                end;

              3:begin
                    if (MessageDlg('Seguro desea eliminar este cliente?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                      eliminar;


                end;
          end;




      end;
end;

function Tpoliticasprecios.control:boolean;
var
  error:integer;
  cliente_id_dni:string;
begin
    error:=0;

    if politicaprecio_nombre.Text='' then
      error:=1;
//
//
//
//    cliente_id_dni:=Princ.buscar('select cliente_id from clientes where cliente_dni="'+cliente_dni.Text+'"','cliente_id');
//    if abm=2then
//      cliente_id_dni:=Princ.buscar('select cliente_id from clientes where cliente_dni="'+cliente_dni.Text+'" and cliente_id<>"'+cliente_id.Text+'"','cliente_id');
//
//    if cliente_id_dni<>'' then
//      error:=9;
//
//
//
//
//
    case error of
        1:begin
              MessageDlg('Ingrese el nombre', mtError, [mbOK], 0);
              politicaprecio_nombre.SetFocus;

          end;

    end;

    if error=0 then
      result:=true
    else
      result:=false;

end;


procedure Tpoliticasprecios.agregar;
begin
    id:=Princ.codigo('politicasdeprecios','politicaprecio_id');

    ZQuery1.sql.clear;
    ZQuery1.sql.add('Insert into politicasdeprecios (politicaprecio_id, politicaprecio_nombre, ');
    ZQuery1.sql.add('politicaprecio_politica1, politicaprecio_politica2, politicaprecio_politica3, ');
    ZQuery1.sql.add('politicaprecio_politica4, politicaprecio_obse) ');
    ZQuery1.sql.add('values (:politicaprecio_id, :politicaprecio_nombre, ');
    ZQuery1.sql.add(':politicaprecio_politica1, :politicaprecio_politica2, :politicaprecio_politica3, ');
    ZQuery1.sql.add(':politicaprecio_politica4, :politicaprecio_obse) ');

    ZQuery1.parambyname('politicaprecio_id').asstring:=id;
    ZQuery1.parambyname('politicaprecio_nombre').asstring:=politicaprecio_nombre.Text;
    ZQuery1.parambyname('politicaprecio_politica1').asstring:=politicaprecio_politica1.Text;
    ZQuery1.parambyname('politicaprecio_politica2').asstring:=politicaprecio_politica2.Text;
    ZQuery1.parambyname('politicaprecio_politica3').asstring:=politicaprecio_politica3.Text;
    ZQuery1.parambyname('politicaprecio_politica4').asstring:=politicaprecio_politica4.Text;
    ZQuery1.parambyname('politicaprecio_obse').asstring:=politicaprecio_obse.Lines.Text;
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.OnShow(self);
end;

procedure Tpoliticasprecios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure Tpoliticasprecios.FormCreate(Sender: TObject);
begin
    id:='0';
end;

procedure Tpoliticasprecios.FormShow(Sender: TObject);
begin
    if abm<>1 then
      begin
          ZQpoliticasdeprecio.Active:=false;
          ZQpoliticasdeprecio.ParamByName('politicaprecio_id').AsString:=id;
          ZQpoliticasdeprecio.Active:=true;

      end
    else
      begin
          politicaprecio_id.Text:=Princ.codigo('politicasdeprecios','politicaprecio_id');
          politicaprecio_nombre.Text:='';
          politicaprecio_politica1.Text:='';
          politicaprecio_politica2.Text:='';
          politicaprecio_politica3.Text:='';
          politicaprecio_politica4.Text:='';
          politicaprecio_obse.Lines.Text:='';

      end;
end;

procedure Tpoliticasprecios.ZQpoliticasdeprecioAfterOpen(DataSet: TDataSet);
begin
    politicaprecio_id.Text:=id;
    politicaprecio_nombre.Text:=ZQpoliticasdeprecio.FieldByName('politicaprecio_nombre').AsString;
    politicaprecio_politica1.Text:=ZQpoliticasdeprecio.FieldByName('politicaprecio_politica1').AsString;
    politicaprecio_politica2.Text:=ZQpoliticasdeprecio.FieldByName('politicaprecio_politica2').AsString;
    politicaprecio_politica3.Text:=ZQpoliticasdeprecio.FieldByName('politicaprecio_politica3').AsString;
    politicaprecio_politica4.Text:=ZQpoliticasdeprecio.FieldByName('politicaprecio_politica4').AsString;
    politicaprecio_obse.Lines.Text:=ZQpoliticasdeprecio.FieldByName('politicaprecio_obse').AsString;



end;

end.
