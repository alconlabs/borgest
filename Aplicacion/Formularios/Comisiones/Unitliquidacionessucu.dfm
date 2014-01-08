object liquidacionessucu: Tliquidacionessucu
  Left = 0
  Top = 0
  Caption = 'Liquidacion a Sucursales'
  ClientHeight = 502
  ClientWidth = 1011
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
    Width = 1011
    Height = 502
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
      Left = 13
      Top = 36
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label3: TLabel
      Left = 23
      Top = 60
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label13: TLabel
      Left = 210
      Top = 60
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label21: TLabel
      Left = 830
      Top = 438
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'TOTAL'
    end
    object Label19: TLabel
      Left = 475
      Top = 438
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sub Total'
    end
    object Label20: TLabel
      Left = 680
      Top = 438
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'IVA'
    end
    object liquidacionsucursal_id: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 11
    end
    object liquidacionsucursal_fecha: TDateTimePicker
      Left = 308
      Top = 9
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 0
    end
    object sucursal_id: TSqlComboBox
      Left = 60
      Top = 33
      Width = 354
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnSelect = sucursal_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object btncancelar: TButton
      Left = 915
      Top = 471
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 9
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 834
      Top = 471
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 8
      OnClick = btnguardarClick
    end
    object liquidacionsucursal_desdefecha: TDateTimePicker
      Left = 60
      Top = 57
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 2
    end
    object liquidacionsucursal_hastafecha: TDateTimePicker
      Left = 244
      Top = 57
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 3
    end
    object btnactualizar: TButton
      Left = 371
      Top = 55
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 4
      OnClick = btnactualizarClick
    end
    object liquidacionsucursal_total: TDBAdvEdit
      Left = 871
      Top = 435
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
      TabOrder = 7
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object btncalcular: TButton
      Left = 368
      Top = 433
      Width = 91
      Height = 25
      Caption = 'Calcular Total'
      TabOrder = 6
      OnClick = btncalcularClick
    end
    object btnimprimir: TButton
      Left = 10
      Top = 471
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 10
      OnClick = btnimprimirClick
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 79
      Width = 1011
      Height = 348
      ActivePage = TabSheet2
      TabOrder = 5
      object TabSheet1: TTabSheet
        Caption = 'Comisiones'
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
          Caption = 'Subtotal 1'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1003
          Height = 281
          Align = alTop
          DataSource = DSCliquisucudeta
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'documentoventa_fecha'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'puntoventa_numero'
              ReadOnly = True
              Title.Caption = 'Pto. Vta.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_numero'
              ReadOnly = True
              Title.Caption = 'Numero'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente_nombre'
              ReadOnly = True
              Title.Caption = 'Cliente'
              Width = 137
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_id'
              ReadOnly = True
              Title.Caption = 'Codigo Prod.'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              ReadOnly = True
              Title.Caption = 'Descripcion'
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              ReadOnly = True
              Title.Caption = 'Cantidad'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              ReadOnly = True
              Title.Caption = 'Importe'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liquisucudeta_porcentajeliquid'
              Title.Caption = 'Pagado %'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionsucursal_tipo'
              ReadOnly = True
              Title.Caption = 'Tipo Liq.'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionsucursal_valor'
              Title.Caption = 'Valor'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liquisucudeta_importe'
              ReadOnly = True
              Title.Caption = 'Total'
              Visible = True
            end>
        end
        object btnquitar: TButton
          Left = 10
          Top = 287
          Width = 91
          Height = 25
          Caption = 'Quitar'
          TabOrder = 1
          OnClick = btnquitarClick
        end
        object liquidacionsucursal_subtotal1: TDBAdvEdit
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
      object TabSheet4: TTabSheet
        Caption = 'Recibos'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label18: TLabel
          Left = 37
          Top = 18
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comision %'
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 48
          Width = 1003
          Height = 272
          Align = alBottom
          DataSource = DSCLiquisucudetaRecibos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'documentoventa_fecha'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'puntoventa_numero'
              ReadOnly = True
              Title.Caption = 'Pto. Vta.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_numero'
              ReadOnly = True
              Title.Caption = 'Numero'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente_nombre'
              ReadOnly = True
              Title.Caption = 'Cliente'
              Width = 377
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'comisionsucursal_valor'
              Title.Caption = 'Valor'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_total'
              Title.Caption = 'Importe'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'liquisucudetarecibo_importe'
              ReadOnly = True
              Title.Caption = 'Total'
              Width = 109
              Visible = True
            end>
        end
        object comisionsucursal_valor: TDBAdvEdit
          Left = 104
          Top = 15
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
      end
      object TabSheet2: TTabSheet
        Caption = 'Debitos y Creditos'
        ImageIndex = 1
        object Label7: TLabel
          Left = 814
          Top = 287
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subtotal 2'
        end
        object btnquitardebcred: TButton
          Left = 10
          Top = 287
          Width = 91
          Height = 25
          Caption = 'Quitar'
          TabOrder = 0
          OnClick = btnquitardebcredClick
        end
        object DBGrid4: TDBGrid
          Left = 0
          Top = 0
          Width = 1003
          Height = 281
          Align = alTop
          DataSource = DSCsucursalesdebcred
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'sucursaldebcred_id'
              Title.Caption = 'Nro.'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sucursaldebcred_fecha'
              Title.Caption = 'Fecha'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sucursaldebcred_descripcion'
              Width = 398
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sucursaldebcred_tipo'
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
        object liquidacionsucursal_subtotal2: TDBAdvEdit
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
        Caption = 'Facturar Liquidacion'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label6: TLabel
          Left = 489
          Top = 7
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object Label8: TLabel
          Left = 30
          Top = 55
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object Label9: TLabel
          Left = 473
          Top = 55
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vendedor'
        end
        object Label10: TLabel
          Left = 426
          Top = 79
          Width = 93
          Height = 13
          Alignment = taRightJustify
          Caption = 'Condicion de Venta'
        end
        object Label15: TLabel
          Left = 25
          Top = 31
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Numero'
        end
        object Label11: TLabel
          Left = 20
          Top = 79
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Domicilio'
        end
        object cliente_domicilio: TLabel
          Left = 68
          Top = 79
          Width = 42
          Height = 13
          Caption = 'Domicilio'
        end
        object Label12: TLabel
          Left = 13
          Top = 103
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'CUIT/DNI'
        end
        object cliente_documentonro: TLabel
          Left = 68
          Top = 103
          Width = 49
          Height = 13
          Caption = 'CUIT/DNI'
        end
        object Label14: TLabel
          Left = 444
          Top = 103
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lista de Precios'
          Visible = False
        end
        object labelsucursal: TLabel
          Left = 21
          Top = 7
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sucursal'
        end
        object Label16: TLabel
          Left = 458
          Top = 31
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Venc.'
        end
        object Label17: TLabel
          Left = 19
          Top = 143
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Producto'
        end
        object documentoventa_numero: TEdit
          Left = 184
          Top = 28
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object documentoventa_fecha: TDateTimePicker
          Left = 525
          Top = 4
          Width = 106
          Height = 21
          Date = 40384.000000000000000000
          Time = 40384.000000000000000000
          TabOrder = 5
        end
        object cliente_id: TSqlComboBox
          Left = 68
          Top = 52
          Width = 317
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 4
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
          Left = 524
          Top = 52
          Width = 220
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 7
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from personal')
          Confcampo_codigo = 'personal_id'
          Confcampo_nomb = 'personal_nombre'
          Tag2 = 0
        end
        object documentoventa_condicionventa: TComboBox
          Left = 525
          Top = 76
          Width = 219
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 8
          Text = 'Contado'
          Items.Strings = (
            'Contado'
            'Cuenta Corriente')
        end
        object puntoventa_id: TSqlComboBox
          Left = 68
          Top = 28
          Width = 52
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
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
          Top = 28
          Width = 52
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
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
          Left = 525
          Top = 100
          Width = 219
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          ItemIndex = 0
          TabOrder = 9
          Text = 'Precio 1'
          Visible = False
          Items.Strings = (
            'Precio 1'
            'Precio 2'
            'Precio 3'
            'Precio 4')
        end
        object sucursalfactura_id: TSqlComboBox
          Left = 68
          Top = 4
          Width = 317
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnSelect = sucursalfactura_idSelect
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from sucursales'
            'order by sucursal_nombre')
          Confcampo_codigo = 'sucursal_id'
          Confcampo_nomb = 'sucursal_nombre'
          Tag2 = 0
        end
        object documentoventa_fechavenc: TDateTimePicker
          Left = 525
          Top = 28
          Width = 106
          Height = 21
          Date = 40384.000000000000000000
          Time = 40384.000000000000000000
          TabOrder = 6
        end
        object producto_id: TEditCodi
          Left = 68
          Top = 140
          Width = 121
          Height = 21
          Flat = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 10
          Visible = True
          Version = '1.3.0.1'
          ButtonStyle = bsButton
          ButtonWidth = 16
          Etched = False
          abm = False
          ConfCampoCodigo = 'producto_id'
          ConfCampoCodigo1 = 'producto_codigo'
          ConfCampoCodigo2 = 'producto_codigobarras'
          ConfCampoTexto = 'producto_nombre'
          ConfSqlConnection = Princ.ZBase
          ConfSql.Strings = (
            'select * from productos'
            'order by producto_nombre')
          ConfTexto = producto_nombre
          ConfIni = Princ.ini1
          ConfLimpiar = True
          ConfSearchLimpio = True
          ConfCampoBusqueda1 = 'producto_codigo'
        end
        object producto_nombre: TEdit
          Left = 193
          Top = 140
          Width = 217
          Height = 21
          TabOrder = 11
        end
        object btngenerarfactura: TButton
          Left = 76
          Top = 194
          Width = 91
          Height = 25
          Caption = 'Generar Factura'
          TabOrder = 12
          OnClick = btngenerarfacturaClick
        end
        object btnverfactura: TButton
          Left = 180
          Top = 194
          Width = 91
          Height = 25
          Caption = 'Ver Factura'
          TabOrder = 13
          OnClick = btnverfacturaClick
        end
      end
    end
    object liquidacionsucursal_neto21: TDBAdvEdit
      Left = 527
      Top = 435
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
      TabOrder = 12
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object liquidacionsucursal_iva21: TDBAdvEdit
      Left = 703
      Top = 435
      Width = 90
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
      TabOrder = 13
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
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
  object DSCliquisucudeta: TDataSource
    DataSet = MQliquisucudeta
    Left = 120
    Top = 176
  end
  object MQliquisucudeta: TMQuery
    Connection = Princ.ZBase
    SortedFields = 
      'documentoventa_fecha,documentoventa_numero,documentoventadetalle' +
      '_descripcion,documentoventadetalle_precio'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as liquisucudeta_id,t as documentoventadetalle_id,t as ' +
        'producto_id,t as comisionsucursal_tipo,d as comisionsucursal_val' +
        'or,i as liquidacionsucursal_id,d as liquisucudeta_importe,d as d' +
        'ocumentoventadetalle_precio,t as puntoventa_numero,f as document' +
        'oventa_fecha,i as documentoventa_numero,t as cliente_nombre,t as' +
        ' documentoventadetalle_descripcion,d as documentoventadetalle_ca' +
        'ntidad,d as liquisucudeta_porcentajeliquid,d as documentoventa_p' +
        'agado,d as documentoventa_saldo from temp ')
    Params = <>
    IndexFieldNames = 
      'documentoventa_fecha Asc,documentoventa_numero Asc,documentovent' +
      'adetalle_descripcion Asc,documentoventadetalle_precio Asc'
    ConfCampos.Strings = (
      'liquisucudeta_id,i'
      'documentoventadetalle_id,t'
      'producto_id,t'
      'comisionsucursal_tipo,t'
      'comisionsucursal_valor,d'
      'liquidacionsucursal_id,i'
      'liquisucudeta_importe,d'
      'documentoventadetalle_precio,d'
      'puntoventa_numero,t'
      'documentoventa_fecha,f'
      'documentoventa_numero,i'
      'cliente_nombre,t'
      'documentoventadetalle_descripcion,t'
      'documentoventadetalle_cantidad,d'
      'liquisucudeta_porcentajeliquid,d'
      'documentoventa_pagado,d'
      'documentoventa_saldo,d')
    Left = 128
    Top = 240
    object MQliquisucudetaliquisucudeta_id: TIntegerField
      FieldName = 'liquisucudeta_id'
    end
    object MQliquisucudetadocumentoventadetalle_id: TStringField
      FieldName = 'documentoventadetalle_id'
      Size = 255
    end
    object MQliquisucudetaproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQliquisucudetacomisionsucursal_tipo: TStringField
      FieldName = 'comisionsucursal_tipo'
      Size = 255
    end
    object MQliquisucudetacomisionsucursal_valor: TFloatField
      FieldName = 'comisionsucursal_valor'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQliquisucudetaliquidacionsucursal_id: TIntegerField
      FieldName = 'liquidacionsucursal_id'
    end
    object MQliquisucudetaliquisucudeta_importe: TFloatField
      FieldName = 'liquisucudeta_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQliquisucudetadocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQliquisucudetapuntoventa_numero: TStringField
      FieldName = 'puntoventa_numero'
      Size = 255
    end
    object MQliquisucudetadocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object MQliquisucudetadocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object MQliquisucudetacliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 255
    end
    object MQliquisucudetadocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 255
    end
    object MQliquisucudetadocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQliquisucudetaliquisucudeta_porcentajeliquid: TFloatField
      FieldName = 'liquisucudeta_porcentajeliquid'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQliquisucudetadocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQliquisucudetadocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object ZQliquidacionessucursales: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQliquidacionessucursalesAfterOpen
    SQL.Strings = (
      'select * from liquidacionessucursales'
      'where liquidacionsucursal_id=:liquidacionsucursal_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionsucursal_id'
        ParamType = ptUnknown
      end>
    Left = 504
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionsucursal_id'
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
    Left = 200
    Top = 424
  end
  object ZQcomisionessucursales: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from facturasventa'
      
        'inner join facturasventadeta on facturasventa.facven_id=facturas' +
        'ventadeta.facven_id')
    Params = <>
    Left = 712
    Top = 296
  end
  object ZQControlDetalle: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from facturasventa'
      
        'inner join facturasventadeta on facturasventa.facven_id=facturas' +
        'ventadeta.facven_id')
    Params = <>
    Left = 440
    Top = 360
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
    Left = 664
    Top = 248
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
    Left = 728
    Top = 48
  end
  object ZQsucursalesdebcred: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      
        'select *, if(sucursaldebcred_tipo="Debito",sucursaldebcred_impor' +
        'te*-1,sucursaldebcred_importe) as importe '
      'from sucursalesdebcred'
      'where liquidacionsucursal_id=:liquidacionsucursal_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionsucursal_id'
        ParamType = ptUnknown
      end>
    Left = 888
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionsucursal_id'
        ParamType = ptUnknown
      end>
    object ZQsucursalesdebcredsucursaldebcred_id: TIntegerField
      FieldName = 'sucursaldebcred_id'
      Required = True
    end
    object ZQsucursalesdebcredsucursaldebcred_fecha: TDateField
      FieldName = 'sucursaldebcred_fecha'
    end
    object ZQsucursalesdebcredsucursaldebcred_descripcion: TStringField
      FieldName = 'sucursaldebcred_descripcion'
      Size = 255
    end
    object ZQsucursalesdebcredsucursaldebcred_tipo: TStringField
      FieldName = 'sucursaldebcred_tipo'
      Size = 45
    end
    object ZQsucursalesdebcredsucursaldebcred_importe: TFloatField
      FieldName = 'sucursaldebcred_importe'
    end
    object ZQsucursalesdebcredsucursaldebcred_estado: TStringField
      FieldName = 'sucursaldebcred_estado'
      Size = 45
    end
    object ZQsucursalesdebcredliquidacionsucursal_id: TIntegerField
      FieldName = 'liquidacionsucursal_id'
    end
    object ZQsucursalesdebcredsucursal_id: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object ZQsucursalesdebcredimporte: TFloatField
      FieldName = 'importe'
      ReadOnly = True
    end
  end
  object DSCsucursalesdebcred: TDataSource
    DataSet = ZQsucursalesdebcred
    Left = 592
    Top = 328
  end
  object ZQDocumentoventa: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosventas'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 936
    Top = 137
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
      'select * from documentoventadetalles'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 920
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object DSCLiquisucudetaRecibos: TDataSource
    DataSet = MQLiquisucudetaRecibos
    Left = 304
    Top = 168
  end
  object MQLiquisucudetaRecibos: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'documentoventa_fecha,documentoventa_numero'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as liquisucudetarecibo_id,t as documentoventa_id,d as c' +
        'omisionsucursal_valor,i as liquidacionsucursal_id,d as liquisucu' +
        'detarecibo_importe,d as documentoventa_total,t as puntoventa_num' +
        'ero,f as documentoventa_fecha,i as documentoventa_numero,t as cl' +
        'iente_nombre from temp ')
    Params = <>
    IndexFieldNames = 'documentoventa_fecha Asc,documentoventa_numero Asc'
    ConfCampos.Strings = (
      'liquisucudetarecibo_id,i'
      'documentoventa_id,t'
      'comisionsucursal_valor,d'
      'liquidacionsucursal_id,i'
      'liquisucudetarecibo_importe,d'
      'documentoventa_total,d'
      'puntoventa_numero,t'
      'documentoventa_fecha,f'
      'documentoventa_numero,i'
      'cliente_nombre,t')
    Left = 304
    Top = 240
    object MQLiquisucudetaRecibosliquisucudetarecibo_id: TIntegerField
      FieldName = 'liquisucudetarecibo_id'
    end
    object MQLiquisucudetaRecibosdocumentoventa_id: TStringField
      FieldName = 'documentoventa_id'
      Size = 255
    end
    object MQLiquisucudetaReciboscomisionsucursal_valor: TFloatField
      FieldName = 'comisionsucursal_valor'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQLiquisucudetaRecibosliquidacionsucursal_id: TIntegerField
      FieldName = 'liquidacionsucursal_id'
    end
    object MQLiquisucudetaRecibosliquisucudetarecibo_importe: TFloatField
      FieldName = 'liquisucudetarecibo_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQLiquisucudetaRecibosdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQLiquisucudetaRecibospuntoventa_numero: TStringField
      FieldName = 'puntoventa_numero'
      Size = 255
    end
    object MQLiquisucudetaRecibosdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object MQLiquisucudetaRecibosdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object MQLiquisucudetaReciboscliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 255
    end
  end
  object ZQDocumentosVentas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from facturasventa'
      
        'inner join facturasventadeta on facturasventa.facven_id=facturas' +
        'ventadeta.facven_id')
    Params = <>
    Left = 312
    Top = 312
  end
end
