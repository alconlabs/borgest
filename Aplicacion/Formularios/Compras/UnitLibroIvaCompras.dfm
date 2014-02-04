inherited LibroIvaCompras: TLibroIvaCompras
  Caption = 'Libro IVA Compras'
  ClientHeight = 137
  ClientWidth = 228
  ExplicitWidth = 244
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 228
    Height = 137
    ExplicitWidth = 228
    ExplicitHeight = 137
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 12
      Top = 16
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label2: TLabel [1]
      Left = 15
      Top = 40
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    inherited btncancelar: TButton
      Left = 21
      Top = 80
      Caption = 'Salir'
      ExplicitLeft = 21
      ExplicitTop = 80
    end
    inherited btnguardar: TButton
      Left = 115
      Top = 80
      Caption = 'Imprimir'
      ExplicitLeft = 115
      ExplicitTop = 80
    end
    object desde_fecha: TDateTimePicker
      Left = 52
      Top = 13
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 2
    end
    object hasta_fecha: TDateTimePicker
      Left = 52
      Top = 37
      Width = 100
      Height = 21
      Date = 41242.000000000000000000
      Time = 41242.000000000000000000
      TabOrder = 3
    end
  end
  inherited ZQSelect: TZQuery
    Left = 96
    Top = 152
  end
  inherited ZQExecSQL: TZQuery
    Left = 216
    Top = 200
  end
end
