unit Unitlistaservicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistaproductos, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  Tlistaservicios = class(Tlistaproductos)
    procedure btncrearClick(Sender: TObject);
    procedure btnmodiClick(Sender: TObject);
    procedure btnelimiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaservicios: Tlistaservicios;

implementation

uses Unitprinc, UnitServicios;

{$R *.dfm}

procedure Tlistaservicios.btncrearClick(Sender: TObject);
begin
//  inherited;
    Princ.AbrirNuevoServicio;

end;

procedure Tlistaservicios.btnelimiClick(Sender: TObject);
begin
    if ZQGrilla.active then
      begin

         if ZQGrilla.RecordCount>0 then
         begin
              try
                servicios:=Tservicios.Create(self);
              finally
                servicios.abm:=3;
                servicios.id:=ZQGrilla.FieldByName('producto_id').AsString;
                servicios.btnguardar.Caption:='Eliminar';
                servicios.Show;
              end;

         end;


      end;

end;

procedure Tlistaservicios.btnmodiClick(Sender: TObject);
begin
//  inherited;
    Princ.AbrirModificarServicio(ZQGrilla.FieldByName('producto_id').AsString);

end;

end.
