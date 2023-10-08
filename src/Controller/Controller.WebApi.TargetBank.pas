unit Controller.WebApi.TargetBank;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,
  uDataModuleRex,
  MVCFramework.SQLGenerators.MySQL,
  MVCFramework.ActiveRecord,
  Model.Cadastro,
  System.JSON;

type
  [MVCPath('/api')]
  TControllerApiTargetBank = class(TMVCController)
  public

  private
    FConnectionRex: TMySQLConnection;

  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  public

    [MVCPath('/cadastro')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCadastro;

    [MVCPath('/cadastro/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCadastroById(id: Integer);

    [MVCPath('/cadastro')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateCadastro;

    [MVCPath('/cadastro/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure UpdateCadastro(id: Integer);

    [MVCPath('/cadastro/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure DeleteCadastro(id: Integer);

    constructor Create; override;
  end;

implementation

uses
  System.SysUtils,
  MVCFramework.Logger,
  System.Generics.Collections,
  IniFiles;

procedure TControllerApiTargetBank.OnAfterAction(Context: TWebContext; const AActionName: string);
begin

  inherited;
end;

procedure TControllerApiTargetBank.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin

  inherited;
end;

procedure TControllerApiTargetBank.GetCadastro;
begin
  var vCadastro := TMVCActiveRecord.All<TCadastro>;
  Render<TCadastro>(vCadastro);
end;

procedure TControllerApiTargetBank.GetCadastroById(id: Integer);
begin
  var vCadastro := TMVCActiveRecord.GetByPK<TCadastro>(id);
  Render(vCadastro);
end;

constructor TControllerApiTargetBank.Create;
begin
  inherited;

  var vIniFile := TIniFile.Create('C:\Git\Api.TargetBank\conexao.ini');

  FConnectionRex := TMySQLConnection.Create(vIniFile.ReadString('Conexao', 'Servidor', ''),
                                            vIniFile.ReadString('Conexao', 'Porta'   , ''),
                                            vIniFile.ReadString('Conexao', 'Banco'   , ''),
                                            vIniFile.ReadString('Conexao', 'Usuario' , ''),
                                            vIniFile.ReadString('Conexao', 'Senha'   , ''));

  FConnectionRex.Connect;

  ActiveRecordConnectionsRegistry.AddDefaultConnection(FConnectionRex.GetConnection);
end;

procedure TControllerApiTargetBank.CreateCadastro;
begin
  var vCadastro := Context.Request.BodyAs<TCadastro>;

  vCadastro.Insert;

  Render(vCadastro);
end;

procedure TControllerApiTargetBank.UpdateCadastro(id: Integer);
begin
  var vCadastro := Context.Request.BodyAs<TCadastro>;

  vCadastro.Codigo := id;
  vCadastro.Update;

  Render(vCadastro);
end;

procedure TControllerApiTargetBank.DeleteCadastro(id: Integer);
begin
  var vCadastro := TMVCActiveRecord.GetByPK<TCadastro>(id);

  vCadastro.Delete;

  Render(TJSONObject.Create(TJSONPair.Create('result','registro apagado com sucesso')));
end;



end.
