object facturasventa: Tfacturasventa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Factura Venta'
  ClientHeight = 563
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
    Height = 563
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
      Left = 585
      Top = 7
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 30
      Top = 55
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 569
      Top = 55
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label8: TLabel
      Left = 522
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
    object Label1: TLabel
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
    object Label11: TLabel
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
    object Label12: TLabel
      Left = 540
      Top = 103
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lista de Precios'
    end
    object Label13: TLabel
      Left = 331
      Top = 289
      Width = 30
      Height = 13
      Caption = 'Pagos'
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
      Left = 554
      Top = 31
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Venc.'
    end
    object cliente_ultimaventa: TLabel
      Left = 331
      Top = 79
      Width = 27
      Height = 13
      Caption = 'fecha'
    end
    object documentoventa_numero: TEdit
      Left = 184
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 17
    end
    object documentoventa_fecha: TDateTimePicker
      Left = 621
      Top = 4
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 18
      OnExit = documentoventa_fechaExit
    end
    object cliente_id: TSqlComboBox
      Left = 68
      Top = 52
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
      Left = 620
      Top = 52
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
      Top = 513
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 12
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 682
      Top = 513
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 11
      OnClick = btnguardarClick
    end
    object documentoventa_condicionventa: TComboBox
      Left = 621
      Top = 76
      Width = 219
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Contado'
      OnSelect = documentoventa_condicionventaSelect
      Items.Strings = (
        'Contado'
        'Cuenta Corriente')
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 122
      Width = 836
      Height = 153
      TabStop = False
      DataSource = DTSDocumentoventadetalle
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
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
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          Title.Caption = 'Producto'
          Width = 397
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_precio'
          Title.Caption = 'Precio'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_total'
          Title.Caption = 'Total'
          Width = 109
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 4
      Top = 277
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 5
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 151
      Top = 277
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 7
      OnClick = btnquitarClick
    end
    object btnmodificar: TButton
      Left = 78
      Top = 277
      Width = 75
      Height = 25
      Caption = 'Modificar'
      TabOrder = 6
      OnClick = btnmodificarClick
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 308
      Width = 316
      Height = 165
      Caption = 'Totales'
      ParentBackground = False
      TabOrder = 8
      object Label5: TLabel
        Left = 8
        Top = 41
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 21%'
      end
      object Label6: TLabel
        Left = 14
        Top = 65
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 21%'
      end
      object Label7: TLabel
        Left = 159
        Top = 41
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
      end
      object Label9: TLabel
        Left = 165
        Top = 65
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
      end
      object Label10: TLabel
        Left = 111
        Top = 121
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
      object Label99: TLabel
        Left = 13
        Top = 17
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Recargo'
      end
      object Label30: TLabel
        Left = 162
        Top = 17
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descuento'
      end
      object lblperciva: TLabel
        Left = 12
        Top = 89
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Perc IVA'
      end
      object documentoventa_neto21: TMoneyEdit
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
        TabOrder = 2
        Version = '1.1.0.1'
      end
      object documentoventa_iva21: TMoneyEdit
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
        TabOrder = 3
        Version = '1.1.0.1'
      end
      object documentoventa_neto105: TMoneyEdit
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
        TabOrder = 4
        Version = '1.1.0.1'
      end
      object documentoventa_iva105: TMoneyEdit
        Left = 228
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
        ReadOnly = True
        TabOrder = 5
        Version = '1.1.0.1'
      end
      object documentoventa_total: TMoneyEdit
        Left = 164
        Top = 118
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
        TabOrder = 6
        Version = '1.1.0.1'
      end
      object documentoventa_recargo: TMoneyEdit
        Left = 68
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 0
        Version = '1.1.0.1'
        OnExit = documentoventa_recargoExit
      end
      object documentoventa_descuento: TMoneyEdit
        Left = 228
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 1
        Version = '1.1.0.1'
        OnExit = documentoventa_recargoExit
      end
      object documentoventa_perciva: TMoneyEdit
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
        TabOrder = 7
        Version = '1.1.0.1'
      end
    end
    object puntoventa_id: TSqlComboBox
      Left = 68
      Top = 28
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
      Top = 28
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
    object documentoventa_listaprecio: TComboBox
      Left = 621
      Top = 100
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
    object DBGrid2: TDBGrid
      Left = 331
      Top = 306
      Width = 509
      Height = 167
      TabStop = False
      DataSource = DTSPagos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 13
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'tipopago_nombre'
          Title.Caption = 'Tipo'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_nombre'
          Title.Caption = 'Descripcion'
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_importe'
          Title.Caption = 'Importe'
          Width = 103
          Visible = True
        end>
    end
    object btnagregarpago: TButton
      Left = 331
      Top = 483
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 9
      OnClick = btnagregarpagoClick
    end
    object btnquitarpago: TButton
      Left = 405
      Top = 483
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 10
      OnClick = btnquitarpagoClick
    end
    object sucursal_id: TSqlComboBox
      Left = 68
      Top = 4
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
    object btnherramientas: TAdvGlowButton
      Left = 790
      Top = 4
      Width = 44
      Height = 29
      Caption = 'btnherramientas'
      Picture.Data = {
        FFD8FFE000104A46494600010100000100010000FFDB00430009060708070609
        0807080A0A090B0D160F0D0C0C0D1B14151016201D2222201D1F1F2428342C24
        2631271F1F2D3D2D3135373A3A3A232B3F443F384334393A37FFDB0043010A0A
        0A0D0C0D1A0F0F1A37251F253737373737373737373737373737373737373737
        373737373737373737373737373737373737373737373737373737373737FFC0
        0011080019001903012200021101031101FFC400190000020301000000000000
        000000000000000601040507FFC4002810000103020602020203000000000000
        0001020311042100051213314151610614228142A1E1FFC40016010101010000
        0000000000000000000000020104FFC4001D1100030002020300000000000000
        00000000010203110431124161FFDA000C03010002110311003F00EB59A56975
        C72869DC7187814C396095137D1AAFA491DC77FAC465758B0E32D29D71E69E04
        20BB1B8850049048B1100DFD77368CEA80A8B95685B2105003C8795A5040EE60
        C7EFD7118566B3759CD58CBD49430EBAA57D75224A9A00112A16E44C71E0E2B7
        2BB1CE3BB4DCAE87376BD46BDBA5A646E1D50EAA0C2044DCF03D79C5FC51CA76
        9A63EB251B6EA2EB4CCEA9FE53D83FE62F62004FF95D7572F30143494AF3AF7E
        3F5D01274A8C4EE13C58D84F0413E234322F8CB59750A8542F773078EB7AA472
        15D04CF43FBBCF3860C180A355E4CD17C86F12C72B4BDFD335AA7A853CDA5C4E
        8D954EE03623C27BBF60F1EEC71A58306199CFFFD9}
      TabOrder = 20
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Layout = blGlyphTop
      DropDownButton = True
      DropDownMenu = AdvPopupMenu1
    end
    object btnimprimirventa: TButton
      Left = 4
      Top = 513
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 21
      OnClick = btnimprimirventaClick
    end
    object btnagregarcliente: TButton
      Left = 391
      Top = 52
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 22
      TabStop = False
      OnClick = btnagregarclienteClick
    end
    object documentoventa_fechavenc: TDateTimePicker
      Left = 621
      Top = 28
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 19
    end
    object btnobservaciones: TButton
      Left = 4
      Top = 483
      Width = 83
      Height = 25
      Caption = 'Observaciones'
      TabOrder = 23
      OnClick = btnobservacionesClick
    end
    object VENTASEMITIRREMITOCTACTE: TCheckBox
      Left = 554
      Top = 517
      Width = 86
      Height = 17
      TabStop = False
      Caption = 'Emitir Remito'
      TabOrder = 24
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQuery2AfterOpen
    CachedUpdates = True
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
    Left = 456
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
      
        'select documentoventadetalles.*, productos.producto_codigo, prod' +
        'uctos.producto_codigobarras from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id')
    Params = <>
    Left = 240
    Top = 168
  end
  object DTSDocumentoventadetalle: TDataSource
    DataSet = ZQDocumentoventadetalles
    Left = 416
    Top = 160
  end
  object ZQRecibo: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosventas'
      'where documentoventa_id=-1')
    Params = <>
    Left = 776
    Top = 208
  end
  object ZQdocumentoventadocus: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadocus'
      'where documentoventadoc_id=-1')
    Params = <>
    Left = 520
    Top = 224
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
    Left = 272
    Top = 232
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
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.0.0.0'
    Left = 440
    Top = 8
    object Facturarnotapedido: TMenuItem
      Caption = 'Facturar Nota de pedido'
      OnClick = FacturarnotapedidoClick
    end
    object Facturarpresupuesto: TMenuItem
      Caption = 'Facturar Presupuesto'
      OnClick = FacturarpresupuestoClick
    end
  end
  object ZQRemito: TZQuery
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
    Left = 528
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQRemitoDetalles: TZQuery
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
    Left = 384
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
end
