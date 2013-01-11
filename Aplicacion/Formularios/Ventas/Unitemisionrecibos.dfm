object emisionrecibos: Temisionrecibos
  Left = 0
  Top = 0
  Caption = 'Emision de recibos'
  ClientHeight = 432
  ClientWidth = 823
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
    Width = 823
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
      Left = 48
      Top = 13
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label4: TLabel
      Left = 35
      Top = 389
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cobrador'
      Visible = False
    end
    object Label1: TLabel
      Left = 3
      Top = 39
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuotas a cobrar'
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
    object vendedor_id: TSqlComboBox
      Left = 84
      Top = 386
      Width = 321
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from vendedores'
        'where vendedor_cobrador=-1'
        'order by vendedor_nombre')
      Confcampo_codigo = 'vendedor_id'
      Confcampo_nomb = 'vendedor_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object btncancelar: TButton
      Left = 742
      Top = 385
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 4
      OnClick = btncancelarClick
    end
    object btnactualizar: TButton
      Left = 195
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 3
      OnClick = btnactualizarClick
    end
    object DBGrid1: TDBGrid
      Left = 83
      Top = 37
      Width = 734
      Height = 342
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
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 427
          Visible = True
        end
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
    object Button1: TButton
      Left = 661
      Top = 385
      Width = 75
      Height = 25
      Caption = 'Imprimir'
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
      'select * '
      'from solicitudcuotas'
      
        'inner join solicitudes on solicitudcuotas.solic_id=solicitudes.s' +
        'olic_id'
      
        'inner join clientes on solicitudes.cliente_id=clientes.cliente_i' +
        'd')
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
  object CustomizeGrid1: TCustomizeGrid
    Active = True
    Grid = DBGrid1
    AlternateRows.Active = True
    AlternateRows.Color1 = clWhite
    AlternateRows.Color2 = clWhite
    AlternateRows.Style = asStandard
    DataStyles.TextMemos = False
    DataStyles.CheckBox = False
    SortOptions.ChangeCursorOnTitle = False
    OnPaintRow = CustomizeGrid1PaintRow
    Left = 280
    Top = 96
  end
  object VCLReport1: TVCLReport
    AsyncExecution = False
    Title = 'Untitled'
    Left = 344
    Top = 216
  end
  object RpAlias1: TRpAlias
    List = <>
    Connections = <>
    Left = 392
    Top = 224
  end
end
