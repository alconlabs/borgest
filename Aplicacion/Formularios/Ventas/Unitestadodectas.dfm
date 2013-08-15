object estadoctas: Testadoctas
  Left = 0
  Top = 0
  Caption = 'Estado de Cuentas - SALDOS'
  ClientHeight = 472
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 472
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
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label3: TLabel
      Left = 9
      Top = 12
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 395
      Top = 40
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object cliente_id: TSqlComboBox
      Left = 48
      Top = 9
      Width = 608
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object DBGrid1: TDBGrid
      Left = 10
      Top = 184
      Width = 728
      Height = 233
      DataSource = DSCPendientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'documentoventafecha'
          Title.Caption = 'Fecha'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_fechavenc'
          Title.Caption = 'Fecha Venc.'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_nombre'
          Title.Caption = 'Documento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventanumero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventanumero'
          Title.Alignment = taRightJustify
          Title.Caption = 'Nro.'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'debito'
          Title.Caption = 'Debe'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'credito'
          Title.Caption = 'Haber'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acumulado'
          Title.Caption = 'Acumulado'
          Visible = True
        end>
    end
    object btnactualizar: TButton
      Left = 662
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 5
      OnClick = btnactualizarClick
    end
    object btnimprimir: TButton
      Left = 662
      Top = 423
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 7
      OnClick = btnimprimirClick
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 36
      Width = 185
      Height = 68
      Caption = 'Fecha Comprobante'
      TabOrder = 1
      object lbldesdefecha: TLabel
        Left = 10
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
        Enabled = False
      end
      object lblhastafecha: TLabel
        Left = 13
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
        Enabled = False
      end
      object cbdesdefecha: TCheckBox
        Left = 155
        Top = 20
        Width = 14
        Height = 17
        TabOrder = 0
        OnClick = cbdesdefechaClick
      end
      object cbhastafecha: TCheckBox
        Left = 155
        Top = 44
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = cbhastafechaClick
      end
      object desde_fecha: TDateTimePicker
        Left = 49
        Top = 17
        Width = 100
        Height = 21
        Date = 41242.000000000000000000
        Time = 41242.000000000000000000
        Enabled = False
        TabOrder = 2
      end
      object hasta_fecha: TDateTimePicker
        Left = 49
        Top = 41
        Width = 100
        Height = 21
        Date = 41242.000000000000000000
        Time = 41242.000000000000000000
        Enabled = False
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 110
      Width = 185
      Height = 68
      Caption = 'Fecha Venc.'
      TabOrder = 2
      object lbldesdevenc: TLabel
        Left = 10
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
        Enabled = False
      end
      object lblhastavenc: TLabel
        Left = 13
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
        Enabled = False
      end
      object cbdesdefechavenc: TCheckBox
        Left = 155
        Top = 18
        Width = 14
        Height = 17
        TabOrder = 0
        OnClick = cbdesdefechavencClick
      end
      object cbhastafechavenc: TCheckBox
        Left = 155
        Top = 44
        Width = 14
        Height = 17
        TabOrder = 1
        OnClick = cbhastafechavencClick
      end
      object desde_fecha_venc: TDateTimePicker
        Left = 49
        Top = 17
        Width = 100
        Height = 21
        Date = 41242.000000000000000000
        Time = 41242.000000000000000000
        Enabled = False
        TabOrder = 2
      end
      object hasta_fecha_venc: TDateTimePicker
        Left = 49
        Top = 41
        Width = 100
        Height = 21
        Date = 41242.000000000000000000
        Time = 41242.000000000000000000
        Enabled = False
        TabOrder = 3
      end
    end
    object personal_id: TSqlComboBox
      Left = 447
      Top = 37
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object puntoventa_id: TSqlListView
      Left = 201
      Top = 37
      Width = 176
      Height = 141
      Columns = <>
      HoverTime = -1
      TabOrder = 3
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
    object BtnDetalleImputacion: TButton
      Left = 533
      Top = 423
      Width = 124
      Height = 25
      Caption = 'Detalle de Imputacion'
      TabOrder = 8
      OnClick = BtnDetalleImputacionClick
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from pagos'
      'where pago_id=:pago_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pago_id'
        ParamType = ptUnknown
      end>
    Left = 744
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pago_id'
        ParamType = ptUnknown
      end>
  end
  object ZQPendientes: TZQuery
    Connection = Princ.ZBase
    AutoCalcFields = False
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_total,0)) as debito, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentosventa' +
        's.documentoventa_total,0)) as credito, '
      '0.00 as acumulado, (documentoventa_id) as grupo,'
      
        ' if(documentoventa_fecha<"2012-11-19","Saldo anterior",tiposdocu' +
        'mento.tipodocu_nombre) as documento_nombre, '
      
        ' if(documentoventa_fecha<"2012-11-19","2012-11-19",documentovent' +
        'a_fecha) as documentoventafecha, '
      
        ' if(documentoventa_fecha<"2012-11-19","0",puntoventa_numero) as ' +
        'puntoventanumero, '
      
        ' if(documentoventa_fecha<"2012-11-19","0",documentoventa_numero)' +
        ' as documentoventanumero '
      ' from documentosventas '
      
        ' inner join tiposdocumento on documentosventas.tipodocu_id=tipos' +
        'documento.tipodocu_id '
      
        ' inner join puntodeventa on tiposdocumento.puntoventa_id=puntode' +
        'venta.puntoventa_id '
      
        ' inner join clientes on documentosventas.cliente_id=clientes.cli' +
        'ente_id')
    Params = <>
    Left = 224
    Top = 208
  end
  object MQdetalle: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'solic_fecha'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as id,f as solic_fecha,t as solic_numero,d as total,d a' +
        's pagado,d as saldo from temp ')
    Params = <>
    IndexFieldNames = 'solic_fecha Asc'
    ConfCampos.Strings = (
      'id,i'
      'solic_fecha,f'
      'solic_numero,t'
      'total,d'
      'pagado,d'
      'saldo,d')
    Left = 616
    Top = 240
  end
  object tiventas: TTitles
    Campos.Strings = (
      'fecha'
      'comprob'
      'numero'
      'importe')
    Left = 576
    Top = 240
  end
  object DSCPendientes: TDataSource
    AutoEdit = False
    DataSet = ZQPendientes
    Left = 312
    Top = 176
  end
  object tipagos: TTitles
    Campos.Strings = (
      'fecha'
      'comprob'
      'numero'
      'importe')
    Left = 744
    Top = 136
  end
  object ZQsolicitud: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cobros'
      'where cliente_id=:cliente_id'
      'order by cobro_fecha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 672
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object Tisolicitud: TTitles
    Campos.Strings = (
      'id'
      'solic_fecha'
      'solic_numero'
      'total'
      'pagado'
      'saldo')
    Left = 888
    Top = 216
  end
  object Ticobros: TTitles
    Campos.Strings = (
      'id'
      'solic_fecha'
      'solic_numero'
      'total'
      'pagado'
      'saldo')
    Left = 838
    Top = 159
  end
  object ZQsoliciPendiente: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 808
    Top = 272
  end
  object MQsolicipendiente: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'fecha; numero'
    CachedUpdates = True
    SQL.Strings = (
      
        'select f as fecha,t as comprob,i as numero,d as importe from tem' +
        'p ')
    Params = <>
    IndexFieldNames = 'fecha Asc; numero Asc'
    ConfCampos.Strings = (
      'fecha,f'
      'comprob,t'
      'numero,i'
      'importe,d')
    Left = 808
    Top = 320
  end
  object ZQcobropendientes: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 896
    Top = 288
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 864
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object CustomizeGrid1: TCustomizeGrid
    Active = True
    Grid = DBGrid1
    AlternateRows.Active = False
    AlternateRows.Color1 = 15004387
    AlternateRows.Color2 = clBlack
    AlternateRows.Style = asStandard
    DataStyles.TextMemos = False
    DataStyles.CheckBox = False
    SortOptions.ChangeCursorOnTitle = False
    OnPaintRow = CustomizeGrid1PaintRow
    Left = 368
    Top = 216
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
    Left = 448
    Top = 176
  end
  object ZQDebitos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 432
    Top = 352
  end
  object ZQCreditos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 528
    Top = 352
  end
end
