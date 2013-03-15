inherited InformesVentas: TInformesVentas
  Caption = 'Informes de Ventas'
  ClientHeight = 170
  ClientWidth = 328
  ExplicitWidth = 344
  ExplicitHeight = 208
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 328
    Height = 170
    ExplicitWidth = 328
    ExplicitHeight = 170
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 44
      Top = 16
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label2: TLabel [1]
      Left = 47
      Top = 40
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label3: TLabel [2]
      Left = 40
      Top = 64
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Informe'
    end
    object Label4: TLabel [3]
      Left = 29
      Top = 88
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    inherited btncancelar: TButton
      Left = 133
      Top = 112
      ExplicitLeft = 133
      ExplicitTop = 112
    end
    inherited btnguardar: TButton
      Left = 227
      Top = 112
      Caption = 'Imprimir'
      OnClick = btnguardarClick
      ExplicitLeft = 227
      ExplicitTop = 112
    end
    object desde_fecha: TDateTimePicker
      Left = 84
      Top = 13
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 2
    end
    object hasta_fecha: TDateTimePicker
      Left = 84
      Top = 37
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 3
    end
    object informe_tipo: TGTBComboBox
      Left = 84
      Top = 61
      Width = 221
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnSelect = informe_tipoSelect
      Items.Strings = (
        'Costos por Ventas'
        'Informe de Precios de Ventas'
        'Informe de ventas')
      Tag2 = 0
      valores.Strings = (
        '0'
        '1'
        '2')
    end
    object personal_id: TSqlComboBox
      Left = 84
      Top = 85
      Width = 220
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
      ConfTodos = True
    end
  end
end
