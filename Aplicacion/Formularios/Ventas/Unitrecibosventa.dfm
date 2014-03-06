object recibosventa: Trecibosventa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Recibo'
  ClientHeight = 523
  ClientWidth = 851
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
    Width = 851
    Height = 523
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
    object Label2: TLabel
      Left = 693
      Top = 37
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 30
      Top = 64
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 562
      Top = 64
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label8: TLabel
      Left = 516
      Top = 91
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condicion de Venta'
      Enabled = False
    end
    object Label15: TLabel
      Left = 25
      Top = 37
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label1: TLabel
      Left = 20
      Top = 91
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel
      Left = 68
      Top = 91
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel
      Left = 13
      Top = 115
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel
      Left = 68
      Top = 115
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label12: TLabel
      Left = 534
      Top = 115
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lista de Precios'
      Visible = False
    end
    object Label13: TLabel
      Left = 318
      Top = 300
      Width = 30
      Height = 13
      Caption = 'Pagos'
    end
    object Label14: TLabel
      Left = 21
      Top = 10
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label16: TLabel
      Left = 699
      Top = 441
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Pagos'
    end
    object Label17: TLabel
      Left = 685
      Top = 289
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Imputado'
    end
    object Label18: TLabel
      Left = 9
      Top = 389
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero Detalle Pago'
    end
    object documentoventa_numero: TEdit
      Left = 184
      Top = 34
      Width = 121
      Height = 21
      TabOrder = 19
    end
    object documentoventa_fecha: TDateTimePicker
      Left = 729
      Top = 34
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 20
    end
    object cliente_id: TSqlComboBox
      Left = 68
      Top = 61
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = cliente_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
    end
    object personal_id: TSqlComboBox
      Left = 614
      Top = 61
      Width = 220
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object btncancelar: TButton
      Left = 763
      Top = 472
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 14
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 682
      Top = 472
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 13
      OnClick = btnguardarClick
    end
    object documentoventa_condicionventa: TComboBox
      Left = 615
      Top = 88
      Width = 219
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 2
      Text = 'Cuenta Corriente'
      Items.Strings = (
        'Contado'
        'Cuenta Corriente')
    end
    object btnagregar: TButton
      Left = 4
      Top = 287
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 4
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 77
      Top = 287
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 5
      OnClick = btnquitarClick
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 317
      Width = 134
      Height = 52
      ParentBackground = False
      TabOrder = 7
      Visible = False
      object Label5: TLabel
        Left = 8
        Top = 65
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 21%'
        Visible = False
      end
      object Label6: TLabel
        Left = 14
        Top = 89
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 21%'
        Visible = False
      end
      object Label7: TLabel
        Left = -1
        Top = 113
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
        Visible = False
      end
      object Label9: TLabel
        Left = 5
        Top = 137
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
        Visible = False
      end
      object Label10: TLabel
        Left = 6
        Top = 17
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object documentoventa_neto21: TMoneyEdit
        Left = 68
        Top = 62
        Width = 70
        Height = 21
        TabStop = False
        CalculatorLook.ButtonWidth = 24
        CalculatorLook.ButtonHeight = 24
        CalculatorLook.ButtonColor = clSilver
        CalculatorLook.Color = clWhite
        CalculatorLook.Flat = False
        CalculatorLook.Font.Charset = DEFAULT_CHARSET
        CalculatorLook.Font.Color = clWindowText
        CalculatorLook.Font.Height = -11
        CalculatorLook.Font.Name = 'Tahoma'
        CalculatorLook.Font.Style = []
        EditorEnabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = False
        Version = '1.1.0.1'
      end
      object documentoventa_iva21: TMoneyEdit
        Left = 68
        Top = 86
        Width = 70
        Height = 21
        TabStop = False
        CalculatorLook.ButtonWidth = 24
        CalculatorLook.ButtonHeight = 24
        CalculatorLook.ButtonColor = clSilver
        CalculatorLook.Color = clWhite
        CalculatorLook.Flat = False
        CalculatorLook.Font.Charset = DEFAULT_CHARSET
        CalculatorLook.Font.Color = clWindowText
        CalculatorLook.Font.Height = -11
        CalculatorLook.Font.Name = 'Tahoma'
        CalculatorLook.Font.Style = []
        EditorEnabled = False
        ReadOnly = True
        TabOrder = 1
        Visible = False
        Version = '1.1.0.1'
      end
      object documentoventa_neto105: TMoneyEdit
        Left = 68
        Top = 110
        Width = 70
        Height = 21
        TabStop = False
        CalculatorLook.ButtonWidth = 24
        CalculatorLook.ButtonHeight = 24
        CalculatorLook.ButtonColor = clSilver
        CalculatorLook.Color = clWhite
        CalculatorLook.Flat = False
        CalculatorLook.Font.Charset = DEFAULT_CHARSET
        CalculatorLook.Font.Color = clWindowText
        CalculatorLook.Font.Height = -11
        CalculatorLook.Font.Name = 'Tahoma'
        CalculatorLook.Font.Style = []
        ReadOnly = True
        TabOrder = 2
        Visible = False
        Version = '1.1.0.1'
      end
      object documentoventa_iva105: TMoneyEdit
        Left = 68
        Top = 134
        Width = 70
        Height = 21
        TabStop = False
        CalculatorLook.ButtonWidth = 24
        CalculatorLook.ButtonHeight = 24
        CalculatorLook.ButtonColor = clSilver
        CalculatorLook.Color = clWhite
        CalculatorLook.Flat = False
        CalculatorLook.Font.Charset = DEFAULT_CHARSET
        CalculatorLook.Font.Color = clWindowText
        CalculatorLook.Font.Height = -11
        CalculatorLook.Font.Name = 'Tahoma'
        CalculatorLook.Font.Style = []
        ReadOnly = True
        TabOrder = 3
        Visible = False
        Version = '1.1.0.1'
      end
      object documentoventa_total: TMoneyEdit
        Left = 45
        Top = 14
        Width = 70
        Height = 21
        TabStop = False
        CalculatorLook.ButtonWidth = 24
        CalculatorLook.ButtonHeight = 24
        CalculatorLook.ButtonColor = clSilver
        CalculatorLook.Color = clWhite
        CalculatorLook.Flat = False
        CalculatorLook.Font.Charset = DEFAULT_CHARSET
        CalculatorLook.Font.Color = clWindowText
        CalculatorLook.Font.Height = -11
        CalculatorLook.Font.Name = 'Tahoma'
        CalculatorLook.Font.Style = []
        ReadOnly = True
        TabOrder = 4
        Version = '1.1.0.1'
      end
    end
    object puntoventa_id: TSqlComboBox
      Left = 68
      Top = 34
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 17
      OnSelect = puntoventa_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from puntodeventa')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
    object tipodocu_id: TSqlComboBox
      Left = 126
      Top = 34
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 18
      OnSelect = tipodocu_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tiposdocumento'
        'where tipodocu_nombre="Factura de Venta"')
      Confcampo_codigo = 'tipodocu_id'
      Confcampo_nomb = 'tipodocu_letra'
      Tag2 = 0
    end
    object documentoventa_listaprecio: TComboBox
      Left = 615
      Top = 112
      Width = 219
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 15
      Text = 'Precio 1'
      Visible = False
      Items.Strings = (
        'Precio 1'
        'Precio 2'
        'Precio 3'
        'Precio 4')
    end
    object DBGrid2: TDBGrid
      Left = 319
      Top = 317
      Width = 522
      Height = 120
      DataSource = DTSPagos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'documentopago_id'
          Title.Caption = 'Nro.'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_nombre'
          Title.Caption = 'Descripcion'
          Width = 297
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_importe'
          Title.Caption = 'Importe'
          Width = 87
          Visible = True
        end>
    end
    object btnagregarpago: TButton
      Left = 319
      Top = 438
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 10
      OnClick = btnagregarpagoClick
    end
    object btnquitarpago: TButton
      Left = 393
      Top = 438
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 11
      OnClick = btnquitarpagoClick
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 134
      Width = 838
      Height = 150
      DataSource = DTSDocumentoventadocus
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_pagado'
          Title.Caption = 'Pagado'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_saldo'
          Title.Caption = 'Saldo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadoc_importe'
          Title.Caption = 'Cobrado'
          Width = 120
          Visible = True
        end>
    end
    object sucursal_id: TSqlComboBox
      Left = 68
      Top = 7
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 16
      OnSelect = sucursal_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object Editdocumentoventa_pagado: TMoneyEdit
      Left = 771
      Top = 438
      Width = 70
      Height = 21
      TabStop = False
      CalculatorLook.ButtonWidth = 24
      CalculatorLook.ButtonHeight = 24
      CalculatorLook.ButtonColor = clSilver
      CalculatorLook.Color = clWhite
      CalculatorLook.Flat = False
      CalculatorLook.Font.Charset = DEFAULT_CHARSET
      CalculatorLook.Font.Color = clWindowText
      CalculatorLook.Font.Height = -11
      CalculatorLook.Font.Name = 'Tahoma'
      CalculatorLook.Font.Style = []
      ReadOnly = True
      TabOrder = 12
      Version = '1.1.0.1'
    end
    object btntomardocumentosAuto: TButton
      Left = 158
      Top = 287
      Width = 129
      Height = 25
      Caption = 'Cargar'
      TabOrder = 6
      OnClick = btntomardocumentosAutoClick
    end
    object documentoventa_totalimputado: TMoneyEdit
      Left = 771
      Top = 286
      Width = 70
      Height = 21
      TabStop = False
      CalculatorLook.ButtonWidth = 24
      CalculatorLook.ButtonHeight = 24
      CalculatorLook.ButtonColor = clSilver
      CalculatorLook.Color = clWhite
      CalculatorLook.Flat = False
      CalculatorLook.Font.Charset = DEFAULT_CHARSET
      CalculatorLook.Font.Color = clWindowText
      CalculatorLook.Font.Height = -11
      CalculatorLook.Font.Name = 'Tahoma'
      CalculatorLook.Font.Style = []
      ReadOnly = True
      TabOrder = 21
      Version = '1.1.0.1'
    end
    object documentoventa_nrodetallepago: TEdit
      Left = 116
      Top = 386
      Width = 121
      Height = 21
      TabStop = False
      TabOrder = 8
    end
    object btnimprimir: TButton
      Left = 10
      Top = 472
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 22
      OnClick = btnimprimirClick
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQuery2AfterOpen
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object DTSDocumentoventadocus: TDataSource
    DataSet = ZQdocumentoventadocus
    Left = 416
    Top = 168
  end
  object ZQRecibo: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosventas'
      'where documentoventa_id=-1')
    Params = <>
    Left = 624
    Top = 136
  end
  object ZQdocumentoventadocus: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadocus'
      
        'inner join documentosventas on documentoventadocus.documentovent' +
        'a_idpago=documentosventas.documentoventa_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventadocus.documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object ZQdocumentoventadocusdocumentoventadoc_id: TIntegerField
      FieldName = 'documentoventadoc_id'
    end
    object ZQdocumentoventadocusdocumentoventadoc_importe: TFloatField
      FieldName = 'documentoventadoc_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
    end
    object ZQdocumentoventadocusdocumentoventa_idpago: TIntegerField
      FieldName = 'documentoventa_idpago'
    end
    object ZQdocumentoventadocusdocumentoventa_id_1: TIntegerField
      FieldName = 'documentoventa_id_1'
    end
    object ZQdocumentoventadocusdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object ZQdocumentoventadocusdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object ZQdocumentoventadocusdocumentoventa_hora: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object ZQdocumentoventadocusdocumentoventa_neto21: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object ZQdocumentoventadocusdocumentoventa_iva21: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object ZQdocumentoventadocusdocumentoventa_neto105: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object ZQdocumentoventadocusdocumentoventa_iva105: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object ZQdocumentoventadocusdocumentoventa_netonogravado: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object ZQdocumentoventadocusdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_estado_1: TStringField
      FieldName = 'documentoventa_estado_1'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_pagado_1: TFloatField
      FieldName = 'documentoventa_pagado_1'
    end
    object ZQdocumentoventadocusdocumentoventa_saldo_1: TFloatField
      FieldName = 'documentoventa_saldo_1'
    end
    object ZQdocumentoventadocusdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQdocumentoventadocuscliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object ZQdocumentoventadocuspersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQdocumentoventadocustipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQdocumentoventadocusdocumentoventa_condicionventa: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object ZQdocumentoventadocusdocumentoventa_fechavenc: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object ZQdocumentoventadocusdocumentoventa_listaprecio: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object ZQdocumentoventadocustipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object ZQdocumentoventadocustipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQdocumentoventadocustipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQdocumentoventadocustipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQdocumentoventadocustipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQdocumentoventadocustipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQdocumentoventadocustipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQdocumentoventadocustipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQdocumentoventadocuspuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object ZQdocumentoventadocustipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQdocumentoventadocuspuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object ZQdocumentoventadocuspuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQdocumentoventadocuspuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQdocumentoventadocussucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQdocumentoventadocusdocumentoventadoc_tiporelacion: TStringField
      FieldName = 'documentoventadoc_tiporelacion'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_equipo1: TStringField
      FieldName = 'documentoventa_equipo1'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_equipo2: TStringField
      FieldName = 'documentoventa_equipo2'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_formapago: TStringField
      FieldName = 'documentoventa_formapago'
      Size = 255
    end
    object ZQdocumentoventadocusdocumentoventa_nrodetallepago: TStringField
      FieldName = 'documentoventa_nrodetallepago'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_solicitudcliente: TStringField
      FieldName = 'documentoventa_solicitudcliente'
      Size = 255
    end
    object ZQdocumentoventadocusdocumentoventa_trabajorealizado: TStringField
      FieldName = 'documentoventa_trabajorealizado'
      Size = 255
    end
    object ZQdocumentoventadocuscaja_id: TIntegerField
      FieldName = 'caja_id'
    end
    object ZQdocumentoventadocustipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQdocumentoventadocustipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
    end
    object ZQdocumentoventadocustipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQdocumentoventadocustipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQdocumentoventadocustipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQdocumentoventadocustipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQdocumentoventadocustipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQdocumentoventadocustipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQdocumentoventadocustipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQdocumentoventadocustipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQdocumentoventadocustipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQdocumentoventadocustipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQdocumentoventadocuspuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQdocumentoventadocuspuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
  end
  object ZQDocumentopagos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select documentopagos.*, tipopago_nombre from documentopagos'
      
        'inner join tipospago on documentopagos.tipopago_id=tipospago.tip' +
        'opago_id'
      'where documentopago_id=-1')
    Params = <>
    Left = 416
    Top = 360
    object ZQDocumentopagosdocumentopago_id: TIntegerField
      FieldName = 'documentopago_id'
      Required = True
    end
    object ZQDocumentopagosdocumentopago_nombre: TStringField
      FieldName = 'documentopago_nombre'
      Size = 45
    end
    object ZQDocumentopagosdocumentopago_importe: TFloatField
      FieldName = 'documentopago_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentopagostipopago_id: TIntegerField
      FieldName = 'tipopago_id'
      Required = True
    end
    object ZQDocumentopagosdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object ZQDocumentopagostipopago_nombre: TStringField
      FieldName = 'tipopago_nombre'
      Size = 45
    end
  end
  object DTSPagos: TDataSource
    DataSet = ZQDocumentopagos
    Left = 664
    Top = 376
  end
  object ZQpagotarjeta: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select pagotarjeta.* from pagotarjeta'
      
        'inner join documentopagos on pagotarjeta.documentopago_id=docume' +
        'ntopagos.documentopago_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 576
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentoventadetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles')
    Params = <>
    Left = 240
    Top = 168
    object ZQDocumentoventadetallesdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQDocumentoventadetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQDocumentoventadetallesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
  end
  object ZQExecSql: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
end
