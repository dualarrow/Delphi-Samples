unit MVCServerClass;

interface

uses
  InterfacesSample,
  DTOSample;

function GetWorkerSample: ISample;

implementation

uses
  SysUtils;

type
  TWorkerSample = class(TInterfacedObject, ISample)
  public
    function test(req: TSampleReq): TSampleResp;
  end;

function GetWorkerSample: ISample;
begin
  result := TWorkerSample.Create;
end;


{ TWorkerSample }

function TWorkerSample.test(req: TSampleReq): TSampleResp;
begin
//  req.Free;
  result := TSampleResp.Create;
  result.TestData := 'Hello World ' + DateTimeToStr(now);
end;

end.
