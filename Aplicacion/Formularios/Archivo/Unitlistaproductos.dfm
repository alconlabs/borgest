object listaproductos: Tlistaproductos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Productos'
  ClientHeight = 450
  ClientWidth = 1043
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 450
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
    object panelbotonera: TAdvPanel
      Left = 940
      Top = 0
      Width = 103
      Height = 411
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
      object btnelimi: TButton
        Left = 0
        Top = 82
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = btnelimiClick
        ExplicitLeft = 6
      end
      object btnmodi: TButton
        Left = 0
        Top = 41
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Modificar'
        TabOrder = 1
        OnClick = btnmodiClick
      end
      object btncrear: TButton
        Left = 0
        Top = 0
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Crear Nuevo'
        TabOrder = 0
        OnClick = btncrearClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 940
      Height = 411
      Align = alClient
      DataSource = DSCProveedores
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
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Nombre'
          Width = 380
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_preciocosto'
          Title.Caption = 'P.Compra'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa1'
          Title.Caption = 'P.Venta'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
          Width = 160
          Visible = True
        end>
    end
    object panelfiltros: TAdvPanel
      Left = 0
      Top = 411
      Width = 1043
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
      object Button5: TButton
        Left = 940
        Top = 0
        Width = 103
        Height = 21
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 5
        OnClick = Button5Click
      end
      object fil_producto_precioventa1: TEdit
        Left = 540
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_producto_id: TEdit
        Left = 0
        Top = 0
        Width = 82
        Height = 21
        Align = alLeft
        TabOrder = 0
        OnKeyPress = fil_producto_idKeyPress
      end
      object fil_producto_nombre: TEdit
        Left = 82
        Top = 0
        Width = 380
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
      object fil_rubro_nombre: TEdit
        Left = 618
        Top = 0
        Width = 110
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_producto_preciocosto: TEdit
        Left = 462
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_proveedor_nombre: TEdit
        Left = 728
        Top = 0
        Width = 160
        Height = 21
        Align = alLeft
        TabOrder = 6
      end
    end
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    BeforeOpen = ZQGrillaBeforeOpen
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      
        'inner join proveedores on productos.proveedor_id=proveedores.pro' +
        'veedor_id'
      'order by producto_nombre')
    Params = <>
    Left = 216
    Top = 112
    object ZQGrillaproducto_id: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object ZQGrillaproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQGrillaproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQGrillaproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQGrillaproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQGrillaproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQGrillaproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQGrillaproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQGrillaproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQGrillatipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
      Required = True
    end
    object ZQGrillarubro_id: TIntegerField
      FieldName = 'rubro_id'
      Required = True
    end
    object ZQGrillaproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQGrillaproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQGrillaproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQGrillacalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
      Required = True
    end
    object ZQGrillapoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
      Required = True
    end
    object ZQGrillaproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQGrillaproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQGrillaproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQGrillaproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQGrillaproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
      Required = True
    end
    object ZQGrillaproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQGrillaproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQGrillaproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object ZQGrillarubro_id_1: TIntegerField
      FieldName = 'rubro_id_1'
      Required = True
    end
    object ZQGrillarubro_nombre: TStringField
      FieldName = 'rubro_nombre'
      Size = 45
    end
    object ZQGrillaproveedor_id_1: TIntegerField
      FieldName = 'proveedor_id_1'
      Required = True
    end
    object ZQGrillaproveedor_nombre: TStringField
      FieldName = 'proveedor_nombre'
      Size = 100
    end
    object ZQGrillaproveedor_domicilio: TStringField
      FieldName = 'proveedor_domicilio'
      Size = 150
    end
    object ZQGrillaproveedor_documentonro: TStringField
      FieldName = 'proveedor_documentonro'
      Size = 45
    end
    object ZQGrillaproveedor_documentotipo: TStringField
      FieldName = 'proveedor_documentotipo'
      Size = 45
    end
    object ZQGrillaproveedor_telefono: TStringField
      FieldName = 'proveedor_telefono'
      Size = 45
    end
    object ZQGrillaproveedor_celular: TStringField
      FieldName = 'proveedor_celular'
      Size = 45
    end
    object ZQGrillaproveedor_mail: TStringField
      FieldName = 'proveedor_mail'
      Size = 45
    end
    object ZQGrillacondicioniva_id: TIntegerField
      FieldName = 'condicioniva_id'
      Required = True
    end
    object ZQGrillaproveedor_condicionventa: TStringField
      FieldName = 'proveedor_condicionventa'
      Size = 45
    end
    object ZQGrillaproveedor_tipo: TStringField
      FieldName = 'proveedor_tipo'
      Size = 45
    end
    object ZQGrillalocalidad_id: TIntegerField
      FieldName = 'localidad_id'
      Required = True
    end
  end
  object DSCProveedores: TDataSource
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
    Left = 496
    Top = 176
  end
end
