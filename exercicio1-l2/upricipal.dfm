object frExercicio1: TfrExercicio1
  Left = 0
  Top = 0
  Caption = 'Verifica caractere'
  ClientHeight = 158
  ClientWidth = 438
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
  object Label1: TLabel
    Left = 24
    Top = 65
    Width = 130
    Height = 16
    Caption = 'Infrome um caractere:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbResultado: TLabel
    Left = 24
    Top = 104
    Width = 65
    Height = 16
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    StyleElements = [seFont, seBorder]
  end
  object btVerifica: TButton
    Left = 312
    Top = 62
    Width = 75
    Height = 27
    Caption = 'Verificar'
    TabOrder = 1
    OnClick = btVerificaClick
  end
  object edCaracter: TEdit
    Left = 160
    Top = 64
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 0
  end
end
