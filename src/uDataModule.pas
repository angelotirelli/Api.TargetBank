unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.UI;

type
  TDataModuleTargetBank = class(TDataModule)
    FDConn: TFDConnection;
   //  FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
   //  FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConnectToDatabase;
  end;

implementation

{$R *.dfm}

procedure TDataModuleTargetBank.ConnectToDatabase;
begin
  FDConn.Params.Clear;
  FDConn.DriverName := 'MySQL';
  FDConn.Params.Add('Server=177.70.18.178');
  FDConn.Params.Add('Database=rex_cte');
  FDConn.Params.Add('User_Name=$rex_cte');
  FDConn.Params.Add('Password=#Rex_cte$22892');
  FDConn.Connected := True;
end;

end.

