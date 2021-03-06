program uprincipal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Const
  cDez     : array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  cDezenas : array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta','Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  cUnidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
  cCentenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');

var
  wValor           ,
  wUnidade         ,
  wDezena          ,
  wMilhar          ,
  wTexto           ,
  wCentena         ,
  wCentavos        ,
  wAuxiliar        : String;
  wValorLido       : Real;
  wCentavo         : Integer;

begin
  Writeln('Digite um valor de 1  9999.99');
  Readln(wValorLido);
  wValor   := FloatToStr(trunc(wValorLido));
  wCentavo := round(frac(wValorLido) * 100);
  try
    if (StrToFloat(wValor) <= 9999.99) and (wValorLido > 0) then
       begin
          if (Length(wValor) = 1) and (StrToInt(wValor) > 0) then
             begin
               wUnidade := cUnidades[StrToInt(wValor[1])];
               wMilhar  := '';
               wDezena  := '';
               wCentena := '';
             end
          else
             if Length(wValor) = 2 then
                begin
                  if (wValor[1] = '1') and (wValor[2] <> '0') then
                     wDezena :=  cDez[StrToInt(wValor[2])]
                  else
                     begin
                       if wValor[2] = '0' then
                          wDezena :=  cDezenas[StrToInt(wValor[1])]
                       else
                          wDezena :=  cDezenas[StrToInt(wValor[1])] + ' e ';
                       wUnidade := cUnidades[StrToInt(wValor[2])]
                     end;
                end
             else
                if Length(wValor) = 3 then
                   begin
                     if (wValor[1] <> '') and (StrToInt(wValor) > 99) then
                        wCentena := cCentenas[StrToInt(wValor[1])] + ' e ';

                     if (wValor[2] = '1') and (wValor[3] <> '0') then
                        wDezena :=  cDez[StrToInt(wValor[3])]
                     else
                        begin
                          if (wValor[3] = '0') then
                             wDezena :=  cDezenas[StrToInt(wValor[2])]+ ' reais '
                          else
                             begin
                               wUnidade := cUnidades[StrToInt(wValor[3])];
                               wDezena  := cDezenas[StrToInt(wValor[2])] + ' e ';
                             end;
                     end
         end
         else
            begin
              if (wValor[1] <> '') and (StrToInt(wValor) > 999) then
                 wMilhar := cUnidades[StrToInt(wValor[1])] + ' mil ';

              if (wValor[2] <> '') then
                wCentena := cCentenas[StrToInt(wValor[2])] + ' e ';

              if (wValor[3] = '1') and (wValor[4] <> '0') then
                 wDezena :=  cDez[StrToInt(wValor[4])]
              else
                 if (wValor[3] = '0') and (wValor[2] = '0') and  (wValor[4] = '0') then
                    begin
                      wUnidade := '';
                      wDezena  := '';
                      wCentena := '';
                    end
                 else
                    begin
                      if wValor[4] = '0' then
                         wDezena :=  cDezenas[StrToInt(wValor[3])]
                      else
                         if (wValor[1] <> '0') then
                            begin
                              wUnidade := cUnidades[StrToInt(wValor[4])];
                              wDezena :=  cDezenas[StrToInt(wValor[3])] + ' e ';
                            end;
                    end;
         end;

         if (wCentavo <> 0) then
            begin
              wCentavos := IntToStr(wCentavo);
              wAuxiliar := wCentavos;

              if wAuxiliar[2] = '' then
                 wCentavos := cUnidades[StrToInt(wAuxiliar[1])]
              else
                 begin
                   if (wAuxiliar[1] = '1') and (wAuxiliar[2] <> '0') then
                      wCentavos :=  cDez[StrToInt(wCentavos[2])]
                   else
                     begin
                       if wAuxiliar[2] = '0' then
                          wCentavos :=  cDezenas[StrToInt(wCentavos[1])]
                       else
                          begin
                            wCentavos :=  cDezenas[StrToInt(wCentavos[1])] + ' e ';

                            if wAuxiliar[2] = '' then
                               wCentavos := ''
                            else
                               wCentavos := wCentavos + cUnidades[StrToInt(wAuxiliar[2])];
                          end;
                     end;
                 end;
            end;

         if wMilhar  <>  '' then
            wTexto := wTexto + wMilhar;
         if wCentena <> '' then
            wTexto := wTexto + wCentena;
         if wDezena  <> '' then
            wTexto := wTexto + wDezena;
         if wUnidade <> '' then
            wTexto := wTexto + wUnidade+ ' reais e ';
         if wCentavos <> '' then
            wTexto := wTexto  + '' + wCentavos + ' centavos';
         Writeln('');
         Writeln(wTexto);
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
