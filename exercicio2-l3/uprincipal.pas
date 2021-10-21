unit uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listaPessoa, Pessoa, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrPesquisa = class(TForm)
    btAdicionar: TButton;
    edIdade: TLabeledEdit;
    Label1: TLabel;
    edSalario: TLabeledEdit;
    rbViuvo: TRadioButton;
    rbCasado: TRadioButton;
    Label2: TLabel;
    rbSolteiro: TRadioButton;
    rbDivorciado: TRadioButton;
    btPesquisa: TButton;
    rdgSexo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);

  private
    { Private declarations }
    fListaPessoas : TListaPessoa;
    fIdade        : Integer;
    fSexo,
    fEstadoCivil  : String;
    fSalario      : Currency;
    fPessoa : TPessoa;

  public
    { Public declarations }
  end;

var
  frPesquisa : TfrPesquisa;
//  tPessoa    : TPessoa;

implementation

{$R *.dfm}


procedure TfrPesquisa.btAdicionarClick(Sender: TObject);

  begin
    if (edIdade.Text = '') then
       begin
         MessageDlg('Favor preencher a "Idade".' + #13#10#13#10, mtWarning, [mbOK], 0);
         Exit;
       end
    else
    if  (edSalario.Text = '') then
       begin
         MessageDlg('Favor preencher o "Salário".' + #13#10#13#10, mtWarning, [mbOK], 0);
         Exit;
       end
    else
    if (rdgSexo.ItemIndex <> 0) and (rdgSexo.ItemIndex <> 1) then
       begin
         MessageDlg('Favor selecionar um sexo.' + #13#10#13#10, mtWarning, [mbOK], 0);
         Exit;
       end
    else
    if (not rbCasado.Checked) and (not rbViuvo.Checked) and (not rbSolteiro.Checked) and (not rbDivorciado.Checked) then
       begin
         MessageDlg('Favor selecionar um estado civil.' + #13#10#13#10, mtWarning, [mbOK], 0);
         Exit;
       end;

    if (TryStrToInt(edIdade.text, fIdade)) then
       begin
          if (StrToInt(edIdade.Text) < 0) or (StrToInt(edIdade.Text) > 150) then
             begin
               MessageDlg('Informe uma idade válida.' + #13#10#13#10, mtWarning, [mbOK], 0);
               Exit;
             end;
       end
    else
       begin
         MessageDlg('Informe apenas números na idade.' + #13#10#13#10, mtWarning, [mbOK], 0);
         Exit;
       end;

    if (TryStrToCurr(edSalario.text, fSalario)) then
       begin
         if (StrToCurr(edSalario.Text) < 0) then
            begin
               MessageDlg('Informe um salário válido.' + #13#10#13#10, mtWarning, [mbOK], 0);
               Exit;
            end;

       end
    else
       begin
         MessageDlg('Informe apenas números no salário.' + #13#10#13#10, mtWarning, [mbOK], 0);
         Exit;
       end;


    try
      fPessoa         := TPessoa.Create();
      fPessoa.idade   := StrToInt(edIdade.Text);
      fPessoa.salario := StrToCurr(edSalario.Text);

      edIdade.Text   := '';
      edSalario.Text := '';

      if (rdgSexo.ItemIndex = 0) then
         begin
           fPessoa.sexo := 'Mulher';
           rdgSexo.ItemIndex := -1;
         end

      else
         begin
           fPessoa.sexo := 'Homen';
           rdgSexo.ItemIndex := -1;
         end;

      if (rbCasado.Checked) then
         begin
           fPessoa.estadoCivil := 'Casado';
           rbCasado.Checked    := false;
         end
      else
      if (rbViuvo.Checked) then
         begin
           fPessoa.estadoCivil := 'viuvo';
           rbViuvo.Checked     := false;
         end
      else
      if  (rbSolteiro.Checked) then
         begin
            fPessoa.estadoCivil := 'Solteiro';
            rbSolteiro.Checked  := false;
         end
      else
         begin
           fPessoa.estadoCivil  := 'Divorciado';
           rbDivorciado.Checked := false;
         end;

      fListaPessoas.Adicionar(fPessoa);

      ShowMessage('Adicionado com sucesso!');
      ShowMessage(IntToStr(fListaPessoas.Count));
    finally
      if Assigned(fPessoa) or Assigned(fListaPessoas) then
         begin
//           FreeAndNil(fPessoa);
//           FreeAndNil(fListaPessoas);
         end;

    end;




     ShowMessage('Passou.');
  end;

procedure TfrPesquisa.FormCreate(Sender: TObject);
  begin
    FListaPessoas := TListaPessoa.Create;
  end;




end.
