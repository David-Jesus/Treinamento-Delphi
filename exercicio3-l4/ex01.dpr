program ex01;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frFormulario},
  uAssinante in 'uAssinante.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrFormulario, frFormulario);
  Application.Run;
end.
