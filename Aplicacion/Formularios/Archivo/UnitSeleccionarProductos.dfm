inherited SeleccionarProductos: TSeleccionarProductos
  Caption = 'Imprimir Lista de Precios'
  ClientHeight = 519
  ClientWidth = 865
  ExplicitTop = -134
  ExplicitWidth = 881
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 865
    Height = 519
    StatusBar.BevelInner = True
    ExplicitWidth = 865
    ExplicitHeight = 519
    FullHeight = 0
    inherited btncancelar: TButton
      Left = 685
      Top = 464
      Cancel = True
      Visible = True
      ExplicitLeft = 685
      ExplicitTop = 464
    end
    inherited btnguardar: TButton
      Left = 142
      Top = 464
      Visible = False
      ExplicitLeft = 142
      ExplicitTop = 464
    end
    object productos: TSqlListView
      Left = 11
      Top = 16
      Width = 846
      Height = 442
      Columns = <>
      HoverTime = -1
      TabOrder = 2
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
      ConfTodosCheckeados = True
    end
    object btnimprimir: TButton
      Left = 782
      Top = 464
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 3
      OnClick = btnimprimirClick
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 680
    Top = 8
  end
  object tiProdcutos: TTitles
    cam_codi = 'productos.producto_id'
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
