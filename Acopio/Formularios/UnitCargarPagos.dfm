object CargarPagos: TCargarPagos
  Left = 0
  Top = 0
  Caption = 'Pago'
  ClientHeight = 115
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 115
    Align = alClient
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
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label5: TLabel
      Left = 19
      Top = 57
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total a Cobrar'
    end
    object Label1: TLabel
      Left = 30
      Top = 33
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descripcion'
    end
    object Label2: TLabel
      Left = 65
      Top = 9
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    object documentopago_importe: TMoneyEdit
      Left = 92
      Top = 54
      Width = 109
      Height = 21
      CalculatorLook.ButtonWidth = 24
      CalculatorLook.ButtonHeight = 24
      CalculatorLook.ButtonColor = clSilver
      CalculatorLook.Color = clWhite
      CalculatorLook.Flat = False
      CalculatorLook.Font.Charset = DEFAULT_CHARSET
      CalculatorLook.Font.Color = clWindowText
      CalculatorLook.Font.Height = -11
      CalculatorLook.Font.Name = 'Tahoma'
      CalculatorLook.Font.Style = []
      TabOrder = 2
      Version = '1.1.0.1'
    end
    object documentopago_nombre: TEdit
      Left = 92
      Top = 30
      Width = 453
      Height = 21
      TabOrder = 1
    end
    object tipopago_id: TSqlComboBox
      Left = 92
      Top = 6
      Width = 285
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tipospago'
        'order by tipopago_id')
      Confcampo_codigo = 'tipopago_id'
      Confcampo_nomb = 'tipopago_nombre'
      Tag2 = 0
    end
    object btnguardar: TButton
      Left = 389
      Top = 82
      Width = 75
      Height = 25
      Caption = 'Guardar'
      ModalResult = 1
      TabOrder = 3
    end
    object btncancelar: TButton
      Left = 462
      Top = 82
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
  end
end
