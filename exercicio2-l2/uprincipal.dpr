program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  wTeste          : Double;
  wEntrada        : String; //Vari?vel que receber? a entrada do teclado do usu?rio
  wSoma           ,
  wMaior          ,
  wMenor          ,
  wContador       ,
  wQtdVezesMaior  ,
  wQtdVezesMenor  ,
  wTentativas     : Integer;
  wMedia          : Currency;
  wNumeros        : array[0..4] of Integer;


begin
  wTentativas := 3;
  wContador   := 0;
  wMenor      := 0;
  wMaior      := 0;
  Writeln('|-------------------------------------------------------------------------------------|');
  Writeln('|Sistema Para calcular a m?dia, mostrar o maior e menor n?mero de 5 valores informados|');
  Writeln('|Digite "0" (zero) a qualquer momento para sair                                       |');
  Writeln('|-------------------------------------------------------------------------------------|');
  WriteLn('');
  while True do
    begin
      Write('Digite um valor maior que "0" (zero):');
      Readln(wEntrada);
      if (wTentativas = 1) or (wEntrada = '0') then
         begin
           if wTentativas = 1 then
              Writeln('Voc? excedeu o n?mero m?ximo de tentativas, programa finalizado.')
           else
              Writeln('Programa finalizado.');

           Writeln('Pressione Enter para sair');
           Readln;
           Exit;
         end;

      if (TryStrToFloat(wEntrada, wTeste)) and (StrToInt(wEntrada) > 0) then
         begin
           wNumeros[wContador] := StrToInt(wEntrada);
           wTentativas := 4;
           wContador := wContador + 1;
           if (wContador = Length(wNumeros)) then
              Break;
         end
      else
         begin
           wTentativas := wTentativas - 1;
           WriteLn('');
           Write('Digite apenas n?meros positivos, voc? tem: ' + IntToStr(wTentativas) + ' tentativas');
           Writeln;
           WriteLn('');
         end;
    end;

  wContador := 0;
  wQtdVezesMenor := 0;
  wQtdVezesMaior := 0;
  wMaior := wNumeros[0];
  wMenor := wNumeros[0];

  while wContador <= (Length(wNumeros) -1 ) do
    begin
      if wNumeros[wContador] > wMaior then
         begin
           wMaior := wNumeros[wContador];
         end
      else
         if wNumeros[wContador] < wMenor then
            wMenor := wNumeros[wContador];

      wContador := wContador + 1;
    end;

  wContador := 0;
  wSoma     := 0;
  while wContador <= (Length(wNumeros) -1 ) do
    begin
      wSoma := wSoma + wNumeros[wContador];
      if wNumeros[wContador] = wMaior then
         wQtdVezesMaior := wQtdVezesMaior + 1;
      if wNumeros[wContador]  = wMenor then
         wQtdVezesMenor := wQtdVezesMenor + 1;

      wContador := wContador + 1;
    end;

  wMedia := wSoma / Length(wNumeros);

  WriteLn(''); //Pula uma linha dentro da janela console
  Writeln('Menor n?mero iformado: ' + IntToStr(wMenor) + '   foi informado: ' + IntToStr(wQtdVezesMenor) + '  vezes');
  Writeln('Maior n?mero iformado: ' + IntToStr(wMaior) + '   foi informado: ' + IntToStr(wQtdVezesMaior) + '  vezes');
  Writeln;

  Writeln('Resultado da m?dia do n?meros informados: ' + CurrToStr(wMedia));
  WriteLn('Pressione Enter para sair');
  ReadLn;
end.
