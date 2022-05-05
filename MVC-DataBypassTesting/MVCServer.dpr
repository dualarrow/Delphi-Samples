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
  MVCServerController in 'MVCServerController.pas',
  DTO in 'DTO.pas';

begin
  RunServer;
end.
