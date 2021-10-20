unit upricipal;

interface

uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrExercicio1 = class(TForm)
    btVerifica: TButton;
    edCaracter: TEdit;
    Label1: TLabel;
    lbResultado: TLabel;
  procedure btVerificaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frExercicio1: TfrExercicio1;

implementation

{$R *.dfm}

uses uValidaCaractere;

procedure TfrExercicio1.btVerificaClick(Sender: TObject);
var
  wCaracter : Char;
begin
  lbResultado.Visible := False;
  if edCaracter.Text = '' then
     begin
       ShowMessage('Informe um caractere!');
       Exit;
     end;

  try
    wCaracter           := edCaracter.Text[1];
    lbResultado.Caption := validaCaractere(wCaracter);
    lbResultado.Visible := True;
  except
    on E: Exception do
  end;
end;

end.
