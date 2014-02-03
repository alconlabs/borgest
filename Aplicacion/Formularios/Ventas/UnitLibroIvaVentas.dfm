inherited LibroIvaVentas: TLibroIvaVentas
  Caption = 'Libro IVA Ventas'
  ClientHeight = 276
  ClientWidth = 408
  ExplicitWidth = 424
  ExplicitHeight = 314
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 408
    Height = 276
    ExplicitLeft = 88
    ExplicitTop = 8
    ExplicitWidth = 408
    ExplicitHeight = 276
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 76
      Top = 16
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label2: TLabel [1]
      Left = 79
      Top = 40
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label3: TLabel [2]
      Left = 20
      Top = 64
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Comprobante'
    end
    inherited btncancelar: TButton
      Left = 213
      Top = 184
      Caption = 'Salir'
      ExplicitLeft = 213
      ExplicitTop = 184
    end
    inherited btnguardar: TButton
      Left = 307
      Top = 184
      Caption = 'Imprimir'
      OnClick = btnguardarClick
      ExplicitLeft = 307
      ExplicitTop = 184
    end
    object desde_fecha: TDateTimePicker
      Left = 116
      Top = 13
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 2
    end
    object hasta_fecha: TDateTimePicker
      Left = 116
      Top = 37
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 3
    end
    object tipodocu_id: TSqlListView
      Left = 113
      Top = 64
      Width = 272
      Height = 113
      Columns = <>
      HoverTime = -1
      TabOrder = 4
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
    Left = 96
    Top = 152
  end
  inherited ZQExecSQL: TZQuery
    Left = 216
    Top = 200
  end
  object Titles1: TTitles
    cam_codi = 'tiposdocumento.tipodocu_id'
    cam_text = 'puntoventa_numero'
    Titulos.Strings = (
      'id'
      'Pto.Vta.'
      'Documento')
    Campos.Strings = (
      'tipodocu_id'
      'puntoventa_numero'
      'tipodocu_descripcion')
    Memo.Strings = (
      
        'select *, concat(tipodocu_nombreabrev, '#39' '#39', tipodocu_letra) as t' +
        'ipodocu_descripcion from tiposdocumento'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where tipodocu_tipo='#39'Venta'#39' and tipodocu_iva='#39'-1'#39)
    Left = 32
    Top = 104
  end
end
