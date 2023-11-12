unit Cadastro.Entidade.WebApi.TargetBank.Model;

interface

uses MVCFramework.ActiveRecord;

type
  [MVCTable('cadastro')]
  [MVCEntityActions([eaCreate, eaRetrieve, eaUpdate, eaDelete])]

  TCadastroEntidade = class (TMVCActiveRecord)
  private
    [MVCTableField('codigo', [foPrimaryKey, foAutoGenerated])]
    FCodigo: Integer;

    [MVCTableField('cpf')]
    FCpf: string;

    [MVCTableField('nome')]
    FNome: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetCpf(const Value: string);
    procedure SetNome(const Value: string);

    function GetCodigo: Integer;
    function GetCpf: string;
    function GetNome: string;

  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property Cpf: string read GetCpf write SetCpf;
  end;

implementation

{ TCadastroEntidade }

function TCadastroEntidade.GetCodigo: Integer;
begin
 Result := FCodigo;
end;

function TCadastroEntidade.GetCpf: string;
begin
 Result := FCpf;
end;

function TCadastroEntidade.GetNome: string;
begin
 Result := FNome;
end;

procedure TCadastroEntidade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCadastroEntidade.SetCpf(const Value: string);
begin
  FCpf := Value;
end;

procedure TCadastroEntidade.SetNome(const Value: string);
begin
  FNome := Value;
end;

initialization

  ActiveRecordMappingRegistry.AddEntity('cadastro', TCadastroEntidade);

finalization

end.