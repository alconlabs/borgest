unit UnitConsultarStockCurva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, Grids, DBGrids, StdCtrls, UnitSqlComboBox, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls, AdvPanel, AdvEdit,
  DBAdvEd, MQuery, Menus;

type
  TConsultarStockCurvas = class(TABMbase)
    Label15: TLabel;
    Label3: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    producto_codigoarticulo: TEdit;
    producto_nombre: TEdit;
    marca_id: TSqlComboBox;
    seccion_id: TSqlComboBox;
    rubro_id: TSqlComboBox;
    ZQProducto: TZQuery;
    ZQProductosTalles: TZQuery;
    MQProductosTalles: TMQuery;
    DTSProductosTallesCodigos: TDataSource;
    MQProductosTallesproducto_id: TStringField;
    MQProductosTallesproducto_talle: TStringField;
    MQProductosTallesproducto_tallecodigo: TStringField;
    MQProductosTallesproducto_talleorden: TIntegerField;
    ZQCurva: TZQuery;
    PopupMenu1: TPopupMenu;
    Label4: TLabel;
    Eliminar1: TMenuItem;
    StringGridStock: TStringGrid;
    ZQProductoDeposito: TZQuery;
    ZQDepositos: TZQuery;
    Label6: TLabel;
    producto_codigobarras: TEdit;
    MQProductosTallesproducto_precioventa1: TFloatField;
    MQDepositosDestinos: TMQuery;
    ZQmovimdepodetalles: TZQuery;
    btnbuscar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure producto_nombreEnter(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure producto_codigobarrasExit(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
  private
    { Private declarations }
    longitud:integer;
    function ControlStock:boolean;
  public
    { Public declarations }
  end;

var
  ConsultarStockCurvas: TConsultarStockCurvas;

implementation

uses Unitprinc;

{$R *.dfm}

procedure TConsultarStockCurvas.btnbuscarClick(Sender: TObject);
begin
  inherited;
    if (not ZQProducto.Active) and (producto_codigoarticulo.Text<>'')then
      begin
          ZQProducto.Active:=false;
          ZQProducto.Active:=false;
          ZQProducto.SQL.Text:='select * from productos '+
                                'where producto_codigobarras like "%'+producto_codigoarticulo.Text+'%"';

          if marca_id.Text<>'' then
            ZQProducto.SQL.Text:=ZQProducto.SQL.Text+' and marca_id="'+marca_id.codigo+'"';

          if seccion_id.Text<>'' then
            ZQProducto.SQL.Text:=ZQProducto.SQL.Text+' and seccion_id="'+seccion_id.codigo+'"';

          if rubro_id.Text<>'' then
            ZQProducto.SQL.Text:=ZQProducto.SQL.Text+' and rubro_id="'+rubro_id.codigo+'"';

          ZQProducto.Active:=true;

          if ZQProducto.RecordCount>0 then
            begin
                ZQProducto.First;
                producto_codigobarras.Text:=ZQProducto.FieldByName('producto_codigobarras').AsString;


                producto_codigobarras.OnExit(self);
            end;

          ZQProducto.Active:=false;
      end;
end;

function TConsultarStockCurvas.ControlStock:boolean;
begin

end;

procedure TConsultarStockCurvas.Eliminar1Click(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea eliminar este talle?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          if MQProductosTalles.FieldByName('producto_id').AsString<>'' then
            begin
                try
                  ZQExecSQL.Sql.Clear;
                  ZQExecSQL.Sql.Add('delete from productodeposito ');
                  ZQExecSQL.Sql.Add('where producto_id=:producto_id ');
                  ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosTalles.FieldByName('producto_id').AsString;
                  ZQExecSQL.ExecSql;

                  ZQExecSQL.Sql.Clear;
                  ZQExecSQL.Sql.Add('delete from productos ');
                  ZQExecSQL.Sql.Add('where producto_id=:producto_id ');
                  ZQExecSQL.ParamByName('producto_id').AsString:=MQProductosTalles.FieldByName('producto_id').AsString;
                  ZQExecSQL.ExecSql;
                except

                end;



            end;

          try
            MQProductosTalles.Delete;
          except

          end;




      end;
end;

procedure TConsultarStockCurvas.producto_codigobarrasExit(Sender: TObject);
var
  filaenvio:integer;
begin
  inherited;
    ZQProducto.Active:=false;
    ZQProducto.SQL.Text:='select * from productos '+
//                          'inner join marcas on productos.marca_id=marcas.marca_id '+
                          'where producto_codigobarras="'+producto_codigobarras.Text+'"';
    ZQProducto.Active:=true;
    MQProductosTalles.Active:=false;
    MQProductosTalles.Active:=true;
    if ZQProducto.RecordCount>0 then
      begin
          id:=ZQProducto.FieldByName('producto_id').AsString;
          if ZQProducto.FieldByName('producto_longitudcodigo').AsInteger>0 then
            begin
                longitud:=ZQProducto.FieldByName('producto_longitudcodigo').AsInteger;
      //          DBGrid2.Hide;
      //          btnguardar.Hide;

                producto_codigoarticulo.Text:=copy(producto_codigobarras.Text,0,longitud);
                seccion_id.Buscar(ZQProducto.FieldByName('seccion_id').AsString);
                marca_id.Buscar(ZQProducto.FieldByName('marca_id').AsString);
                rubro_id.Buscar(ZQProducto.FieldByName('rubro_id').AsString);
                producto_nombre.Text:=ZQProducto.FieldByName('producto_nombre').AsString;



                ZQProductosTalles.Active:=false;
                ZQProductosTalles.SQL.Text:='select *, substring(producto_codigobarras,"'+inttostr(longitud)+'"+1,length(producto_codigobarras)) as producto_tallecodigo from productos where producto_codigobarras like "'+producto_codigoarticulo.Text+'%"';
                ZQProductosTalles.Active:=true;

                StringGridStock.ColCount:=ZQProductosTalles.RecordCount+1;
                ZQProductosTalles.First;

                while not ZQProductosTalles.Eof do
                    begin
                        StringGridStock.Cells[ZQProductosTalles.RecNo,0]:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                        filaenvio:=1;
                        ZQProductoDeposito.Active:=false;
                        ZQProductoDeposito.SQL.Text:='select * from productodeposito where producto_id="'+ZQProductosTalles.FieldByName('producto_id').AsString+'" order by deposito_id';
                        ZQProductoDeposito.Active:=true;
                        ZQProductoDeposito.First;
                        while not ZQProductoDeposito.Eof do
                            begin
                                StringGridStock.Cells[ZQProductosTalles.RecNo,ZQProductoDeposito.RecNo]:=ZQProductoDeposito.FieldByName('producdepo_stockactual').AsString;

                                if ZQProductoDeposito.FieldByName('deposito_id').AsString<>Princ.dep_id then
                                  begin
                                      filaenvio:=filaenvio+1;
                                  end;
                                ZQProductoDeposito.Next;
                            end;

                        MQProductosTalles.Insert;
                        MQProductosTalles.FieldByName('producto_id').AsString:=ZQProductosTalles.FieldByName('producto_id').AsString;
                        MQProductosTalles.FieldByName('producto_talle').AsString:=ZQProductosTalles.FieldByName('producto_talle').AsString;
                        MQProductosTalles.FieldByName('producto_tallecodigo').AsString:=ZQProductosTalles.FieldByName('producto_tallecodigo').AsString;
                        MQProductosTalles.FieldByName('producto_talleorden').AsString:='0';
                        MQProductosTalles.FieldByName('producto_precioventa1').AsString:=ZQProductosTalles.FieldByName('producto_precioventa1').AsString;
                        MQProductosTalles.Post;

                        ZQProductosTalles.Next;
                    end;
                 StringGridStock.SetFocus;
            end;


      end
    else
      begin
          //producto_codigoarticulo.Text:=producto_codigobarras.Text;
//          seccion_id.Buscar('');
//          marca_id.Buscar('');
//          rubro_id.Buscar('');
//          producto_nombre.Text:='';
//          DBGrid2.Show;
//          btnguardar.Show;
//          StringGridStock.ColCount:=2;
//          StringGridStock.RowCount:=1+ZQDepositos.RecordCount;
          ZQProducto.Active:=false;
      end;
end;

procedure TConsultarStockCurvas.producto_nombreEnter(Sender: TObject);
begin
  inherited;
     producto_nombre.Text:=rubro_id.Text + ' ' +marca_id.Text+ ' ' +' Articulo '+producto_codigoarticulo.Text;  
end;

procedure TConsultarStockCurvas.FormCreate(Sender: TObject);
var
  filaenvio:integer;
begin
  inherited;
    seccion_id.llenarcombo;
    marca_id.llenarcombo;
    rubro_id.llenarcombo;

    ZQDepositos.Active:=false;
    ZQDepositos.Active:=true;


    StringGridStock.RowCount:=1+ZQDepositos.RecordCount;
    filaenvio:=1;
    MQDepositosDestinos.Active:=false;
    MQDepositosDestinos.Active:=true;
    ZQDepositos.First;
    while not ZQDepositos.Eof do
        begin
            StringGridStock.Cells[0,ZQDepositos.RecNo]:=ZQDepositos.FieldByName('deposito_nombre').AsString;

            if ZQDepositos.FieldByName('deposito_id').AsString<>Princ.dep_id then
              begin
                  MQDepositosDestinos.Last;
                  MQDepositosDestinos.Next;
                  MQDepositosDestinos.Insert;
                  MQDepositosDestinos.FieldByName('deposito_id').AsString:=ZQDepositos.FieldByName('deposito_id').AsString;
                  MQDepositosDestinos.Post;

                  filaenvio:=filaenvio+1;
              end;


            ZQDepositos.Next;

        end;

end;

end.
