unit ControllerSample;

interface

uses
  DTOSample,
  MVCFramework,
  MVCFramework.Logger,
  MVCFramework.Commons,
  Web.HTTPApp;

type
  [MVCPath('/')]
  TSampleController = class(TMVCController)
  public
    [MVCPath('/test')]
    [MVCHTTPMethod([httpPOST])]
    procedure Test([MVCFromBody]body: TSampleReq);
  end;

implementation

uses
  MVCServerClass,
  SysUtils;

{ TMainController }

procedure TSampleController.Test(body: TSampleReq);
begin
  body.IntData := 123;
  var resp := GetWorkerSample.Test(body);
  Render(resp);
end;

end.
