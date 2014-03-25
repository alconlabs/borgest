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
    FISCALMODELO: TComboBox;
    FISCALPUERTO: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    VENTASCTDOPARCIALES: TCheckBox;
    VENTASCTACTEPARCIALES: TCheckBox;
    VENTASCTDOVENTANACTACTE: TCheckBox;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    VENTARAPIDAPUNTOVENTAID: TSqlComboBox;
    VENTARAPIDATIPODOCUID: TSqlComboBox;
    Label2: TLabel;
    VENTARAPIDACLIENTEID: TSqlComboBox;
    Label4: TLabel;
    VENTARAPIDAPERSONALID: TSqlComboBox;
    TabSheet4: TTabSheet;
    btnactualizararchivos: TButton;
    LINKARCHIVOS: TEdit;
    btnactualizardb: TButton;
    LINKSCRIPTDB: TEdit;
    lblVERSIONEXE: TLabel;
    VERSIONDB: TLabel;
    Label14: TLabel;
    SUCURSALDEFECTO: TSqlComboBox;
    Label5: TLabel;
    VENTARAPIDASUCURSALID: TSqlComboBox;
    Label6: TLabel;
    PRODUCTOMODIFICARDESCR: TEditCodi;
    producto_nombre: TEdit;
    CODIGOPRODUCTOPORDEFECTO: TGTBComboBox;
    Label7: TLabel;
    btnactualizardbfile: TButton;
    btnconfigurarmenu: TButton;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    NOMBREPRECIO1: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    NOMBREPRECIO2: TEdit;
    NOMBREPRECIO3: TEdit;
    NOMBREPRECIO4: TEdit;
    CLIENTEVEHICULO: TCheckBox;
    LOGDB: TCheckBox;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    CODIGOPRODUCTOBUSQUEDA1: TGTBComboBox;
    CODIGOPRODUCTOBUSQUEDA2: TGTBComboBox;
    CODIGOPRODUCTOBUSQUEDA3: TGTBComboBox;
    TabSheet5: TTabSheet;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    Label18: TLabel;
    BARPUNTOVENTAID: TSqlComboBox;
    BARTIPODOCUID: TSqlComboBox;
    BARCLIENTEID: TSqlComboBox;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    BARFACTURAPUNTOVENTAID: TSqlComboBox;
    BARFACTURATIPODOCUID: TSqlComboBox;
    TabSheet6: TTabSheet;
    Label21: TLabel;
    CAJASALDOINICIALCONCEPTOID: TSqlComboBox;
    PRODUCTOSTOCKINICIAL: TCheckBox;
    VENTASNCNDCONCEPTOS: TCheckBox;
    VENTASEMITIRREMITOCTACTE: TCheckBox;
    VENTASVENDEDORCLIENTEADOCUMENTOS: TCheckBox;
    Label20: TLabel;
    VENTANADETALLEVENTATIPO: TGTBComboBox;
    GroupBox6: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    FACTURAVENTAPUNTOVENTAID: TSqlComboBox;
    FACTURAVENTATIPODOCUID: TSqlComboBox;
    FACTURAVENTACLIENTEID: TSqlComboBox;
    FACTURAVENTAPERSONALID: TSqlComboBox;
    FACTURAVENTASUCURSALID: TSqlComboBox;
    Label26: TLabel;
    USUARIOPORDEFECTO: TSqlComboBox;
    Label27: TLabel;
    CARPETAREPORTES: TEdit;
    Label28: TLabel;
    TIPOBUSQUEDA: TGTBComboBox;
    MOSTRAREQUIPO: TCheckBox;
    Label29: TLabel;
    USUARIOPROTECTOR: TSqlComboBox;
    Label30: TLabel;
    TabSheet7: TTabSheet;
    GroupBox7: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBREMOTASERVIDOR: TEdit;
    DBREMOTADB: TEdit;
    DBREMOTAUSUARIO: TEdit;
    DBREMOTAPASS: TEdit;
    PCSERVIDOR: TLabel;
    btnactualizardbremotafile: TButton;
    SOLICITARPASSVENDEDORVENTAS: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnactualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VENTARAPIDAPUNTOVENTAIDSelect(Sender: TObject);
    procedure btnactualizararchivosClick(Sender: TObject);
    procedure btnactualizardbClick(Sender: TObject);
    procedure VENTARAPIDACLIENTEIDSelect(Sender: TObject);
    procedure VENTARAPIDASUCURSALIDSelect(Sender: TObject);
    procedure btnactualizardbfileClick(Sender: TObject);
    procedure btnconfigurarmenuClick(Sender: TObject);
    procedure BARPUNTOVENTAIDSelect(Sender: TObject);
    procedure BARFACTURAPUNTOVENTAIDSelect(Sender: TObject);
    procedure FACTURAVENTASUCURSALIDSelect(Sender: TObject);
    procedure FACTURAVENTAPUNTOVENTAIDSelect(Sender: TObject);
    procedure FACTURAVENTACLIENTEIDSelect(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnactualizardbremotafileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  configuracion: Tconfiguracion;

implementation

uses UnitPrinc, Unitventadetalle, UnitMenuConfig;

{$R *.dfm}


procedure Tconfiguracion.BARFACTURAPUNTOVENTAIDSelect(Sender: TObject);
begin
    BARFACTURATIPODOCUID.Confsql.Text:='select *, concat(tipodocu_nombre," - ",tipodocu_letra) as nombre from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+BARFACTURAPUNTOVENTAID.Codigo+'" and tipodocu_nombre="Factura de Venta" '+
                              'order by nombre';

    BARFACTURATIPODOCUID.llenarcombo;

    try
      BARFACTURATIPODOCUID.ItemIndex:=0;
    except
      BARFACTURATIPODOCUID.ItemIndex:=-1;
    end;
end;

procedure Tconfiguracion.BARPUNTOVENTAIDSelect(Sender: TObject);
begin
    BARTIPODOCUID.Confsql.Text:='select *, concat(tipodocu_nombre," - ",tipodocu_letra) as nombre from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+BARPUNTOVENTAID.Codigo+'" and tipodocu_tipo="VENTA" '+
                              'order by nombre';

    BARTIPODOCUID.llenarcombo;

    try
      BARTIPODOCUID.ItemIndex:=0;
    except
      BARTIPODOCUID.ItemIndex:=-1;
    end;
end;

procedure Tconfiguracion.btnactualizararchivosClick(Sender: TObject);
var
  version_anterior, menu_version_anterior:string;
  exe_descargado, menu_descargado, sql_descargado:boolean;
  FileHandle: Integer;
  FileSize: DWord;
begin
    version_anterior:=ExtractFilePath(Application.ExeName)+'Borgest '+FormatDateTime('dd-mm-yyyy', now)+'.exe';
    menu_version_anterior:=ExtractFilePath(Application.ExeName)+'menu '+FormatDateTime('dd-mm-yyyy', now)+'.txt';

    DeleteFile(ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName));
    DeleteFile(ExtractFilePath(Application.ExeName)+'Actualizaciones\menu.txt');

    menu_descargado:=Princ.DescargarArchivo(LINKARCHIVOS.Text+'/menu.txt', ExtractFilePath(Application.ExeName)+'Actualizaciones\menu.txt');
    exe_descargado:=Princ.DescargarArchivo(LINKARCHIVOS.Text+'/Borgest.exe', ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName));

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
                RenameFile(ExtractFilePath(Application.ExeName)+'menu.txt',menu_version_anterior);

                CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Actualizaciones\'+ExtractFileName(Application.ExeName)),PChar(Application.ExeName),true);
                CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Actualizaciones\menu.txt'),PChar(ExtractFilePath(Application.ExeName)+'menu.txt'),true);
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
    ZQuery1.parambyname('config_nombre').AsString:='FISCALMODELO';
    ZQuery1.parambyname('config_valor').AsInteger:=FISCALMODELO.ItemIndex+1;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='FISCALPUERTO';
    ZQuery1.parambyname('config_valor').AsInteger:=FISCALPUERTO.ItemIndex+1;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTASCTDOPARCIALES';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(VENTASCTDOPARCIALES.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTASCTACTEPARCIALES';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(VENTASCTACTEPARCIALES.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTASCTDOVENTANACTACTE';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(VENTASCTDOVENTANACTACTE.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTARAPIDAPUNTOVENTAID';
    ZQuery1.parambyname('config_valor').AsString:=VENTARAPIDAPUNTOVENTAID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTARAPIDATIPODOCUID';
    ZQuery1.parambyname('config_valor').AsString:=VENTARAPIDATIPODOCUID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTARAPIDACLIENTEID';
    ZQuery1.parambyname('config_valor').AsString:=VENTARAPIDACLIENTEID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTARAPIDAPERSONALID';
    ZQuery1.parambyname('config_valor').AsString:=VENTARAPIDAPERSONALID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='LINKARCHIVOS';
    ZQuery1.parambyname('config_valor').AsString:=LINKARCHIVOS.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='LINKSCRIPTDB';
    ZQuery1.parambyname('config_valor').AsString:=LINKSCRIPTDB.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='SUCURSALDEFECTO';
    ZQuery1.parambyname('config_valor').AsString:=SUCURSALDEFECTO.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTARAPIDASUCURSALID';
    ZQuery1.parambyname('config_valor').AsString:=VENTARAPIDASUCURSALID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='PRODUCTOMODIFICARDESCR';
    ZQuery1.parambyname('config_valor').AsString:=PRODUCTOMODIFICARDESCR.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CODIGOPRODUCTOPORDEFECTO';
    ZQuery1.parambyname('config_valor').AsString:=CODIGOPRODUCTOPORDEFECTO.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='NOMBREPRECIO1';
    ZQuery1.parambyname('config_valor').AsString:=NOMBREPRECIO1.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='NOMBREPRECIO2';
    ZQuery1.parambyname('config_valor').AsString:=NOMBREPRECIO2.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='NOMBREPRECIO3';
    ZQuery1.parambyname('config_valor').AsString:=NOMBREPRECIO3.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='NOMBREPRECIO4';
    ZQuery1.parambyname('config_valor').AsString:=NOMBREPRECIO4.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CLIENTEVEHICULO';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(CLIENTEVEHICULO.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='LOGDB';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(LOGDB.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CODIGOPRODUCTOBUSQUEDA1';
    ZQuery1.parambyname('config_valor').AsString:=CODIGOPRODUCTOBUSQUEDA1.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CODIGOPRODUCTOBUSQUEDA2';
    ZQuery1.parambyname('config_valor').AsString:=CODIGOPRODUCTOBUSQUEDA2.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CODIGOPRODUCTOBUSQUEDA3';
    ZQuery1.parambyname('config_valor').AsString:=CODIGOPRODUCTOBUSQUEDA3.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='BARPUNTOVENTAID';
    ZQuery1.parambyname('config_valor').AsString:=BARPUNTOVENTAID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='BARTIPODOCUID';
    ZQuery1.parambyname('config_valor').AsString:=BARTIPODOCUID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='BARCLIENTEID';
    ZQuery1.parambyname('config_valor').AsString:=BARCLIENTEID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='BARFACTURAPUNTOVENTAID';
    ZQuery1.parambyname('config_valor').AsString:=BARFACTURAPUNTOVENTAID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='BARFACTURATIPODOCUID';
    ZQuery1.parambyname('config_valor').AsString:=BARFACTURATIPODOCUID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CAJASALDOINICIALCONCEPTOID';
    ZQuery1.parambyname('config_valor').AsString:=CAJASALDOINICIALCONCEPTOID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='PRODUCTOSTOCKINICIAL';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(PRODUCTOSTOCKINICIAL.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTASNCNDCONCEPTOS';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(VENTASNCNDCONCEPTOS.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTASEMITIRREMITOCTACTE';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(VENTASEMITIRREMITOCTACTE.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTASVENDEDORCLIENTEADOCUMENTOS';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(VENTASVENDEDORCLIENTEADOCUMENTOS.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='VENTANADETALLEVENTATIPO';
    ZQuery1.parambyname('config_valor').AsString:=VENTANADETALLEVENTATIPO.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='FACTURAVENTAPUNTOVENTAID';
    ZQuery1.parambyname('config_valor').AsString:=FACTURAVENTAPUNTOVENTAID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='FACTURAVENTATIPODOCUID';
    ZQuery1.parambyname('config_valor').AsString:=FACTURAVENTATIPODOCUID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='FACTURAVENTACLIENTEID';
    ZQuery1.parambyname('config_valor').AsString:=FACTURAVENTACLIENTEID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='FACTURAVENTAPERSONALID';
    ZQuery1.parambyname('config_valor').AsString:=FACTURAVENTAPERSONALID.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='USUARIOPORDEFECTO';
    ZQuery1.parambyname('config_valor').AsString:=USUARIOPORDEFECTO.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='CARPETAREPORTES';
    ZQuery1.parambyname('config_valor').AsString:=CARPETAREPORTES.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='TIPOBUSQUEDA';
    ZQuery1.parambyname('config_valor').AsString:=TIPOBUSQUEDA.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='MOSTRAREQUIPO';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(MOSTRAREQUIPO.Checked);
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='USUARIOPROTECTOR';
    ZQuery1.parambyname('config_valor').AsString:=USUARIOPROTECTOR.codigo;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='DBREMOTASERVIDOR';
    ZQuery1.parambyname('config_valor').AsString:=DBREMOTASERVIDOR.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='DBREMOTADB';
    ZQuery1.parambyname('config_valor').AsString:=DBREMOTADB.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='DBREMOTAUSUARIO';
    ZQuery1.parambyname('config_valor').AsString:=DBREMOTAUSUARIO.Text;
    ZQuery1.ExecSQL;

    ZQuery1.parambyname('config_nombre').AsString:='DBREMOTAPASS';
    Princ.Encriptador1.AEncriptar:=DBREMOTAPASS.Text;
    Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
    Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
    Princ.Encriptador1.Encriptar;
    ZQuery1.parambyname('config_valor').AsString:=Princ.Encriptador1.Encriptado;
    ZQuery1.ExecSQL;


    ZQuery1.parambyname('config_nombre').AsString:='SOLICITARPASSVENDEDORVENTAS';
    ZQuery1.parambyname('config_valor').AsString:=booltostr(SOLICITARPASSVENDEDORVENTAS.Checked);
    ZQuery1.ExecSQL;

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK], 0);

    Self.Close;



end;

procedure Tconfiguracion.btnactualizardbClick(Sender: TObject);
var
  script_db:string;
begin
    script_db:=ExtractFilePath(Application.ExeName)+'Actualizaciones\updatedb.sql';
    DeleteFile(script_db);

    if Princ.DescargarArchivo(LINKSCRIPTDB.Text, script_db) then
      begin
         if Princ.EjecutarScriptDB(script_db,princ.ZBase) then
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
          if Princ.EjecutarScriptDB(Princ.OpenDialog1.FileName,princ.ZBase) then
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

procedure Tconfiguracion.btnactualizardbremotafileClick(Sender: TObject);
begin
    Princ.OpenDialog1.Filter:='SQL|*.sql';
    if Princ.OpenDialog1.Execute() then
      begin
          if Princ.EjecutarScriptDB(Princ.OpenDialog1.FileName,princ.BaseRemota) then
            MessageDlg('Base de Datos actualizada.'+#13+#10+'Debe reiniciar el sistema para ver los cambios.', mtInformation, [mbOK], 0);
      end;
end;

procedure Tconfiguracion.FACTURAVENTACLIENTEIDSelect(Sender: TObject);
begin
    if Princ.buscar('select condicioniva_id from clientes where cliente_id="'+FACTURAVENTACLIENTEID.codigo+'"','condicioniva_id')='2' then
      FACTURAVENTATIPODOCUID.Buscar('A',true)
    else
      FACTURAVENTATIPODOCUID.Buscar('B',true);
end;

procedure Tconfiguracion.FACTURAVENTAPUNTOVENTAIDSelect(Sender: TObject);
begin
    FACTURAVENTATIPODOCUID.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+FACTURAVENTAPUNTOVENTAID.Codigo+'" and tipodocu_nombre="Factura de Venta" '+
                              'order by tipodocu_letra';

    FACTURAVENTATIPODOCUID.llenarcombo;

    try
      FACTURAVENTATIPODOCUID.ItemIndex:=0;
    except
      FACTURAVENTATIPODOCUID.ItemIndex:=-1;
    end;
end;

procedure Tconfiguracion.FACTURAVENTASUCURSALIDSelect(Sender: TObject);
begin
    FACTURAVENTAPUNTOVENTAID.Confsql.Text:='select * from puntodeventa where sucursal_id="'+FACTURAVENTASUCURSALID.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';
    FACTURAVENTAPUNTOVENTAID.llenarcombo;
    try
       FACTURAVENTAPUNTOVENTAID.ItemIndex:=0;
     except
       FACTURAVENTAPUNTOVENTAID.ItemIndex:=-1;
     end;

    FACTURAVENTAPUNTOVENTAID.OnSelect(self);
end;

procedure Tconfiguracion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Self.Free;
    Application.BringToFront;
end;



procedure Tconfiguracion.FormCreate(Sender: TObject);
begin
    PageControl1.ActivePage:=TabSheet1;
    VENTARAPIDASUCURSALID.llenarcombo;
    VENTARAPIDASUCURSALID.Buscar(Princ.sucursal_actual);

    VENTARAPIDAPUNTOVENTAID.Confsql.Text:='select * from puntodeventa where sucursal_id="'+VENTARAPIDASUCURSALID.codigo+'" order by puntoventa_numero';

    VENTARAPIDAPUNTOVENTAID.llenarcombo;
    VENTARAPIDAPUNTOVENTAID.ItemIndex:=0;

    VENTARAPIDATIPODOCUID.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+VENTARAPIDAPUNTOVENTAID.Codigo+'" and tipodocu_nombre="Factura de Venta"'+
                              'order by tipodocu_letra';

    VENTARAPIDATIPODOCUID.llenarcombo;
    try
      VENTARAPIDATIPODOCUID.ItemIndex:=0;
    except
      VENTARAPIDATIPODOCUID.ItemIndex:=-1;
    end;

    VENTARAPIDACLIENTEID.llenarcombo;
    VENTARAPIDACLIENTEID.ItemIndex:=-1;

    VENTARAPIDAPERSONALID.llenarcombo;
    VENTARAPIDAPERSONALID.ItemIndex:=-1;

    SUCURSALDEFECTO.llenarcombo;

    BARPUNTOVENTAID.llenarcombo;
    BARPUNTOVENTAID.ItemIndex:=0;

    BARTIPODOCUID.llenarcombo;
    BARTIPODOCUID.ItemIndex:=0;

    BARCLIENTEID.llenarcombo;
    BARCLIENTEID.ItemIndex:=0;

    BARFACTURAPUNTOVENTAID.llenarcombo;
    BARFACTURAPUNTOVENTAID.ItemIndex:=0;

    BARFACTURATIPODOCUID.llenarcombo;
    BARFACTURATIPODOCUID.ItemIndex:=0;

    CAJASALDOINICIALCONCEPTOID.llenarcombo;
    CAJASALDOINICIALCONCEPTOID.ItemIndex:=0;


    FACTURAVENTASUCURSALID.llenarcombo;
    FACTURAVENTASUCURSALID.Buscar(Princ.sucursal_actual);

    FACTURAVENTAPUNTOVENTAID.Confsql.Text:='select * from puntodeventa where sucursal_id="'+FACTURAVENTASUCURSALID.codigo+'" order by puntoventa_numero';

    FACTURAVENTAPUNTOVENTAID.llenarcombo;
    FACTURAVENTAPUNTOVENTAID.ItemIndex:=0;

    FACTURAVENTATIPODOCUID.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+FACTURAVENTAPUNTOVENTAID.Codigo+'" and tipodocu_nombre="Factura de Venta"'+
                              'order by tipodocu_letra';

    FACTURAVENTATIPODOCUID.llenarcombo;
    try
      FACTURAVENTATIPODOCUID.ItemIndex:=0;
    except
      FACTURAVENTATIPODOCUID.ItemIndex:=-1;
    end;

    FACTURAVENTACLIENTEID.llenarcombo;
    FACTURAVENTACLIENTEID.ItemIndex:=-1;

    FACTURAVENTAPERSONALID.llenarcombo;
    FACTURAVENTAPERSONALID.ItemIndex:=-1;

    USUARIOPORDEFECTO.llenarcombo;
    USUARIOPORDEFECTO.ItemIndex:=-1;

    USUARIOPROTECTOR.llenarcombo;
    USUARIOPROTECTOR.agregaritem('NINGUNO','0');
    USUARIOPROTECTOR.Buscar('0');

end;

procedure Tconfiguracion.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Princ.OnKeyDown(sender, Key, Shift);
end;

procedure Tconfiguracion.FormShow(Sender: TObject);
begin
    ZQConfig.Active:=false;
    ZQConfig.Active:=true;

    if ZQConfig.Locate('config_nombre','FISCALMODELO',[]) then
      FISCALMODELO.ItemIndex:=ZQConfig.FieldByName('config_valor').AsInteger-1;

    if ZQConfig.Locate('config_nombre','FISCALPUERTO',[]) then
      FISCALPUERTO.ItemIndex:=ZQConfig.FieldByName('config_valor').AsInteger-1;

    if ZQConfig.Locate('config_nombre','VENTASCTDOPARCIALES',[]) then
      VENTASCTDOPARCIALES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTASCTACTEPARCIALES',[]) then
      VENTASCTACTEPARCIALES.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTASCTDOVENTANACTACTE',[]) then
      VENTASCTDOVENTANACTACTE.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTARAPIDASUCURSALID',[]) then
      VENTARAPIDASUCURSALID.Buscar(ZQConfig.FieldByName('config_valor').AsString);
    VENTARAPIDASUCURSALID.OnSelect(self);

    if ZQConfig.Locate('config_nombre','VENTARAPIDAPUNTOVENTAID',[]) then
      VENTARAPIDAPUNTOVENTAID.Buscar(ZQConfig.FieldByName('config_valor').AsString);
    VENTARAPIDAPUNTOVENTAID.OnSelect(self);

    if ZQConfig.Locate('config_nombre','VENTARAPIDATIPODOCUID',[]) then
      VENTARAPIDATIPODOCUID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTARAPIDACLIENTEID',[]) then
      VENTARAPIDACLIENTEID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTARAPIDAPERSONALID',[]) then
      VENTARAPIDAPERSONALID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

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

    if ZQConfig.Locate('config_nombre','PRODUCTOMODIFICARDESCR',[]) then
      PRODUCTOMODIFICARDESCR.Search(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','CODIGOPRODUCTOPORDEFECTO',[]) then
      CODIGOPRODUCTOPORDEFECTO.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','NOMBREPRECIO1',[]) then
      NOMBREPRECIO1.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','NOMBREPRECIO2',[]) then
      NOMBREPRECIO2.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','NOMBREPRECIO3',[]) then
      NOMBREPRECIO3.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','NOMBREPRECIO4',[]) then
      NOMBREPRECIO4.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','CLIENTEVEHICULO',[]) then
      CLIENTEVEHICULO.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','LOGDB',[]) then
      LOGDB.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','CODIGOPRODUCTOBUSQUEDA1',[]) then
      CODIGOPRODUCTOBUSQUEDA1.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','CODIGOPRODUCTOBUSQUEDA2',[]) then
      CODIGOPRODUCTOBUSQUEDA2.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','CODIGOPRODUCTOBUSQUEDA3',[]) then
      CODIGOPRODUCTOBUSQUEDA3.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','BARPUNTOVENTAID',[]) then
      BARPUNTOVENTAID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','BARTIPODOCUID',[]) then
      BARTIPODOCUID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','BARCLIENTEID',[]) then
      BARCLIENTEID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','BARFACTURAPUNTOVENTAID',[]) then
      BARFACTURAPUNTOVENTAID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','BARFACTURATIPODOCUID',[]) then
      BARFACTURATIPODOCUID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','CAJASALDOINICIALCONCEPTOID',[]) then
      CAJASALDOINICIALCONCEPTOID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','PRODUCTOSTOCKINICIAL',[]) then
      PRODUCTOSTOCKINICIAL.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTASNCNDCONCEPTOS',[]) then
      VENTASNCNDCONCEPTOS.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTASEMITIRREMITOCTACTE',[]) then
      VENTASEMITIRREMITOCTACTE.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTASVENDEDORCLIENTEADOCUMENTOS',[]) then
      VENTASVENDEDORCLIENTEADOCUMENTOS.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','VENTANADETALLEVENTATIPO',[]) then
      VENTANADETALLEVENTATIPO.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','FACTURAVENTASUCURSALID',[]) then
      FACTURAVENTASUCURSALID.Buscar(ZQConfig.FieldByName('config_valor').AsString);
    FACTURAVENTASUCURSALID.OnSelect(self);

    if ZQConfig.Locate('config_nombre','FACTURAVENTAPUNTOVENTAID',[]) then
      FACTURAVENTAPUNTOVENTAID.Buscar(ZQConfig.FieldByName('config_valor').AsString);
    FACTURAVENTAPUNTOVENTAID.OnSelect(self);

    if ZQConfig.Locate('config_nombre','FACTURAVENTATIPODOCUID',[]) then
      FACTURAVENTATIPODOCUID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','FACTURAVENTACLIENTEID',[]) then
      FACTURAVENTACLIENTEID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','FACTURAVENTAPERSONALID',[]) then
      FACTURAVENTAPERSONALID.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','USUARIOPORDEFECTO',[]) then
      USUARIOPORDEFECTO.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','CARPETAREPORTES',[]) then
      CARPETAREPORTES.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','TIPOBUSQUEDA',[]) then
      TIPOBUSQUEDA.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','MOSTRAREQUIPO',[]) then
      MOSTRAREQUIPO.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','USUARIOPROTECTOR',[]) then
      USUARIOPROTECTOR.Buscar(ZQConfig.FieldByName('config_valor').AsString);

    if ZQConfig.Locate('config_nombre','DBREMOTASERVIDOR',[]) then
      DBREMOTASERVIDOR.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','DBREMOTADB',[]) then
      DBREMOTADB.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','DBREMOTAUSUARIO',[]) then
      DBREMOTAUSUARIO.Text:=ZQConfig.FieldByName('config_valor').AsString;

    if ZQConfig.Locate('config_nombre','DBREMOTAPASS',[]) then
      begin
          Princ.Encriptador1.ADesencriptar:=ZQConfig.FieldByName('config_valor').AsString;
          Princ.Encriptador1.MetodoEncriptado:=strtoint(Princ.ini1.ReadiniString('Config','Tipo','0'));
          Princ.Encriptador1.Key:=CLAVE_ENCRIPTADO;
          Princ.Encriptador1.Desencriptar;
          DBREMOTAPASS.Text:=Princ.Encriptador1.Desencriptado;
      end;

    PCSERVIDOR.Caption:='Servidor Base de Datos: '+Princ.ZBase.HostName;

    if ZQConfig.Locate('config_nombre','SOLICITARPASSVENDEDORVENTAS',[]) then
      SOLICITARPASSVENDEDORVENTAS.Checked:=strtobool(ZQConfig.FieldByName('config_valor').AsString);

    princ.Permisos1.guardarlog(self.ClassName+'.Show');
end;

procedure Tconfiguracion.VENTARAPIDACLIENTEIDSelect(Sender: TObject);
begin
    if Princ.buscar('select condicioniva_id from clientes where cliente_id="'+VENTARAPIDACLIENTEID.codigo+'"','condicioniva_id')='2' then
      VENTARAPIDATIPODOCUID.Buscar('A',true)
    else
      VENTARAPIDATIPODOCUID.Buscar('B',true);
end;

procedure Tconfiguracion.VENTARAPIDAPUNTOVENTAIDSelect(Sender: TObject);
begin
    VENTARAPIDATIPODOCUID.Confsql.Text:='select * from tiposdocumento '+
                              'where tiposdocumento.puntoventa_id="'+VENTARAPIDAPUNTOVENTAID.Codigo+'" and tipodocu_nombre="Factura de Venta" '+
                              'order by tipodocu_letra';

    VENTARAPIDATIPODOCUID.llenarcombo;

    try
      VENTARAPIDATIPODOCUID.ItemIndex:=0;
    except
      VENTARAPIDATIPODOCUID.ItemIndex:=-1;
    end;
end;

procedure Tconfiguracion.VENTARAPIDASUCURSALIDSelect(Sender: TObject);
begin
    VENTARAPIDAPUNTOVENTAID.Confsql.Text:='select * from puntodeventa where sucursal_id="'+VENTARAPIDASUCURSALID.codigo+'" '+Princ.empresa_where+' order by puntoventa_numero';
    VENTARAPIDAPUNTOVENTAID.llenarcombo;
    try
       VENTARAPIDAPUNTOVENTAID.ItemIndex:=0;
     except
       VENTARAPIDAPUNTOVENTAID.ItemIndex:=-1;
     end;

    VENTARAPIDAPUNTOVENTAID.OnSelect(self);
end;

end.
