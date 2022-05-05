unit DTOSample;

interface

type
  TSampleReq = class
  private
    fIntData: integer;
  public
    property IntData: integer read fIntData write fIntData;
  end;

  TSampleResp = class
  private
    fTestData: string;
  public
    property TestData: string read fTestData write fTestData;
  end;

implementation

end.
