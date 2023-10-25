program ProjectTesteWS;

uses
  Vcl.Forms,
  TesteWS in 'TesteWS.pas' {frmTesteWS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTesteWS, frmTesteWS);
  Application.Run;
end.
