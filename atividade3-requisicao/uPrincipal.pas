unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHTTPComCertificadoBase,
  Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    btEnviar       : TButton;
    mskCNPJ: TMaskEdit;
    procedure btEnviarClick(Sender: TObject);
  private
    FHTTP  : THTTPComCertificadoBase;
    FNaoLocalizado ,
    FCnpj          ,
    FReportid      ,
    FLinkPDF       : string;
    procedure OnEnviarCNPJ(var prData: String);
    procedure OnVerificarLinkPdf(var prData: String);
    procedure OnValida(var prData: String);
    procedure OnValidaReport(var prData: String);
//    procedure OnPdf(var prData: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btEnviarClick(Sender: TObject);
  begin
    try
      FHTTP := THTTPComCertificadoBase.Create(nil);
      FHTTP.ProxyHost := '127.0.0.1';
      FHTTP.ProxyPorta := 8888;

      FCnpj := Copy(mskCNPJ.Text, 1 , 10);
      FCnpj := FCnpj + '%2F';
      FCnpj := FCnpj + Copy(mskCNPJ.Text, 12,18);

      FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/cdweb/resource.faces?params=5gBpKlU08so=');
      FHTTP.EnviarRequisicao;

    finally
      FHTTP.OnAntesEnviarRequisicao := nil;
    end;

    try
      FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/rel_cndcontribuinte.faces');
      FHTTP.EnviarRequisicao;

    finally
      FHTTP.OnAntesEnviarRequisicao := nil;
    end;


    FHTTP.OnAntesEnviarRequisicao := OnEnviarCNPJ;

     try
    FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/rel_cndcontribuinte.faces', tprPOST);
    FHTTP.EnviarRequisicao;

    FNaoLocalizado := Copy(FHTTP.ResponseText, Pos('Foi', FHTTP.ResponseText), Pos('div', FHTTP.ResponseText) -2);
    FNaoLocalizado := Copy(FNaoLocalizado, 1, Pos('div', FNaoLocalizado) -3);
    FHTTP.OnAntesEnviarRequisicao := nil;
    finally
      FHTTP.OnAntesEnviarRequisicao := nil;
    end;

    if FNaoLocalizado.Length > 0 then
       begin
         ShowMessage('Foi constatado que o CPF/CNPJ informado não consta em nossa base de dados, no entanto você pode emitir a "Certidão negativa de contribuinte não cadastrado", apenas informando o seu nome/razão social');
         Exit;
       end
    else
       begin
         FHTTP.OnAntesEnviarRequisicao := OnValida;
         //Pegar o report  Pegou o report corretamente.
          try
         FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/report', tprPOST);
         FHTTP.EnviarRequisicao;
         FHTTP.OnAntesEnviarRequisicao := nil;

         FReportid := Copy(FHTTP.ResponseText, Pos('reportId', FHTTP.ResponseText) + 10, FHTTP.ResponseText.Length);
         FReportid := Copy(FReportid, 1, FReportid.Length - 3);
         finally
           FHTTP.OnAntesEnviarRequisicao := nil;
         end;


         FHTTP.OnAntesEnviarRequisicao := OnVerificarLinkPdf;
         Sleep(100);
         try
         FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/report', tprPOST);
         FHTTP.EnviarRequisicao;

         FLinkPDF := Copy(FHTTP.ResponseText, Pos('null', FHTTP.ResponseText) + 7, MaxInt);
         FLinkPDF := Copy(FLinkPDF, 1, FLinkPDF.Length - 6);
         finally
           FHTTP.OnAntesEnviarRequisicao := nil;
         end;

         try
           FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/'+ FLinkPDF);
           FHTTP.EnviarRequisicao;
         finally
           FHTTP.OnAntesEnviarRequisicao := nil;
         end;

         FCnpj          := '';
         FNaoLocalizado := '';
         FReportid      := '';
         FLinkPDF       := '';
         mskCNPJ.Text   := '';
         ShowMessage('PDF Gerado com sucesso!');
       end;
    FreeAndNil(FHTTP);
    Exit;
  end;


