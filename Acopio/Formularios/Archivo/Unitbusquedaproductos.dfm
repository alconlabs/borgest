object busquedaproductos: Tbusquedaproductos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Productos'
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
  OnCreate = FormCreate
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
    object DBGrid1: TDBGrid
      Left = 1
      Top = 34
      Width = 1001
      Height = 401
      Align = alClient
      DataSource = DSCProveedores
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_codigo'
          Title.Caption = 'Codigo2'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Nombre'
          Width = 260
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_preciocosto'
          Title.Caption = 'P.Compra'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa1'
          Title.Caption = 'P.Venta'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producdepo_stockactual'
          Title.Caption = 'Stock'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
          Width = 150
          Visible = True
        end>
    end
    object panelfiltros: TAdvPanel
      Left = 1
      Top = 435
      Width = 1001
      Height = 22
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
      ExplicitLeft = 0
      ExplicitTop = 436
      ExplicitWidth = 1003
      FullHeight = 0
      object Button5: TButton
        Left = 897
        Top = 1
        Width = 103
        Height = 20
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 8
        OnClick = Button5Click
        ExplicitLeft = 900
        ExplicitTop = 0
        ExplicitHeight = 22
      end
      object fil_producto_precioventa1: TEdit
        Left = 483
        Top = 1
        Width = 70
        Height = 20
        Align = alLeft
        TabOrder = 4
        ExplicitLeft = 482
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_producto_id: TEdit
        Left = 1
        Top = 1
        Width = 72
        Height = 20
        Align = alLeft
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_producto_nombre: TEdit
        Left = 153
        Top = 1
        Width = 260
        Height = 20
        Align = alLeft
        TabOrder = 2
        ExplicitLeft = 152
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_rubro_nombre: TEdit
        Left = 603
        Top = 1
        Width = 100
        Height = 20
        Align = alLeft
        TabOrder = 6
        ExplicitLeft = 602
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_producto_preciocosto: TEdit
        Left = 413
        Top = 1
        Width = 70
        Height = 20
        Align = alLeft
        TabOrder = 3
        ExplicitLeft = 412
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_producto_codigo: TEdit
        Left = 73
        Top = 1
        Width = 80
        Height = 20
        Align = alLeft
        TabOrder = 1
        ExplicitLeft = 72
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_producdepo_stockactual: TEdit
        Left = 553
        Top = 1
        Width = 50
        Height = 20
        Align = alLeft
        TabOrder = 5
        ExplicitLeft = 552
        ExplicitTop = 0
        ExplicitHeight = 21
      end
      object fil_proveedor_nombre: TEdit
        Left = 703
        Top = 1
        Width = 150
        Height = 20
        Align = alLeft
        TabOrder = 7
        ExplicitLeft = 702
        ExplicitTop = 0
        ExplicitHeight = 21
      end
    end
    object panelbusqueda: TAdvPanel
      Left = 1
      Top = 1
      Width = 1001
      Height = 33
      Align = alTop
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1003
      FullHeight = 0
      object btnbuscar: TButton
        Left = 444
        Top = 1
        Width = 103
        Height = 33
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = Button5Click
      end
      object campo: TComboBox
        Left = 8
        Top = 6
        Width = 131
        Height = 21
        ItemHeight = 13
        ItemIndex = 3
        TabOrder = 3
        Text = 'Nombre'
        Items.Strings = (
          'Codigo'
          'Codigo 2'
          'Codigo de Barras'
          'Nombre')
      end
      object buscar: TEdit
        Left = 144
        Top = 7
        Width = 297
        Height = 21
        TabOrder = 0
        OnKeyPress = buscarKeyPress
      end
      object tipo_busqueda: TComboBox
        Left = 552
        Top = 6
        Width = 105
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        TabStop = False
        Text = 'Comience con'
        Items.Strings = (
          'Comience con'
          'Contenga a')
      end
    end
    object AdvPanel1: TAdvPanel
      Left = 1
      Top = 457
      Width = 1001
      Height = 34
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
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
      ExplicitLeft = 0
      ExplicitTop = 458
      ExplicitWidth = 1003
      FullHeight = 0
      object btnaceptar: TButton
        Left = 832
        Top = 3
        Width = 75
        Height = 29
        Caption = 'Aceptar'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnaceptarClick
      end
      object btncancelar: TButton
        Left = 912
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
      
        'inner join proveedores on productos.proveedor_id=proveedores.pro' +
        'veedor_id'
      
        'inner join productodeposito on productos.producto_id=productodep' +
        'osito.producto_id'
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
    end
    object ZQGrillaproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
      DisplayFormat = '0.00'
    end
    object ZQGrillaproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQGrillaproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
      DisplayFormat = '0.00'
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
    end
    object ZQGrillaproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
      DisplayFormat = '0.00'
    end
    object ZQGrillaproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
      DisplayFormat = '0.00'
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
      DisplayFormat = '0.00'
    end
    object ZQGrillaproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
      DisplayFormat = '0.00'
    end
    object ZQGrillaproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
      DisplayFormat = '0.00'
    end
    object ZQGrillaproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
      DisplayFormat = '0.00'
    end
    object ZQGrillaproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
      Required = True
    end
    object ZQGrillaproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQGrillarubro_id_1: TIntegerField
      FieldName = 'rubro_id_1'
      Required = True
    end
    object ZQGrillarubro_nombre: TStringField
      FieldName = 'rubro_nombre'
      Size = 45
    end
    object ZQGrillaproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQGrillaproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
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
    object ZQGrillaproducdepo_id: TIntegerField
      FieldName = 'producdepo_id'
      Required = True
    end
    object ZQGrillaproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
    end
    object ZQGrillaproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
      Required = True
    end
    object ZQGrilladeposito_id: TIntegerField
      FieldName = 'deposito_id'
      Required = True
    end
    object ZQGrillaproducdepo_stockminimo: TFloatField
      FieldName = 'producdepo_stockminimo'
    end
    object ZQGrillaproducdepo_puntorepos: TFloatField
      FieldName = 'producdepo_puntorepos'
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
