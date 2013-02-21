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
begin
    version_anterior:=ExtractFilePath(Application.ExeName)+'Borgest '+FormatDateTime('dd-mm-yyyy', now)+'.exe';
    menu_version_anterior:=ExtractFilePath(Application.ExeName)+'menu '+FormatDateTime('dd-mm-yyyy', now)+'.txt';

    DeleteFile(ExtractFilePath(Application.ExeName)+'Actualizaciones\Borgest.exe');
    DeleteFile(ExtractFilePath(Application.ExeName)+'Actualizaciones\menu.txt');

    menu_descargado:=Princ.DescargarArchivo(LINKARCHIVOS.Text+'/menu.txt', ExtractFilePath(Application.ExeName)+'Actualizaciones\menu.txt');
    exe_descargado:=Princ.DescargarArchivo(LINKARCHIVOS.Text+'/Borgest.exe', ExtractFilePath(Application.ExeName)+'Actualizaciones\Borgest.exe');

    if  exe_descargado and menu_descargado then
      begin
          RenameFile(Application.ExeName,version_anterior);
          RenameFile(ExtractFilePath(Application.ExeName)+'menu.txt',menu_version_anterior);

          CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Actualizaciones\Borgest.exe'),PChar(ExtractFilePath(Application.ExeName)+'Borgest.exe'),true);
          CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Actualizaciones\menu.txt'),PChar(ExtractFilePath(Application.ExeName)+'menu.txt'),true);
          MessageDlg('Archivos actualizados.'+#13+#10+'Debe reiniciar el sistema para ver los cambios.', mtInformation, [mbOK], 0);

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

    MessageDlg('Datos guardados correctamente.', mtConfirmation, [mbOK, mbCancel], 0);

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
