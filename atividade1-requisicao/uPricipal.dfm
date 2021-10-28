object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 568
  ClientWidth = 1183
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object lbFundo: TLabel
    Left = 32
    Top = 88
    Width = 1121
    Height = 449
    AutoSize = False
    Caption = 
      'Tr'#234's primeiros resultados do google referente a palavra digitada' +
      ': '
    Color = clWhite
    ParentColor = False
    Transparent = False
  end
  object lbResultado: TLabel
    Left = 64
    Top = 168
    Width = 1062
    Height = 321
    AutoSize = False
    Color = clBtnHighlight
    ParentColor = False
    Transparent = False
    WordWrap = True
  end
  object edEntrada: TEdit
    AlignWithMargins = True
    Left = 376
    Top = 39
    Width = 217
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Digte uma palavra'
  end
  object Verificar: TButton
    Left = 648
    Top = 36
    Width = 91
    Height = 32
    Caption = 'Verificar'
    TabOrder = 1
    OnClick = VerificarClick
  end
end
