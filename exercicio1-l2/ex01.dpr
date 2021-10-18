program ex01;

uses
  Vcl.Forms,
  upricipal in 'upricipal.pas' {frExercicio1},
  uValidaCaractere in 'uValidaCaractere.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrExercicio1, frExercicio1);
  Application.Run;
end.
