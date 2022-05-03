program MVCClient;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  MVCClientUnit in 'MVCClientUnit.pas';

begin
  RunClient;
end.
