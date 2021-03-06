unit Unit2;

interface

uses
  Threading,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Counter: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    ThreadCount: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FThreadPool: TThreadPool;
    procedure AddCount;
    procedure DecCount;
  end;

var
  Form2: TForm2;

implementation

uses
  SyncObjs;

{$R *.dfm}

var
  gCritical: TCriticalSection;
  gThreadCounter: integer = 0;
  gCount: integer;

procedure TForm2.Button1Click(Sender: TObject);
begin
  TTask.Run(procedure
    begin
      gCount := 0;
      for var threads := 1 to 30 do
      begin
        TTask.Run(
          procedure
          begin
            AddCount;
            for var i:=1 to 100 do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  inc(gCount);
                  Counter.Caption := gCount.ToString;
                end
              );
              Sleep(200);
            end;
            DecCount;
          end
        );
        Sleep(10);
      end;
    end
  );
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  TTask.Run(procedure
    begin
      gCount := 0;
      for var threads := 1 to 30 do
      begin
        TTask.Run(
          procedure
          begin
            AddCount;
            for var i:=1 to 100 do
            begin
              TThread.Synchronize(nil,
                procedure
                begin
                  inc(gCount);
                  Counter.Caption := gCount.ToString;
                end
              );
              Sleep(200);
            end;
            DecCount;
          end,
          FThreadPool
        );
      end;
    end
  );
end;

procedure TForm2.AddCount;
begin
  gCritical.Enter;
  inc(gThreadCounter);
  TThread.Synchronize(nil,
    procedure
    begin
      ThreadCount.Caption := gThreadCounter.ToString;
    end
  );
  gCritical.Leave;
end;

procedure TForm2.DecCount;
begin
  gCritical.Enter;
  dec(gThreadCounter);
  TThread.Synchronize(nil,
    procedure
    begin
      ThreadCount.Caption := gThreadCounter.ToString;
    end
  );
  gCritical.Leave;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  gCritical := TCriticalSection.Create;
  FThreadPool := TThreadPool.Create;
  FThreadPool.SetMaxWorkerThreads(5);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FThreadPool.Free;
  gCritical.Free;
end;

end.
