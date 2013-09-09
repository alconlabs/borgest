inherited InformesVentas: TInformesVentas
  Caption = 'Informes de Ventas'
  ClientHeight = 238
  ClientWidth = 495
  ExplicitWidth = 511
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 495
    Height = 238
    ExplicitWidth = 495
    ExplicitHeight = 238
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 44
      Top = 32
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label2: TLabel [1]
      Left = 47
      Top = 56
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label3: TLabel [2]
      Left = 40
      Top = 80
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Informe'
    end
    object Label4: TLabel [3]
      Left = 32
      Top = 104
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label5: TLabel [4]
      Left = 353
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Punto de Venta'
    end
    object Label6: TLabel [5]
      Left = 46
      Top = 128
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label7: TLabel [6]
      Left = 34
      Top = 152
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    inherited btncancelar: TButton
      Left = 293
      Top = 176
      ExplicitLeft = 293
      ExplicitTop = 176
    end
    inherited btnguardar: TButton
      Left = 387
      Top = 176
      Caption = 'Imprimir'
      OnClick = btnguardarClick
      ExplicitLeft = 387
      ExplicitTop = 176
    end
    object desde_fecha: TDateTimePicker
      Left = 84
      Top = 29
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 2
    end
    object hasta_fecha: TDateTimePicker
      Left = 84
      Top = 53
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 3
    end
    object informe_tipo: TGTBComboBox
      Left = 84
      Top = 77
      Width = 263
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Costos por Ventas'
        'Informe de Precios de Ventas'
        'Informe de ventas'
        'Informe de ventas - Productos'
        'Informe de ventas - Productos - Cantidades'
        'Informe de Cobros'
        'Ranking de Ventas de Productos'
        'Informe de ventas C/Equipos'
        'Informe de Equipos')
      Tag2 = 0
      valores.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
    end
    object personal_id: TSqlComboBox
      Left = 84
      Top = 101
      Width = 263
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal'
        'order by personal_nombre')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object puntoventa_id: TSqlListView
      Left = 353
      Top = 22
      Width = 112
      Height = 124
      Columns = <>
      HoverTime = -1
      TabOrder = 6
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
      ConfField = Titles1
      ConfIni = Princ.ini1
      Tag2 = 0
      ConfTodosCheckeados = True
    end
    object cliente_id: TSqlComboBox
      Left = 84
      Top = 125
      Width = 263
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 7
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object provincia_id: TSqlComboBox
      Left = 84
      Top = 149
      Width = 263
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 8
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from provincias'
        'order by provincia_nombre')
      Confcampo_codigo = 'provincia_id'
      Confcampo_nomb = 'provincia_nombre'
      Tag2 = 0
      ConfTodos = True
    end
  end
  inherited ZQSelect: TZQuery
    Left = 536
    Top = 152
  end
  inherited ZQExecSQL: TZQuery
    Left = 528
    Top = 80
  end
  object Titles1: TTitles
    cam_codi = 'puntodeventa.puntoventa_id'
    cam_text = 'puntoventa_numero'
    Titulos.Strings = (
      'id'
      'Pto.Vta.')
    Campos.Strings = (
      'puntoventa_id'
      'puntoventa_numero')
    Memo.Strings = (
      'select * from puntodeventa'
      'order by puntoventa_numero')
    Left = 536
    Top = 232
  end
end
