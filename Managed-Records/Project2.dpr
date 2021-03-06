program Project2;

{$APPTYPE CONSOLE}

{$R *.res}

type
  TSample = record
    Field: string;

    class operator Initialize(out aRec: TSample);
    class operator Finalize(var aRec: TSample);
  end;

{ TSample }

class operator TSample.Initialize(out aRec: TSample);
begin
  WriteLn('Initialize');
  aRec.Field := 'Example';
end;

class operator TSample.Finalize(var aRec: TSample);
begin
  WriteLn('Finalize');
end;

procedure RunTest;
var
  lDummy: TSample;
begin
  WriteLn('Running ' + lDummy.Field);
end;

begin
  RunTest;
  ReadLn;
end.
