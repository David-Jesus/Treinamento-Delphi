unit upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listaPessoa;

type
  TForm1 = class(TForm)
  private
    FListaPessoas: TListaPessoa;

  public
    constructor Create(prListaPessoa : TListaPessoa);
    property ListaPessoas : TListaPessoa read FListaPessoas write FListaPessoas;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



{ TForm1 }

constructor TForm1.Create(prListaPessoa: TListaPessoa);
  begin
    inherited create(nil);
    FListaPessoas := prListaPessoa;
  end;

end.
