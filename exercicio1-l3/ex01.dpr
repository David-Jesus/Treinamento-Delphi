program ex01;

uses
  Vcl.Forms,
  uprincipal in 'uprincipal.pas' {frExercicio},
  ureposicao in 'ureposicao.pas' {frReposicao},
  ufinal in 'ufinal.pas' {frProvaFinal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrExercicio, frExercicio);
  Application.CreateForm(TfrProvaFinal, frProvaFinal);
  Application.Run;
end.
