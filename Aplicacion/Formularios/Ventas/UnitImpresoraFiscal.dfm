object impresorafiscal: Timpresorafiscal
  Left = 0
  Top = 0
  Caption = 'Impresora Fiscal'
  ClientHeight = 331
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object impresorafiscal: TAdvPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 331
    Align = alClient
    BevelOuter = bvNone
    Color = 15524577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    Caption.Color = 15722471
    Caption.ColorTo = 11176072
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = 11769496
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label3: TLabel
      Left = 12
      Top = 12
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Operaciones'
    end
    object btnimprimir: TButton
      Left = 254
      Top = 299
      Width = 115
      Height = 25
      Caption = 'Cancelar Impresion'
      ModalResult = 2
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 12
      Top = 31
      Width = 357
      Height = 262
      TabOrder = 1
    end
  end
  object HASAR1: THASAR
    Left = 152
    Top = 72
    Width = 32
    Height = 32
    ControlData = {000300004F0300004F030000}
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 248
    Top = 80
  end
  object MQDetalle: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select t as descripcion,d as cantidad,d as monto,d as IVA,d as i' +
        'mpuestosinternos from temp ')
    Params = <>
    ConfCampos.Strings = (
      'descripcion,t'
      'cantidad,d'
      'monto,d'
      'IVA,d'
      'impuestosinternos,d')
    Left = 184
    Top = 168
  end
  object MQpagos: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select t as descripcion,d as monto from temp ')
    Params = <>
    ConfCampos.Strings = (
      'descripcion,t'
      'monto,d')
    Left = 312
    Top = 168
  end
end
