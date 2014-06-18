unit UnitCurva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, UnitSqlComboBox, Grids, DBGrids;

type
  TCurva = class(TABMbase)
    Label15: TLabel;
    curva_id: TEdit;
    Label3: TLabel;
    curva_descripcion: TEdit;
    Label21: TLabel;
    marca_id: TSqlComboBox;
    Label1: TLabel;
    seccion_id: TSqlComboBox;
    Label2: TLabel;
    rubro_id: TSqlComboBox;
    DTSCurvadetalles: TDataSource;
    ZQCurvadetalles: TZQuery;
    DBGrid1: TDBGrid;
    ZQCurvadetallescurvadetalle_id: TIntegerField;
    ZQCurvadetallescurvadetalle_talle: TStringField;
    ZQCurvadetallescurva_id: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
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
  Curva: TCurva;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TCurva.btnguardarClick(Sender: TObject);
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
        ABM_ELIMINAR:begin
            if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
              eliminar;
        end;
        ABM_CLONAR:begin
            abm:=ABM_AGREGAR;
            if control then
              agregar;
        end;

    end;

    Self.Close;

end;

function TCurva.control:boolean;
var
  error:integer;
begin
    error:=0;


    result:=error=0;
end;


procedure TCurva.agregar;
begin
    id:=Princ.codigo('curvas','curva_id');

    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('insert into curvas set ');
    ZQExecSql.Sql.Add('rubro_id=:rubro_id, ');
    ZQExecSql.Sql.Add('marca_id=:marca_id, ');
    ZQExecSql.Sql.Add('seccion_id=:seccion_id, ');
    ZQExecSql.Sql.Add('curva_descripcion=:curva_descripcion, ');
    ZQExecSql.Sql.Add('curva_id=:curva_id ');

    ZQExecSql.ParamByName('rubro_id').AsString:=rubro_id.codigo;
    ZQExecSql.ParamByName('marca_id').AsString:=marca_id.codigo;
    ZQExecSql.ParamByName('seccion_id').AsString:=seccion_id.codigo;
    ZQExecSql.ParamByName('curva_descripcion').AsString:=curva_descripcion.Text;
    ZQExecSql.ParamByName('curva_id').AsString:=id;
    ZQExecSql.ExecSql;


    ZQCurvadetalles.First;
    while not ZQCurvadetalles.Eof do
        begin
            ZQExecSql.Sql.Clear;
            ZQExecSql.Sql.Add('insert into curvadetalles set ');
            ZQExecSql.Sql.Add('curva_id=:curva_id, ');
            ZQExecSql.Sql.Add('curvadetalle_talle=:curvadetalle_talle, ');
            ZQExecSql.Sql.Add('curvadetalle_id=:curvadetalle_id ');
            ZQExecSql.ParamByName('curva_id').AsString:=id;
            ZQExecSql.ParamByName('curvadetalle_talle').AsString:=ZQCurvadetalles.FieldByName('curvadetalle_talle').AsString;
            ZQExecSql.ParamByName('curvadetalle_id').AsString:=Princ.codigo('curvadetalles','curvadetalle_id');
            ZQExecSql.ExecSql;

            ZQCurvadetalles.Next;
        end;



end;

procedure TCurva.modificar;
begin

    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('update curvas set ');
    ZQExecSql.Sql.Add('rubro_id=:rubro_id, ');
    ZQExecSql.Sql.Add('marca_id=:marca_id, ');
    ZQExecSql.Sql.Add('seccion_id=:seccion_id, ');
    ZQExecSql.Sql.Add('curva_descripcion=:curva_descripcion ');
    ZQExecSql.Sql.Add('where curva_id=:curva_id ');
    ZQExecSql.ParamByName('rubro_id').AsString:=rubro_id.codigo;
    ZQExecSql.ParamByName('marca_id').AsString:=marca_id.codigo;
    ZQExecSql.ParamByName('seccion_id').AsString:=seccion_id.codigo;
    ZQExecSql.ParamByName('curva_descripcion').AsString:=curva_descripcion.Text;
    ZQExecSql.ParamByName('curva_id').AsString:=id;
    ZQExecSql.ExecSql;

    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('delete from curvadetalles ');
    ZQExecSql.Sql.Add('where curva_id=:curva_id ');
    ZQExecSql.ParamByName('curva_id').AsString:=id;
    ZQExecSql.ExecSql;



    ZQCurvadetalles.First;
    while not ZQCurvadetalles.Eof do
        begin
            ZQExecSql.Sql.Clear;
            ZQExecSql.Sql.Add('insert into curvadetalles set ');
            ZQExecSql.Sql.Add('curva_id=:curva_id, ');
            ZQExecSql.Sql.Add('curvadetalle_talle=:curvadetalle_talle, ');
            ZQExecSql.Sql.Add('curvadetalle_id=:curvadetalle_id ');
            ZQExecSql.ParamByName('curva_id').AsString:=id;
            ZQExecSql.ParamByName('curvadetalle_talle').AsString:=ZQCurvadetalles.FieldByName('curvadetalle_talle').AsString;
            ZQExecSql.ParamByName('curvadetalle_id').AsString:=Princ.codigo('curvadetalles','curvadetalle_id');
            ZQExecSql.ExecSql;

            ZQCurvadetalles.Next;
        end;

end;

procedure TCurva.eliminar;
begin
    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('delete from curvadetalles ');
    ZQExecSql.Sql.Add('where curva_id=:curva_id ');
    ZQExecSql.ParamByName('curva_id').AsString:=id;
    ZQExecSql.ExecSql;

    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('delete from curvas ');
    ZQExecSql.Sql.Add('where curva_id=:curva_id ');
    ZQExecSql.ParamByName('curva_id').AsString:=id;
    ZQExecSql.ExecSql;

end;


procedure TCurva.FormCreate(Sender: TObject);
begin
  inherited;
    marca_id.llenarcombo;
    try
      marca_id.ItemIndex:=1;
    except
    end;

    seccion_id.llenarcombo;
    try
      seccion_id.ItemIndex:=1;
    except
    end;

    rubro_id.llenarcombo;
    try
      rubro_id.ItemIndex:=1;
    except
    end;
end;

procedure TCurva.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('curva_id').AsString:=id;
    ZQSelect.Active:=true;
end;

procedure TCurva.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    if abm=1 then
      begin
          curva_id.Text:=Princ.codigo('curvas','curva_id');
          curva_descripcion.Text:='';
          marca_id.Buscar('');
          seccion_id.Buscar('');
          rubro_id.Buscar('');
      end
    else
      begin
          curva_id.Text:=ZQSelect.FieldByName('curva_id').AsString;
          curva_descripcion.Text:=ZQSelect.FieldByName('curva_descripcion').AsString;
          marca_id.Buscar(ZQSelect.FieldByName('marca_id').AsString);
          seccion_id.Buscar(ZQSelect.FieldByName('seccion_id').AsString);
          rubro_id.Buscar(ZQSelect.FieldByName('rubro_id').AsString);
      end;

    ZQCurvadetalles.Active:=false;
    ZQCurvadetalles.SQL.Text:='select * from curvadetalles where curva_id="'+id+'"';
    ZQCurvadetalles.Active:=true;

end;

end.
