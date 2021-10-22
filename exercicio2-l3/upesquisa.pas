unit upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listaPessoa, Vcl.StdCtrls, Pessoa,
  Vcl.Grids, Vcl.ExtCtrls;

type
  TfrmPesquisa = class(TForm)
    lbTeste: TLabel;
    mmResultado: TMemo;
    rdgSexoFiltro: TRadioGroup;
    rdgEstadoCivilFiltro: TRadioGroup;
    btFiltrar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);

  private
    FListaPessoas: TList;

  public
    constructor Create(prListaPessoa : TList);
    property ListaPessoas : TList read FListaPessoas write FListaPessoas;
  end;

var
  frmPesquisa            : TfrmPesquisa;
  wContador              ,
  wMaiorIdade            ,
  wMenorIdade            ,
  wQtdPessoas            ,
  wIdadeAComparar        ,
  wQtdPessoasSalarip500  ,
  wQtdPessoasFaixa19     ,
  wQtdPessoasFaixa29     ,
  wQtdPessoasFaixa39     ,
  wQtdPessoasFaixa49     ,
  wQtdPessoasFaixa59     ,
  wQtdPessoasFaixa69     ,
  wQtdPessoasFaixa79     ,
  wQtdPessoasFaixa89     ,
  wQtdPessoasFaixaAcima89: Integer;
  wSoma             ,
  wMediaSalario     ,
  wSalarioAComparar : Currency;
  wSexo             ,
  wEstadoCivil      : String;

implementation

{$R *.dfm}

uses uFiltro;

{ TForm1 }


constructor TfrmPesquisa.Create(prListaPessoa: TList);
  begin
    inherited create(nil);
    FListaPessoas := TList.Create;
    if prListaPessoa <> nil then
       FListaPessoas := prListaPessoa;
  end;   

procedure TfrmPesquisa.btFiltrarClick(Sender: TObject);
  begin
    ShowMessage('Teste');

    if (rdgSexoFiltro.ItemIndex = 0) then
       wSexo := 'Mulher'
    else
    if (rdgSexoFiltro.ItemIndex = 1) then
       wSexo := 'Mulher'
    else
       wSexo := '';

    if (rdgEstadoCivilFiltro.ItemIndex = 0) then
           wEstadoCivil := 'Casado'

      else
      if (rdgEstadoCivilFiltro.ItemIndex = 1)then
           wEstadoCivil := 'viuvo'
      else
      if  (rdgEstadoCivilFiltro.ItemIndex = 2) then
            wEstadoCivil := 'Solteiro'
      else
      if (rdgEstadoCivilFiltro.ItemIndex = 3) then
          wEstadoCivil  := 'Divorciado'
      else
         wEstadoCivil  := 'Divorciado';
         
    ShowMessage(filtro(FListaPessoas, wSexo, wEstadoCivil));
  end;
    
