object busquedabase: Tbusquedabase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Busqueda'
  ClientHeight = 510
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 510
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
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 1003
      Height = 454
      Align = alClient
      DataSource = DSCGrilla
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 47
          Visible = True
        end>
    end
    object panelfiltros: TAdvPanel
      Left = 0
      Top = 454
      Width = 1003
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      Color = 15524577
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
      Styler = Princ.AdvPanelStyler1
      FullHeight = 0
      object btnfiltrar: TButton
        Left = 900
        Top = 0
        Width = 103
        Height = 22
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 1
        OnClick = btnfiltrarClick
      end
      object fil_id: TGTBEdit
        Left = 0
        Top = 0
        Width = 72
        Height = 22
        Align = alLeft
        TabOrder = 0
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        ExplicitHeight = 21
      end
    end
    object AdvPanel1: TAdvPanel
      Left = 0
      Top = 476
      Width = 1003
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      Color = 15524577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      Styler = Princ.AdvPanelStyler1
      FullHeight = 0
      object btnaceptar: TButton
        Left = 912
        Top = 3
        Width = 75
        Height = 29
        Caption = 'Aceptar'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnaceptarClick
      end
      object btncancelar: TButton
        Left = 832
        Top = 3
        Width = 75
        Height = 29
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      'order by producto_nombre')
    Params = <>
    Left = 248
    Top = 72
  end
  object DSCGrilla: TDataSource
    DataSet = ZQGrilla
    Left = 336
    Top = 128
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 160
    Top = 112
  end
  object CustomizeGrid1: TCustomizeGrid
    Active = True
    Grid = DBGrid1
    AlternateRows.Active = True
    AlternateRows.Color1 = clCream
    AlternateRows.Color2 = clWhite
    AlternateRows.Style = asStandard
    DataStyles.TextMemos = False
    DataStyles.CheckBox = False
    SortOptions.ChangeCursorOnTitle = False
    Left = 544
    Top = 120
  end
end
