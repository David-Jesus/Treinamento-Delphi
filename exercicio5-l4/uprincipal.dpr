program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  DateUtils;

Const
 Semana: array[1..7] of string = ('Segunda-Feira','Ter�a-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sabado', 'Domingo');
var
  wDia     ,
  wMes     ,
  wAno     ,
  wContador,
  dias_ano : Integer;
  wDataInicial,
  wDataFinal  : TDateTime;

begin
  wDataInicial := EncodeDateTime(2021, 1, 12, 9, 10, 15, 0);
  wDataFinal   := EncodeDateTime(2021, 1, 12, 9, 10, 15, 0);
  wAno          := YearOf(wDataInicial);
  wDia         := 13;
  wMes         := 1;
  wContador    := 0;

  // vamos obter a quantidade de dias para o

  // ano de 2010



  // exibe o resultado


  try
    { TODO -oUser -cConsole Main : Insert code here }
//    dias_ano := DaysInAYear(ano);
//    Writeln('O ano informado cont�m ' + IntToStr(31 mod 4));
//    Writeln('Dia m�s ' + Semana[DayOfTheWeek(Now)]);
//    Writeln('Dia m�s ' + Semana[DayOfTheWeek(EncodeDateTime(2010, 1, 12, 9, 10, 15, 0))]);
//    Writeln('Dia m�s ' + IntToStr(DayOf(EncodeDateTime(2010, 1, 12, 9, 10, 15, 0))));
    while wDataInicial <= wDataFinal do
      begin
        while wMes <= 12 do
          begin
//            Writeln('M�s ' + IntToStr(wMes) + ' ' + Semana[DayOfTheWeek(EncodeDateTime(YearOf(wDataInicial), wMes, wDia, 0, 0, 0, 0))]);
            if AnsiCompareStr(Semana[DayOfTheWeek(EncodeDateTime(YearOf(wDataInicial), wMes, wDia, 0, 0, 0, 0))],'Sexta-Feira') = 0 then
            wContador := wContador + 1;

            wMes := wMes + 1;
          end;
//      Writeln('Dat 1: ' + DateToStr(wDataInicial) + 'Data 2: ' + DateToStr(wDataFinal));
      wAno := wAno + 1;
      wDataInicial := EncodeDateTime(wAno, 1, 12, 9, 10, 15, 0);
      wMes := 1;
      end;
      Writeln( ' Contador: ' + IntToStr(wContador));
//    while wMes <= 12 do
//      begin
//        Writeln('M�s ' + IntToStr(wMes) + ' ' + Semana[DayOfTheWeek(EncodeDateTime(2020, wMes, wDia, 0, 0, 0, 0))]);
//        wMes := wMes + 1;
//      end;
//      Writeln('Dat 1: ' + DateToStr(wDataInicial) + 'Data 2: ' + DateToStr(wDataFinal));
    Readln; //serve para deixa o console aberto at� que seja clicado qualquer tecla
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;



end.


