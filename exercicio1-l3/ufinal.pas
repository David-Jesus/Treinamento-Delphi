unit ufinal;

interface

uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrProvaFinal = class(TForm)
    edNotaFinal: TLabeledEdit;
    edMedia: TLabeledEdit;
    btMedia: TButton;
    procedure btMediaClick(Sender: TObject);
  private
    { Private declarations }

     FMedia         ,
     FNotaFinal     ,
     FMediaReposicao: currency;
  public
    { Public declarations }
    constructor Create(prMediaReposicao: Currency);

    property NotaReposicao: Currency read FMediaReposicao write FMediaReposicao;
  end;

var
  frProvaFinal: TfrProvaFinal;

implementation

{$R *.dfm}

constructor TfrProvaFinal.Create(prMediaReposicao: Currency);
  begin
    inherited create(nil);
    FMediaReposicao:= prMediaReposicao;
  end;

procedure TfrProvaFinal.btMediaClick(Sender: TObject);
  begin
    if edNotaFinal.Text = '' then
       begin
         MessageDlg('Favor informar a nota de reposi??o!', mtWarning, [mbOk], 0);
         exit;
       end;

    try
      FNotaFinal := StrToFloat(edNotaFinal.Text);

      if FNotaFinal > 10  then
         begin
           MessageDlg('Favor informar a nota menor que 10!', mtWarning, [mbOk], 0);
           exit;
         end;

      FMedia       := FNotaFinal +  FMediaReposicao;
      edMedia.Text := formatfloat('#0.00', FMedia);

      if FMedia >= 12 then
         MessageDlg('Aluno aprovado com sucesso.', mtConfirmation, [mbok], 0)
      else
         MessageDlg('Aluno reprovado.', mtConfirmation, [mbok], 0);
      except
        on E:Exception do
        MessageDlg('Existem caracteres inv?lidos.' + #13#10#13#10 + 'Erro: ' + E.Message, mtWarning, [mbOK], 0);
    end;
  end;

end.
