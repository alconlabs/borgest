inherited ImprimirListaPrecios: TImprimirListaPrecios
  Caption = 'Imprimir Lista de Precios'
  ClientHeight = 519
  ClientWidth = 735
  OnCreate = FormCreate
  ExplicitWidth = 751
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 735
    Height = 519
    ExplicitWidth = 743
    ExplicitHeight = 519
    FullHeight = 0
    object Label21: TLabel [0]
      Left = 31
      Top = 20
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rubro'
    end
    object Label22: TLabel [1]
      Left = 11
      Top = 44
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    inherited btncancelar: TButton
      Left = 51
      Top = 488
      ExplicitLeft = 51
      ExplicitTop = 488
    end
    inherited btnguardar: TButton
      Left = 142
      Top = 488
      Visible = False
      OnClick = btnguardarClick
      ExplicitLeft = 142
      ExplicitTop = 488
    end
    object rubro_id: TSqlComboBox
      Left = 66
      Top = 17
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from rubros'
        'order by rubro_nombre')
      ConfTabla = 'rubros'
      Confcampo_codigo = 'rubro_id'
      Confcampo_nomb = 'rubro_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object proveedor_id: TSqlComboBox
      Left = 66
      Top = 41
      Width = 393
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from proveedores'
        'order by proveedor_nombre')
      ConfTabla = 'proveedores'
      Confcampo_codigo = 'proveedor_id'
      Confcampo_nomb = 'proveedor_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object btnfiltrar: TButton
      Left = 465
      Top = 39
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 4
      OnClick = btncancelarClick
    end
    object productos: TSqlListView
      Left = 11
      Top = 70
      Width = 718
      Height = 388
      Columns = <>
      HoverTime = -1
      TabOrder = 5
      ViewStyle = vsReport
      AutoHint = False
      ClipboardEnable = False
      ColumnSize.Save = False
      ColumnSize.Stretch = False
      ColumnSize.Storage = stInifile
      FilterTimeOut = 500
      PrintSettings.FooterSize = 0
      PrintSettings.HeaderSize = 0
      PrintSettings.Time = ppNone
      PrintSettings.Date = ppNone
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.PageNr = ppNone
      PrintSettings.Title = ppNone
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
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
      PrintSettings.Borders = pbNoborder
      PrintSettings.BorderStyle = psSolid
      PrintSettings.Centered = False
      PrintSettings.RepeatHeaders = False
      PrintSettings.LeftSize = 0
      PrintSettings.RightSize = 0
      PrintSettings.ColumnSpacing = 0
      PrintSettings.RowSpacing = 0
      PrintSettings.Orientation = poPortrait
      PrintSettings.FixedWidth = 0
      PrintSettings.FixedHeight = 0
      PrintSettings.UseFixedHeight = False
      PrintSettings.UseFixedWidth = False
      PrintSettings.FitToPage = fpNever
      PrintSettings.PageNumSep = '/'
      HTMLHint = False
      HTMLSettings.Width = 100
      HeaderHotTrack = False
      HeaderDragDrop = False
      HeaderFlatStyle = False
      HeaderOwnerDraw = False
      HeaderHeight = 13
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = []
      ProgressSettings.ColorFrom = clSilver
      ProgressSettings.FontColorFrom = clBlack
      ProgressSettings.ColorTo = clWhite
      ProgressSettings.FontColorTo = clGray
      SelectionRTFKeep = False
      ScrollHint = False
      SelectionColor = clHighlight
      SelectionTextColor = clHighlightText
      SizeWithForm = False
      SortDirection = sdAscending
      SortShow = False
      SortIndicator = siLeft
      StretchColumn = False
      SubImages = False
      SubItemEdit = False
      SubItemSelect = False
      VAlignment = vtaCenter
      ItemHeight = 13
      SaveHeader = False
      LoadHeader = False
      ReArrangeItems = False
      DetailView.Visible = False
      DetailView.Column = 0
      DetailView.Font.Charset = DEFAULT_CHARSET
      DetailView.Font.Color = clBlue
      DetailView.Font.Height = -11
      DetailView.Font.Name = 'Tahoma'
      DetailView.Font.Style = []
      DetailView.Height = 16
      DetailView.Indent = 0
      DetailView.SplitLine = False
      Version = '1.6.2.2'
      ConfSqlConnection = Princ.ZBase
      ConfField = tiProdcutos
      ConfIni = Princ.ini1
      Tag2 = 0
    end
    object btnimprimir: TButton
      Left = 654
      Top = 464
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 6
      OnClick = btnimprimirClick
    end
    object producto_precioventa: TGTBComboBox
      Left = 503
      Top = 466
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Tag2 = 0
      valores.Strings = (
        'producto_precioventa1'
        'producto_precioventa2'
        'producto_precioventa3'
        'producto_precioventa4')
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 680
    Top = 8
  end
  object tiProdcutos: TTitles
    cam_codi = 'producto_id'
    cam_text = 'producto_nombre'
    Titulos.Strings = (
      'Codigo'
      'Producto'
      'Proveedor'
      'Rubro'
      'P. Costo'
      'P.Venta1'
      'P.Venta2'
      'P.Venta3'
      'P.Venta4')
    Campos.Strings = (
      'producto_id'
      'producto_nombre'
      'proveedor_nombre'
      'rubro_nombre'
      'producto_preciocosto'
      'producto_precioventa1'
      'producto_precioventa2'
      'producto_precioventa3'
      'producto_precioventa4')
    Memo.Strings = (
      'select * from productos'
      
        'inner join proveedores on productos.proveedor_id=proveedores.pro' +
        'veedor_id'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      'order by producto_nombre')
    Left = 560
    Top = 104
  end
end
