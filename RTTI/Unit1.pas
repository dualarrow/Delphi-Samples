unit Unit1;

interface

type
  TSample = class
  private
    FData: string;
  public
    constructor Create;
    property Data: string read FData write FData;
  end;

implementation

{ TSample }

constructor TSample.Create;
begin
  WriteLn('Created');
end;

end.
