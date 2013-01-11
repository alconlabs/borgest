object solicitudes: Tsolicitudes
  Left = 0
  Top = 0
  Caption = 'Solicitudes'
  ClientHeight = 280
  ClientWidth = 577
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 280
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
      Left = 57
      Top = 12
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label2: TLabel
      Left = 363
      Top = 36
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha de prestamo'
    end
    object Label3: TLabel
      Left = 62
      Top = 60
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 48
      Top = 84
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label6: TLabel
      Left = 16
      Top = 236
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total a Devolver'
    end
    object Label5: TLabel
      Left = 61
      Top = 132
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuotas'
    end
    object Label7: TLabel
      Left = 28
      Top = 156
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe Cuota'
    end
    object Label8: TLabel
      Left = 27
      Top = 180
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de Cuota'
    end
    object Label9: TLabel
      Left = 35
      Top = 204
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Primer cuota'
    end
    object Label10: TLabel
      Left = 20
      Top = 108
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Monto Prestado'
    end
    object Label11: TLabel
      Left = 360
      Top = 131
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Monto de inter'#233's'
    end
    object Label12: TLabel
      Left = 396
      Top = 109
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Interes %'
    end
    object Label13: TLabel
      Left = 434
      Top = 60
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'DNI'
    end
    object Label14: TLabel
      Left = 17
      Top = 36
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero Impreso'
    end
    object solic_numero: TEdit
      Left = 100
      Top = 9
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object solic_fecha: TDateTimePicker
      Left = 460
      Top = 33
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 2
    end
    object cliente_id: TSqlComboBox
      Left = 100
      Top = 57
      Width = 317
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnSelect = cliente_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
    end
    object vendedor_id: TSqlComboBox
      Left = 101
      Top = 81
      Width = 465
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from vendedores'
        'where vendedor_vendedor=-1'
        'order by vendedor_nombre')
      Confcampo_codigo = 'vendedor_id'
      Confcampo_nomb = 'vendedor_nombre'
      Tag2 = 0
    end
    object solic_total: TDBAdvEdit
      Left = 101
      Top = 233
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
      TabOrder = 11
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object btncancelar: TButton
      Left = 483
      Top = 231
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 13
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 402
      Top = 231
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 12
      OnClick = btnguardarClick
    end
    object solic_cuotas: TDBAdvEdit
      Left = 101
      Top = 129
      Width = 121
      Height = 21
      EditType = etNumeric
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 7
      Text = '0'
      Visible = True
      OnExit = solic_cuotasExit
      Version = '2.7.0.5'
    end
    object solic_importecuota: TDBAdvEdit
      Left = 101
      Top = 153
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
      TabOrder = 8
      Text = '0,00'
      Visible = True
      OnExit = solic_importecuotaExit
      Version = '2.7.0.5'
    end
    object solic_cuotatipo: TComboBox
      Left = 100
      Top = 177
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = 'Semanal'
      Items.Strings = (
        'Semanal'
        'Quincenal'
        'Diaria'
        'Mensual')
    end
    object solic_vencuno: TDateTimePicker
      Left = 100
      Top = 201
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 10
    end
    object solic_prestado: TDBAdvEdit
      Left = 101
      Top = 105
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
      TabOrder = 5
      Text = '0,00'
      Visible = True
      OnExit = solic_prestadoExit
      Version = '2.7.0.5'
    end
    object solic_interesganado: TDBAdvEdit
      Left = 445
      Top = 105
      Width = 121
      Height = 21
      TabStop = False
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
      TabOrder = 6
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object solic_montoganado: TDBAdvEdit
      Left = 445
      Top = 128
      Width = 121
      Height = 21
      TabStop = False
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
      TabOrder = 14
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object cliente_dni: TEdit
      Left = 460
      Top = 57
      Width = 106
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 15
    end
    object solic_numeroimpreso: TEdit
      Left = 100
      Top = 33
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQuery2AfterOpen
    SQL.Strings = (
      'select * from solicitudes'
      'where solic_id=:solic_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
  end
end
