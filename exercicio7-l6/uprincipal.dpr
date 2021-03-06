program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  wNumeroLidoUm       ,
  wNumeroLidoDois     ,
  wOpcaoLida          : String;
  wNrGolsTimeUm       ,
  wNrGolsTimeDois     ,
  wOpcao              ,
  wNrVitoriasTimeUm   ,
  wNrVitoriasTimeDois ,
  wNrGrenais          ,
  wEmpates            ,
  wContador           : Integer;
begin
  Writeln('|-----------------------------------------------|');
  Writeln('|Sistema para c?lculo de estast?sticas de jogos:|');
  Writeln('|-----------------------------------------------|');
  Writeln('');
  wNrGolsTimeUm       := 0;
  wNrGolsTimeDois     := 0;
  wNrVitoriasTimeUm   := 0;
  wNrVitoriasTimeDois := 0;
  wEmpates            := 0;
  wNrGrenais          := 0;

  while True do
    begin

      repeat
        Writeln('Digite o n?mero de gols marcados pelo time Inter:');
        Readln(wNumeroLidoUm);
        Writeln('');
        if not (TryStrToInt(wNumeroLidoUm, wNrGolsTimeUm)) then
           Writeln('Digite apenas n?meros!');

      until TryStrToInt(wNumeroLidoUm, wNrGolsTimeUm);


      repeat
        Writeln('Digite o n?mero de gols marcados pelo time Gr?mio:');
        Readln(wNumeroLidoDois);
        Writeln('');
        if not TryStrToInt(wNumeroLidoDois, wNrGolsTimeDois) then
           Writeln('Digite apenas n?meros!');

      until TryStrToInt(wNumeroLidoDois, wNrGolsTimeDois);

      try
        wNrGrenais := wNrGrenais + 1;
        wNrGolsTimeUm   := StrToInt(wNumeroLidoUm);
        wNrGolsTimeDois := StrToInt(wNumeroLidoDois);

        if (wNrGolsTimeUm > wNrGolsTimeDois) then
           wNrVitoriasTimeUm := wNrVitoriasTimeUm + 1
        else
          if wNrGolsTimeDois > wNrGolsTimeUm then
             wNrVitoriasTimeDois := wNrVitoriasTimeDois + 1

        else
          wEmpates := wEmpates + 1;

        Writeln('Novo Grenal?');
        Writeln('1 - Sim');
        Writeln('2 - N?o');
        Readln(wOpcaoLida);

        if not (TryStrToInt(wOpcaoLida, wOpcao)) or (StrToInt(wOpcaoLida) > 2) then
           begin
             repeat
               Writeln('Digite apenas n?meros e op??es "1" ou "2"!');
               Writeln('');
               Writeln('Novo Grenal?');
               Writeln('1 - Sim');
               Writeln('2 - N?o');
               Readln(wOpcaoLida);
               if (StrToInt(wOpcaoLida) > 2) or (StrToInt(wOpcaoLida) < 1) then
                  wOpcaoLida := 'x';

             until TryStrToInt(wOpcaoLida, wOpcao);
           end;

           wOpcao := StrToInt(wOpcaoLida);

        if (wOpcao = 2) then
           begin
             Writeln('N?meros de Grenais informados--------: ' + IntToStr(wNrGrenais));
             Writeln('N?mero de vit?rias do Inter----------: ' + IntToStr(wNrVitoriasTimeUm));
             Writeln('N?mero de vit?rias do Gr?mio---------: ' + IntToStr(wNrVitoriasTimeDois));
             Writeln('N?mero de Empates: ' + IntToStr(wEmpates));
             Writeln('');

             if (wNrVitoriasTimeUm > wNrVitoriasTimeDois) then
                Writeln('O Inter venceu o maior n?mero de grenais')
             else
               if (wNrVitoriasTimeDois > wNrVitoriasTimeUm) then
                  Writeln('O Gr?mio venceu o maior n?mero de grenais')
               else
                 Writeln('N?o houve vencedor');

             Writeln('');
             Writeln('Digite Enter para sair.');
             Readln;
             Exit;
           end;

      except
       on E: Exception do
      end;
    end;
end.
