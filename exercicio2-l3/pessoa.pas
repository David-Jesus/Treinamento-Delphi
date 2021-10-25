unit Pessoa;

interface
  Type
    TPessoa = class
     private
       FestadoCivil : String;
       Fsalario     : Currency;
       Fidade       : Integer;
       Fsexo        : String;

     public
       property idade       : Integer  read Fidade       write Fidade;
       property sexo        : String   read Fsexo        write Fsexo;
       property salario     : Currency read Fsalario     write Fsalario;
       property estadoCivil : String   read FestadoCivil write FestadoCivil;

end;

implementation

{ TPessoa }

end.
