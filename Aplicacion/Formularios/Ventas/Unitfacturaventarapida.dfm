inherited facturasventarapida: Tfacturasventarapida
  Caption = 'Venta Rapida'
  ClientHeight = 247
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Height = 247
    ExplicitHeight = 249
    FullHeight = 0
    inherited Label2: TLabel
      Top = 332
      Visible = False
      ExplicitTop = 332
    end
    inherited Label3: TLabel
      Top = 353
      Visible = False
      ExplicitTop = 353
    end
    inherited Label4: TLabel
      Top = 353
      Visible = False
      ExplicitTop = 353
    end
    inherited Label8: TLabel
      Top = 374
      Visible = False
      ExplicitTop = 374
    end
    inherited Label15: TLabel
      Top = 332
      Visible = False
      ExplicitTop = 332
    end
    inherited Label1: TLabel
      Top = 374
      Visible = False
      ExplicitTop = 374
    end
    inherited cliente_domicilio: TLabel
      Top = 374
      Visible = False
      ExplicitTop = 374
    end
    inherited Label11: TLabel
      Top = 395
      Visible = False
      ExplicitTop = 395
    end
    inherited cliente_documentonro: TLabel
      Top = 395
      Visible = False
      ExplicitTop = 395
    end
    inherited Label12: TLabel
      Top = 395
      Visible = False
      ExplicitTop = 395
    end
    inherited Label13: TLabel
      Top = 392
      Visible = False
      ExplicitTop = 392
    end
    object Label14: TLabel [11]
      Left = 688
      Top = 170
      Width = 41
      Height = 20
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited labelsucursal: TLabel
      Top = 306
      Visible = False
      ExplicitTop = 306
    end
    inherited Label16: TLabel
      Top = 300
      Height = 23
      Visible = False
      ExplicitTop = 300
      ExplicitHeight = 23
    end
    inherited documentoventa_numero: TEdit
      Top = 329
      Visible = False
      ExplicitTop = 329
    end
    inherited documentoventa_fecha: TDateTimePicker
      Top = 329
      TabOrder = 21
      Visible = False
      ExplicitTop = 329
    end
    inherited cliente_id: TSqlComboBox
      Top = 350
      Visible = False
      ExplicitTop = 350
    end
    inherited personal_id: TSqlComboBox
      Top = 350
      Visible = False
      ExplicitTop = 350
    end
    inherited btncancelar: TButton
      Top = 199
      ExplicitTop = 199
    end
    inherited btnguardar: TButton
      Top = 199
      ExplicitTop = 199
    end
    inherited documentoventa_condicionventa: TComboBox
      Top = 371
      Visible = False
      ExplicitTop = 371
    end
    inherited DBGrid1: TDBGrid
      Top = 8
    end
    inherited btnagregar: TButton
      Top = 167
      ExplicitTop = 167
    end
    inherited btnquitar: TButton
      Top = 167
      ExplicitTop = 167
    end
    inherited btnmodificar: TButton
      Top = 167
      ExplicitTop = 167
    end
    inherited GroupBox1: TGroupBox
      Top = 417
      Height = 74
      Visible = False
      ExplicitTop = 417
      ExplicitHeight = 74
      inherited Label5: TLabel
        Top = 12
        ExplicitTop = 12
      end
      inherited Label6: TLabel
        Top = 33
        ExplicitTop = 33
      end
      inherited Label7: TLabel
        Top = 12
        ExplicitTop = 12
      end
      inherited Label9: TLabel
        Top = 33
        ExplicitTop = 33
      end
      inherited documentoventa_neto21: TMoneyEdit
        Top = 9
        ExplicitTop = 9
      end
      inherited documentoventa_iva21: TMoneyEdit
        Top = 30
        ExplicitTop = 30
      end
      inherited documentoventa_neto105: TMoneyEdit
        Top = 9
        ExplicitTop = 9
      end
      inherited documentoventa_iva105: TMoneyEdit
        Top = 30
        ExplicitTop = 30
      end
    end
    inherited puntoventa_id: TSqlComboBox
      Top = 329
      Visible = False
      ExplicitTop = 329
    end
    inherited tipodocu_id: TSqlComboBox
      Top = 329
      Visible = False
      ExplicitTop = 329
    end
    inherited documentoventa_listaprecio: TComboBox
      Top = 392
      Visible = False
      ExplicitTop = 392
    end
    inherited DBGrid2: TDBGrid
      Top = 417
      Height = 46
      Visible = False
    end
    inherited btnagregarpago: TButton
      Top = 463
      Visible = False
      ExplicitTop = 463
    end
    inherited btnquitarpago: TButton
      Top = 463
      Visible = False
      ExplicitTop = 463
    end
    inherited sucursal_id: TSqlComboBox
      Top = 303
      Visible = False
      ExplicitTop = 303
    end
    object documentoventa_total2: TMoneyEdit [33]
      Left = 742
      Top = 167
      Width = 99
      Height = 28
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
      Version = '1.1.0.1'
    end
    inherited btnherramientas: TAdvGlowButton
      Top = 294
      ExplicitTop = 294
    end
    inherited btnimprimirventa: TButton
      TabOrder = 23
      Visible = False
    end
    inherited documentoventa_fechavenc: TDateTimePicker
      Top = 300
      TabStop = False
      Visible = False
      ExplicitTop = 300
    end
  end
  inherited ZQuery2: TZQuery
    Left = 384
    Top = 104
  end
  inherited ZQDocumentoventadetalles: TZQuery
    Left = 64
    Top = 96
  end
  inherited DTSDocumentoventadetalle: TDataSource
    Left = 64
    Top = 40
  end
  inherited ZQRecibo: TZQuery
    Left = 232
    Top = 104
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 232
    Top = 32
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 488
    Top = 96
  end
  inherited DTSPagos: TDataSource
    Left = 640
    Top = 40
  end
  inherited ZQpagotarjeta: TZQuery
    Left = 496
    Top = 40
  end
  inherited ZQNotacredito: TZQuery
    Left = 384
    Top = 40
  end
end
