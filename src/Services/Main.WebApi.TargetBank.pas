unit Main.WebApi.TargetBank;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  MVCFramework,
  FireDAC.Phys,
  Data.DB;

type
  TWebApiMain = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
  private
    FMVC: TMVCEngine;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebApiMain;

implementation

{$R *.dfm}

uses
  Controller.WebApi.TargetBank,
  MVCFramework.Commons,
  MVCFramework.Middleware.ActiveRecord;

procedure TWebApiMain.WebModuleCreate(Sender: TObject);
begin
  FMVC := TMVCEngine.Create(Self,
    procedure(Config: TMVCConfig)
    begin
      // session timeout (0 means session cookie)
      Config[TMVCConfigKey.SessionTimeout] := '5000000';
      //default content-type
      Config[TMVCConfigKey.DefaultContentType] := TMVCConstants.DEFAULT_CONTENT_TYPE;
      //default content charset
      Config[TMVCConfigKey.DefaultContentCharset] := TMVCConstants.DEFAULT_CONTENT_CHARSET;
      //unhandled actions are permitted?
      Config[TMVCConfigKey.AllowUnhandledAction] := 'false';
      //enables or not system controllers loading (available only from localhost requests)
      Config[TMVCConfigKey.LoadSystemControllers] := 'true';
      //default view file extension
      Config[TMVCConfigKey.DefaultViewFileExtension] := 'html';
      //view path
      Config[TMVCConfigKey.ViewPath] := 'templates';
      //Max Record Count for automatic Entities CRUD
      Config[TMVCConfigKey.MaxEntitiesRecordCount] := '20';
      //Enable Server Signature in response
      Config[TMVCConfigKey.ExposeServerSignature] := 'true';
      //Enable X-Powered-By Header in response
      Config[TMVCConfigKey.ExposeXPoweredBy] := 'true';
      // Max request size in bytes
      Config[TMVCConfigKey.MaxRequestSize] := IntToStr(TMVCConstants.DEFAULT_MAX_REQUEST_SIZE);
    end);
  FMVC.AddController(TControllerApiTargetBank);

  // Analytics middleware generates a csv log, useful to do trafic analysis
  //FMVC.AddMiddleware(TMVCAnalyticsMiddleware.Create(GetAnalyticsDefaultLogger));

  // The folder mapped as documentroot for TMVCStaticFilesMiddleware must exists!
  //FMVC.AddMiddleware(TMVCStaticFilesMiddleware.Create('/static', TPath.Combine(ExtractFilePath(GetModuleName(HInstance)), 'www')));

  // Trace middlewares produces a much detailed log for debug purposes
  //FMVC.AddMiddleware(TMVCTraceMiddleware.Create);

  // CORS middleware handles... well, CORS
  //FMVC.AddMiddleware(TMVCCORSMiddleware.Create);

  // Simplifies TMVCActiveRecord connection definition
  //FMVC.AddMiddleware(TMVCActiveRecordMiddleware.Create('MyConnDef','FDConnectionDefs.ini'));

  // Compression middleware must be the last in the chain, just before the ETag, if present.
  //FMVC.AddMiddleware(TMVCCompressionMiddleware.Create);

  // ETag middleware must be the latest in the chain
  //FMVC.AddMiddleware(TMVCETagMiddleware.Create);

  {
  FMVC.OnWebContextCreate(
    procedure(const Context: TWebContext)
    begin
      // Initialize services to make them accessibile from Context
      // Context.CustomIntfObject := TMyService.Create; 
    end);

  FMVC.OnWebContextDestroy(
    procedure(const Context: TWebContext)
    begin
      //Cleanup services, if needed
    end);
  }
end;

procedure TWebApiMain.WebModuleDestroy(Sender: TObject);
begin
  FMVC.Free;
end;

end.
