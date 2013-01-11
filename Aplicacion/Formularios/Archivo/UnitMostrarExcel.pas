unit UnitMostrarExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, Grids, DBGrids;

type
  TMostrarExcel = class(TABMbase)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MostrarExcel: TMostrarExcel;

implementation

Uses UnitPrinc;

{$R *.dfm}

procedure TMostrarExcel.FormShow(Sender: TObject);
var
  i:integer;
begin
    inherited;
    for i := 0 to DBGrid1.Columns.Count-1 do
      begin
          DBGrid1.Columns.Items[i].Width:=100;
          case i of
              0:DBGrid1.Columns.Items[i].Title.Caption:='A';
              1:DBGrid1.Columns.Items[i].Title.Caption:='B';
              2:DBGrid1.Columns.Items[i].Title.Caption:='C';
              3:DBGrid1.Columns.Items[i].Title.Caption:='D';
              4:DBGrid1.Columns.Items[i].Title.Caption:='E';
              5:DBGrid1.Columns.Items[i].Title.Caption:='F';
              6:DBGrid1.Columns.Items[i].Title.Caption:='G';
              7:DBGrid1.Columns.Items[i].Title.Caption:='H';
              8:DBGrid1.Columns.Items[i].Title.Caption:='I';
              9:DBGrid1.Columns.Items[i].Title.Caption:='J';
             10:DBGrid1.Columns.Items[i].Title.Caption:='K';
             11:DBGrid1.Columns.Items[i].Title.Caption:='L';
             12:DBGrid1.Columns.Items[i].Title.Caption:='M';
             13:DBGrid1.Columns.Items[i].Title.Caption:='N';
             14:DBGrid1.Columns.Items[i].Title.Caption:='O';
             15:DBGrid1.Columns.Items[i].Title.Caption:='P';
             16:DBGrid1.Columns.Items[i].Title.Caption:='Q';
             17:DBGrid1.Columns.Items[i].Title.Caption:='R';
             18:DBGrid1.Columns.Items[i].Title.Caption:='S';
             19:DBGrid1.Columns.Items[i].Title.Caption:='T';
             20:DBGrid1.Columns.Items[i].Title.Caption:='U';
             21:DBGrid1.Columns.Items[i].Title.Caption:='V';
             22:DBGrid1.Columns.Items[i].Title.Caption:='W';
             23:DBGrid1.Columns.Items[i].Title.Caption:='X';
             24:DBGrid1.Columns.Items[i].Title.Caption:='Y';
             25:DBGrid1.Columns.Items[i].Title.Caption:='Z';
          end;
      end;

end;

end.
