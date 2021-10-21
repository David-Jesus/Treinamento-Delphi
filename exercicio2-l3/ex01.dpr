program ex01;

uses
  Vcl.Forms,
  uprincipal in 'uprincipal.pas' {frPesquisa},
  Pessoa in 'Pessoa.pas',
  listaPessoa in 'listaPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrPesquisa, frPesquisa);
  Application.Run;
end.
