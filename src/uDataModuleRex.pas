unit uDataModuleRex;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Phys;

type
  TMySQLConnection = class
  private
    FFDConnection: TFDConnection;
    procedure InitializeConnection;
  public
    constructor Create(const AServer, APort, ADatabase, AUsername, APassword: string);
    destructor Destroy; override;
    procedure Connect;
    procedure Disconnect;
    function GetConnection: TFDConnection;
  end;

implementation

constructor TMySQLConnection.Create(const AServer, APort, ADatabase, AUsername, APassword: string);
begin
  FFDConnection := TFDConnection.Create(nil);
  InitializeConnection;

  FFDConnection.Params.Add('Server='    + AServer);
  FFDConnection.Params.Add('Port='      + APort);
  FFDConnection.Params.Add('Database='  + ADatabase);
  FFDConnection.Params.Add('User_Name=' + AUsername);
  FFDConnection.Params.Add('Password='  + APassword);

end;

destructor TMySQLConnection.Destroy;
begin
  FFDConnection.Free;
  inherited;
end;

procedure TMySQLConnection.InitializeConnection;
begin
  FFDConnection.LoginPrompt := False;
  FFDConnection.DriverName := 'MySQL';
end;

procedure TMySQLConnection.Connect;
begin
  if not FFDConnection.Connected then
    FFDConnection.Connected := True;
end;

procedure TMySQLConnection.Disconnect;
begin
  if FFDConnection.Connected then
    FFDConnection.Connected := False;
end;

function TMySQLConnection.GetConnection: TFDConnection;
begin
  Result := FFDConnection;
end;

end.

