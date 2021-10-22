unit upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listaPessoa, Vcl.StdCtrls, Pessoa;

type
  TfrmPesquisa = class(TForm)
    lbTeste: TLabel;
    mmResultado: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    FListaPessoas: TList;

  public
    constructor Create(prListaPessoa : TList);
    property ListaPessoas : TList read FListaPessoas write FListaPessoas;
  end;

var
  frmPesquisa: TfrmPesquisa;
  wContador        ,
  wMaiorIdade      ,
  wMenorIdade      ,
  wQtdPessoas      ,
  wQtdPessoasFaixa : Integer;
  wSoma            ,
  wMediaSalario    : Currency;
  wComp            : TObject;


implementation

{$R *.dfm}



{ TForm1 }

constructor TfrmPesquisa.Create(prListaPessoa: TList);
  begin
    inherited create(nil);
    FListaPessoas := TList.Create;
    if prListaPessoa <> nil then
       FListaPessoas := prListaPessoa;

  end;


procedure TfrmPesquisa.FormCreate(Sender: TObject);
  begin

  if FListaPessoas <> nil then
     begin
       wContador := 0;
       wSoma     := 0;

//       for Fpessoa in FListaPessoas do
//         begin
//           wSoma := wSoma  + Fpessoa.salario;
//         end;

       repeat
         wSoma := wSoma + TPessoa(FListaPessoas.Items[wContador]).salario;
         wContador := wContador + 1;
       until (wContador <= FListaPessoas.Count);

       mmResultado.Lines[1] := FloatToStr(wSoma);
//       mmResultado.Lines[2] := wComp.ToString;
     end;
  end;

end.
