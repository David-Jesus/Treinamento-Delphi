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
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 114
    Top = 120
    Width = 177
    Height = 21
    AutoSelect = False
    TabOrder = 0
    TextHint = 'Informe o Cnpj'
  end
  object btEnviar: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 1
    OnClick = btEnviarClick
  end
end
