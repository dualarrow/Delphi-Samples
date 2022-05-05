unit DTO;

interface

type
  TDataReq = class
  private
    fIntData: integer;
  public
    property IntData: integer read fIntData write fIntData;
  end;

  TDataResp = class
  private
    fTestData: string;
  public
    property TestData: string read fTestData write fTestData;
  end;

implementation

end.
