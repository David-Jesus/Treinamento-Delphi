program ex01;

uses
  Vcl.Forms,
  uPricipal in 'uPricipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
