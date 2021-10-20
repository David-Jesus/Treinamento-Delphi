program exe01;

uses
  Vcl.Forms,
  uprincipal in 'uprincipal.pas' {Form1},
  unt_str_utils in 'unt_str_utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
