object frFibonacci: TfrFibonacci
  Left = 0
  Top = 0
  Caption = 'S'#233'rie de Fibonacci'
  ClientHeight = 129
  ClientWidth = 601
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
  object edResultado: TLabeledEdit
    Left = 256
    Top = 32
    Width = 323
    Height = 21
    EditLabel.Width = 228
    EditLabel.Height = 14
    EditLabel.Caption = 'Resultado da s'#233'rie Fibnacci de 0 at'#233' 1000'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -12
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object btResutado: TButton
    Left = 362
    Top = 75
    Width = 95
    Height = 25
    Caption = 'Ver Sequ'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btResutadoClick
  end
end
