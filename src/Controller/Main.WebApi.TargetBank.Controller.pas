unit Main.WebApi.TargetBank.Controller;

interface

uses
  uDataModuleRex,
  System.JSON,
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord,
  MVCFramework.SQLGenerators.MySQL,
  System.Generics.Collections;

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

    [MVCPath('/CIOT')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateCIOT;

    constructor Create; override;
  end;

implementation

uses
  System.SysUtils,
  IniFiles,
  Cadastro.Entidade.WebApi.TargetBank.Model,
  ErrorExceptions.WebApi.TargetBank.Interfaces;

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
  var vCadastro := TMVCActiveRecord.All<TCadastroEntidade>;
  Render<TCadastroEntidade>(vCadastro);
end;

procedure TControllerApiTargetBank.GetCadastroById(id: Integer);
begin
  var vCadastro := TMVCActiveRecord.GetByPK<TCadastroEntidade>(id);
  Render(vCadastro);
end;

constructor TControllerApiTargetBank.Create;
begin
  inherited;
  try
    var vIniFile := TIniFile.Create('C:\Git\Api.TargetBank\conexao.ini');

    FConnectionRex := TMySQLConnection.Create(vIniFile.ReadString('Conexao', 'Servidor', ''),
                                              vIniFile.ReadString('Conexao', 'Porta'   , ''),
                                              vIniFile.ReadString('Conexao', 'Banco'   , ''),
                                              vIniFile.ReadString('Conexao', 'Usuario' , ''),
                                              vIniFile.ReadString('Conexao', 'Senha'   , ''));
  
    FConnectionRex.Connect;

    ActiveRecordConnectionsRegistry.AddDefaultConnection(FConnectionRex.GetConnection);
  except on E: Exception do
    Render(E.Message);
  end;
  
end;

procedure TControllerApiTargetBank.CreateCadastro;
begin
  var vCadastro := Context.Request.BodyAs<TCadastroEntidade>;

  vCadastro.Insert;

  Render(vCadastro);
end;

procedure TControllerApiTargetBank.CreateCIOT;
begin

end;

procedure TControllerApiTargetBank.UpdateCadastro(id: Integer);
begin
  var vCadastro := Context.Request.BodyAs<TCadastroEntidade>;

  vCadastro.Codigo := id;
  vCadastro.Update;

  Render(vCadastro);
end;

procedure TControllerApiTargetBank.DeleteCadastro(id: Integer);
begin
  var vCadastro := TMVCActiveRecord.GetByPK<TCadastroEntidade>(id);

  vCadastro.Delete;

  Render(TJSONObject.Create(TJSONPair.Create('result','registro apagado com sucesso')));
end;



end.
