unit UnitPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, AppEvnts, ZConnection, ini, Encriptador, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Permisos, UtilidadesDB,
  StdCtrls, ZSqlMonitor;

const
  WM_ICONTRAY = WM_USER + 1;
  CLAVE_ENCRIPTADO='1234567890';

type
  TPrinc = class(TForm)
    ZBase: TZConnection;
    ini1: Tini;
    Encriptador1: TEncriptador;
    Timer1: TTimer;
    BaseRemota: TZConnection;
    ZQBuscar: TZQuery;
    Permisos1: TPermisos;
    UtilidadesDB1: TUtilidadesDB;
    ZQProductoDeposito: TZQuery;
    ZQExcecSQLSinc: TZQuery;
    ZQRemoteSelect: TZQuery;
    ZQRemoteExcecSql: TZQuery;
    ZQRemoteSelectDetalles: TZQuery;
    ZQMovimientosDepositos: TZQuery;
    ZQMovimDepoDetalles: TZQuery;
    ZQCodigo: TZQuery;
    ZQActualizarStock: TZQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ZSQLMonitor1: TZSQLMonitor;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ZBaseBeforeConnect(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ZBaseAfterConnect(Sender: TObject);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;
    EXPORTACIONSINCMINUTOS:string;
  public
    { Public declarations }
    personal_id_logueado:string;
    perfil_id_logueado:string;
    dep_id:string;
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
    function GetConfiguracion(config_nombre: string):string;
    function GetPCName: string;
    function buscar(sql:string;campo:string):string;
    procedure SincronizarTodo;
    procedure sincronizarstock;
    function codigo(tabla:string;campo:string):string;
    procedure actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
  end;

type
THilo = class( TThread )
  Ejecutar: procedure of object;
  procedure Execute; override;
//  procedure ActualizarProgreso;
end;
var
  Princ: TPrinc;
  Hilo: THilo; // variable global o pública

implementation

uses UnitExportarDB, UnitImportarDB;

{$R *.dfm}

procedure CrearHilo;
begin
    try
      Hilo.Free;
    except
    end;
    hilo:=Thilo.Create(true);
//  Hilo.Ejecutar := ProcesarDatos;
//  Hilo.Priority := tpNormal;
//  Hilo.Resume;
end;


procedure THilo.Execute;
begin
  Ejecutar;
//  Synchronize(ActualizarProgreso);
  Terminate;
end;

procedure TPrinc.sincronizarstock;
var
  PREFIJOTABLAWEB:string;
  error:integer;
  cant_depositos:string;
  SINCSUBIRSTOCK:string;
  SINCDESCARGARSTOCK:string;
  MOVIMDEPOCONFIRMAUTO:string;
  MOVIMDEPOPROCESAR:string;
  MOVIMDEPOSUBIR:string;
  MOVIMDEPOSUBIRCONFIRMACION:string;
  MOVIMDEPODESCARGAR:string;
  MOVIMDEPODESCARGARCONFIRM:string;
begin

    SINCSUBIRSTOCK:=Princ.GetConfiguracion('SINCSUBIRSTOCK');
    if SINCSUBIRSTOCK='' then
      SINCSUBIRSTOCK:='0';

    SINCDESCARGARSTOCK:=Princ.GetConfiguracion('SINCDESCARGARSTOCK');
    if SINCDESCARGARSTOCK='' then
      SINCDESCARGARSTOCK:='0';

    MOVIMDEPOCONFIRMAUTO:=Princ.GetConfiguracion('MOVIMDEPOCONFIRMAUTO');
    if MOVIMDEPOCONFIRMAUTO='' then
      MOVIMDEPOCONFIRMAUTO:='0';


    MOVIMDEPOPROCESAR:=Princ.GetConfiguracion('MOVIMDEPOPROCESAR');
    if MOVIMDEPOPROCESAR='' then
      MOVIMDEPOPROCESAR:='0';

    MOVIMDEPOSUBIR:=Princ.GetConfiguracion('MOVIMDEPOSUBIR');
    if MOVIMDEPOSUBIR='' then
      MOVIMDEPOSUBIR:='0';

    MOVIMDEPOSUBIRCONFIRMACION:=Princ.GetConfiguracion('MOVIMDEPOSUBIRCONFIRMACION');
    if MOVIMDEPOSUBIRCONFIRMACION='' then
      MOVIMDEPOSUBIRCONFIRMACION:='0';

    MOVIMDEPODESCARGAR:=Princ.GetConfiguracion('MOVIMDEPODESCARGAR');
    if MOVIMDEPODESCARGAR='' then
      MOVIMDEPODESCARGAR:='0';

    MOVIMDEPODESCARGARCONFIRM:=Princ.GetConfiguracion('MOVIMDEPODESCARGARCONFIRM');
    if MOVIMDEPODESCARGARCONFIRM='' then
      MOVIMDEPODESCARGARCONFIRM:='0';

    try
       BaseRemota.Connect;
       error:=0;
    finally
       if not BaseRemota.Connected then
         error:=1;
    end;


    if error=0 then
      begin
          //          GENERAR PRODUCTODEPOSITO PARA PRODUCTOS NUEVOS
          princ.Permisos1.guardarlog(self.ClassName+'.Generar registros productodeposito productos nuevos;');

          ZQProductoDeposito.Active:=false;
          ZQProductoDeposito.SQL.Text:='select productos.producto_id from productos '+
                                       'left join productodeposito on productos.producto_id=productodeposito.producto_id '+
                                       'where isnull(productodeposito.producto_id) ';
          ZQProductoDeposito.Active:=true;
          ZQProductoDeposito.First;
          ZQExcecSQLSinc.sql.clear;
          ZQExcecSQLSinc.sql.add('Insert into productodeposito ');
          ZQExcecSQLSinc.sql.add('select 0, 0, :producto_id, deposito_id, 0, 0, 0, "PENDIENTE" from depositos');
          while not ZQProductoDeposito.Eof do
              begin
                  ZQExcecSQLSinc.ParamByName('producto_id').AsString:=ZQProductoDeposito.FieldByName('producto_id').AsString;
                  ZQExcecSQLSinc.ExecSQL;
                  ZQProductoDeposito.Next;
              end;


          cant_depositos:=princ.buscar('select count(*)-1 as cant from depositos','cant');
          ZQProductoDeposito.Active:=false;
          ZQProductoDeposito.SQL.Text:='select *, count(producto_id) as cant from productodeposito group by producto_id having cant<='+cant_depositos;
          ZQProductoDeposito.Active:=true;
          ZQProductoDeposito.First;

          ZQExcecSQLSinc.Sql.Clear;
          ZQExcecSQLSinc.Sql.Add('insert into productodeposito set ');
          ZQExcecSQLSinc.Sql.Add('producdepo_estadosinc=:producdepo_estadosinc, ');
          ZQExcecSQLSinc.Sql.Add('producdepo_stockinicial=:producdepo_stockinicial, ');
          ZQExcecSQLSinc.Sql.Add('producdepo_puntorepos=:producdepo_puntorepos, ');
          ZQExcecSQLSinc.Sql.Add('producdepo_stockminimo=:producdepo_stockminimo, ');
          ZQExcecSQLSinc.Sql.Add('deposito_id=:deposito_id, ');
          ZQExcecSQLSinc.Sql.Add('producto_id=:producto_id, ');
          ZQExcecSQLSinc.Sql.Add('producdepo_stockactual=:producdepo_stockactual, ');
          ZQExcecSQLSinc.Sql.Add('producdepo_id=:producdepo_id ');

          while not ZQProductoDeposito.Eof do
          begin
              ZQExcecSQLSinc.ParamByName('producdepo_estadosinc').AsString:='PENDIENTE';
              ZQExcecSQLSinc.ParamByName('producdepo_stockinicial').AsString:=ZQProductoDeposito.FieldByName('producdepo_stockinicial').AsString;
              ZQExcecSQLSinc.ParamByName('producdepo_puntorepos').AsString:=ZQProductoDeposito.FieldByName('producdepo_puntorepos').AsString;
              ZQExcecSQLSinc.ParamByName('producdepo_stockminimo').AsString:=ZQProductoDeposito.FieldByName('producdepo_stockminimo').AsString;
              ZQExcecSQLSinc.ParamByName('deposito_id').AsString:=dep_id;
              ZQExcecSQLSinc.ParamByName('producto_id').AsString:=ZQProductoDeposito.FieldByName('producto_id').AsString;
              ZQExcecSQLSinc.ParamByName('producdepo_stockactual').AsString:='0';
              ZQExcecSQLSinc.ParamByName('producdepo_id').AsString:='0';

              try
                ZQExcecSQLSinc.ExecSql;
                error:=0;
              except
                error:=3;
                princ.Permisos1.guardarlog(self.ClassName+'.Generar registros productodeposito productos nuevos; error='+inttostr(error));
              end;

              ZQProductoDeposito.Next;
          end;


          //                  SUBIR STOCK
          if strtobool(SINCSUBIRSTOCK) then
            begin
                ZQProductoDeposito.Active:=false;
                ZQProductoDeposito.SQL.Text:='select * from productodeposito where deposito_id="'+dep_id+'" and producdepo_estadosinc="PENDIENTE"';
                ZQProductoDeposito.Active:=true;
                ZQProductoDeposito.First;

                ZQRemoteExcecSql.Sql.Clear;
                ZQRemoteExcecSql.Sql.Add('replace into productodeposito set ');
                ZQRemoteExcecSql.Sql.Add('producdepo_estadosinc=:producdepo_estadosinc, ');
                ZQRemoteExcecSql.Sql.Add('producdepo_stockinicial=:producdepo_stockinicial, ');
                ZQRemoteExcecSql.Sql.Add('producdepo_puntorepos=:producdepo_puntorepos, ');
                ZQRemoteExcecSql.Sql.Add('producdepo_stockminimo=:producdepo_stockminimo, ');
                ZQRemoteExcecSql.Sql.Add('deposito_id=:deposito_id, ');
                ZQRemoteExcecSql.Sql.Add('producto_id=:producto_id, ');
                ZQRemoteExcecSql.Sql.Add('producdepo_stockactual=:producdepo_stockactual, ');
                ZQRemoteExcecSql.Sql.Add('producdepo_id=:producdepo_id ');

                princ.Permisos1.guardarlog(self.ClassName+'.subir_stock;');

                BaseRemota.Reconnect;
                while not ZQProductoDeposito.Eof do
                    begin
                        try
                        ZQRemoteExcecSql.ParamByName('producdepo_estadosinc').AsString:='DESCARGAR';
                        ZQRemoteExcecSql.ParamByName('producdepo_stockinicial').AsString:=ZQProductoDeposito.FieldByName('producdepo_stockinicial').AsString;
                        ZQRemoteExcecSql.ParamByName('producdepo_puntorepos').AsString:=ZQProductoDeposito.FieldByName('producdepo_puntorepos').AsString;
                        ZQRemoteExcecSql.ParamByName('producdepo_stockminimo').AsString:=ZQProductoDeposito.FieldByName('producdepo_stockminimo').AsString;
                        ZQRemoteExcecSql.ParamByName('deposito_id').AsString:=ZQProductoDeposito.FieldByName('deposito_id').AsString;
                        ZQRemoteExcecSql.ParamByName('producto_id').AsString:=ZQProductoDeposito.FieldByName('producto_id').AsString;
                        ZQRemoteExcecSql.ParamByName('producdepo_stockactual').AsString:=ZQProductoDeposito.FieldByName('producdepo_stockactual').AsString;
                        ZQRemoteExcecSql.ParamByName('producdepo_id').AsString:='0';
                        ZQRemoteExcecSql.ExecSql;
                        error:=0;
                        except
                        error:=1;
                        princ.Permisos1.guardarlog(self.ClassName+'.subir_stock; error='+inttostr(error)+' producto_id='+ZQProductoDeposito.FieldByName('producto_id').AsString);
                        end;

                        if error=0 then
                          begin
                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('update productodeposito set ');
                              ZQExcecSQLSinc.Sql.Add('producdepo_estadosinc=:producdepo_estadosinc ');
                              ZQExcecSQLSinc.Sql.Add('where producto_id=:producto_id and deposito_id=:deposito_id ');
                              ZQExcecSQLSinc.ParamByName('producdepo_estadosinc').AsString:='SINCRONIZADO';
                              ZQExcecSQLSinc.ParamByName('producto_id').AsString:=ZQProductoDeposito.FieldByName('producto_id').AsString;
                              ZQExcecSQLSinc.ParamByName('deposito_id').AsString:=ZQProductoDeposito.FieldByName('deposito_id').AsString;
                              ZQExcecSQLSinc.ExecSql;
                          end;

                        ZQProductoDeposito.Next;
                    end;

            end;

          //                  DESCARGAR STOCK
          if strtobool(SINCDESCARGARSTOCK) then
            begin
                BaseRemota.Reconnect;
                princ.Permisos1.guardarlog(self.ClassName+'.descargar_stock;');
                if BaseRemota.Connected then
                  begin
                      ZQRemoteSelect.Active:=false;
                      ZQRemoteSelect.SQL.Text:='select * from productodeposito where deposito_id<>"'+dep_id+'" and producdepo_estadosinc="DESCARGAR"';
                      ZQRemoteSelect.Active:=true;
                      ZQRemoteSelect.First;

                      ZQExcecSQLSinc.Sql.Clear;
                      ZQExcecSQLSinc.Sql.Add('replace into productodeposito set ');
                      ZQExcecSQLSinc.Sql.Add('producdepo_estadosinc=:producdepo_estadosinc, ');
                      ZQExcecSQLSinc.Sql.Add('producdepo_stockinicial=:producdepo_stockinicial, ');
                      ZQExcecSQLSinc.Sql.Add('producdepo_puntorepos=:producdepo_puntorepos, ');
                      ZQExcecSQLSinc.Sql.Add('producdepo_stockminimo=:producdepo_stockminimo, ');
                      ZQExcecSQLSinc.Sql.Add('deposito_id=:deposito_id, ');
                      ZQExcecSQLSinc.Sql.Add('producto_id=:producto_id, ');
                      ZQExcecSQLSinc.Sql.Add('producdepo_stockactual=:producdepo_stockactual, ');
                      ZQExcecSQLSinc.Sql.Add('producdepo_id=:producdepo_id ');

                      while not ZQRemoteSelect.Eof do
                          begin
                              try
                              ZQExcecSQLSinc.ParamByName('producdepo_estadosinc').AsString:='DESCARGADO';
                              ZQExcecSQLSinc.ParamByName('producdepo_stockinicial').AsString:=ZQRemoteSelect.FieldByName('producdepo_stockinicial').AsString;
                              ZQExcecSQLSinc.ParamByName('producdepo_puntorepos').AsString:=ZQRemoteSelect.FieldByName('producdepo_puntorepos').AsString;
                              ZQExcecSQLSinc.ParamByName('producdepo_stockminimo').AsString:=ZQRemoteSelect.FieldByName('producdepo_stockminimo').AsString;
                              ZQExcecSQLSinc.ParamByName('deposito_id').AsString:=ZQRemoteSelect.FieldByName('deposito_id').AsString;
                              ZQExcecSQLSinc.ParamByName('producto_id').AsString:=ZQRemoteSelect.FieldByName('producto_id').AsString;
                              ZQExcecSQLSinc.ParamByName('producdepo_stockactual').AsString:=ZQRemoteSelect.FieldByName('producdepo_stockactual').AsString;
                              ZQExcecSQLSinc.ParamByName('producdepo_id').AsString:=ZQRemoteSelect.FieldByName('producdepo_id').AsString;
                              ZQExcecSQLSinc.ExecSql;
                              error:=0;
                              except
                              error:=2;
                              princ.Permisos1.guardarlog(self.ClassName+'.descargar_stock; error='+inttostr(error));
                              end;

                              ZQRemoteSelect.Next;
                          end;


                  end;


            end;



          //                  SUBIR MOVIMIENTOS DE DEPOSITO
          if strtobool(MOVIMDEPOSUBIR) then
            begin
                BaseRemota.Reconnect;
                princ.Permisos1.guardarlog(self.ClassName+'.subir_mov_deposito;');
                if BaseRemota.Connected then
                  begin
                      ZQMovimientosDepositos.Active:=false;
                      ZQMovimientosDepositos.SQL.Text:='select * from movimientosdepositos where movimientodeposito_estadosinc="PENDIENTE" and deposito_idorigen='+Princ.dep_id+' order by movimientodeposito_id';
                      ZQMovimientosDepositos.Active:=true;
                      ZQMovimientosDepositos.First;
                      while not ZQMovimientosDepositos.Eof do
                          begin
                              try
                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('begin');
                              ZQRemoteExcecSql.ExecSql;


                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('insert into movimientosdepositos set ');
                              ZQRemoteExcecSql.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                              ZQRemoteExcecSql.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_hora=:movimientodeposito_hora, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_fecha=:movimientodeposito_fecha, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_id=:movimientodeposito_id ');
                              ZQRemoteExcecSql.ParamByName('deposito_iddestino').AsString:=ZQMovimientosDepositos.FieldByName('deposito_iddestino').AsString;
                              ZQRemoteExcecSql.ParamByName('deposito_idorigen').AsString:=ZQMovimientosDepositos.FieldByName('deposito_idorigen').AsString;
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_observaciones').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_observaciones').AsString;
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_estadosinc').AsString:=Princ.GetConfiguracion('MOVIMDEPOESTADOSINCALSUBIR');
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_estado').AsString:='PENDIENTE';
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_hora').AsString:=formatdatetime('HH:MM:SS',ZQMovimientosDepositos.FieldByName('movimientodeposito_hora').AsDateTime);
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_fecha').AsString:=formatdatetime('yyyy-mm-dd',ZQMovimientosDepositos.FieldByName('movimientodeposito_fecha').AsDateTime);
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                              ZQRemoteExcecSql.ExecSql;


                              ZQMovimDepoDetalles.Active:=false;
                              ZQMovimDepoDetalles.SQL.Text:='select * from movimdepodetalles where movimientodeposito_id="'+ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString+'" and deposito_idorigen='+Princ.dep_id;
                              ZQMovimDepoDetalles.Active:=true;
                              ZQMovimDepoDetalles.First;
                              while not ZQMovimDepoDetalles.Eof do
                                  begin
                                      ZQRemoteExcecSql.Sql.Clear;
                                      ZQRemoteExcecSql.Sql.Add('insert into movimdepodetalles set ');
                                      ZQRemoteExcecSql.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
                                      ZQRemoteExcecSql.Sql.Add('producto_id=:producto_id, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
                                      ZQRemoteExcecSql.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                                      ZQRemoteExcecSql.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
                                      ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                                      ZQRemoteExcecSql.ParamByName('producto_id').AsString:=ZQMovimDepoDetalles.FieldByName('producto_id').AsString;
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_estado').AsString:='PENDIENTE';
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQMovimDepoDetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQMovimDepoDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                      ZQRemoteExcecSql.ParamByName('deposito_idorigen').AsString:=ZQMovimDepoDetalles.FieldByName('deposito_idorigen').AsString;
                                      ZQRemoteExcecSql.ParamByName('deposito_iddestino').AsString:=ZQMovimDepoDetalles.FieldByName('deposito_iddestino').AsString;
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_id').AsString:='0';
                                      ZQRemoteExcecSql.ExecSql;

                                      ZQMovimDepoDetalles.Next;
                                  end;

                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('commit');
                              ZQRemoteExcecSql.ExecSql;
                              error:=0;
                              except
                                error:=4;
                                princ.Permisos1.guardarlog(self.ClassName+'.subir_mov_deposito; error='+inttostr(error));
                              end;

                              if error=0 then
                                begin
                                    ZQExcecSQLSinc.Sql.Clear;
                                    ZQExcecSQLSinc.Sql.Add('update movimientosdepositos set ');
                                    ZQExcecSQLSinc.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc ');
                                    ZQExcecSQLSinc.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                                    ZQExcecSQLSinc.ParamByName('movimientodeposito_estadosinc').AsString:='EXPORTADO';
                                    ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                                    ZQExcecSQLSinc.ExecSql;

                                end;


                              ZQMovimientosDepositos.Next;
                          end;

                  end;
            end;

          //                  SUBIR CONFIRMACION MOVIMIENTOS DE DEPOSITO
          if strtobool(MOVIMDEPOSUBIRCONFIRMACION) then
            begin
                BaseRemota.Reconnect;
                princ.Permisos1.guardarlog(self.ClassName+'.subir_conf_mov_deposito;');
                if BaseRemota.Connected then
                  begin
                      ZQMovimientosDepositos.Active:=false;
                      ZQMovimientosDepositos.SQL.Text:='select * from movimientosdepositos where movimientodeposito_estadosinc="CONFIRMAR" and deposito_iddestino='+Princ.dep_id+' order by movimientodeposito_id';
                      ZQMovimientosDepositos.Active:=true;
                      ZQMovimientosDepositos.First;
                      while not ZQMovimientosDepositos.Eof do
                          begin
                              try
                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('begin');
                              ZQRemoteExcecSql.ExecSql;


                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('update movimientosdepositos set ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
                              ZQRemoteExcecSql.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado ');
                              ZQRemoteExcecSql.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_observaciones').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_observaciones').AsString;
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_estadosinc').AsString:='CONFIRMAR';
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_estado').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_estado').AsString;
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                              ZQRemoteExcecSql.ExecSql;

                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('delete from movimdepodetalles ');
                              ZQRemoteExcecSql.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                              ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                              ZQRemoteExcecSql.ExecSql;

                              ZQMovimDepoDetalles.Active:=false;
                              ZQMovimDepoDetalles.SQL.Text:='select * from movimdepodetalles where movimientodeposito_id="'+ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString+'" and deposito_iddestino='+Princ.dep_id;
                              ZQMovimDepoDetalles.Active:=true;
                              ZQMovimDepoDetalles.First;
                              while not ZQMovimDepoDetalles.Eof do
                                  begin
                                      ZQRemoteExcecSql.Sql.Clear;
                                      ZQRemoteExcecSql.Sql.Add('insert into movimdepodetalles set ');
                                      ZQRemoteExcecSql.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
                                      ZQRemoteExcecSql.Sql.Add('producto_id=:producto_id, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
                                      ZQRemoteExcecSql.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                                      ZQRemoteExcecSql.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                                      ZQRemoteExcecSql.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
                                      ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                                      ZQRemoteExcecSql.ParamByName('producto_id').AsString:=ZQMovimDepoDetalles.FieldByName('producto_id').AsString;
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_estado').AsString:='CONFIRMAR';
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQMovimDepoDetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQMovimDepoDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                      ZQRemoteExcecSql.ParamByName('deposito_idorigen').AsString:=ZQMovimDepoDetalles.FieldByName('deposito_idorigen').AsString;
                                      ZQRemoteExcecSql.ParamByName('deposito_iddestino').AsString:=ZQMovimDepoDetalles.FieldByName('deposito_iddestino').AsString;
                                      ZQRemoteExcecSql.ParamByName('movimdepodetalle_id').AsString:='0';
                                      ZQRemoteExcecSql.ExecSql;

                                      ZQMovimDepoDetalles.Next;
                                  end;

                              ZQRemoteExcecSql.Sql.Clear;
                              ZQRemoteExcecSql.Sql.Add('commit');
                              ZQRemoteExcecSql.ExecSql;
                              error:=0;
                              except
                                error:=5;
                                princ.Permisos1.guardarlog(self.ClassName+'.subir_conf_mov_deposito; error='+inttostr(error));
                              end;

                              if error=0 then
                                begin
                                    ZQExcecSQLSinc.Sql.Clear;
                                    ZQExcecSQLSinc.Sql.Add('update movimientosdepositos set ');
                                    ZQExcecSQLSinc.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc ');
                                    ZQExcecSQLSinc.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                                    ZQExcecSQLSinc.ParamByName('movimientodeposito_estadosinc').AsString:='CONFIRMADO';
                                    ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                                    ZQExcecSQLSinc.ExecSql;

                                end;


                              ZQMovimientosDepositos.Next;
                          end;
                  end;
            end;

          //                  DESCARGAR MOVIMIENTOS DE DEPOSITO

          if strtobool(MOVIMDEPODESCARGAR) then
            begin
                BaseRemota.Reconnect;
                princ.Permisos1.guardarlog(self.ClassName+'.descargar_mov_deposito;');
                if BaseRemota.Connected then
                  begin
                      ZQRemoteSelect.Active:=false;
                      ZQRemoteSelect.SQL.Text:='select * from movimientosdepositos where movimientodeposito_estadosinc="DESCARGAR" and deposito_iddestino='+Princ.dep_id+' order by movimientodeposito_id';
                      ZQRemoteSelect.Active:=true;
                      ZQRemoteSelect.First;
                      while not ZQRemoteSelect.Eof do
                          begin
                              try
                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('begin');
                              ZQExcecSQLSinc.ExecSql;

                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('insert into movimientosdepositos set ');
                              ZQExcecSQLSinc.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                              ZQExcecSQLSinc.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_hora=:movimientodeposito_hora, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_fecha=:movimientodeposito_fecha, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_id=:movimientodeposito_id ');
                              ZQExcecSQLSinc.ParamByName('deposito_iddestino').AsString:=ZQRemoteSelect.FieldByName('deposito_iddestino').AsString;
                              ZQExcecSQLSinc.ParamByName('deposito_idorigen').AsString:=ZQRemoteSelect.FieldByName('deposito_idorigen').AsString;
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_observaciones').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_observaciones').AsString;
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_estadosinc').AsString:='DESCARGADO';
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_estado').AsString:='PENDIENTE';
                              if strtobool(MOVIMDEPOCONFIRMAUTO) then
                                begin
                                    ZQExcecSQLSinc.ParamByName('movimientodeposito_estadosinc').AsString:='CONFIRMAR';
                                    ZQExcecSQLSinc.ParamByName('movimientodeposito_estado').AsString:='RECIBIDO';
                                end;

                              ZQExcecSQLSinc.ParamByName('movimientodeposito_hora').AsString:=formatdatetime('HH:MM:SS',ZQRemoteSelect.FieldByName('movimientodeposito_hora').AsDateTime);
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_fecha').AsString:=formatdatetime('yyyy-mm-dd',ZQRemoteSelect.FieldByName('movimientodeposito_fecha').AsDateTime);
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString;
                              ZQExcecSQLSinc.ExecSql;

                              ZQRemoteSelectDetalles.Active:=false;
                              ZQRemoteSelectDetalles.SQL.Text:='select * from movimdepodetalles where movimientodeposito_id="'+ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString+'" and deposito_iddestino="'+Princ.dep_id+'"';
                              ZQRemoteSelectDetalles.Active:=true;
                              ZQRemoteSelectDetalles.First;
                              while not ZQRemoteSelectDetalles.Eof do
                                  begin
                                      ZQExcecSQLSinc.Sql.Clear;
                                      ZQExcecSQLSinc.Sql.Add('insert into movimdepodetalles set ');
                                      ZQExcecSQLSinc.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
                                      ZQExcecSQLSinc.Sql.Add('producto_id=:producto_id, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
                                      ZQExcecSQLSinc.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                                      ZQExcecSQLSinc.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
                                      ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString;
                                      ZQExcecSQLSinc.ParamByName('producto_id').AsString:=ZQRemoteSelectDetalles.FieldByName('producto_id').AsString;
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_estado').AsString:='PENDIENTE';
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQRemoteSelectDetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
                                      if strtobool(MOVIMDEPOCONFIRMAUTO) then
                                        begin
                                            ZQExcecSQLSinc.ParamByName('movimdepodetalle_estado').AsString:='RECIBIDO';
                                            ZQExcecSQLSinc.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQRemoteSelectDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                        end;

                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQRemoteSelectDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_id').AsString:=Princ.codigo('movimdepodetalles','movimdepodetalle_id');
                                      ZQExcecSQLSinc.ParamByName('deposito_idorigen').AsString:=ZQRemoteSelectDetalles.FieldByName('deposito_idorigen').AsString;
                                      ZQExcecSQLSinc.ParamByName('deposito_iddestino').AsString:=ZQRemoteSelectDetalles.FieldByName('deposito_iddestino').AsString;
                                      ZQExcecSQLSinc.ExecSql;

                                      if strtobool(MOVIMDEPOCONFIRMAUTO) then
                                        begin
                                            Princ.actualizarstock(ZQRemoteSelectDetalles.FieldByName('producto_id').AsString,ZQRemoteSelectDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat,'',false);


                                        end;



                                      ZQRemoteSelectDetalles.Next;
                                  end;

                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('commit');
                              ZQExcecSQLSinc.ExecSql;
                              error:=0;
                              except
                                error:=6;
                                princ.Permisos1.guardarlog(self.ClassName+'.descargar_mov_deposito; error='+inttostr(error));
                              end;

                              if error=0 then
                                begin
                                    ZQRemoteExcecSql.Sql.Clear;
                                    ZQRemoteExcecSql.Sql.Add('update movimientosdepositos set ');
                                    ZQRemoteExcecSql.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc ');
                                    ZQRemoteExcecSql.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                                    ZQRemoteExcecSql.ParamByName('movimientodeposito_estadosinc').AsString:='EXPORTADO';
                                    ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString;
                                    ZQRemoteExcecSql.ExecSql;

                                end;

                              ZQRemoteSelect.Next;
                          end;

                  end;

            end;


          //                  DESCARGAR CONFIRMACION MOVIMIENTOS DE DEPOSITO
          if strtobool(MOVIMDEPODESCARGARCONFIRM) then
            begin
                BaseRemota.Reconnect;
                princ.Permisos1.guardarlog(self.ClassName+'.descargar_conf_mov_deposito;');
                if BaseRemota.Connected then
                  begin
                      ZQRemoteSelect.Active:=false;
                      ZQRemoteSelect.SQL.Text:='select * from movimientosdepositos where movimientodeposito_estadosinc="CONFIRMAR" and deposito_idorigen='+Princ.dep_id+' order by movimientodeposito_id';
                      ZQRemoteSelect.Active:=true;
                      ZQRemoteSelect.First;
                      while not ZQRemoteSelect.Eof do
                          begin
                              try
                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('begin');
                              ZQExcecSQLSinc.ExecSql;

                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('update movimientosdepositos set ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_observaciones=:movimientodeposito_observaciones, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
                              ZQExcecSQLSinc.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado ');
                              ZQExcecSQLSinc.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_observaciones').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_observaciones').AsString;
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_estadosinc').AsString:='CONFIRMADO';
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_estado').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_estado').AsString;
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString;
                              ZQExcecSQLSinc.ExecSql;

                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('delete from movimdepodetalles ');
                              ZQExcecSQLSinc.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                              ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString;
                              ZQExcecSQLSinc.ExecSql;

                              ZQRemoteSelectDetalles.Active:=false;
                              ZQRemoteSelectDetalles.SQL.Text:='select * from movimdepodetalles where movimientodeposito_id="'+ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString+'" and deposito_idorigen='+Princ.dep_id;
                              ZQRemoteSelectDetalles.Active:=true;
                              ZQRemoteSelectDetalles.First;
                              while not ZQRemoteSelectDetalles.Eof do
                                  begin
                                      ZQExcecSQLSinc.Sql.Clear;
                                      ZQExcecSQLSinc.Sql.Add('insert into movimdepodetalles set ');
                                      ZQExcecSQLSinc.Sql.Add('movimientodeposito_id=:movimientodeposito_id, ');
                                      ZQExcecSQLSinc.Sql.Add('producto_id=:producto_id, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_cantidadenviar=:movimdepodetalle_cantidadenviar, ');
                                      ZQExcecSQLSinc.Sql.Add('deposito_idorigen=:deposito_idorigen, ');
                                      ZQExcecSQLSinc.Sql.Add('deposito_iddestino=:deposito_iddestino, ');
                                      ZQExcecSQLSinc.Sql.Add('movimdepodetalle_id=:movimdepodetalle_id ');
                                      ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelectDetalles.FieldByName('movimientodeposito_id').AsString;
                                      ZQExcecSQLSinc.ParamByName('producto_id').AsString:=ZQRemoteSelectDetalles.FieldByName('producto_id').AsString;
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_estado').AsString:='CONFIRMADO';
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQRemoteSelectDetalles.FieldByName('movimdepodetalle_cantidadrecibir').AsString;
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_cantidadenviar').AsString:=ZQRemoteSelectDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                      ZQExcecSQLSinc.ParamByName('deposito_idorigen').AsString:=ZQRemoteSelectDetalles.FieldByName('deposito_idorigen').AsString;
                                      ZQExcecSQLSinc.ParamByName('deposito_iddestino').AsString:=ZQRemoteSelectDetalles.FieldByName('deposito_iddestino').AsString;
                                      ZQExcecSQLSinc.ParamByName('movimdepodetalle_id').AsString:=Princ.codigo('movimdepodetalles','movimdepodetalle_id');
                                      ZQExcecSQLSinc.ExecSql;

                                      ZQRemoteSelectDetalles.Next;
                                  end;

                              ZQExcecSQLSinc.Sql.Clear;
                              ZQExcecSQLSinc.Sql.Add('commit');
                              ZQExcecSQLSinc.ExecSql;
                              error:=0;
                              except
                              error:=7;
                              princ.Permisos1.guardarlog(self.ClassName+'.descargar_conf_mov_deposito; error='+inttostr(error));
                              end;

                              if error=0 then
                                begin
                                    ZQRemoteExcecSql.Sql.Clear;
                                    ZQRemoteExcecSql.Sql.Add('update movimientosdepositos set ');
                                    ZQRemoteExcecSql.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc ');
                                    ZQRemoteExcecSql.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                                    ZQRemoteExcecSql.ParamByName('movimientodeposito_estadosinc').AsString:='CONFIRMADO';
                                    ZQRemoteExcecSql.ParamByName('movimientodeposito_id').AsString:=ZQRemoteSelect.FieldByName('movimientodeposito_id').AsString;
                                    ZQRemoteExcecSql.ExecSql;

                                end;

                              ZQRemoteSelect.Next;
                          end;

                  end;
            end;



          if strtobool(MOVIMDEPOPROCESAR) then //PROCESAR MOVIMIENTOS DE DEPOSITOS LOCALMENTE
            begin
                try
                  ZQMovimientosDepositos.Active:=false;
                  ZQMovimientosDepositos.SQL.Text:='select * from movimientosdepositos where movimientodeposito_estadosinc="DESCARGAR" and deposito_iddestino='+Princ.dep_id+' order by movimientodeposito_id';
                  ZQMovimientosDepositos.Active:=true;
                  ZQMovimientosDepositos.First;

                  while not ZQMovimientosDepositos.Eof do
                      begin
                          ZQMovimDepoDetalles.Active:=false;
                          ZQMovimDepoDetalles.SQL.Text:='select * from movimdepodetalles where movimientodeposito_id="'+ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString+'" and deposito_iddestino='+Princ.dep_id;
                          ZQMovimDepoDetalles.Active:=true;
                          ZQMovimDepoDetalles.First;
                          ZQExcecSQLSinc.Sql.Clear;
                          ZQExcecSQLSinc.Sql.Add('update movimdepodetalles set ');
                          ZQExcecSQLSinc.Sql.Add('movimdepodetalle_estado=:movimdepodetalle_estado, ');
                          ZQExcecSQLSinc.Sql.Add('movimdepodetalle_cantidadrecibir=:movimdepodetalle_cantidadrecibir ');
                          ZQExcecSQLSinc.Sql.Add('where movimdepodetalle_id=:movimdepodetalle_id ');
                          while not ZQMovimDepoDetalles.Eof do
                              begin
                                  Princ.actualizarstock(ZQMovimDepoDetalles.FieldByName('producto_id').AsString,ZQMovimDepoDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsFloat,'',false);
                                  ZQExcecSQLSinc.ParamByName('movimdepodetalle_estado').AsString:='RECIBIDO';
                                  ZQExcecSQLSinc.ParamByName('movimdepodetalle_cantidadrecibir').AsString:=ZQMovimDepoDetalles.FieldByName('movimdepodetalle_cantidadenviar').AsString;
                                  ZQExcecSQLSinc.ParamByName('movimdepodetalle_id').AsString:=ZQmovimdepodetalles.FieldByName('movimdepodetalle_id').AsString;
                                  ZQExcecSQLSinc.ExecSql;
                                  ZQMovimDepoDetalles.Next;
                              end;

                          ZQExcecSQLSinc.Sql.Clear;
                          ZQExcecSQLSinc.Sql.Add('update movimientosdepositos set ');
                          ZQExcecSQLSinc.Sql.Add('movimientodeposito_estadosinc=:movimientodeposito_estadosinc, ');
                          ZQExcecSQLSinc.Sql.Add('movimientodeposito_estado=:movimientodeposito_estado ');
                          ZQExcecSQLSinc.Sql.Add('where movimientodeposito_id=:movimientodeposito_id ');
                          ZQExcecSQLSinc.ParamByName('movimientodeposito_estadosinc').AsString:='CONFIRMAR';
                          ZQExcecSQLSinc.ParamByName('movimientodeposito_estado').AsString:='RECIBIDO';
                          ZQExcecSQLSinc.ParamByName('movimientodeposito_id').AsString:=ZQMovimientosDepositos.FieldByName('movimientodeposito_id').AsString;
                          ZQExcecSQLSinc.ExecSql;

                          ZQMovimientosDepositos.Next;
                      end;

                  error:=0;
                except
                  error:=8;
                  princ.Permisos1.guardarlog(self.ClassName+'.procesar_mov_deposito; error='+inttostr(error));
                end;
            end;
      end
    else
      begin
          princ.Permisos1.guardarlog(self.ClassName+'.sincronizarstock; error='+inttostr(error));
      end;

