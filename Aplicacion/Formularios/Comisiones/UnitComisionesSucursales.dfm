inherited ComisionesSucursales: TComisionesSucursales
  Caption = 'Comisiones Sucursales'
  ClientWidth = 1029
  ExplicitWidth = 1045
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1029
    Height = 206
    ExplicitWidth = 1029
    ExplicitHeight = 206
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 926
      Height = 185
      ExplicitLeft = 926
      ExplicitHeight = 185
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Width = 926
      Height = 185
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_codigo'
          Title.Caption = 'Codigo'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Nombre'
          Width = 391
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_preciocosto'
          Title.Caption = 'P.Compra'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa1'
          Title.Caption = 'P.Venta'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 207
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Top = 185
      Width = 1029
      ExplicitTop = 185
      ExplicitWidth = 1029
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 926
        ExplicitLeft = 926
      end
      object fil_producto_nombre: TEdit
        Left = 85
        Top = 0
        Width = 390
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_producto_preciocosto: TEdit
        Left = 475
        Top = 0
        Width = 110
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_producto_precioventa1: TEdit
        Left = 585
        Top = 0
        Width = 110
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_rubro_nombre: TEdit
        Left = 695
        Top = 0
        Width = 211
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
    end
  end
  inherited panelabm: TAdvPanel
    Top = 225
    Width = 1029
    Height = 231
    ExplicitTop = 225
    ExplicitWidth = 1029
    ExplicitHeight = 231
    FullHeight = 0
    inherited btnguardar: TButton
      Left = 763
      OnClick = btnguardarClick
      ExplicitLeft = 763
    end
    inherited btncancelar: TButton
      Left = 763
      ExplicitLeft = 763
    end
    object DBAdvGrid1: TDBAdvGrid
      Left = 0
      Top = 6
      Width = 757
      Height = 188
      Cursor = crDefault
      ColCount = 5
      DefaultRowHeight = 22
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      EditWithTags = True
      Filter = <>
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find next'
      SearchFooter.FindPrevCaption = 'Find previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      Version = '2.1.1.2'
      AutoCreateColumns = True
      AutoRemoveColumns = True
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 20
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Editor = edNone
          FieldName = 'sucursal_id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Codigo'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 64
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Editor = edNone
          FieldName = 'sucursal_nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Sucursal'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 428
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ComboItems.Strings = (
            'Porcentaje'
            'Cantidad')
          Editor = edComboList
          FieldName = 'comisionsucursal_tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Tipo'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 112
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Editor = edFloat
          FieldName = 'comisionsucursal_valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Valor'
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 106
        end>
      DataSource = DTSComisiones
      ShowUnicode = False
      ColWidths = (
        20
        64
        428
        112
        106)
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 206
    Width = 1029
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      'order by producto_nombre')
  end
  object DTSComisiones: TDataSource
    DataSet = ZQComisionesSucursales
    Left = 392
    Top = 336
  end
  object ZQComisionesSucursales: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQComisionesSucursalesBeforePost
    SQL.Strings = (
      'select * from sucursales'
      
        'left join comisionessucursal on sucursales.sucursal_id=comisione' +
        'ssucursal.sucursal_id'
      
        'left join productos on comisionessucursal.producto_id=productos.' +
        'producto_id'
      
        'where isnull(productos.producto_id) or productos.producto_id=:pr' +
        'oducto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    object ZQComisionesSucursalessucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQComisionesSucursalessucursal_nombre: TStringField
      FieldName = 'sucursal_nombre'
      Size = 100
    end
    object ZQComisionesSucursalessucursal_domicilio: TStringField
      FieldName = 'sucursal_domicilio'
      Size = 150
    end
    object ZQComisionesSucursalessucursal_telefono: TStringField
      FieldName = 'sucursal_telefono'
      Size = 45
    end
    object ZQComisionesSucursalesempresa_id: TIntegerField
      FieldName = 'empresa_id'
    end
    object ZQComisionesSucursalessucursal_tipoliquidvendedor: TStringField
      FieldName = 'sucursal_tipoliquidvendedor'
      Size = 45
    end
    object ZQComisionesSucursalessucursal_tipoliquidsucursal: TStringField
      FieldName = 'sucursal_tipoliquidsucursal'
      Size = 45
    end
    object ZQComisionesSucursalescomisionsucursal_id: TIntegerField
      FieldName = 'comisionsucursal_id'
    end
    object ZQComisionesSucursalescomisionsucursal_tipo: TStringField
      FieldName = 'comisionsucursal_tipo'
      Size = 45
    end
    object ZQComisionesSucursalescomisionsucursal_valor: TFloatField
      FieldName = 'comisionsucursal_valor'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQComisionesSucursalessucursal_id_1: TIntegerField
      FieldName = 'sucursal_id_1'
    end
    object ZQComisionesSucursalesproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQComisionesSucursalesproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
    end
    object ZQComisionesSucursalesproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQComisionesSucursalesproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQComisionesSucursalesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQComisionesSucursalesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQComisionesSucursalesproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object ZQComisionesSucursalesproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object ZQComisionesSucursalesproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQComisionesSucursalesproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object ZQComisionesSucursalestipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object ZQComisionesSucursalesrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object ZQComisionesSucursalesproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object ZQComisionesSucursalesproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object ZQComisionesSucursalesproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object ZQComisionesSucursalescalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object ZQComisionesSucursalespoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object ZQComisionesSucursalesproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQComisionesSucursalesproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQComisionesSucursalesproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQComisionesSucursalesproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQComisionesSucursalesproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQComisionesSucursalesproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQComisionesSucursalesproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQComisionesSucursalesproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
  end
  object ZQSucursales: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from sucursales')
    Params = <>
    Left = 136
    Top = 320
  end
end
