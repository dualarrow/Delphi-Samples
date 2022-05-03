unit MVCClientUnit;

interface

uses
  DAO,
  MVCFramework.Commons,
  MVCFramework.RESTAdapter;


procedure RunClient;

type
  ITest = interface(IInvokable)
    ['{2BB61600-425E-4B3D-A6AB-5B805BDADF26}']
    [RESTResource(HttpPost, '/test')]
    function test([Body]req: TDataReq): TDataResp;
  end;

implementation

uses
  MVCFramework.Serializer.Commons;

procedure RunClient;
begin
  var RESTAdapter := TRESTAdapter<ITest>.Create;
  var TestService := RESTAdapter.Build('localhost', 8080);
  var req := TDataReq.Create;
  req.IntData := 987;
  var x := TestService.Test(req);
end;

end.
