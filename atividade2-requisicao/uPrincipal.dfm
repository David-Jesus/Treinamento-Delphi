object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 268
  ClientWidth = 416
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
  object edLogin: TLabeledEdit
    Left = 144
    Top = 72
    Width = 140
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Login:'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edSenha: TLabeledEdit
    Left = 144
    Top = 128
    Width = 141
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 1
  end
  object btLogar: TButton
    Left = 168
    Top = 176
    Width = 83
    Height = 33
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btLogarClick
  end
end
