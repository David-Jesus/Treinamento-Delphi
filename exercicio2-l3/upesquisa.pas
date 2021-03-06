unit upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listaPessoa, Vcl.StdCtrls, Pessoa,
  Vcl.Grids, Vcl.ExtCtrls;

type
  TfrmPesquisa = class(TForm)
    lbTeste: TLabel;
    rdgSexoFiltro: TRadioGroup;
    rdgEstadoCivilFiltro: TRadioGroup;
    btFiltrar: TButton;
    lbResultadoPesquisa: TLabel;
    lbFundo: TLabel;
    btLimparFiltro: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure btLimparFiltroClick(Sender: TObject);

  private
    FListaPessoas: TList;

  public
    constructor Create(prListaPessoa: TList);
    property ListaPessoas : TList read FListaPessoas write FListaPessoas;
  end;

var
  frmPesquisa  : TfrmPesquisa;
  wSexo        ,
  wEstadoCivil : String;

implementation

{$R *.dfm}

uses uFiltro;

constructor TfrmPesquisa.Create(prListaPessoa: TList);
  begin
    inherited create(nil);
    FListaPessoas := TList.Create;
    if prListaPessoa <> nil then
       FListaPessoas := prListaPessoa;
  end;

procedure TfrmPesquisa.btFiltrarClick(Sender: TObject);
  begin

    if (rdgSexoFiltro.ItemIndex = 0) then
       wSexo := 'Mulher'
    else
    if (rdgSexoFiltro.ItemIndex = 1) then
       wSexo := 'Homen'
    else
       wSexo := '';

    if (rdgEstadoCivilFiltro.ItemIndex = 0) then
           wEstadoCivil := 'Solteiro'

    else
    if (rdgEstadoCivilFiltro.ItemIndex = 1)then
       wEstadoCivil := 'Casado'
    else
    if  (rdgEstadoCivilFiltro.ItemIndex = 2) then
       wEstadoCivil := 'Vi?vo'
    else
    if (rdgEstadoCivilFiltro.ItemIndex = 3) then
       wEstadoCivil  := 'Divorciado'
    else
         wEstadoCivil  := '';

      lbResultadoPesquisa.Caption := '';
      lbResultadoPesquisa.Caption :=  filtro(FListaPessoas, wSexo, wEstadoCivil);
  end;

procedure TfrmPesquisa.btLimparFiltroClick(Sender: TObject);
  begin
    rdgSexoFiltro.ItemIndex        := -1;
    rdgEstadoCivilFiltro.ItemIndex := -1;
  end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
  begin
    if FListaPessoas <> nil then
       begin
         lbResultadoPesquisa.Caption := filtro(ListaPessoas, '', '');
         lbResultadoPesquisa.Font.Size := 10;
         lbFundo.Width   := 460;
         lbFundo.Height  := 360;
       end;
  end;

end.