//    Princ.StatusBar1.Panels.Items[1].Text:='Sincronizacion Stock finalizada - '+formatdatetime('HH:mm',time);
    princ.Permisos1.guardarlog(self.ClassName+'.sincronizarstock; finalizado; error='+inttostr(error));

end;




procedure TPrinc.actualizarstock(producto_id:string; cantidad:real; tipodocu_id:string; inversa:boolean=false );
var
  tipodocu_stock:integer;
begin
    if tipodocu_id<>'' then
      begin
          tipodocu_stock:=strtoint(Princ.buscar('select tipodocu_stock from tiposdocumento where tipodocu_id="'+tipodocu_id+'"','tipodocu_stock'));

          if tipodocu_stock<>0 then
            begin
                if tipodocu_stock=1 then
                  cantidad:= cantidad*-1;

                if inversa then
                  cantidad:= cantidad*-1;

                ZQActualizarStock.SQL.Clear;
                ZQActualizarStock.SQL.Text:='call actualizarstockproductos("'+producto_id+'","'+dep_id+'","'+floattostr(cantidad)+'")';
                ZQActualizarStock.ExecSQL;
            end;

      end
    else
      begin
          if inversa then
            cantidad:= cantidad*-1;

          ZQActualizarStock.SQL.Clear;
          ZQActualizarStock.SQL.Text:='call actualizarstockproductos("'+producto_id+'","'+dep_id+'","'+floattostr(cantidad)+'")';
          ZQActualizarStock.ExecSQL;
      end;

