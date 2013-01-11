unit UnitBusquedaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitbusquedabase, CustomizeGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Grids, DBGrids, ExtCtrls, AdvPanel,
  GBTEdit;

type
  Tbusquedaclientes = class(Tbusquedabase)
    lblinfo: TLabel;
    fil_cliente_nombre: TGTBEdit;
    fil_cliente_documentonro: TGTBEdit;
    fil_cliente_domicilio: TGTBEdit;
    fil_cliente_telefono: TGTBEdit;
    fil_cliente_mail: TGTBEdit;
    procedure btnfiltrarClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure fil_cliente_nombreKeyPress(Sender: TObject; var Key: Char);
    procedure fil_idEnter(Sender: TObject);
    procedure fil_idExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  busquedaclientes: Tbusquedaclientes;

implementation

{$R *.dfm}

procedure Tbusquedaclientes.btnfiltrarClick(Sender: TObject);
begin
  inherited;
    ZQGrilla.Active:=false;
    ZQGrilla.SQL.Text:='select * from clientes where 1=1';
    if fil_id.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_id like "%'+fil_id.Text+'"';

    if fil_cliente_nombre.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_nombre like "%'+fil_cliente_nombre.Text+'%"';

    if fil_cliente_documentonro.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_documentonro like "%'+fil_cliente_documentonro.Text+'%"';

    if fil_cliente_domicilio.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_domicilio like "%'+fil_cliente_domicilio.Text+'%"';

    if fil_cliente_telefono.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_telefono like "%'+fil_cliente_telefono.Text+'%"';

    if fil_cliente_mail.Text<>'' then
      ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' and cliente_mail like "%'+fil_cliente_mail.Text+'%"';

    ZQGrilla.SQL.Text:=ZQGrilla.SQL.Text+' order by cliente_nombre';

    ZQGrilla.Active:=true;
    
    DBGrid1.SetFocus;
end;

procedure Tbusquedaclientes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if key=#13 then
      begin
          if ZQGrilla.Active then
            begin
                if ZQGrilla.RecordCount>0 then
                  btnaceptar.Click;
            end;
      end;
end;

procedure Tbusquedaclientes.fil_cliente_nombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if key=#13 then
      btnfiltrar.Click;

end;

procedure Tbusquedaclientes.fil_idEnter(Sender: TObject);
begin
  inherited;
    lblinfo.Caption:='Ingrese '+(sender as TGTBEdit).Caption+' a filtrar';
end;

procedure Tbusquedaclientes.fil_idExit(Sender: TObject);
begin
  inherited;
    lblinfo.Caption:='';
end;

end.
