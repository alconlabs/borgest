object productos: Tproductos
  Left = 0
  Top = 0
  Caption = 'productos'
  ClientHeight = 580
  ClientWidth = 790
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
    Width = 790
    Height = 580
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
    StatusBar.BevelInner = True
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Text = 'F9-Guardar todo'
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object btncancelar: TButton
      Left = 698
      Top = 532
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 617
      Top = 532
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = btnguardarClick
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 790
      Height = 529
      ActivePage = TabSheet2
      Align = alTop
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'Datos Principales'
        ImageIndex = 1
        object Label17: TLabel
          Left = 39
          Top = 156
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Precio Compra'
        end
        object Label21: TLabel
          Left = 79
          Top = 108
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rubro'
        end
        object Label1: TLabel
          Left = 71
          Top = 84
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre'
        end
        object Label3: TLabel
          Left = 69
          Top = 12
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo1'
        end
        object Label4: TLabel
          Left = 69
          Top = 36
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo2'
        end
        object Label5: TLabel
          Left = 27
          Top = 60
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo de Barras'
        end
        object lblNombrePrecio1: TLabel
          Left = 114
          Top = 310
          Width = 70
          Height = 13
          Caption = 'Precio Venta 1'
        end
        object Label7: TLabel
          Left = 75
          Top = 352
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Estado'
        end
        object Label2: TLabel
          Left = 37
          Top = 401
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observaciones'
        end
        object Label8: TLabel
          Left = 67
          Top = 290
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo IVA'
        end
        object lblNombrePrecio2: TLabel
          Left = 250
          Top = 310
          Width = 70
          Height = 13
          Caption = 'Precio Venta 2'
        end
        object lblNombrePrecio3: TLabel
          Left = 386
          Top = 310
          Width = 70
          Height = 13
          Caption = 'Precio Venta 3'
        end
        object lblNombrePrecio4: TLabel
          Left = 522
          Top = 310
          Width = 70
          Height = 13
          Caption = 'Precio Venta 4'
        end
        object Label12: TLabel
          Left = 25
          Top = 180
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Calculo de Precio'
        end
        object Label13: TLabel
          Left = 20
          Top = 204
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Precio Venta Base'
        end
        object Label14: TLabel
          Left = 26
          Top = 228
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Politica de Precio'
        end
        object Label15: TLabel
          Left = 114
          Top = 248
          Width = 32
          Height = 13
          Caption = 'Neto 1'
        end
        object Label16: TLabel
          Left = 250
          Top = 248
          Width = 32
          Height = 13
          Caption = 'Neto 2'
        end
        object Label18: TLabel
          Left = 386
          Top = 248
          Width = 32
          Height = 13
          Caption = 'Neto 3'
        end
        object Label19: TLabel
          Left = 522
          Top = 248
          Width = 32
          Height = 13
          Caption = 'Neto 4'
        end
        object Label20: TLabel
          Left = 377
          Top = 380
          Width = 28
          Height = 13
          Caption = 'Stock'
        end
        object Label22: TLabel
          Left = 59
          Top = 132
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
        end
        object Label23: TLabel
          Left = 5
          Top = 376
          Width = 103
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo de Referencia'
        end
        object rubro_id: TSqlComboBox
          Left = 114
          Top = 105
          Width = 206
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from rubros'
            'order by rubro_nombre')
          ConfTabla = 'rubros'
          Confcampo_codigo = 'rubro_id'
          Confcampo_nomb = 'rubro_nombre'
          Tag2 = 0
          ConfNuevo = True
        end
        object producto_nombre: TEdit
          Left = 114
          Top = 81
          Width = 529
          Height = 21
          TabOrder = 3
        end
        object producto_estado: TComboBox
          Left = 114
          Top = 349
          Width = 121
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 20
          Text = 'DISPONIBLE'
          Items.Strings = (
            'DISPONIBLE'
            'DISCONTINUADO'
            'EN PAPELERA'
            'REVISAR')
        end
        object producto_id: TEdit
          Left = 114
          Top = 9
          Width = 103
          Height = 21
          TabOrder = 0
        end
        object producto_codigo: TEdit
          Left = 114
          Top = 33
          Width = 206
          Height = 21
          TabOrder = 1
        end
        object producto_codigobarras: TEdit
          Left = 114
          Top = 57
          Width = 206
          Height = 21
          TabOrder = 2
        end
        object producto_observaciones: TMemo
          Left = 114
          Top = 401
          Width = 257
          Height = 95
          TabOrder = 22
        end
        object tipoiva_id: TSqlComboBox
          Left = 114
          Top = 287
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 15
          OnExit = tipoiva_idExit
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from tipoiva'
            'order by tipoiva_nombre')
          ConfTabla = 'tipoiva'
          Confcampo_codigo = 'tipoiva_id'
          Confcampo_nomb = 'tipoiva_nombre'
          Tag2 = 0
        end
        object producto_precioventa1: TDBAdvEdit
          Left = 114
          Top = 325
          Width = 121
          Height = 21
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 16
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_precioventa2: TDBAdvEdit
          Left = 250
          Top = 325
          Width = 121
          Height = 21
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 17
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_precioventa3: TDBAdvEdit
          Left = 386
          Top = 325
          Width = 121
          Height = 21
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 18
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_precioventa4: TDBAdvEdit
          Left = 522
          Top = 325
          Width = 121
          Height = 21
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 19
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_preciocosto: TDBAdvEdit
          Left = 114
          Top = 153
          Width = 121
          Height = 21
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 6
          Text = '0,00'
          Visible = True
          OnExit = producto_preciocostoExit
          Version = '2.7.0.5'
        end
        object calculoprecio_id: TSqlComboBox
          Left = 114
          Top = 177
          Width = 206
          Height = 21
          ItemHeight = 13
          TabOrder = 7
          OnKeyDown = calculoprecio_idKeyDown
          OnSelect = calculoprecio_idSelect
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from calculoprecios'
            'order by calculoprecio_nombre')
          ConfTabla = 'calculoprecios'
          Confcampo_codigo = 'calculoprecio_id'
          Confcampo_nomb = 'calculoprecio_nombre'
          Tag2 = 0
        end
        object producto_precioventabase: TDBAdvEdit
          Left = 114
          Top = 201
          Width = 121
          Height = 21
          TabStop = False
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 9
          Text = '0,00'
          Visible = True
          OnExit = producto_precioventabaseExit
          Version = '2.7.0.5'
        end
        object politicaprecio_id: TSqlComboBox
          Left = 114
          Top = 225
          Width = 329
          Height = 21
          ItemHeight = 13
          TabOrder = 10
          OnExit = politicaprecio_idExit
          Confbase = Princ.ZBase
          Confsql.Strings = (
            
              'select *, concat(politicaprecio_nombre, "   ",ROUND(politicaprec' +
              'io_politica1,2), " - ", ROUND(politicaprecio_politica2,2), " - "' +
              ', ROUND(politicaprecio_politica3,2), " - ", ROUND(politicaprecio' +
              '_politica4,2)) as descripcion from politicasdeprecios'
            'order by politicaprecio_nombre')
          ConfTabla = 'politicasdeprecios'
          Confcampo_codigo = 'politicaprecio_id'
          Confcampo_nomb = 'descripcion'
          Tag2 = 0
        end
        object producto_neto1: TDBAdvEdit
          Left = 114
          Top = 263
          Width = 121
          Height = 21
          TabStop = False
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 11
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_neto2: TDBAdvEdit
          Left = 250
          Top = 263
          Width = 121
          Height = 21
          TabStop = False
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 12
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_neto3: TDBAdvEdit
          Left = 386
          Top = 263
          Width = 121
          Height = 21
          TabStop = False
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 13
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_neto4: TDBAdvEdit
          Left = 522
          Top = 263
          Width = 121
          Height = 21
          TabStop = False
          AutoThousandSeparator = False
          EditType = etFloat
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 14
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object DBGrid1: TDBGrid
          Left = 377
          Top = 401
          Width = 399
          Height = 95
          TabStop = False
          DataSource = DataSource1
          TabOrder = 23
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'deposito_nombre'
              ReadOnly = True
              Title.Caption = 'Deposito'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producdepo_stockinicial'
              Title.Caption = 'Inicial'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producdepo_puntorepos'
              Title.Caption = 'Pto.Rep.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producdepo_stockminimo'
              Title.Caption = 'Min.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producdepo_stockactual'
              Title.Caption = 'Actual'
              Width = 50
              Visible = True
            end>
        end
        object proveedor_id: TSqlComboBox
          Left = 114
          Top = 129
          Width = 393
          Height = 21
          ItemHeight = 13
          TabOrder = 5
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from proveedores'
            'order by proveedor_nombre')
          ConfTabla = 'proveedores'
          Confcampo_codigo = 'proveedor_id'
          Confcampo_nomb = 'proveedor_nombre'
          Tag2 = 0
        end
        object btncalculopreciodetaprod: TButton
          Left = 344
          Top = 175
          Width = 99
          Height = 25
          Caption = 'Agregar Calculos'
          TabOrder = 8
          OnClick = btncalculopreciodetaprodClick
        end
        object producto_codigoreferencia: TEdit
          Left = 114
          Top = 373
          Width = 206
          Height = 21
          TabOrder = 21
        end
      end
    end
  end
  object ZQproductos: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQproductosAfterOpen
    SQL.Strings = (
      'select * from productos'
      'where producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productos'
      'where producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = MQproductodeposito
    Left = 672
    Top = 168
  end
  object MQproductodeposito: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as deposito_id,t as deposito_nombre,i as producto_id,d ' +
        'as producdepo_puntorepos,d as producdepo_stockminimo,d as produc' +
        'depo_stockactual,d as producdepo_stockinicial from temp ')
    Params = <>
    ConfCampos.Strings = (
      'deposito_id,i'
      'deposito_nombre,t'
      'producto_id,i'
      'producdepo_puntorepos,d'
      'producdepo_stockminimo,d'
      'producdepo_stockactual,d'
      'producdepo_stockinicial,d')
    Left = 680
    Top = 328
    object MQproductodepositodeposito_id: TIntegerField
      FieldName = 'deposito_id'
    end
    object MQproductodepositodeposito_nombre: TStringField
      FieldName = 'deposito_nombre'
      Size = 255
    end
    object MQproductodepositoproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object MQproductodepositoproducdepo_puntorepos: TFloatField
      FieldName = 'producdepo_puntorepos'
      DisplayFormat = '0.00'
    end
    object MQproductodepositoproducdepo_stockminimo: TFloatField
      FieldName = 'producdepo_stockminimo'
      DisplayFormat = '0.00'
    end
    object MQproductodepositoproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQproductodepositoproducdepo_stockinicial: TFloatField
      FieldName = 'producdepo_stockinicial'
      DisplayFormat = '0.00'
    end
  end
  object ZQDepositos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from depositos')
    Params = <>
    Left = 664
    Top = 64
  end
  object ZQproductodeposito: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productodeposito'
      'where deposito_id=:deposito_id and'
      'producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'deposito_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 704
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'deposito_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object ZQCalculopreciodetaprod: TZQuery
    Connection = Princ.ZBase
    SortedFields = 'calculopreciodetaprod_orden'
    CachedUpdates = True
    SQL.Strings = (
      'select * from calculopreciodetaprod')
    Params = <>
    IndexFieldNames = 'calculopreciodetaprod_orden Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 536
    Top = 184
    object ZQCalculopreciodetaprodcalculopreciodetaprod_id: TIntegerField
      FieldName = 'calculopreciodetaprod_id'
      Required = True
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_descripcion: TStringField
      FieldName = 'calculopreciodetaprod_descripcion'
      Size = 45
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_orden: TIntegerField
      FieldName = 'calculopreciodetaprod_orden'
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_tipo: TStringField
      FieldName = 'calculopreciodetaprod_tipo'
      Size = 15
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_valor: TFloatField
      FieldName = 'calculopreciodetaprod_valor'
    end
    object ZQCalculopreciodetaprodproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
  end
end
