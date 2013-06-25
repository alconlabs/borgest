object Rubros: TRubros
  Left = 0
  Top = 0
  Caption = 'Rubros'
  ClientHeight = 173
  ClientWidth = 314
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 314
    Height = 121
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'General'
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 20
        Width = 43
        Height = 14
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 7
        Top = 42
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descripci'#243'n'
      end
      object DBAdvEdit1: TDBAdvEdit
        Left = 68
        Top = 16
        Width = 141
        Height = 22
        AutoThousandSeparator = False
        EditType = etNumeric
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = 15365376
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '1'
        Visible = True
        Version = '2.7.0.5'
      end
      object producto_codigo: TEdit
        Left = 69
        Top = 39
        Width = 212
        Height = 21
        TabOrder = 1
      end
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 155
    Width = 314
    Height = 18
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label27: TLabel
      Left = 6
      Top = 3
      Width = 92
      Height = 11
      Alignment = taRightJustify
      Caption = 'F9 - Guardar Todo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object btnguardar: TButton
    Left = 73
    Top = 122
    Width = 88
    Height = 24
    Caption = 'Aceptar'
    TabOrder = 2
  end
  object btncancelar: TButton
    Left = 161
    Top = 122
    Width = 88
    Height = 24
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btncancelarClick
  end
end
