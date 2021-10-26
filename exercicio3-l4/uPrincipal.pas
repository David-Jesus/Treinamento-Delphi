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
    lbTipoTelefone: TLabel;
    edMinutosHorarioComercial: TLabeledEdit;
    edMinutosInterurbanos: TLabeledEdit;
    edMinutosinterurbanosComercial: TLabeledEdit;
    edServicoDespertador: TLabeledEdit;
    edTelegramas: TLabeledEdit;
    btCadastrar: TButton;
    Button1: TButton;
    lbRegistros: TLabel;
    rdgPacote: TRadioGroup;
    lbPacote: TLabel;
    procedure btCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fTipoTelefone                : String;
    fCustoTelegrama              ,
    fCustoDespertador            ,
    fVlLigacaoLocal              ,
    fVlLigacaoLocalComercial     ,
    fVlLigacaoInterurbana        ,
    fVlLigacaoInterurbanaComecial,
    fValorInterUrbano            ,
    fValorInterUrbanoComercial   ,
    fValorConta                  : Currency;
    fListaAssinantes             : TList;
    fTotalMinutos                ,
    fMinutoaInterUrbano          : Integer;
  public
    { Public declarations }
    property ListaAssinates : TList read fListaAssinantes;
  end;

var
  frFormulario: TfrFormulario;

implementation

{$R *.dfm}

uses uAssinante , uLista;

var
  wAssinante          : TAssinante;
  wFormListaRegistros : TListaRegistros;

