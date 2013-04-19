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
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label3: TLabel
      Left = 22
      Top = 36
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Entidad'
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
          FieldName = 'entidad_razonsocial'
          Title.Caption = 'Entidad'
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
    object entidad_id: TSqlComboBox
      Left = 64
      Top = 33
      Width = 297
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from entidades'
        'order by entidad_razonsocial')
      Confcampo_codigo = 'entidad_id'
      Confcampo_nomb = 'entidad_razonsocial'
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
    object Button1: TButton
      Left = 165
      Top = 439
      Width = 124
      Height = 25
      Caption = 'Detalle de Imputacion'
      TabOrder = 8
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
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentos.docum' +
        'ento_saldo,documentos.documento_saldo*-1)) as saldo'
      'from documentos'
      
        'inner join entidades on documentos.entidad_id=entidades.entidad_' +
        'id'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      'where documento_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by entidades.entidad_id')
    Params = <>
    Left = 224
    Top = 208
    object ZQSaldosdocumento_id: TIntegerField
      FieldName = 'documento_id'
      Required = True
    end
    object ZQSaldosdocumento_fecha: TDateField
      FieldName = 'documento_fecha'
    end
    object ZQSaldosdocumento_fechavenc: TDateField
      FieldName = 'documento_fechavenc'
    end
    object ZQSaldosdocumento_hora: TTimeField
      FieldName = 'documento_hora'
    end
    object ZQSaldosdocumento_numero: TIntegerField
      FieldName = 'documento_numero'
    end
    object ZQSaldosdocumento_total: TFloatField
      FieldName = 'documento_total'
    end
    object ZQSaldosdocumento_saldo: TFloatField
      FieldName = 'documento_saldo'
    end
    object ZQSaldosdocumento_pagado: TFloatField
      FieldName = 'documento_pagado'
    end
    object ZQSaldosdocumento_estado: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object ZQSaldosdocumento_neto21: TFloatField
      FieldName = 'documento_neto21'
    end
    object ZQSaldosdocumento_iva21: TFloatField
      FieldName = 'documento_iva21'
    end
    object ZQSaldosdocumento_neto105: TFloatField
      FieldName = 'documento_neto105'
    end
    object ZQSaldosdocumento_iva105: TFloatField
      FieldName = 'documento_iva105'
    end
    object ZQSaldosdocumento_neto27: TFloatField
      FieldName = 'documento_neto27'
    end
    object ZQSaldosdocumento_iva27: TFloatField
      FieldName = 'documento_iva27'
    end
    object ZQSaldosdocumento_observaciones: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object ZQSaldosdocumento_ivaret: TFloatField
      FieldName = 'documento_ivaret'
    end
    object ZQSaldosdocumento_ivaperc: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object ZQSaldosdocumento_dgrret: TFloatField
      FieldName = 'documento_dgrret'
    end
    object ZQSaldosdocumento_dgrperc: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object ZQSaldosdocumento_otrosimpuestos: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object ZQSaldosdocumento_calidad: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object ZQSaldosdocumento_documentacion: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object ZQSaldostipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQSaldosentidad_id: TIntegerField
      FieldName = 'entidad_id'
      Required = True
    end
    object ZQSaldosentidadtransportista_id: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object ZQSaldosespecie_id: TIntegerField
      FieldName = 'especie_id'
      Required = True
    end
    object ZQSaldosdocumento_fechacumplimiento: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object ZQSaldosdocumento_moneda: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object ZQSaldosdocumento_preciounitario: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object ZQSaldosdocumento_lugarentrega: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object ZQSaldosdocumento_tipooperacion: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object ZQSaldosdocumento_condicioncalidad: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object ZQSaldosdocumento_tipodestino: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object ZQSaldosdocumento_numerocartaporte: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object ZQSaldosdocumento_kgbrutos: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object ZQSaldosdocumento_tara: TFloatField
      FieldName = 'documento_tara'
    end
    object ZQSaldosentidad_id_1: TIntegerField
      FieldName = 'entidad_id_1'
      Required = True
    end
    object ZQSaldosentidad_precodi: TIntegerField
      FieldName = 'entidad_precodi'
    end
    object ZQSaldosentidad_razonsocial: TStringField
      FieldName = 'entidad_razonsocial'
      Size = 255
    end
    object ZQSaldosentidad_nombfantasia: TStringField
      FieldName = 'entidad_nombfantasia'
      Size = 255
    end
    object ZQSaldosentidad_calle: TStringField
      FieldName = 'entidad_calle'
      Size = 255
    end
    object ZQSaldosentidad_puerta: TStringField
      FieldName = 'entidad_puerta'
      Size = 30
    end
    object ZQSaldosentidad_piso: TStringField
      FieldName = 'entidad_piso'
      Size = 10
    end
    object ZQSaldosentidad_depto: TStringField
      FieldName = 'entidad_depto'
      Size = 5
    end
    object ZQSaldosentidad_domiurbano: TStringField
      FieldName = 'entidad_domiurbano'
      Size = 2
    end
    object ZQSaldosentidad_domirural: TStringField
      FieldName = 'entidad_domirural'
      Size = 2
    end
    object ZQSaldosentidad_observaciones: TStringField
      FieldName = 'entidad_observaciones'
      Size = 255
    end
    object ZQSaldosprovincia_id: TIntegerField
      FieldName = 'provincia_id'
    end
    object ZQSaldoslocalidad_id: TIntegerField
      FieldName = 'localidad_id'
    end
    object ZQSaldosentidad_tipodocumento: TStringField
      FieldName = 'entidad_tipodocumento'
      Size = 10
    end
    object ZQSaldosentidad_nrodocumento: TStringField
      FieldName = 'entidad_nrodocumento'
      Size = 15
    end
    object ZQSaldosentidad_iibb: TStringField
      FieldName = 'entidad_iibb'
      Size = 50
    end
    object ZQSaldosentidad_inicioactividad: TDateField
      FieldName = 'entidad_inicioactividad'
    end
    object ZQSaldosentidad_tipoiva: TStringField
      FieldName = 'entidad_tipoiva'
    end
    object ZQSaldosentidad_retieneiibb: TStringField
      FieldName = 'entidad_retieneiibb'
      Size = 2
    end
    object ZQSaldosentidad_agretencion: TStringField
      FieldName = 'entidad_agretencion'
      Size = 2
    end
    object ZQSaldosentidad_convmulti: TStringField
      FieldName = 'entidad_convmulti'
      Size = 2
    end
    object ZQSaldosentidad_exportador: TStringField
      FieldName = 'entidad_exportador'
      Size = 2
    end
    object ZQSaldosentidad_minagri: TStringField
      FieldName = 'entidad_minagri'
      Size = 50
    end
    object ZQSaldosentidad_diretransporte: TStringField
      FieldName = 'entidad_diretransporte'
      Size = 100
    end
    object ZQSaldosentidad_regibalanza: TStringField
      FieldName = 'entidad_regibalanza'
      Size = 100
    end
    object ZQSaldosentidad_regiacopiador: TStringField
      FieldName = 'entidad_regiacopiador'
      Size = 100
    end
    object ZQSaldosentidad_nrocarnetmanejo: TStringField
      FieldName = 'entidad_nrocarnetmanejo'
      Size = 15
    end
    object ZQSaldosentidad_vencecarnet: TDateField
      FieldName = 'entidad_vencecarnet'
    end
    object ZQSaldosentidad_expedidocarnet: TStringField
      FieldName = 'entidad_expedidocarnet'
      Size = 100
    end
    object ZQSaldosentidad_inscregproducto: TStringField
      FieldName = 'entidad_inscregproducto'
      Size = 2
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
    object ZQSaldostipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQSaldostipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
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
    object ZQSaldospuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQSaldostipodocu_tipoctacte: TStringField
      FieldName = 'tipodocu_tipoctacte'
      Size = 45
    end
    object ZQSaldossaldo: TFloatField
      FieldName = 'saldo'
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
end
