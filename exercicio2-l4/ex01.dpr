program ex01;

uses
  Vcl.Forms,
  upricipal in 'upricipal.pas' {frFibonacci};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrFibonacci, frFibonacci);
  Application.Run;
end.
