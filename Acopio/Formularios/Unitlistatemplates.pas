unit Unitlistatemplates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, UnitSqlComboBox,
  GBTEdit, CustomizeGrid;

type
  Tlistatemplates = class(TForm)
    ZQGrilla: TZQuery;
    DSCgrilla: TDataSource;
    ZQuery2: TZQuery;
    panelbotonera: TAdvPanel;
    btnnuevo: TAdvGlowButton;
    btneditar: TAdvGlowButton;
    btneliminar: TAdvGlowButton;
    btnanular: TAdvGlowButton;
    btnsalir: TAdvGlowButton;
    fil_id: TEdit;
    CustomizeGrid1: TCustomizeGrid;
    AdvPanel1: TAdvPanel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure btnanularClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure fil_idChange(Sender: TObject);
  private
    { Private declarations }
    procedure busqueda;
  protected
    { Private declarations }

  public
    { Public declarations }
    campo_id:string;
    abm:integer;
    id:string;
  end;

var
  listatemplates: Tlistatemplates;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure Tlistatemplates.FormCreate(Sender: TObject);
begin
    abm:=0;
    id:='';
    campo_id:='';
end;

procedure Tlistatemplates.btneditarClick(Sender: TObject);
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

procedure Tlistatemplates.btnnuevoClick(Sender: TObject);
begin
    abm:=1;
    id:='';

end;

procedure Tlistatemplates.btneliminarClick(Sender: TObject);
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

procedure Tlistatemplates.btnanularClick(Sender: TObject);
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

procedure Tlistatemplates.btnsalirClick(Sender: TObject);
begin
   CLOSE;
   FREE;
end;

procedure Tlistatemplates.btncancelarClick(Sender: TObject);
begin
    abm:=0;
end;

procedure Tlistatemplates.busqueda;
begin
    ZQGrilla.Active:=false;
end;

procedure Tlistatemplates.fil_idChange(Sender: TObject);
begin
     busqueda;
end;

end.
