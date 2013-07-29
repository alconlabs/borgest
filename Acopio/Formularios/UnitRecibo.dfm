inherited Recibo: TRecibo
  Caption = 'Recibo'
  ClientHeight = 603
  ClientWidth = 864
  ExplicitWidth = 880
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 864
    Height = 603
    ExplicitWidth = 864
    ExplicitHeight = 556
    FullHeight = 0
    inherited Label2: TLabel
      Left = 689
      ExplicitLeft = 689
    end
    inherited Label16: TLabel
      Left = 628
      ExplicitLeft = 628
    end
    inherited Label18: TLabel
      Left = 31
      Top = 363
      ExplicitLeft = 31
      ExplicitTop = 363
    end
    object Label13: TLabel [11]
      Left = 683
      Top = 337
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Imputado'
    end
    inherited btncancelar: TButton
      Top = 566
      ExplicitTop = 566
    end
    inherited btnguardar: TButton
      Top = 566
      ExplicitTop = 566
    end
    inherited documento_fecha: TDateTimePicker
      Left = 725
      ExplicitLeft = 725
    end
    inherited documento_fechavenc: TDateTimePicker
      Left = 725
      ExplicitLeft = 725
    end
    inherited documento_observaciones: TGTBMemo
      Left = 108
      Top = 363
      Height = 126
      ExplicitLeft = 108
      ExplicitTop = 363
      ExplicitHeight = 126
    end
    inherited GroupBox1: TGroupBox
      Left = 478
      Top = 523
      Width = 211
      Height = 68
      ExplicitLeft = 478
      ExplicitTop = 523
      ExplicitWidth = 211
      ExplicitHeight = 68
      inherited Label4: TLabel
        Visible = False
      end
      inherited Label6: TLabel
        Visible = False
      end
      inherited Label7: TLabel
        Visible = False
      end
      inherited Label9: TLabel
        Visible = False
      end
      inherited Label10: TLabel
        Left = 15
        Top = 25
        ExplicitLeft = 15
        ExplicitTop = 25
      end
      inherited Label14: TLabel
        Visible = False
      end
      inherited Label8: TLabel
        Visible = False
      end
      inherited Label17: TLabel
        Visible = False
      end
      inherited Label12: TLabel
        Visible = False
      end
      inherited Label20: TLabel
        Visible = False
      end
      inherited Label21: TLabel
        Visible = False
      end
      inherited Label22: TLabel
        Visible = False
      end
      inherited Label23: TLabel
        Visible = False
      end
      inherited documento_neto21: TMoneyEdit
        Visible = False
      end
      inherited documento_iva21: TMoneyEdit
        Visible = False
      end
      inherited documento_neto105: TMoneyEdit
        Visible = False
      end
      inherited documento_iva105: TMoneyEdit
        Visible = False
      end
      inherited documento_total: TMoneyEdit
        Left = 68
        Top = 22
        ExplicitLeft = 68
        ExplicitTop = 22
      end
      inherited documento_otrosimpuestos: TMoneyEdit
        Visible = False
      end
      inherited documento_neto27: TMoneyEdit
        Visible = False
      end
      inherited documento_iva27: TMoneyEdit
        Visible = False
      end
      inherited documento_nogravado: TMoneyEdit
        Visible = False
      end
      inherited documento_ivaret: TMoneyEdit
        Visible = False
      end
      inherited documento_ivaperc: TMoneyEdit
        Visible = False
      end
      inherited documento_dgrret: TMoneyEdit
        Visible = False
      end
      inherited documento_dgrperc: TMoneyEdit
        Visible = False
      end
    end
    object DBGrid1: TDBGrid
      Left = 444
      Top = 363
      Width = 403
      Height = 126
      DataSource = DTSDocumentopagos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'documentopago_nombre'
          Title.Caption = 'Descripcion'
          Width = 285
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_importe'
          Title.Caption = 'Importe'
          Width = 85
          Visible = True
        end>
    end
    object btnmodificarpago: TButton
      Left = 520
      Top = 494
      Width = 75
      Height = 25
      Caption = 'Modificar'
      TabOrder = 12
    end
    object btnagregarpago: TButton
      Left = 445
      Top = 494
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 13
      OnClick = btnagregarpagoClick
    end
    object btneliminarpago: TButton
      Left = 595
      Top = 494
      Width = 75
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 14
      OnClick = btneliminarpagoClick
    end
    object DBGrid2: TDBGrid
      Left = 16
      Top = 176
      Width = 838
      Height = 150
      DataSource = DTSDocumentodocusImputacion
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 15
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documento_fecha'
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
          FieldName = 'documento_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documento_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documento_pagado'
          Title.Caption = 'Pagado'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documento_saldo'
          Title.Caption = 'Saldo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentodocu_importe'
          Title.Caption = 'Cobrado'
          Width = 120
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 16
      Top = 327
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 16
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 89
      Top = 327
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 17
      OnClick = btnquitarClick
    end
    object btntomardocumentosAuto: TButton
      Left = 170
      Top = 327
      Width = 129
      Height = 25
      Caption = 'Cargar'
      TabOrder = 18
      OnClick = btntomardocumentosAutoClick
    end
    object documento_totalimputado: TMoneyEdit
      Left = 760
      Top = 334
      Width = 95
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
      TabOrder = 19
      Version = '1.1.0.1'
    end
  end
  inherited ZQSelect: TZQuery
    Left = 336
    Top = 32
  end
  inherited ZQDocumentos: TZQuery
    Left = 168
    Top = 448
  end
  inherited ZQDocumentosdocuImputacion: TZQuery
    Left = 208
    Top = 504
    object ZQDocumentosdocuImputaciondocumentodocu_id: TIntegerField
      FieldName = 'documentodocu_id'
    end
    object ZQDocumentosdocuImputaciondocumentodocu_importe: TFloatField
      FieldName = 'documentodocu_importe'
    end
    object ZQDocumentosdocuImputaciondocumentodocu_estado: TStringField
      FieldName = 'documentodocu_estado'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumentodocu_pagado: TFloatField
      FieldName = 'documentodocu_pagado'
    end
    object ZQDocumentosdocuImputaciondocumentodocu_saldo: TFloatField
      FieldName = 'documentodocu_saldo'
    end
    object ZQDocumentosdocuImputaciondocumento_id: TIntegerField
      FieldName = 'documento_id'
    end
    object ZQDocumentosdocuImputaciondocumento_idpago: TIntegerField
      FieldName = 'documento_idpago'
    end
    object ZQDocumentosdocuImputaciondocumentodocu_tiporelacion: TStringField
      FieldName = 'documentodocu_tiporelacion'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_id_1: TIntegerField
      FieldName = 'documento_id_1'
    end
    object ZQDocumentosdocuImputaciondocumento_fecha: TDateField
      FieldName = 'documento_fecha'
    end
    object ZQDocumentosdocuImputaciondocumento_fechavenc: TDateField
      FieldName = 'documento_fechavenc'
    end
    object ZQDocumentosdocuImputaciondocumento_hora: TTimeField
      FieldName = 'documento_hora'
    end
    object ZQDocumentosdocuImputaciondocumento_numero: TIntegerField
      FieldName = 'documento_numero'
    end
    object ZQDocumentosdocuImputaciondocumento_total: TFloatField
      FieldName = 'documento_total'
    end
    object ZQDocumentosdocuImputaciondocumento_saldo: TFloatField
      FieldName = 'documento_saldo'
    end
    object ZQDocumentosdocuImputaciondocumento_pagado: TFloatField
      FieldName = 'documento_pagado'
    end
    object ZQDocumentosdocuImputaciondocumento_estado: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object ZQDocumentosdocuImputaciondocumento_neto21: TFloatField
      FieldName = 'documento_neto21'
    end
    object ZQDocumentosdocuImputaciondocumento_iva21: TFloatField
      FieldName = 'documento_iva21'
    end
    object ZQDocumentosdocuImputaciondocumento_neto105: TFloatField
      FieldName = 'documento_neto105'
    end
    object ZQDocumentosdocuImputaciondocumento_iva105: TFloatField
      FieldName = 'documento_iva105'
    end
    object ZQDocumentosdocuImputaciondocumento_neto27: TFloatField
      FieldName = 'documento_neto27'
    end
    object ZQDocumentosdocuImputaciondocumento_iva27: TFloatField
      FieldName = 'documento_iva27'
    end
    object ZQDocumentosdocuImputaciondocumento_observaciones: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object ZQDocumentosdocuImputaciondocumento_ivaret: TFloatField
      FieldName = 'documento_ivaret'
    end
    object ZQDocumentosdocuImputaciondocumento_ivaperc: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object ZQDocumentosdocuImputaciondocumento_dgrret: TFloatField
      FieldName = 'documento_dgrret'
    end
    object ZQDocumentosdocuImputaciondocumento_dgrperc: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object ZQDocumentosdocuImputaciondocumento_otrosimpuestos: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object ZQDocumentosdocuImputaciondocumento_calidad: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_documentacion: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object ZQDocumentosdocuImputaciontipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQDocumentosdocuImputacionentidad_id: TIntegerField
      FieldName = 'entidad_id'
    end
    object ZQDocumentosdocuImputacionentidadtransportista_id: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object ZQDocumentosdocuImputacionespecie_id: TIntegerField
      FieldName = 'especie_id'
    end
    object ZQDocumentosdocuImputaciondocumento_fechacumplimiento: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object ZQDocumentosdocuImputaciondocumento_moneda: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_preciounitario: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object ZQDocumentosdocuImputaciondocumento_lugarentrega: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object ZQDocumentosdocuImputaciondocumento_tipooperacion: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_condicioncalidad: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_tipodestino: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_numerocartaporte: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object ZQDocumentosdocuImputaciondocumento_kgbrutos: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object ZQDocumentosdocuImputaciondocumento_tara: TFloatField
      FieldName = 'documento_tara'
    end
    object ZQDocumentosdocuImputacionentidaddadorcarga_id: TIntegerField
      FieldName = 'entidaddadorcarga_id'
    end
    object ZQDocumentosdocuImputaciondocumento_chofer: TStringField
      FieldName = 'documento_chofer'
      Size = 100
    end
    object ZQDocumentosdocuImputaciondocumento_chofercuit: TStringField
      FieldName = 'documento_chofercuit'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_transpchasis: TStringField
      FieldName = 'documento_transpchasis'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_transpacoplado: TStringField
      FieldName = 'documento_transpacoplado'
      Size = 45
    end
    object ZQDocumentosdocuImputaciondocumento_transptarifaflete: TFloatField
      FieldName = 'documento_transptarifaflete'
    end
    object ZQDocumentosdocuImputaciondocumento_transpanticipo: TFloatField
      FieldName = 'documento_transpanticipo'
    end
    object ZQDocumentosdocuImputaciondocumento_cartaportetarifaflete: TFloatField
      FieldName = 'documento_cartaportetarifaflete'
    end
    object ZQDocumentosdocuImputaciondocumento_nogravado: TFloatField
      FieldName = 'documento_nogravado'
    end
    object ZQDocumentosdocuImputaciontipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object ZQDocumentosdocuImputaciontipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQDocumentosdocuImputaciontipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQDocumentosdocuImputaciontipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQDocumentosdocuImputaciontipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQDocumentosdocuImputaciontipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQDocumentosdocuImputaciontipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQDocumentosdocuImputaciontipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQDocumentosdocuImputaciontipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQDocumentosdocuImputaciontipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQDocumentosdocuImputaciontipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQDocumentosdocuImputaciontipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQDocumentosdocuImputaciontipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQDocumentosdocuImputaciontipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQDocumentosdocuImputaciontipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQDocumentosdocuImputaciontipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQDocumentosdocuImputaciontipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQDocumentosdocuImputaciontipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQDocumentosdocuImputaciontipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQDocumentosdocuImputaciontipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQDocumentosdocuImputacionpuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object ZQDocumentosdocuImputaciontipodocu_tipoctacte: TStringField
      FieldName = 'tipodocu_tipoctacte'
      Size = 45
    end
    object ZQDocumentosdocuImputacionpuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object ZQDocumentosdocuImputacionpuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQDocumentosdocuImputacionpuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQDocumentosdocuImputacionpuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQDocumentosdocuImputacionpuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQDocumentosdocuImputacionsucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
  end
  inherited ZQDocumentosdocuRelacion: TZQuery
    Left = 384
    Top = 504
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 48
    Top = 456
    object ZQDocumentopagosdocumentopago_id: TIntegerField
      FieldName = 'documentopago_id'
    end
    object ZQDocumentopagosdocumentopago_importe: TFloatField
      FieldName = 'documentopago_importe'
    end
    object ZQDocumentopagosdocumentopago_nombre: TStringField
      FieldName = 'documentopago_nombre'
      Size = 150
    end
    object ZQDocumentopagostipopago_id: TIntegerField
      FieldName = 'tipopago_id'
    end
    object ZQDocumentopagosdocumento_id: TIntegerField
      FieldName = 'documento_id'
    end
    object ZQDocumentopagostipopago_id_1: TIntegerField
      FieldName = 'tipopago_id_1'
    end
    object ZQDocumentopagostipopago_nombre: TStringField
      FieldName = 'tipopago_nombre'
      Size = 45
    end
    object ZQDocumentopagostipopago_caja: TIntegerField
      FieldName = 'tipopago_caja'
    end
  end
  object DTSDocumentopagos: TDataSource
    DataSet = ZQDocumentopagos
    Left = 296
    Top = 448
  end
  object DTSDocumentodocusImputacion: TDataSource
    DataSet = ZQDocumentosdocuImputacion
    Left = 416
    Top = 168
  end
end
