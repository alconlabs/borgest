unit UnitImprimirEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, AdvEdit, AdvEdBtn, EditCodi, MoneyEdit, Grids,
  DBGrids;

type
  TImprimirEtiquetas = class(TABMbase)
    Label3: TLabel;
    producto_id: TEditCodi;
    producto_nombre: TEdit;
    Label6: TLabel;
    imprimiretiqueta_cantidad: TMoneyEdit;
    btnagregar: TButton;
    DSCEtiquetas: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    total_etiquetas: TMoneyEdit;
    btnquitar: TButton;
    procedure producto_idClickBtn(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQSelectAfterOpen(DataSet: TDataSet);
    procedure btnquitarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    temporal_idproceso:string;
  end;

var
  ImprimirEtiquetas: TImprimirEtiquetas;

implementation

uses Unitbusquedaproductos, UnitPrinc;

{$R *.dfm}

procedure TImprimirEtiquetas.btnagregarClick(Sender: TObject);
begin
  inherited;
    if (producto_id.Text<>'') and (imprimiretiqueta_cantidad.Value>0) then
      begin
          ZQExecSQL.Sql.Clear;
          ZQExecSQL.Sql.Add('insert into imprimiretiquetas set ');
          ZQExecSQL.Sql.Add('imprimiretiqueta_precio=:imprimiretiqueta_precio, ');
          ZQExecSQL.Sql.Add('imprimiretiqueta_cantidad=:imprimiretiqueta_cantidad, ');
          ZQExecSQL.Sql.Add('imprimiretiqueta_descripcion=:imprimiretiqueta_descripcion, ');
          ZQExecSQL.Sql.Add('imprimiretiqueta_codigo=:imprimiretiqueta_codigo, ');
          ZQExecSQL.Sql.Add('imprimiretiqueta_id=:imprimiretiqueta_id ');
          ZQExecSQL.ParamByName('imprimiretiqueta_precio').AsString:='0';
          ZQExecSQL.ParamByName('imprimiretiqueta_cantidad').AsString:=imprimiretiqueta_cantidad.Text;
          ZQExecSQL.ParamByName('imprimiretiqueta_descripcion').AsString:=producto_nombre.Text;
          ZQExecSQL.ParamByName('imprimiretiqueta_codigo').AsString:=producto_id.valor(Princ.CAMPO_ID_PRODUCTO);
          ZQExecSQL.ParamByName('imprimiretiqueta_id').AsString:=Princ.codigo('imprimiretiquetas','imprimiretiqueta_id');
          ZQExecSQL.ExecSql;

          ZQSelect.Active:=false;
          ZQSelect.Active:=true;


      end;

end;

procedure TImprimirEtiquetas.btnguardarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;

    temporal_idproceso:=Princ.codigo('temporales','temporal_idproceso');

    ZQSelect.First;
    while not ZQSelect.Eof do
        begin
            for i := 0 to ZQSelect.FieldByName('imprimiretiqueta_cantidad').AsInteger-1 do
              begin
                  ZQExecSQL.Sql.Clear;
                  ZQExecSQL.Sql.Add('insert into temporales set ');
                  ZQExecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
                  ZQExecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
                  ZQExecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');
                  ZQExecSQL.ParamByName('temporal_string2').AsString:=ZQSelect.FieldByName('imprimiretiqueta_descripcion').AsString;
                  ZQExecSQL.ParamByName('temporal_string1').AsString:=ZQSelect.FieldByName('imprimiretiqueta_codigo').AsString;
                  ZQExecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
                  ZQExecSQL.ExecSql;


              end;

            ZQSelect.Next;
        end;


    Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'etiquetas.rep';

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from temporales '+
                                                   'where temporal_idproceso="'+temporal_idproceso+'" ';

    Princ.VCLReport1.Execute;



end;

procedure TImprimirEtiquetas.btnquitarClick(Sender: TObject);
begin
  inherited;
    if ZQSelect.Active then
      begin
          if ZQSelect.RecordCount>0 then
            begin
                if (MessageDlg('Seguro desea quitar estas etiquetas?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
                  begin
                      ZQExecSQL.Sql.Clear;
                      ZQExecSQL.Sql.Add('delete from imprimiretiquetas ');
                      ZQExecSQL.Sql.Add('where imprimiretiqueta_id=:imprimiretiqueta_id ');
                      ZQExecSQL.ParamByName('imprimiretiqueta_id').AsString:=ZQSelect.FieldByName('imprimiretiqueta_id').AsString;
                      ZQExecSQL.ExecSql;

                      ZQSelect.Active:=false;
                      ZQSelect.Active:=true;

                  end;

            end;

      end;

end;

procedure TImprimirEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if temporal_idproceso<>'' then
      begin
          ZQExecSQL.Sql.Clear;
          ZQExecSQL.Sql.Add('delete from temporales ');
          ZQExecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          ZQExecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          ZQExecSQL.ExecSql;
      end;
  inherited;      
end;

procedure TImprimirEtiquetas.FormShow(Sender: TObject);
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.Active:=true;
end;

procedure TImprimirEtiquetas.producto_idClickBtn(Sender: TObject);
begin
  inherited;
    busquedaproductos:=Tbusquedaproductos.Create(self);
    busquedaproductos.ConfCampoBusqueda1:=producto_id.ConfCampoBusqueda1;
    if busquedaproductos.ShowModal=mrOk then
      begin
          producto_id.Text:=busquedaproductos.producto_id;
          producto_id.Search(busquedaproductos.producto_id);

      end;

    busquedaproductos.Free;
end;

procedure TImprimirEtiquetas.ZQSelectAfterOpen(DataSet: TDataSet);
begin
  inherited;
    ZQSelect.First;
    total_etiquetas.Value:=0;
    while not ZQSelect.Eof do
        begin
            total_etiquetas.Value:=total_etiquetas.Value+ZQSelect.FieldByName('imprimiretiqueta_cantidad').AsInteger;


            ZQSelect.Next;
        end;
end;

end.
