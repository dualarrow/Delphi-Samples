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
  MVCInterfaces in 'MVCInterfaces.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  RunClient;
end.
