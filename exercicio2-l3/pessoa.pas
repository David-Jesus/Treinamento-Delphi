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
//       constructor Create(prIdade : Integer; prSexo, prEstadoCivil : String;prSalario : Currency);
       property idade       : Integer  read Fidade       write Fidade;
       property sexo        : String   read Fsexo        write Fsexo;
       property salario     : Currency read Fsalario     write Fsalario;
       property estadoCivil : String   read FestadoCivil write FestadoCivil;

end;

implementation

{ TPessoa }

{ TPessoa }

//constructor TPessoa.Create(prIdade: Integer; prSexo, prEstadoCivil: String; prSalario: Currency);
//  begin
////    inherited create(nil);
//    Fidade        := prIdade;
//    Fsexo         := prSexo;
//    Fsalario      := prSalario;
//    FestadoCivil  := prEstadoCivil;
//  end;

end.
