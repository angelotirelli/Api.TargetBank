program Api.TargetBank;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  MVCFramework,
  MVCFramework.Logger,
  MVCFramework.Commons,
  MVCFramework.Signal,
  Web.ReqMulti,
  Web.WebReq,
  Web.WebBroker,
  IdContext,
  IdHTTPWebBrokerBridge,
  uDataModuleRex in 'uDataModuleRex.pas',
  FreteService in 'FreteService.pas',
  ErrorExceptions.WebApi.TargetBank.Interfaces in 'Interfaces\ErrorExceptions.WebApi.TargetBank.Interfaces.pas',
  ErrorExceptions.WebApi.TargetBank.Model in 'Model\ErrorExceptions.WebApi.TargetBank.Model.pas',
  Cadastro.Entidade.WebApi.TargetBank.Model in 'Model\Cadastro.Entidade.WebApi.TargetBank.Model.pas',
  WebService.Client.TargetBank in 'Services\WebService.Client.TargetBank.pas',
  Main.WebApi.TargetBank.Controller in 'Controller\Main.WebApi.TargetBank.Controller.pas',
  Main.WebApi.TargetBank.Services in 'Services\Main.WebApi.TargetBank.Services.pas' {WebApiMain: TWebModule};

{$R *.res}


procedure RunServer(APort: Integer);
var
  LServer: TIdHTTPWebBrokerBridge;
begin
  Writeln('** DMVCFramework Server ** build ' + DMVCFRAMEWORK_VERSION);
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.OnParseAuthentication := TMVCParseAuthentication.OnParseAuthentication;
    LServer.DefaultPort := APort;
    LServer.KeepAlive := True;

    { more info about MaxConnections
      http://ww2.indyproject.org/docsite/html/frames.html?frmname=topic&frmfile=index.html }
    LServer.MaxConnections := 0;

    { more info about ListenQueue
      http://ww2.indyproject.org/docsite/html/frames.html?frmname=topic&frmfile=index.html }
    LServer.ListenQueue := 200;

    LServer.Active := True;
    WriteLn('Listening on port ', APort);
    Write('CTRL+C to shutdown the server');
    WaitForTerminationSignal;
    EnterInShutdownState;
    LServer.Active := False;
  finally
    LServer.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  IsMultiThread := True;
  // DMVCFramework Specific Configuration
  // When MVCSerializeNulls = True empty nullables and nil are serialized as json null.
  // When MVCSerializeNulls = False empty nullables and nil are not serialized at all.
  MVCSerializeNulls := True;
  try
    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := WebModuleClass;
    WebRequestHandlerProc.MaxConnections := 1024;
    RunServer(1234);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
