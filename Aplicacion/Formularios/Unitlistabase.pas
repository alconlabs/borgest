unit Unitlistabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, UnitSqlComboBox,
  GBTEdit;

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
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure fil_idKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    { Private declarations }

  public
    { Public declarations }
    campo_id:string;
    abm:integer;
    id:string;
  end;

var
  listabase: Tlistabase;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tlistabase.FormCreate(Sender: TObject);
begin
    abm:=0;
    id:='';
    campo_id:='';
end;

procedure Tlistabase.btnanularClick(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=4;
          id:=ZQGrilla.FieldByName(campo_id).AsString;

      end;
end;

procedure Tlistabase.btncancelarClick(Sender: TObject);
begin
    abm:=0;
    Panelabm.Visible:=false;
end;

procedure Tlistabase.btneliminarClick(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=3;
          id:=ZQGrilla.FieldByName(campo_id).AsString;

      end;

end;

procedure Tlistabase.btnmodificarClick(Sender: TObject);
begin
    if ZQGrilla.RecordCount>0 then
      begin
          abm:=2;
          id:=ZQGrilla.FieldByName(campo_id).AsString;

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
    ZQGrilla.Active:=false;

end;

end.
