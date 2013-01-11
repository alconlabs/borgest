inherited InformesVentas: TInformesVentas
  Caption = 'Informes de Ventas'
  ClientHeight = 144
  ClientWidth = 253
  OnCreate = FormCreate
  ExplicitWidth = 269
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 253
    Height = 144
    ExplicitWidth = 253
    ExplicitHeight = 144
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
    inherited btnguardar: TButton
      Caption = 'Imprimir'
      OnClick = btnguardarClick
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
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'Costos por Ventas'
      Items.Strings = (
        'Costos por Ventas'
        'Stock valorizado')
      Tag2 = 0
      valores.Strings = (
        '0'
        '1')
    end
  end
end
