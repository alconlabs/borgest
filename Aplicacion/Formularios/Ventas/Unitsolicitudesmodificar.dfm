object solicitudesmodificar: Tsolicitudesmodificar
  Left = 0
  Top = 0
  Caption = 'Solicitudes'
  ClientHeight = 475
  ClientWidth = 592
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
    Width = 592
    Height = 475
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
    object btncancelar: TButton
      Left = 507
      Top = 423
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 0
      OnClick = btncancelarClick
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 592
      Height = 409
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Datos Iniciales'
        object Label1: TLabel
          Left = 57
          Top = 12
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Numero'
        end
        object Label2: TLabel
          Left = 424
          Top = 12
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object Label3: TLabel
          Left = 62
          Top = 36
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object Label4: TLabel
          Left = 48
          Top = 60
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vendedor'
        end
        object Label6: TLabel
          Left = 16
          Top = 212
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a Devolver'
        end
        object Label5: TLabel
          Left = 61
          Top = 108
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cuotas'
        end
        object Label7: TLabel
          Left = 28
          Top = 132
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe Cuota'
        end
        object Label8: TLabel
          Left = 27
          Top = 156
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Cuota'
        end
        object Label9: TLabel
          Left = 35
          Top = 180
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Primer cuota'
        end
        object Label10: TLabel
          Left = 20
          Top = 84
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Monto Prestado'
        end
        object Label11: TLabel
          Left = 368
          Top = 107
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Monto Ganado'
        end
        object Label12: TLabel
          Left = 396
          Top = 85
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Interes %'
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
          Top = 9
          Width = 106
          Height = 21
          Date = 40384.167574155090000000
          Time = 40384.167574155090000000
          TabOrder = 1
        end
        object cliente_id: TSqlComboBox
          Left = 100
          Top = 33
          Width = 465
          Height = 21
          ItemHeight = 13
          TabOrder = 2
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
          Top = 57
          Width = 465
          Height = 21
          ItemHeight = 13
          TabOrder = 3
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
          Top = 209
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
        object solic_cuotas: TDBAdvEdit
          Left = 101
          Top = 105
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
          TabOrder = 5
          Text = '0'
          Visible = True
          OnExit = solic_cuotasExit
          Version = '2.7.0.5'
        end
        object solic_importecuota: TDBAdvEdit
          Left = 101
          Top = 129
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
          TabOrder = 6
          Text = '0,00'
          Visible = True
          OnExit = solic_importecuotaExit
          Version = '2.7.0.5'
        end
        object solic_cuotatipo: TComboBox
          Left = 100
          Top = 153
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 7
          Text = 'Semanal'
          Items.Strings = (
            'Semanal'
            'Quincenal'
            'Diaria'
            'Mensual')
        end
        object solic_vencuno: TDateTimePicker
          Left = 100
          Top = 177
          Width = 106
          Height = 21
          Date = 40384.167574155090000000
          Time = 40384.167574155090000000
          TabOrder = 8
        end
        object solic_prestado: TDBAdvEdit
          Left = 101
          Top = 81
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
          TabOrder = 9
          Text = '0,00'
          Visible = True
          OnExit = solic_prestadoExit
          Version = '2.7.0.5'
        end
        object solic_interesganado: TDBAdvEdit
          Left = 445
          Top = 81
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
          TabOrder = 10
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object solic_montoganado: TDBAdvEdit
          Left = 445
          Top = 104
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
          TabOrder = 11
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Intereses aplicados'
        ImageIndex = 1
        object Label13: TLabel
          Left = 44
          Top = 14
          Width = 131
          Height = 13
          Alignment = taRightJustify
          Caption = 'Aplicar interes desde Fecha'
        end
        object Label14: TLabel
          Left = 60
          Top = 84
          Width = 115
          Height = 13
          Alignment = taRightJustify
          Caption = 'Interes diario por mora %'
        end
        object Label15: TLabel
          Left = 140
          Top = 107
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe'
        end
        object Label16: TLabel
          Left = 60
          Top = 130
          Width = 115
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe Total a devolver'
        end
        object Label17: TLabel
          Left = 107
          Top = 61
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dias de atraso'
        end
        object lbl_solic_fechadesdeprimervenc: TLabel
          Left = 181
          Top = 14
          Width = 135
          Height = 13
          Caption = 'solic_fechadesdeprimervenc'
          Enabled = False
        end
        object Label19: TLabel
          Left = 114
          Top = 38
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object Label20: TLabel
          Left = 145
          Top = 154
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pagos'
        end
        object Label21: TLabel
          Left = 148
          Top = 177
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Saldo'
        end
        object Label22: TLabel
          Left = 142
          Top = 201
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cuotas'
        end
        object Label23: TLabel
          Left = 110
          Top = 225
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe cuota'
        end
        object solic_fechaprimervenc: TDateTimePicker
          Left = 181
          Top = 34
          Width = 121
          Height = 21
          Date = 40384.167574155090000000
          Time = 40384.167574155090000000
          Enabled = False
          TabOrder = 1
          OnExit = solic_fechaprimervencExit
        end
        object solic_porcprimervenc: TDBAdvEdit
          Left = 181
          Top = 80
          Width = 121
          Height = 21
          EditType = etFloat
          DisabledColor = clWindow
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 3
          Text = '0,00'
          Visible = True
          OnExit = solic_porcprimervencExit
          Version = '2.7.0.5'
        end
        object solic_importeprimervenc: TDBAdvEdit
          Left = 181
          Top = 104
          Width = 121
          Height = 21
          TabStop = False
          EditType = etFloat
          DisabledColor = clWindow
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 4
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object solic_total2: TDBAdvEdit
          Left = 181
          Top = 127
          Width = 121
          Height = 21
          TabStop = False
          EditType = etFloat
          DisabledColor = clWindow
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 5
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object solic_estadovencimiento: TCheckBox
          Left = 23
          Top = 13
          Width = 15
          Height = 17
          TabOrder = 0
          OnClick = solic_estadovencimientoClick
        end
        object btnaplicarintereses: TButton
          Left = 181
          Top = 261
          Width = 121
          Height = 25
          Caption = 'Aplicar intereses'
          Enabled = False
          TabOrder = 10
          OnClick = btnaplicarinteresesClick
        end
        object solic_diasatraso: TDBAdvEdit
          Left = 181
          Top = 58
          Width = 121
          Height = 21
          TabStop = False
          EditType = etNumeric
          DisabledColor = clWindow
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 2
          Text = '0'
          Visible = True
          Version = '2.7.0.5'
        end
        object solic_pagos: TDBAdvEdit
          Left = 181
          Top = 151
          Width = 121
          Height = 21
          TabStop = False
          EditType = etFloat
          DisabledColor = clWindow
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 6
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object solic_saldo: TDBAdvEdit
          Left = 181
          Top = 174
          Width = 121
          Height = 21
          TabStop = False
          EditType = etFloat
          DisabledColor = clWindow
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 7
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object solic_cuotas2: TDBAdvEdit
          Left = 181
          Top = 198
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
          TabOrder = 8
          Text = '0'
          Visible = True
          OnExit = solic_cuotas2Exit
          Version = '2.7.0.5'
        end
        object solic_importecuota2: TDBAdvEdit
          Left = 181
          Top = 222
          Width = 121
          Height = 21
          TabStop = False
          EditType = etFloat
          DisabledColor = clWindow
          Precision = 2
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = False
          TabOrder = 9
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Intereses por cuotas'
        ImageIndex = 2
        object Label18: TLabel
          Left = 6
          Top = 8
          Width = 115
          Height = 13
          Alignment = taRightJustify
          Caption = 'Interes diario por mora %'
        end
        object DBGrid1: TDBGrid
          Left = 3
          Top = 30
          Width = 578
          Height = 321
          DataSource = DataSource1
          TabOrder = 0
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
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_fechavenc'
              Title.Caption = 'Vencimiento'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_pago'
              Title.Caption = 'Pago'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_saldo'
              Title.Caption = 'Saldo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_interesdiario'
              Title.Caption = 'Interes Diario'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_diasatraso'
              Title.Caption = 'Dias atraso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_interes'
              Title.Caption = 'Total intereses'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'soliccuota_saldonuevo'
              Title.Caption = 'Saldo nuevo'
              Visible = True
            end>
        end
        object btnactualizar: TButton
          Left = 207
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Actualizar'
          TabOrder = 1
          OnClick = btnactualizarClick
        end
        object soliccuota_interescuota: TDBAdvEdit
          Left = 127
          Top = 3
          Width = 74
          Height = 21
          EditType = etFloat
          DisabledColor = clWindow
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
          OnExit = solic_porcprimervencExit
          Version = '2.7.0.5'
        end
        object btnaplicarinteresexcuotas: TButton
          Left = 461
          Top = 357
          Width = 121
          Height = 25
          Caption = 'Aplicar intereses'
          TabOrder = 3
          OnClick = btnaplicarinteresexcuotasClick
        end
      end
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
    Left = 416
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
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
    Left = 416
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'solic_id'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = ZQSolicitudcuotas
    Left = 432
    Top = 264
  end
  object ZQSolicitudcuotas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select *,  0 as soliccuota_interes, 0 as soliccuota_saldonuevo,'
      '0 as  soliccuota_interesdiario, 0 as soliccuota_diasatraso'
      'from solicitudcuotas'
      'order by soliccuota_nrocuota')
    Params = <>
    Left = 48
    Top = 128
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
    Left = 56
    Top = 216
  end
end
