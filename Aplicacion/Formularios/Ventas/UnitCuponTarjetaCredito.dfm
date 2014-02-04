inherited CuponTarjetaCredito: TCuponTarjetaCredito
  Caption = 'Cupon de Tarjeta de Credito'
  ClientHeight = 232
  ClientWidth = 503
  ExplicitWidth = 519
  ExplicitHeight = 270
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 503
    Height = 232
    ExplicitWidth = 503
    ExplicitHeight = 232
    FullHeight = 0
    object Label9: TLabel [0]
      Left = 69
      Top = 31
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tarjeta'
    end
    object Label10: TLabel [1]
      Left = 7
      Top = 65
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe a Cobrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel [2]
      Left = 69
      Top = 89
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuotas'
    end
    object tarjeta_porcinteres: TLabel [3]
      Left = 116
      Top = 369
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = '% interes'
      Visible = False
    end
    object Label13: TLabel [4]
      Left = 77
      Top = 393
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Cobrado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label14: TLabel [5]
      Left = 311
      Top = 65
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cupon'
    end
    object Label15: TLabel [6]
      Left = 284
      Top = 89
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Autorizacion'
    end
    object Label16: TLabel [7]
      Left = 73
      Top = 121
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Titular'
    end
    object Label17: TLabel [8]
      Left = 83
      Top = 145
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'DNI'
    end
    object Label18: TLabel [9]
      Left = 60
      Top = 169
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object Label19: TLabel [10]
      Left = 77
      Top = 337
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe de Cuota'
      Visible = False
    end
    object Label2: TLabel [11]
      Left = 312
      Top = 7
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label1: TLabel [12]
      Left = 69
      Top = 7
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    inherited btncancelar: TButton
      Left = 412
      Top = 174
      TabOrder = 15
      ExplicitLeft = 412
      ExplicitTop = 174
    end
    inherited btnguardar: TButton
      Left = 331
      Top = 174
      TabOrder = 14
      ExplicitLeft = 331
      ExplicitTop = 174
    end
    object tarjeta_id: TSqlComboBox
      Left = 108
      Top = 28
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tarjetas'
        'order by tarjeta_nombre')
      Confcampo_codigo = 'tarjeta_id'
      Confcampo_nomb = 'tarjeta_nombre'
      Tag2 = 0
    end
    object cupontarjeta_importe: TMoneyEdit
      Left = 108
      Top = 62
      Width = 109
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
    object cupontarjeta_cuotas: TMoneyEdit
      Left = 108
      Top = 86
      Width = 109
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
    object cupontarjeta_recargo: TMoneyEdit
      Left = 164
      Top = 366
      Width = 109
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
      TabOrder = 6
      Visible = False
      Version = '1.1.0.1'
    end
    object tarjeta_cobrado: TMoneyEdit
      Left = 164
      Top = 390
      Width = 109
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
      TabOrder = 7
      Visible = False
      Version = '1.1.0.1'
    end
    object cupontarjeta_numero: TEdit
      Left = 348
      Top = 62
      Width = 117
      Height = 21
      TabOrder = 9
    end
    object cupontarjeta_autoriz: TEdit
      Left = 348
      Top = 86
      Width = 117
      Height = 21
      TabOrder = 10
    end
    object cupontarjeta_titular: TEdit
      Left = 108
      Top = 118
      Width = 381
      Height = 21
      TabOrder = 11
    end
    object cupontarjeta_dni: TEdit
      Left = 108
      Top = 142
      Width = 141
      Height = 21
      TabOrder = 12
    end
    object cupontarjeta_telefono: TEdit
      Left = 108
      Top = 166
      Width = 141
      Height = 21
      TabOrder = 13
    end
    object importecuota: TMoneyEdit
      Left = 164
      Top = 334
      Width = 109
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
      TabOrder = 8
      Visible = False
      Version = '1.1.0.1'
    end
    object btnabmtarjetas: TButton
      Left = 429
      Top = 28
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 3
      TabStop = False
    end
    object cupontarjeta_fecha: TDateTimePicker
      Left = 348
      Top = 4
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 1
    end
    object cupontarjeta_id: TEdit
      Left = 108
      Top = 4
      Width = 117
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from cuponestarjetas'
      'where cupontarjeta_id=:cupontarjeta_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cupontarjeta_id'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cupontarjeta_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 240
    Top = 56
  end
end
