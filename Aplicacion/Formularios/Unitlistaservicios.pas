unit Unitlistaservicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitlistaproductos;

type
  Tlistaservicios = class(Tlistaproductos)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listaservicios: Tlistaservicios;

implementation

{$R *.dfm}

end.
