object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'C'#225'lculo de litros'
  ClientHeight = 299
  ClientWidth = 450
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
  object edPsita: TLabeledEdit
    Left = 184
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 156
    EditLabel.Height = 13
    EditLabel.Caption = 'Informe o comprimento da pista:'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edVoltas: TLabeledEdit
    Left = 184
    Top = 93
    Width = 121
    Height = 21
    EditLabel.Width = 123
    EditLabel.Height = 13
    EditLabel.Caption = 'Informe a total de voltas:'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object edConsumoCombustivel: TLabeledEdit
    Left = 184
    Top = 162
    Width = 121
    Height = 21
    EditLabel.Width = 170
    EditLabel.Height = 13
    EditLabel.Caption = 'Informe o consumo de combust'#237'vel:'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object brCalcular: TButton
    Left = 352
    Top = 127
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 4
    OnClick = brCalcularClick
  end
  object edCapacidadeTanque: TLabeledEdit
    Left = 184
    Top = 232
    Width = 121
    Height = 21
    EditLabel.Width = 160
    EditLabel.Height = 13
    EditLabel.Caption = 'Informe a capacidade do tanque:'
    LabelPosition = lpLeft
    TabOrder = 3
  end
end