end;

procedure TPrinc.SincronizarTodo;
begin
//      ExportarDB:=TExportarDB.Create(Princ);

    ExportarDB.sincronizarahora;
    ImportarDB.sincronizarahora;

    Princ.sincronizarstock;
//    Timer1.Enabled:=true;
end;


procedure TPrinc.Timer1Timer(Sender: TObject);
var
  dia:string;
begin
    if (EXPORTACIONSINCMINUTOS<>'0') and (EXPORTACIONSINCMINUTOS<>'') then
      begin
          CrearHilo;
          if ExportarDB=nil then
            ExportarDB:=TExportarDB.Create(Princ);

          if ImportarDB=nil then
            ImportarDB:=TImportarDB.Create(Princ);

          Hilo.Ejecutar := Self.SincronizarTodo;
          Hilo.Priority := tpNormal;
          Hilo.Resume;


      end
    else
      begin
          if strtodate(Princ.GetConfiguracion('ULTIMAEXPORTACION'))<date then
            begin
                dia:=formatdatetime('dddd',date);
                if strtobool(GetConfiguracion('EXPORTACION'+dia)) then
                  begin
                      if strtotime(GetConfiguracion('EXPORTACIONhora'))<=time then
                        begin
                            CrearHilo;
                            ExportarDB:=TExportarDB.Create(Princ);
                            ImportarDB:=TImportarDB.Create(Princ);

                            Hilo.Ejecutar := Self.SincronizarTodo;
                            Hilo.Priority := tpNormal;
                            Hilo.Resume;

                        end;
                  end;
            end;

      end;
