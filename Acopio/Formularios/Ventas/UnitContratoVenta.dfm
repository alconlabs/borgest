inherited contratoventa: Tcontratoventa
  Caption = 'Contrato de Venta'
  ClientHeight = 510
  ClientWidth = 753
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 769
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 753
    Height = 510
    ExplicitWidth = 753
    ExplicitHeight = 430
    FullHeight = 0
    object Label2: TLabel [0]
      Left = 597
      Top = 39
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label15: TLabel [1]
      Left = 81
      Top = 90
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Labelsucursal: TLabel [2]
      Left = 77
      Top = 13
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label3: TLabel [3]
      Left = 82
      Top = 117
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Entidad'
    end
    object Label1: TLabel [4]
      Left = 76
      Top = 144
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel [5]
      Left = 124
      Top = 144
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel [6]
      Left = 69
      Top = 168
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel [7]
      Left = 124
      Top = 168
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label12: TLabel [8]
      Left = 259
      Top = 208
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Calidad'
    end
    object Label5: TLabel [9]
      Left = 39
      Top = 63
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Documento'
    end
    object Label6: TLabel [10]
      Left = 89
      Top = 208
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kilos'
    end
    object Label16: TLabel [11]
      Left = 536
      Top = 63
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Vencimiento'
    end
    object Label18: TLabel [12]
      Left = 47
      Top = 403
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label4: TLabel [13]
      Left = 33
      Top = 269
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Especie/Variedad'
    end
    object Label7: TLabel [14]
      Left = 542
      Top = 87
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha de Entrega'
    end
    object Label8: TLabel [15]
      Left = 473
      Top = 208
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio'
    end
    object Label9: TLabel [16]
      Left = 464
      Top = 232
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda'
    end
    object Label10: TLabel [17]
      Left = 36
      Top = 381
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lugar de Entrega'
    end
    object Label13: TLabel [18]
      Left = 457
      Top = 120
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de Operacion'
    end
    object Label14: TLabel [19]
      Left = 12
      Top = 232
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condicion de calidad'
    end
    object Label17: TLabel [20]
      Left = 44
      Top = 39
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Punto de Venta'
    end
    object Label19: TLabel [21]
      Left = 83
      Top = 298
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Calidad'
      Enabled = False
    end
    object Label20: TLabel [22]
      Left = 58
      Top = 322
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Procedencia'
      Enabled = False
    end
    inherited btncancelar: TButton
      Left = 676
      Top = 478
      TabOrder = 18
      ExplicitLeft = 676
      ExplicitTop = 478
    end
    inherited btnguardar: TButton
      Left = 595
      Top = 478
      TabOrder = 17
      OnClick = btnguardarClick
      ExplicitLeft = 595
      ExplicitTop = 478
    end
    object documento_numero: TEdit
      Left = 124
      Top = 87
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object documento_fecha: TDateTimePicker
      Left = 633
      Top = 36
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 5
    end
    object puntoventa_id: TSqlComboBox
      Left = 124
      Top = 36
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
      Left = 124
      Top = 60
      Width = 181
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
      Confcampo_nomb = 'tipodocu_nombre'
      Tag2 = 0
    end
    object sucursal_id: TSqlComboBox
      Left = 124
      Top = 10
      Width = 316
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
      Left = 124
      Top = 114
      Width = 316
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
    object documento_total: TMoneyEdit
      Left = 124
      Top = 205
      Width = 122
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
    object documento_calidad: TSqlComboBox
      Left = 300
      Top = 205
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 10
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from calidades'
        'order by calidad_nombre')
      ConfTabla = 'calidades'
      Confcampo_codigo = 'calidad_id'
      Confcampo_nomb = 'calidad_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object documento_fechavenc: TDateTimePicker
      Left = 633
      Top = 60
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 6
    end
    object documento_observaciones: TGTBMemo
      Left = 124
      Top = 405
      Width = 316
      Height = 98
      TabOrder = 16
      Tag2 = 0
    end
    object especie_id: TSqlComboBox
      Left = 124
      Top = 266
      Width = 316
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 14
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from especies'
        'order by especie_nombre')
      Confcampo_codigo = 'especie_id'
      Confcampo_nomb = 'especie_nombre'
      Tag2 = 0
    end
    object documento_fechacumplimiento: TDateTimePicker
      Left = 633
      Top = 84
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 7
    end
    object documento_preciounitario: TMoneyEdit
      Left = 516
      Top = 205
      Width = 122
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
    object documento_moneda: TGTBComboBox
      Left = 516
      Top = 229
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 13
      Items.Strings = (
        'Pesos'
        'Dolares'
        'Otro')
      Tag2 = 0
      valores.Strings = (
        'Pesos'
        'Dolares'
        'Otro')
    end
    object documento_lugarentrega: TGTBEdit
      Left = 124
      Top = 378
      Width = 316
      Height = 21
      TabOrder = 15
      Text = 'documento_lugarentrega'
      Tag2 = 0
    end
    object documento_tipooperacion: TGTBComboBox
      Left = 558
      Top = 117
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        'Primaria'
        'Secundaria')
      Tag2 = 0
      valores.Strings = (
        'Primaria'
        'Secundaria')
    end
    object documento_condicioncalidad: TGTBComboBox
      Left = 124
      Top = 229
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 12
      Items.Strings = (
        'Condicional'
        'Conforme')
      Tag2 = 0
      valores.Strings = (
        'Condicional'
        'Conforme')
    end
    object Edit1: TEdit
      Left = 124
      Top = 295
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 19
    end
    object Edit2: TEdit
      Left = 124
      Top = 319
      Width = 316
      Height = 21
      Enabled = False
      TabOrder = 20
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
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
end
