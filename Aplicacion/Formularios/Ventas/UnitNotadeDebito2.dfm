object NotadeDebito2: TNotadeDebito2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Nota de Debito de Venta'
  ClientHeight = 504
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
    Height = 504
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
    StatusBar.Text = 
      'Producto: F4-Agregar / F5-Modificar / F6-Quitar                 ' +
      ' Pagos: F7-Agregar / F8-Quitar                    F9-Guardar tod' +
      'o'
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label2: TLabel
      Left = 693
      Top = 39
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 30
      Top = 66
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 563
      Top = 66
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label8: TLabel
      Left = 516
      Top = 93
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condicion de Venta'
    end
    object Label15: TLabel
      Left = 25
      Top = 39
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label1: TLabel
      Left = 20
      Top = 93
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel
      Left = 68
      Top = 93
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel
      Left = 13
      Top = 117
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel
      Left = 68
      Top = 117
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label12: TLabel
      Left = 534
      Top = 117
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lista de Precios'
    end
    object Labelsucursal: TLabel
      Left = 21
      Top = 10
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label13: TLabel
      Left = 4
      Top = 323
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object documentoventa_numero: TEdit
      Left = 184
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 11
    end
    object documentoventa_fecha: TDateTimePicker
      Left = 729
      Top = 36
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 12
    end
    object cliente_id: TSqlComboBox
      Left = 68
      Top = 63
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
      Left = 615
      Top = 63
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
      Top = 457
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 682
      Top = 457
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 6
      OnClick = btnguardarClick
    end
    object documentoventa_condicionventa: TComboBox
      Left = 615
      Top = 90
      Width = 219
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Contado'
      Items.Strings = (
        'Contado'
        'Cuenta Corriente')
    end
    object GroupBox1: TGroupBox
      Left = 531
      Top = 320
      Width = 309
      Height = 120
      Caption = 'Totales'
      ParentBackground = False
      TabOrder = 4
      object Label5: TLabel
        Left = 8
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 21%'
      end
      object Label6: TLabel
        Left = 14
        Top = 41
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 21%'
      end
      object Label7: TLabel
        Left = 159
        Top = 17
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
      end
      object Label9: TLabel
        Left = 165
        Top = 41
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
      end
      object Label10: TLabel
        Left = 111
        Top = 81
        Width = 47
        Height = 24
        Alignment = taRightJustify
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object documentoventa_neto21: TMoneyEdit
        Left = 68
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
        EditorEnabled = False
        ReadOnly = True
        TabOrder = 0
        Version = '1.1.0.1'
      end
      object documentoventa_iva21: TMoneyEdit
        Left = 68
        Top = 38
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
        Version = '1.1.0.1'
      end
      object documentoventa_neto105: TMoneyEdit
        Left = 228
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
        TabOrder = 2
        Version = '1.1.0.1'
      end
      object documentoventa_iva105: TMoneyEdit
        Left = 228
        Top = 38
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
        Version = '1.1.0.1'
      end
      object documentoventa_total: TMoneyEdit
        Left = 164
        Top = 78
        Width = 134
        Height = 32
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Version = '1.1.0.1'
      end
    end
    object puntoventa_id: TSqlComboBox
      Left = 68
      Top = 36
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
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
      Top = 36
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 10
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
      Top = 114
      Width = 219
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Precio 1'
      Items.Strings = (
        'Precio 1'
        'Precio 2'
        'Precio 3'
        'Precio 4')
    end
    object sucursal_id: TSqlComboBox
      Left = 68
      Top = 7
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnSelect = sucursal_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object documentoventa_observacion: TGTBMemo
      Left = 4
      Top = 342
      Width = 521
      Height = 98
      TabStop = False
      TabOrder = 5
      Tag2 = 0
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 135
      Width = 836
      Height = 185
      ActivePage = TabSheet1
      TabOrder = 13
      object TabSheet1: TTabSheet
        Caption = 'Productos'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 828
          Height = 113
          TabStop = False
          Align = alTop
          DataSource = DTSDocumentoventadetalle
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              Title.Caption = 'Cant.'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Producto'
              Width = 523
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              Title.Caption = 'Precio'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_total'
              Title.Caption = 'Total'
              Width = 66
              Visible = True
            end>
        end
        object btnagregar: TButton
          Left = 4
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Agregar'
          TabOrder = 1
          OnClick = btnagregarClick
        end
        object btnmodificar: TButton
          Left = 78
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Modificar'
          Enabled = False
          TabOrder = 2
        end
        object btnquitar: TButton
          Left = 151
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Quitar'
          TabOrder = 3
          OnClick = btnquitarClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Conceptos'
        ImageIndex = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 828
          Height = 113
          TabStop = False
          Align = alTop
          DataSource = DTSDocumentoventadetalleConceptos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Concepto'
              Width = 523
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_total'
              Title.Caption = 'Importe'
              Width = 66
              Visible = True
            end>
        end
        object btnagregarconceptos: TButton
          Left = 4
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Agregar'
          TabOrder = 1
          OnClick = btnagregarconceptosClick
        end
        object btnmodificarconceptos: TButton
          Left = 78
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Modificar'
          Enabled = False
          TabOrder = 2
        end
        object btnquitarconceptos: TButton
          Left = 151
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Quitar'
          TabOrder = 3
        end
      end
    end
    object btnimprimir: TButton
      Left = 10
      Top = 457
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 14
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
    Left = 544
    Top = 192
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
      
        'select documentoventadetalles.*, productos.producto_codigo, prod' +
        'uctos.producto_codigobarras from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id')
    Params = <>
    Left = 328
    Top = 224
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
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
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
    object ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe3: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe4: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe5: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe6: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_listaprecio: TIntegerField
      FieldName = 'documentoventadetalle_listaprecio'
    end
    object ZQDocumentoventadetallesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
    object ZQDocumentoventadetallesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQDocumentoventadetallesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
  end
  object DTSDocumentoventadetalle: TDataSource
    DataSet = ZQDocumentoventadetalles
    Left = 440
    Top = 168
  end
  object ZQNotacredito: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosventas'
      'where documentoventa_id=-1')
    Params = <>
    Left = 648
    Top = 200
  end
  object ZQExecSql: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentoventadetallesAnterior: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles'
      'where producto_tipo="PRODUCTO" and'
      'documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object FloatField1: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'documentoventadetalle_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object FloatField5: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object FloatField6: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object FloatField7: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object FloatField8: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object StringField2: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object StringField3: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object IntegerField2: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object FloatField9: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object IntegerField4: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object FloatField10: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object FloatField11: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object FloatField12: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object FloatField13: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object FloatField14: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object FloatField15: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
    object IntegerField5: TIntegerField
      FieldName = 'documentoventadetalle_listaprecio'
    end
  end
  object ZQDocumentoventadetallesConceptos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles')
    Params = <>
    Left = 392
    Top = 88
    object IntegerField6: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object FloatField16: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField17: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField18: TFloatField
      FieldName = 'documentoventadetalle_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField19: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object FloatField20: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object FloatField21: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object FloatField22: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object FloatField23: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object StringField5: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object StringField6: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object IntegerField7: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object FloatField24: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object IntegerField9: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object FloatField25: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object FloatField26: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object FloatField27: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object FloatField28: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object FloatField29: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object FloatField30: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
    object IntegerField10: TIntegerField
      FieldName = 'documentoventadetalle_listaprecio'
    end
    object ZQDocumentoventadetallesConceptosproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
  object DTSDocumentoventadetalleConceptos: TDataSource
    DataSet = ZQDocumentoventadetallesConceptos
    Left = 472
    Top = 32
  end
end
