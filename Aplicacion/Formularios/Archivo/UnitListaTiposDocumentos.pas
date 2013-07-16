unit UnitListaTiposDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistabase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel, GBTEdit, ComCtrls;

type
  Tlistatiposdocumentos = class(Tlistabase)
    fil_tipodocu_nombre: TGTBEdit;
    fil_tipodocu_letra: TGTBEdit;
    fil_tipodocu_tipo: TGTBEdit;
    fil_puntoventa_numero: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure btnnuevoClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listatiposdocumentos: Tlistatiposdocumentos;

implementation

uses Unitprinc;

{$R *.dfm}

procedure Tlistatiposdocumentos.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.SQL.Text:='select * from tiposdocumento '+
                       'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodeventa.puntoventa_id ' +
                       'where 1=1 '+Princ.empresa_where;
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tipodocu_id like "%'+fil_id.Text+'%"';

    if fil_tipodocu_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tipodocu_nombre like "%'+fil_tipodocu_nombre.Text+'%"';

    if fil_tipodocu_letra.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tipodocu_letra like "%'+fil_tipodocu_letra.Text+'%"';

    if fil_tipodocu_tipo.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and tipodocu_tipo like "%'+fil_tipodocu_tipo.Text+'%"';

    if fil_puntoventa_numero.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and puntoventa_numero like "%'+fil_puntoventa_numero.Text+'%"';


    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by tipodocu_nombre, tipodocu_letra, tipodocu_debcred';
    ZQGrilla.Active:=true;
end;

procedure Tlistatiposdocumentos.btnmodificarClick(Sender: TObject);
begin
  inherited;
    if ZQGrilla.Active then
      begin
          if ZQGrilla.RecordCount>0 then
            begin
                Princ.AbrirModificarTipoDocumento(ZQGrilla.FieldByName(campo_id).AsString);
            end;
      end;
end;

procedure Tlistatiposdocumentos.btnnuevoClick(Sender: TObject);
begin
  inherited;
    Princ.AbrirNuevoTipoDocumento;
end;

end.
