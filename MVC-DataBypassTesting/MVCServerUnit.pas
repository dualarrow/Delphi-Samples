unit MVCServerUnit;

interface

uses
  MVCFramework;

procedure RunServer;

implementation

uses
  ControllerSample,
  SysUtils,
  Web.WebReq,
//  Web.WebBroker,
  MVCFramework.Commons,
  Classes,
  IdHTTPWebBrokerBridge,
  MVCFramework.REPLCommandsHandlerU,
  Web.HttpApp;

type
  TWebModuleServer = class(TWebModule)
  private
    fMVC: TMVCEngine;
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
  public
    constructor Create(aOwner: TComponent); override;
  end;

procedure RunServerNow(APort: Integer);
var
  lServer: TIdHTTPWebBrokerBridge;
  lCustomHandler: TMVCCustomREPLCommandsHandler;
  lCmd, lStartupCommand: string;
begin
  if ParamCount >= 1 then
    lStartupCommand := ParamStr(1)
  else
    lStartupCommand := 'start';

  lCustomHandler := function(const Value: String; const Server: TIdHTTPWebBrokerBridge; out Handled: Boolean): THandleCommandResult
    begin
      Handled := False;
      Result := THandleCommandResult.Unknown;

      // Write here your custom command for the REPL using the following form...
      // ***
      // Handled := False;
      // if (Value = 'apiversion') then
      // begin
      // REPLEmit('Print my API version number');
      // Result := THandleCommandResult.Continue;
      // Handled := True;
      // end
      // else if (Value = 'datetime') then
      // begin
      // REPLEmit(DateTimeToStr(Now));
      // Result := THandleCommandResult.Continue;
      // Handled := True;
      // end;
    end;

  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.DefaultPort := APort;
//    LogI(Format('Server started on port %d', [APort]));

    { more info about MaxConnections
      http://www.indyproject.org/docsite/html/frames.html?frmname=topic&frmfile=TIdCustomTCPServer_MaxConnections.html }
    LServer.MaxConnections := 0;

    { more info about ListenQueue
      http://www.indyproject.org/docsite/html/frames.html?frmname=topic&frmfile=TIdCustomTCPServer_ListenQueue.html }
    LServer.ListenQueue := 200;

    WriteLn('Write "quit" or "exit" to shutdown the server');
    repeat
      Write('-> ');
      if lStartupCommand.IsEmpty then
        ReadLn(lCmd)
      else
      begin
        lCmd := lStartupCommand;
        lStartupCommand := '';
        WriteLn(lCmd);
      end;

      case HandleCommand(lCmd.ToLower, LServer, lCustomHandler) of
        THandleCommandResult.Continue:
          begin
            Continue;
          end;
        THandleCommandResult.Break:
          begin
            Break;
          end;
        THandleCommandResult.Unknown:
          begin
            REPLEmit('Unknown command: ' + lCmd);
          end;
      end;
    until false;

  finally
    LServer.Free;
  end;
end;

procedure RunServer;
begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := TWebModuleServer;
  WebRequestHandlerProc.MaxConnections := 1024;
  RunServerNow(8080);
end;

{ TWebModuleServer }

constructor TWebModuleServer.Create(aOwner: TComponent);
begin
  OnCreate := WebModuleCreate;
  OnDestroy := WebModuleDestroy;
end;

procedure TWebModuleServer.WebModuleCreate(Sender: TObject);
begin
  fMVC := TMVCEngine.Create(Self,
    procedure(Config: TMVCConfig)
    begin
      Config[TMVCConfigKey.ViewPath] := '.\www\public_html';
    end);

  // Web files
//  fMVC.AddMiddleware(TMVCStaticFilesMiddleware.Create('/app', '.\www\public_html'));

  // Image files
//  fMVC.AddMiddleware(TMVCStaticFilesMiddleware.Create('/images', '.\www\public_images', 'database.png'));

  fMVC.AddController(TSampleController);
end;

procedure TWebModuleServer.WebModuleDestroy(Sender: TObject);
begin
  fMVC.Free;
end;

end.
