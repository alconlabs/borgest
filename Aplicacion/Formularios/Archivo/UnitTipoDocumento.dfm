inherited tipodocumento: Ttipodocumento
  Caption = 'Tipo de Documento'
  ClientHeight = 386
  ClientWidth = 821
  ExplicitWidth = 837
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 821
    Height = 386
    ExplicitWidth = 821
    ExplicitHeight = 386
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 67
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label1: TLabel [1]
      Left = 63
      Top = 36
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label6: TLabel [2]
      Left = 50
      Top = 84
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pto. Venta'
    end
    object Label4: TLabel [3]
      Left = 79
      Top = 109
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    object Label5: TLabel [4]
      Left = 76
      Top = 132
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Letra'
    end
    object Label7: TLabel [5]
      Left = 72
      Top = 157
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Stock'
    end
    object Label8: TLabel [6]
      Left = 12
      Top = 180
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ultimo Nro. emitido'
    end
    object Label9: TLabel [7]
      Left = 25
      Top = 205
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo imputacion'
    end
    object Labeltipodocufiscal_id: TLabel [8]
      Left = 545
      Top = 36
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo doc. Fiscal'
    end
    object Label13: TLabel [9]
      Left = 41
      Top = 251
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Leyenda'
    end
    object Label14: TLabel [10]
      Left = 41
      Top = 267
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'en impresion'
    end
    object Label15: TLabel [11]
      Left = 29
      Top = 60
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre Abrev.'
    end
    object Label16: TLabel [12]
      Left = 26
      Top = 324
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe Maximo'
    end
    inherited btncancelar: TButton
      Left = 550
      Top = 319
      TabOrder = 20
      ExplicitLeft = 550
      ExplicitTop = 319
    end
    inherited btnguardar: TButton
      Left = 469
      Top = 319
      TabOrder = 19
      ExplicitLeft = 469
      ExplicitTop = 319
    end
    object tipodocu_id: TEdit
      Left = 106
      Top = 9
      Width = 103
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object tipodocu_nombre: TEdit
      Left = 258
      Top = 33
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object puntoventa_id: TSqlComboBox
      Left = 106
      Top = 81
      Width = 63
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from puntodeventa'
        'order by puntoventa_numero')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
    object tipodocu_tipo: TGTBComboBox
      Left = 106
      Top = 106
      Width = 103
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = 'Compra'
      Items.Strings = (
        'Compra'
        'Venta')
      Tag2 = 0
      valores.Strings = (
        'Compra'
        'Venta')
    end
    object tipodocu_letra: TEdit
      Left = 106
      Top = 129
      Width = 63
      Height = 21
      TabOrder = 6
    end
    object tipodocu_caja: TCheckBox
      Left = 70
      Top = 227
      Width = 48
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Caja'
      TabOrder = 10
    end
    object tipodocu_stock: TGTBComboBox
      Left = 106
      Top = 154
      Width = 103
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'Egreso'
      Items.Strings = (
        'Egreso'
        'Ingreso'
        'N/A')
      Tag2 = 0
      valores.Strings = (
        '1'
        '2'
        '0')
    end
    object tipodocu_iva: TCheckBox
      Left = 161
      Top = 227
      Width = 48
      Height = 15
      Alignment = taLeftJustify
      Caption = 'IVA'
      TabOrder = 11
    end
    object tipodocu_debcred: TGTBComboBox
      Left = 106
      Top = 202
      Width = 103
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = 'CREDITO'
      Items.Strings = (
        'CREDITO'
        'DEBITO'
        'N/A')
      Tag2 = 0
      valores.Strings = (
        'CREDITO'
        'DEBITO'
        'N/A')
    end
    object tipodocufiscal_id: TSqlComboBox
      Left = 626
      Top = 33
      Width = 167
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 17
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tipodocumentofiscal'
        'order by tipodocufiscal_id')
      Confcampo_codigo = 'tipodocufiscal_id'
      Confcampo_nomb = 'tipodocufiscal_nombre'
      Tag2 = 0
    end
    object tipodocu_ultimonumero: TMoneyEdit
      Left = 106
      Top = 177
      Width = 103
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
    object tipodocu_fiscal: TRadioButton
      Left = 425
      Top = 35
      Width = 102
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Controlador Fiscal'
      TabOrder = 14
      OnClick = tipodocu_fiscalClick
    end
    object tipodocu_preimpresos: TRadioButton
      Left = 446
      Top = 58
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pre-Impresos'
      TabOrder = 15
      OnClick = tipodocu_fiscalClick
    end
    object GroupBoxImpresion: TGroupBox
      Left = 545
      Top = 60
      Width = 248
      Height = 149
      Caption = 'Datos de Impresion'
      TabOrder = 18
      object Label17: TLabel
        Left = 62
        Top = 20
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Impresora'
      end
      object Label11: TLabel
        Left = 75
        Top = 44
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Copias'
      end
      object Label2: TLabel
        Left = 9
        Top = 116
        Width = 99
        Height = 13
        Alignment = taRightJustify
        Caption = 'Archivo de Impresion'
      end
      object Label10: TLabel
        Left = 48
        Top = 68
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Previsualizar'
      end
      object Label12: TLabel
        Left = 74
        Top = 92
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prompt'
      end
      object tipodocu_impresora: TEdit
        Left = 114
        Top = 17
        Width = 127
        Height = 21
        TabOrder = 0
      end
      object tipodocu_copias: TMoneyEdit
        Left = 114
        Top = 41
        Width = 103
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
      object tipodocu_preview: TCheckBox
        Left = 114
        Top = 68
        Width = 14
        Height = 15
        Alignment = taLeftJustify
        TabOrder = 2
      end
      object tipodocu_prompt: TCheckBox
        Left = 114
        Top = 92
        Width = 14
        Height = 15
        Alignment = taLeftJustify
        TabOrder = 3
      end
      object tipodocu_archivoimpresion: TEdit
        Left = 114
        Top = 113
        Width = 127
        Height = 21
        TabOrder = 4
      end
    end
    object tipodocu_leyenda: TMemo
      Left = 106
      Top = 248
      Width = 253
      Height = 65
      TabOrder = 12
    end
    object Combo_tipodocu_nombre: TGTBComboBox
      Left = 106
      Top = 33
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = Combo_tipodocu_nombreChange
      Items.Strings = (
        'Factura de Venta'
        'Remito de Venta'
        'Recibo de Venta'
        'Nota de Credito de Venta'
        'Nota de Debito de Venta'
        'Presupuesto'
        'Nota de Pedido'
        'Orden de Servicio'
        'Factura de Compra'
        'Nota de Credito de Compra'
        'Nota de Debito de Compra'
        'Orden de Pago'
        'Otro')
      Tag2 = 0
      valores.Strings = (
        'Factura de Venta'
        'Remito de Venta'
        'Recibo de Venta'
        'Nota de Credito de Venta'
        'Nota de Debito de Venta'
        'Presupuesto'
        'Nota de Pedido'
        'Orden de Servicio'
        'Factura de Compra'
        'Nota de Credito de Compra'
        'Nota de Debito de Compra'
        'Orden de Pago'
        'Otro')
    end
    object tipodocu_manual: TCheckBox
      Left = 336
      Top = 91
      Width = 191
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Ingresar Numeracion Manualmente'
      TabOrder = 16
    end
    object tipodocu_nombreabrev: TEdit
      Left = 106
      Top = 57
      Width = 63
      Height = 21
      TabOrder = 3
    end
    object tipodocu_importemax: TMoneyEdit
      Left = 106
      Top = 321
      Width = 103
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
      TabOrder = 13
      Version = '1.1.0.1'
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from tiposdocumento'
      'where tipodocu_id=:tipodocu_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tipodocu_id'
        ParamType = ptUnknown
      end>
    Left = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipodocu_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 344
    Top = 120
  end
end
