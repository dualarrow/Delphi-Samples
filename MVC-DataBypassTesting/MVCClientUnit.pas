unit MVCClientUnit;

interface

uses
  DTOSample,
  MVCServerClass,
  InterfacesSample,
  MVCFramework.Commons,
  MVCFramework.RESTAdapter;

procedure RunClient;

implementation

uses
  MVCFramework.Serializer.Commons;

procedure RunClient;
var
  RESTAdapter: TRESTAdapter<ISample>;
  SampleService: ISample;
begin
  var useRest: boolean := true;
//  useRest := false;

  if useRest then
  begin
    RESTAdapter := TRESTAdapter<ISample>.Create;
    SampleService := RESTAdapter.Build('localhost', 8080);
  end
  else
    SampleService := GetWorkerSample;

  var req := TSampleReq.Create;
  req.IntData := 987;
  var resp := SampleService.Test(req);
  writeln(resp.TestData);
  resp.free;
end;

end.
