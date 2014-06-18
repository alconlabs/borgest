unit UnitSincronizarDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, AdvListV, UnitSqlListView, Titles, ZConnection;

type
  TSincronizarDB = class(TABMbase)
    tiTablasSincronizar: TTitles;
    servidorlocal: TLabel;
    servidorremoto: TLabel;
    btnsincronizar: TButton;
    pclocal: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    tablasinc_id: TSqlListView;
    GroupBox1: TGroupBox;
    SINCLUNES: TCheckBox;
    SINCMARTES: TCheckBox;
    SICMIERCOLES: TCheckBox;
    SINCJUEVES: TCheckBox;
    SINCVIERNES: TCheckBox;
    SICSABADO: TCheckBox;
    SINCHORA: TDateTimePicker;
    Label1: TLabel;
    ZQConfig: TZQuery;
    Label2: TLabel;
    PCSINCRONIZADORA: TEdit;
    Label3: TLabel;
    SINCMINUTOS: TEdit;
    Label4: TLabel;
    SINCSTOCK: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnsincronizarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    baseOrigen:TZConnection;
    baseDestino:TZConnection;
  public
    { Public declarations }
    tipo_sincronizacion:string;
    tablasinc_tipooperacion:string;
    procedure sincronizarahora;
  end;

var
  SincronizarDB: TSincronizarDB;

implementation

uses Unitprinc;

{$R *.dfm}


procedure TSincronizarDB.sincronizarahora;
var
  error:integer;
begin
    Princ.TimerReconectarDBRemota.Interval:=20*1000;
    Princ.TimerReconectarDBRemota.Enabled:=true;
    error:=0;
    princ.XiProgressBar1.Visible:=true;

    try
      Princ.StatusBar1.Panels.Items[2].Destroy;
      Princ.StatusBar1.Panels.Items[3].Destroy;
      Princ.StatusBar1.Panels.Items[4].Destroy;
    except
    end;


    Princ.StatusBar1.Panels.Add.Text:=self.tipo_sincronizacion+' iniciada - '+formatdatetime('HH:mm',time);
    Princ.StatusBar1.Panels.Items[Princ.StatusBar1.Panels.Count-1].Width:=200;
    tablasinc_id.LlenarMQuery;
    if tablasinc_id.FQChequeados.RecordCount>0 then
      begin
          tablasinc_id.FQChequeados.First;
          Princ.UtilidadesDB1.ConfBaseOrigen:=Self.baseOrigen;
          Princ.UtilidadesDB1.ConfBaseDestino:=Self.baseDestino;

          Princ.UtilidadesDB1.ConfTablasSinc.Clear;
          Princ.UtilidadesDB1.ConfTablasCondicion.Clear;
          while not tablasinc_id.FQChequeados.Eof do
              begin
                  Princ.UtilidadesDB1.ConfTablasSinc.Add(tablasinc_id.FQChequeados.FieldByName('tablasinc_nombre').AsString);
                  Princ.UtilidadesDB1.ConfTablasCondicion.Add(tablasinc_id.FQChequeados.FieldByName('tablasinc_condicion').AsString);
                  tablasinc_id.FQChequeados.Next;
              end;


          Princ.UtilidadesDB1.CalcularTotalRegistros;
          Princ.XiProgressBar1.Max:=Princ.UtilidadesDB1.total_items;
          Princ.TimerBarraProgreso.Enabled:=true;
          Princ.UtilidadesDB1.ConfTxtDestino:=ExtractFilePath(Application.ExeName)+'\BackupDb\db'+FormatDateTime('yyyymmddhhnnss',Now)+'.sql';
          
          if not Princ.UtilidadesDB1.Sincronizar then
            error:=1;

          Princ.TimerBarraProgreso.Enabled:=false;
          ZQExecSQL.Sql.Clear;
          ZQExecSQL.Sql.Add('update tablassincronizar set ');
          ZQExecSQL.Sql.Add('tablasinc_ultimasinc=:tablasinc_ultimasinc, ');
          ZQExecSQL.Sql.Add('tablasinc_sincronizar=:tablasinc_sincronizar ');
          ZQExecSQL.Sql.Add('where tablasinc_id=:tablasinc_id ');
          tablasinc_id.FQChequeados.First;

          while not tablasinc_id.FQChequeados.Eof do
              begin
                  ZQExecSQL.ParamByName('tablasinc_ultimasinc').AsString:=formatdatetime('yyyy-mm-dd',Date);
                  ZQExecSQL.ParamByName('tablasinc_sincronizar').AsString:='-1';
                  ZQExecSQL.ParamByName('tablasinc_id').AsString:=tablasinc_id.FQChequeados.FieldByName('tablasinc_id').AsString;
                  try
                    ZQExecSQL.ExecSql;
                  except
                    error:=2;
                  end;


                  tablasinc_id.FQChequeados.Next;
              end;


          ZQExecSQL.SQL.Clear;
          ZQExecSQL.sql.add('Replace config set ');
          ZQExecSQL.sql.add('config_valor=:config_valor, ');
          ZQExecSQL.sql.add('config_nombre=:config_nombre');
          ZQExecSQL.parambyname('config_nombre').AsString:='ULTIMAEXPORTACION';
          ZQExecSQL.parambyname('config_valor').AsString:=formatdatetime('dd/mm/yyyy',date);
          ZQExecSQL.ExecSQL;

      //    result:=error=0;


      end;



    Princ.StatusBar1.Panels.Items[Princ.StatusBar1.Panels.Count-1].Text:=self.tipo_sincronizacion+' finalizada - '+formatdatetime('HH:mm',time);
    Princ.TimerReconectarDBRemota.Enabled:=false;
