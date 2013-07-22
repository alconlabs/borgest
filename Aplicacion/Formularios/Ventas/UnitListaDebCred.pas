unit UnitListaDebCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel, ComCtrls;

type
  Tlistaconceptosdebcred = class(Tlistabase)
    fil_producto_nombre: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaconceptosdebcred: Tlistaconceptosdebcred;

implementation

uses Unitprinc, UnitConceptoDebCred;

{$R *.dfm}

procedure Tlistaconceptosdebcred.btneliminarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
         if ZQGrilla.RecordCount>0 then
         begin
              try
                ConceptoDebCred:=TConceptoDebCred.Create(self);
              finally
                ConceptoDebCred.abm:=3;
                ConceptoDebCred.id:=ZQGrilla.FieldByName('producto_id').AsString;
                ConceptoDebCred.btnguardar.Caption:='Eliminar';
                ConceptoDebCred.producto_tipo:='CONCEPTO';
                ConceptoDebCred.Show;
              end;
         end;
      end;
end;

procedure Tlistaconceptosdebcred.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from productos where 1=1 and producto_tipo="CONCEPTO"';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_id like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_id.Text,' ','%')+'%"';

    if fil_producto_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and producto_nombre like "'+primercaracter+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%')+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by producto_nombre';

    ZQGrilla.Active:=true;
end;

procedure Tlistaconceptosdebcred.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  ConceptoDebCred:=TConceptoDebCred.Create(self);
                finally
                  ConceptoDebCred.abm:=2;
                  ConceptoDebCred.id:=ZQGrilla.FieldByName('producto_id').AsString;
                  ConceptoDebCred.btnguardar.Caption:='Modificar';
                  ConceptoDebCred.producto_tipo:='CONCEPTO';
                  ConceptoDebCred.Show;
                end;
            end;
      end;
end;

procedure Tlistaconceptosdebcred.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      ConceptoDebCred:=TConceptoDebCred.Create(self);
    finally
      ConceptoDebCred.abm:=1;
      ConceptoDebCred.btnguardar.Caption:='Guardar';
      ConceptoDebCred.producto_tipo:='CONCEPTO';
      ConceptoDebCred.Show;
    end;
end;

end.
