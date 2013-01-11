object compradetalle: Tcompradetalle
  Left = 0
  Top = 0
  Caption = 'Cargar Detalle'
  ClientHeight = 208
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 208
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
    StatusBar.Text = 'F9-Aceptar'
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label3: TLabel
      Left = 47
      Top = 39
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Producto'
    end
    object Label6: TLabel
      Left = 48
      Top = 10
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object Label1: TLabel
      Left = 21
      Top = 66
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio Unitario'
    end
    object Label2: TLabel
      Left = 66
      Top = 98
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object producdepo_stockminimo: TLabel
      Left = 388
      Top = 66
      Width = 54
      Height = 13
      Caption = 'Stock Min: '
    end
    object producdepo_stockactual: TLabel
      Left = 612
      Top = 66
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Stock: '
    end
    object producto_fechaactualizacionprecio: TLabel
      Left = 229
      Top = 66
      Width = 54
      Height = 13
      Caption = 'Stock Min: '
    end
    object cantidad: TDBAdvEdit
      Left = 104
      Top = 7
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
      TabOrder = 0
      Text = '1,00'
      Visible = True
      OnExit = cantidadExit
      Version = '2.7.0.5'
    end
    object Button1: TButton
      Left = 560
      Top = 114
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object btnaceptar: TButton
      Left = 479
      Top = 114
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 5
      OnClick = btnaceptarClick
    end
    object preciounitario: TDBAdvEdit
      Left = 104
      Top = 63
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
      TabOrder = 3
      Text = '0,00'
      Visible = True
      OnExit = preciounitarioExit
      Version = '2.7.0.5'
    end
    object total: TDBAdvEdit
      Left = 104
      Top = 95
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
      TabOrder = 4
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object producto_id: TEditCodi
      Left = 102
      Top = 39
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
      TabOrder = 1
      Visible = True
      OnKeyPress = producto_idKeyPress
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
      ConfTexto = producto_nombre
      AfterSearch = producto_idAfterSearch
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
    end
    object producto_nombre: TEdit
      Left = 229
      Top = 36
      Width = 417
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object btnherramientas: TAdvGlowButton
      Left = 602
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
      TabOrder = 7
      Visible = False
      OnClick = btnherramientasClick
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
    object GroupBoxPrecios: TGroupBox
      Left = 0
      Top = 143
      Width = 660
      Height = 47
      Align = alBottom
      Caption = 'Precios'
      ParentBackground = False
      TabOrder = 8
      TabStop = True
      object producto_precioventa1: TMoneyEdit
        Left = 88
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
      object producto_precioventa2: TMoneyEdit
        Left = 248
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
        TabOrder = 1
        Version = '1.1.0.1'
      end
      object producto_precioventa3: TMoneyEdit
        Left = 408
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
      object producto_precioventa4: TMoneyEdit
        Left = 568
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
        TabOrder = 3
        Version = '1.1.0.1'
      end
      object btnprecio1: TButton
        Left = 16
        Top = 12
        Width = 70
        Height = 25
        Caption = 'Precio1'
        TabOrder = 4
        TabStop = False
        OnClick = btnprecio1Click
      end
      object btnprecio2: TButton
        Left = 176
        Top = 12
        Width = 70
        Height = 25
        Caption = 'Precio2'
        TabOrder = 5
        TabStop = False
        OnClick = btnprecio2Click
      end
      object btnprecio4: TButton
        Left = 496
        Top = 12
        Width = 70
        Height = 25
        Caption = 'Precio4'
        TabOrder = 6
        TabStop = False
        OnClick = btnprecio4Click
      end
      object btnprecio3: TButton
        Left = 336
        Top = 12
        Width = 70
        Height = 25
        Caption = 'Precio3'
        TabOrder = 7
        TabStop = False
        OnClick = btnprecio3Click
      end
    end
  end
  object ZQDocumentocompradetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentocompradetalles'
      'where documentocompra_id=-1')
    Params = <>
    Left = 392
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.0.0.0'
    Left = 528
    Top = 40
    object Codigodereferencia1: TMenuItem
      Caption = 'Codigo de referencia'
      OnClick = Codigodereferencia1Click
    end
    object Historial1: TMenuItem
      Caption = 'Historial de Ventas'
    end
  end
end
