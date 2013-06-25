unit UnitRubros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls;

type
  TRubros = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    DBAdvEdit1: TDBAdvEdit;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    btnguardar: TButton;
    btncancelar: TButton;
    Label10: TLabel;
    producto_codigo: TEdit;
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  Rubros: TRubros;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TRubros.btncancelarClick(Sender: TObject);
begin
   close;
end;

end.
