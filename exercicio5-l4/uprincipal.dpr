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
  wDataInicial := EncodeDateTime(2020, 1, 12, 9, 10, 15, 0);
  wDataFinal   := EncodeDateTime(2021, 1, 12, 9, 10, 15, 0);
  wAno          := YearOf(wDataInicial);
  wDia         := 13;
  wMes         := 1;
  wContador    := 0;

  try
    { TODO -oUser -cConsole Main : Insert code here }
    while wDataInicial <= wDataFinal do
      begin
        while wMes <= 12 do
          begin
            if AnsiCompareStr(Semana[DayOfTheWeek(EncodeDateTime(YearOf(wDataInicial), wMes, wDia, 0, 0, 0, 0))],'Sexta-Feira') = 0 then
            wContador := wContador + 1;

            wMes := wMes + 1;
          end;
      wAno := wAno + 1;
      wDataInicial := EncodeDateTime(wAno, 1, 12, 9, 10, 15, 0);
      wMes := 1;
      end;
      Writeln( ' Contador: ' + IntToStr(wContador));
    Readln; //Deixa o console aberto at� que seja clicado qualquer tecla
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;



end.



