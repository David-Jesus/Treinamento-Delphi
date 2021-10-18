unit uValidaCaractere;

interface

function validaCaractere(const wCaractere: Char) : String;

implementation



uses SysUtils;

var
  wCaractere: Char; //Vari�vel que receber� o caractere informado pelo usu�rio
  wResultado : Boolean;

function validaCaractere(const wCaractere : Char) : String;
  begin
    if wCaractere in ['A'..'Z'] then
       begin
         wResultado := (wCaractere <> '') and ((wCaractere = 'A') or (wCaractere = 'E') or (wCaractere = 'I') or (wCaractere = 'O') or (wCaractere = 'U'));
         if wResultado then
            Result := 'O caractere informado � do tipo: Vogal'
         else
           Result := 'O caractere informado � do tipo: Consoante';
       end
    else
      if wCaractere in ['0'..'9'] then
         Result := 'O caractere informado � um n�mero'
      else
         Result := 'O caractere informado � um caractere especial'
end;

end.