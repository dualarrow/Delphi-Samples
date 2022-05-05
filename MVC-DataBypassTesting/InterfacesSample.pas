unit InterfacesSample;

interface

uses
  MVCFramework.Commons,
  MVCFramework.RESTAdapter,
  DTOSample;

type
  ISample = interface(IInvokable)
    ['{2BB61600-425E-4B3D-A6AB-5B805BDADF26}']
    [RESTResource(HttpPost, '/test')]
    function test([Body]req: TSampleReq): TSampleResp;
  end;

implementation

end.
