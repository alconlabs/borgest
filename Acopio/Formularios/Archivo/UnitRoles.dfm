object Roles: TRoles
  Left = 0
  Top = 0
  Caption = 'Roles'
  ClientHeight = 165
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 448
    Height = 113
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 3
    object TabSheet2: TTabSheet
      Caption = 'General'
      ImageIndex = 1
      object Label3: TLabel
        Left = 29
        Top = 19
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 13
        Top = 42
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descripci'#243'n'
      end
      object rol_id: TDBAdvEdit
        Left = 77
        Top = 16
        Width = 85
        Height = 21
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
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0'
        Visible = True
        Version = '2.7.0.5'
      end
      object rol_nombre: TEdit
        Left = 77
        Top = 40
        Width = 341
        Height = 21
        TabOrder = 1
      end
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 148
    Width = 448
    Height = 17
    Align = alBottom
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
    Left = 138
    Top = 115
    Width = 93
    Height = 24
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = btnguardarClick
  end
  object btncancelar: TButton
    Left = 230
    Top = 115
    Width = 93
    Height = 24
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btncancelarClick
  end
  object ZQSelect: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from roles'
      'where rol_id=:rol_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'rol_id'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rol_id'
        ParamType = ptUnknown
      end>
  end
  object ZQExecSql: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from roles'
      'where rol_codi=:rol_codi')
    Params = <
      item
        DataType = ftUnknown
        Name = 'rol_codi'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rol_codi'
        ParamType = ptUnknown
      end>
  end
end
