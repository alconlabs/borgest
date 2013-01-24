unit UnitlistaRoles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistatemplates, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, AdvGlowButton, ExtCtrls,
  AdvPanel;

type
  TlistaRoles = class(Tlistatemplates)
    procedure btnnuevoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaRoles: TlistaRoles;

implementation

uses UnitPrinc, UnitRoles;

{$R *.dfm}

procedure TlistaRoles.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      Roles:=TRoles.Create(self);
    finally
      Roles.abm:=1;
      Roles.btnguardar.Caption:='Guardar';
      Roles.Show;
    end;
end;

end.
