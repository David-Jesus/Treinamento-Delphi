object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 297
  ClientWidth = 401
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
  object btEnviar: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = btEnviarClick
  end
  object mskCNPJ: TMaskEdit
    Left = 106
    Top = 117
    Width = 176
    Height = 21
    Cursor = crIBeam
    EditMask = '00.000.000/0000-00;1;_'
    MaxLength = 18
    TabOrder = 1
    Text = '  .   .   /    -  '
  end
end
