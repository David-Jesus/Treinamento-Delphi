object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Resultado da pesquisa'
  ClientHeight = 400
  ClientWidth = 956
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
  object lbTeste: TLabel
    Left = 448
    Top = 25
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
  object mmResultado: TMemo
    Left = 16
    Top = 24
    Width = 401
    Height = 281
    Lines.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    TabOrder = 0
  end
  object rdgSexoFiltro: TRadioGroup
    Left = 495
    Top = 25
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
    TabOrder = 1
  end
  object rgdEstadoCivilFiltro: TRadioGroup
    Left = 495
    Top = 121
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
    TabOrder = 2
  end
  object btFiltrar: TButton
    Left = 495
    Top = 240
    Width = 75
    Height = 33
    Caption = 'Filtrar'
    TabOrder = 3
  end
end