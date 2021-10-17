object frReposicao: TfrReposicao
  Left = 0
  Top = 0
  ActiveControl = edReposicao
  Caption = 'Calculo m'#233'dia com Reposi'#231#227'o'
  ClientHeight = 125
  ClientWidth = 424
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
  object edReposicao: TLabeledEdit
    Left = 180
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = 'Nota de Reposi'#231#227'o'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object btCalcularMediaReposicao: TButton
    Left = 327
    Top = 33
    Width = 89
    Height = 35
    Caption = 'Calcular M'#233'dia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btCalcularMediaReposicaoClick
  end
  object edMedia: TLabeledEdit
    Left = 180
    Top = 90
    Width = 65
    Height = 21
    EditLabel.Width = 157
    EditLabel.Height = 13
    EditLabel.Caption = 'M'#233'dia de com nota de Reposic'#227'o'
    LabelPosition = lpLeft
    TabOrder = 2
  end
end
