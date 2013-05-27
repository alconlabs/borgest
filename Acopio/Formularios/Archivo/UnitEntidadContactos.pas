unit UnitEntidadContactos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ExtCtrls, AdvPanel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvEdBtn, EditCodi,
  AdvGlowButton, Menus, AdvMenus, MoneyEdit;

type
  TEntidadContactos = class(TForm)
    panelgrilla: TAdvPanel;
    btncancelar: TButton;
    btnaceptar: TButton;
    entcontacto_celular: TDBAdvEdit;
    ZQEntidadContactos: TZQuery;
    AdvPopupMenu1: TAdvPopupMenu;
    Codigodereferencia1: TMenuItem;
    Historial1: TMenuItem;
    Label4: TLabel;
    entcontacto_nombre: TEdit;
    entcontacto_puesto: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    entcontacto_email: TEdit;
    entcontacto_observaciones: TEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnaceptarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnherramientasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    producto_precioventa:string;
    procedure CargarQuery;
  end;

var
  EntidadContactos: TEntidadContactos;

implementation

uses unitPrinc;

{$R *.dfm}




procedure TEntidadContactos.CargarQuery;
begin
    if not ZQEntidadContactos.Active then
      begin
          ZQEntidadContactos.Active:=true;

          ZQEntidadContactos.Append;
          ZQEntidadContactos.FieldByName('entcontacto_id').AsString:='0';
          ZQEntidadContactos.FieldByName('entcontacto_nombre').AsString:=entcontacto_nombre.Text;
          ZQEntidadContactos.FieldByName('entcontacto_celular').AsString:=entcontacto_celular.Text;
          ZQEntidadContactos.FieldByName('entcontacto_email').AsString:=entcontacto_email.Text;
          ZQEntidadContactos.FieldByName('entcontacto_observaciones').AsString:=entcontacto_observaciones.Text;
          ZQEntidadContactos.FieldByName('entcontacto_puesto').AsString:=entcontacto_puesto.Text;
          ZQEntidadContactos.FieldByName('entidad_codi').AsString:='0';
          ZQEntidadContactos.Post;

      end;



end;

procedure TEntidadContactos.btnherramientasClick(Sender: TObject);
var
  pt: TPoint;
begin
//    pt := Point(btnherramientas.Left, btnherramientas.Top + btnherramientas.Height);
//    pt := Self.ClientToScreen(pt);

 //   btnherramientas.DropDownMenu.Popup(pt.X,pt.Y);
end;

procedure TEntidadContactos.btnaceptarClick(Sender: TObject);
begin
    CargarQuery;
    Self.ModalResult:=mrOk;
end;

procedure TEntidadContactos.FormCreate(Sender: TObject);
begin
    ZQEntidadContactos.Active:=false;
end;

procedure TEntidadContactos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        VK_F9:btnaceptar.Click;
        VK_RETURN:Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

end.
