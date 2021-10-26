unit uAssinante;

interface
  Type
    TAssinante = class
      private
        fNumeroTelefone            ,
        fTipoTelefone              : String;
        fMinutosLocais             ,
        fMinutosLocaisComercial    ,
        fMinutosInterurbanos       ,
        fServicosDespertador       ,
        fNumeroTelegramas          : Integer;
        fValorInterurbano          ,
        fValorConta                : Currency;
      public
        property NumeroTelefone             : String   read fNumeroTelefone write fNumeroTelefone;
        property TipoTelefone               : String   read fTipoTelefone write fTipoTelefone;
        property MinutosLocais              : Integer  read fMinutosLocais write fMinutosLocais;
        property MinutosLocaisComercial     : Integer  read fMinutosLocaisComercial write fMinutosLocaisComercial;
        property MinutosInterurbanos        : Integer  read fMinutosInterurbanos write fMinutosInterurbanos;
        property ServicosDespertador        : Integer  read fServicosDespertador write fServicosDespertador;
        property NumeroTelegramas           : Integer  read fNumeroTelegramas write fNumeroTelegramas;
        property ValorInterurbano           : Currency read fValorInterurbano write fValorInterurbano;
        property ValorConta                 : Currency read fValorConta write fValorConta;
  end;

implementation

end.
