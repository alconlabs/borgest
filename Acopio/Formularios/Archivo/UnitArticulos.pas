unit UnitArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls, Grids, DBGrids;

type
  TArticulos = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    producto_nombre: TEdit;
    producto_codigo: TEdit;
    DBAdvEdit1: TDBAdvEdit;
    Label2: TLabel;
    Edit5: TEdit;
    btnguardar: TButton;
    btncancelar: TButton;
    Label6: TLabel;
    Edit1: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    SqlComboBox3: TSqlComboBox;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    SqlComboBox2: TSqlComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  Articulos: TArticulos;

implementation

uses UnitPrinc;

{$R *.dfm}

end.
