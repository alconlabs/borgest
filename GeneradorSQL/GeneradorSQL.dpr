program GeneradorSQL;

uses
  Forms,
  UnitPrinc in 'UnitPrinc.pas' {Princ};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinc, Princ);
  Application.Run;
end.
