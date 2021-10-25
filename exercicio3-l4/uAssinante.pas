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
        fMinutosIterurbanoComercial,
        fServicosDespertador       ,
        fNumeroTelegramas          : Integer;
        fValorConta                : Currency;
      public
        property NumeroTelefone             : String   read fNumeroTelefone write fNumeroTelefone;
        property TipoTelefone               : String   read fTipoTelefone write fTipoTelefone;
        property MinutosLocais              : Integer  read fMinutosLocais write fMinutosLocais;
        property MinutosLocaisComercial     : Integer  read fMinutosLocaisComercial write fMinutosLocaisComercial;
        property MinutosInterurbanos        : Integer  read fMinutosInterurbanos write fMinutosInterurbanos;
        property MinutosIterurbanoComercial : Integer  read fMinutosIterurbanoComercial write fMinutosIterurbanoComercial;
        property ServicosDespertador        : Integer  read fServicosDespertador write fServicosDespertador;
        property NumeroTelegramas           : Integer  read fNumeroTelegramas write fNumeroTelegramas;
        property ValorConta                 : Currency read fValorConta write fValorConta;


  end;

implementation

end.
