unit Unitvendedoresdebcred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, UnitSqlComboBox,
  MoneyEdit, ComCtrls;

type
  Tvendedoresdebcred = class(Tlistabase)
    fil_vendedordebcred_fecha: TEdit;
    fil_personal_nombre: TEdit;
    fil_vendedordebcred_importe: TEdit;
    fil_vendedordebcred_tipo: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    vendedordebcred_estado: TLabel;
    Label4: TLabel;
    vendedordebcred_tipo: TComboBox;
    vendedordebcred_fecha: TDateTimePicker;
    vendedordebcred_descripcion: TEdit;
    vendedordebcred_importe: TMoneyEdit;
    personal_id: TSqlComboBox;
    vendedordebcred_id: TEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  vendedoresdebcred: Tvendedoresdebcred;

implementation

Uses UnitPrinc;

{$R *.dfm}

function Tvendedoresdebcred.Control:boolean;
var
  error:integer;
begin
    error:=0;

    result:=error=0;
end;


procedure Tvendedoresdebcred.eliminar;
begin
    ZQuery2.sql.clear;
    ZQuery2.sql.add('Delete from vendedoresdebcred');
    ZQuery2.sql.add(' where vendedordebcred_id=:vendedordebcred_id');
    ZQuery2.parambyname('vendedordebcred_id').asstring:=ZQGrilla.FieldByName('vendedordebcred_id').AsString;
    ZQuery2.ExecSQL;

end;

procedure Tvendedoresdebcred.FormShow(Sender: TObject);
begin
  inherited;
    btnanular.Visible:=false;
end;

procedure Tvendedoresdebcred.modificar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('update vendedoresdebcred set ');
    ZQuery2.Sql.Add('personal_id=:personal_id, ');
    ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
    ZQuery2.Sql.Add('vendedordebcred_importe=:vendedordebcred_importe, ');
    ZQuery2.Sql.Add('vendedordebcred_tipo=:vendedordebcred_tipo, ');
    ZQuery2.Sql.Add('vendedordebcred_descripcion=:vendedordebcred_descripcion, ');
    ZQuery2.Sql.Add('vendedordebcred_fecha=:vendedordebcred_fecha ');
    ZQuery2.Sql.Add('where vendedordebcred_id=:vendedordebcred_id ');
    ZQuery2.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQuery2.ParamByName('liquidacionvendedor_id').AsString:='0';
    ZQuery2.ParamByName('vendedordebcred_importe').AsString:=vendedordebcred_importe.Text;
    ZQuery2.ParamByName('vendedordebcred_tipo').AsString:=vendedordebcred_tipo.Text;
    ZQuery2.ParamByName('vendedordebcred_descripcion').AsString:=vendedordebcred_descripcion.Text;
    ZQuery2.ParamByName('vendedordebcred_fecha').AsString:=formatdatetime('yyyy-mm-dd',vendedordebcred_fecha.Date);
    ZQuery2.ParamByName('vendedordebcred_id').AsString:=vendedordebcred_id.Text;
    ZQuery2.ExecSql;



end;


procedure Tvendedoresdebcred.agregar;
begin
    ZQuery2.Sql.Clear;
    ZQuery2.Sql.Add('insert into vendedoresdebcred set ');
    ZQuery2.Sql.Add('personal_id=:personal_id, ');
    ZQuery2.Sql.Add('liquidacionvendedor_id=:liquidacionvendedor_id, ');
    ZQuery2.Sql.Add('vendedordebcred_importe=:vendedordebcred_importe, ');
    ZQuery2.Sql.Add('vendedordebcred_tipo=:vendedordebcred_tipo, ');
    ZQuery2.Sql.Add('vendedordebcred_descripcion=:vendedordebcred_descripcion, ');
    ZQuery2.Sql.Add('vendedordebcred_fecha=:vendedordebcred_fecha, ');
    ZQuery2.Sql.Add('vendedordebcred_id=:vendedordebcred_id ');
    ZQuery2.ParamByName('personal_id').AsString:=personal_id.codigo;
    ZQuery2.ParamByName('liquidacionvendedor_id').AsString:='0';
    ZQuery2.ParamByName('vendedordebcred_importe').AsString:=vendedordebcred_importe.Text;
    ZQuery2.ParamByName('vendedordebcred_tipo').AsString:=vendedordebcred_tipo.Text;
    ZQuery2.ParamByName('vendedordebcred_descripcion').AsString:=vendedordebcred_descripcion.Text;
    ZQuery2.ParamByName('vendedordebcred_fecha').AsString:=formatdatetime('yyyy-mm-dd',vendedordebcred_fecha.Date);
    ZQuery2.ParamByName('vendedordebcred_id').AsString:=Princ.codigo('vendedoresdebcred','vendedordebcred_id');
    ZQuery2.ExecSql;



end;

procedure Tvendedoresdebcred.btneliminarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar este registro?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          eliminar;

          btnfiltrar.Click;


      end;
end;

procedure Tvendedoresdebcred.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from vendedoresdebcred '+
                       'inner join personal on vendedoresdebcred.personal_id=personal.personal_id '+
                       'where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedordebcred_id like "%'+fil_id.Text+'"';

    if fil_vendedordebcred_fecha.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedordebcred_fecha like "%'+fil_vendedordebcred_fecha.Text+'%"';

    if fil_personal_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and personal_nombre like "%'+fil_personal_nombre.Text+'%"';

    if fil_vendedordebcred_importe.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedordebcred_importe like "%'+fil_vendedordebcred_importe.Text+'%"';

    if fil_vendedordebcred_tipo.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and vendedordebcred_tipo like "%'+fil_vendedordebcred_tipo.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by vendedordebcred_fecha, personal_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tvendedoresdebcred.btnguardarClick(Sender: TObject);
begin
  inherited;
    case abm of
        1:begin  //agregar
              if control then
                begin
                    abm:=0;
                    agregar;
                    Panelabm.Visible:=false;

                end;


          end;
        2:begin  //modificar
              if control then
                begin
                    modificar;
                    abm:=0;

                    Panelabm.Visible:=false;

                end;

          end;

    end;
end;

procedure Tvendedoresdebcred.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          personal_id.llenarcombo;
          vendedordebcred_id.Text:=ZQGrilla.FieldByName('vendedordebcred_id').AsString;
          vendedordebcred_fecha.Date:=ZQGrilla.FieldByName('vendedordebcred_fecha').AsDateTime;
          personal_id.Buscar(ZQGrilla.FieldByName('personal_id').AsString);
          vendedordebcred_tipo.Text:=ZQGrilla.FieldByName('vendedordebcred_tipo').AsString;
          vendedordebcred_descripcion.Text:=ZQGrilla.FieldByName('vendedordebcred_descripcion').AsString;
          vendedordebcred_importe.Text:=ZQGrilla.FieldByName('vendedordebcred_importe').AsString;
          vendedordebcred_estado.Caption:=ZQGrilla.FieldByName('vendedordebcred_estado').AsString;
          Panelabm.Visible:=true;
          personal_id.SetFocus;

      end;
end;

procedure Tvendedoresdebcred.btnnuevoClick(Sender: TObject);
begin
  inherited;
    abm:=1;
    Panelabm.Visible:=true;
    vendedordebcred_id.Text:=Princ.codigo('vendedoresdebcred','vendedordebcred_id');
    vendedordebcred_fecha.Date:=date;
    vendedordebcred_tipo.ItemIndex:=0;
    personal_id.llenarcombo;
    vendedordebcred_descripcion.Text:='';
    vendedordebcred_importe.Text:='0';
    vendedordebcred_estado.Caption:='PENDIENTE';
end;

end.
