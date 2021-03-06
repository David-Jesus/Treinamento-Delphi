unit ureposicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrReposicao = class(TForm)
    edReposicao: TLabeledEdit;
    btCalcularMediaReposicao: TButton;
    edMedia: TLabeledEdit;
    procedure btCalcularMediaReposicaoClick(Sender: TObject);
  private
    { Private declarations }
    FNota1        ,
    FNota2        ,
    FNota3        ,
    FMedia        ,
    FNotaReposicao: currency;
  public
    { Public declarations }
//    constructor Create(prNota1, prNota2, prNota3: Currency); Exemplo de construtor

    property Nota1: Currency read FNota1 write FNota1;
    property Nota2: Currency read FNota2 write FNota2;
    property Nota3: Currency read FNota3 write FNota3;
  end;

implementation

{$R *.dfm}

uses ufinal;

{ TfrReposicao }

{constructor TfrReposicao.Create(prNota1, prNota2, prNota3: Currency);
Exemplo defini??o de construtor
begin
  inherited create(nil);

  FNota1 := prNota1;
  FNota2 := prNota2;
  FNota3 := prNota3;
end;              }

procedure TfrReposicao.btCalcularMediaReposicaoClick(Sender: TObject);
var
  frReposicao: TfrReposicao;
  wFormFinal : TfrProvaFinal;
begin
  if edReposicao.Text = '' then
     begin
       MessageDlg('Favor informar a nota de reposi??o!', mtWarning, [mbOk], 0);
       exit;
     end;

  try
    FNotaReposicao := StrToFloat(edReposicao.Text);

    if FNotaReposicao > 10  then
       begin
         MessageDlg('Favor informar a nota 1 menor que 10!', mtWarning, [mbOk], 0);
         exit;
       end;

    if (FNotaReposicao > FNota1) and (FNota1 < FNota2) and (FNota1 < FNota3) then
       Nota1 := FNotaReposicao
    else
    if (FNotaReposicao > FNota2) and (FNota2 < FNota3) then
       Nota2 := FNotaReposicao
    else
    if FNotaReposicao > FNota3 then
       Nota3 := FNotaReposicao;

    FMedia := (FNota1 + FNota2 + FNota3) / 3;

    edMedia.Text    := formatfloat('#0.00', FMedia);

    if FMedia >= 7 then
       MessageDlg('Aluno aprovado com sucesso.', mtConfirmation, [mbok], 0)
    else
       begin
         if MessageDlg('Aluno em prova final, deseja informar a nota da prova de final?', mtWarning, [mbYes, mbNo], 0) = mrYes then
            begin
              wFormFinal := TfrProvaFinal.Create(Fmedia);
              try
                wFormFinal.ShowModal;
              finally
                if Assigned(wFormFinal) then
                   FreeAndNil(wFormFinal);
              end;
          end
         else
            MessageDlg('Aluno reprovado!', mtWarning, [mbOK], 0)
       end;
  except
    on E:Exception do
      MessageDlg('Existem caracteres inv?lidos.' + #13#10#13#10 + 'Erro: ' + E.Message, mtWarning, [mbOK], 0)
  end;
end;

end.
