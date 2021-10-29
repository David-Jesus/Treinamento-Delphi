unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHTTPComCertificadoBase,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    btEnviar: TButton;
    procedure btEnviarClick(Sender: TObject);
  private
    FHTTP  : THTTPComCertificadoBase;
    procedure OnEnviarCNPJ(var prData: String);
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

    FHTTP.AbrirRequisicao('https://e-gov.betha.com.br/cdweb/03114-212/contribuinte/rel_cndcontribuinte.faces', tprPOST);
    FHTTP.EnviarRequisicao;

    ShowMessage(FHTTP.ResponseText);
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

    prData := 'NEW_AJAX_MODE=true&AJAXREQUEST=j_id_jsp_1052421380_0&mainForm=mainForm&mainForm%3ArepParamsEncode=1r1UgtyvQctvS_slepk3wPXl44U7CLmhyBpBzShedmOY'+'2ighmyrj05zL5Che2xQF&prevent_autofill=&password_fake=&mainForm%3Acpf=&mainForm%3Acnpj=22.875.384%2F0001-21&mainForm%3ArepType=zMa_DuBK1pOT6PbF6_McTzoefLSbKZmg&i'+'Contribuintes=&codigoInterno=&recurso=EMISSAO_CND_CONTRIBUINTE&ipEmissao=177.101.105.157&iAutenticacao=&BETHA_SERIALIZABLE_DATA=bth0da3b6d1-ec5e-434b-b471-3c5c4524c5c2&javax.faces.'+'ViewState=j_id2&jsf_tree=j_id2&jsf_viewid=%2Frel_cndcontribuinte.jsp&mainForm%3AbtCnpj=mainForm%3AbtCnpj&AJAX%3AEVENTS_COUNT=1&';
  end;

end.
