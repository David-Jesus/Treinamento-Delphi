object frProvaFinal: TfrProvaFinal
  Left = 0
  Top = 0
  Caption = 'Media com prova final'
  ClientHeight = 124
  ClientWidth = 399
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
  object edNotaFinal: TLabeledEdit
    Left = 128
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 92
    EditLabel.Height = 13
    EditLabel.Caption = 'Nota da prova final'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object edMedia: TLabeledEdit
    Left = 128
    Top = 80
    Width = 57
    Height = 25
    EditLabel.Width = 104
    EditLabel.Height = 13
    EditLabel.Caption = 'M'#233'dia com prova final'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object btMedia: TButton
    Left = 288
    Top = 33
    Width = 83
    Height = 35
    Caption = 'Calcular M'#233'dia'
    TabOrder = 2
    OnClick = btMediaClick
  end
end
