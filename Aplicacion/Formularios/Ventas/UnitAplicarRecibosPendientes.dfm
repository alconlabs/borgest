inherited AplicarRecibosPendientes: TAplicarRecibosPendientes
  Caption = 'Aplicar Recibos Pendientes'
  ClientHeight = 421
  ClientWidth = 753
  OnShow = FormShow
  ExplicitWidth = 769
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 753
    Height = 421
    ExplicitWidth = 753
    ExplicitHeight = 421
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 78
      Top = 8
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label1: TLabel [1]
      Left = 68
      Top = 35
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel [2]
      Left = 116
      Top = 35
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel [3]
      Left = 61
      Top = 59
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel [4]
      Left = 116
      Top = 59
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label2: TLabel [5]
      Left = 15
      Top = 88
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Recibos Pendientes'
    end
    object Label4: TLabel [6]
      Left = 86
      Top = 115
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object documentoventa_total: TLabel [7]
      Left = 160
      Top = 115
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0.00'
    end
    object Label6: TLabel [8]
      Left = 73
      Top = 139
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pagado'
    end
    object documentoventa_pagado: TLabel [9]
      Left = 160
      Top = 139
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0.00'
    end
    object Label8: TLabel [10]
      Left = 83
      Top = 163
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Saldo'
    end
    object documentoventa_saldo: TLabel [11]
      Left = 160
      Top = 163
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = '0.00'
    end
    object Label17: TLabel [12]
      Left = 586
      Top = 337
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Imputado'
    end
    inherited btncancelar: TButton
      Left = 660
      Top = 366
      TabOrder = 8
      ExplicitLeft = 660
      ExplicitTop = 366
    end
    inherited btnguardar: TButton
      Left = 579
      Top = 366
      TabOrder = 7
      OnClick = btnguardarClick
      ExplicitLeft = 579
      ExplicitTop = 366
    end
    object cliente_id: TSqlComboBox
      Left = 116
      Top = 5
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = cliente_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 182
      Width = 742
      Height = 150
      TabStop = False
      DataSource = DTSDocumentoventadocus
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_pagado'
          Title.Caption = 'Pagado'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_saldo'
          Title.Caption = 'Saldo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadoc_importe'
          Title.Caption = 'Cobrado'
          Width = 120
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 4
      Top = 335
      Width = 75
      Height = 25
      Caption = 'Agregar'
      Enabled = False
      TabOrder = 4
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 77
      Top = 335
      Width = 75
      Height = 25
      Caption = 'Quitar'
      Enabled = False
      TabOrder = 5
      OnClick = btnquitarClick
    end
    object btntomardocumentosAuto: TButton
      Left = 158
      Top = 335
      Width = 129
      Height = 25
      Caption = 'Cargar'
      Enabled = False
      TabOrder = 6
      OnClick = btntomardocumentosAutoClick
    end
    object documentoventa_id: TSqlComboBox
      Left = 116
      Top = 85
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnSelect = documentoventa_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'documentoventa_id'
      Confcampo_nomb = 'documentoventa_nombre'
      Tag2 = 0
    end
    object btnVerRecibo: TButton
      Left = 439
      Top = 83
      Width = 83
      Height = 25
      Caption = 'Ver Recibo'
      TabOrder = 2
      TabStop = False
      OnClick = btnVerReciboClick
    end
    object documentoventa_totalimputado: TMoneyEdit
      Left = 675
      Top = 334
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
      TabOrder = 9
      Version = '1.1.0.1'
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from documentosventas'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 648
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQdocumentoventadocus: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadocus'
      
        'inner join documentosventas on documentoventadocus.documentovent' +
        'a_idpago=documentosventas.documentoventa_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventadocus.documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 624
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object ZQdocumentoventadocusdocumentoventadoc_id: TIntegerField
      FieldName = 'documentoventadoc_id'
    end
    object ZQdocumentoventadocusdocumentoventadoc_importe: TFloatField
      FieldName = 'documentoventadoc_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
    end
    object ZQdocumentoventadocusdocumentoventa_idpago: TIntegerField
      FieldName = 'documentoventa_idpago'
    end
    object ZQdocumentoventadocusdocumentoventa_id_1: TIntegerField
      FieldName = 'documentoventa_id_1'
    end
    object ZQdocumentoventadocusdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object ZQdocumentoventadocusdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object ZQdocumentoventadocusdocumentoventa_hora: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object ZQdocumentoventadocusdocumentoventa_neto21: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object ZQdocumentoventadocusdocumentoventa_iva21: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object ZQdocumentoventadocusdocumentoventa_neto105: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object ZQdocumentoventadocusdocumentoventa_iva105: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object ZQdocumentoventadocusdocumentoventa_netonogravado: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object ZQdocumentoventadocusdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQdocumentoventadocusdocumentoventa_estado_1: TStringField
      FieldName = 'documentoventa_estado_1'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_pagado_1: TFloatField
      FieldName = 'documentoventa_pagado_1'
    end
    object ZQdocumentoventadocusdocumentoventa_saldo_1: TFloatField
      FieldName = 'documentoventa_saldo_1'
    end
    object ZQdocumentoventadocusdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQdocumentoventadocuscliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object ZQdocumentoventadocuspersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQdocumentoventadocustipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQdocumentoventadocusdocumentoventa_condicionventa: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object ZQdocumentoventadocusdocumentoventa_fechavenc: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object ZQdocumentoventadocusdocumentoventa_listaprecio: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object ZQdocumentoventadocustipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object ZQdocumentoventadocustipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQdocumentoventadocustipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQdocumentoventadocustipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQdocumentoventadocustipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQdocumentoventadocustipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQdocumentoventadocustipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQdocumentoventadocustipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQdocumentoventadocuspuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object ZQdocumentoventadocustipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQdocumentoventadocuspuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object ZQdocumentoventadocuspuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQdocumentoventadocuspuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQdocumentoventadocussucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQdocumentoventadocusdocumentoventadoc_tiporelacion: TStringField
      FieldName = 'documentoventadoc_tiporelacion'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_equipo1: TStringField
      FieldName = 'documentoventa_equipo1'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_equipo2: TStringField
      FieldName = 'documentoventa_equipo2'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_formapago: TStringField
      FieldName = 'documentoventa_formapago'
      Size = 255
    end
    object ZQdocumentoventadocusdocumentoventa_nrodetallepago: TStringField
      FieldName = 'documentoventa_nrodetallepago'
      Size = 45
    end
    object ZQdocumentoventadocusdocumentoventa_solicitudcliente: TStringField
      FieldName = 'documentoventa_solicitudcliente'
      Size = 255
    end
    object ZQdocumentoventadocusdocumentoventa_trabajorealizado: TStringField
      FieldName = 'documentoventa_trabajorealizado'
      Size = 255
    end
    object ZQdocumentoventadocuscaja_id: TIntegerField
      FieldName = 'caja_id'
    end
    object ZQdocumentoventadocustipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQdocumentoventadocustipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
    end
    object ZQdocumentoventadocustipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQdocumentoventadocustipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQdocumentoventadocustipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQdocumentoventadocustipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQdocumentoventadocustipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQdocumentoventadocustipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQdocumentoventadocustipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQdocumentoventadocustipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQdocumentoventadocustipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQdocumentoventadocustipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQdocumentoventadocuspuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQdocumentoventadocuspuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
  end
  object DTSDocumentoventadocus: TDataSource
    DataSet = ZQdocumentoventadocus
    Left = 504
    Top = 112
  end
  object ZQdocumentoventadocusABM: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadocus'
      
        'inner join documentosventas on documentoventadocus.documentovent' +
        'a_idpago=documentosventas.documentoventa_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventadocus.documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 576
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'documentoventadoc_id'
    end
    object FloatField1: TFloatField
      FieldName = 'documentoventadoc_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'documentoventa_pagado'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'documentoventa_saldo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object StringField1: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object IntegerField2: TIntegerField
      FieldName = 'documentoventa_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'documentoventa_idpago'
    end
    object IntegerField4: TIntegerField
      FieldName = 'documentoventa_id_1'
    end
    object IntegerField5: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object DateField1: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object TimeField1: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object FloatField4: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object FloatField5: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object FloatField6: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object FloatField7: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object FloatField8: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object FloatField9: TFloatField
      FieldName = 'documentoventa_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object StringField2: TStringField
      FieldName = 'documentoventa_estado_1'
      Size = 45
    end
    object FloatField10: TFloatField
      FieldName = 'documentoventa_pagado_1'
    end
    object FloatField11: TFloatField
      FieldName = 'documentoventa_saldo_1'
    end
    object StringField3: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object IntegerField6: TIntegerField
      FieldName = 'cliente_id'
    end
    object IntegerField7: TIntegerField
      FieldName = 'personal_id'
    end
    object IntegerField8: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object IntegerField9: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object DateField2: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object IntegerField10: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object IntegerField11: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object StringField4: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object StringField5: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object IntegerField12: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object IntegerField13: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object IntegerField14: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object IntegerField15: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object IntegerField16: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object IntegerField17: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object StringField6: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object IntegerField18: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object IntegerField19: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object StringField7: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object IntegerField20: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQdocumentoventadocusABMdocumentoventadoc_tiporelacion: TStringField
      FieldName = 'documentoventadoc_tiporelacion'
      Size = 45
    end
    object ZQdocumentoventadocusABMdocumentoventa_equipo1: TStringField
      FieldName = 'documentoventa_equipo1'
      Size = 45
    end
    object ZQdocumentoventadocusABMdocumentoventa_equipo2: TStringField
      FieldName = 'documentoventa_equipo2'
      Size = 45
    end
    object ZQdocumentoventadocusABMdocumentoventa_formapago: TStringField
      FieldName = 'documentoventa_formapago'
      Size = 255
    end
    object ZQdocumentoventadocusABMdocumentoventa_nrodetallepago: TStringField
      FieldName = 'documentoventa_nrodetallepago'
      Size = 45
    end
    object ZQdocumentoventadocusABMdocumentoventa_solicitudcliente: TStringField
      FieldName = 'documentoventa_solicitudcliente'
      Size = 255
    end
    object ZQdocumentoventadocusABMdocumentoventa_trabajorealizado: TStringField
      FieldName = 'documentoventa_trabajorealizado'
      Size = 255
    end
    object ZQdocumentoventadocusABMcaja_id: TIntegerField
      FieldName = 'caja_id'
    end
    object ZQdocumentoventadocusABMtipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQdocumentoventadocusABMtipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
    end
    object ZQdocumentoventadocusABMtipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQdocumentoventadocusABMtipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQdocumentoventadocusABMtipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQdocumentoventadocusABMtipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQdocumentoventadocusABMtipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQdocumentoventadocusABMtipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQdocumentoventadocusABMtipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQdocumentoventadocusABMtipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQdocumentoventadocusABMtipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQdocumentoventadocusABMtipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQdocumentoventadocusABMpuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQdocumentoventadocusABMpuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
  end
end
