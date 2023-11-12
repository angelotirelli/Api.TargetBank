unit ErrorExceptions.WebApi.TargetBank.Model;

interface

uses
   ErrorExceptions.WebApi.TargetBank.Interfaces;

type

  TErrorModel = class(TInterfacedObject, IErrorModel)
  private
    FErrorCode: String;
    FErrorDescription: string;
    FCodigoErroEspecifico: string;

    function CodigoErroEspecifico(const Value: string): IErrorModel;
    function ErrorCode(const Value: String): IErrorModel;
    function ErrorDescription(const Value: string): IErrorModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IErrorModel;
  end;

implementation

{ TErrorModel }

function TErrorModel.ErrorCode(const Value: String): IErrorModel;
begin
  Result := Self;
  FErrorCode  := Value;
end;

function TErrorModel.CodigoErroEspecifico(const Value: string): IErrorModel;
begin
  Result := Self;
  FCodigoErroEspecifico := Value;
end;

constructor TErrorModel.Create;
begin

end;

destructor TErrorModel.Destroy;
begin

  inherited;
end;

function TErrorModel.ErrorDescription(const Value: string): IErrorModel;
begin
  Result := Self;
  FErrorDescription := Value;
end;

class function TErrorModel.New: IErrorModel;
begin
  Result := Self.Create;
end;

end.