end;

procedure TPrinc.TrayMessage(var Msg: TMessage);
begin
  if (Msg.lParam=WM_LBUTTONDOWN) or (Msg.lParam=WM_RBUTTONDOWN) then
    begin
        if Princ.Visible then
          Princ.Hide
        else
          Princ.Show;
    end;


//  case Msg.lParam of
//    WM_LBUTTONDOWN:
//    begin
//      ShowMessage('Left button clicked - let''s SHOW the Form!');
//      Princ.Show;
//    end;
//    WM_RBUTTONDOWN:
//    begin
//      ShowMessage('Right button clicked - let''s HIDE the Form!');
//      Princ.Hide;
//    end;
//  end;
end;



procedure TPrinc.ZBaseAfterConnect(Sender: TObject);
var
  LOGDB:string;
begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\logs\') then
      CreateDir(ExtractFilePath(Application.ExeName)+'\logs\');

    ZSQLMonitor1.FileName:=ExtractFilePath(Application.ExeName)+'\logs\logsql'+formatdatetime('yyyymdd',date)+'.log';

    LOGDB:=Princ.GetConfiguracion('LOGDB');

    if LOGDB<>'' then
      begin
          if strtobool(LOGDB) then
            begin
                ZSQLMonitor1.AutoSave:=true;
                ZSQLMonitor1.Active:=true;
            end;
      end;
end;

procedure TPrinc.ZBaseBeforeConnect(Sender: TObject);
var
  tipo_encriptacion:string;
  pass:string;
begin
    ini1.IniFilename:=ExtractFilePath(Application.ExeName)+'Config.ini';
    ZBase.Database:=ini1.ReadiniString('Connection','Database','base');
    ZBase.HostName:=ini1.ReadiniString('Connection','HostName','localhost');
    ZBase.Port:=strtoint(ini1.ReadiniString('Connection','Port','3306'));
    ZBase.Protocol:=ini1.ReadiniString('Connection','Protocol','mysql-5');
    ZBase.User:=ini1.ReadiniString('Connection','User','root');
    pass:=ini1.ReadiniString('Connection','Password','root');
    tipo_encriptacion:=ini1.ReadiniString('Config','Tipo','0');
    Encriptador1.ADesencriptar:=pass;
    Encriptador1.MetodoEncriptado:=strtoint(tipo_encriptacion);
    Encriptador1.Key:=CLAVE_ENCRIPTADO;
    Encriptador1.Desencriptar;
    pass:=Encriptador1.Desencriptado;
    if tipo_encriptacion<>'2' then
      begin
          ini1.WriteiniString('Config','Tipo','2');
          Encriptador1.AEncriptar:=pass;
          Encriptador1.MetodoEncriptado:=2;
          Encriptador1.Key:='1234567890';
          Encriptador1.Encriptar;
          ini1.WriteiniString('Connection','Password',Encriptador1.Encriptado);
      end;

    ZBase.Password:=pass;
end;

procedure TPrinc.FormCreate(Sender: TObject);
var
  tipo_encriptacion:string;
begin
  with TrayIconData do
  begin
    cbSize := SizeOf(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;

  Shell_NotifyIcon(NIM_ADD, @TrayIconData);

    DecimalSeparator:='.';
    ThousandSeparator:=',';
    Application.UpdateFormatSettings:= False;

    ZBase.Connect;


    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\BackupDb\') then
      CreateDir(ExtractFilePath(Application.ExeName)+'\BackupDb\');


    BaseRemota.Database:=Princ.GetConfiguracion('DBREMOTADB');
    BaseRemota.HostName:=Princ.GetConfiguracion('DBREMOTASERVIDOR');
    BaseRemota.Port:=3306;
    BaseRemota.Protocol:='mysql-5';
    BaseRemota.User:=Princ.GetConfiguracion('DBREMOTAUSUARIO');
    BaseRemota.Password:=Princ.GetConfiguracion('DBREMOTAPASS');
    tipo_encriptacion:=ini1.ReadiniString('Config','Tipo','0');
    Encriptador1.ADesencriptar:=BaseRemota.Password;
    Encriptador1.MetodoEncriptado:=strtoint(tipo_encriptacion);
    Encriptador1.Key:=CLAVE_ENCRIPTADO;
    Encriptador1.Desencriptar;
    BaseRemota.Password:=Encriptador1.Desencriptado;
    BaseRemota.Database:=Princ.GetConfiguracion('DBREMOTADB');


    Timer1.Enabled:=false;
    EXPORTACIONSINCMINUTOS:=Princ.GetConfiguracion('EXPORTACIONSINCMINUTOS');
    if (Princ.GetConfiguracion('PCSINCRONIZADORA')=Princ.GetPCName) then
      begin
          if (EXPORTACIONSINCMINUTOS<>'0') and (EXPORTACIONSINCMINUTOS<>'') then
            begin
                Timer1.Interval:=1000*60*strtoint(EXPORTACIONSINCMINUTOS);

            end;

          Timer1.Enabled:=true;
      end;

    Princ.personal_id_logueado:='99';
    Princ.perfil_id_logueado:='0';

    Permisos1.ConfPerfil_id:=perfil_id_logueado;
    Permisos1.ConfPersonal_id:=personal_id_logueado;
    Permisos1.ConfPcName:=Princ.GetPCName;

    dep_id:=Princ.GetConfiguracion('DEPOSITODEFECTO');

end;

function TPrinc.GetPCName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: Cardinal;
begin
  FillChar(Buffer,Sizeof(Buffer),0);
  Size:= Sizeof(Buffer);
  if GetComputerName(Buffer,Size) then
    Result:= String(PChar(@Buffer))
  else
    Result:= '';
end;

function TPrinc.buscar(sql:string;campo:string):string;
var
  codi:integer;
begin
    ZQBuscar.Active:=false;
    ZQBuscar.SQL.Text:=sql;
    ZQBuscar.Active:=true;

    result:=ZQBuscar.FieldByName(campo).AsString;

    ZQBuscar.Active:=false;
end;

procedure TPrinc.Button1Click(Sender: TObject);
begin
    Timer1.Enabled:=false;
    if ExportarDB=nil then
      ExportarDB:=TExportarDB.Create(Princ);
    ExportarDB.sincronizarahora;
    Timer1.Enabled:=true;
end;

procedure TPrinc.Button2Click(Sender: TObject);
begin
    Timer1.Enabled:=false;
    if ImportarDB=nil then
      ImportarDB:=TImportarDB.Create(Princ);
    ImportarDB.sincronizarahora;
    Timer1.Enabled:=true;



    
end;

procedure TPrinc.Button3Click(Sender: TObject);
begin
    Timer1.Enabled:=false;
    Princ.sincronizarstock;
    Timer1.Enabled:=true;
end;

function TPrinc.GetConfiguracion(config_nombre: string):string;
var
  config_valor:string;
begin
    config_valor:=Princ.buscar('select config_valor from config where config_nombre="'+config_nombre+'"','config_valor');


    result:=config_valor;
end;


procedure TPrinc.FormDestroy(Sender: TObject);
begin
    Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;


function TPrinc.codigo(tabla:string;campo:string):string;
var
  codi:integer;
begin
    ZQCodigo.Active:=false;
    ZQCodigo.SQL.Text:='select max('+campo+') as codi from '+tabla;
    ZQCodigo.Active:=true;

    if ZQCodigo.FieldByName('codi').AsString='' then
      codi:=0
    else
      codi:=ZQCodigo.FieldByName('codi').AsInteger;

    codi:=codi+1;

    ZQCodigo.Active:=false;

    result:=inttostr(codi);

//    result:='2';
end;

end.
