unit WebService.Client.TargetBank;

interface

uses
  System.Classes, System.SysUtils, System.JSON, REST.Client, REST.Types;

type
  TWebServiceClient = class
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;

    function GetResponseContentAsJSON: TJSONObject;
  public
    constructor Create(const ABaseURL: string);
    destructor Destroy; override;

    function GetDataFromWebService(const AResource: string): TJSONObject;
  end;

implementation

constructor TWebServiceClient.Create(const ABaseURL: string);
begin
  FRESTClient := TRESTClient.Create(ABaseURL);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
end;

destructor TWebServiceClient.Destroy;
begin
  FRESTClient.Free;
  FRESTRequest.Free;
  FRESTResponse.Free;

  inherited;
end;

function TWebServiceClient.GetResponseContentAsJSON: TJSONObject;
var
  ResponseContent: string;
begin
  Result := nil;

  if FRESTResponse.StatusCode = 200 then
  begin
    ResponseContent := FRESTResponse.Content;
    Result := TJSONObject.ParseJSONValue(ResponseContent) as TJSONObject;
  end;
end;

function TWebServiceClient.GetDataFromWebService(const AResource: string): TJSONObject;
begin
  FRESTRequest.Resource := AResource;
  FRESTRequest.Method := rmGET;

  try
    FRESTRequest.Execute;
  except
    on E: Exception do
    begin
      // Tratar exceções, caso necessário
      raise;
    end;
  end;

  Result := GetResponseContentAsJSON;
end;

end.

