object frExercicio: TfrExercicio
  Left = 0
  Top = 0
  Caption = 'Execrcicio 01 lista 3'
  ClientHeight = 195
  ClientWidth = 323
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
  object lbMedia: TLabel
    Left = 340
    Top = 20
    Width = 72
    Height = 25
    Caption = 'lbMedia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object btCalculaMedia: TButton
    Left = 222
    Top = 81
    Width = 83
    Height = 33
    Caption = 'Calcular Media'
    TabOrder = 3
    OnClick = btCalculaMediaClick
  end
  object edNota1: TLabeledEdit
    Left = 64
    Top = 27
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Nota 1'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edNota2: TLabeledEdit
    Left = 64
    Top = 87
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Nota 2'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object edNota3: TLabeledEdit
    Left = 64
    Top = 147
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Nota 3'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object edMedia: TEdit
    Left = 340
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object mmMedia: TMemo
    Left = 340
    Top = 91
    Width = 185
    Height = 89
    TabOrder = 5
    Visible = False
  end
end
