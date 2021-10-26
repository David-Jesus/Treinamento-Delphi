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
  wQtdInterUrbano            ,
  wContador                  : Integer;
  wValorEct                  ,
  wValorResidencial          ,
  wValorComercial            ,
  wValorMaiorConta           ,
  wTotalBrasilTelecom        ,
  wValorinterUrbano          ,
  wValorRural                : Currency;
  wTelefoneMaiorConta        ,
  wResult                    : String;

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
    wValorMaiorConta :=  TAssinante(fListaRegistros.Items[0]).ValorConta;
    while wContador <= (fListaRegistros.Count - 1) do
      begin

        wTotalBrasilTelecom  := wTotalBrasilTelecom + TAssinante(fListaRegistros.Items[wContador]).ValorConta;
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

        if TAssinante(fListaRegistros.Items[wContador]).ValorConta >= wValorMaiorConta then
           begin
             wValorMaiorConta    := TAssinante(fListaRegistros.Items[wContador]).ValorConta;
             wTelefoneMaiorConta := TAssinante(fListaRegistros.Items[wContador]).NumeroTelefone;
           end;

        wTotalTelegramas  := wTotalTelegramas + TAssinante(fListaRegistros.Items[wContador]).NumeroTelegramas;
        wQtdInterUrbano   :=  TAssinante(fListaRegistros.Items[wContador]).MinutosInterurbanos;
        wValorinterUrbano :=  wValorinterUrbano + TAssinante(fListaRegistros.Items[wContador]).ValorInterurbano;
        memoListaRegistro.Lines[wLines] := 'Número de telefone: ' + TAssinante(fListaRegistros.Items[wContador]).NumeroTelefone;
        Inc(wLines);
        memoListaRegistro.Lines[wLines] := 'Valor da conta: '  + FloatToStr(TAssinante(fListaRegistros.Items[wContador]).ValorConta);
        Inc(wLines);
        memoListaRegistro.Lines[wLines] := '';
        Inc(wLines);
        Inc(wContador);
      end;

    wValorEct :=  wTotalTelegramas * 1.55;
    wTotalBrasilTelecom := wTotalBrasilTelecom - wValorEct;

    memoResultado.Lines[1] := 'Total de telegramas: -------------' + IntToStr(wTotalTelegramas);
    memoResultado.Lines[2] := 'Total telefones Residenciais:----' + IntToStr(wTotalTelefonesResidenciais) + '---------valor: R$ ' + FloatToStr(wValorResidencial);
    memoResultado.Lines[3] := 'Total telefones Comerciais:------' + IntToStr(wTotalTelefoneComerciais) + '----------valor: R$ ' + FloatToStr(wValorComercial);
    memoResultado.Lines[4] := 'Total telefones Rurais:------------' + IntToStr(wTotalTefonesRurais) + '--------valor: R$'  + FloatToStr(wValorRural);
    memoResultado.Lines[5] := 'Total arrecado pela ECT:-------------------valorR$' + FloatToStr(wValorEct);
    memoResultado.Lines[6] := '';
    memoResultado.Lines[7] := 'Valor da maior conta: R$ ' + FloatToStr(wValorMaiorConta) + '    Telefone: ' + wTelefoneMaiorConta;
    memoResultado.Lines[8] := 'Valor arrecadado pela Brasil Telecom: R$ ' + FloatToStr(wTotalBrasilTelecom);
    memoResultado.Lines[9] := '';
    memoResultado.Lines[10] := 'Total de Iterurbano:---------' + IntToStr(wQtdInterUrbano) + '--minutos--valor: R$ ' + FloatToStr(wValorinterUrbano);

    wLines              := 0;
    wContador           := 0;
    wValorEct           := 0;
    wTotalTelegramas    := 0;
    wValorResidencial   := 0;
    wValorComercial     := 0;
    wValorRural         := 0;
    wValorMaiorConta    := 0;
    wTotalBrasilTelecom := 0;
    wTelefoneMaiorConta := '';
  end;

end.
