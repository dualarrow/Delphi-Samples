unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Threading;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      for var i:=1 to 100 do
      begin
        TThread.Synchronize(nil,
          procedure
          begin
            Label1.Caption := i.ToString;
          end
        );
        Sleep(100);
      end;
    end
  );
end;

end.
