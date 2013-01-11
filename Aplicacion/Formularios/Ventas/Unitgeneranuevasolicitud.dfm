object generanuevasolicitud: Tgeneranuevasolicitud
  Left = 0
  Top = 0
  Caption = 'Generar Nueva Solicitud'
  ClientHeight = 463
  ClientWidth = 470
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
    Width = 470
    Height = 463
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
    object Label3: TLabel
      Left = 58
      Top = 57
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 44
      Top = 32
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label5: TLabel
      Left = 57
      Top = 320
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuotas'
    end
    object Label7: TLabel
      Left = 24
      Top = 343
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe Cuota'
    end
    object Label8: TLabel
      Left = 23
      Top = 368
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de Cuota'
    end
    object Label9: TLabel
      Left = 31
      Top = 393
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Primer cuota'
    end
    object Label13: TLabel
      Left = 60
      Top = 8
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label15: TLabel
      Left = 39
      Top = 83
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Solicitudes'
    end
    object Label16: TLabel
      Left = 36
      Top = 283
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Saldo'
    end
    object cliente_id: TSqlComboBox
      Left = 100
      Top = 54
      Width = 366
      Height = 21
      ItemHeight = 13
      TabOrder = 2
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
      Left = 100
      Top = 29
      Width = 365
      Height = 21
      ItemHeight = 13
      TabOrder = 1
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
      Left = 397
      Top = 372
      Width = 67
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
      TabOrder = 14
      Text = '0,00'
      Visible = False
      Version = '2.7.0.5'
    end
    object btncancelar: TButton
      Left = 391
      Top = 428
      Width = 76
      Height = 26
      Caption = 'Cancelar'
      TabOrder = 11
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 256
      Top = 428
      Width = 136
      Height = 26
      Caption = 'Generar Cuotas Nuevas'
      TabOrder = 10
      OnClick = btnguardarClick
    end
    object solic_cuotas: TDBAdvEdit
      Left = 101
      Top = 315
      Width = 44
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
      TabOrder = 6
      Text = '0'
      Visible = True
      OnExit = solic_cuotasExit
      Version = '2.7.0.5'
    end
    object solic_importecuota: TDBAdvEdit
      Left = 101
      Top = 339
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
      OnExit = solic_importecuotaExit
      Version = '2.7.0.5'
    end
    object solic_cuotatipo: TComboBox
      Left = 101
      Top = 364
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = 'Semanal'
      Items.Strings = (
        'Semanal'
        'Quincenal'
        'Diaria'
        'Mensual')
    end
    object solic_vencuno: TDateTimePicker
      Left = 102
      Top = 388
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 9
    end
    object solic_interesganado: TDBAdvEdit
      Left = 397
      Top = 321
      Width = 67
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
      TabOrder = 13
      Text = '0,00'
      Visible = False
      Version = '2.7.0.5'
    end
    object solic_montoganado: TDBAdvEdit
      Left = 397
      Top = 345
      Width = 67
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
      TabOrder = 15
      Text = '0,00'
      Visible = False
      Version = '2.7.0.5'
    end
    object cobro_fecha: TDateTimePicker
      Left = 100
      Top = 5
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 0
    end
    object solic_id: TSqlComboBox
      Left = 100
      Top = 80
      Width = 366
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = solic_idChange
      Confbase = Princ.ZBase
      Confsql.Strings = (
        
          'select *, concat(solic_numero, '#39' - '#39', solic_fecha) as solic_nomb' +
          're '
        'from solicitudes')
      Confcampo_codigo = 'solic_id'
      Confcampo_nomb = 'solic_nombre'
      Tag2 = 0
    end
    object DBGrid1: TDBGrid
      Left = 100
      Top = 105
      Width = 365
      Height = 173
      DataSource = DataSource1
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'soliccuota_nrocuota'
          Title.Caption = 'Cuota'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'soliccuota_fechavenc'
          Title.Caption = 'Fecha'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'soliccuota_pago'
          Title.Caption = 'Pagado'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'soliccuota_saldo'
          Title.Caption = 'Saldo'
          Width = 70
          Visible = True
        end>
    end
    object total_saldo: TDBAdvEdit
      Left = 101
      Top = 279
      Width = 115
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
      OnExit = total_saldoExit
      Version = '2.7.0.5'
    end
    object solic_numero: TDBAdvEdit
      Left = 396
      Top = 285
      Width = 69
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
      TabOrder = 12
      Text = '0'
      Visible = False
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
    Left = 312
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
  end
  object MQsolicitudcuotas: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'soliccuota_nrocuota'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as solic_id,i as soliccuota_id,i as soliccuota_nrocuota' +
        ',d as soliccuota_importecuota,d as soliccuota_pago,d as soliccuo' +
        'ta_saldo,f as soliccuota_fechavenc,d as cobrosoliccuota_importe,' +
        't as soliccuota_estado from temp ')
    Params = <>
    IndexFieldNames = 'soliccuota_nrocuota Asc'
    ConfCampos.Strings = (
      'solic_id,i'
      'soliccuota_id,i'
      'soliccuota_nrocuota,i'
      'soliccuota_importecuota,d'
      'soliccuota_pago,d'
      'soliccuota_saldo,d'
      'soliccuota_fechavenc,f'
      'cobrosoliccuota_importe,d'
      'soliccuota_estado,t')
    Left = 432
    Top = 192
  end
  object tisolicitudcuotas: TTitles
    Campos.Strings = (
      'solic_id'
      'soliccuota_id'
      'soliccuota_nrocuota'
      'soliccuota_importecuota'
      'soliccuota_pago'
      'soliccuota_saldo'
      'soliccuota_fechavenc'
      'cobrosoliccuota_importe'
      'soliccuota_estado')
    Left = 384
    Top = 8
  end
  object ZQCobros: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from solicitudcuotas'
      
        'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.s' +
        'olic_id'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object ZQSolicitudcuotas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from solicitudcuotas'
      
        'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.s' +
        'olic_id'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = MQsolicitudcuotas
    Left = 432
    Top = 160
  end
end
