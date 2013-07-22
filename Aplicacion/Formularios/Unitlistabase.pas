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
begin
//    MessageDlg('begin show', mtWarning, [mbOK], 0);
    for i:=0 to panelfiltros.ControlCount-1 do
      begin
          if panelfiltros.Controls[i] is TEdit then
            (panelfiltros.Controls[i] as TEdit).OnKeyPress:=fil_idKeyPress;

      end;

    ArmarLeyendaBarraEstado;
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
