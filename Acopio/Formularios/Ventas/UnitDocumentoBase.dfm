inherited DocumentoBase: TDocumentoBase
  Caption = 'DocumentoBase'
  ClientHeight = 431
  ClientWidth = 863
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 879
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 863
    Height = 431
    ExplicitWidth = 863
    ExplicitHeight = 431
    FullHeight = 0
    object Label2: TLabel [0]
      Left = 693
      Top = 39
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label15: TLabel [1]
      Left = 49
      Top = 37
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Labelsucursal: TLabel [2]
      Left = 45
      Top = 13
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label3: TLabel [3]
      Left = 50
      Top = 61
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Entidad'
    end
    object Label1: TLabel [4]
      Left = 44
      Top = 88
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel [5]
      Left = 92
      Top = 88
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel [6]
      Left = 37
      Top = 112
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel [7]
      Left = 92
      Top = 112
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label5: TLabel [8]
      Left = 583
      Top = 0
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Documento'
      Visible = False
    end
    object Label16: TLabel [9]
      Left = 632
      Top = 63
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Vencimiento'
    end
    object Label18: TLabel [10]
      Left = 15
      Top = 179
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btncancelar: TButton
      Left = 776
      Top = 394
      TabOrder = 9
      ExplicitLeft = 776
      ExplicitTop = 394
    end
    inherited btnguardar: TButton
      Left = 695
      Top = 394
      TabOrder = 8
      OnClick = btnguardarClick
      ExplicitLeft = 695
      ExplicitTop = 394
    end
    object documento_numero: TEdit
      Left = 204
      Top = 34
      Width = 205
      Height = 21
      TabOrder = 3
    end
    object documento_fecha: TDateTimePicker
      Left = 729
      Top = 36
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 5
    end
    object puntoventa_id: TSqlComboBox
      Left = 92
      Top = 34
      Width = 54
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnSelect = puntoventa_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from puntodeventa')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
    object tipodocu_id: TSqlComboBox
      Left = 148
      Top = 34
      Width = 54
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnSelect = tipodocu_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tiposdocumento'
        'where tipodocu_nombre="Factura de Venta"')
      Confcampo_codigo = 'tipodocu_id'
      Confcampo_nomb = 'tipodocu_letra'
      Tag2 = 0
    end
    object sucursal_id: TSqlComboBox
      Left = 92
      Top = 10
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = sucursal_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object entidad_id: TSqlComboBox
      Left = 92
      Top = 58
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from entidades'
        'order by entidad_razonsocial')
      Confcampo_codigo = 'entidad_id'
      Confcampo_nomb = 'entidad_razonsocial'
      Tag2 = 0
    end
    object documento_fechavenc: TDateTimePicker
      Left = 729
      Top = 60
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 6
    end
    object documento_observaciones: TGTBMemo
      Left = 92
      Top = 179
      Width = 330
      Height = 98
      TabStop = False
      TabOrder = 7
      Tag2 = 0
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 283
      Width = 836
      Height = 105
      Caption = 'Totales'
      ParentBackground = False
      TabOrder = 10
      object Label4: TLabel
        Left = 8
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 21%'
      end
      object Label6: TLabel
        Left = 14
        Top = 41
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 21%'
      end
      object Label7: TLabel
        Left = 143
        Top = 17
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
      end
      object Label9: TLabel
        Left = 149
        Top = 41
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
      end
      object Label10: TLabel
        Left = 639
        Top = 65
        Width = 47
        Height = 24
        Alignment = taRightJustify
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 29
        Top = 65
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Otros'
      end
      object Label8: TLabel
        Left = 288
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 27%'
      end
      object Label17: TLabel
        Left = 294
        Top = 41
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 27%'
      end
      object Label12: TLabel
        Left = 420
        Top = 17
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'No Gravado'
      end
      object Label20: TLabel
        Left = 574
        Top = 17
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA Ret.'
      end
      object Label21: TLabel
        Left = 569
        Top = 41
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA Perc.'
      end
      object Label22: TLabel
        Left = 703
        Top = 17
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'DGR Ret.'
      end
      object Label23: TLabel
        Left = 698
        Top = 41
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'DGR Perc.'
      end
      object documento_neto21: TMoneyEdit
        Left = 60
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 0
        Version = '1.1.0.1'
      end
      object documento_iva21: TMoneyEdit
        Tag = 1
        Left = 60
        Top = 38
        Width = 70
        Height = 21
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
        TabOrder = 1
        Version = '1.1.0.1'
      end
      object documento_neto105: TMoneyEdit
        Tag = 2
        Left = 204
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 2
        Version = '1.1.0.1'
      end
      object documento_iva105: TMoneyEdit
        Tag = 3
        Left = 204
        Top = 38
        Width = 70
        Height = 21
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
        TabOrder = 3
        Version = '1.1.0.1'
      end
      object documento_total: TMoneyEdit
        Tag = 13
        Left = 692
        Top = 62
        Width = 134
        Height = 32
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        Version = '1.1.0.1'
      end
      object documento_otrosimpuestos: TMoneyEdit
        Tag = 12
        Left = 60
        Top = 62
        Width = 70
        Height = 21
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
        TabOrder = 11
        Version = '1.1.0.1'
      end
      object documento_neto27: TMoneyEdit
        Tag = 4
        Left = 340
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 4
        Version = '1.1.0.1'
      end
      object documento_iva27: TMoneyEdit
        Tag = 5
        Left = 340
        Top = 38
        Width = 70
        Height = 21
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
        TabOrder = 5
        Version = '1.1.0.1'
      end
      object documento_nogravado: TMoneyEdit
        Tag = 6
        Left = 484
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 6
        Version = '1.1.0.1'
      end
      object documento_ivaret: TMoneyEdit
        Tag = 8
        Left = 620
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 7
        Version = '1.1.0.1'
      end
      object documento_ivaperc: TMoneyEdit
        Tag = 9
        Left = 620
        Top = 38
        Width = 70
        Height = 21
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
        TabOrder = 8
        Version = '1.1.0.1'
      end
      object documento_dgrret: TMoneyEdit
        Tag = 10
        Left = 756
        Top = 14
        Width = 70
        Height = 21
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
        TabOrder = 9
        Version = '1.1.0.1'
      end
      object documento_dgrperc: TMoneyEdit
        Left = 756
        Top = 38
        Width = 70
        Height = 21
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
        TabOrder = 10
        Version = '1.1.0.1'
      end
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentos'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documento_id=:documento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentos'
      'where documento_id=:documento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    object ZQDocumentosdocumento_id: TIntegerField
      FieldName = 'documento_id'
    end
    object ZQDocumentosdocumento_fecha: TDateField
      FieldName = 'documento_fecha'
    end
    object ZQDocumentosdocumento_fechavenc: TDateField
      FieldName = 'documento_fechavenc'
    end
    object ZQDocumentosdocumento_hora: TTimeField
      FieldName = 'documento_hora'
    end
    object ZQDocumentosdocumento_numero: TIntegerField
      FieldName = 'documento_numero'
    end
    object ZQDocumentosdocumento_total: TFloatField
      FieldName = 'documento_total'
    end
    object ZQDocumentosdocumento_saldo: TFloatField
      FieldName = 'documento_saldo'
    end
    object ZQDocumentosdocumento_pagado: TFloatField
      FieldName = 'documento_pagado'
    end
    object ZQDocumentosdocumento_estado: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object ZQDocumentosdocumento_neto21: TFloatField
      FieldName = 'documento_neto21'
    end
    object ZQDocumentosdocumento_iva21: TFloatField
      FieldName = 'documento_iva21'
    end
    object ZQDocumentosdocumento_neto105: TFloatField
      FieldName = 'documento_neto105'
    end
    object ZQDocumentosdocumento_iva105: TFloatField
      FieldName = 'documento_iva105'
    end
    object ZQDocumentosdocumento_neto27: TFloatField
      FieldName = 'documento_neto27'
    end
    object ZQDocumentosdocumento_iva27: TFloatField
      FieldName = 'documento_iva27'
    end
    object ZQDocumentosdocumento_observaciones: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object ZQDocumentosdocumento_ivaret: TFloatField
      FieldName = 'documento_ivaret'
    end
    object ZQDocumentosdocumento_ivaperc: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object ZQDocumentosdocumento_dgrret: TFloatField
      FieldName = 'documento_dgrret'
    end
    object ZQDocumentosdocumento_dgrperc: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object ZQDocumentosdocumento_otrosimpuestos: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object ZQDocumentosdocumento_calidad: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object ZQDocumentosdocumento_documentacion: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object ZQDocumentostipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQDocumentosentidad_id: TIntegerField
      FieldName = 'entidad_id'
    end
    object ZQDocumentosentidadtransportista_id: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object ZQDocumentosespecie_id: TIntegerField
      FieldName = 'especie_id'
    end
    object ZQDocumentosdocumento_fechacumplimiento: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object ZQDocumentosdocumento_moneda: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object ZQDocumentosdocumento_preciounitario: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object ZQDocumentosdocumento_lugarentrega: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object ZQDocumentosdocumento_tipooperacion: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object ZQDocumentosdocumento_condicioncalidad: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object ZQDocumentosdocumento_tipodestino: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object ZQDocumentosdocumento_numerocartaporte: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object ZQDocumentosdocumento_kgbrutos: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object ZQDocumentosdocumento_tara: TFloatField
      FieldName = 'documento_tara'
    end
    object ZQDocumentosentidaddadorcarga_id: TIntegerField
      FieldName = 'entidaddadorcarga_id'
    end
    object ZQDocumentosdocumento_chofer: TStringField
      FieldName = 'documento_chofer'
      Size = 100
    end
    object ZQDocumentosdocumento_chofercuit: TStringField
      FieldName = 'documento_chofercuit'
      Size = 45
    end
    object ZQDocumentosdocumento_transpchasis: TStringField
      FieldName = 'documento_transpchasis'
      Size = 45
    end
    object ZQDocumentosdocumento_transpacoplado: TStringField
      FieldName = 'documento_transpacoplado'
      Size = 45
    end
    object ZQDocumentosdocumento_transptarifaflete: TFloatField
      FieldName = 'documento_transptarifaflete'
    end
    object ZQDocumentosdocumento_transpanticipo: TFloatField
      FieldName = 'documento_transpanticipo'
    end
    object ZQDocumentosdocumento_cartaportetarifaflete: TFloatField
      FieldName = 'documento_cartaportetarifaflete'
    end
    object ZQDocumentosdocumento_nogravado: TFloatField
      FieldName = 'documento_nogravado'
    end
  end
  object ZQDocumentosdocuImputacion: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosdocu'
      
        'inner join documentos on documentosdocu.documento_idpago=documen' +
        'tos.documento_id'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentosdocu.documento_id=:documento_id and'
      'documentodocu_tiporelacion="IMPUTACION"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentosdocuRelacion: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosdocu'
      
        'inner join documentos on documentosdocu.documento_idpago=documen' +
        'tos.documento_id'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentosdocu.documento_id=:documento_id and'
      'documentodocu_tiporelacion="RELACION"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 640
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentopagos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentopagos'
      
        'inner join tipospago on documentopagos.tipopago_id=tipospago.tip' +
        'opago_id'
      'where documento_id=:documento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
  end
end