procedure TForm1.OnEnviarCNPJ(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('sec-ch-ua',  '"Google Chrome";v="95", "Chromium";v="95", ";Not A Brand";v="99"');
    FHTTP.SetaRequestHeader('Accept', 'application/xml, text/xml, */*; q=0.01');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    FHTTP.SetaRequestHeader('X-Requested-With', 'XMLHttpRequest');
    FHTTP.SetaRequestHeader('sec-ch-ua-mobile', '?0');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36');
    FHTTP.SetaRequestHeader('sec-ch-ua-platform', '"Windows"');
    FHTTP.SetaRequestHeader('Origin', 'https://e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Sec-Fetch-Site', 'same-origin');
    FHTTP.SetaRequestHeader('Sec-Fetch-Mode', 'cors');
    FHTTP.SetaRequestHeader('Sec-Fetch-Dest', 'empty');
    FHTTP.SetaRequestHeader('Referer', 'https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/rel_cndcontribuinte.faces');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'NEW_AJAX_MODE=true&AJAXREQUEST=j_id_jsp_1052421380_0&mainForm=mainForm&mainForm%3ArepParamsEncode=1r1Ugt'+'yvQctvS_slepk3wPXl44U7CLmhyBpBzShedmOY2ighmyrj05zL5Che2xQF&prevent_'+'autofill=&password_fake=&mainForm%3Acpf=&mainForm%3Acnpj='+ FCnpj +'&mainForm%3ArepType=zMa_DuBK1pOT6PbF6_McTzoefLSbKZmg&iContribuintes'+'=&codigoInterno=&recurso=EMISSAO_CND_CONTRIBUINTE&ipEmissao=177.101.105.1'+'57&iAutenticacao=&BETHA_SERIALIZABLE_DATA=bth0fb8358f-bf70-43e5-8320-d2e4810b76c7&javax.faces.ViewState=j_id2&jsf_tree=j_id2&jsf_viewid=%2Frel_cndcontribuinte.jsp&mainForm%3AbtCnpj=mainForm%3AbtCnpj&AJAX%3AEVENTS_COUNT=1&';
  end;

procedure TForm1.OnValida(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('sec-ch-ua',  '"Google Chrome";v="95", "Chromium";v="95", ";Not A Brand";v="99"');
    FHTTP.SetaRequestHeader('Accept', '*/*');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    FHTTP.SetaRequestHeader('X-Requested-With', 'XMLHttpRequest');
    FHTTP.SetaRequestHeader('sec-ch-ua-mobile', '?0');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36');
    FHTTP.SetaRequestHeader('sec-ch-ua-platform', '"Windows"');
    FHTTP.SetaRequestHeader('Origin', 'https://e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Sec-Fetch-Site', 'same-origin');
    FHTTP.SetaRequestHeader('Sec-Fetch-Mode', 'cors');
    FHTTP.SetaRequestHeader('Sec-Fetch-Dest', 'empty');
    FHTTP.SetaRequestHeader('Referer', ': https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/processrep.faces');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'prevent_autofill=&password_fake=&cpf=&cnpj=81.301.897%2F0001-95&repType=zMa_DuBK1pOT6PbF6_McTzoefLSbKZmg&iContribuintes=731&codigoInterno=731&recurso=EMISSAO_CND_CONTRIBUINTE&ipEmissao=177.101.105.157&iAutenticacao=&comprovacao=&finalidade=';
  end;

procedure TForm1.OnVerificarLinkPdf(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('sec-ch-ua',  '"Google Chrome";v="95", "Chromium";v="95", ";Not A Brand";v="99"');
    FHTTP.SetaRequestHeader('Accept', '*/*');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    FHTTP.SetaRequestHeader('X-Requested-With', 'XMLHttpRequest');
    FHTTP.SetaRequestHeader('sec-ch-ua-mobile', '?0');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36');
    FHTTP.SetaRequestHeader('sec-ch-ua-platform', '"Windows"');
    FHTTP.SetaRequestHeader('Origin', 'https://e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Sec-Fetch-Site', 'same-origin');
    FHTTP.SetaRequestHeader('Sec-Fetch-Mode', 'cors');
    FHTTP.SetaRequestHeader('Sec-Fetch-Dest', 'empty');
    FHTTP.SetaRequestHeader('Referer', ': https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/processrep.faces');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'repType=zMa_DuBK1pOT6PbF6_McTzoefLSbKZmg&reportId='+ FReportid;
  end;

procedure TForm1.OnValidaReport(var prData: String);
  begin
    FHTTP.SetaRequestHeader('Host', 'e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Connection', 'keep-alive');
    FHTTP.SetaRequestHeader('sec-ch-ua',  '"Google Chrome";v="95", "Chromium";v="95", ";Not A Brand";v="99"');
    FHTTP.SetaRequestHeader('Accept', '*/*');
    FHTTP.SetaRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    FHTTP.SetaRequestHeader('X-Requested-With', 'XMLHttpRequest');
    FHTTP.SetaRequestHeader('sec-ch-ua-mobile', '?0');
    FHTTP.SetaRequestHeader('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36');
    FHTTP.SetaRequestHeader('sec-ch-ua-platform', '"Windows"');
    FHTTP.SetaRequestHeader('Origin', 'https://e-gov.betha.com.br');
    FHTTP.SetaRequestHeader('Sec-Fetch-Site', 'same-origin');
    FHTTP.SetaRequestHeader('Sec-Fetch-Mode', 'cors');
    FHTTP.SetaRequestHeader('Sec-Fetch-Dest', 'empty');
    FHTTP.SetaRequestHeader('Referer', ': https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/processrep.faces');
    FHTTP.SetaRequestHeader('Accept-Language', 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7');

    prData := 'prevent_autofill=&password_fake=&cpf=&cnpj='+FCnpj+'&repType=zMa_DuBK1pOT6PbF6_McTzoefLSbKZmg&iContribuintes=731&codigoInterno=731&recurso=EMISSAO_CND_CONTRIBUINTE&ipEmissao=177.101.105.157&iAutenticacao=&comprovacao=&finalidade=&reportId='+FReportId +'tWIUZekNmFkug3di836qcE0fDSOdn59GAnIpVV0gz5ogGD7vEqD-PKCVwBKI-HKygJEuKV3k_n5mMqdQC-gBtFn06caSGfGb';
  end;


end.
