unit MVCClientUnit;

interface

uses
  DAO,
  MVCServerClass,
  MVCInterfaces,
  MVCFramework.Commons,
  MVCFramework.RESTAdapter;

procedure RunClient;

implementation

uses
  MVCFramework.Serializer.Commons;

procedure RunClient;
var
  RESTAdapter: TRESTAdapter<ITest>;
  TestService: ITest;
begin
  var useRest: boolean := true;
//  useRest := false;

  if useRest then
  begin
    RESTAdapter := TRESTAdapter<ITest>.Create;
    TestService := RESTAdapter.Build('localhost', 8080);
  end
  else
    TestService := GetServerWork;

  var req := TDataReq.Create;
  req.IntData := 987;
  var resp := TestService.Test(req);
  writeln(resp.TestData);
  resp.free;
end;

end.
