unit uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrExercicio = class(TForm)
    btCalculaMedia: TButton;
    edNota1: TLabeledEdit;
    edNota2: TLabeledEdit;
    edNota3: TLabeledEdit;
    lbMedia: TLabel;
    edMedia: TEdit;
    mmMedia: TMemo;
    procedure btCalculaMediaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frExercicio: TfrExercicio;

implementation

{$R *.dfm}

uses ureposicao;

procedure TfrExercicio.btCalculaMediaClick(Sender: TObject);
var
  wNota1         ,
  wNota2         ,
  wNota3         ,
  wMedia         : Currency;
  wFormReposicao : TfrReposicao;
begin
  mmMedia.Clear;
  if edNota1.Text = '' then
     begin
       ShowMessage('Favor informar a nota 1!');
       exit;
     end
  else
  if edNota2.Text = '' then
     begin
       ShowMessage('Favor informar a nota 2!');
       exit;
     end
  else
  if edNota3.Text = '' then
     begin
       ShowMessage('Favor informar a nota 3!');
       exit;
     end;

  try
    wNota1 := StrToFloat(edNota1.Text);
    wNota2 := StrToFloat(edNota2.Text);
    wNota3 := StrToFloat(edNota3.Text);

    if wNota1 > 10  then
       begin
         MessageDlg('Favor informar a nota 1 menor que 10!', mtWarning, [mbOk], 0);
         exit;
       end
    else
    if wNota2 > 10then
       begin
         MessageDlg('Favor informar a nota 2 menor que 10!', mtWarning, [mbOk], 0);
         exit;
       end
    else
    if wNota3 > 10 then
       begin
         MessageDlg('Favor informar a nota 3 menor que 10!', mtWarning, [mbOk], 0);
         exit;
       end;

    wMedia := (wNota1 + wNota2 + wNota3) / 3;

    lbMedia.Caption := formatfloat('#0.00', wMedia);
    edMedia.Text    := formatfloat('#0.00', wMedia);
    mmMedia.Lines.Add('Média com as três notas: '+ formatfloat('#0.00', wMedia));
    frExercicio.Width := 571;

    lbMedia.Visible := true;
    edMedia.Visible := true;
    mmMedia.Visible := true;

    if wMedia >= 7 then
       MessageDlg('Aluno aprovado com sucesso.', mtConfirmation, [mbok], 0)
    else
       begin
         if MessageDlg('Aluno em reposição, deseja informar a nota da prova de reposição?', mtWarning, [mbYes, mbNo], 0) = mrYes then
            begin
              wFormReposicao := TfrReposicao.Create(nil);
              try
                wFormReposicao.Nota1 := wNota1;
                wFormReposicao.Nota2 := wNota2;
                wFormReposicao.Nota3 := wNota3;

                wFormReposicao.ShowModal;
              finally
                if Assigned(wFormReposicao) then
                   FreeAndNil(wFormReposicao);
              end;
            end
         else
            MessageDlg('Aluno reprovado!', mtWarning, [mbOK], 0)
       end;
  except
   on E:Exception do
     MessageDlg('Existem caracteres inválidos.' + #13#10#13#10 + 'Erro: ' + E.Message, mtWarning, [mbOK], 0)
  end;
end;

end.
