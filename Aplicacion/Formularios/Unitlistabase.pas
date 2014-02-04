unit Unitlistabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, UnitSqlComboBox,
  GBTEdit, ComCtrls;

type
  Tlistabase = class(TForm)
    panelgrilla: TAdvPanel;
    panelabm: TAdvPanel;
    panelbotonera: TAdvPanel;
    DBGrid1: TDBGrid;
    btneliminar: TButton;
    btnmodificar: TButton;
    btnnuevo: TButton;
    ZQGrilla: TZQuery;
    DSCgrilla: TDataSource;
    panelfiltros: TAdvPanel;
    btnfiltrar: TButton;
    ZQuery2: TZQuery;
    btnanular: TButton;
    btnguardar: TButton;
    btncancelar: TButton;
    fil_id: TGTBEdit;
    StatusBar1: TStatusBar;
    btnver: TButton;
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure fil_idKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ZQGrillaAfterOpen(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    leyenda_barra_estado:string;
    procedure ArmarLeyendaBarraEstado;
  protected
    { Private declarations }
    tipo_busqueda:integer;
  public
    { Public declarations }
    campo_id:string;
    abm:integer;
    id:string;
    primercaracter:string;
  end;

var
  listabase: Tlistabase;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tlistabase.ArmarLeyendaBarraEstado;
begin
    case tipo_busqueda of
        1:begin
              StatusBar1.Panels[1].Text:='Tipo de busqueda (F2): Contenga a...';
          end;

        2:begin
              StatusBar1.Panels[1].Text:='Tipo de busqueda (F2): Comience con.';
          end;
    end;

    if ZQGrilla.Active then
      begin
          StatusBar1.Panels[0].Text:=inttostr(ZQGrilla.RecordCount)+' registros.';

      end;

    panelgrilla.StatusBar.Text:=leyenda_barra_estado;

end;

procedure Tlistabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.BringToFront;
end;

procedure Tlistabase.FormCreate(Sender: TObject);
begin
    tipo_busqueda:=1;
    abm:=0;
    id:='';
    campo_id:='';
    leyenda_barra_estado:='';
//MessageDlg('end create', mtWarning, [mbOK], 0);
end;

procedure Tlistabase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
    if Key=VK_F2 then
      begin
          if tipo_busqueda=1 then
            tipo_busqueda:=2
          else
            tipo_busqueda:=1;
          ArmarLeyendaBarraEstado;
      end;
end;

procedure Tlistabase.FormShow(Sender: TObject);
var
  i:integer;
  grid_col:integer;
begin
//    MessageDlg('begin show', mtWarning, [mbOK], 0);
//here we should call the procedure to enable or don't the columns of the grid 
    tipo_busqueda:=strtoint(Princ.GetConfiguracion('TIPOBUSQUEDA'));
    Princ.ConfigurarColumnas(self.DBGrid1);

    for i:=0 to panelfiltros.ControlCount-1 do
      begin
          if panelfiltros.Controls[i] is TEdit then
            begin
                (panelfiltros.Controls[i] as TEdit).OnKeyPress:=fil_idKeyPress;

            end;

          if panelfiltros.Controls[i] is TGTBEdit then
            begin
                if (panelfiltros.Controls[i] as TGTBEdit).FieldName<>'' then
                  begin
                      for grid_col := 0 to DBGrid1.Columns.Count-1 do
                        begin
                            if DBGrid1.Columns.Items[grid_col].FieldName=(panelfiltros.Controls[i] as TGTBEdit).FieldName then
                              (panelfiltros.Controls[i] as TGTBEdit).Visible:=DBGrid1.Columns.Items[grid_col].Visible;

                        end;

                  end;
            end;
      end;

    ArmarLeyendaBarraEstado;

    Princ.Permisos1.ConsultarPermisosLista(self.ClassName);
    btnnuevo.Enabled:=Princ.Permisos1.Permiso_agregar;
    btnmodificar.Enabled:=Princ.Permisos1.Permiso_modificar;
    btneliminar.Enabled:=Princ.Permisos1.Permiso_eliminar;
    btnanular.Enabled:=Princ.Permisos1.Permiso_anular;
    btnver.Enabled:=Princ.Permisos1.Permiso_ver;
    btnfiltrar.Enabled:=Princ.Permisos1.Permiso_habilitado;

    princ.Permisos1.guardarlog(self.ClassName+'.Show');

//    MessageDlg('end show', mtWarning, [mbOK], 0);
end;

procedure Tlistabase.ZQGrillaAfterOpen(DataSet: TDataSet);
begin
    ArmarLeyendaBarraEstado
end;

procedure Tlistabase.btnanularClick(Sender: TObject);
begin
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=4;
                id:=ZQGrilla.FieldByName(campo_id).AsString;
            end;
      end;
end;

procedure Tlistabase.btncancelarClick(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

procedure Tlistabase.btneliminarClick(Sender: TObject);
begin
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=3;
                id:=ZQGrilla.FieldByName(campo_id).AsString;
            end;
      end;
end;

procedure Tlistabase.btnmodificarClick(Sender: TObject);
begin
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                abm:=2;
                id:=ZQGrilla.FieldByName(campo_id).AsString;
            end;
      end;

end;

procedure Tlistabase.btnnuevoClick(Sender: TObject);
begin
    abm:=1;
    id:='';

end;

procedure Tlistabase.DBGrid1TitleClick(Column: TColumn);
begin
    ZQGrilla.IndexFieldNames:=Column.FieldName;
end;

procedure Tlistabase.fil_idKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      btnfiltrar.Click;

end;

procedure Tlistabase.btnfiltrarClick(Sender: TObject);
begin
    primercaracter:='%';
    case tipo_busqueda of
              1:begin
                    primercaracter:='%';
              end;

              2:begin
                    primercaracter:='';
              end;
    end;
    
    ZQGrilla.Active:=false;

end;

end.
