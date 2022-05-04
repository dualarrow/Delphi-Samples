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
  MVCServerClass,
  SysUtils;

{ TMainController }

procedure TMainController.Test(body: TDataReq);
begin
  body.IntData := 123;
  var resp := GetServerWork.Test(body);
  Render(resp);
end;

end.
