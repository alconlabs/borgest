unit UnitControlEntidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TControlEntidad = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    entidadrol_descripcion: TEdit;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    btnguardar: TButton;
    btncancelar: TButton;
    Label26: TLabel;
    entidad_id: TSqlComboBox;
    Label2: TLabel;
    rol_id: TSqlComboBox;
    entidadrol_contrganancias: TCheckBox;
    ZQSelect: TZQuery;
    ZQExecSql: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnguardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  ControlEntidad: TControlEntidad;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TControlEntidad.btnguardarClick(Sender: TObject);
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
              if (MessageDlg('Seguro desea eliminar este Registro?', mtWarning, [mbOK, mbCancel], 0) in [mrOk, mrNone]) then
                eliminar;


          end;
    end;
end;

function TControlEntidad.control;
var
 error:integer;
begin
    error:=0;

    Result:=error=0;
end;


procedure TControlEntidad.agregar;
begin
    id:=Princ.codigo('entidadrol','entidadrol_id');

    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('insert into entidadrol set ');
    ZQExecSql.Sql.Add('rol_id=:rol_id, ');
    ZQExecSql.Sql.Add('entidad_id=:entidad_id, ');
    ZQExecSql.Sql.Add('entidadrol_descripcion=:entidadrol_descripcion, ');
    ZQExecSql.Sql.Add('entidadrol_contrganancias=:entidadrol_contrganancias, ');
    ZQExecSql.Sql.Add('entidadrol_id=:entidadrol_id ');
    ZQExecSql.ParamByName('rol_id').AsString:=rol_id.codigo;
    ZQExecSql.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSql.ParamByName('entidadrol_descripcion').AsString:=entidadrol_descripcion.Text;
    ZQExecSql.ParamByName('entidadrol_contrganancias').AsString:=booltostr(entidadrol_contrganancias.Checked);
    ZQExecSql.ParamByName('entidadrol_id').AsString:=id;
    ZQExecSql.ExecSql;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;

end;


procedure TControlEntidad.modificar;
begin
    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('update entidadrol set ');
    ZQExecSql.Sql.Add('rol_id=:rol_id, ');
    ZQExecSql.Sql.Add('entidad_id=:entidad_id, ');
    ZQExecSql.Sql.Add('entidadrol_descripcion=:entidadrol_descripcion, ');
    ZQExecSql.Sql.Add('entidadrol_contrganancias=:entidadrol_contrganancias ');
    ZQExecSql.Sql.Add('where entidadrol_id=:entidadrol_id ');
    ZQExecSql.ParamByName('rol_id').AsString:=rol_id.codigo;
    ZQExecSql.ParamByName('entidad_id').AsString:=entidad_id.codigo;
    ZQExecSql.ParamByName('entidadrol_descripcion').AsString:=entidadrol_descripcion.Text;
    ZQExecSql.ParamByName('entidadrol_contrganancias').AsString:=booltostr(entidadrol_contrganancias.Checked);
    ZQExecSql.ParamByName('entidadrol_id').AsString:=id;
    ZQExecSql.ExecSql;

    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
    Self.Close;


end;

procedure TControlEntidad.eliminar;
begin
    ZQExecSql.Sql.Clear;
    ZQExecSql.Sql.Add('delete from entidadrol ');
    ZQExecSql.Sql.Add('where entidadrol_id=:entidadrol_id ');
    ZQExecSql.ParamByName('entidadrol_id').AsString:=id;
    ZQExecSql.ExecSql;

    MessageDlg('Datos borrados.', mtInformation, [mbOK], 0);
    Self.Close;


end;

procedure TControlEntidad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;

procedure TControlEntidad.FormCreate(Sender: TObject);
begin
    entidad_id.llenarcombo;
    entidad_id.ItemIndex:=0;
    rol_id.llenarcombo;
    rol_id.ItemIndex:=0;
end;

procedure TControlEntidad.FormShow(Sender: TObject);
begin
    ZQSelect.Active:=false;
    if abm<>1 then
      begin
          ZQSelect.Active:=false;
          ZQSelect.ParamByName('entidadrol_id').AsString:=id;
          ZQSelect.Active:=true;
      end;

end;

procedure TControlEntidad.ZQSelectAfterOpen(DataSet: TDataSet);
begin
    entidad_id.Buscar(ZQSelect.FieldByName('entidad_id').AsString);
    rol_id.Buscar(ZQSelect.FieldByName('rol_id').AsString);
    entidadrol_descripcion.Text:=ZQSelect.FieldByName('entidadrol_descripcion').AsString;
    entidadrol_contrganancias.Checked:=strtobool(ZQSelect.FieldByName('entidadrol_contrganancias').AsString);
end;

end.
