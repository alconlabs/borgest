inherited DocumentoVentaExcel: TDocumentoVentaExcel
  Caption = 'Estado Caja'
  ClientHeight = 518
  ClientWidth = 1024
  ExplicitWidth = 1040
  ExplicitHeight = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1024
    Height = 518
    StatusBar.Text = ''
    StatusBar.Visible = False
    ExplicitWidth = 1024
    ExplicitHeight = 518
    FullHeight = 0
    inherited Label2: TLabel
      Left = 13
      Top = 10
      ExplicitLeft = 13
      ExplicitTop = 10
    end
    inherited Label8: TLabel [1]
      Left = 244
      Top = 253
      Visible = False
      ExplicitLeft = 244
      ExplicitTop = 253
    end
    inherited Label15: TLabel [2]
      Left = 121
      Top = 226
      Visible = False
      ExplicitLeft = 121
      ExplicitTop = 226
    end
    inherited Label1: TLabel [3]
      Left = 12
      Top = 253
      Visible = False
      ExplicitLeft = 12
      ExplicitTop = 253
    end
    inherited cliente_domicilio: TLabel [4]
      Left = 60
      Top = 253
      Visible = False
      ExplicitLeft = 60
      ExplicitTop = 253
    end
    inherited Label11: TLabel [5]
      Left = 117
      Top = 253
      Visible = False
      ExplicitLeft = 117
      ExplicitTop = 253
    end
    inherited cliente_documentonro: TLabel [6]
      Left = 172
      Top = 253
      Visible = False
      ExplicitLeft = 172
      ExplicitTop = 253
    end
    inherited Label12: TLabel [7]
      Left = 406
      Top = 277
      Visible = False
      ExplicitLeft = 406
      ExplicitTop = 277
    end
    inherited Label13: TLabel [8]
      Left = 14
      Top = 327
      Visible = False
      ExplicitLeft = 14
      ExplicitTop = 327
    end
    inherited labelsucursal: TLabel [9]
      Left = 13
      Top = 226
      Visible = False
      ExplicitLeft = 13
      ExplicitTop = 226
    end
    object Label19: TLabel [10]
      Left = 784
      Top = 491
      Width = 82
      Height = 16
      Caption = 'Saldo Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel [11]
      Left = 760
      Top = 419
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    object Label14: TLabel [12]
      Left = 443
      Top = 419
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Servicio'
    end
    inherited Label3: TLabel [13]
      Left = 20
      Top = 419
      ExplicitLeft = 20
      ExplicitTop = 419
    end
    inherited Label4: TLabel [14]
      Left = 287
      Top = 419
      ExplicitLeft = 287
      ExplicitTop = 419
    end
    object Label20: TLabel [15]
      Left = 826
      Top = 467
      Width = 79
      Height = 13
      Caption = 'SubTotal Ventas'
    end
    object Label21: TLabel [16]
      Left = 834
      Top = 419
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pago'
    end
    inherited documentoventa_numero: TEdit
      Left = 280
      Top = 223
      Width = 63
      TabOrder = 14
      Visible = False
      ExplicitLeft = 280
      ExplicitTop = 223
      ExplicitWidth = 63
    end
    inherited documentoventa_fecha: TDateTimePicker
      Left = 49
      Top = 7
      TabOrder = 26
      OnExit = documentoventa_fechaExit
      ExplicitLeft = 49
      ExplicitTop = 7
    end
    inherited btncancelar: TButton [19]
      Left = 499
      Top = 313
      Width = 55
      TabOrder = 7
      Visible = False
      ExplicitLeft = 499
      ExplicitTop = 313
      ExplicitWidth = 55
    end
    inherited btnguardar: TButton [20]
      Left = 442
      Top = 313
      Width = 55
      TabOrder = 6
      Visible = False
      ExplicitLeft = 442
      ExplicitTop = 313
      ExplicitWidth = 55
    end
    inherited documentoventa_condicionventa: TComboBox [21]
      Left = 343
      Top = 250
      Width = 90
      TabOrder = 0
      Visible = False
      ExplicitLeft = 343
      ExplicitTop = 250
      ExplicitWidth = 90
    end
    inherited DBGrid1: TDBGrid [22]
      Left = 12
      Top = 271
      Width = 149
      Height = 55
      TabOrder = 1
      Visible = False
    end
    inherited btnagregar: TButton [23]
      Left = 172
      Top = 275
      TabOrder = 2
      Visible = False
      ExplicitLeft = 172
      ExplicitTop = 275
    end
    inherited btnquitar: TButton [24]
      Left = 319
      Top = 276
      TabOrder = 4
      Visible = False
      ExplicitLeft = 319
      ExplicitTop = 276
    end
    inherited btnmodificar: TButton [25]
      Left = 246
      Top = 276
      TabOrder = 3
      Visible = False
      ExplicitLeft = 246
      ExplicitTop = 276
    end
    inherited GroupBox1: TGroupBox [26]
      Left = 167
      Top = 307
      Width = 157
      Height = 33
      TabOrder = 5
      Visible = False
      ExplicitLeft = 167
      ExplicitTop = 307
      ExplicitWidth = 157
      ExplicitHeight = 33
      inherited Label10: TLabel
        Top = 65
        ExplicitTop = 65
      end
      inherited documentoventa_neto21: TMoneyEdit
        Left = 60
        Top = 11
        ExplicitLeft = 60
        ExplicitTop = 11
      end
      inherited documentoventa_total: TMoneyEdit
        Top = 62
        ExplicitTop = 62
      end
    end
    inherited puntoventa_id: TSqlComboBox [27]
      Left = 164
      Top = 223
      TabOrder = 12
      Visible = False
      ExplicitLeft = 164
      ExplicitTop = 223
    end
    inherited tipodocu_id: TSqlComboBox [28]
      Left = 222
      Top = 223
      TabOrder = 13
      Visible = False
      ExplicitLeft = 222
      ExplicitTop = 223
    end
    inherited documentoventa_listaprecio: TComboBox [29]
      Left = 487
      Top = 274
      Width = 66
      TabOrder = 8
      Visible = False
      ExplicitLeft = 487
      ExplicitTop = 274
      ExplicitWidth = 66
    end
    inherited DBGrid2: TDBGrid [30]
      Left = 32
      Top = 296
      Height = 49
      TabOrder = 9
      Visible = False
    end
    inherited btnagregarpago: TButton [31]
      Left = 335
      Top = 314
      Width = 50
      TabOrder = 10
      Visible = False
      ExplicitLeft = 335
      ExplicitTop = 314
      ExplicitWidth = 50
    end
    inherited btnquitarpago: TButton [32]
      Left = 387
      Top = 314
      Width = 50
      TabOrder = 11
      Visible = False
      ExplicitLeft = 387
      ExplicitTop = 314
      ExplicitWidth = 50
    end
    inherited sucursal_id: TSqlComboBox [33]
      Left = 60
      Top = 223
      Width = 52
      TabOrder = 31
      Visible = False
      ExplicitLeft = 60
      ExplicitTop = 223
      ExplicitWidth = 52
    end
    object GroupBox2: TGroupBox [34]
      Left = 16
      Top = 29
      Width = 490
      Height = 193
      Caption = 'Ingresos'
      Color = 15524577
      ParentBackground = False
      ParentColor = False
      TabOrder = 28
      object Label17: TLabel
        Left = 296
        Top = 171
        Width = 86
        Height = 13
        Caption = 'SubTotal Ingresos'
      end
      object DBGrid4: TDBGrid
        Left = 2
        Top = 15
        Width = 486
        Height = 147
        Align = alTop
        DataSource = DSCIngresos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyPress = DBGrid4KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'concepto_descripcion'
            Title.Caption = 'Concepto'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_importe'
            Title.Caption = 'Importe'
            Width = 100
            Visible = True
          end>
      end
      object Button2: TButton
        Left = 6
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Agregar'
        TabOrder = 1
        Visible = False
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 56
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Modificar'
        TabOrder = 2
        Visible = False
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 106
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Borrar'
        TabOrder = 3
        Visible = False
        OnClick = Button4Click
      end
      object SubTotal_ingresos: TAdvMoneyEdit
        Left = 392
        Top = 168
        Width = 89
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
        TabOrder = 5
        Text = '0,00'
        Visible = True
        Version = '1.1.0.2'
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
      end
      object btnguardaringresos: TButton
        Left = 162
        Top = 163
        Width = 96
        Height = 25
        Caption = 'Guardar Cambios'
        TabOrder = 4
        Visible = False
        OnClick = btnguardaringresosClick
      end
    end
    object GroupBox3: TGroupBox [35]
      Left = 512
      Top = 32
      Width = 490
      Height = 193
      Caption = 'Egresos'
      Color = 15524577
      ParentBackground = False
      ParentColor = False
      TabOrder = 29
      object Label18: TLabel
        Left = 304
        Top = 170
        Width = 84
        Height = 13
        Caption = 'SubTotal Egresos'
      end
      object DBGrid5: TDBGrid
        Left = 2
        Top = 15
        Width = 486
        Height = 146
        Align = alTop
        DataSource = DSCEgresos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyPress = DBGrid5KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'concepto_descripcion'
            Title.Caption = 'Concepto'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_importe'
            Title.Caption = 'Importe'
            Width = 100
            Visible = True
          end>
      end
      object Button7: TButton
        Left = 108
        Top = 163
        Width = 51
        Height = 25
        Caption = 'Borrar'
        TabOrder = 3
        Visible = False
        OnClick = Button7Click
      end
      object Button6: TButton
        Left = 58
        Top = 163
        Width = 51
        Height = 25
        Caption = 'Modificar'
        TabOrder = 2
        Visible = False
        OnClick = Button6Click
      end
      object Button5: TButton
        Left = 8
        Top = 163
        Width = 51
        Height = 25
        Caption = 'Agregar'
        TabOrder = 1
        Visible = False
        OnClick = Button5Click
      end
      object SubTotal_egresos: TAdvMoneyEdit
        Left = 393
        Top = 167
        Width = 89
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
        TabOrder = 5
        Text = '0,00'
        Visible = True
        Version = '1.1.0.2'
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
      end
      object btnguargaregresos: TButton
        Left = 162
        Top = 163
        Width = 96
        Height = 25
        Caption = 'Guardar Cambios'
        TabOrder = 4
        Visible = False
        OnClick = btnguargaregresosClick
      end
    end
    object total_caja: TAdvMoneyEdit [36]
      Left = 881
      Top = 488
      Width = 121
      Height = 24
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
      Text = '0,00'
      Visible = True
      Version = '1.1.0.2'
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
    end
    object btnvercaja: TButton [37]
      Left = 164
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Ver Caja'
      TabOrder = 27
      OnClick = btnvercajaClick
    end
    object DBGrid3: TDBGrid [38]
      Left = 16
      Top = 240
      Width = 986
      Height = 178
      DataSource = DTSDocumentosventas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 30
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid3DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 365
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          Title.Caption = 'Servicio'
          Width = 383
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_pagado'
          Title.Caption = 'Importe'
          Width = 114
          Visible = True
        end>
    end
    object btnguardarlinea: TButton [39]
      Left = 929
      Top = 431
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 23
      OnClick = btnguardarlineaClick
    end
    object ventadetalle_preciounitario: TDBAdvEdit [40]
      Left = 760
      Top = 433
      Width = 68
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
      TabOrder = 21
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
    object producto_id: TEditCodi [41]
      Left = 451
      Top = 467
      Width = 57
      Height = 21
      TabStop = False
      Flat = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 19
      Visible = True
      Version = '1.3.0.1'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      OnClickBtn = producto_idClickBtn
      abm = False
      ConfCampoCodigo = 'producto_id'
      ConfCampoCodigo1 = 'producto_codigo'
      ConfCampoCodigo2 = 'producto_codigobarras'
      ConfCampoTexto = 'producto_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from productos'
        'order by producto_nombre')
      AfterSearch = producto_idAfterSearch
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
    end
    object producto_nombre: TEdit [42]
      Left = 443
      Top = 433
      Width = 310
      Height = 21
      TabOrder = 20
    end
    inherited cliente_id: TSqlComboBox [43]
      Left = 20
      Top = 433
      Width = 236
      TabOrder = 15
      ExplicitLeft = 20
      ExplicitTop = 433
      ExplicitWidth = 236
    end
    inherited personal_id: TSqlComboBox [44]
      Left = 287
      Top = 433
      Width = 150
      TabOrder = 18
      ExplicitLeft = 287
      ExplicitTop = 433
      ExplicitWidth = 150
    end
    inherited btnherramientas: TAdvGlowButton
      TabOrder = 34
      Visible = False
    end
    inherited btnimprimirventa: TButton
      TabOrder = 36
      Visible = False
    end
    object SubTotal_ventas: TAdvMoneyEdit
      Left = 911
      Top = 464
      Width = 89
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
      TabOrder = 24
      Text = '0,00'
      Visible = True
      Version = '1.1.0.2'
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
    end
    object btnborrarventa: TButton
      Left = 18
      Top = 458
      Width = 75
      Height = 25
      Caption = 'Borrar  Venta'
      TabOrder = 32
      OnClick = btnborrarventaClick
    end
    object btnbuscarclientes: TButton
      Left = 256
      Top = 431
      Width = 24
      Height = 25
      Caption = '...'
      TabOrder = 17
      OnClick = btnbuscarclientesClick
    end
    object btnagregarcliente: TButton
      Left = 99
      Top = 458
      Width = 89
      Height = 25
      Caption = 'Agregar Cliente'
      TabOrder = 33
      OnClick = btnagregarclienteClick
    end
    object cliente_nombre: TGTBEdit
      Left = 20
      Top = 489
      Width = 236
      Height = 21
      TabOrder = 16
      OnExit = cliente_nombreExit
      OnKeyPress = cliente_nombreKeyPress
      Tag2 = 0
    end
    object documentopago_importe: TDBAdvEdit
      Left = 834
      Top = 433
      Width = 68
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
      TabOrder = 22
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object btnimprimir: TButton
      Left = 245
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 35
      OnClick = btnimprimirClick
    end
  end
  inherited ZQuery2: TZQuery
    Left = 944
    Top = 88
  end
  inherited ZQDocumentoventadetalles: TZQuery
    Left = 808
    Top = 80
  end
  inherited DTSDocumentoventadetalle: TDataSource
    Left = 808
    Top = 8
  end
  inherited ZQRecibo: TZQuery
    Left = 944
    Top = 152
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 944
    Top = 280
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 944
    Top = 24
  end
  inherited DTSPagos: TDataSource
    Left = 944
    Top = 352
  end
  inherited ZQpagotarjeta: TZQuery
    Left = 688
    Top = 320
  end
  inherited ZQNotacredito: TZQuery
    Left = 944
    Top = 216
  end
  inherited ZQExecSql: TZQuery
    Left = 808
    Top = 160
  end
  object DTSDocumentosventas: TDataSource
    DataSet = ZQDocumentosventas
    Left = 808
    Top = 312
  end
  object ZQDocumentosventas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join personal on documentosventas.personal_id=personal.per' +
        'sonal_id'
      
        'inner join documentoventadetalles on documentosventas.documentov' +
        'enta_id=documentoventadetalles.documentoventa_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'where documentosventas.documentoventa_fecha=:documentoventa_fech' +
        'a'
      'and tipodocu_nombre='#39'Factura de Venta'#39' '
      'and documentoventa_estado<>'#39'ANULADA'#39
      'group by documentosventas.documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_fecha'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_fecha'
        ParamType = ptUnknown
      end>
  end
  object ZQIngresos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from cajaasientos'
      
        'inner join conceptos on cajaasientos.concepto_id=conceptos.conce' +
        'pto_id'
      'where cajaasiento_fecha=:cajaasiento_fecha and'
      'cajaasiento_tipo="INGRESO"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
    object ZQIngresoscajaasiento_id: TIntegerField
      FieldName = 'cajaasiento_id'
      Required = True
    end
    object ZQIngresoscajaasiento_descripcion: TStringField
      FieldName = 'cajaasiento_descripcion'
      Size = 150
    end
    object ZQIngresoscajaasiento_tipo: TStringField
      FieldName = 'cajaasiento_tipo'
      Size = 45
    end
    object ZQIngresoscajaasiento_fecha: TDateField
      FieldName = 'cajaasiento_fecha'
    end
    object ZQIngresoscajaasiento_importe: TFloatField
      FieldName = 'cajaasiento_importe'
    end
    object ZQIngresosconcepto_id: TIntegerField
      FieldName = 'concepto_id'
      Required = True
    end
    object ZQIngresosconcepto_descripcion: TStringField
      FieldKind = fkLookup
      FieldName = 'concepto_descripcion'
      LookupDataSet = ZTconceptos
      LookupKeyFields = 'concepto_id'
      LookupResultField = 'concepto_descripcion'
      KeyFields = 'concepto_id'
      Lookup = True
    end
  end
  object DSCIngresos: TDataSource
    DataSet = ZTcajaasientosIngreso
    OnDataChange = DSCIngresosDataChange
    Left = 168
    Top = 112
  end
  object ZQEgresos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cajaasientos'
      
        'inner join conceptos on cajaasientos.concepto_id=conceptos.conce' +
        'pto_id'
      'where cajaasiento_fecha=:cajaasiento_fecha and'
      'cajaasiento_tipo="EGRESO"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
    Left = 520
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
  end
  object DSCEgresos: TDataSource
    DataSet = ZTcajaasientosEgreso
    OnDataChange = DSCEgresosDataChange
    Left = 600
    Top = 120
  end
  object ZTcajaasientosIngreso: TZTable
    Connection = Princ.ZBase
    CachedUpdates = True
    TableName = 'cajaasientos'
    Left = 272
    Top = 112
    object ZTcajaasientosIngresocajaasiento_id: TIntegerField
      FieldName = 'cajaasiento_id'
    end
    object ZTcajaasientosIngresocajaasiento_descripcion: TStringField
      FieldName = 'cajaasiento_descripcion'
      Size = 150
    end
    object ZTcajaasientosIngresocajaasiento_tipo: TStringField
      FieldName = 'cajaasiento_tipo'
      Size = 45
    end
    object ZTcajaasientosIngresocajaasiento_fecha: TDateField
      FieldName = 'cajaasiento_fecha'
    end
    object ZTcajaasientosIngresocajaasiento_importe: TFloatField
      FieldName = 'cajaasiento_importe'
    end
    object ZTcajaasientosIngresoconcepto_id: TIntegerField
      FieldName = 'concepto_id'
      Required = True
    end
    object ZTcajaasientosIngresoconcepto_descripcion: TStringField
      FieldKind = fkLookup
      FieldName = 'concepto_descripcion'
      LookupDataSet = ZTconceptos
      LookupKeyFields = 'concepto_id'
      LookupResultField = 'concepto_descripcion'
      KeyFields = 'concepto_id'
      OnChange = ZTcajaasientosIngresoconcepto_descripcionChange
      Lookup = True
    end
  end
  object ZTconceptos: TZTable
    Connection = Princ.ZBase
    SortedFields = 'concepto_descripcion'
    TableName = 'conceptos'
    IndexFieldNames = 'concepto_descripcion Asc'
    Left = 424
    Top = 128
    object ZTconceptosconcepto_id: TIntegerField
      FieldName = 'concepto_id'
      Required = True
    end
    object ZTconceptosconcepto_descripcion: TStringField
      FieldName = 'concepto_descripcion'
      Size = 150
    end
  end
  object ZTcajaasientosEgreso: TZTable
    Connection = Princ.ZBase
    CachedUpdates = True
    TableName = 'cajaasientos'
    Left = 680
    Top = 128
    object ZTcajaasientosEgresocajaasiento_id: TIntegerField
      FieldName = 'cajaasiento_id'
    end
    object ZTcajaasientosEgresocajaasiento_descripcion: TStringField
      FieldName = 'cajaasiento_descripcion'
      Size = 150
    end
    object ZTcajaasientosEgresocajaasiento_tipo: TStringField
      FieldName = 'cajaasiento_tipo'
      Size = 45
    end
    object ZTcajaasientosEgresocajaasiento_fecha: TDateField
      FieldName = 'cajaasiento_fecha'
    end
    object ZTcajaasientosEgresocajaasiento_importe: TFloatField
      FieldName = 'cajaasiento_importe'
    end
    object ZTcajaasientosEgresoconcepto_id: TIntegerField
      FieldName = 'concepto_id'
      Required = True
    end
    object ZTcajaasientosEgresoconcepto_descripcion: TStringField
      FieldKind = fkLookup
      FieldName = 'concepto_descripcion'
      LookupDataSet = ZTconceptos
      LookupKeyFields = 'concepto_id'
      LookupResultField = 'concepto_descripcion'
      KeyFields = 'concepto_id'
      OnChange = ZTcajaasientosEgresoconcepto_descripcionChange
      Lookup = True
    end
  end
end
