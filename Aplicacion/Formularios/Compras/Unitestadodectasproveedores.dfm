object estadoctasproveedores: Testadoctasproveedores
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
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
    FreeOnClose = True
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
      Left = 6
      Top = 12
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    object Label4: TLabel
      Left = 395
      Top = 40
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object proveedor_id: TSqlComboBox
      Left = 59
      Top = 9
      Width = 597
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from proveedores'
        'order by proveedor_nombre')
      Confcampo_codigo = 'proveedor_id'
      Confcampo_nomb = 'proveedor_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object DBGrid1: TDBGrid
      Left = 9
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
          FieldName = 'documentocomprafecha'
          Title.Caption = 'Fecha'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompra_fechavenc'
          Title.Caption = 'Fecha Venc.'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
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
          FieldName = 'documentocompranumero'
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
      Left = 663
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
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompra' +
        's.documentocompra_saldo,0)) as debito, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="CREDITO",documentoscompr' +
        'as.documentocompra_saldo,0)) as credito, '
      '0.00 as acumulado, '
      'concat("0-",documentoscompras.proveedor_id) as grupo,'
      
        'if(1=2,"Saldo anterior",CONCAT(tiposdocumento.tipodocu_nombreabr' +
        'ev," ",tiposdocumento.tipodocu_letra)) as documento_nombre, '
      
        'if(1=2,"29/07/2013",DATE_FORMAT(documentoscompras.documentocompr' +
        'a_fecha,"%d/%m/%Y")) as documentocomprafecha, '
      'if(1=2,"0",puntoventa_numero) as puntoventanumero, '
      
        'if(1=2,"0",documentoscompras.documentocompra_numero) as document' +
        'ocompranumero '
      'from documentoscompras '
      
        'inner join tiposdocumento on documentoscompras.tipodocu_id=tipos' +
        'documento.tipodocu_id '
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id '
      
        'inner join proveedores on documentoscompras.proveedor_id=proveed' +
        'ores.proveedor_id '
      
        'inner join personal on documentoscompras.personal_id=personal.pe' +
        'rsonal_id '
      
        'inner join sucursales on puntodeventa.sucursal_id=sucursales.suc' +
        'ursal_id '
      'where (1=1 and puntodeventa.puntoventa_id not in (1000) and '
      'tiposdocumento.tipodocu_debcred<>"N/A" and '
      'documentoscompras.documentocompra_estado="PENDIENTE"  and '
      
        '(puntodeventa.puntoventa_id="12" or puntodeventa.puntoventa_id="' +
        '11" or '
      
        'puntodeventa.puntoventa_id="10" or puntodeventa.puntoventa_id="9' +
        '" or '
      
        'puntodeventa.puntoventa_id="8" or puntodeventa.puntoventa_id="7"' +
        ' or'
      
        ' puntodeventa.puntoventa_id="6" or puntodeventa.puntoventa_id="5' +
        '" or '
      
        ' puntodeventa.puntoventa_id="4" or puntodeventa.puntoventa_id="3' +
        '" or '
      
        ' puntodeventa.puntoventa_id="2" or puntodeventa.puntoventa_id="1' +
        '")) '
      ' group by  grupo '
      
        ' order by proveedores.proveedor_nombre, documentoscompras.docume' +
        'ntocompra_fecha, documentoscompras.documentocompra_id')
    Params = <>
    Left = 224
    Top = 208
    object ZQPendientesdocumentocompra_id: TIntegerField
      FieldName = 'documentocompra_id'
      Required = True
    end
    object ZQPendientesdocumentocompra_numero: TIntegerField
      FieldName = 'documentocompra_numero'
    end
    object ZQPendientesdocumentocompra_fecha: TDateField
      FieldName = 'documentocompra_fecha'
    end
    object ZQPendientesdocumentocompra_hora: TTimeField
      FieldName = 'documentocompra_hora'
    end
    object ZQPendientesdocumentocompra_total: TFloatField
      FieldName = 'documentocompra_total'
    end
    object ZQPendientesdocumentocompra_estado: TStringField
      FieldName = 'documentocompra_estado'
      Size = 45
    end
    object ZQPendientesdocumentocompra_pagado: TFloatField
      FieldName = 'documentocompra_pagado'
    end
    object ZQPendientesdocumentocompra_saldo: TFloatField
      FieldName = 'documentocompra_saldo'
    end
    object ZQPendientesdocumentocompra_observacion: TStringField
      FieldName = 'documentocompra_observacion'
      Size = 255
    end
    object ZQPendientesdocumentocompra_condicionventa: TIntegerField
      FieldName = 'documentocompra_condicionventa'
    end
    object ZQPendientesdocumentocompra_fechavenc: TDateField
      FieldName = 'documentocompra_fechavenc'
    end
    object ZQPendientespersonal_id: TIntegerField
      FieldName = 'personal_id'
      Required = True
    end
    object ZQPendientesproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
      Required = True
    end
    object ZQPendientestipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQPendientesdocumentocompra_neto21: TFloatField
      FieldName = 'documentocompra_neto21'
    end
    object ZQPendientesdocumentocompra_iva21: TFloatField
      FieldName = 'documentocompra_iva21'
    end
    object ZQPendientesdocumentocompra_neto105: TFloatField
      FieldName = 'documentocompra_neto105'
    end
    object ZQPendientesdocumentocompra_iva105: TFloatField
      FieldName = 'documentocompra_iva105'
    end
    object ZQPendientesdocumentocompra_otrosimpuestos: TFloatField
      FieldName = 'documentocompra_otrosimpuestos'
    end
    object ZQPendientesdocumentocompra_puntoventa: TIntegerField
      FieldName = 'documentocompra_puntoventa'
    end
    object ZQPendientesdocumentocompra_neto27: TFloatField
      FieldName = 'documentocompra_neto27'
    end
    object ZQPendientesdocumentocompra_iva27: TFloatField
      FieldName = 'documentocompra_iva27'
    end
    object ZQPendientesdocumentocompra_nogravado: TFloatField
      FieldName = 'documentocompra_nogravado'
    end
    object ZQPendientesdocumentocompra_tishhperc: TFloatField
      FieldName = 'documentocompra_tishhperc'
    end
    object ZQPendientesdocumentocompra_ivaret: TFloatField
      FieldName = 'documentocompra_ivaret'
    end
    object ZQPendientesdocumentocompra_ivaperc: TFloatField
      FieldName = 'documentocompra_ivaperc'
    end
    object ZQPendientesdocumentocompra_dgrret: TFloatField
      FieldName = 'documentocompra_dgrret'
    end
    object ZQPendientesdocumentocompra_dgrperc: TFloatField
      FieldName = 'documentocompra_dgrperc'
    end
    object ZQPendientestipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object ZQPendientestipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQPendientestipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQPendientestipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQPendientestipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQPendientestipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQPendientestipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQPendientestipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQPendientespuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQPendientestipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQPendientestipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQPendientestipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
      Required = True
    end
    object ZQPendientestipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQPendientestipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQPendientestipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQPendientestipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQPendientestipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQPendientestipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQPendientestipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQPendientestipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQPendientestipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQPendientestipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQPendientespuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
      Required = True
    end
    object ZQPendientespuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQPendientespuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQPendientessucursal_id: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object ZQPendientespuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQPendientespuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQPendientesproveedor_id_1: TIntegerField
      FieldName = 'proveedor_id_1'
      Required = True
    end
    object ZQPendientesproveedor_nombre: TStringField
      FieldName = 'proveedor_nombre'
      Size = 100
    end
    object ZQPendientesproveedor_domicilio: TStringField
      FieldName = 'proveedor_domicilio'
      Size = 150
    end
    object ZQPendientesproveedor_documentonro: TStringField
      FieldName = 'proveedor_documentonro'
      Size = 45
    end
    object ZQPendientesproveedor_documentotipo: TStringField
      FieldName = 'proveedor_documentotipo'
      Size = 45
    end
    object ZQPendientesproveedor_telefono: TStringField
      FieldName = 'proveedor_telefono'
      Size = 45
    end
    object ZQPendientesproveedor_celular: TStringField
      FieldName = 'proveedor_celular'
      Size = 45
    end
    object ZQPendientesproveedor_mail: TStringField
      FieldName = 'proveedor_mail'
      Size = 150
    end
    object ZQPendientescondicioniva_id: TIntegerField
      FieldName = 'condicioniva_id'
      Required = True
    end
    object ZQPendientesproveedor_condicionventa: TStringField
      FieldName = 'proveedor_condicionventa'
      Size = 45
    end
    object ZQPendientesproveedor_tipo: TStringField
      FieldName = 'proveedor_tipo'
      Size = 45
    end
    object ZQPendienteslocalidad_id: TIntegerField
      FieldName = 'localidad_id'
      Required = True
    end
    object ZQPendientespersonal_id_1: TIntegerField
      FieldName = 'personal_id_1'
      Required = True
    end
    object ZQPendientespersonal_nombre: TStringField
      FieldName = 'personal_nombre'
      Size = 100
    end
    object ZQPendientespersonal_domicilio: TStringField
      FieldName = 'personal_domicilio'
      Size = 150
    end
    object ZQPendientespersonal_telefono: TStringField
      FieldName = 'personal_telefono'
      Size = 45
    end
    object ZQPendientespersonal_celular: TStringField
      FieldName = 'personal_celular'
      Size = 45
    end
    object ZQPendientespersonal_mail: TStringField
      FieldName = 'personal_mail'
      Size = 45
    end
    object ZQPendientespersonal_usuario: TStringField
      FieldName = 'personal_usuario'
      Size = 45
    end
    object ZQPendientespersonal_pass: TStringField
      FieldName = 'personal_pass'
      Size = 45
    end
    object ZQPendientesperfil_id: TIntegerField
      FieldName = 'perfil_id'
      Required = True
    end
    object ZQPendientessucursal_id_1: TIntegerField
      FieldName = 'sucursal_id_1'
      Required = True
    end
    object ZQPendientessucursal_nombre: TStringField
      FieldName = 'sucursal_nombre'
      Size = 100
    end
    object ZQPendientessucursal_domicilio: TStringField
      FieldName = 'sucursal_domicilio'
      Size = 150
    end
    object ZQPendientessucursal_telefono: TStringField
      FieldName = 'sucursal_telefono'
      Size = 45
    end
    object ZQPendientesempresa_id: TIntegerField
      FieldName = 'empresa_id'
      Required = True
    end
    object ZQPendientessucursal_tipoliquidvendedor: TStringField
      FieldName = 'sucursal_tipoliquidvendedor'
      Size = 45
    end
    object ZQPendientessucursal_tipoliquidsucursal: TStringField
      FieldName = 'sucursal_tipoliquidsucursal'
      Size = 45
    end
    object ZQPendientescliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object ZQPendientessucursal_tipodocumentoliquidar: TIntegerField
      FieldName = 'sucursal_tipodocumentoliquidar'
    end
    object ZQPendientesdebito: TFloatField
      FieldName = 'debito'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ZQPendientescredito: TFloatField
      FieldName = 'credito'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ZQPendientesacumulado: TFloatField
      FieldName = 'acumulado'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ZQPendientesgrupo: TStringField
      FieldName = 'grupo'
      ReadOnly = True
      Size = 13
    end
    object ZQPendientesdocumento_nombre: TStringField
      FieldName = 'documento_nombre'
      ReadOnly = True
      Size = 51
    end
    object ZQPendientesdocumentocomprafecha: TStringField
      FieldName = 'documentocomprafecha'
      ReadOnly = True
      Size = 10
    end
    object ZQPendientespuntoventanumero: TStringField
      FieldName = 'puntoventanumero'
      ReadOnly = True
      Size = 11
    end
    object ZQPendientesdocumentocompranumero: TStringField
      FieldName = 'documentocompranumero'
      ReadOnly = True
      Size = 11
    end
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
    Left = 456
    Top = 184
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
  object ZQuery3: TZQuery
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
    Left = 216
    Top = 352
  end
end
