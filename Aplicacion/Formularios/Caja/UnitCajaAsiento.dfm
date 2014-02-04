inherited CajaAsiento: TCajaAsiento
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Asiento de Caja'
  ClientHeight = 182
  ClientWidth = 554
  ExplicitWidth = 570
  ExplicitHeight = 220
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 554
    Height = 182
    ExplicitWidth = 554
    ExplicitHeight = 182
    FullHeight = 0
    object Label2: TLabel [0]
      Left = 29
      Top = 33
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label15: TLabel [1]
      Left = 22
      Top = 10
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label10: TLabel [2]
      Left = 24
      Top = 105
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    object Label1: TLabel [3]
      Left = 3
      Top = 57
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descripcion'
    end
    object Label21: TLabel [4]
      Left = 13
      Top = 81
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Concepto'
    end
    object Label3: TLabel [5]
      Left = 414
      Top = 10
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    inherited btncancelar: TButton
      Top = 150
      TabOrder = 7
      ExplicitTop = 150
    end
    inherited btnguardar: TButton
      Top = 150
      TabOrder = 6
      ExplicitTop = 150
    end
    object cajaasiento_fecha: TDateTimePicker
      Left = 65
      Top = 30
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 2
    end
    object cajaasiento_id: TEdit
      Left = 65
      Top = 7
      Width = 106
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object cajaasiento_importe: TMoneyEdit
      Left = 65
      Top = 102
      Width = 106
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
    object cajaasiento_descripcion: TEdit
      Left = 65
      Top = 54
      Width = 470
      Height = 21
      TabOrder = 3
    end
    object concepto_id: TSqlComboBox
      Left = 65
      Top = 78
      Width = 240
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from conceptos'
        'order by concepto_descripcion')
      ConfTabla = 'conceptos'
      Confcampo_codigo = 'concepto_id'
      Confcampo_nomb = 'concepto_descripcion'
      Tag2 = 0
      ConfNuevo = True
    end
    object cajaasiento_tipo: TComboBox
      Left = 448
      Top = 7
      Width = 87
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'INGRESO'
      Items.Strings = (
        'INGRESO'
        'EGRESO')
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from cajaasientos'
      'where cajaasiento_id=:cajaasiento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_id'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 456
    Top = 24
  end
end
