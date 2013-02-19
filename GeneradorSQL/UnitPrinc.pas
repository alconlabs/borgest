unit UnitPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZConnection, StdCtrls, ini, UnitSqlComboBox, Titles, ComCtrls,
  AdvListV, UnitSqlListView, Encriptador;

type
  TPrinc = class(TForm)
    ZBase: TZConnection;
    ini1: Tini;
    GroupBox1: TGroupBox;
    host: TEdit;
    Label1: TLabel;
    databasename: TEdit;
    Label2: TLabel;
    user: TEdit;
    Label3: TLabel;
    pass: TEdit;
    Label4: TLabel;
    Button1: TButton;
    tabla: TSqlComboBox;
    campos: TSqlListView;
    Titles1: TTitles;
    campo_id: TSqlListView;
    Queryname: TEdit;
    btninsert: TButton;
    btnupdate: TButton;
    btndelete: TButton;
    btnreplace: TButton;
    script: TMemo;
    btngenerar: TButton;
    Encriptador1: TEncriptador;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Label5: TLabel;
    btnencriptar: TButton;
    Edit2: TEdit;
    Label6: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure tablaSelect(Sender: TObject);
    procedure btninsertClick(Sender: TObject);
    procedure btngenerarClick(Sender: TObject);
    procedure btnupdateClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnencriptarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    abm:integer;
  public
    { Public declarations }
  end;

var
  Princ: TPrinc;

implementation

{$R *.dfm}

procedure TPrinc.btndeleteClick(Sender: TObject);
var
  finaldelinea:string;
  linea:string;
begin
    script.Lines.Clear;
    script.Lines.Add('delete from '+tabla.Text+' ');
    campo_id.LlenarMQuery;
    linea:='where ';
    while not campo_id.FQChequeados.Eof do
        begin
            linea:=linea+campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString+'=:'+campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString;
            campo_id.FQChequeados.Next;

            finaldelinea:=' and ';
            if campo_id.FQChequeados.Eof then
              finaldelinea:=' ';

            script.Lines.Add(linea+finaldelinea);

            linea:='';
        end;

    abm:=3;
end;

procedure TPrinc.btnencriptarClick(Sender: TObject);
begin
    Encriptador1.AEncriptar:=Edit1.Text;
    Encriptador1.Encriptar;
    Edit2.Text:=Encriptador1.Encriptado;
end;

procedure TPrinc.btngenerarClick(Sender: TObject);
var
  i:integer;
begin
    script.Lines.Insert(0,Queryname.Text+'.Sql.Clear;');
    for i := 1 to script.Lines.Count-1 do
      begin
          script.Lines[i]:=Queryname.Text+'.Sql.Add('+QuotedStr(script.Lines[i])+');';
      end;

    if abm<>3 then
      begin
          campos.FQChequeados.First;
          while not campos.FQChequeados.Eof do
              begin
                  script.Lines.Add(Queryname.Text+'.ParamByName('+QuotedStr(campos.FQChequeados.FieldByName(Titles1.cam_text).AsString)+').AsString:='+campos.FQChequeados.FieldByName(Titles1.cam_text).AsString+'.Text;');


                  campos.FQChequeados.Next;
              end;
          if abm=2 then
            begin
                campo_id.FQChequeados.First;
                while not campo_id.FQChequeados.Eof do
                    begin
                        script.Lines.Add(Queryname.Text+'.ParamByName('+QuotedStr(campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString)+').AsString:='+campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString+'.Text;');

                        campo_id.FQChequeados.Next;
                    end;
            end;
      end;

    if abm=3 then
      begin
          campo_id.FQChequeados.First;
          while not campo_id.FQChequeados.Eof do
              begin
                  script.Lines.Add(Queryname.Text+'.ParamByName('+QuotedStr(campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString)+').AsString:='+campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString+'.Text;');

                  campo_id.FQChequeados.Next;
              end;
      end;

    script.Lines.Add(Queryname.Text+'.ExecSql;');

    script.SelectAll;
    script.SetFocus;
end;

procedure TPrinc.btninsertClick(Sender: TObject);
var
  finaldelinea:string;
  linea:string;
