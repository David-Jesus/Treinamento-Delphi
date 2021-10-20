program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
var
  wNotasCem         ,
  wNotasCinquenta   ,
  wNotasVinte       ,
  wNotasDez         ,
  wNotasDois        ,
  wMoedasUmReal     ,
  wMoedasCinquenta  ,
  wMoedasVinteCinco ,
  wMoedasDez        ,
  wMoedasCinco      ,
  wMoedasUmCentavo  : Integer;
  wValor            ,
  wValorDecimal     : Integer;
  wValorLido        : Real;
begin
  Writeln('Digite um valor acima de 0 (zero): ' );
  Readln(wValorLido);

  if wValorLido <= 0 then
     begin
       Writeln('Informe um valor maior que 0 (zero)!');
       Writeln('Pressione Enter para sair');
       Readln;
       Exit;
     end;
  wValor := Trunc(wValorLido);
  wValorDecimal := round(frac(wValorLido) * 100);
  try
    { TODO -oUser -cConsole Main : Insert code here }
    wNotasCem       := Trunc(wValor / 100);
    wValor          := wValor mod 100;
    wNotasCinquenta := Trunc(wValor / 50);
    wValor          := wValor mod 50;
    wNotasVinte     := Trunc(wValor / 20);
    wValor          := wValor mod 20;
    wNotasDez       := Trunc(wValor / 10);
    wValor          := wValor mod 10;
    wNotasDois      := Trunc(wValor / 2);
    wValor          := wValor mod 2;

    if wValorDecimal > 0 then
       begin
         if wValorDecimal >= 100 then
            begin
              wMoedasUmReal     := Trunc(wValorDecimal / 100);
              wValorDecimal     := wValorDecimal mod 1;
            end;

         if wValorDecimal >= 50 then
            begin
              wMoedasCinquenta  := Trunc(wValorDecimal / 50);
              wValorDecimal     := wValorDecimal mod 50;
            end;

         if wValorDecimal >= 25 then
            begin
              wMoedasVinteCinco := Trunc(wValorDecimal / 25);
              wValorDecimal     := wValorDecimal mod 25;
            end;
         if wValorDecimal >= 10 then
            begin
              wMoedasDez        := Trunc(wValorDecimal / 10);
              wValorDecimal     := wValorDecimal mod 10;
            end;
         if wValorDecimal >= 5 then
            begin
              wMoedasCinco      := Trunc(wValorDecimal / 5);
              wValorDecimal     := wValorDecimal mod 5;
            end;
         if wValorDecimal >= 1   then
            begin
              wMoedasUmCentavo  := Trunc(wValorDecimal / 1);
            end;
       end;

    Writeln('Notas  de----100: ' + IntToStr(wNotasCem));
    Writeln('Notas  de-----50: ' + IntToStr(wNotasCinquenta));
    Writeln('Notas  de-----20: ' + IntToStr(wNotasVinte));
    Writeln('Notas  de-----10: ' + IntToStr(wNotasDez));
    Writeln('Notas  de------2: ' + IntToStr(wNotasDois));
    Writeln('Moedas de------1: ' + IntToStr(wMoedasUmReal));
    Writeln('Moedas de---0.50: ' + IntToStr(wMoedasCinquenta));
    Writeln('Moedas de---0.25: ' + IntToStr(wMoedasVinteCinco));
    Writeln('Moedas de---0.10: ' + IntToStr(wMoedasDez));
    Writeln('Moedas de---0.01: ' + IntToStr(wMoedasUmCentavo));
    Writeln('Diite Enter para sair');
    Readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
