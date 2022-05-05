program MVCServer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  MVCServerUnit in 'MVCServerUnit.pas',
  ControllerSample in 'ControllerSample.pas',
  DTOSample in 'DTOSample.pas';

begin
  RunServer;
end.
