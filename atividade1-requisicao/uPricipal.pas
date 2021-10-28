unit uPricipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uHTTPComCertificadoBase;

type
  TForm1 = class(TForm)
    edEntrada: TEdit;
    Verificar: TButton;
    mmResult: TMemo;
    procedure VerificarClick(Sender: TObject);
  private
    { Private declarations }
    FHTTP  :  THTTPComCertificadoBase;
    FTeste ,
    FResult: String;
    FContador : Integer;
    procedure OnVerificar(var prData: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.VerificarClick(Sender: TObject);
  begin
    FContador := 0;
    try
      FHTTP := THTTPComCertificadoBase.Create(nil);
      FHTTP.ProxyHost := '127.0.0.1';
      FHTTP.ProxyPorta := 8888;

     FHTTP.OnAntesEnviarRequisicao := OnVerificar;
      try
        FHTTP.AbrirRequisicao('https://www.google.com/search?q=' + edEntrada.Text +'&rlz=1C1GCEU_pt-BRBR975BR975&oq=peixe&aqs=chrome.0.69i59j0i433i512j46i199i433i457i465i512j0i402j0i433i512j46i340i433i512j46i433i512j46i131i433i512j46i340i433i512j46i10i340i433.3671j1j7&sourceid=chrome&ie=UTF-8');

        FHTTP.EnviarRequisicao;
        FTeste := Copy(FHTTP.ResponseText, Pos('class="yuRUbf"><a href="', FHTTP.ResponseText), MaxInt);

        while FContador < 3 do
          begin
            FResult := Copy(FTeste, Pos('"https:', FTeste), Pos('data-', fTeste));
            FResult := Copy(FResult, Pos('"https:', FResult), Pos('data', FResult) - 1);
            mmResult.Lines[FContador] := FResult;
            Inc(FContador);
            Delete(FTeste, 1, FResult.Length);
            FTeste := Copy(FTeste, Pos('class="yuRUbf"><a href="', FTeste), MaxInt);
          end;

      finally
        FHTTP.OnAntesEnviarRequisicao := nil;
      end;

    finally
      FreeAndNil(FHTTP);
    end;

  end;

procedure TForm1.OnVerificar(var prData: String);
begin
  FHTTP.SetaRequestHeader('Host', 'www.google.com');
  FHTTP.SetaRequestHeader('Connection', 'keep-alive');
  FHTTP.SetaRequestHeader('Cache-Control', 'max-age=0');
  FHTTP.SetaRequestHeader('sec-ch-ua', '"Google Chrome";v="95", "Chromium";v="95", ";Not A Brand";v="99"');
  FHTTP.SetaRequestHeader('sec-ch-ua-mobile', '?O');
  FHTTP.SetaRequestHeader('sec-ch-ua-platform', '"Windows"');
  FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
  FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
  FHTTP.SetaRequestHeader('Sec-Fetch-Site', 'same-origin');
  FHTTP.SetaRequestHeader('Sec-Fetch-Mode', 'navigate');
  FHTTP.SetaRequestHeader('Sec-Fetch-User', '?1');
  FHTTP.SetaRequestHeader('Sec-Fetch-Dest', 'document');
  FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

end;


end.
