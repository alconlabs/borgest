unit Unitlistaespeciesvariedades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  Tlistaespeciesvariedades = class(Tlistabase)
    fil_especie_nombre: TGTBEdit;
    Label1: TLabel;
    especie_id: TGTBEdit;
    Label5: TLabel;
    especie_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
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
  listaespeciesvariedades: Tlistaespeciesvariedades;

implementation

Uses Unitprinc;

{$R *.dfm}

function Tlistaespeciesvariedades.control:boolean;
var
  error:integer;
begin
    error:=0;



    result:=error=0;
end;


procedure Tlistaespeciesvariedades.eliminar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('delete from especies ');
    ZQuery2.Sql.Add('where especie_id=:especie_id ');
    ZQuery2.ParamByName('especie_id').AsString:=especie_id.Text;
    ZQuery2.ExecSql;

end;


procedure Tlistaespeciesvariedades.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update especies set ');
    ZQuery2.Sql.Add('especie_nombre=:especie_nombre ');
    ZQuery2.Sql.Add('where especie_id=:especie_id ');
    ZQuery2.ParamByName('especie_nombre').AsString:=especie_nombre.Text;
    ZQuery2.ParamByName('especie_id').AsString:=especie_id.Text;
    ZQuery2.ExecSql;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;

procedure Tlistaespeciesvariedades.agregar;
begin
    id:=princ.codigo('especies','especie_id');
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into especies set ');
    ZQuery2.Sql.Add('especie_nombre=:especie_nombre, ');
    ZQuery2.Sql.Add('especie_id=:especie_id ');
    ZQuery2.ParamByName('especie_nombre').AsString:=especie_nombre.Text;
    ZQuery2.ParamByName('especie_id').AsString:=id;
    ZQuery2.ExecSql;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Panelabm.Visible:=false;
    btnfiltrar.Click;
end;


procedure Tlistaespeciesvariedades.btneliminarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar esta especie?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      eliminar;
end;

procedure Tlistaespeciesvariedades.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.SQL.Text:='select * from especies where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and especie_id like "%'+fil_id.Text+'%"';

    if fil_especie_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and especie_nombre like "%'+fil_especie_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by especie_nombre';
    ZQGrilla.Active:=true;
end;

procedure Tlistaespeciesvariedades.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar esta especie?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                eliminar;

          end;
    end;
end;

procedure Tlistaespeciesvariedades.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=2;
                Panelabm.Visible:=true;
                especie_id.Text:=ZQGrilla.FieldByName('especie_id').AsString;
                especie_nombre.Text:=ZQGrilla.FieldByName('especie_nombre').AsString;
                especie_nombre.SetFocus;
            end;

      end;
end;

procedure Tlistaespeciesvariedades.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    especie_id.Text:=princ.codigo('especies','especie_id');
    especie_nombre.Text:='';
    especie_nombre.SetFocus;
end;

end.
