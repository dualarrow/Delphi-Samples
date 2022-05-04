unit MVCServerClass;

interface

uses
  MVCInterfaces,
  DAO;

function GetServerWork: ITest;

implementation

uses
  SysUtils;

type
  TServerWork = class(TInterfacedObject, ITest)
  public
    function test(req: TDataReq): TDataResp;
  end;

function GetServerWork: ITest;
begin
  result := TServerWork.Create;
end;


{ TServerWork }

function TServerWork.test(req: TDataReq): TDataResp;
begin
//  req.Free;
  result := TDataResp.Create;
  result.TestData := 'Hello World ' + DateTimeToStr(now);
end;

end.
