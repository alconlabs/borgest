inherited InformesVentas: TInformesVentas
  Caption = 'Informes de Ventas'
  ClientHeight = 198
  ClientWidth = 420
  ExplicitWidth = 436
  ExplicitHeight = 236
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 420
    Height = 198
    ExplicitWidth = 420
    ExplicitHeight = 198
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
      Left = 29
      Top = 104
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label5: TLabel [4]
      Left = 289
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Punto de Venta'
    end
    inherited btncancelar: TButton
      Left = 181
      Top = 144
      ExplicitLeft = 181
      ExplicitTop = 144
    end
    inherited btnguardar: TButton
      Left = 275
      Top = 144
      Caption = 'Imprimir'
      OnClick = btnguardarClick
      ExplicitLeft = 275
      ExplicitTop = 144
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
      Width = 197
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnSelect = informe_tipoSelect
      Items.Strings = (
        'Costos por Ventas'
        'Informe de Precios de Ventas'
        'Informe de ventas'
        'Informe de Cobros')
      Tag2 = 0
      valores.Strings = (
        '0'
        '1'
        '2'
        '3')
    end
    object personal_id: TSqlComboBox
      Left = 84
      Top = 101
      Width = 197
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object puntoventa_id: TSqlListView
      Left = 289
      Top = 22
      Width = 112
      Height = 116
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
  end
  inherited ZQSelect: TZQuery
    Left = 488
    Top = 88
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
    Left = 488
    Top = 168
  end
end
