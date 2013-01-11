object Cobros: TCobros
  Left = 0
  Top = 0
  Caption = 'Cobros'
  ClientHeight = 512
  ClientWidth = 418
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
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 512
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
    object Label2: TLabel
      Left = 2
      Top = 13
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha de Cobro'
    end
    object Label3: TLabel
      Left = 46
      Top = 61
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 35
      Top = 37
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cobrador'
    end
    object Label6: TLabel
      Left = 11
      Top = 435
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total a Cobrar'
    end
    object Label12: TLabel
      Left = 6
      Top = 360
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    object Label1: TLabel
      Left = 44
      Top = 136
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuotas'
    end
    object Label5: TLabel
      Left = 27
      Top = 86
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Solicitudes'
    end
    object Label7: TLabel
      Left = 24
      Top = 411
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Saldo'
    end
    object Label8: TLabel
      Left = 4
      Top = 111
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Recibo Numero'
    end
    object cobro_fecha: TDateTimePicker
      Left = 84
      Top = 10
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 0
    end
    object cliente_id: TSqlComboBox
      Left = 84
      Top = 58
      Width = 321
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
      Left = 85
      Top = 34
      Width = 321
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from vendedores'
        'where vendedor_cobrador=-1'
        'order by vendedor_nombre')
      Confcampo_codigo = 'vendedor_id'
      Confcampo_nomb = 'vendedor_nombre'
      Tag2 = 0
    end
    object cobro_importe: TDBAdvEdit
      Left = 84
      Top = 432
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
    object btncancelar: TButton
      Left = 330
      Top = 458
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 9
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 249
      Top = 458
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 8
      OnClick = btnguardarClick
    end
    object cobro_observacion: TMemo
      Left = 84
      Top = 357
      Width = 321
      Height = 48
      TabOrder = 6
    end
    object DBGrid1: TDBGrid
      Left = 83
      Top = 133
      Width = 321
      Height = 218
      DataSource = DataSource1
      TabOrder = 5
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
    object solic_id: TSqlComboBox
      Left = 84
      Top = 83
      Width = 321
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
    object total_saldo: TDBAdvEdit
      Left = 84
      Top = 408
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
      Enabled = False
      TabOrder = 10
      Text = '0,00'
      Visible = True
      Version = '2.7.0.5'
    end
    object cobro_numerorec: TDBAdvEdit
      Left = 84
      Top = 108
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
      TabOrder = 4
      Text = '0'
      Visible = True
      Version = '2.7.0.5'
    end
  end
  object DataSource1: TDataSource
    DataSet = MQsolicitudcuotas
    Left = 184
    Top = 120
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
    Left = 288
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
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
    Left = 256
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
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
        'ta_saldo,f as soliccuota_fechavenc,d as cobrosoliccuota_importe ' +
        'from temp ')
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
      'cobrosoliccuota_importe,d')
    Left = 280
    Top = 280
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
      'cobrosoliccuota_importe')
    Left = 208
    Top = 224
  end
end
