unit uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edPista: TLabeledEdit;
    edVoltas: TLabeledEdit;
    edConsumoCombustivel: TLabeledEdit;
    brCalcular: TButton;
    edCapacidadeTanque: TLabeledEdit;
    procedure brCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.brCalcularClick(Sender: TObject);
var
  wTamanhopista      ,
  wCapacidadeTanque  ,
  wResultado         ,
  wTotalMetros       ,
  wTotalDeTanques    ,
  wConsumoCombustivel: Currency;
  wNumeroVoltas      : Integer;
begin
  if edPista.Text = '' then
     begin
       MessageDlg('Favor informar o campo 1!', mtWarning, [mbOk], 0);
       exit;
     end
  else
  if edVoltas.Text = '' then
     begin
       MessageDlg('Favor informar o campo 2!', mtWarning, [mbOk], 0);
       exit;
     end
  else
  if edConsumoCombustivel.Text = '' then
     begin
       MessageDlg('Favor informar o campo 3!', mtWarning, [mbOk], 0);
       exit;
     end;
  if edCapacidadeTanque.Text = '' then
     begin
       MessageDlg('Favor informar o campo 4!', mtWarning, [mbOk], 0);
       exit;
     end;

  try
    wNumeroVoltas       := StrToInt(edVoltas.Text);
    wTamanhopista       := StrToFloat(edPista.Text);
    wConsumoCombustivel := StrToFloat(edConsumoCombustivel.Text);
    wCapacidadeTanque   := StrToFloat(edCapacidadeTanque.Text);

    wTotalMetros        := wNumeroVoltas * wTamanhopista;
    wConsumoCombustivel := wConsumoCombustivel * 1000;

    wResultado := (wTotalMetros * wCapacidadeTanque) / wConsumoCombustivel;
    ShowMessage('Quantidade total necessária: ' + FloatToStr(wResultado) + ' Litros');
    wTotalDeTanques := wResultado / wCapacidadeTanque;
    if Int(wTotalDeTanques) <> wTotalDeTanques then
       wTotalDeTanques := int(wTotalDeTanques) + 1;

    ShowMessage('Quantidade de vezes que terá que reabastecer: ' + FloatToStr(wTotalDeTanques));
  except on E: Exception do
    MessageDlg('Existem caracteres inválidos.' + #13#10#13#10 + 'Erro: ' + E.Message, mtWarning, [mbOK], 0);
  end;
end;

end.
