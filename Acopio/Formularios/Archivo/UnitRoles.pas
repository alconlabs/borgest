unit UnitRoles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MoneyEdit, AdvEdit, DBAdvEd, UnitSqlComboBox,
  AdvPanel, ComCtrls;

type
  TRoles = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    DBAdvEdit1: TDBAdvEdit;
    AdvPanel3: TAdvPanel;
    Label27: TLabel;
    btnguardar: TButton;
    btncancelar: TButton;
    producto_codigo: TEdit;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    abm:integer;
    id:string;
  end;

var
  Roles: TRoles;

implementation

uses UnitPrinc;

{$R *.dfm}

end.
