program MVCClient;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  MVCClientUnit in 'MVCClientUnit.pas',
  MVCServerClass in 'MVCServerClass.pas',
  InterfacesSample in 'InterfacesSample.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  RunClient;
end.
