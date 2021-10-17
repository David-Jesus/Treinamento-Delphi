object frFatorial: TfrFatorial
  Left = 0
  Top = 0
  Caption = 'Logica 4 - ex - 1'
  ClientHeight = 158
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbResultado: TLabel
    Left = 261
    Top = 113
    Width = 35
    Height = 19
    Caption = 'valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lbResultadoLabel: TLabel
    Left = 178
    Top = 113
    Width = 80
    Height = 19
    Caption = 'Resultado: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edValor: TLabeledEdit
    Left = 297
    Top = 48
    Width = 121
    Height = 24
    EditLabel.Width = 283
    EditLabel.Height = 19
    EditLabel.Caption = 'Digite o n'#250'mero para calcular o fatorial:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 0
  end
  object btCalcular: TButton
    Left = 440
    Top = 45
    Width = 75
    Height = 31
    Caption = 'Calcular'
    TabOrder = 1
    OnClick = btCalcularClick
  end
end
