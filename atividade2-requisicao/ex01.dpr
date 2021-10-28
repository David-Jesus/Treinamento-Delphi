program ex01;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uEnviaEmail in 'uEnviaEmail.pas' {frEnvioEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
//  Application.CreateForm(TfrEnvioEmail, frEnvioEmail);
  Application.Run;
end.
