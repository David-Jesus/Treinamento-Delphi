program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Const
wDez     : array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
wDezenas : array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta','Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
wUnidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
wCentenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');

var
  wValor          ,
  unidade         ,
  dezena          ,
  milhar          ,
  wtexto          ,
  centena         ,
  centavos        ,
  wAuxiliar       : String;

  wValorLido      : Real;
  wCentavo        : Integer;

begin
  Writeln('Digite um valor de 1  9999');
  Readln(wValorLido);
  wValor   := FloatToStr(trunc(wValorLido));
  wCentavo := round(frac(wValorLido) * 100);
  try
    { TODO -oUser -cConsole Main : Insert code here }

    if (StrToFloat(wValor) <= 9999.99) and (StrToFloat(wValor) > 0) then
      begin
        if Length(wValor) = 1 then
           begin
             unidade := wUnidades[StrToInt(wValor[1])];
             milhar  := '';
             dezena  := '';
             centena := '';
           end
        else
          if Length(wValor) = 2 then
             begin
               if (wValor[1] = '1') and (wValor[2] <> '0') then
                  dezena :=  wDez[StrToInt(wValor[2])]
               else
                 begin
                   if wValor[2] = '0' then
                      dezena :=  wDezenas[StrToInt(wValor[1])]
                   else
                     dezena :=  wDezenas[StrToInt(wValor[1])] + ' e ';
               end;
            if (wValor[2] <> '') and (wValor[2] <> '0')  then
               begin
                 if (wValor[2] = '0') then
                    unidade := wUnidades[StrToInt(wValor[2])]
                 else
                   unidade := '';
               end;

             end
          else
            if Length(wValor) = 3 then
               begin
                 if (wValor[1] <> '') and (StrToInt(wValor) > 99) then
                    centena := wCentenas[StrToInt(wValor[1])] + ' e ';

                 if (wValor[2] = '1') and (wValor[3] <> '0') then
                    dezena :=  wDez[StrToInt(wValor[3])]
                 else
                   begin
                     if (wValor[3] = '0') then
                          dezena :=  wDezenas[StrToInt(wValor[2])]
                     else
                       begin
                         unidade := wUnidades[StrToInt(wValor[3])];
                         dezena  := wDezenas[StrToInt(wValor[2])] + ' e ';
                       end;

                   end
                end
        else
          begin
            if (wValor[1] <> '') and (StrToInt(wValor) > 999) then
               milhar := wUnidades[StrToInt(wValor[1])] + ' mil ';

            if (wValor[2] <> '') then
              centena := wCentenas[StrToInt(wValor[2])] + ' e ';

            if (wValor[3] = '1') and (wValor[4] <> '0') then
               dezena :=  wDez[StrToInt(wValor[4])]
            else
              if (wValor[3] = '0') and (wValor[2] = '0') and  (wValor[4] = '0') then
                  begin
                    unidade := '';
                    dezena  := '';
                    centena := '';
                  end
            else
              begin
                if wValor[4] = '0' then
                   dezena :=  wDezenas[StrToInt(wValor[3])]
                else
                  begin
                    unidade := wUnidades[StrToInt(wValor[4])];
                    dezena :=  wDezenas[StrToInt(wValor[3])] + ' e ';
                  end;
              end;
          end;

         if (wCentavo <> 0) then
            begin
              centavos := IntToStr(wCentavo);
              wAuxiliar := centavos;

              if (wAuxiliar[1] = '1') and (wAuxiliar[2] <> '0') then
                 centavos :=  wDez[StrToInt(centavos[2])]
              else
                begin
                  if wAuxiliar[2] = '0' then
                     centavos :=  wDezenas[StrToInt(centavos[1])]
                  else
                    begin
                      centavos :=  wDezenas[StrToInt(centavos[1])] + ' e ';
                      centavos := centavos + wUnidades[StrToInt(wAuxiliar[2])];
                    end;
                end;
         end;

        if milhar  <>  '' then
           wtexto := wtexto + milhar;
        if centena <> '' then
           wtexto := wtexto + centena;
        if dezena  <> '' then
           wtexto := wtexto + dezena;
        if unidade <> '' then
           wtexto := wtexto + unidade + ' reais ';
        if centavos <> '' then
           wtexto := wtexto + 'e ' + centavos + ' centavos';
        Writeln(wtexto);
      end
    else
      begin
        Writeln('Informe um valor maior que 0 e menor que 9.999,99');
      end;
    Writeln('Pressione Enter para sair');
    Readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.