object consultarvencidos: Tconsultarvencidos
  Left = 0
  Top = 0
  Caption = 'Consultar Vencidos'
  ClientHeight = 432
  ClientWidth = 764
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
    Width = 764
    Height = 432
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
      Left = 17
      Top = 13
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Fecha'
    end
    object Label4: TLabel
      Left = 46
      Top = 37
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
      Visible = False
    end
    object soliccuota_fechavenc: TDateTimePicker
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
      Top = 34
      Width = 493
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object btncancelar: TButton
      Left = 670
      Top = 385
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 4
      OnClick = btncancelarClick
    end
    object btnactualizar: TButton
      Left = 196
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 3
      OnClick = btnactualizarClick
    end
    object DBGrid1: TDBGrid
      Left = 11
      Top = 58
      Width = 734
      Height = 321
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'solic_numero'
          Title.Caption = 'Nro. Solic.'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'solic_prestado'
          Title.Caption = 'Prestado'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'solic_cuotas'
          Title.Caption = 'Cuotas'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'solic_importecuota'
          Title.Caption = 'Importe'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'solic_total'
          Title.Caption = 'Total'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'venc'
          Title.Caption = 'Vencido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pago'
          Title.Caption = 'Pago'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldo'
          Title.Caption = 'Saldo'
          Width = 45
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 568
      Top = 385
      Width = 96
      Height = 25
      Caption = 'Aplicar interes'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQSolicitudcuotas
    Left = 184
    Top = 96
  end
  object ZQSolicitudcuotas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      
        'select *, sum(soliccuota_pago) as pago, sum(soliccuota_saldo) as' +
        ' saldo, min(soliccuota_fechavenc) as venc'
      'from solicitudcuotas'
      
        'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.s' +
        'olic_id'
      
        'inner join clientes on solicitudes.cliente_id=clientes.cliente_i' +
        'd'
      'group by solicitudes.solic_id')
    Params = <>
    Left = 216
    Top = 96
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
    Left = 248
    Top = 96
  end
end
