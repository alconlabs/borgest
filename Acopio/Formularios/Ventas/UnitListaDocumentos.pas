unit UnitListaDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  Tlistadocumentos = class(Tlistabase)
    procedure btnnuevoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listadocumentos: Tlistadocumentos;

implementation

uses UnitDocumentoBase;

{$R *.dfm}

procedure Tlistadocumentos.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      DocumentoBase:=TDocumentoBase.Create(self);
    finally
      DocumentoBase.abm:=1;
      DocumentoBase.btnguardar.Caption:='Guardar';
      DocumentoBase.Show;
    end;
end;

end.
