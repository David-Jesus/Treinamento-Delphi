unit uFiltro;

interface
  uses Classes,  Dialogs, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, listaPessoa, Vcl.StdCtrls, Pessoa;

  function  filtro(prListaPessoas: TList; prSexo, prEstadoCivil: String) : String;

  procedure verificaFiltro(prPessoa : TPessoa);
//    procedure verificaFiltro(prLista : Tlist);
//
implementation

uses  upesquisa;

Var
  wResultado: String;
  wContador              ,
  wContadorLoop          ,
  wMaiorIdade            ,
  wMenorIdade            ,
  wQtdPessoas            ,
  wIdadeAComparar        ,
  wQtdPessoasResponderam ,
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
  wMemoResult       : TMemo;
  wPessoa           : TPessoa;


function  filtro(prListaPessoas: TList; prSexo, prEstadoCivil: String) : String;
  begin
    wSoma             := 0;
    wContador              := 0;
    wResultado             := '';
    wContador              := 0;
    wContadorLoop          := 0;
    wMaiorIdade            := 0;
    wMenorIdade            := 0;
    wQtdPessoas            := 0;
    wIdadeAComparar        := 0;
    wQtdPessoasResponderam := 0;
    wQtdPessoasSalarip500  := 0;
    wQtdPessoasFaixa19     := 0;
    wQtdPessoasFaixa29     := 0;
    wQtdPessoasFaixa39     := 0;
    wQtdPessoasFaixa49     := 0;
    wQtdPessoasFaixa59     := 0;
    wQtdPessoasFaixa69     := 0;
    wQtdPessoasFaixa79     := 0;
    wQtdPessoasFaixa89     := 0;
    wQtdPessoasFaixaAcima89:= 0;

    while (wContador <= prListaPessoas.Count - 1) do
      begin
        if (prSexo <> '') and (prEstadoCivil <> '') then
           begin
             if (CompareStr(Tpessoa(prListaPessoas.Items[wContador]).sexo, prSexo) = 0) and (CompareStr(Tpessoa(prListaPessoas.Items[wContador]).estadoCivil, prEstadoCivil) = 0) then
                begin
                  wPessoa :=  Tpessoa(prListaPessoas.Items[wContador]);
                  verificaFiltro(wPessoa);
//                    verificaFiltro(prListaPessoas);
                end;
           end
        else
        if (prSexo <> '') and (prEstadoCivil <> '') then
           begin
             if (CompareStr(Tpessoa(prListaPessoas.Items[wContador]).sexo, prSexo) = 0) or (CompareStr(Tpessoa(prListaPessoas.Items[wContador]).estadoCivil, prEstadoCivil) = 0) then
                begin
                  wPessoa :=  Tpessoa(prListaPessoas.Items[wContador]);
                  verificaFiltro(wPessoa);
//                  verificaFiltro(prListaPessoas);
                end;
           end
        else
           begin
             wPessoa :=  Tpessoa(prListaPessoas.Items[wContador]);
             verificaFiltro(wPessoa);
           end;

           wContador := wContador + 1;

      end;
     wMediaSalario        := wSoma /  wContador;

     wResultado := wResultado + #13 +'Média de salário dentre os registros:--------------------------- R$' + FloatToStr(wMediaSalario);
     wResultado := wResultado + #13#13 + 'Maior  idade dentre os registros:-------------------------------- ' + IntToStr(wMaiorIdade) + ' anos';
     wResultado := wResultado + #13 +'Menor idade dentre os registros:-------------------------------- ' + IntToStr(wMenorIdade)  + ' anos';
     wResultado := wResultado + #13#13 +'Quantidade de pessoas com salário até R$500,00------------- ' + IntToStr(wQtdPessoasSalarip500);
     wResultado := wResultado + #13#13 +'Quantidade de pessoas que responderam à pesquisa:---------' + IntToStr(wQtdPessoasResponderam);
     wResultado := wResultado + #13#13 +'Quantidade de pessoas na faixa etária (00-19) anos:--------- ' + IntToStr(wQtdPessoasFaixa19);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (20-29) anos:--------- ' + IntToStr(wQtdPessoasFaixa29);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (30-39) anos:--------- ' + IntToStr(wQtdPessoasFaixa39);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (40-49) anos:--------- ' + IntToStr(wQtdPessoasFaixa49);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (50-59) anos:--------- ' + IntToStr(wQtdPessoasFaixa59);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (60-69) anos:--------- ' + IntToStr(wQtdPessoasFaixa69);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (70-79) anos:--------- ' + IntToStr(wQtdPessoasFaixa79);
     wResultado := wResultado + #13 +'Quantidade de pessoas na faixa etária (80-89) anos:--------- ' + IntToStr(wQtdPessoasFaixa89);
     wResultado := wResultado + #13 + 'Quantidade de pessoas na faixa etária acima de (89) anos:-  ' + IntToStr(wQtdPessoasFaixaAcima89);
     wContador := wContador + 1;


    if wQtdPessoasResponderam > 0 then
       Result := wResultado
    else
       Result := 'Sem resultados para este filtro.';

  end;

procedure verificaFiltro(prPessoa : TPessoa);
  begin

    if wQtdPessoasResponderam = 0 then
       begin
         wMaiorIdade       := prPessoa.idade;
         wMenorIdade       := prPessoa.idade;
       end;

    wSoma             := wSoma  + prPessoa.salario;
    wIdadeAComparar   := prPessoa.idade;
    wSalarioAComparar := prPessoa.salario;

    if (prPessoa.idade > wMaiorIdade) then
    wMaiorIdade  := prPessoa.idade;

    if (prPessoa.idade) < wMenorIdade then
    wMenorIdade  := prPessoa.idade;

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

  wQtdPessoasResponderam := wQtdPessoasResponderam + 1;

end;

end.
