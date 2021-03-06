unit uValidaCaractere;

interface

function validaCaractere(const prCaractere: Char) : String;

implementation

uses SysUtils;

var
  wResultado : Boolean;

function validaCaractere(const prCaractere : Char) : String;
  begin
    if prCaractere in ['A'..'Z'] then
       begin
         wResultado := (prCaractere <> '') and ((prCaractere = 'A') or (prCaractere = 'E') or (prCaractere = 'I') or (prCaractere = 'O') or (prCaractere = 'U'));
         if wResultado then
            Result := 'O caractere informado ? do tipo: Vogal'
         else
            Result := 'O caractere informado ? do tipo: Consoante';
       end
    else
    if prCaractere in ['0'..'9'] then
       Result := 'O caractere informado ? um n?mero'
    else
       Result := 'O caractere informado ? um caractere especial'
  end;

end.
