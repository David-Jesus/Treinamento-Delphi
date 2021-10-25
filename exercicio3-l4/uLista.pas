unit uLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAssinante;

type
  TListaRegistros = class(TForm)
    memoResultado: TMemo;
    memoListaRegistro: TMemo;
    procedure FormCreate(Sender: TObject);

  private
    fListaRegistros : Tlist;
  public
    constructor create(prListaRegistros : TList);
  end;

var
  Form1                      : TListaRegistros;
  wTotalTelegramas           ,
  wTotalTelefonesResidenciais,
  wTotalTelefoneComerciais   ,
  wTotalTefonesRurais        ,
  wLines                     ,
  wContador                  : Integer;
  wValorEct                  ,
  wValorResidencial          ,
  wValorComercial            ,
  wValorMaiorConta           ,
  wValorRural                : Currency;
  wTelefoneMaiorConta        : String;

implementation

{$R *.dfm}

{ TListaRegistros }

constructor TListaRegistros.create(prListaRegistros: TList);
  begin
    inherited  create(nil);
    fListaRegistros := prListaRegistros;
  end;

procedure TListaRegistros.FormCreate(Sender: TObject);
  begin
    wValorEct :=  fListaRegistros.Count * 1.55;
    while wContador <= (fListaRegistros.Count - 1) do
       begin
         wValorMaiorConta :=  TAssinante(fListaRegistros.Items[0]).ValorConta;
         if CompareStr(TAssinante(fListaRegistros.Items[wContador]).TipoTelefone, 'Residencial') = 0 then
            begin
              wTotalTelefonesResidenciais := wTotalTelefonesResidenciais + 1;
              wValorResidencial := wValorResidencial + TAssinante(fListaRegistros.Items[wContador]).ValorConta;
            end
         else
         if CompareStr(TAssinante(fListaRegistros.Items[wContador]).TipoTelefone, 'Comercial') = 0 then
            begin
              wTotalTelefoneComerciais := wTotalTelefoneComerciais + 1;
              wValorComercial := wValorComercial + TAssinante(fListaRegistros.Items[wContador]).ValorConta;
            end
         else
            begin
              wtotalTefonesRurais := wtotalTefonesRurais + 1;
              wValorRural := wValorRural +  TAssinante(fListaRegistros.Items[wContador]).ValorConta;
            end;

         if TAssinante(fListaRegistros.Items[wContador]).ValorConta > wValorMaiorConta then
            begin
              wValorMaiorConta    := TAssinante(fListaRegistros.Items[wContador]).ValorConta;
              wTelefoneMaiorConta := TAssinante(fListaRegistros.Items[wContador]).NumeroTelefone;
            end;


         wTotalTelegramas := wTotalTelegramas +  TAssinante(fListaRegistros.Items[wContador]).NumeroTelegramas;

         memoListaRegistro.Lines[wLines] := 'Número de telefone' + TAssinante(fListaRegistros.Items[wContador]).NumeroTelefone;
         wLines := wLines + 1;
         memoListaRegistro.Lines[wLines] :=  'Valor da conta: '  + FloatToStr(TAssinante(fListaRegistros.Items[wContador]).ValorConta);
         wLines := wLines + 1;
         memoListaRegistro.Lines[wLines] := '';
         wLines := wLines + 1;
         wContador := wContador + 1;

       end;

//       memoListaRegistro.Lines[0] := 'Número de telefone' + TAssinante(fListaRegistros.Items[0]).NumeroTelefone;
//       memoListaRegistro.Lines[1] :=  'Valor da conta: '  + FloatToStr(TAssinante(fListaRegistros.Items[0]).ValorConta);
//       memoListaRegistro.Lines[2] := '';
       memoResultado.Lines[1] :=  'Total de telegramas: ' + IntToStr(wTotalTelegramas);
       memoResultado.Lines[2] := 'Total arrecado pela ECT:      ' + FloatToStr(wValorEct);
       memoResultado.Lines[3] := 'Total telefones Residenciais: ' + IntToStr(wTotalTelefonesResidenciais) + '   valor: R$' + FloatToStr(wValorResidencial);
       memoResultado.Lines[4] := 'Total telefones Comerciais:   ' + IntToStr(wTotalTelefoneComerciais) + '      valor: R$' + FloatToStr(wValorComercial);
       memoResultado.Lines[5] := 'Total telefones Rurais:       ' + IntToStr(wTotalTefonesRurais) + '           valor: R$' + FloatToStr(wValorRural);
       memoResultado.Lines[6] := '';
       memoResultado.Lines[7] := 'Valor da maior conta: R$ ' + FloatToStr(wValorMaiorConta) + '           Telefone: ' + wTelefoneMaiorConta;


  end;

end.
