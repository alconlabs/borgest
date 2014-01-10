object OrdendePago: TOrdendePago
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Orden de Pago'
  ClientHeight = 523
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
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
      Left = 13
      Top = 64
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
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
    object proveedor_domicilio: TLabel
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
    object proveedor_documentonro: TLabel
      Left = 68
      Top = 115
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
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
    object documentocompra_numero: TEdit
      Left = 184
      Top = 34
      Width = 121
      Height = 21
      TabOrder = 17
    end
    object documentocompra_fecha: TDateTimePicker
      Left = 729
      Top = 34
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 18
    end
    object proveedor_id: TSqlComboBox
      Left = 68
      Top = 61
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = proveedor_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from proveedores'
        'order by proveedor_nombre')
      Confcampo_codigo = 'proveedor_id'
      Confcampo_nomb = 'proveedor_nombre'
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
      TabOrder = 13
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 682
      Top = 472
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 12
      OnClick = btnguardarClick
    end
    object documentocompra_condicionventa: TComboBox
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
      object documentocompra_total: TMoneyEdit
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
      TabOrder = 15
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
      TabOrder = 16
      OnSelect = tipodocu_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tiposdocumento'
        'where tipodocu_nombre="Factura de Venta"')
      Confcampo_codigo = 'tipodocu_id'
      Confcampo_nomb = 'tipodocu_letra'
      Tag2 = 0
    end
    object DBGrid2: TDBGrid
      Left = 319
      Top = 317
      Width = 522
      Height = 120
      DataSource = DTSPagos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'documentocompra_id'
          Title.Caption = 'Nro.'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocomprapago_nombre'
          Title.Caption = 'Descripcion'
          Width = 297
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocomprapago_importe'
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
      TabOrder = 9
      OnClick = btnagregarpagoClick
    end
    object btnquitarpago: TButton
      Left = 393
      Top = 438
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 10
      OnClick = btnquitarpagoClick
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 134
      Width = 838
      Height = 150
      DataSource = DTSDocumentocompradocus
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
          FieldName = 'documentocompra_fecha'
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
          FieldName = 'documentocompra_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentocompra_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentocompra_pagado'
          Title.Caption = 'Pagado'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentocompra_saldo'
          Title.Caption = 'Saldo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompradoc_importe'
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
      TabOrder = 14
      OnSelect = sucursal_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object Editdocumentocompra_pagado: TMoneyEdit
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
      TabOrder = 11
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
    object documentocompra_totalimputado: TMoneyEdit
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
      TabOrder = 19
      Version = '1.1.0.1'
    end
    object btnimprimir: TButton
      Left = 10
      Top = 472
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 20
      OnClick = btnimprimirClick
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQuery2AfterOpen
    SQL.Strings = (
      'select * from documentoscompras'
      
        'inner join tiposdocumento on documentoscompras.tipodocu_id=tipos' +
        'documento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentocompra_id=:documentocompra_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
  end
  object DTSDocumentocompradocus: TDataSource
    DataSet = ZQdocumentocompradocus
    Left = 472
    Top = 88
  end
  object ZQOrdendePago: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoscompras'
      'where documentocompra_id=-1')
    Params = <>
    Left = 624
    Top = 136
  end
  object ZQdocumentocompradocus: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentocompradocus'
      
        'inner join documentoscompras on documentocompradocus.documentoco' +
        'mpra_idpago=documentoscompras.documentocompra_id'
      
        'inner join tiposdocumento on documentoscompras.tipodocu_id=tipos' +
        'documento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'where documentocompradocus.documentocompra_id=:documentocompra_i' +
        'd')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
    object ZQdocumentocompradocusdocumentocompradoc_id: TIntegerField
      FieldName = 'documentocompradoc_id'
    end
    object ZQdocumentocompradocusdocumentocompradoc_importe: TFloatField
      FieldName = 'documentocompradoc_importe'
    end
    object ZQdocumentocompradocusdocumentocompra_pagado: TFloatField
      FieldName = 'documentocompra_pagado'
    end
    object ZQdocumentocompradocusdocumentocompra_saldo: TFloatField
      FieldName = 'documentocompra_saldo'
    end
    object ZQdocumentocompradocusdocumentocompra_estado: TStringField
      FieldName = 'documentocompra_estado'
      Size = 45
    end
    object ZQdocumentocompradocusdocumentocompra_id: TIntegerField
      FieldName = 'documentocompra_id'
    end
    object ZQdocumentocompradocusdocumentocompra_idpago: TIntegerField
      FieldName = 'documentocompra_idpago'
    end
    object ZQdocumentocompradocusdocumentocompradoc_tiporelacion: TStringField
      FieldName = 'documentocompradoc_tiporelacion'
      Size = 45
    end
    object ZQdocumentocompradocusdocumentocompra_id_1: TIntegerField
      FieldName = 'documentocompra_id_1'
    end
    object ZQdocumentocompradocusdocumentocompra_numero: TIntegerField
      FieldName = 'documentocompra_numero'
    end
    object ZQdocumentocompradocusdocumentocompra_fecha: TDateField
      FieldName = 'documentocompra_fecha'
    end
    object ZQdocumentocompradocusdocumentocompra_hora: TTimeField
      FieldName = 'documentocompra_hora'
    end
    object ZQdocumentocompradocusdocumentocompra_total: TFloatField
      FieldName = 'documentocompra_total'
    end
    object ZQdocumentocompradocusdocumentocompra_estado_1: TStringField
      FieldName = 'documentocompra_estado_1'
      Size = 45
    end
    object ZQdocumentocompradocusdocumentocompra_pagado_1: TFloatField
      FieldName = 'documentocompra_pagado_1'
    end
    object ZQdocumentocompradocusdocumentocompra_saldo_1: TFloatField
      FieldName = 'documentocompra_saldo_1'
    end
    object ZQdocumentocompradocusdocumentocompra_observacion: TStringField
      FieldName = 'documentocompra_observacion'
      Size = 255
    end
    object ZQdocumentocompradocusdocumentocompra_condicionventa: TIntegerField
      FieldName = 'documentocompra_condicionventa'
    end
    object ZQdocumentocompradocusdocumentocompra_fechavenc: TDateField
      FieldName = 'documentocompra_fechavenc'
    end
    object ZQdocumentocompradocuspersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQdocumentocompradocusproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQdocumentocompradocustipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQdocumentocompradocusdocumentocompra_neto21: TFloatField
      FieldName = 'documentocompra_neto21'
    end
    object ZQdocumentocompradocusdocumentocompra_iva21: TFloatField
      FieldName = 'documentocompra_iva21'
    end
    object ZQdocumentocompradocusdocumentocompra_neto105: TFloatField
      FieldName = 'documentocompra_neto105'
    end
    object ZQdocumentocompradocusdocumentocompra_iva105: TFloatField
      FieldName = 'documentocompra_iva105'
    end
    object ZQdocumentocompradocusdocumentocompra_otrosimpuestos: TFloatField
      FieldName = 'documentocompra_otrosimpuestos'
    end
    object ZQdocumentocompradocusdocumentocompra_puntoventa: TIntegerField
      FieldName = 'documentocompra_puntoventa'
    end
    object ZQdocumentocompradocusdocumentocompra_neto27: TFloatField
      FieldName = 'documentocompra_neto27'
    end
    object ZQdocumentocompradocusdocumentocompra_iva27: TFloatField
      FieldName = 'documentocompra_iva27'
    end
    object ZQdocumentocompradocusdocumentocompra_nogravado: TFloatField
      FieldName = 'documentocompra_nogravado'
    end
    object ZQdocumentocompradocusdocumentocompra_tishhperc: TFloatField
      FieldName = 'documentocompra_tishhperc'
    end
    object ZQdocumentocompradocusdocumentocompra_ivaret: TFloatField
      FieldName = 'documentocompra_ivaret'
    end
    object ZQdocumentocompradocusdocumentocompra_ivaperc: TFloatField
      FieldName = 'documentocompra_ivaperc'
    end
    object ZQdocumentocompradocusdocumentocompra_dgrret: TFloatField
      FieldName = 'documentocompra_dgrret'
    end
    object ZQdocumentocompradocusdocumentocompra_dgrperc: TFloatField
      FieldName = 'documentocompra_dgrperc'
    end
    object ZQdocumentocompradocustipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object ZQdocumentocompradocustipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQdocumentocompradocustipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQdocumentocompradocustipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQdocumentocompradocustipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQdocumentocompradocustipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQdocumentocompradocustipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQdocumentocompradocustipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQdocumentocompradocuspuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object ZQdocumentocompradocustipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQdocumentocompradocustipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQdocumentocompradocustipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
    end
    object ZQdocumentocompradocustipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQdocumentocompradocustipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQdocumentocompradocustipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQdocumentocompradocustipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQdocumentocompradocustipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQdocumentocompradocustipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQdocumentocompradocustipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQdocumentocompradocustipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQdocumentocompradocustipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQdocumentocompradocustipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQdocumentocompradocuspuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object ZQdocumentocompradocuspuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQdocumentocompradocuspuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQdocumentocompradocussucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQdocumentocompradocuspuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQdocumentocompradocuspuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
  end
  object ZQDocumentocomprapagos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select documentocomprapagos.*, tipopago_nombre from documentocom' +
        'prapagos'
      
        'inner join tipospago on documentocomprapagos.tipopago_id=tipospa' +
        'go.tipopago_id'
      'where documentocomprapago_id=-1')
    Params = <>
    Left = 416
    Top = 360
    object ZQDocumentocomprapagosdocumentocomprapago_id: TIntegerField
      FieldName = 'documentocomprapago_id'
      Required = True
    end
    object ZQDocumentocomprapagosdocumentocomprapago_nombre: TStringField
      FieldName = 'documentocomprapago_nombre'
      Size = 45
    end
    object ZQDocumentocomprapagosdocumentocomprapago_importe: TFloatField
      FieldName = 'documentocomprapago_importe'
      DisplayFormat = '0.00'
    end
    object ZQDocumentocomprapagostipopago_id: TIntegerField
      FieldName = 'tipopago_id'
      Required = True
    end
    object ZQDocumentocomprapagosdocumentocompra_id: TIntegerField
      FieldName = 'documentocompra_id'
      Required = True
    end
    object ZQDocumentocomprapagostipopago_nombre: TStringField
      FieldName = 'tipopago_nombre'
      Size = 45
    end
  end
  object DTSPagos: TDataSource
    DataSet = ZQDocumentocomprapagos
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
  object ZQDocumentocompradetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles')
    Params = <>
    Left = 240
    Top = 168
    object ZQDocumentocompradetallesdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQDocumentocompradetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQDocumentocompradetallesdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQDocumentocompradetallesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
  end
end
