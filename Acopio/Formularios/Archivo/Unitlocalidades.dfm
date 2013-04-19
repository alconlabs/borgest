object localidades: Tlocalidades
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Localidades'
  ClientHeight = 456
  ClientWidth = 934
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
    Width = 934
    Height = 336
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
    object panelbotonera: TAdvPanel
      Left = 830
      Top = 1
      Width = 103
      Height = 295
      Align = alRight
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
      object Button2: TButton
        Left = 1
        Top = 83
        Width = 101
        Height = 41
        Align = alTop
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 1
        Top = 42
        Width = 101
        Height = 41
        Align = alTop
        Caption = 'Modificar'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 1
        Top = 1
        Width = 101
        Height = 41
        Align = alTop
        Caption = 'Crear Nuevo'
        TabOrder = 0
        OnClick = Button4Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 829
      Height = 295
      Align = alClient
      DataSource = DSCgrilla
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
          FieldName = 'localidad_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'localidad_nombre'
          Title.Caption = 'Localidad'
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'provincia_nombre'
          Title.Caption = 'Provincia'
          Width = 325
          Visible = True
        end>
    end
    object panelfiltros: TAdvPanel
      Left = 1
      Top = 296
      Width = 932
      Height = 21
      Align = alBottom
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
      object Button5: TButton
        Left = 828
        Top = 1
        Width = 103
        Height = 19
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 3
        OnClick = Button5Click
      end
      object fil_provincia_nombre: TEdit
        Left = 476
        Top = 1
        Width = 325
        Height = 19
        Align = alLeft
        TabOrder = 2
        ExplicitHeight = 21
      end
      object fil_localidad_id: TEdit
        Left = 1
        Top = 1
        Width = 85
        Height = 19
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 21
      end
      object fil_localidad_nombre: TEdit
        Left = 86
        Top = 1
        Width = 390
        Height = 19
        Align = alLeft
        TabOrder = 1
        ExplicitHeight = 21
      end
    end
  end
  object panelabm: TAdvPanel
    Left = 0
    Top = 336
    Width = 934
    Height = 120
    Align = alBottom
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
    object Label1: TLabel
      Left = 47
      Top = 9
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label5: TLabel
      Left = 34
      Top = 33
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    object Label11: TLabel
      Left = 36
      Top = 81
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object Label2: TLabel
      Left = 15
      Top = 57
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo Postal'
    end
    object localidad_id: TEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 755
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button6: TButton
      Left = 755
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = Button6Click
    end
    object localidad_nombre: TEdit
      Left = 86
      Top = 30
      Width = 634
      Height = 21
      TabOrder = 1
    end
    object provincia_id: TSqlComboBox
      Left = 86
      Top = 78
      Width = 203
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from provincias'
        'order by provincia_nombre')
      ConfTabla = 'provincias'
      Confcampo_codigo = 'provincia_id'
      Confcampo_nomb = 'provincia_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object localidad_codigopostal: TEdit
      Left = 86
      Top = 54
      Width = 203
      Height = 21
      TabOrder = 2
    end
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from localidades'
      
        'inner join provincias on localidades.provincia_id=provincias.pro' +
        'vincia_id'
      'order by localidad_nombre')
    Params = <>
    Left = 216
    Top = 112
  end
  object DSCgrilla: TDataSource
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
end
