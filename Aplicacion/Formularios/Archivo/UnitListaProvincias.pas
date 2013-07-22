unit UnitListaProvincias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel,
  UnitSqlComboBox;

type
  TListaProvincias = class(Tlistabase)
    fil_provincia_nombre: TEdit;
    fil_pais_nombre: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    provincia_id: TEdit;
    provincia_nombre: TEdit;
    pais_id: TSqlComboBox;
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
  ListaProvincias: TListaProvincias;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TListaProvincias.eliminar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('delete from provincias ');
    ZQuery2.Sql.Add('where provincia_id=:provincia_id ');
    ZQuery2.ParamByName('provincia_id').AsString:=ZQGrilla.FieldByName('provincia_id').AsString;
    ZQuery2.ExecSql;


    ZQGrilla.Active:=false;
    ZQGrilla.Active:=true;

    Panelabm.Visible:=false;


end;

procedure TListaProvincias.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update provincias set ');
    ZQuery2.Sql.Add('pais_id=:pais_id, ');
    ZQuery2.Sql.Add('provincia_nombre=:provincia_nombre ');
    ZQuery2.Sql.Add('where provincia_id=:provincia_id ');
    ZQuery2.ParamByName('pais_id').AsString:=pais_id.codigo;
    ZQuery2.ParamByName('provincia_nombre').AsString:=provincia_nombre.Text;
    ZQuery2.ParamByName('provincia_id').AsString:=provincia_id.Text;
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;


end;


procedure TListaProvincias.agregar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into provincias set ');
    ZQuery2.Sql.Add('pais_id=:pais_id, ');
    ZQuery2.Sql.Add('provincia_nombre=:provincia_nombre, ');
    ZQuery2.Sql.Add('provincia_id=:provincia_id ');
    ZQuery2.ParamByName('pais_id').AsString:=pais_id.codigo;
    ZQuery2.ParamByName('provincia_nombre').AsString:=provincia_nombre.Text;
    ZQuery2.ParamByName('provincia_id').AsString:=princ.codigo('provincias','provincia_id');
    ZQuery2.ExecSql;

    Panelabm.Visible:=false;
end;



function TListaProvincias.control:boolean;
var
  error:integer;
begin
    error:=0;

    if provincia_nombre.Text='' then
      error:=1;

    if pais_id.Text='' then
      error:=2;




    case error of
        1:begin
              MessageDlg('Ingrese nombre de la provincia', mtError, [mbOK], 0);
              provincia_nombre.SetFocus;
          end;

        2:begin
              MessageDlg('Seleccione un pais', mtError, [mbOK], 0);
              pais_id.SetFocus;
          end;



    end;

    if error=0 then
      result:=true
    else
      result:=false;

      
end;

procedure TListaProvincias.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          if Application.MessageBox('Seguro desea eliminar esta provincia?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
            eliminar;

      end;
end;

procedure TListaProvincias.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from provincias inner join paises on provincias.pais_id=paises.pais_id where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_id like "'+primercaracter+fil_id.Text+'"';

    if fil_provincia_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and provincia_nombre like "'+primercaracter+fil_provincia_nombre.Text+'%"';

    if fil_pais_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and pais_nombre like "'+primercaracter+fil_pais_nombre.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by provincia_nombre';

    ZQGrilla.Active:=true;
end;

procedure TListaProvincias.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin  //agregar
              if control then
                begin
                    agregar;
                    abm:=0;
                    ZQGrilla.Active:=false;
                    ZQGrilla.Active:=true;

                    Panelabm.Visible:=false;

                end;


          end;
        2:begin  //modificar
              if control then
                begin
                    modificar;
                    abm:=0;
                    ZQGrilla.Active:=false;
                    ZQGrilla.Active:=true;

                    Panelabm.Visible:=false;

                end;

          end;

        3:begin  //eliminar
              if Application.MessageBox('Seguro desea eliminar este proveedor?','Eliminar',MB_ICONQUESTION + MB_YESNO)=IDYES then
                eliminar;

          end;


    end;
end;

procedure TListaProvincias.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          provincia_id.Text:=ZQGrilla.FieldByName('provincia_id').AsString;
          provincia_nombre.Text:=ZQGrilla.FieldByName('provincia_nombre').AsString;
          pais_id.llenarcombo;
          pais_id.Buscar(ZQGrilla.FieldByName('pais_id').AsString);
          Panelabm.Visible:=true;
          provincia_nombre.SetFocus;

      end;
end;

procedure TListaProvincias.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    provincia_id.Text:=princ.codigo('provincias','provincia_id');
    provincia_nombre.Text:='';
    provincia_nombre.SetFocus;
    pais_id.llenarcombo;
end;

end.
