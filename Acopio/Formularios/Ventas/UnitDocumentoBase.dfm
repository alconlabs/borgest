inherited DocumentoBase: TDocumentoBase
  Caption = 'DocumentoBase'
  ClientHeight = 328
  ClientWidth = 844
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 860
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 844
    Height = 328
    ExplicitWidth = 844
    ExplicitHeight = 328
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
      Top = 66
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
      Left = 54
      Top = 93
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label1: TLabel [4]
      Left = 44
      Top = 120
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel [5]
      Left = 92
      Top = 120
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel [6]
      Left = 37
      Top = 144
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel [7]
      Left = 92
      Top = 144
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label12: TLabel [8]
      Left = 222
      Top = 176
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Calidad'
    end
    object Label5: TLabel [9]
      Left = 7
      Top = 39
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Documento'
    end
    object Label6: TLabel [10]
      Left = 37
      Top = 176
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object Label7: TLabel [11]
      Left = 25
      Top = 213
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Transportista'
    end
    object Label9: TLabel [12]
      Left = 44
      Top = 240
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object Label10: TLabel [13]
      Left = 92
      Top = 240
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label13: TLabel [14]
      Left = 37
      Top = 264
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object Label14: TLabel [15]
      Left = 92
      Top = 264
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label16: TLabel [16]
      Left = 632
      Top = 63
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Vencimiento'
    end
    object Label17: TLabel [17]
      Left = 11
      Top = 291
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dcoumentacion'
    end
    object Label18: TLabel [18]
      Left = 431
      Top = 171
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btncancelar: TButton
      Left = 756
      TabOrder = 13
      ExplicitLeft = 756
    end
    inherited btnguardar: TButton
      Left = 675
      TabOrder = 12
      OnClick = btnguardarClick
      ExplicitLeft = 675
    end
    object documento_numero: TEdit
      Left = 152
      Top = 63
      Width = 121
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
      Top = 63
      Width = 54
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from puntodeventa')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
    object tipodocu_id: TSqlComboBox
      Left = 92
      Top = 36
      Width = 181
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
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
      Top = 90
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
    object documento_total: TMoneyEdit
      Left = 92
      Top = 173
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
      TabOrder = 7
      Version = '1.1.0.1'
    end
    object documento_calidad: TSqlComboBox
      Left = 263
      Top = 173
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
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
    object entidadtransportista_id: TSqlComboBox
      Left = 92
      Top = 210
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
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
    object documento_documentacion: TGTBComboBox
      Left = 92
      Top = 288
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 11
      Items.Strings = (
        'SI'
        'NO'
        'PARCIAL')
      Tag2 = 0
      valores.Strings = (
        'SI'
        'NO'
        'PARCIAL')
    end
    object documento_observaciones: TGTBMemo
      Left = 508
      Top = 171
      Width = 330
      Height = 98
      TabStop = False
      TabOrder = 10
      Tag2 = 0
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from documentos'
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
