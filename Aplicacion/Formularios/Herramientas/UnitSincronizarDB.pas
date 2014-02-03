unit UnitSincronizarDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitABMbase, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ExtCtrls, AdvPanel, ComCtrls, AdvListV, UnitSqlListView, Titles;

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
    procedure FormCreate(Sender: TObject);
    procedure btnsincronizarClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    tipo_sincronizacion:string;
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
    error:=0;
    Princ.StatusBar1.Panels.Add.Text:='Exportacion iniciada - '+formatdatetime('HH:mm',time);
    Princ.StatusBar1.Panels.Items[Princ.StatusBar1.Panels.Count-1].Width:=200;
    tablasinc_id.LlenarMQuery;
    tablasinc_id.FQChequeados.First;
    if tipo_sincronizacion='EXPORTACION' then
      begin
          Princ.UtilidadesDB1.ConfBaseOrigen:=Princ.ZBase;
          Princ.UtilidadesDB1.ConfBaseDestino:=Princ.BaseRemota;
      end;

    if tipo_sincronizacion='IMPORTACION' then
      begin
          Princ.UtilidadesDB1.ConfBaseOrigen:=Princ.BaseRemota;
          Princ.UtilidadesDB1.ConfBaseDestino:=Princ.ZBase;
      end;


    Princ.UtilidadesDB1.ConfTablasSinc.Clear;
    while not tablasinc_id.FQChequeados.Eof do
        begin
            Princ.UtilidadesDB1.ConfTablasSinc.Add(tablasinc_id.FQChequeados.FieldByName('tablasinc_nombre').AsString);

            tablasinc_id.FQChequeados.Next;
        end;

    Princ.UtilidadesDB1.CalcularTotalRegistros;
    Princ.XiProgressBar1.Max:=Princ.UtilidadesDB1.total_items;
    Princ.TimerBarraProgreso.Enabled:=true;
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
    Princ.StatusBar1.Panels.Add.Text:='Exportacion finalizada - '+formatdatetime('HH:mm',time);
    Princ.StatusBar1.Panels.Items[Princ.StatusBar1.Panels.Count-1].Width:=200;

end;

procedure TSincronizarDB.btnguardarClick(Sender: TObject);
begin
  inherited;
    tablasinc_id.LlenarMQuery;
    tablasinc_id.FQChequeados.First;
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

    ZQExecSQL.parambyname('config_nombre').AsString:=self.tipo_sincronizacion+'hora';
    ZQExecSQL.parambyname('config_valor').AsString:=timetostr(SINCHORA.Time);
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
            //                              SincronizarDB.Show;
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
    tipo_sincronizacion:='EXPORTACION';
    tablasinc_id.Fill;
    ZQSelect.Active:=false;
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

    if ZQConfig.Locate('config_nombre',tipo_sincronizacion+'hora',[]) then
      SINCHORA.Time:=strtotime(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','PCSINCRONIZADORA',[]) then
      PCSINCRONIZADORA.Text:=ZQConfig.FieldByName('config_valor').AsString;

end;

end.
