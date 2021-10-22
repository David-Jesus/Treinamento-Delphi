unit uFiltro;

interface
  uses Classes,  Dialogs, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, listaPessoa, Vcl.StdCtrls;

  function  filtro(prListaPessoas: TList; prSexo, prEstadoCivil: String) : String;

implementation

uses Pessoa, upesquisa;

Var
  wResultado: String;
  wContador              ,
  wContadorLoop          ,
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
  wMemoResult       : TMemo;


function  filtro(prListaPessoas: TList; prSexo, prEstadoCivil: String) : String;
  begin
    wContador    := 0;
    wResultado   := '';
    for wContadorLoop := 0 to (prListaPessoas.Count - 1) do
      begin

        if (prSexo <> '') and (prEstadoCivil <> '') then
           begin
//             while (prSexo <> Tpessoa(prListaPessoas.Items[wContadorLoop]).sexo) and (prEstadoCivil <> Tpessoa(prListaPessoas.Items[wContadorLoop]).estadoCivil) do
             while True do
               begin

               if (prSexo = Tpessoa(prListaPessoas.Items[wContadorLoop]).sexo) and (prEstadoCivil = Tpessoa(prListaPessoas.Items[wContadorLoop]).estadoCivil) then
                 Break
               else
                  wContador := wContador + 1;

                 if wContador = prListaPessoas.Count then
                     break;
               end;

           end;

           if wContador >= prListaPessoas.Count then
              begin
                wResultado := '';
                break;
              end
           else
              begin
                 while (wContador <= prListaPessoas.Count - 1) do
                   begin
                     wSoma        := 0;
                     wMaiorIdade  := Tpessoa(prListaPessoas.Items[0]).idade;
                     wMenorIdade  := Tpessoa(prListaPessoas.Items[0]).idade;
                     wSoma             := wSoma  + (Tpessoa(prListaPessoas.Items[wContador]).salario);
                     wIdadeAComparar   := Tpessoa(prListaPessoas.Items[wContador]).idade;
                     wSalarioAComparar := Tpessoa(prListaPessoas.Items[wContador]).salario;

                     if (Tpessoa(prListaPessoas.Items[wContador]).salario) > wMaiorIdade then
                        wMaiorIdade  := Tpessoa(prListaPessoas.Items[wContador]).idade;

                     if (Tpessoa(prListaPessoas.Items[wContador]).salario) < wMenorIdade then
                        wMenorIdade  := Tpessoa(prListaPessoas.Items[wContador]).idade;

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


                     wMediaSalario        := wSoma /  prListaPessoas.Count;

                     wResultado := wResultado + #13 +'Média de salário dentre os registros:--------------------------- R$' + FloatToStr(wMediaSalario);
                     wResultado := wResultado + #13#13 + 'Maior  idade dentre os registros:-------------------------------- ' + IntToStr(wMaiorIdade) + ' anos';
                     wResultado := wResultado + #13 +'Menor idade dentre os registros:-------------------------------- ' + IntToStr(wMenorIdade)  + ' anos';
                     wResultado := wResultado + #13#13 +'Quantidade de pessoas com salário até R$500,00------------- ' + IntToStr(wQtdPessoasSalarip500);
                     wResultado := wResultado + #13#13 +'Quantidade de pessoas que responderam à pesquisa:---------' + IntToStr(prListaPessoas.Count);
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
                   end;
              end;
        end;

    if wResultado <> '' then
       Result := wResultado
    else
       Result := 'Se resultados para este filtro.';

  end;


{ TFiltro }

end.
