unit UnitConfiguracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, AdvGlowButton, Grids, DBGrids, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UnitNumEdit, ComCtrls,
  UnitSqlComboBox, AdvEdit, DBAdvEd, Titles, MQuery, CustomizeGrid, AdvEdBtn,
  EditCodi, GTBComboBox;

type
  Tconfiguracion = class(TForm)
    panelgrilla: TAdvPanel;
    btnactualizar: TButton;
    btnimprimir: TButton;
    ZQuery1: TZQuery;
    ZQConfig: TZQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    btnactualizararchivos: TButton;
    LINKARCHIVOS: TEdit;
    btnactualizardb: TButton;
    LINKSCRIPTDB: TEdit;
    lblVERSIONEXE: TLabel;
    VERSIONDB: TLabel;
    Label14: TLabel;
    SUCURSALDEFECTO: TSqlComboBox;
    btnactualizardbfile: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnactualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnactualizararchivosClick(Sender: TObject);
    procedure btnactualizardbClick(Sender: TObject);
    procedure btnactualizardbfileClick(Sender: TObject);
    procedure btnconfigurarmenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  configuracion: Tconfiguracion;

implementation

uses UnitPrinc, UnitMenuConfig;

{$R *.dfm}


procedure Tconfiguracion.btnactualizararchivosClick(Sender: TObject);
var
  version_anterior, menu_version_anterior:string;
  exe_descargado, menu_descargado, sql_descargado:boolean;
  FileHandle: Integer;
  FileSize: DWord;
begin
    version_anterior:=ExtractFilePath(Application.ExeName)+'Acopio '+FormatDateTime('dd-mm-yyyy', now)+'.exe';
    menu_version_anterior:=ExtractFilePath(Application.ExeName)+'menu_acopio '+FormatDateTime('dd-mm-yyyy', now)+'.txt';

    DeleteFile(ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName));
    DeleteFile(ExtractFilePath(Application.ExeName)+'Actualizaciones\menu_acopio.txt');

    menu_descargado:=Princ.DescargarArchivo(LINKARCHIVOS.Text+'/menu_acopio.txt', ExtractFilePath(Application.ExeName)+'Actualizaciones\menu_acopio.txt');
    exe_descargado:=Princ.DescargarArchivo(LINKARCHIVOS.Text+'/Acopio.exe', ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName));

    if  exe_descargado and menu_descargado then
      begin
          FileHandle := FileOpen(ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName), fmOpenRead);
          try
            FileSize := GetFileSize(FileHandle, nil);
          except
          end;

          FileClose(FileHandle);
          if (FileSize/1048576)>5 then
            begin
                RenameFile(Application.ExeName,version_anterior);
                RenameFile(ExtractFilePath(Application.ExeName)+'menu_acopio.txt',menu_version_anterior);

                CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName)),PChar(Application.ExeName),true);
                CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Actualizaciones\menu_acopio.txt'),PChar(ExtractFilePath(Application.ExeName)+'menu_acopio.txt'),true);
                MessageDlg('Archivos actualizados.'+#13+#10+'Debe reiniciar el sistema para ver los cambios.', mtInformation, [mbOK], 0);

            end
          else
            begin
                MessageDlg('Error al descargar los archivos.'+#13+#10+'Intente nuevamente', mtInformation, [mbOK], 0);
            end;

      end
    else
      MessageDlg('No se pudieron descargar los archivos.'+#13+#10+'Verifique su conexion a internet.', mtError, [mbOK], 0);

end;
procedure Tconfiguracion.btnactualizarClick(Sender: TObject);
begin
    ZQuery1.sql.clear;
    ZQuery1.sql.add('Replace config set ');
    ZQuery1.sql.add('config_valor=:config_valor, ');
    ZQuery1.sql.add('config_nombre=:config_nombre');

    ZQuery1.parambyname('config_nombre').AsString:='LINKARCHIVOS';
    ZQuery1.parambyname('config_valor').AsString:=LINKARCHIVOS.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='LINKSCRIPTDB';
    ZQuery1.parambyname('config_valor').AsString:=LINKSCRIPTDB.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='SUCURSALDEFECTO';
    ZQuery1.parambyname('config_valor').AsString:=SUCURSALDEFECTO.codigo;
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);

    Self.Close;



end;

procedure Tconfiguracion.btnactualizardbClick(Sender: TObject);
var
  script_db:string;
begin
    script_db:=ExtractFilePath(Application.ExeName)+'Actualizaciones\updatedb_acopio.sql';
    DeleteFile(script_db);

    if Princ.DescargarArchivo(LINKSCRIPTDB.Text, script_db) then
      begin
         if Princ.EjecutarScriptDB(script_db) then
           MessageDlg('Base de Datos actualizada.'+#13+#10+'Debe reiniciar el sistema para ver los cambios.', mtInformation, [mbOK], 0);
      end
    else
      MessageDlg('No se pudieron descargar los archivos.'+#13+#10+'Verifique su conexion a internet.', mtError, [mbOK], 0);

end;

procedure Tconfiguracion.btnactualizardbfileClick(Sender: TObject);
begin
    Princ.OpenDialog1.Filter:='SQL|*.sql';
    if Princ.OpenDialog1.Execute() then
      begin
          if Princ.EjecutarScriptDB(Princ.OpenDialog1.FileName) then
            MessageDlg('Base de Datos actualizada.'+#13+#10+'Debe reiniciar el sistema para ver los cambios.', mtInformation, [mbOK], 0);
      end;
end;

procedure Tconfiguracion.btnconfigurarmenuClick(Sender: TObject);
begin
    try
      MenuConfig:=TMenuConfig.Create(self);
    finally
      MenuConfig.Show;
    end;
end;

procedure Tconfiguracion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
end;



procedure Tconfiguracion.FormCreate(Sender: TObject);
begin
    PageControl1.ActivePage:=TabSheet1;

    SUCURSALDEFECTO.llenarcombo;

end;

procedure Tconfiguracion.FormShow(Sender: TObject);
begin
    ZQConfig.Active:=false;
    ZQConfig.Active:=true;

    if ZQConfig.Locate('config_nombre','LINKARCHIVOS',[]) then
      LINKARCHIVOS.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','LINKSCRIPTDB',[]) then
      LINKSCRIPTDB.Text:=ZQConfig.FieldByName('config_valor').AsString;

//    if ZQConfig.Locate('config_nombre','VERSIONEXE',[]) then
//      VERSIONEXE.Caption:='Version EXE: '+ZQConfig.FieldByName('config_valor').AsString;

    lblVERSIONEXE.Caption:='Version EXE: '+VERSIONEXE;

    if ZQConfig.Locate('config_nombre','VERSIONDB',[]) then
      VERSIONDB.Caption:='Version DB: '+ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','SUCURSALDEFECTO',[]) then
      SUCURSALDEFECTO.Buscar(ZQConfig.FieldByName('config_valor').AsString);
end;

end.
