unit uEnviaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uHTTPComCertificadoBase;

type
  TfrEnvioEmail = class(TForm)
    Edit1: TEdit;
    btEnviar: TButton;
    edEmail: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btEnviarClick(Sender: TObject);
  private
    FTeste      ,
    FValidaEnvio: String;
    FHTTP  : THTTPComCertificadoBase;
    procedure OnSelecionarColaborador(var prData: String);
    procedure OnLogado(var prData: String);
    procedure OnSeTFiltro(var prData: String);
    procedure OnSelecionarPessoa(var prData: String);
    procedure OnSalvarFiltro(var prData: String);
    procedure OnEnviarEmai(var prData: String);
  public
    { Public declarations }
    constructor Create(prFHTTP : THTTPComCertificadoBase);
  end;

var
  frEnvioEmail: TfrEnvioEmail;

implementation

{$R *.dfm}

procedure TfrEnvioEmail.btEnviarClick(Sender: TObject);
  begin
    try
        //Requisição para abrir a tela de envio de e-mail;
        FHTTP.OnAntesEnviarRequisicao := OnLogado;
        FHTTP.AbrirRequisicao('http://intranet.sci.com.br/cleanGrid.php?source=mailSend.php');
        FHTTP.EnviarRequisicao;

        FHTTP.OnAntesEnviarRequisicao := OnSelecionarColaborador;

        //Requisição que abre a tela de seleção de pessoas
        try
          FHTTP.AbrirRequisicao('http://intranet.sci.com.br/selecionarColaborador.php?campo=destinatarios&form=mailForm');
          FHTTP.EnviarRequisicao;
        finally
          FHTTP.OnAntesEnviarRequisicao := nil;
        end;

        FHTTP.OnAntesEnviarRequisicao := OnSeTFiltro;

        //Reqquisição que faz a pesquisa pelo nome
        try
          FHTTP.AbrirRequisicao('http://intranet.sci.com.br/setFilter.php?novoMetodo=1', tprPOST);
          FHTTP.EnviarRequisicao;

          FTeste := Copy(FHTTP.ResponseText, Pos('lucas', FHTTP.ResponseText), Pos('lucas', FHTTP.ResponseText));
          FTeste := Copy(FTeste, 1, Pos(',', FTeste)-2);

        finally
          FHTTP.OnAntesEnviarRequisicao := nil;
        end;

        FHTTP.OnAntesEnviarRequisicao := OnSelecionarPessoa;

        //Requisição que seleciona a pessoa filtrada - checkbox que fica ao lado do nome
        try
          FHTTP.AbrirRequisicao('http://intranet.sci.com.br/setSessionFiltro.ajax.php', tprPOST);
          FHTTP.EnviarRequisicao;
        finally
          FHTTP.OnAntesEnviarRequisicao := nil;
        end;

        FHTTP.OnAntesEnviarRequisicao := OnSalvarFiltro;

        //Requisição que confirma a pessoa selecionada e seta o email que será enviado
        try
          FHTTP.AbrirRequisicao('http://intranet.sci.com.br/selecionarColaborador.php?acao=salvar');
          FHTTP.EnviarRequisicao;
        finally
          FHTTP.OnAntesEnviarRequisicao := nil;
        end;

        FHTTP.OnAntesEnviarRequisicao := OnEnviarEmai;

      finally
//        FHTTP.OnAntesEnviarRequisicao := nil;
      end;

      //Requisição que faz o envio do e-mail com as informações preenchidas nos imputs;
      try
        FHTTP.AbrirRequisicao('http://intranet.sci.com.br/mailSendDo.php', tprPOST);
        FHTTP.EnviarRequisicao;

        FValidaEnvio := Copy(FHTTP.ResponseText, Pos('Mensagem enviada com Sucesso!!!', FHTTP.ResponseText), MaxInt);

        if (FValidaEnvio.Length > 0) then
           begin
             ShowMessage('Email enviado com sucesso!');
             Edit1.Text   := '';
             edEmail.text := '';
           end

        else
           ShowMessage('Erro ao encaminhar o e-mail!');

      finally
        FHTTP.OnAntesEnviarRequisicao := nil;
      end;
    end;

constructor TfrEnvioEmail.Create(prFHTTP: THTTPComCertificadoBase);
  begin
    inherited Create(nil);
    FHTTP :=  prFHTTP;
  end;


procedure TfrEnvioEmail.OnSelecionarColaborador(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/selecionarColaborador.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');
  end;

procedure TfrEnvioEmail.OnLogado(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/logado.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');
  end;

procedure TfrEnvioEmail.OnSeTFiltro(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Cache-Control', 'max-age=0');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('Origin', 'http://intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/selecionarColaborador.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

                                                             //Filtro por nome
    prData := 'source=%2FselecionarColaborador.php&fCodigo=&fNome=Lucas+Are&fCidade=&uf=&depto=&fDataIni=&fTipo=&fGrupoUsuario=';
  end;

procedure TfrEnvioEmail.OnSelecionarPessoa(var prData: String);
  begin
   //Após Fazer o filtro parâmetros para fazer a seleção da pessoa - Post
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Origin', 'http://intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', '*/*');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/selecionarColaborador.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'linhaId=87425&email=' + FTeste;
  end;

procedure TfrEnvioEmail.OnSalvarFiltro(var prData: String);
  begin
   //Após Selecionar o Filtro - Parâmetros para salvar a escolha - Confirmar
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/selecionarColaborador.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');
  end;

procedure TfrEnvioEmail.OnEnviarEmai(var prData: String);
  begin
   //Após Confirmar o Filtro Realizar o envio do e-mail pelo - Post
    FHTTP.SetaRequestHeader('Host', 'intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Proxy-Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('Cache-Control', 'max-age=0');
    FHTTP.SetaRequestHeader('Upgrade-Insecure-Requests', '1');
    FHTTP.SetaRequestHeader('Origin', 'http://intranet.sci.com.br');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36');
    FHTTP.SetaRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3');
    FHTTP.SetaRequestHeader('Referer', 'http://intranet.sci.com.br/mailSend.php');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'destinatarios='+ FTeste +'%3B&assunto='+ edEmail.Text +'&mensagem='+ Edit1.Text;
  end;


end.