begin
    script.Lines.Clear;
    script.Lines.Add('insert into '+tabla.Text+' set ');
    campos.LlenarMQuery;
    finaldelinea:=', ';
    while not campos.FQChequeados.Eof do
        begin
            linea:=campos.FQChequeados.FieldByName(Titles1.cam_text).AsString+'=:'+campos.FQChequeados.FieldByName(Titles1.cam_text).AsString;
            campos.FQChequeados.Next;

            finaldelinea:=', ';
            if campos.FQChequeados.Eof then
              finaldelinea:=' ';

            script.Lines.Add(linea+finaldelinea);
        end;

    abm:=1;
end;

procedure TPrinc.btnupdateClick(Sender: TObject);
var
  finaldelinea:string;
  linea:string;
begin
    script.Lines.Clear;
    script.Lines.Add('update '+tabla.Text+' set ');
    campos.LlenarMQuery;
    campo_id.LlenarMQuery;
    finaldelinea:=', ';
    while not campos.FQChequeados.Eof do
        begin
            linea:=campos.FQChequeados.FieldByName(Titles1.cam_text).AsString+'=:'+campos.FQChequeados.FieldByName(Titles1.cam_text).AsString;
            campos.FQChequeados.Next;

            finaldelinea:=', ';
            if campos.FQChequeados.Eof then
              finaldelinea:=' ';

            script.Lines.Add(linea+finaldelinea);
        end;

    linea:='where ';
    while not campo_id.FQChequeados.Eof do
        begin
            linea:=linea+campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString+'=:'+campo_id.FQChequeados.FieldByName(Titles1.cam_text).AsString;
            campo_id.FQChequeados.Next;

            finaldelinea:=' and ';
            if campo_id.FQChequeados.Eof then
              finaldelinea:=' ';

            script.Lines.Add(linea+finaldelinea);

            linea:='';
        end;

    abm:=2;
end;
procedure TPrinc.Button1Click(Sender: TObject);
begin
    ZBase.Disconnect;
    ZBase.HostName:=host.Text;
    ZBase.Database:=databasename.Text;
    ZBase.User:=user.Text;
    ZBase.Password:=pass.Text;
    if pass.Text<>'' then
      begin
          Encriptador1.AEncriptar:=pass.Text;
          Encriptador1.Encriptar;
      end;

    try
      ZBase.Connect;

      ini1.WriteiniString('Connection','HostName',host.Text);
      ini1.WriteiniString('Connection','Database',databasename.Text);
      ini1.WriteiniString('Connection','User',user.Text);
      if pass.Text<>'' then
        ini1.WriteiniString('Connection','Password',Encriptador1.Encriptado)
      else
        ini1.WriteiniString('Connection','Password',pass.Text);


    finally

    end;


    tabla.Confcampo_codigo:='tables_in_'+databasename.Text;
    tabla.Confcampo_nomb:='tables_in_'+databasename.Text;

    tabla.llenarcombo;
    tabla.ItemIndex:=0;
end;

procedure TPrinc.Button2Click(Sender: TObject);
begin
    Encriptador1.ADesencriptar:=Edit2.Text;
    Encriptador1.Desencriptar;
    Edit1.Text:=Encriptador1.Desencriptado;
end;

procedure TPrinc.FormCreate(Sender: TObject);
var
  tipo_encriptacion:string;
  password:string;
begin
    ini1.IniFilename:=ExtractFilePath(Application.ExeName)+'Config.ini';

    databasename.Text:=ini1.ReadiniString('Connection','Database','base');
    host.Text:=ini1.ReadiniString('Connection','HostName','localhost');
    user.Text:=ini1.ReadiniString('Connection','User','root');
    password:=ini1.ReadiniString('Connection','Password','root');
    tipo_encriptacion:=ini1.ReadiniString('Config','Tipo','');
    if password<>'' then
      begin
          if tipo_encriptacion='1' then
            begin
                Encriptador1.ADesencriptar:=password;
                Encriptador1.Desencriptar;
                password:=Encriptador1.Desencriptado;
            end
          else
            begin
                ini1.WriteiniString('Config','Tipo','1');
                Encriptador1.AEncriptar:=password;
                Encriptador1.Encriptar;
                ini1.WriteiniString('Connection','Password',Encriptador1.Encriptado);
            end;

      end;
    pass.Text:=password;

end;

procedure TPrinc.tablaSelect(Sender: TObject);
begin
    Titles1.Memo.Text:='select ORDINAL_POSITION as id, Column_name as campo from INFORMATION_SCHEMA.COLUMNS '+
                       'WHERE table_name = "'+tabla.Text+'" and TABLE_SCHEMA = "'+databasename.Text+'"';
    campos.Fill;
    campo_id.Fill;

end;

end.
