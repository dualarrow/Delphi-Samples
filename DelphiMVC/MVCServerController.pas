unit MVCServerController;

interface

uses
  DAO,
  MVCFramework,
  MVCFramework.Logger,
  MVCFramework.Commons,
  Web.HTTPApp;

type
  [MVCPath('/')]
  TMainController = class(TMVCController)
  public
    [MVCPath('/test')]
    [MVCHTTPMethod([httpPOST])]
    procedure Test([MVCFromBody]body: TDataReq);
  end;

implementation

uses
  SysUtils;

{ TMainController }

procedure TMainController.Test(body: TDataReq);
begin
  var t := TDataResp.Create;
  t.TestData := 'Hello World ' + body.IntData.ToString;
  Render(t);
end;

end.
