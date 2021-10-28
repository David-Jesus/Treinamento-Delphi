unit uEnviaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrEnvioEmail = class(TForm)
    Edit1: TEdit;
    btEnviar: TButton;
    edEmail: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frEnvioEmail: TfrEnvioEmail;

implementation

{$R *.dfm}

end.
