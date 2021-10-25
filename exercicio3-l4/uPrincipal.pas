unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrFormulario = class(TForm)
    edNumeroTelefone: TLabeledEdit;
    edMinutosLocais: TLabeledEdit;
    rdgTipoTelefone: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    edMinutosHorarioComercial: TLabeledEdit;
    edMinutosInterurbanos: TLabeledEdit;
    edMinutosinterurbanosComercial: TLabeledEdit;
    edServicoDespertador: TLabeledEdit;
    edTelegramas: TLabeledEdit;
    btCadastrar: TButton;
    Button1: TButton;
    procedure btCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fTipoTelefone    : String;
    fListaAssinantes : TList;
  public
    { Public declarations }
    property ListaAssinates : TList read fListaAssinantes;
  end;

var
  frFormulario: TfrFormulario;

implementation

{$R *.dfm}

uses uAssinante;

var
  wAssinante : TAssinante;

procedure TfrFormulario.btCadastrarClick(Sender: TObject);
  begin
    if (edNumeroTelefone.Text = '') then
       begin
           MessageDlg('Favor preencher o n�mero de "Telefone".' + #13#10#13#10, mtWarning, [mbOK], 0);
           Exit;
       end;

    if (rdgTipoTelefone.ItemIndex <> 0) and (rdgTipoTelefone.ItemIndex <> 1) and (rdgTipoTelefone.ItemIndex <> 2)then
       begin
           MessageDlg('Favor selecionar um tipo de "Telefone".' + #13#10#13#10, mtWarning, [mbOK], 0);
           Exit;
       end;

    if (edMinutosLocais.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Locais".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edMinutosHorarioComercial.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Locais" em hor�rio comercial.' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edMinutosInterurbanos.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Interurbano".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edMinutosinterurbanosComercial.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Interurbano" em hor�rio comercial.' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edServicoDespertador.Text = '') then
       begin
          MessageDlg('Favor preencher o n�mero de servi�os de "Despertador".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edTelegramas.Text = '') then
       begin
          MessageDlg('Favor preencher o n�mero de "Telegramas".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (rdgTipoTelefone.ItemIndex = 0)  then
       begin
         fTipoTelefone := 'Residencial';
         rdgTipoTelefone.ItemIndex := -1;
       end
    else
    if (rdgTipoTelefone.ItemIndex = 1) then
       begin
         fTipoTelefone := 'Comercial';
         rdgTipoTelefone.ItemIndex := -1;
       end
    else
       begin
         fTipoTelefone := 'Rural';
         rdgTipoTelefone.ItemIndex := -1;
       end;

    wAssinante                            := TAssinante.Create;
    wAssinante.NumeroTelefone             := edNumeroTelefone.Text;
    wAssinante.TipoTelefone               := fTipoTelefone;
    wAssinante.MinutosLocais              := StrToInt(edMinutosLocais.Text);
    wAssinante.MinutosLocaisComercial     := StrToInt(edMinutosHorarioComercial.Text);
    wAssinante.MinutosInterurbanos        := StrToInt(edMinutosInterurbanos.Text);
    wAssinante.MinutosIterurbanoComercial := StrToInt(edMinutosinterurbanosComercial.Text);
    wAssinante.ServicosDespertador        := StrToInt(edServicoDespertador.Text);
    wAssinante.NumeroTelegramas           := StrToInt(edTelegramas.Text);

    fListaAssinantes.Add(wAssinante);
    MessageDlg('Cadastrado com sucesso!' + #13#10#13#10, mtConfirmation, [mbOK], 0);

    edNumeroTelefone.Text               := '';
    edMinutosLocais.Text                := '';
    edMinutosHorarioComercial.Text      := '';
    edMinutosInterurbanos.Text          := '';
    edMinutosinterurbanosComercial.Text := '';
    edServicoDespertador.Text           := '';
    edTelegramas.Text                   := '';
  end;



procedure TfrFormulario.FormCreate(Sender: TObject);
  begin
    fListaAssinantes := Tlist.Create;
  end;

procedure TfrFormulario.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(fListaAssinantes);
  end;

end.
