unit uprincipal;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

function Soma(prN1, prN2 : Integer) : Integer;


type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var 
  wTeste : Integer;

function Soma(prN1, prN2 : Integer) : Integer;
  begin
    Result := prN1 + prN2
  end;

  
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

//Assert(Somar(2,2) = 4);

begin                   
 wTeste := Soma(1 , 2);
 ShowMessage(IntToStr(wTeste));
end;

end.
