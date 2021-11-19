object FrmApiBCB: TFrmApiBCB
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'API BCB '
  ClientHeight = 490
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Courier New'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 18
  object lblInfo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 473
    Width = 477
    Height = 14
    Align = alBottom
    Caption = 'Informe o indice e clique em consultar...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 425
    ExplicitWidth = 287
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 477
    Height = 464
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 416
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 471
      Height = 18
      Align = alTop
      Caption = #205'ndice de Pre'#231'o:'
      ExplicitWidth = 160
    end
    object btnConsultar: TButton
      AlignWithMargins = True
      Left = 3
      Top = 59
      Width = 471
      Height = 56
      Align = alTop
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object cbxIndice: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 27
      Width = 471
      Height = 26
      Align = alTop
      AutoDropDown = True
      TabOrder = 0
      Items.Strings = (
        'INPC do IBGE'
        'IGP-M da FGV'
        'IGP-DI da FGV'
        'IPC Brasil da FGV'
        'IPC-SP do IBGE'
        'IPCA do IBGE')
    end
    object mmBody: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 121
      Width = 471
      Height = 340
      TabStop = False
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
      ExplicitHeight = 292
    end
  end
end
