unit Unitventadetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, DBAdvEd, UnitSqlComboBox, ExtCtrls, AdvPanel, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tventadetalle = class(TForm)
    panelgrilla: TAdvPanel;
    Label3: TLabel;
    Label6: TLabel;
    producto_id: TSqlComboBox;
    ventadeta_cantidad: TDBAdvEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ventadetalle_preciounitario: TDBAdvEdit;
    Label2: TLabel;
    ventadetalle_total: TDBAdvEdit;
    ZQDocumentoventadetalles: TZQuery;
    ZQDocumentoventadetallesdocumentoventadetalle_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_descripcion: TStringField;
    ZQDocumentoventadetallesdocumentoventadetalle_cantidad: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_neto21: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_iva21: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_neto105: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_iva105: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_nogravado: TFloatField;
    ZQDocumentoventadetallesdocumentoventadetalle_estado: TStringField;
    ZQDocumentoventadetallesdocumentoventadetalle_observacion: TStringField;
    ZQDocumentoventadetallesproducto_id: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_idorig: TIntegerField;
    ZQDocumentoventadetallesdocumentoventadetalle_cantidadpendiente: TFloatField;
    ZQDocumentoventadetallesdocumentoventa_id: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure producto_idSelect(Sender: TObject);
    procedure ventadeta_cantidadExit(Sender: TObject);
    procedure ventadetalle_preciounitarioExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure calculartotal;
  public
    { Public declarations }
    producto_precioventa:string;
  end;

var
  ventadetalle: Tventadetalle;

implementation

uses unitPrinc;

{$R *.dfm}

procedure Tventadetalle.calculartotal;
begin

    ventadetalle_total.Text:=floattostr(ventadetalle_preciounitario.FloatValue*ventadeta_cantidad.FloatValue);

end;


procedure Tventadetalle.producto_idSelect(Sender: TObject);
begin
    ventadetalle_preciounitario.Text:=princ.buscar('select producto_precioventa'+producto_precioventa+' from productos where producto_id="'+producto_id.codigo+'"','producto_precioventa'+producto_precioventa);
    calculartotal;
end;

procedure Tventadetalle.Button2Click(Sender: TObject);
var
  tipoiva_valor:real;
begin
    ZQDocumentoventadetalles.Active:=false;
    ZQDocumentoventadetalles.Active:=true;

    ZQDocumentoventadetalles.Append;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_id').AsString:='0';
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_descripcion').AsString:=producto_id.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidad').AsString:=ventadeta_cantidad.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_precio').AsString:=ventadetalle_preciounitario.Text;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_total').AsString:=ventadetalle_total.Text;

    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=0;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=0;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=0;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=0;

    tipoiva_valor:=strtofloat(Princ.buscar('select tipoiva_valor from tipoiva inner join productos on tipoiva.tipoiva_id=productos.tipoiva_id where producto_id="'+producto_id.codigo+'"','tipoiva_valor'));
    if tipoiva_valor>10.5 then
      begin
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto21').AsFloat:=100*ventadetalle_total.FloatValue/(100+tipoiva_valor);
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva21').AsFloat:=tipoiva_valor*ventadetalle_total.FloatValue/(100+tipoiva_valor);
      end
    else
      begin
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_neto105').AsFloat:=100*ventadetalle_total.FloatValue/(100+tipoiva_valor);
          ZQDocumentoventadetalles.FieldByName('documentoventadetalle_iva105').AsFloat:=tipoiva_valor*ventadetalle_total.FloatValue/(100+tipoiva_valor);
      end;

    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_nogravado').AsString:='0';
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_estado').AsString:='FACTURADO';
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_observacion').AsString:='';
    ZQDocumentoventadetalles.FieldByName('producto_id').AsString:=producto_id.codigo;
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_idorig').AsString:='0';
    ZQDocumentoventadetalles.FieldByName('documentoventadetalle_cantidadpendiente').AsString:='0';
    ZQDocumentoventadetalles.FieldByName('documentoventa_id').AsString:='0';
    ZQDocumentoventadetalles.Post;

    Self.ModalResult:=mrOk;
end;

procedure Tventadetalle.FormCreate(Sender: TObject);
begin
    producto_id.llenarcombo;
    ventadeta_cantidad.Text:='1';
end;

procedure Tventadetalle.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tventadetalle.FormShow(Sender: TObject);
begin
    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tventadetalle.ventadetalle_preciounitarioExit(Sender: TObject);
begin
    calculartotal;
end;

procedure Tventadetalle.ventadeta_cantidadExit(Sender: TObject);
begin
    calculartotal;
end;

end.
