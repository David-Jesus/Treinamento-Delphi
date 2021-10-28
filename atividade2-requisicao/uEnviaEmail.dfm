object frEnvioEmail: TfrEnvioEmail
  Left = 0
  Top = 0
  Caption = 'Enviar Email'
  ClientHeight = 439
  ClientWidth = 722
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
    Left = 51
    Top = 59
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object Label2: TLabel
    Left = 39
    Top = 192
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object Edit1: TEdit
    Left = 96
    Top = 97
    Width = 545
    Height = 225
    AutoSize = False
    TabOrder = 1
  end
  object btEnviar: TButton
    Left = 296
    Top = 352
    Width = 105
    Height = 41
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = btEnviarClick
  end
  object edEmail: TEdit
    Left = 96
    Top = 56
    Width = 265
    Height = 21
    TabOrder = 0
  end
end
