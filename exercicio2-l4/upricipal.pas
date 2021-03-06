unit upricipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrFibonacci = class(TForm)
    edResultado: TLabeledEdit;
    btResutado: TButton;
    procedure btResutadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frFibonacci: TfrFibonacci;

implementation

{$R *.dfm}

procedure TfrFibonacci.btResutadoClick(Sender: TObject);
var
  wValor1   ,
  wValor2   : Integer;
  wResultado: String;
begin
  wValor1 := 0;
  wValor2 := 1;

  while wValor1 <= 1000 do
    begin
      wResultado := wResultado + ' ' + IntToStr(wValor1);

      wValor2 := wValor2 + wValor1;
      wValor1 := wValor2 - wValor1;

      if wValor1 > 1000 then
         Break
      else
       wResultado := wResultado + ',';
    end;
  edResultado.Text := wResultado;
end;

end.
