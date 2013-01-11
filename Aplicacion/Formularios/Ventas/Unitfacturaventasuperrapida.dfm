inherited facturaventasuperrapida: Tfacturaventasuperrapida
  Caption = 'Venta'
  ClientHeight = 127
  ClientWidth = 389
  ExplicitWidth = 405
  ExplicitHeight = 165
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 389
    Height = 127
    ExplicitWidth = 389
    ExplicitHeight = 127
    FullHeight = 0
    inherited Label2: TLabel
      Left = 565
      Top = 215
      Visible = False
      ExplicitLeft = 565
      ExplicitTop = 215
    end
    inherited Label3: TLabel
      Left = 22
      Top = 10
      ExplicitLeft = 22
      ExplicitTop = 10
    end
    inherited Label4: TLabel
      Left = 8
      Top = 58
      ExplicitLeft = 8
      ExplicitTop = 58
    end
    inherited Label8: TLabel
      Left = 388
      Top = 269
      Visible = False
      ExplicitLeft = 388
      ExplicitTop = 269
    end
    inherited Label15: TLabel
      Top = 255
      Visible = False
      ExplicitTop = 255
    end
    inherited Label1: TLabel
      Top = 277
      Visible = False
      ExplicitTop = 277
    end
    inherited cliente_domicilio: TLabel
      Top = 277
      Visible = False
      ExplicitTop = 277
    end
    inherited Label11: TLabel
      Top = 301
      Visible = False
      ExplicitTop = 301
    end
    inherited cliente_documentonro: TLabel
      Top = 301
      Visible = False
      ExplicitTop = 301
    end
    inherited Label12: TLabel
      Left = 406
      Top = 293
      Visible = False
      ExplicitLeft = 406
      ExplicitTop = 293
    end
    inherited Label13: TLabel
      Visible = False
    end
    inherited labelsucursal: TLabel
      Top = 226
      Visible = False
      ExplicitTop = 226
    end
    object Label14: TLabel [12]
      Left = 11
      Top = 34
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Producto'
    end
    object Label16: TLabel [13]
      Left = 19
      Top = 83
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    inherited documentoventa_numero: TEdit
      Top = 252
      TabOrder = 18
      Visible = False
      ExplicitTop = 252
    end
    inherited documentoventa_fecha: TDateTimePicker
      Left = 601
      Top = 212
      TabOrder = 19
      Visible = False
      ExplicitLeft = 601
      ExplicitTop = 212
    end
    inherited cliente_id: TSqlComboBox
      Left = 60
      Top = 7
      Width = 321
      Style = csDropDown
      OnExit = cliente_idExit
      ExplicitLeft = 60
      ExplicitTop = 7
      ExplicitWidth = 321
    end
    inherited personal_id: TSqlComboBox
      Left = 60
      Top = 55
      Width = 321
      Style = csDropDown
      TabOrder = 2
      OnExit = personal_idExit
      ExplicitLeft = 60
      ExplicitTop = 55
      ExplicitWidth = 321
    end
    inherited btncancelar: TButton
      Left = 306
      Top = 81
      TabOrder = 5
      ExplicitLeft = 306
      ExplicitTop = 81
    end
    inherited btnguardar: TButton
      Left = 225
      Top = 81
      Enabled = False
      TabOrder = 4
      ExplicitLeft = 225
      ExplicitTop = 81
    end
    inherited documentoventa_condicionventa: TComboBox
      Left = 487
      Top = 266
      TabOrder = 6
      Visible = False
      ExplicitLeft = 487
      ExplicitTop = 266
    end
    inherited DBGrid1: TDBGrid
      Left = 527
      Top = 320
      Width = 188
      Height = 63
      TabOrder = 7
      Visible = False
    end
    inherited btnagregar: TButton
      Left = 524
      Top = 404
      TabOrder = 8
      Visible = False
      ExplicitLeft = 524
      ExplicitTop = 404
    end
    inherited btnquitar: TButton
      Left = 671
      Top = 404
      TabOrder = 10
      Visible = False
      ExplicitLeft = 671
      ExplicitTop = 404
    end
    inherited btnmodificar: TButton
      Left = 598
      Top = 404
      TabOrder = 9
      Visible = False
      ExplicitLeft = 598
      ExplicitTop = 404
    end
    inherited GroupBox1: TGroupBox
      TabOrder = 11
      Visible = False
    end
    inherited puntoventa_id: TSqlComboBox
      Top = 252
      TabOrder = 16
      Visible = False
      ExplicitTop = 252
    end
    inherited tipodocu_id: TSqlComboBox
      Top = 252
      TabOrder = 17
      Visible = False
      ExplicitTop = 252
    end
    inherited documentoventa_listaprecio: TComboBox
      Left = 487
      Top = 290
      TabOrder = 12
      Visible = False
      ExplicitLeft = 487
      ExplicitTop = 290
    end
    inherited DBGrid2: TDBGrid
      Top = 322
      Width = 186
      Height = 65
      TabOrder = 13
      Visible = False
    end
    inherited btnagregarpago: TButton
      Top = 409
      TabOrder = 14
      Visible = False
      ExplicitTop = 409
    end
    inherited btnquitarpago: TButton
      Top = 409
      TabOrder = 15
      Visible = False
      ExplicitTop = 409
    end
    inherited sucursal_id: TSqlComboBox
      Top = 223
      TabOrder = 20
      Visible = False
      ExplicitTop = 223
    end
    object producto_id: TSqlComboBox
      Left = 60
      Top = 31
      Width = 321
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnExit = producto_idExit
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from productos'
        'order by producto_nombre')
      Confcampo_codigo = 'producto_id'
      Confcampo_nomb = 'producto_nombre'
      Tag2 = 0
    end
    object documentopago_importe: TMoneyEdit
      Left = 60
      Top = 80
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
      TabOrder = 3
      Version = '1.1.0.1'
    end
  end
  inherited ZQuery2: TZQuery
    Left = 848
    Top = 272
  end
  inherited ZQDocumentoventadetalles: TZQuery
    Left = 928
    Top = 424
  end
  inherited DTSDocumentoventadetalle: TDataSource
    Left = 768
    Top = 344
  end
  inherited ZQRecibo: TZQuery
    Left = 912
    Top = 264
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 912
    Top = 200
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 768
    Top = 240
  end
  inherited DTSPagos: TDataSource
    Left = 768
    Top = 168
  end
  inherited ZQpagotarjeta: TZQuery
    Left = 920
    Top = 128
  end
  inherited ZQNotacredito: TZQuery
    Left = 912
    Top = 344
  end
  inherited ZQExecSql: TZQuery
    Left = 856
    Top = 392
  end
end
