object NotadeCredito2: TNotadeCredito2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Nota de Credito de Venta'
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
      ItemHeight = 0
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
      ItemHeight = 0
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
      ItemHeight = 0
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
      ItemHeight = 0
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
      ItemHeight = 0
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
      ActivePage = TabSheet2
      TabOrder = 13
      object TabSheet1: TTabSheet
        Caption = 'Productos'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
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
          TabOrder = 2
          OnClick = btnmodificarconceptosClick
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
      object TabSheet3: TTabSheet
        Caption = 'Facturas'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label17: TLabel
          Left = 677
          Top = 129
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Imputado'
        end
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 828
          Height = 105
          Align = alTop
          DataSource = DTSDocumentoventadocus
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
        object Button1: TButton
          Left = 3
          Top = 127
          Width = 75
          Height = 25
          Caption = 'Agregar'
          TabOrder = 1
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 77
          Top = 127
          Width = 75
          Height = 25
          Caption = 'Quitar'
          TabOrder = 2
        end
        object btntomardocumentosAuto: TButton
          Left = 158
          Top = 127
          Width = 129
          Height = 25
          Caption = 'Cargar'
          TabOrder = 3
        end
        object documentoventa_totalimputado: TMoneyEdit
          Left = 758
          Top = 126
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
      'select * from documentoventadetalles')
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
  end
  object DTSDocumentoventadetalle: TDataSource
    DataSet = ZQDocumentoventadetalles
    Left = 440
    Top = 168
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
    Left = 272
    Top = 168
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
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_saldo_1: TFloatField
      FieldName = 'documentoventa_saldo_1'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
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
    object ZQdocumentoventadocuspuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQdocumentoventadocuspuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQdocumentoventadocusdocumentoventadoc_tiporelacion: TStringField
      FieldName = 'documentoventadoc_tiporelacion'
      Size = 45
    end
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
  object DTSDocumentoventadocus: TDataSource
    DataSet = ZQdocumentoventadocus
    Left = 472
    Top = 224
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
