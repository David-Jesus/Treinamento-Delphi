object frFormulario: TfrFormulario
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio'
  ClientHeight = 646
  ClientWidth = 474
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
  object Label1: TLabel
    Left = 203
    Top = 83
    Width = 3
    Height = 13
    Caption = ' '
  end
  object Label2: TLabel
    Left = 146
    Top = 91
    Width = 87
    Height = 13
    Caption = 'Tipo de Telefone: '
  end
  object lbRegistros: TLabel
    Left = 24
    Top = 595
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
  object edNumeroTelefone: TLabeledEdit
    Left = 232
    Top = 48
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
    Left = 232
    Top = 213
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
    Left = 232
    Top = 91
    Width = 97
    Height = 91
    Items.Strings = (
      'Residencial'
      'Comercial'
      'Rural')
    TabOrder = 1
  end
  object edMinutosHorarioComercial: TLabeledEdit
    Left = 232
    Top = 267
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
    Left = 232
    Top = 321
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
    Left = 232
    Top = 376
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
    Left = 232
    Top = 424
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
    Left = 232
    Top = 472
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
    Left = 131
    Top = 520
    Width = 75
    Height = 33
    Caption = 'Cadastrar'
    TabOrder = 8
    OnClick = btCadastrarClick
  end
  object Button1: TButton
    Left = 280
    Top = 520
    Width = 97
    Height = 33
    Caption = 'Verificar Registros'
    TabOrder = 9
    OnClick = Button1Click
  end
end
