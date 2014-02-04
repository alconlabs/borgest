inherited EstadoIVAs: TEstadoIVAs
  Caption = 'Estado IVA'
  ClientHeight = 398
  ClientWidth = 442
  ExplicitWidth = 458
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 442
    Height = 398
    ExplicitWidth = 442
    ExplicitHeight = 398
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 76
      Top = 16
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label2: TLabel [1]
      Left = 79
      Top = 40
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    inherited btncancelar: TButton
      Left = 358
      Top = 342
      Caption = 'Salir'
      ExplicitLeft = 358
      ExplicitTop = 342
    end
    inherited btnguardar: TButton
      Left = 235
      Top = 35
      Caption = 'Actualizar'
      ExplicitLeft = 235
      ExplicitTop = 35
    end
    object desde_fecha: TDateTimePicker
      Left = 116
      Top = 13
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 2
    end
    object hasta_fecha: TDateTimePicker
      Left = 116
      Top = 37
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 167
      Width = 421
      Height = 74
      Caption = 'IVA Compras'
      ParentBackground = False
      TabOrder = 4
      object Label5: TLabel
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
      object Label16: TLabel
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
      object documentocompra_neto21: TMoneyEdit
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
      object documentocompra_iva21: TMoneyEdit
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
      object documentocompra_neto105: TMoneyEdit
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
      object documentocompra_iva105: TMoneyEdit
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
      object documentocompra_neto27: TMoneyEdit
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
      object documentocompra_iva27: TMoneyEdit
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
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 87
      Width = 421
      Height = 74
      Caption = 'IVA Ventas'
      ParentBackground = False
      TabOrder = 5
      object Label3: TLabel
        Left = 8
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 21%'
      end
      object Label4: TLabel
        Left = 14
        Top = 41
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 21%'
      end
      object Label8: TLabel
        Left = 143
        Top = 17
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
      end
      object Label10: TLabel
        Left = 149
        Top = 41
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
      end
      object documentoventa_neto21: TMoneyEdit
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
      object documentoventa_iva21: TMoneyEdit
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
      object documentoventa_neto105: TMoneyEdit
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
      object documentoventa_iva105: TMoneyEdit
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
    end
    object GroupBox3: TGroupBox
      Left = 12
      Top = 247
      Width = 421
      Height = 74
      Caption = 'Diferencias'
      ParentBackground = False
      TabOrder = 6
      object Label11: TLabel
        Left = 8
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 21%'
      end
      object Label12: TLabel
        Left = 14
        Top = 41
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 21%'
      end
      object Label13: TLabel
        Left = 143
        Top = 17
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Neto 10.5%'
      end
      object Label14: TLabel
        Left = 149
        Top = 41
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'IVA 10.5%'
      end
      object diferencia_neto21: TMoneyEdit
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
      object diferencia_iva21: TMoneyEdit
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
      object diferencia_neto105: TMoneyEdit
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
      object diferencia_iva105: TMoneyEdit
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
    end
  end
  inherited ZQSelect: TZQuery
    Left = 544
    Top = 24
  end
  inherited ZQExecSQL: TZQuery
    Top = 88
  end
end
