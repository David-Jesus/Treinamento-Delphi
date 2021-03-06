program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  wNumeroLido: String;
  wNumero    ,
  wContador  ,
  wSoma      : Integer;
begin
  while True do
    begin
      Writeln('Digite um n?mero para verificar se ele ? perfeito:');
      Readln(wNumeroLido);
      Writeln('');

      try
        if TryStrToInt(wNumeroLido, wNumero) then
           begin
             wNumero   := StrToInt(wNumeroLido);
             wContador := 1;
             wSoma     := 0;
             while (wContador < wNumero) do
               begin
                 if (wNumero mod wContador = 0) then
                    wSoma := wSoma + wContador;

                 wContador := wContador + 1;
               end;

             if (wSoma =  wNumero) then
                Writeln(IntToStr(wNumero) + ' ? perfeito!')
             else
                Writeln(IntToStr(wNumero) + ' n?o ? perfeito!');

             Writeln('Digite Enter para sair.');
             Readln;
             Break;
           end
        else
           begin
             Writeln('');
             Writeln('Digite apenas n?meros!');
             Writeln('');
           end;

      except
       on E: Exception do
       Writeln('Digite apenas n?meros!');
      end;
    end;
end.
