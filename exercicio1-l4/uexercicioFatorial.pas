unit uexercicioFatorial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrFatorial = class(TForm)
    edValor: TLabeledEdit;
    lbResultado: TLabel;
    btCalcular: TButton;
    lbResultadoLabel: TLabel;
    procedure btCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frFatorial: TfrFatorial;

implementation

{$R *.dfm}

procedure TfrFatorial.btCalcularClick(Sender: TObject);
var
  wValor,
  wFatorial,
  wResultado: Integer;
begin
  if edValor.Text = '' then
     begin
       MessageDlg('favor preencher o campo.' + #13#10#13#10, mtWarning, [mbOK], 0);
       Exit;
     end;

  try
    wValor     := StrToInt(edValor.Text);
    wFatorial  := wValor - 1;
    while wFatorial >= 1 do
      begin
        wValor := wValor * wFatorial;
        wFatorial := wFatorial - 1;
        wResultado := wValor;
      end;

    lbResultado.Caption :=  IntToStr(wResultado);
    lbResultado.Visible := true;
  except
  on E:Exception do
     MessageDlg('Existem caracteres inválidos.' + #13#10#13#10 + 'Erro: ' + E.Message, mtError, [mbOK], 0);
  end;

end;

end.
