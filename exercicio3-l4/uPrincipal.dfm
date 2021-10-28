object frFormulario: TfrFormulario
  Left = 0
  Top = 0
  Width = 571
  Height = 576
  AutoScroll = True
  Caption = 'Formul'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTipoTelefone: TLabel
    Left = 170
    Top = 83
    Width = 87
    Height = 13
    Caption = 'Tipo de Telefone: '
  end
  object lbRegistros: TLabel
    Left = 48
    Top = 635
    Width = 67
    Height = 16
    Caption = 'Registros:'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbPacote: TLabel
    Left = 156
    Top = 188
    Width = 94
    Height = 13
    Caption = 'Selecione o pacote:'
  end
  object edNumeroTelefone: TLabeledEdit
    Left = 256
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 101
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero de Telefone:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 0
  end
  object edMinutosLocais: TLabeledEdit
    Left = 256
    Top = 277
    Width = 121
    Height = 21
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'Minutos locais:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 2
  end
  object rdgTipoTelefone: TRadioGroup
    Left = 256
    Top = 83
    Width = 97
    Height = 91
    Items.Strings = (
      'Residencial'
      'Comercial'
      'Rural')
    TabOrder = 1
  end
  object edMinutosHorarioComercial: TLabeledEdit
    Left = 256
    Top = 331
    Width = 121
    Height = 21
    EditLabel.Width = 171
    EditLabel.Height = 13
    EditLabel.Caption = 'Minutos locais em hor'#225'rio comercial:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 3
  end
  object edMinutosInterurbanos: TLabeledEdit
    Left = 256
    Top = 385
    Width = 121
    Height = 21
    EditLabel.Width = 100
    EditLabel.Height = 13
    EditLabel.Caption = 'Minutos interurbano:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 4
  end
  object edMinutosinterurbanosComercial: TLabeledEdit
    Left = 256
    Top = 440
    Width = 121
    Height = 21
    EditLabel.Width = 203
    EditLabel.Height = 13
    EditLabel.Caption = 'Minutos Interurbano em hor'#225'rio comercial:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 5
  end
  object edServicoDespertador: TLabeledEdit
    Left = 256
    Top = 488
    Width = 121
    Height = 21
    EditLabel.Width = 176
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero de servi'#231'os de Despertador:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 6
  end
  object edTelegramas: TLabeledEdit
    Left = 256
    Top = 536
    Width = 121
    Height = 21
    EditLabel.Width = 119
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'meros de Telegramas:'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 7
  end
  object btCadastrar: TButton
    Left = 155
    Top = 584
    Width = 75
    Height = 33
    Caption = 'Cadastrar'
    TabOrder = 8
    OnClick = btCadastrarClick
  end
  object Button1: TButton
    Left = 304
    Top = 584
    Width = 97
    Height = 33
    Caption = 'Verificar Registros'
    TabOrder = 9
    OnClick = Button1Click
  end
  object rdgPacote: TRadioGroup
    Left = 256
    Top = 188
    Width = 185
    Height = 73
    Columns = 2
    Items.Strings = (
      'B'#225'sico'
      'Normal'
      'Avan'#231'ado'
      'Master'
      'Master Plus')
    TabOrder = 10
  end
end
