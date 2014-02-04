inherited ComisionesVendedores: TComisionesVendedores
  Caption = 'Comisiones Vendedores'
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
          FieldName = 'personal_id'
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
          FieldName = 'personal_nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'Vendedor'
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
          FieldName = 'comisionvendedor_tipo'
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
          FieldName = 'comisionvendedor_valor'
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
    ExplicitTop = 206
    ExplicitWidth = 1029
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      'order by producto_nombre')
  end
  object DTSComisiones: TDataSource
    DataSet = ZQComisionesVendedores
    Left = 392
    Top = 336
  end
  object ZQComisionesVendedores: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQComisionesVendedoresBeforePost
    SQL.Strings = (
      'select * from personal'
      
        'left join comisionesvendedor on personal.personal_id=comisionesv' +
        'endedor.personal_id'
      
        'left join productos on comisionesvendedor.producto_id=productos.' +
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
    object ZQComisionesVendedorespersonal_id: TIntegerField
      FieldName = 'personal_id'
      Required = True
    end
    object ZQComisionesVendedorespersonal_nombre: TStringField
      FieldName = 'personal_nombre'
      Size = 100
    end
    object ZQComisionesVendedorespersonal_domicilio: TStringField
      FieldName = 'personal_domicilio'
      Size = 150
    end
    object ZQComisionesVendedorespersonal_telefono: TStringField
      FieldName = 'personal_telefono'
      Size = 45
    end
    object ZQComisionesVendedorespersonal_celular: TStringField
      FieldName = 'personal_celular'
      Size = 45
    end
    object ZQComisionesVendedorespersonal_mail: TStringField
      FieldName = 'personal_mail'
      Size = 45
    end
    object ZQComisionesVendedorespersonal_usuario: TStringField
      FieldName = 'personal_usuario'
      Size = 45
    end
    object ZQComisionesVendedorespersonal_pass: TStringField
      FieldName = 'personal_pass'
      Size = 45
    end
    object ZQComisionesVendedoresperfil_id: TIntegerField
      FieldName = 'perfil_id'
    end
    object ZQComisionesVendedorescomisionvendedor_id: TIntegerField
      FieldName = 'comisionvendedor_id'
    end
    object ZQComisionesVendedorescomisionvendedor_tipo: TStringField
      FieldName = 'comisionvendedor_tipo'
      Size = 45
    end
    object ZQComisionesVendedorescomisionvendedor_valor: TFloatField
      FieldName = 'comisionvendedor_valor'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      currency = True
    end
    object ZQComisionesVendedorespersonal_id_1: TIntegerField
      FieldName = 'personal_id_1'
    end
    object ZQComisionesVendedoresproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQComisionesVendedoresproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
    end
    object ZQComisionesVendedoresproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQComisionesVendedoresproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQComisionesVendedoresproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQComisionesVendedoresproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQComisionesVendedoresproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object ZQComisionesVendedoresproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object ZQComisionesVendedoresproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQComisionesVendedoresproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object ZQComisionesVendedorestipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object ZQComisionesVendedoresrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object ZQComisionesVendedoresproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object ZQComisionesVendedoresproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object ZQComisionesVendedoresproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object ZQComisionesVendedorescalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object ZQComisionesVendedorespoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object ZQComisionesVendedoresproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQComisionesVendedoresproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQComisionesVendedoresproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQComisionesVendedoresproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQComisionesVendedoresproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQComisionesVendedoresproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQComisionesVendedoresproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQComisionesVendedoresproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
  end
  object ZQPersonal: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from personal')
    Params = <>
    Left = 136
    Top = 320
  end
end