end;

procedure TSincronizarDB.btnguardarClick(Sender: TObject);
begin
  inherited;
    tablasinc_id.LlenarMQuery;
    tablasinc_id.FQChequeados.First;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update tablassincronizar set ');
    ZQExecSQL.Sql.Add('tablasinc_sincronizar=:tablasinc_sincronizar ');
    ZQExecSQL.Sql.Add('where tablasinc_tipooperacion=:tablasinc_tipooperacion ');
    ZQExecSQL.ParamByName('tablasinc_sincronizar').AsString:='0';
    ZQExecSQL.ParamByName('tablasinc_tipooperacion').AsString:=tablasinc_tipooperacion;
    ZQExecSQL.ExecSql;

    ZQExecSQL.Sql.Clear;
    ZQExecSQL.Sql.Add('update tablassincronizar set ');
    ZQExecSQL.Sql.Add('tablasinc_sincronizar=:tablasinc_sincronizar ');
    ZQExecSQL.Sql.Add('where tablasinc_id=:tablasinc_id ');

    while not tablasinc_id.FQChequeados.Eof do
        begin
            ZQExecSQL.ParamByName('tablasinc_sincronizar').AsString:='-1';
            ZQExecSQL.ParamByName('tablasinc_id').AsString:=tablasinc_id.FQChequeados.FieldByName('tablasinc_id').AsString;
            ZQExecSQL.ExecSql;

            tablasinc_id.FQChequeados.Next;
        end;


    ZQExecSQL.sql.clear;
    ZQExecSQL.sql.add('Replace config set ');
    ZQExecSQL.sql.add('config_valor=:config_valor, ');
    ZQExecSQL.sql.add('config_nombre=:config_nombre');
    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'lunes';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SINCLUNES.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'martes';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SINCMARTES.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'miércoles';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SICMIERCOLES.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'jueves';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SINCJUEVES.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'viernes';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SINCVIERNES.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'sábado';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SICSABADO.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'SINCSTOCK';
    ZQExecSQL.parambyname('config_valor').AsString:=booltostr(SINCSTOCK.Checked);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'hora';
    ZQExecSQL.parambyname('config_valor').AsString:=timetostr(SINCHORA.Time);
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'SINCMINUTOS';
    ZQExecSQL.parambyname('config_valor').AsString:=SINCMINUTOS.Text;
    ZQExecSQL.ExecSQL;

    ZQExecSQL.parambyname('config_nombre').AsString:='PCSINCRONIZADORA';
    ZQExecSQL.parambyname('config_valor').AsString:=PCSINCRONIZADORA.Text;
    ZQExecSQL.ExecSQL;


    MessageDlg('Datos guardados correctamente.', mtInformation, [mbOK], 0);
end;

procedure TSincronizarDB.btnsincronizarClick(Sender: TObject);
begin
  inherited;
    if (MessageDlg('Seguro desea realizar la sincronizacion?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
      begin
          hilo:=Thilo.Create(true);
          Hilo.Ejecutar := sincronizarahora;
          Hilo.Priority := tpNormal;
          Hilo.Resume;

      end;


end;

procedure TSincronizarDB.FormCreate(Sender: TObject);
var
  i:integer;
begin
  inherited;
    if baseOrigen=nil then
      baseOrigen:=Princ.ZBase;

    if baseDestino=nil then
      baseDestino:=Princ.BaseRemota;

    tablasinc_id.Clear;
    tablasinc_id.ConfField.Memo.Text:='select * from tablassincronizar '+
                                      'where tablasinc_tipooperacion="'+tablasinc_tipooperacion+'" '+
                                      'order by tablasinc_nombre ';

    tablasinc_id.Fill;
    ZQSelect.Active:=false;
    ZQSelect.ParamByName('tablasinc_tipooperacion').AsString:=tablasinc_tipooperacion;
    ZQSelect.Active:=true;
    for i:=0 to tablasinc_id.Items.Count-1 do
      begin
          if ZQSelect.Locate('tablasinc_id',tablasinc_id.Items.Item[i].Caption,[]) then
            begin
                tablasinc_id.Items.Item[i].Checked:=true;
            end;
      end;

    servidorlocal.Caption:='Servidor local: '+Princ.ZBase.HostName;
    servidorremoto.Caption:='Servidor remoto: '+Princ.GetConfiguracion('DBREMOTASERVIDOR');
    pclocal.Caption:='PC Local: '+Princ.GetPCName;

    ZQConfig.Active:=false;
    ZQConfig.Active:=true;

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'lunes',[]) then
      SINCLUNES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'martes',[]) then
      SINCMARTES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'miércoles',[]) then
      SICMIERCOLES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'jueves',[]) then
      SINCJUEVES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'viernes',[]) then
      SINCVIERNES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'sábado',[]) then
      SICSABADO.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'SINCSTOCK',[]) then
      SINCSTOCK.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'hora',[]) then
      SINCHORA.Time:=strtotime(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'SINCMINUTOS',[]) then
      SINCMINUTOS.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','PCSINCRONIZADORA',[]) then
      PCSINCRONIZADORA.Text:=ZQConfig.FieldByName('config_valor').AsString;

end;

end.
