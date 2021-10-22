object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Resultado da pesquisa'
  ClientHeight = 435
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbFundo: TLabel
    Left = 33
    Top = 26
    Width = 3
    Height = 13
    Color = clActiveBorder
    ParentColor = False
    Transparent = False
  end
  object lbTeste: TLabel
    Left = 512
    Top = 24
    Width = 41
    Height = 16
    Caption = 'Filtro: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbResultadoPesquisa: TLabel
    AlignWithMargins = True
    Left = 63
    Top = 38
    Width = 98
    Height = 13
    Caption = 'lbResultadoPesquisa'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
  end
  object rdgSexoFiltro: TRadioGroup
    Left = 559
    Top = 24
    Width = 73
    Height = 73
    Caption = 'Sexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Mulher'
      'Homem')
    ParentFont = False
    TabOrder = 0
  end
  object rdgEstadoCivilFiltro: TRadioGroup
    Left = 559
    Top = 120
    Width = 145
    Height = 89
    Caption = 'Estado Civil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Solteiro (a)'
      'Casado (a)'
      'Vi'#250'vo (a)'
      'Divorciado (a)')
    ParentFont = False
    TabOrder = 1
  end
  object btFiltrar: TButton
    Left = 559
    Top = 239
    Width = 75
    Height = 33
    Caption = 'Filtrar'
    TabOrder = 2
    OnClick = btFiltrarClick
  end
end