procedure TfrmPesquisa.FormCreate(Sender: TObject);
    
  begin
    if FListaPessoas <> nil then
       begin
         wContador    := 0;
         wSoma        := 0;
         wMaiorIdade  := Tpessoa(FListaPessoas.Items[0]).idade;
         wMenorIdade  := Tpessoa(FListaPessoas.Items[0]).idade;

         for wContador := 0 to (FListaPessoas.Count - 1) do
           begin
             wSoma             := wSoma  + (Tpessoa(FListaPessoas.Items[wContador]).salario);
             wIdadeAComparar   := Tpessoa(FListaPessoas.Items[wContador]).idade;
             wSalarioAComparar := Tpessoa(FListaPessoas.Items[wContador]).salario;

             if (Tpessoa(FListaPessoas.Items[wContador]).salario) > wMaiorIdade then
                wMaiorIdade  := Tpessoa(FListaPessoas.Items[wContador]).idade;

             if (Tpessoa(FListaPessoas.Items[wContador]).salario) < wMenorIdade then
                wMenorIdade  := Tpessoa(FListaPessoas.Items[wContador]).idade;

             if (wIdadeAComparar <= 19) then
                wQtdPessoasFaixa19 := wQtdPessoasFaixa19 + 1;

             if (wIdadeAComparar > 19) and (wIdadeAComparar <= 29 ) then
                wQtdPessoasFaixa29 := wQtdPessoasFaixa29 + 1;

             if (wIdadeAComparar > 29) and (wIdadeAComparar <= 39 ) then
                wQtdPessoasFaixa39 := wQtdPessoasFaixa39 + 1;

             if (wIdadeAComparar > 39) and (wIdadeAComparar <= 49 ) then
                wQtdPessoasFaixa49 := wQtdPessoasFaixa49 + 1;

             if (wIdadeAComparar > 49) and (wIdadeAComparar <= 59 ) then
                wQtdPessoasFaixa59 := wQtdPessoasFaixa59 + 1;

             if (wIdadeAComparar > 59) and (wIdadeAComparar <= 69 ) then
                wQtdPessoasFaixa69 := wQtdPessoasFaixa69 + 1;

             if (wIdadeAComparar > 69) and (wIdadeAComparar <= 79 ) then
                wQtdPessoasFaixa79 := wQtdPessoasFaixa79 + 1;

             if (wIdadeAComparar > 79) and (wIdadeAComparar <= 89 ) then
                wQtdPessoasFaixa89 := wQtdPessoasFaixa89 + 1;

             if (wIdadeAComparar > 89) then
                wQtdPessoasFaixaAcima89 := wQtdPessoasFaixaAcima89 + 1;

             if wSalarioAComparar <= 500 then
                wQtdPessoasSalarip500 := wQtdPessoasSalarip500 + 1;
           end;

         wMediaSalario        := wSoma /  FListaPessoas.Count;

         mmResultado.Lines[0]  := 'Média de salário dentre os registros:----------------------------- R$' + FloatToStr(wMediaSalario);
         mmResultado.Lines[2]  := 'Maior  idade dentre os registros:---------------------------------- ' + IntToStr(wMaiorIdade) + ' anos';
         mmResultado.Lines[3]  := 'Menor idade dentre os registros:---------------------------------- ' + IntToStr(wMenorIdade)  + ' anos';
         mmResultado.Lines[5]  := 'Quantidade de pessoas com salário até R$500,00------------- ' + IntToStr(wQtdPessoasSalarip500);
         mmResultado.Lines[7]  := 'Quantidade de pessoas que responderam à pesquisa:-------- ' + IntToStr(FListaPessoas.Count);
         mmResultado.Lines[9]  := 'Quantidade de pessoas na faixa etária (00-19) anos:--------- ' + IntToStr(wQtdPessoasFaixa19);
         mmResultado.Lines[10] := 'Quantidade de pessoas na faixa etária (20-29) anos:--------- ' + IntToStr(wQtdPessoasFaixa29);
         mmResultado.Lines[11] := 'Quantidade de pessoas na faixa etária (30-39) anos:--------- ' + IntToStr(wQtdPessoasFaixa39);
         mmResultado.Lines[12] := 'Quantidade de pessoas na faixa etária (40-49) anos:--------- ' + IntToStr(wQtdPessoasFaixa49);
         mmResultado.Lines[13] := 'Quantidade de pessoas na faixa etária (50-59) anos:--------- ' + IntToStr(wQtdPessoasFaixa59);
         mmResultado.Lines[14] := 'Quantidade de pessoas na faixa etária (60-69) anos:--------- ' + IntToStr(wQtdPessoasFaixa69);
         mmResultado.Lines[15] := 'Quantidade de pessoas na faixa etária (70-79) anos:--------- ' + IntToStr(wQtdPessoasFaixa79);
         mmResultado.Lines[16] := 'Quantidade de pessoas na faixa etária (80-89) anos:--------- ' + IntToStr(wQtdPessoasFaixa89);
         mmResultado.Lines[17] := 'Quantidade de pessoas na faixa etária acima de (89) anos:-- ' + IntToStr(wQtdPessoasFaixaAcima89);
         mmResultado.ReadOnly := True;
       end;
  end;

end.
