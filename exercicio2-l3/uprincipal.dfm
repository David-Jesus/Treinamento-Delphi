object frPesquisa: TfrPesquisa
  Left = 0
  Top = 0
  Caption = 'Sistema Pesquisa'
  ClientHeight = 379
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 65
    Width = 74
    Height = 13
    Caption = 'Inform o sexo: '
  end
  object lbCivil: TLabel
    Left = 36
    Top = 190
    Width = 107
    Height = 13
    Caption = 'Informe o estado civil:'
  end
  object lbTotal: TLabel
    Left = 8
    Top = 349
    Width = 127
    Height = 16
    Caption = 'Total de Registros: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbTotalValor: TLabel
    Left = 136
    Top = 349
    Width = 77
    Height = 16
    Caption = 'lbTotalValor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btAdicionar: TButton
    Left = 80
    Top = 288
    Width = 98
    Height = 33
    Caption = 'Adicionar'
    TabOrder = 7
    OnClick = btAdicionarClick
  end
  object edIdade: TLabeledEdit
    Left = 157
    Top = 32
    Width = 112
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Insira a idade: '
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edSalario: TLabeledEdit
    Left = 156
    Top = 147
    Width = 121
    Height = 21
    EditLabel.Width = 88
    EditLabel.Height = 13
    EditLabel.Caption = 'Informe o sal'#225'rio: '
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object rbViuvo: TRadioButton
    Left = 156
    Top = 250
    Width = 61
    Height = 17
    Caption = 'Viuvo (a)'
    TabOrder = 6
  end
  object rbCasado: TRadioButton
    Left = 156
    Top = 189
    Width = 73
    Height = 17
    Align = alCustom
    Caption = 'Casado (a)'
    TabOrder = 3
  end
  object rbSolteiro: TRadioButton
    Left = 156
    Top = 209
    Width = 73
    Height = 17
    Caption = 'Solteiro (a)'
    TabOrder = 4
  end
  object rbDivorciado: TRadioButton
    Left = 156
    Top = 229
    Width = 85
    Height = 17
    Caption = 'Divorciado (a)'
    TabOrder = 5
  end
  object rdgSexo: TRadioGroup
    Left = 157
    Top = 65
    Width = 73
    Height = 66
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentCustomHint = False
    BiDiMode = bdRightToLeftNoAlign
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Mulher'
      'Homem')
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object btPesquisa: TButton
    Left = 202
    Top = 288
    Width = 95
    Height = 33
    Caption = 'Ver Pesquisa'
    TabOrder = 8
    OnClick = btPesquisaClick
  end
end
