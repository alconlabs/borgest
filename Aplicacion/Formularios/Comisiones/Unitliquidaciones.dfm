object liquidaciones: Tliquidaciones
  Left = 0
  Top = 0
  Caption = 'Liquidacion a Vendedores'
  ClientHeight = 586
  ClientWidth = 1013
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 1013
    Height = 586
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
    object Label1: TLabel
      Left = 17
      Top = 12
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label2: TLabel
      Left = 272
      Top = 12
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label4: TLabel
      Left = 8
      Top = 60
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label3: TLabel
      Left = 23
      Top = 116
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label13: TLabel
      Left = 210
      Top = 116
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label21: TLabel
      Left = 726
      Top = 518
      Width = 139
      Height = 13
      Alignment = taRightJustify
      Caption = 'TOTAL GRAL. (1 + 2 + 3 + 4)'
    end
    object Label8: TLabel
      Left = 442
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursales'
    end
    object liquidacionvendedor_id: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object liquidacionvendedor_fecha: TDateTimePicker
      Left = 308
      Top = 9
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 1
    end
    object personal_id: TSqlComboBox
      Left = 60
      Top = 57
      Width = 354
      Height = 21
      ItemHeight = 0
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal'
        'order by personal_nombre')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object btncancelar: TButton
      Left = 915
      Top = 551
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 11
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 834
      Top = 551
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 10
      OnClick = btnguardarClick
    end
    object liquidacionvendedor_desdefecha: TDateTimePicker
      Left = 60
      Top = 113
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 4
    end
    object liquidacionvendedor_hastafecha: TDateTimePicker
      Left = 244
      Top = 113
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 5
    end
    object btnactualizar: TButton
      Left = 419
      Top = 133
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 6
      OnClick = btnactualizarClick
    end
    object liquidacionvendedor_total: TDBAdvEdit
      Left = 871
      Top = 515
      Width = 121
      Height = 21
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
      Version = '2.7.0.5'
    end
    object sucursal_id: TSqlListView
      Left = 500
      Top = 9
      Width = 506
      Height = 149
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
      ConfField = tiSucursales
      ConfIni = Princ.ini1
      Tag2 = 0
      ConfTodosCheckeados = True
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 164
      Width = 1010
      Height = 343
      ActivePage = TabSheet1
      TabOrder = 7
      object TabSheet1: TTabSheet
        Caption = 'Vendedor por defecto'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label15: TLabel
          Left = 814
          Top = 286
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subtotal 1'
        end
        object btnquitarpordefecto: TButton
          Left = 0
          Top = 279
          Width = 97
          Height = 25
          Caption = 'Quitar de la lista'
          TabOrder = 0
          OnClick = btnquitarpordefectoClick
        end
        object liquidacionvendedor_subtotal1: TDBAdvEdit
          Left = 868
          Top = 283
          Width = 121
          Height = 21
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
          TabOrder = 1
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 273
          Align = alTop
          DataSource = DSCPorDefecto
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'sucursal_nombre'
              Title.Caption = 'Sucursal'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_fecha'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'puntoventa_numero'
              Title.Caption = 'Pto. Vta.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_numero'
              Title.Caption = 'Numero'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente_nombre'
              Title.Caption = 'Cliente'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo Prod.'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Descripcion'
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              Title.Caption = 'Cant.'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              Title.Caption = 'Importe'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionvendedor_tipo'
              PickList.Strings = (
                'Porcentaje'
                'Cantidad')
              Title.Caption = 'Tipo Liq.'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionvendedor_valor'
              Title.Caption = 'Valor'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liquivendedeta_importe'
              Title.Caption = 'Total'
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'En Facturas'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label5: TLabel
          Left = 814
          Top = 286
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subtotal 2'
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 273
          Align = alTop
          DataSource = DSCEnFacturas
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'sucursal_nombre'
              Title.Caption = 'Sucursal'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_fecha'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'puntoventa_numero'
              Title.Caption = 'Pto. Vta.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_numero'
              Title.Caption = 'Numero'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente_nombre'
              Title.Caption = 'Cliente'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo Prod.'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Descripcion'
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              Title.Caption = 'Cant.'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              Title.Caption = 'Importe'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionvendedor_tipo'
              PickList.Strings = (
                'Porcentaje'
                'Cantidad')
              Title.Caption = 'Tipo Liq.'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionvendedor_valor'
              Title.Caption = 'Valor'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liquivendedeta_importe'
              Title.Caption = 'Total'
              Visible = True
            end>
        end
        object btnquitarenfactura: TButton
          Left = 0
          Top = 279
          Width = 97
          Height = 25
          Caption = 'Quitar de la lista'
          TabOrder = 1
          OnClick = btnquitarenfacturaClick
        end
        object liquidacionvendedor_subtotal2: TDBAdvEdit
          Left = 868
          Top = 283
          Width = 121
          Height = 21
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
          TabOrder = 2
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'En Otros'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label6: TLabel
          Left = 814
          Top = 286
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subtotal 3'
        end
        object btnquitarenobservaciones: TButton
          Left = 0
          Top = 279
          Width = 97
          Height = 25
          Caption = 'Quitar de la lista'
          TabOrder = 0
          OnClick = btnquitarenobservacionesClick
        end
        object liquidacionvendedor_subtotal3: TDBAdvEdit
          Left = 868
          Top = 283
          Width = 121
          Height = 21
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
          TabOrder = 1
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 273
          Align = alTop
          DataSource = DSCEnObservaciones
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'sucursal_nombre'
              Title.Caption = 'Sucursal'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_fecha'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'puntoventa_numero'
              Title.Caption = 'Pto. Vta.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_numero'
              Title.Caption = 'Numero'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente_nombre'
              Title.Caption = 'Cliente'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo Prod.'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Descripcion'
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              Title.Caption = 'Cant.'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              Title.Caption = 'Importe'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionvendedor_tipo'
              PickList.Strings = (
                'Porcentaje'
                'Cantidad')
              Title.Caption = 'Tipo Liq.'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionvendedor_valor'
              Title.Caption = 'Valor'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liquivendedeta_importe'
              Title.Caption = 'Total'
              Visible = True
            end>
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Debitos y Creditos'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label7: TLabel
          Left = 814
          Top = 286
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subtotal 4'
        end
        object DBGrid4: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 273
          Align = alTop
          DataSource = DSCvendedoresdebcred
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'vendedordebcred_id'
              Title.Caption = 'Nro.'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vendedordebcred_fecha'
              Title.Caption = 'Fecha'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vendedordebcred_tipo'
              Title.Caption = 'Tipo'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'importe'
              Title.Caption = 'Importe'
              Width = 108
              Visible = True
            end>
        end
        object btnquitardebcred: TButton
          Left = 0
          Top = 279
          Width = 97
          Height = 25
          Caption = 'Quitar de la lista'
          TabOrder = 1
          OnClick = btnquitardebcredClick
        end
        object liquidacionvendedor_subtotal4: TDBAdvEdit
          Left = 868
          Top = 283
          Width = 121
          Height = 21
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
          TabOrder = 2
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
      end
    end
    object btncalcular: TButton
      Left = 624
      Top = 513
      Width = 91
      Height = 25
      Caption = 'Calcular Total'
      TabOrder = 8
      OnClick = btncalcularClick
    end
    object btnimprimir: TButton
      Left = 10
      Top = 551
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 12
      OnClick = btnimprimirClick
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from solicitudes'
      'where solic_id=:solic_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
    Left = 528
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
  end
  object tiSucursales: TTitles
    cam_codi = 'sucursales.sucursal_id'
    cam_text = 'sucursal_nombre'
    Titulos.Strings = (
      'Codigo'
      'Codigo'
      'Sucursal')
    Campos.Strings = (
      'sucursal_id'
      'sucursal_id'
      'sucursal_nombre')
    Memo.Strings = (
      'select * from sucursales'
      'order by sucursal_nombre')
    Left = 792
    Top = 56
  end
  object DSCPorDefecto: TDataSource
    DataSet = MQPorDefecto
    Left = 56
    Top = 400
  end
  object MQPorDefecto: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as liquivendedeta_id,t as documentoventadetalle_id,t as' +
        ' producto_id,t as comisionvendedor_tipo,d as comisionvendedor_va' +
        'lor,i as liquidacionvendedor_id,f as documentoventa_fecha,i as d' +
        'ocumentoventa_numero,t as cliente_nombre,t as documentoventadeta' +
        'lle_descripcion,d as documentoventadetalle_cantidad,d as documen' +
        'toventadetalle_precio,t as sucursal_tipoliquidvendedor,d as liqu' +
        'ivendedeta_importe,t as puntoventa_numero,t as sucursal_nombre f' +
        'rom temp ')
    Params = <>
    ConfCampos.Strings = (
      'liquivendedeta_id,i'
      'documentoventadetalle_id,t'
      'producto_id,t'
      'comisionvendedor_tipo,t'
      'comisionvendedor_valor,d'
      'liquidacionvendedor_id,i'
      'documentoventa_fecha,f'
      'documentoventa_numero,i'
      'cliente_nombre,t'
      'documentoventadetalle_descripcion,t'
      'documentoventadetalle_cantidad,d'
      'documentoventadetalle_precio,d'
      'sucursal_tipoliquidvendedor,t'
      'liquivendedeta_importe,d'
      'puntoventa_numero,t'
      'sucursal_nombre,t')
    Left = 48
    Top = 272
    object MQPorDefectoliquivendedeta_id: TIntegerField
      FieldName = 'liquivendedeta_id'
    end
    object MQPorDefectoproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQPorDefectocomisionvendedor_tipo: TStringField
      FieldName = 'comisionvendedor_tipo'
      Size = 255
    end
    object MQPorDefectocomisionvendedor_valor: TFloatField
      FieldName = 'comisionvendedor_valor'
    end
    object MQPorDefectoliquidacionvendedor_id: TIntegerField
      FieldName = 'liquidacionvendedor_id'
    end
    object MQPorDefectodocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object MQPorDefectodocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object MQPorDefectocliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 255
    end
    object MQPorDefectodocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 255
    end
    object MQPorDefectodocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object MQPorDefectodocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object MQPorDefectosucursal_tipoliquidvendedor: TStringField
      FieldName = 'sucursal_tipoliquidvendedor'
      Size = 255
    end
    object MQPorDefectoliquivendedeta_importe: TFloatField
      FieldName = 'liquivendedeta_importe'
    end
    object MQPorDefectopuntoventa_numero: TStringField
      FieldName = 'puntoventa_numero'
      Size = 255
    end
    object MQPorDefectosucursal_nombre: TStringField
      FieldName = 'sucursal_nombre'
      Size = 255
    end
    object MQPorDefectodocumentoventadetalle_id: TStringField
      FieldName = 'documentoventadetalle_id'
      Size = 255
    end
  end
  object ZQliquivendedoressucursales: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from liquivendedoressucursales'
      'where liquidacionvendedor_id=:liquidacionvendedor_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
  end
  object ZQliquidacionesvendedores: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQliquidacionesvendedoresAfterOpen
    SQL.Strings = (
      'select * from liquidacionesvendedores'
      'where liquidacionvendedor_id=:liquidacionvendedor_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
    Left = 520
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
  end
  object ZQfacturasventa: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from facturasventa'
      
        'inner join facturasventadeta on facturasventa.facven_id=facturas' +
        'ventadeta.facven_id')
    Params = <>
    Left = 384
    Top = 296
  end
  object ZQComisiones: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from facturasventa'
      
        'inner join facturasventadeta on facturasventa.facven_id=facturas' +
        'ventadeta.facven_id')
    Params = <>
    Left = 600
    Top = 312
  end
  object MQEnFacturas: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as liquivendedeta_id,t as documentoventadetalle_id,t as' +
        ' producto_id,t as comisionvendedor_tipo,d as comisionvendedor_va' +
        'lor,i as liquidacionvendedor_id,f as documentoventa_fecha,i as d' +
        'ocumentoventa_numero,t as cliente_nombre,t as documentoventadeta' +
        'lle_descripcion,d as documentoventadetalle_cantidad,d as documen' +
        'toventadetalle_precio,t as sucursal_tipoliquidvendedor,d as liqu' +
        'ivendedeta_importe,t as puntoventa_numero,t as sucursal_nombre f' +
        'rom temp ')
    Params = <>
    ConfCampos.Strings = (
      'liquivendedeta_id,i'
      'documentoventadetalle_id,t'
      'producto_id,t'
      'comisionvendedor_tipo,t'
      'comisionvendedor_valor,d'
      'liquidacionvendedor_id,i'
      'documentoventa_fecha,f'
      'documentoventa_numero,i'
      'cliente_nombre,t'
      'documentoventadetalle_descripcion,t'
      'documentoventadetalle_cantidad,d'
      'documentoventadetalle_precio,d'
      'sucursal_tipoliquidvendedor,t'
      'liquivendedeta_importe,d'
      'puntoventa_numero,t'
      'sucursal_nombre,t')
    Left = 184
    Top = 296
    object MQEnFacturasliquivendedeta_id: TIntegerField
      FieldName = 'liquivendedeta_id'
    end
    object MQEnFacturasproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQEnFacturascomisionvendedor_tipo: TStringField
      FieldName = 'comisionvendedor_tipo'
      Size = 255
    end
    object MQEnFacturascomisionvendedor_valor: TFloatField
      FieldName = 'comisionvendedor_valor'
    end
    object MQEnFacturasliquidacionvendedor_id: TIntegerField
      FieldName = 'liquidacionvendedor_id'
    end
    object MQEnFacturasdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object MQEnFacturasdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object MQEnFacturascliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 255
    end
    object MQEnFacturasdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 255
    end
    object MQEnFacturasdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object MQEnFacturasdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object MQEnFacturassucursal_tipoliquidvendedor: TStringField
      FieldName = 'sucursal_tipoliquidvendedor'
      Size = 255
    end
    object MQEnFacturasliquivendedeta_importe: TFloatField
      FieldName = 'liquivendedeta_importe'
    end
    object MQEnFacturaspuntoventa_numero: TStringField
      FieldName = 'puntoventa_numero'
      Size = 255
    end
    object MQEnFacturassucursal_nombre: TStringField
      FieldName = 'sucursal_nombre'
      Size = 255
    end
    object MQEnFacturasdocumentoventadetalle_id: TStringField
      FieldName = 'documentoventadetalle_id'
      Size = 255
    end
  end
  object DSCEnFacturas: TDataSource
    DataSet = MQEnFacturas
    Left = 184
    Top = 400
  end
  object ZQControlDetalle: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from facturasventa'
      
        'inner join facturasventadeta on facturasventa.facven_id=facturas' +
        'ventadeta.facven_id')
    Params = <>
    Left = 560
    Top = 392
  end
  object MQEnObservaciones: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as liquivendedeta_id,t as documentoventadetalle_id,t as' +
        ' producto_id,t as comisionvendedor_tipo,d as comisionvendedor_va' +
        'lor,i as liquidacionvendedor_id,f as documentoventa_fecha,i as d' +
        'ocumentoventa_numero,t as cliente_nombre,t as documentoventadeta' +
        'lle_descripcion,d as documentoventadetalle_cantidad,d as documen' +
        'toventadetalle_precio,t as sucursal_tipoliquidvendedor,d as liqu' +
        'ivendedeta_importe,t as puntoventa_numero,t as sucursal_nombre f' +
        'rom temp ')
    Params = <>
    ConfCampos.Strings = (
      'liquivendedeta_id,i'
      'documentoventadetalle_id,t'
      'producto_id,t'
      'comisionvendedor_tipo,t'
      'comisionvendedor_valor,d'
      'liquidacionvendedor_id,i'
      'documentoventa_fecha,f'
      'documentoventa_numero,i'
      'cliente_nombre,t'
      'documentoventadetalle_descripcion,t'
      'documentoventadetalle_cantidad,d'
      'documentoventadetalle_precio,d'
      'sucursal_tipoliquidvendedor,t'
      'liquivendedeta_importe,d'
      'puntoventa_numero,t'
      'sucursal_nombre,t')
    Left = 288
    Top = 304
    object MQEnObservacionesliquivendedeta_id: TIntegerField
      FieldName = 'liquivendedeta_id'
    end
    object MQEnObservacionesproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQEnObservacionescomisionvendedor_tipo: TStringField
      FieldName = 'comisionvendedor_tipo'
      Size = 255
    end
    object MQEnObservacionescomisionvendedor_valor: TFloatField
      FieldName = 'comisionvendedor_valor'
    end
    object MQEnObservacionesliquidacionvendedor_id: TIntegerField
      FieldName = 'liquidacionvendedor_id'
    end
    object MQEnObservacionesdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object MQEnObservacionesdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object MQEnObservacionescliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 255
    end
    object MQEnObservacionesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 255
    end
    object MQEnObservacionesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object MQEnObservacionesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object MQEnObservacionessucursal_tipoliquidvendedor: TStringField
      FieldName = 'sucursal_tipoliquidvendedor'
      Size = 255
    end
    object MQEnObservacionesliquivendedeta_importe: TFloatField
      FieldName = 'liquivendedeta_importe'
    end
    object MQEnObservacionespuntoventa_numero: TStringField
      FieldName = 'puntoventa_numero'
      Size = 255
    end
    object MQEnObservacionessucursal_nombre: TStringField
      FieldName = 'sucursal_nombre'
      Size = 255
    end
    object MQEnObservacionesdocumentoventadetalle_id: TStringField
      FieldName = 'documentoventadetalle_id'
      Size = 255
    end
  end
  object DSCEnObservaciones: TDataSource
    DataSet = MQEnObservaciones
    Left = 288
    Top = 400
  end
  object ZQvendedoresdebcred: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      
        'select *, if(vendedordebcred_tipo="Debito",vendedordebcred_impor' +
        'te*-1,vendedordebcred_importe) as importe '
      'from vendedoresdebcred'
      
        'inner join personal on vendedoresdebcred.personal_id=personal.pe' +
        'rsonal_id'
      'where liquidacionvendedor_id=:liquidacionvendedor_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
    Left = 904
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
    object ZQvendedoresdebcredvendedordebcred_id: TIntegerField
      FieldName = 'vendedordebcred_id'
      Required = True
    end
    object ZQvendedoresdebcredvendedordebcred_fecha: TDateField
      FieldName = 'vendedordebcred_fecha'
    end
    object ZQvendedoresdebcredvendedordebcred_descripcion: TStringField
      FieldName = 'vendedordebcred_descripcion'
      Size = 255
    end
    object ZQvendedoresdebcredvendedordebcred_tipo: TStringField
      FieldName = 'vendedordebcred_tipo'
      Size = 45
    end
    object ZQvendedoresdebcredvendedordebcred_importe: TFloatField
      FieldName = 'vendedordebcred_importe'
    end
    object ZQvendedoresdebcredvendedordebcred_estado: TStringField
      FieldName = 'vendedordebcred_estado'
      Size = 45
    end
    object ZQvendedoresdebcredliquidacionvendedor_id: TIntegerField
      FieldName = 'liquidacionvendedor_id'
    end
    object ZQvendedoresdebcredpersonal_id: TIntegerField
      FieldName = 'personal_id'
      Required = True
    end
    object ZQvendedoresdebcredimporte: TFloatField
      FieldName = 'importe'
      ReadOnly = True
    end
    object ZQvendedoresdebcredpersonal_id_1: TIntegerField
      FieldName = 'personal_id_1'
      Required = True
    end
    object ZQvendedoresdebcredpersonal_nombre: TStringField
      FieldName = 'personal_nombre'
      Size = 100
    end
    object ZQvendedoresdebcredpersonal_domicilio: TStringField
      FieldName = 'personal_domicilio'
      Size = 150
    end
    object ZQvendedoresdebcredpersonal_telefono: TStringField
      FieldName = 'personal_telefono'
      Size = 45
    end
    object ZQvendedoresdebcredpersonal_celular: TStringField
      FieldName = 'personal_celular'
      Size = 45
    end
    object ZQvendedoresdebcredpersonal_mail: TStringField
      FieldName = 'personal_mail'
      Size = 45
    end
    object ZQvendedoresdebcredpersonal_usuario: TStringField
      FieldName = 'personal_usuario'
      Size = 45
    end
    object ZQvendedoresdebcredpersonal_pass: TStringField
      FieldName = 'personal_pass'
      Size = 45
    end
    object ZQvendedoresdebcredperfil_id: TIntegerField
      FieldName = 'perfil_id'
      Required = True
    end
  end
  object DSCvendedoresdebcred: TDataSource
    DataSet = ZQvendedoresdebcred
    Left = 904
    Top = 408
  end
  object ZQliquivendedeta: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from liquivendedeta'
      'where liquidacionvendedor_id=:liquidacionvendedor_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
    Left = 712
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionvendedor_id'
        ParamType = ptUnknown
      end>
  end
  object VCLReport1: TVCLReport
    ConnectionName = 'conexion_prestamos'
    AsyncExecution = False
    Title = 'Untitled'
    Left = 376
    Top = 96
  end
end
