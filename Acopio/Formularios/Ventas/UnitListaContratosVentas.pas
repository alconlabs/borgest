unit UnitListaContratosVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, GBTEdit, Grids, DBGrids, ExtCtrls, AdvPanel;

type
  Tlistacontratosventa = class(Tlistabase)
    fil_puntoventa_numero: TGTBEdit;
    fil_documento_numero: TGTBEdit;
    fil_entidad_razonsocial: TGTBEdit;
    fil_documento_estado: TGTBEdit;
    procedure btnnuevoClick(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipodocu_nombre:string;
  end;

var
  listacontratosventa: Tlistacontratosventa;

implementation

uses UnitPrinc, UnitContratoVenta;

{$R *.dfm}

procedure Tlistacontratosventa.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from documentos '+
                       'inner join entidades on documentos.entidad_id=entidades.entidad_id '+
                       'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumento.tipodocu_id '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id '+
                       ' where tipodocu_nombre="'+tipodocu_nombre+'" '+Princ.empresa_where;


    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_fecha like "%'+fil_id.Text+'"';
       
    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "%'+fil_puntoventa_numero.Text+'%"';

    if fil_documento_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_numero like "%'+fil_documento_numero.Text+'%"';

    if fil_entidad_razonsocial.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and entidades.entidad_razonsocial like "%'+fil_entidad_razonsocial.Text+'%"';

    if fil_documento_estado.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and documento_estado like "%'+fil_documento_estado.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+'order by documento_fecha, documento_id';

    ZQGrilla.Active:=true;
end;

procedure Tlistacontratosventa.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                try
                  ContratoVenta:=TContratoVenta.Create(self);
                finally
                  ContratoVenta.abm:=2;
                  ContratoVenta.tipodocu_nombre:=tipodocu_nombre;
                  ContratoVenta.id:=self.id;
                  ContratoVenta.btnguardar.Caption:='Guardar';
                  ContratoVenta.Show;
                end;
            end;
      end;
end;

procedure Tlistacontratosventa.btnnuevoClick(Sender: TObject);
begin
  inherited;
    try
      ContratoVenta:=TContratoVenta.Create(self);
    finally
      ContratoVenta.abm:=1;
      ContratoVenta.tipodocu_nombre:=tipodocu_nombre;
      ContratoVenta.btnguardar.Caption:='Guardar';
      ContratoVenta.Show;
    end;
end;

end.
