unit uLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TListaRegistros = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    fListaRegistros : Tlist;
  public
    constructor create(prListaRegistros : TList);
  end;

var
  Form1: TListaRegistros;

implementation

{$R *.dfm}

{ TListaRegistros }

constructor TListaRegistros.create(prListaRegistros: TList);
  begin
    inherited  create(nil);
    fListaRegistros := prListaRegistros;
  end;

end.
