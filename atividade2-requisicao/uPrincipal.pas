unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uHTTPComCertificadoBase, uEnviaEmail;

type
  TForm1 = class(TForm)
    edLogin: TLabeledEdit;
    edSenha: TLabeledEdit;
    btLogar: TButton;
    procedure btLogarClick(Sender: TObject);
    procedure OnAcessarEmail(var prData: String);

  private
    FTeste : String;
    FHTTP  : THTTPComCertificadoBase;
    procedure OnAntesLogin(var prData: String);
    procedure OnLogado(var prData: String);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  wFrEnviaEmail : TfrEnvioEmail;

implementation

{$R *.dfm}


procedure TForm1.btLogarClick(Sender: TObject);
  begin
    try
      FHTTP := THTTPComCertificadoBase.Create(nil);
      FHTTP.ProxyHost := '192.168.10.1';
      FHTTP.ProxyPorta := 3128;

      FHTTP.AbrirRequisicao('http://intranet.sci.com.br/index.php');
      FHTTP.EnviarRequisicao;

      FHTTP.OnAntesEnviarRequisicao := OnAntesLogin;

      try
        FHTTP.AbrirRequisicao('http://Intranet.sci.com.br/loginCheck.php', tprPOST);
        FHTTP.EnviarRequisicao;
      finally
        FHTTP.OnAntesEnviarRequisicao := nil;
      end;

      try
        FHTTP.AbrirRequisicao('http://intranet.sci.com.br/logado.php');
        FHTTP.OnAntesEnviarRequisicao := OnLogado;
        FHTTP.EnviarRequisicao;

        FTeste := Copy(FHTTP.ResponseText, Pos('Usuário:', FHTTP.ResponseText), MaxInt);
        FTeste := Copy(FTeste, Pos('b', FTeste), Pos('</b>', FTeste));
        FTeste := Copy(FTeste,  (Pos('b', FTeste) + 2), Pos('</b>', FTeste)-3);

        if (CompareStr(FTeste, edLogin.Text) = 0) then
           begin
             try
               wFrEnviaEmail := TfrEnvioEmail.Create(FHTTP);
               wFrEnviaEmail.ShowModal;
             finally
               if Assigned(wFrEnviaEmail) then
                  FreeAndNil(wFrEnviaEmail);
             end;
           end
        else
           begin
             ShowMessage('Erro, usuário ou senha incorretos!');
             Exit;
           end;
      finally
        FHTTP.OnAntesEnviarRequisicao := nil;
      end;
    finally
      FreeAndNil(FHTTP);
    end;
  end;

procedure TForm1.OnLogado(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
  end;

procedure TForm1.OnAntesLogin(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'www.sc.inf.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Cache-Control', 'max-age=0');
    FHTTP.SetaRequestHeader('Origin', 'http://www.sc.inf.br');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://www.sc.inf.br/intranet/index.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'xheight=1040&tipo=&tipoId=&url_redirecionado=&login='+edLogin.Text+'&pwd='+edSenha.text;
  end;

procedure TForm1.OnAcessarEmail(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/logado.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');
  end;

end.
