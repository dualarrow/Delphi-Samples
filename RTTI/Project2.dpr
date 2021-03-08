program Project2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  RTTI,
  System.SysUtils,
  Unit1 in 'Unit1.pas';

var
  gSample: TSample;

procedure Main;
var
  lContext: TRTTIContext;
  lType: TRttiType;
  lProperty: TRttiProperty;
  lMethod: TRttiMethod;
  lSample: TSample;
begin
  gSample := TSample.Create;
  gSample.Data := 'Hello World';

  // Get property value
  lContext := TRTTIContext.Create;
  lType := lContext.GetType(gSample.ClassType);
  lProperty := lType.GetProperty('Data');
  WriteLn('Property Value = ' + lProperty.GetValue(gSample).AsString);

  // create instance
  lType := lContext.FindType(TSample.QualifiedClassName);
  lMethod := lType.GetMethod('Create');
  lSample := lMethod.Invoke(lType.AsInstance.MetaclassType, []).AsObject as TSample;
  lSample.Data := 'Goodbye World';
  WriteLn('Constructoed object = ' + lSample.Data);
end;

begin
  Main;
  ReadLn;
end.
