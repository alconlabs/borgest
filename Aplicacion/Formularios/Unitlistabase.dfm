object listabase: Tlistabase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  ClientHeight = 456
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 934
    Height = 317
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
    object panelbotonera: TAdvPanel
      Left = 831
      Top = 0
      Width = 103
      Height = 296
      Align = alRight
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
      object btneliminar: TButton
        Left = 0
        Top = 82
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = btneliminarClick
      end
      object btnmodificar: TButton
        Left = 0
        Top = 41
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Modificar'
        TabOrder = 1
        OnClick = btnmodificarClick
      end
      object btnnuevo: TButton
        Left = 0
        Top = 0
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Crear Nuevo'
        TabOrder = 0
        OnClick = btnnuevoClick
        ExplicitLeft = 6
        ExplicitTop = -6
      end
      object btnanular: TButton
        Left = 0
        Top = 123
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Anular'
        TabOrder = 3
        Visible = False
        OnClick = btnanularClick
      end
      object btnver: TButton
        Left = 0
        Top = 205
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Ver'
        TabOrder = 4
        Visible = False
        ExplicitTop = 164
      end
      object btnclonar: TButton
        Left = 0
        Top = 164
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Clonar'
        TabOrder = 5
        ExplicitTop = 158
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 831
      Height = 296
      Align = alClient
      DataSource = DSCgrilla
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
    end
    object panelfiltros: TAdvPanel
      Left = 0
      Top = 296
      Width = 934
      Height = 21
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
      object btnfiltrar: TButton
        Left = 831
        Top = 0
        Width = 103
        Height = 21
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 1
        OnClick = btnfiltrarClick
      end
      object fil_id: TGTBEdit
        Left = 0
        Top = 0
        Width = 85
        Height = 21
        Align = alLeft
        TabOrder = 0
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
      end
    end
  end
  object panelabm: TAdvPanel
    Left = 0
    Top = 336
    Width = 934
    Height = 120
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
    Visible = False
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
    object btnguardar: TButton
      Left = 755
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
    end
    object btncancelar: TButton
      Left = 755
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btncancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 317
    Width = 934
    Height = 19
    Panels = <
      item
        Text = '0 Registros'
        Width = 110
      end
      item
        Text = 'tipo de busqueda'
        Width = 50
      end>
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQGrillaAfterOpen
    Params = <>
    Left = 160
    Top = 120
  end
  object DSCgrilla: TDataSource
    DataSet = ZQGrilla
    Left = 336
    Top = 128
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 560
    Top = 360
  end
end
