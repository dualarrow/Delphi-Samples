unit Unit1;

interface

uses
  Spring.Container,
  Spring.DesignPatterns,
  Spring.Container.Common,
  Spring;

type
  ITest = interface
    ['{5E2D9306-FDBC-4AFE-9114-F1FC1622AFC0}']
    procedure run;
  end;

{$M+}
  ITestFactory = interface
    ['{52D3136B-627D-4F43-9440-A25CAC544F5E}']
    function Create: ITest;
  end;

{$M-}
  TTest = class(TInterfacedObject, ITest)
  public
    procedure Run;
  end;

  IRun = interface
    ['{1D507AC0-221E-4792-9D63-90ECC1D85A5B}']
    procedure Run;
  end;

  TRun = class(TInterfacedObject, IRun)
  private
    fTestFactory: ITestFactory;
  public
    constructor create(aTestFactory: ITestFactory);
    procedure Run;
  end;

procedure Run;

implementation

procedure Run;
var
  x: IRun;
begin
  GlobalContainer.RegisterType<TTest>.Implements<ITest>;
  GlobalContainer.RegisterType<TRun>.Implements<IRun>;
  GlobalContainer.RegisterType<ITestFactory>.AsFactory;
  GlobalContainer.Build;

//  var f := GlobalContainer.Resolve<ITestFactory>;


  x := GlobalContainer.Resolve<IRun>;
  x.Run;
end;

{ TTest }

procedure TTest.Run;
begin
  writeln('RUN');
  readln;
end;

{ TRun }

constructor TRun.create(aTestFactory: ITestFactory);
begin
  inherited create;
  fTestFactory := aTestFactory;
end;

procedure TRun.Run;
begin
  var f := fTestFactory.Create;
  f.Run;
end;

end.
