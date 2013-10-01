object saldoclientes: Tsaldoclientes
  Left = 0
  Top = 0
  Caption = 'Estado de Cuentas - SALDOS'
  ClientHeight = 472
  ClientWidth = 744
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
    Width = 744
    Height = 472
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
    FreeOnClose = True
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
      Left = 25
      Top = 36
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object DBGrid1: TDBGrid
      Left = 9
      Top = 60
      Width = 728
      Height = 373
      DataSource = DSCSaldos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
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
          Width = 514
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldo'
          Title.Caption = 'Saldo'
          Width = 132
          Visible = True
        end>
    end
    object btnactualizar: TButton
      Left = 662
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 0
      OnClick = btnactualizarClick
    end
    object btnimprimir: TButton
      Left = 662
      Top = 439
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Enabled = False
      TabOrder = 2
      Visible = False
      OnClick = btnimprimirClick
    end
    object btnestado: TButton
      Left = 5
      Top = 439
      Width = 75
      Height = 25
      Caption = 'Estado Ctas.'
      TabOrder = 3
      OnClick = btnestadoClick
    end
    object btndetalle: TButton
      Left = 85
      Top = 439
      Width = 75
      Height = 25
      Caption = 'Detalle Ctas.'
      TabOrder = 4
      OnClick = btndetalleClick
    end
    object cliente_id: TSqlComboBox
      Left = 64
      Top = 33
      Width = 297
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object sucursal_id: TSqlComboBox
      Left = 64
      Top = 9
      Width = 297
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object CBSindeuda: TCheckBox
      Left = 592
      Top = 35
      Width = 145
      Height = 17
      Caption = 'Ocultar clientes sin deuda'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object BtnDetalleImputacion: TButton
      Left = 165
      Top = 439
      Width = 124
      Height = 25
      Caption = 'Detalle de Imputacion'
      TabOrder = 8
      OnClick = BtnDetalleImputacionClick
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from pagos'
      'where pago_id=:pago_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pago_id'
        ParamType = ptUnknown
      end>
    Left = 744
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pago_id'
        ParamType = ptUnknown
      end>
  end
  object ZQSaldos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 224
    Top = 208
    object ZQSaldosdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object ZQSaldosdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object ZQSaldosdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object ZQSaldosdocumentoventa_hora: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object ZQSaldosdocumentoventa_neto21: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object ZQSaldosdocumentoventa_iva21: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object ZQSaldosdocumentoventa_neto105: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object ZQSaldosdocumentoventa_iva105: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object ZQSaldosdocumentoventa_netonogravado: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object ZQSaldosdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
    end
    object ZQSaldosdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQSaldosdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
    end
    object ZQSaldosdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
    end
    object ZQSaldosdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQSaldoscliente_id: TIntegerField
      FieldName = 'cliente_id'
      Required = True
    end
    object ZQSaldospersonal_id: TIntegerField
      FieldName = 'personal_id'
      Required = True
    end
    object ZQSaldostipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQSaldosdocumentoventa_condicionventa: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object ZQSaldosdocumentoventa_fechavenc: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object ZQSaldosdocumentoventa_listaprecio: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object ZQSaldosdocumentoventa_equipo1: TStringField
      FieldName = 'documentoventa_equipo1'
      Size = 45
    end
    object ZQSaldosdocumentoventa_equipo2: TStringField
      FieldName = 'documentoventa_equipo2'
      Size = 45
    end
    object ZQSaldosdocumentoventa_formapago: TStringField
      FieldName = 'documentoventa_formapago'
      Size = 255
    end
    object ZQSaldoscliente_id_1: TIntegerField
      FieldName = 'cliente_id_1'
      Required = True
    end
    object ZQSaldoscliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 100
    end
    object ZQSaldoscliente_domicilio: TStringField
      FieldName = 'cliente_domicilio'
      Size = 150
    end
    object ZQSaldoscliente_documentonro: TStringField
      FieldName = 'cliente_documentonro'
      Size = 45
    end
    object ZQSaldoscliente_documentotipo: TStringField
      FieldName = 'cliente_documentotipo'
      Size = 45
    end
    object ZQSaldoscliente_telefono: TStringField
      FieldName = 'cliente_telefono'
      Size = 45
    end
    object ZQSaldoscliente_celular: TStringField
      FieldName = 'cliente_celular'
      Size = 45
    end
    object ZQSaldoscliente_mail: TStringField
      FieldName = 'cliente_mail'
      Size = 45
    end
    object ZQSaldoscondicioniva_id: TIntegerField
      FieldName = 'condicioniva_id'
      Required = True
    end
    object ZQSaldoscliente_listaprecio: TIntegerField
      FieldName = 'cliente_listaprecio'
    end
    object ZQSaldoscliente_condicionventa: TStringField
      FieldName = 'cliente_condicionventa'
      Size = 45
    end
    object ZQSaldoslocalidad_id: TIntegerField
      FieldName = 'localidad_id'
      Required = True
    end
    object ZQSaldoscliente_observaciones: TStringField
      FieldName = 'cliente_observaciones'
      Size = 255
    end
    object ZQSaldostipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object ZQSaldostipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQSaldostipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQSaldostipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQSaldostipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQSaldostipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQSaldostipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQSaldostipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQSaldospuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQSaldostipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQSaldostipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQSaldostipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
      Required = True
    end
    object ZQSaldostipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQSaldostipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQSaldostipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQSaldostipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQSaldostipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQSaldostipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQSaldostipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQSaldostipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQSaldossaldo: TFloatField
      FieldName = 'saldo'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object MQdetalle: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'solic_fecha'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as id,f as solic_fecha,t as solic_numero,d as total,d a' +
        's pagado,d as saldo from temp ')
    Params = <>
    IndexFieldNames = 'solic_fecha Asc'
    ConfCampos.Strings = (
      'id,i'
      'solic_fecha,f'
      'solic_numero,t'
      'total,d'
      'pagado,d'
      'saldo,d')
    Left = 616
    Top = 240
  end
  object tiventas: TTitles
    Campos.Strings = (
      'fecha'
      'comprob'
      'numero'
      'importe')
    Left = 632
    Top = 112
  end
  object DSCSaldos: TDataSource
    DataSet = ZQSaldos
    Left = 232
    Top = 128
  end
  object tipagos: TTitles
    Campos.Strings = (
      'fecha'
      'comprob'
      'numero'
      'importe')
    Left = 744
    Top = 136
  end
  object ZQsolicitud: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cobros'
      'where cliente_id=:cliente_id'
      'order by cobro_fecha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 672
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object Tisolicitud: TTitles
    Campos.Strings = (
      'id'
      'solic_fecha'
      'solic_numero'
      'total'
      'pagado'
      'saldo')
    Left = 888
    Top = 216
  end
  object Ticobros: TTitles
    Campos.Strings = (
      'id'
      'solic_fecha'
      'solic_numero'
      'total'
      'pagado'
      'saldo')
    Left = 838
    Top = 159
  end
  object ZQsoliciPendiente: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 808
    Top = 272
  end
  object MQsolicipendiente: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'fecha; numero'
    CachedUpdates = True
    SQL.Strings = (
      
        'select f as fecha,t as comprob,i as numero,d as importe from tem' +
        'p ')
    Params = <>
    IndexFieldNames = 'fecha Asc; numero Asc'
    ConfCampos.Strings = (
      'fecha,f'
      'comprob,t'
      'numero,i'
      'importe,d')
    Left = 808
    Top = 320
  end
  object ZQcobropendientes: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 896
    Top = 288
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 864
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object CustomizeGrid1: TCustomizeGrid
    Active = True
    Grid = DBGrid1
    AlternateRows.Active = False
    AlternateRows.Color1 = 15004387
    AlternateRows.Color2 = clBlack
    AlternateRows.Style = asStandard
    DataStyles.TextMemos = False
    DataStyles.CheckBox = False
    SortOptions.ChangeCursorOnTitle = False
    OnPaintRow = CustomizeGrid1PaintRow
    Left = 344
    Top = 168
  end
  object ZQDebitos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 432
    Top = 352
  end
  object ZQCreditos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 528
    Top = 352
  end
end
