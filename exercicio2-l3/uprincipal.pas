unit uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listaPessoa, Vcl.StdCtrls,
  Vcl.ExtCtrls, uFiltro;

type
  TfrPesquisa = class(TForm)
   btAdicionar: TButton;
   edIdade: TLabeledEdit;
   edSalario: TLabeledEdit;
   rbViuvo: TRadioButton;
   rbCasado: TRadioButton;
   rbSolteiro: TRadioButton;
   rbDivorciado: TRadioButton;
   rdgSexo: TRadioGroup;
   btPesquisa: TButton;
   lbCivil: TLabel;
   lbTotal: TLabel;
   lbTotalValor: TLabel;
   procedure btAdicionarClick(Sender: TObject);
   procedure btPesquisaClick(Sender: TObject);
   procedure FormCreate(Sender: TObject);

  private
    fIdade        : Integer;
    fSexo         ,
    fEstadoCivil  : String;
    fSalario      : Currency;
    FLista        : TList;

  public

  end;

var
  frPesquisa : TfrPesquisa;

implementation

{$R *.dfm}

uses upesquisa, Pessoa;

var
  wFormPesquisa : TfrmPesquisa;
  fPessoa       : TPessoa;

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

      fPessoa         := TPessoa.Create;
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
           fPessoa.estadoCivil := 'Viúvo';
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

      FLista.Add(fPessoa);
      MessageDlg('Adicionado com sucesso!!', mtConfirmation, [mbOK], 0);
      lbTotalValor.Caption := IntToStr(FLista.Count);
  end;

procedure TfrPesquisa.btPesquisaClick(Sender: TObject);
  begin
    if FLista.Count = 0 then
       MessageDlg('Aida não há registro, necessário realizar o cadastro!', mtWarning, [mbOK], 0)
    else
       begin
         try
           wFormPesquisa  := TfrmPesquisa.Create(FLista);
           wFormPesquisa.ShowModal;
         finally
           if Assigned(wFormPesquisa) then
             begin
               FreeAndNil(wFormPesquisa);
            end;
         end;
       end;
  end;

procedure TfrPesquisa.FormCreate(Sender: TObject);
  begin
    FLista               := TList.Create;
    lbTotalValor.Caption := IntToStr(FLista.Count);
    lbTotalValor.Visible := true;
  end;

end.
