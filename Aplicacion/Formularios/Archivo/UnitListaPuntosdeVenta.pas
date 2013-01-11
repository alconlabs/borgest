unit UnitListaPuntosdeVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel, GBTEdit, UnitSqlComboBox;

type
  Tlistapuntosdeventa = class(Tlistabase)
    fil_puntoventa_numero: TGTBEdit;
    fil_puntoventa_descripcion: TGTBEdit;
    fil_sucursal_nombre: TGTBEdit;
    sucursal_id: TSqlComboBox;
    Label11: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    puntoventa_id: TGTBEdit;
    puntoventa_numero: TGTBEdit;
    puntoventa_descripcion: TGTBEdit;
    Label3: TLabel;
    puntoventa_controladorfiscalmodelo: TComboBox;
    Label4: TLabel;
    puntoventa_controladorfiscalpuerto: TComboBox;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
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
  listapuntosdeventa: Tlistapuntosdeventa;

implementation

uses Unitprinc;

{$R *.dfm}


procedure Tlistapuntosdeventa.agregar;
begin
    id:=princ.codigo('puntodeventa','puntoventa_id');
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Insert into puntodeventa (puntoventa_id, puntoventa_numero, puntoventa_descripcion, ');
    ZQuery2.sql.add('sucursal_id, puntoventa_controladorfiscalmodelo, puntoventa_controladorfiscalpuerto) ');
    ZQuery2.sql.add('values (:puntoventa_id, :puntoventa_numero, :puntoventa_descripcion, ');
    ZQuery2.sql.add(':sucursal_id, :puntoventa_controladorfiscalmodelo, :puntoventa_controladorfiscalpuerto) ');
    ZQuery2.parambyname('puntoventa_id').asstring:=id;
    ZQuery2.parambyname('puntoventa_numero').asstring:=puntoventa_numero.text;
    ZQuery2.parambyname('puntoventa_descripcion').asstring:=puntoventa_descripcion.text;
    ZQuery2.parambyname('sucursal_id').asstring:=sucursal_id.codigo;
    ZQuery2.parambyname('puntoventa_controladorfiscalmodelo').AsInteger:=puntoventa_controladorfiscalmodelo.ItemIndex+1;
    ZQuery2.parambyname('puntoventa_controladorfiscalpuerto').AsInteger:=puntoventa_controladorfiscalpuerto.ItemIndex+1;
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;

end;


procedure Tlistapuntosdeventa.modificar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('update puntodeventa set ');
    ZQuery2.sql.add('puntoventa_numero=:puntoventa_numero, ');
    ZQuery2.sql.add('puntoventa_descripcion=:puntoventa_descripcion, ');
    ZQuery2.sql.add('sucursal_id=:sucursal_id, ');
    ZQuery2.sql.add('puntoventa_controladorfiscalmodelo=:puntoventa_controladorfiscalmodelo, ');
    ZQuery2.sql.add('puntoventa_controladorfiscalpuerto=:puntoventa_controladorfiscalpuerto ');
    ZQuery2.sql.add('where puntoventa_id=:puntoventa_id');
    ZQuery2.parambyname('puntoventa_id').asstring:=id;
    ZQuery2.parambyname('puntoventa_numero').asstring:=puntoventa_numero.text;
    ZQuery2.parambyname('puntoventa_descripcion').asstring:=puntoventa_descripcion.text;
    ZQuery2.parambyname('sucursal_id').asstring:=sucursal_id.codigo;
    ZQuery2.parambyname('puntoventa_controladorfiscalmodelo').AsInteger:=puntoventa_controladorfiscalmodelo.ItemIndex+1;
    ZQuery2.parambyname('puntoventa_controladorfiscalpuerto').AsInteger:=puntoventa_controladorfiscalpuerto.ItemIndex+1;
    ZQuery2.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;

procedure Tlistapuntosdeventa.eliminar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('delete from puntodeventa where puntoventa_id=:puntoventa_id');
    ZQuery2.parambyname('puntoventa_id').asstring:=id;
    ZQuery2.ExecSQL;

    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;

function Tlistapuntosdeventa.control:boolean;
var
  error:integer;
begin
    error:=0;



    result:=error=0;
end;

procedure Tlistapuntosdeventa.btneliminarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar este punto de venta?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      eliminar;
end;

procedure Tlistapuntosdeventa.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.SQL.Text:='select * from puntodeventa '+
                       'inner join sucursales on puntodeventa.sucursal_id=sucursales.sucursal_id ' +
                       'where 1=1 '+princ.empresa_where;
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_id like "%'+fil_id.Text+'%"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "%'+fil_puntoventa_numero.Text+'%"';

    if fil_puntoventa_descripcion.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_descripcion like "%'+fil_puntoventa_descripcion.Text+'%"';

    if fil_sucursal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and sucursal_nombre like "%'+fil_sucursal_nombre.Text+'%"';


    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by puntoventa_numero';  
    ZQGrilla.Active:=true;

end;

procedure Tlistapuntosdeventa.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este punto de venta?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;

          end;
    end;
end;

procedure Tlistapuntosdeventa.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=2;
                Panelabm.Visible:=true;
                puntoventa_id.Text:=ZQGrilla.FieldByName('puntoventa_id').AsString;
                puntoventa_numero.Text:=ZQGrilla.FieldByName('puntoventa_numero').AsString;
                puntoventa_descripcion.Text:=ZQGrilla.FieldByName('puntoventa_descripcion').AsString;
                sucursal_id.llenarcombo;
                sucursal_id.Buscar(ZQGrilla.FieldByName('sucursal_id').AsString);
                puntoventa_controladorfiscalmodelo.ItemIndex:=ZQGrilla.FieldByName('puntoventa_controladorfiscalmodelo').AsInteger-1;
                puntoventa_controladorfiscalpuerto.ItemIndex:=ZQGrilla.FieldByName('puntoventa_controladorfiscalpuerto').AsInteger-1;
                puntoventa_numero.SetFocus;
            end;

      end;

end;

procedure Tlistapuntosdeventa.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    puntoventa_id.Text:=princ.codigo('puntodeventa','puntoventa_id');
    puntoventa_numero.Text:='';
    puntoventa_descripcion.Text:='';
    sucursal_id.llenarcombo;
    puntoventa_controladorfiscalmodelo.ItemIndex:=-1;
    puntoventa_controladorfiscalpuerto.ItemIndex:=-1;
    sucursal_id.SetFocus;
end;

end.