procedure TfrFormulario.btCadastrarClick(Sender: TObject);
  begin
    if (edNumeroTelefone.Text = '') then
       begin
           MessageDlg('Favor preencher o número de "Telefone".' + #13#10#13#10, mtWarning, [mbOK], 0);
           Exit;
       end;

    if (rdgTipoTelefone.ItemIndex <> 0) and (rdgTipoTelefone.ItemIndex <> 1) and (rdgTipoTelefone.ItemIndex <> 2)then
       begin
           MessageDlg('Favor selecionar um tipo de "Telefone".' + #13#10#13#10, mtWarning, [mbOK], 0);
           Exit;
       end;

    if (rdgPacote.ItemIndex <> 0) and (rdgPacote.ItemIndex <> 1) and (rdgPacote.ItemIndex <> 2) and (rdgPacote.ItemIndex <> 3) and (rdgPacote.ItemIndex <> 4)then
       begin
           MessageDlg('Favor selecionar um "Pacote".' + #13#10#13#10, mtWarning, [mbOK], 0);
           Exit;
       end;

    if (edMinutosLocais.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Locais".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edMinutosHorarioComercial.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Locais" em horário comercial.' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edMinutosInterurbanos.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Interurbano".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edMinutosinterurbanosComercial.Text = '') then
       begin
          MessageDlg('Favor preencher os minutos "Interurbano" em horário comercial.' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edServicoDespertador.Text = '') then
       begin
          MessageDlg('Favor preencher o número de serviços de "Despertador".' + #13#10#13#10, mtWarning, [mbOK], 0);
          Exit;
       end;

    if (edTelegramas.Text = '') then
       begin
          MessageDlg('Favor preencher o número de "Telegramas".' + #13#10#13#10, mtWarning, [mbOK], 0);
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

    fTotalMinutos  := StrToInt(edMinutosLocais.Text);
    fTotalMinutos  := fTotalMinutos + StrToInt(edMinutosHorarioComercial.Text);
    fTotalMinutos  := fTotalMinutos + StrToInt(edMinutosInterurbanos.Text);
    fTotalMinutos  := fTotalMinutos + StrToInt(edMinutosinterurbanosComercial.Text);


    if (rdgPacote.ItemIndex = 0) then
       fValorConta := 30
    else
    if (rdgPacote.ItemIndex = 1) then
       fValorConta := 40
    else
    if (rdgPacote.ItemIndex = 2) then
       fValorConta := 50
    else
    if (rdgPacote.ItemIndex = 3) then
       fValorConta := 90
    else
       fValorConta := 300;


    fCustoTelegrama   := StrToInt(edTelegramas.Text) * 5.75;
    fValorConta       := fValorConta + fCustoTelegrama;
    fCustoDespertador := StrToInt(edServicoDespertador.Text) * 1.30;
    fValorConta       := fValorConta + fCustoDespertador;

    if (edMinutosLocais.Text <> '') and (edMinutosLocais.Text <> '0') then
       begin
         if CompareStr(fTipoTelefone, 'Residencial') = 0 then
            begin
              fValorConta := fValorConta + (StrToInt(edMinutosLocais.Text) * 1.20)
            end
         else
         if CompareStr(fTipoTelefone, 'Comercial') = 0 then
            begin
              fValorConta := fValorConta + (StrToInt(edMinutosLocais.Text) * 1.30)
            end
         else
            fValorConta := fValorConta + (StrToInt(edMinutosLocais.Text) * 0.8);
       end;

    if (edMinutosHorarioComercial.Text <> '') and (edMinutosHorarioComercial.Text <> '0')  then
       begin
         if CompareStr(fTipoTelefone, 'Residencial') = 0 then
            begin
              fValorConta := fValorConta + (StrToInt(edMinutosHorarioComercial.Text) * 1.50)
            end
         else
         if CompareStr(fTipoTelefone, 'Comercial') = 0 then
            begin
              fValorConta := fValorConta + (StrToInt(edMinutosHorarioComercial.Text) * 1.80)
            end
         else
            fValorConta := fValorConta + (StrToInt(edMinutosHorarioComercial.Text) * 1.1);
       end;

    if (edMinutosInterurbanos.Text <> '') and  (edMinutosInterurbanos.Text <> '0') then
       begin
         if CompareStr(fTipoTelefone, 'Residencial') = 0 then
            begin
              fValorInterUrbano := (StrToInt(edMinutosInterurbanos.Text) * 1.20);
              fValorConta := fValorConta +  fValorInterUrbano
            end
         else
         if CompareStr(fTipoTelefone, 'Comercial') = 0 then
            begin
              fValorInterUrbano := (StrToInt(edMinutosInterurbanos.Text) * 1.30);
              fValorConta := fValorConta + fValorInterUrbano
            end
         else
            begin
              fValorInterUrbano :=  (StrToInt(edMinutosInterurbanos.Text) * 0.8);
              fValorConta := fValorConta + fValorInterUrbano;
            end;
       end;

    if (edMinutosinterurbanosComercial.Text <> '') and (edMinutosinterurbanosComercial.Text <> '0')  then
       begin
          if CompareStr(fTipoTelefone, 'Residencial') = 0 then
            begin
              fValorInterUrbanoComercial := 3* (StrToInt(edMinutosinterurbanosComercial.Text) * 1.20);
              fValorConta := fValorConta + fValorInterUrbanoComercial
            end
         else
         if CompareStr(fTipoTelefone, 'Comercial') = 0 then
            begin
             fValorInterUrbanoComercial := 3 * (StrToInt(edMinutosinterurbanosComercial.Text) * 1.30);
              fValorConta := fValorConta + fValorInterUrbanoComercial
            end
         else
            begin
              fValorInterUrbanoComercial :=  3* (StrToInt(edMinutosinterurbanosComercial.Text) * 0.8);
              fValorConta := fValorConta + fValorInterUrbanoComercial;
            end;
            
       end;

    fValorInterUrbano   := fValorInterUrbanoComercial + fValorInterUrbano;
    fMinutoaInterUrbano := StrToInt(edMinutosinterurbanosComercial.Text) + StrToInt(edMinutosInterurbanos.Text);

    wAssinante                            := TAssinante.Create;
    wAssinante.NumeroTelefone             := edNumeroTelefone.Text;
    wAssinante.TipoTelefone               := fTipoTelefone;
    wAssinante.MinutosLocais              := StrToInt(edMinutosLocais.Text);
    wAssinante.MinutosLocaisComercial     := StrToInt(edMinutosHorarioComercial.Text);
    wAssinante.MinutosInterurbanos        := fMinutoaInterUrbano;
    wAssinante.ValorInterurbano           := fValorInterUrbano;
    wAssinante.ServicosDespertador        := StrToInt(edServicoDespertador.Text);
    wAssinante.NumeroTelegramas           := StrToInt(edTelegramas.Text);
    wAssinante.ValorConta                 := fValorConta;


    fListaAssinantes.Add(wAssinante);
    MessageDlg('Cadastrado com sucesso!' + #13#10#13#10, mtConfirmation, [mbOK], 0);
    lbRegistros.Caption := 'Total de registros: ' + IntToStr(fListaAssinantes.Count);

    rdgPacote.ItemIndex                 := -1;
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
    lbRegistros.Caption := 'Total de registros: ' + IntToStr(fListaAssinantes.Count);
    lbRegistros.Visible := true;
  end;

procedure TfrFormulario.Button1Click(Sender: TObject);
  begin
    if fListaAssinantes.Count = 0 then
       MessageDlg('Aida não há registro, necessário novos cadastros!', mtWarning, [mbOK], 0)
    else
       begin
         try
//           ShowMessage(Format('Tetes                   %d', [1]));
//           exit;
           wFormListaRegistros := TListaRegistros.Create(fListaAssinantes);
           wFormListaRegistros.ShowModal;
         finally
           if Assigned(wFormListaRegistros) then
              FreeAndNil(wFormListaRegistros);
         end;
       end;
  end;

procedure TfrFormulario.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(fListaAssinantes);
  end;

end.
