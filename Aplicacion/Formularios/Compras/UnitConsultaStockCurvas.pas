unit UnitConsultaStockCurvas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, UnitSqlComboBox;

type
  TConsultaStockCurvas = class(TABMbase)
    Label1: TLabel;
    seccion_id: TSqlComboBox;
    Label21: TLabel;
    marca_id: TSqlComboBox;
    Label2: TLabel;
    rubro_id: TSqlComboBox;
    ZQProductos: TZQuery;
    Label3: TLabel;
    fil_producto_nombre: TEdit;
    fil_producto_codigobarras: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    deposito_id: TSqlComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    temporal_idproceso:string;
  public
    { Public declarations }
  end;

var
  ConsultaStockCurvas: TConsultaStockCurvas;

implementation

uses UnitPrinc;

{$R *.dfm}

procedure TConsultaStockCurvas.btnguardarClick(Sender: TObject);
var
  producto_prodcodigoant:string;
  nro_columna:integer;
  pasar_siguiente:boolean;
  i:integer;
begin
  inherited;
    ZQSelect.Active:=false;
    ZQSelect.SQL.Text:='select substring(producto_codigobarras,1,producto_longitudcodigo) as producto_prodcodigo, '+
                       'concat(substring(producto_codigobarras,1,producto_longitudcodigo),productodeposito.deposito_id) as prod_depo, '+
                       'productos.producto_nombre, depositos.deposito_nombre, productos.producto_talle, productodeposito.producdepo_stockactual '+
                       'from productos '+
                       'inner join productodeposito on productos.producto_id=productodeposito.producto_id '+
                       'inner join depositos on productodeposito.deposito_id=depositos.deposito_id '+
                       'where producto_tipo="PRODUCTO"';


    if fil_producto_nombre.Text<>'' then
      ZQSelect.SQL.Text:=ZQSelect.SQL.Text+' and productos.producto_nombre like "%'+Princ.GTBUtilidades1.Reemplazar(fil_producto_nombre.Text,' ','%',false,0)+'%" ';


    if fil_producto_codigobarras.Text<>'' then
      ZQSelect.SQL.Text:=ZQSelect.SQL.Text+' and productos.producto_codigobarras like "'+fil_producto_codigobarras.Text+'%" ';

    if seccion_id.codigo<>'-1' then
      ZQSelect.SQL.Add('and seccion_id="'+seccion_id.codigo+'" ');

    if marca_id.codigo<>'-1' then
      ZQSelect.SQL.Add('and marca_id="'+marca_id.codigo+'" ');

    if rubro_id.codigo<>'-1' then
      ZQSelect.SQL.Add('and rubro_id="'+rubro_id.codigo+'" ');

    if deposito_id.codigo<>'-1' then
      ZQSelect.SQL.Add('and depositos.deposito_id="'+deposito_id.codigo+'" ');

    ZQSelect.SQL.Add('order by prod_depo, producto_codigobarras ');
    ZQSelect.Active:=true;


    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;
    temporal_idproceso:=Princ.codigo('temporales','temporal_idproceso');


    ZQSelect.First;
    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('insert into temporales set ');
    ZQExecSQL.Sql.Add('temporal_string15=:temporal_string15, ');
    ZQExecSQL.Sql.Add('temporal_string14=:temporal_string14, ');
    ZQExecSQL.Sql.Add('temporal_string13=:temporal_string13, ');
    ZQExecSQL.Sql.Add('temporal_string12=:temporal_string12, ');
    ZQExecSQL.Sql.Add('temporal_string11=:temporal_string11, ');
    ZQExecSQL.Sql.Add('temporal_int20=:temporal_int20, ');
    ZQExecSQL.Sql.Add('temporal_int19=:temporal_int19, ');
    ZQExecSQL.Sql.Add('temporal_int18=:temporal_int18, ');
    ZQExecSQL.Sql.Add('temporal_int17=:temporal_int17, ');
    ZQExecSQL.Sql.Add('temporal_int16=:temporal_int16, ');
    ZQExecSQL.Sql.Add('temporal_int15=:temporal_int15, ');
    ZQExecSQL.Sql.Add('temporal_int14=:temporal_int14, ');
    ZQExecSQL.Sql.Add('temporal_int13=:temporal_int13, ');
    ZQExecSQL.Sql.Add('temporal_int12=:temporal_int12, ');
    ZQExecSQL.Sql.Add('temporal_int11=:temporal_int11, ');
    ZQExecSQL.Sql.Add('temporal_int10=:temporal_int10, ');
    ZQExecSQL.Sql.Add('temporal_int9=:temporal_int9, ');
    ZQExecSQL.Sql.Add('temporal_int8=:temporal_int8, ');
    ZQExecSQL.Sql.Add('temporal_int7=:temporal_int7, ');
    ZQExecSQL.Sql.Add('temporal_int6=:temporal_int6, ');
    ZQExecSQL.Sql.Add('temporal_string20=:temporal_string20, ');
    ZQExecSQL.Sql.Add('temporal_string19=:temporal_string19, ');
    ZQExecSQL.Sql.Add('temporal_string18=:temporal_string18, ');
    ZQExecSQL.Sql.Add('temporal_string17=:temporal_string17, ');
    ZQExecSQL.Sql.Add('temporal_string16=:temporal_string16, ');
    ZQExecSQL.Sql.Add('temporal_string10=:temporal_string10, ');
    ZQExecSQL.Sql.Add('temporal_string9=:temporal_string9, ');
    ZQExecSQL.Sql.Add('temporal_string8=:temporal_string8, ');
    ZQExecSQL.Sql.Add('temporal_string7=:temporal_string7, ');
    ZQExecSQL.Sql.Add('temporal_string6=:temporal_string6, ');
    ZQExecSQL.Sql.Add('temporal_int5=:temporal_int5, ');
    ZQExecSQL.Sql.Add('temporal_int4=:temporal_int4, ');
    ZQExecSQL.Sql.Add('temporal_int3=:temporal_int3, ');
    ZQExecSQL.Sql.Add('temporal_int2=:temporal_int2, ');
    ZQExecSQL.Sql.Add('temporal_int1=:temporal_int1, ');
    ZQExecSQL.Sql.Add('temporal_string5=:temporal_string5, ');
    ZQExecSQL.Sql.Add('temporal_string4=:temporal_string4, ');
    ZQExecSQL.Sql.Add('temporal_string3=:temporal_string3, ');
    ZQExecSQL.Sql.Add('temporal_string2=:temporal_string2, ');
    ZQExecSQL.Sql.Add('temporal_string1=:temporal_string1, ');
    ZQExecSQL.Sql.Add('temporal_idproceso=:temporal_idproceso ');

    producto_prodcodigoant:=ZQSelect.FieldByName('prod_depo').AsString;
    while not ZQSelect.Eof do
        begin
            ZQExecSQL.ParamByName('temporal_string1').AsString:=ZQSelect.FieldByName('producto_prodcodigo').AsString;
            ZQExecSQL.ParamByName('temporal_string2').AsString:=ZQSelect.FieldByName('producto_nombre').AsString;
            ZQExecSQL.ParamByName('temporal_string3').AsString:=ZQSelect.FieldByName('deposito_nombre').AsString;
            ZQExecSQL.ParamByName('temporal_string4').AsString:=ZQSelect.FieldByName('prod_depo').AsString;
            ZQExecSQL.ParamByName('temporal_string5').AsString:='';

            ZQExecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;

            for i := 6 to 20 do
              begin
                  ZQExecSQL.ParamByName('temporal_string'+inttostr(i)).AsString:='';
                  ZQExecSQL.ParamByName('temporal_int'+inttostr(i)).AsString:='0';
              end;




            nro_columna:=6;
            pasar_siguiente:=true;
            while pasar_siguiente do
             begin
                 ZQExecSQL.ParamByName('temporal_string5').AsString:=ZQExecSQL.ParamByName('temporal_string5').AsString+ZQSelect.FieldByName('producto_talle').AsString;
                 ZQExecSQL.ParamByName('temporal_string'+inttostr(nro_columna)).AsString:=ZQSelect.FieldByName('producto_talle').AsString;
                 ZQExecSQL.ParamByName('temporal_int'+inttostr(nro_columna)).AsString:=ZQSelect.FieldByName('producdepo_stockactual').AsString;
                 producto_prodcodigoant:=ZQSelect.FieldByName('prod_depo').AsString;
                 nro_columna:=nro_columna+1;

                 ZQSelect.Next;
                 pasar_siguiente:=(producto_prodcodigoant=ZQSelect.FieldByName('prod_depo').AsString) and (not ZQSelect.Eof) and (nro_columna<21);
             end;


            ZQExecSQL.ExecSql;

        end;


     Princ.VCLReport1.Filename:=Princ.ruta_carpeta_reportes+'consulta_stock_curvas.rep';
     Princ.VCLReport1.Report.DatabaseInfo[0].ZConnection:=Princ.ZBase;

    Princ.VCLReport1.Report.Datainfo.Items[0].sql:='select * from temporales '+
                                                   'where temporal_idproceso="'+temporal_idproceso+'" '+
                                                   'order by temporal_string1 ';

    Princ.VCLReport1.Execute;

    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;






end;

procedure TConsultaStockCurvas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    if temporal_idproceso<>'' then
      begin
          Princ.ZQExcecSQL.Sql.Clear;
          Princ.ZQExcecSQL.Sql.Add('delete from temporales ');
          Princ.ZQExcecSQL.Sql.Add('where temporal_idproceso=:temporal_idproceso ');
          Princ.ZQExcecSQL.ParamByName('temporal_idproceso').AsString:=temporal_idproceso;
          Princ.ZQExcecSQL.ExecSql;
      end;
end;

procedure TConsultaStockCurvas.FormCreate(Sender: TObject);
begin
  inherited;
    seccion_id.llenarcombo;
    seccion_id.ItemIndex:=0;
    marca_id.llenarcombo;
    marca_id.ItemIndex:=0;
    rubro_id.llenarcombo;
    rubro_id.ItemIndex:=0;
    deposito_id.llenarcombo;
    deposito_id.ItemIndex:=0;
end;

end.
