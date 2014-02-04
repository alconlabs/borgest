unit Unitbusquedabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, CustomizeGrid, GBTEdit;

type
  Tbusquedabase = class(TForm)
    panelgrilla: TAdvPanel;
    DBGrid1: TDBGrid;
    ZQGrilla: TZQuery;
    DSCGrilla: TDataSource;
    panelfiltros: TAdvPanel;
    btnfiltrar: TButton;
    ZQuery2: TZQuery;
    CustomizeGrid1: TCustomizeGrid;
    btnaceptar: TButton;
    AdvPanel1: TAdvPanel;
    btncancelar: TButton;
    fil_id: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
    procedure fil_idKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    abm:integer;
  public
    { Public declarations }
    campo_id:string;
    id:string;
    producto_codigoreferencia:string;
  end;

var
  busquedabase: Tbusquedabase;

implementation

uses UnitPrinc, UnitProductos;

{$R *.dfm}

procedure Tbusquedabase.btnaceptarClick(Sender: TObject);
begin
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                id:=ZQGrilla.FieldByName(campo_id).AsString;
                self.ModalResult:=mrOk;
            end;
      end;
end;

procedure Tbusquedabase.btnfiltrarClick(Sender: TObject);
begin
    ZQGrilla.Active:=false;
end;

procedure Tbusquedabase.DBGrid1TitleClick(Column: TColumn);
begin
    ZQGrilla.IndexFieldNames:=Column.FieldName;
end;

procedure Tbusquedabase.fil_idKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      btnfiltrar.Click;
end;

procedure Tbusquedabase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tbusquedabase.FormShow(Sender: TObject);
var
  i:integer;
begin
    for i:=0 to panelfiltros.ControlCount-1 do
      begin
          if panelfiltros.Controls[i] is TEdit then
            (panelfiltros.Controls[i] as TEdit).OnKeyPress:=fil_idKeyPress;

      end;

    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

end.
