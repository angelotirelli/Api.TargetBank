unit ErrorExceptions.WebApi.TargetBank.Interfaces;

interface

type
   IErrorModel = interface
   ['{2F50B8AC-B998-46AB-98C2-96B2868A73AF}']
    function CodigoErroEspecifico(const Value: string): IErrorModel;
    function ErrorCode(const Value: String): IErrorModel;
    function ErrorDescription(const Value: string): IErrorModel;
   end;

implementation

end.
