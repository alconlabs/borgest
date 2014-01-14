object documentocomprabase: Tdocumentocomprabase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Factura Compra'
  ClientHeight = 558
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
    Height = 558
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
      Left = 13
      Top = 66
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
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
    object proveedor_domicilio: TLabel
      Left = 68
      Top = 93
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel
      Left = 37
      Top = 117
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT'
    end
    object proveedor_documentonro: TLabel
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
      Visible = False
    end
    object labelsucursal: TLabel
      Left = 21
      Top = 10
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label13: TLabel
      Left = 12
      Top = 431
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object documentocompra_numero: TEdit
      Left = 184
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 4
      OnExit = proveedor_idExit
    end
    object documentocompra_fecha: TDateTimePicker
      Left = 728
      Top = 36
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 16
    end
    object proveedor_id: TSqlComboBox
      Left = 68
      Top = 63
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnExit = proveedor_idExit
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
      Top = 63
      Width = 220
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object btncancelar: TButton
      Left = 763
      Top = 505
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 15
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 682
      Top = 505
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 14
      OnClick = btnguardarClick
    end
    object documentocompra_condicionventa: TComboBox
      Left = 615
      Top = 90
      Width = 219
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'Contado'
      Items.Strings = (
        'Contado'
        'Cuenta Corriente')
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 138
      Width = 836
      Height = 148
      TabStop = False
      DataSource = DTSDocumentocompradetalle
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
          FieldName = 'documentocompradetalle_cantidad'
          Title.Caption = 'Cant.'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo1'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_codigo'
          Title.Caption = 'Codigo1'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompradetalle_descripcion'
          Title.Caption = 'Producto'
          Width = 341
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompradetalle_precio'
          Title.Caption = 'Precio'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompradetalle_total'
          Title.Caption = 'Total'
          Width = 88
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 5
      Top = 292
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 10
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 151
      Top = 292
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 12
      OnClick = btnquitarClick
    end
    object btnmodificar: TButton
      Left = 78
      Top = 292
      Width = 75
      Height = 25
      Caption = 'Modificar'
      TabOrder = 11
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 320
      Width = 836
      Height = 105
      Caption = 'Totales'
      ParentBackground = False
      TabOrder = 13
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
        Left = 143
        Top = 17
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
      end
      object Label9: TLabel
        Left = 149
        Top = 41
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
      end
      object Label10: TLabel
        Left = 639
        Top = 65
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
      object Label14: TLabel
        Left = 29
        Top = 65
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Otros'
      end
      object Label16: TLabel
        Left = 288
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 27%'
      end
      object Label17: TLabel
        Left = 294
        Top = 41
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 27%'
      end
      object Label18: TLabel
        Left = 420
        Top = 17
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'No Gravado'
      end
      object Label19: TLabel
        Left = 418
        Top = 41
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'TISSH Perc.'
      end
      object Label20: TLabel
        Left = 574
        Top = 17
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA Ret.'
      end
      object Label21: TLabel
        Left = 569
        Top = 41
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA Perc.'
      end
      object Label22: TLabel
        Left = 703
        Top = 17
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'DGR Ret.'
      end
      object Label23: TLabel
        Left = 698
        Top = 41
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'DGR Perc.'
      end
      object documentocompra_neto21: TMoneyEdit
        Left = 60
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
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_iva21: TMoneyEdit
        Tag = 1
        Left = 60
        Top = 38
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
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_neto105: TMoneyEdit
        Tag = 2
        Left = 204
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
        TabOrder = 2
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_iva105: TMoneyEdit
        Tag = 3
        Left = 204
        Top = 38
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
        TabOrder = 3
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_total: TMoneyEdit
        Tag = 13
        Left = 692
        Top = 62
        Width = 134
        Height = 32
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
        TabOrder = 13
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_otrosimpuestos: TMoneyEdit
        Tag = 12
        Left = 60
        Top = 62
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
        TabOrder = 12
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_neto27: TMoneyEdit
        Tag = 4
        Left = 340
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
        TabOrder = 4
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_iva27: TMoneyEdit
        Tag = 5
        Left = 340
        Top = 38
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
        TabOrder = 5
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_nogravado: TMoneyEdit
        Tag = 6
        Left = 484
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
        TabOrder = 6
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_tishhperc: TMoneyEdit
        Tag = 7
        Left = 484
        Top = 38
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
        TabOrder = 7
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_ivaret: TMoneyEdit
        Tag = 8
        Left = 620
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
        TabOrder = 8
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_ivaperc: TMoneyEdit
        Tag = 9
        Left = 620
        Top = 38
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
        TabOrder = 9
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_dgrret: TMoneyEdit
        Tag = 10
        Left = 756
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
        TabOrder = 10
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
      object documentocompra_dgrperc: TMoneyEdit
        Left = 756
        Top = 38
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
        TabOrder = 11
        Version = '1.1.0.1'
        OnExit = documentocompra_neto21Exit
      end
    end
    object puntoventa_id: TSqlComboBox
      Left = 391
      Top = 7
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnExit = proveedor_idExit
      OnSelect = puntoventa_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from puntodeventa')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
    object tipodocu_id: TSqlComboBox
      Left = 68
      Top = 36
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnExit = proveedor_idExit
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tiposdocumento'
        'where tipodocu_nombre="Factura de Venta"')
      Confcampo_codigo = 'tipodocu_id'
      Confcampo_nomb = 'tipodocu_letra'
      Tag2 = 0
    end
    object documentocompra_listaprecio: TComboBox
      Left = 615
      Top = 114
      Width = 219
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = 'Precio 1'
      Visible = False
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
      TabOrder = 0
      OnExit = proveedor_idExit
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
      TabOrder = 17
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
      Enabled = False
      Layout = blGlyphTop
      DropDownButton = True
      DropDownMenu = AdvPopupMenu1
    end
    object btnimprimirventa: TButton
      Left = 4
      Top = 505
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 18
      Visible = False
      OnClick = btnimprimirventaClick
    end
    object documentocompra_puntoventa: TEdit
      Left = 123
      Top = 36
      Width = 57
      Height = 21
      TabOrder = 3
      OnExit = proveedor_idExit
    end
    object documentocompra_observacion: TMemo
      Left = 12
      Top = 450
      Width = 431
      Height = 47
      TabOrder = 19
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
    Left = 288
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentocompradetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentocompradetalles'
      
        'left join productos on documentocompradetalles.producto_id=produ' +
        'ctos.producto_id'
      'where 1=2')
    Params = <>
    Left = 240
    Top = 168
  end
  object DTSDocumentocompradetalle: TDataSource
    DataSet = ZQDocumentocompradetalles
    Left = 440
    Top = 208
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
      'where documentoventadoc_id=-1')
    Params = <>
    Left = 472
    Top = 120
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
    Left = 232
    Top = 464
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
    Left = 688
    Top = 440
  end
  object ZQpagotarjeta: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from pagotarjeta'
      
        'inner join tarjetas on pagotarjeta.tarjeta_id=tarjetas.tarjeta_i' +
        'd'
      'where documentopago_id=-1')
    Params = <>
    Left = 552
    Top = 448
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
    Left = 488
    Top = 16
    object Facturarnotapedido: TMenuItem
      Caption = 'Facturar Nota de pedido'
    end
    object Facturarpresupuesto: TMenuItem
      Caption = 'Facturar Presupuesto'
    end
  end
  object ZQDocumentocompradetallesAnterior: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentocompradetalles'
      'where documentocompra_id=:documentocompra_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
  end
end