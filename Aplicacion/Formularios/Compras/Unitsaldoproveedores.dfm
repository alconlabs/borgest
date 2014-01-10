object saldoproveedores: Tsaldoproveedores
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
  OnKeyDown = FormKeyDown
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
      Left = 8
      Top = 36
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
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
          FieldName = 'proveedor_nombre'
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
      TabOrder = 2
      Visible = False
      OnClick = btnimprimirClick
    end
    object btnestado: TButton
      Left = 4
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
      Enabled = False
      TabOrder = 4
      OnClick = btndetalleClick
    end
    object proveedor_id: TSqlComboBox
      Left = 64
      Top = 33
      Width = 297
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from proveedores'
        'order by proveedor_nombre')
      Confcampo_codigo = 'proveedor_id'
      Confcampo_nomb = 'proveedor_nombre'
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
      Left = 568
      Top = 35
      Width = 168
      Height = 17
      Caption = 'Ocultar proveedores sin deuda'
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
      Enabled = False
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
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompra' +
        's.documentocompra_saldo,documentoscompras.documentocompra_saldo*' +
        '-1)) as saldo'
      'from documentoscompras'
      
        'inner join proveedores on documentoscompras.proveedor_id=proveed' +
        'ores.proveedor_id'
      
        'inner join tiposdocumento on documentoscompras.tipodocu_id=tipos' +
        'documento.tipodocu_id'
      'where documentocompra_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by proveedores.proveedor_id')
    Params = <>
    Left = 224
    Top = 208
    object ZQSaldosdocumentocompra_id: TIntegerField
      FieldName = 'documentocompra_id'
      Required = True
    end
    object ZQSaldosdocumentocompra_numero: TIntegerField
      FieldName = 'documentocompra_numero'
    end
    object ZQSaldosdocumentocompra_fecha: TDateField
      FieldName = 'documentocompra_fecha'
    end
    object ZQSaldosdocumentocompra_hora: TTimeField
      FieldName = 'documentocompra_hora'
    end
    object ZQSaldosdocumentocompra_total: TFloatField
      FieldName = 'documentocompra_total'
    end
    object ZQSaldosdocumentocompra_estado: TStringField
      FieldName = 'documentocompra_estado'
      Size = 45
    end
    object ZQSaldosdocumentocompra_pagado: TFloatField
      FieldName = 'documentocompra_pagado'
    end
    object ZQSaldosdocumentocompra_saldo: TFloatField
      FieldName = 'documentocompra_saldo'
    end
    object ZQSaldosdocumentocompra_observacion: TStringField
      FieldName = 'documentocompra_observacion'
      Size = 255
    end
    object ZQSaldosdocumentocompra_condicionventa: TIntegerField
      FieldName = 'documentocompra_condicionventa'
    end
    object ZQSaldosdocumentocompra_fechavenc: TDateField
      FieldName = 'documentocompra_fechavenc'
    end
    object ZQSaldospersonal_id: TIntegerField
      FieldName = 'personal_id'
      Required = True
    end
    object ZQSaldosproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
      Required = True
    end
    object ZQSaldostipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQSaldosdocumentocompra_neto21: TFloatField
      FieldName = 'documentocompra_neto21'
    end
    object ZQSaldosdocumentocompra_iva21: TFloatField
      FieldName = 'documentocompra_iva21'
    end
    object ZQSaldosdocumentocompra_neto105: TFloatField
      FieldName = 'documentocompra_neto105'
    end
    object ZQSaldosdocumentocompra_iva105: TFloatField
      FieldName = 'documentocompra_iva105'
    end
    object ZQSaldosdocumentocompra_otrosimpuestos: TFloatField
      FieldName = 'documentocompra_otrosimpuestos'
    end
    object ZQSaldosdocumentocompra_puntoventa: TIntegerField
      FieldName = 'documentocompra_puntoventa'
    end
    object ZQSaldosdocumentocompra_neto27: TFloatField
      FieldName = 'documentocompra_neto27'
    end
    object ZQSaldosdocumentocompra_iva27: TFloatField
      FieldName = 'documentocompra_iva27'
    end
    object ZQSaldosdocumentocompra_nogravado: TFloatField
      FieldName = 'documentocompra_nogravado'
    end
    object ZQSaldosdocumentocompra_tishhperc: TFloatField
      FieldName = 'documentocompra_tishhperc'
    end
    object ZQSaldosdocumentocompra_ivaret: TFloatField
      FieldName = 'documentocompra_ivaret'
    end
    object ZQSaldosdocumentocompra_ivaperc: TFloatField
      FieldName = 'documentocompra_ivaperc'
    end
    object ZQSaldosdocumentocompra_dgrret: TFloatField
      FieldName = 'documentocompra_dgrret'
    end
    object ZQSaldosdocumentocompra_dgrperc: TFloatField
      FieldName = 'documentocompra_dgrperc'
    end
    object ZQSaldosproveedor_id_1: TIntegerField
      FieldName = 'proveedor_id_1'
      Required = True
    end
    object ZQSaldosproveedor_nombre: TStringField
      FieldName = 'proveedor_nombre'
      Size = 100
    end
    object ZQSaldosproveedor_domicilio: TStringField
      FieldName = 'proveedor_domicilio'
      Size = 150
    end
    object ZQSaldosproveedor_documentonro: TStringField
      FieldName = 'proveedor_documentonro'
      Size = 45
    end
    object ZQSaldosproveedor_documentotipo: TStringField
      FieldName = 'proveedor_documentotipo'
      Size = 45
    end
    object ZQSaldosproveedor_telefono: TStringField
      FieldName = 'proveedor_telefono'
      Size = 45
    end
    object ZQSaldosproveedor_celular: TStringField
      FieldName = 'proveedor_celular'
      Size = 45
    end
    object ZQSaldosproveedor_mail: TStringField
      FieldName = 'proveedor_mail'
      Size = 150
    end
    object ZQSaldoscondicioniva_id: TIntegerField
      FieldName = 'condicioniva_id'
      Required = True
    end
    object ZQSaldosproveedor_condicionventa: TStringField
      FieldName = 'proveedor_condicionventa'
      Size = 45
    end
    object ZQSaldosproveedor_tipo: TStringField
      FieldName = 'proveedor_tipo'
      Size = 45
    end
    object ZQSaldoslocalidad_id: TIntegerField
      FieldName = 'localidad_id'
      Required = True
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
    object ZQSaldostipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQSaldostipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQSaldossaldo: TFloatField
      FieldName = 'saldo'
      ReadOnly = True
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
