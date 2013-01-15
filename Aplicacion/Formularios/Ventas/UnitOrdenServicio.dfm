inherited ordenservicio: Tordenservicio
  Caption = 'Orden de Servicio'
  ClientHeight = 532
  ExplicitTop = -32
  ExplicitWidth = 320
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Height = 532
    ExplicitHeight = 532
    FullHeight = 0
    inherited Label13: TLabel
      Top = 423
      ExplicitTop = 423
    end
    object Label14: TLabel [12]
      Left = 4
      Top = 143
      Width = 161
      Height = 13
      Caption = 'Descripcion del Pedido del Cliente'
    end
    object Label16: TLabel [13]
      Left = 432
      Top = 141
      Width = 86
      Height = 13
      Caption = 'Trabajo Realizado'
    end
    object Label17: TLabel [14]
      Left = 4
      Top = 263
      Width = 99
      Height = 13
      Caption = 'Repuestos Utilizados'
    end
    inherited documentoventa_numero: TEdit
      TabOrder = 17
    end
    inherited documentoventa_fecha: TDateTimePicker
      TabOrder = 18
    end
    inherited btncancelar: TButton
      Top = 481
      TabOrder = 13
      ExplicitTop = 481
    end
    inherited btnguardar: TButton
      Top = 481
      TabOrder = 12
      ExplicitTop = 481
    end
    inherited DBGrid1: TDBGrid
      Top = 280
      Height = 107
      TabOrder = 6
    end
    inherited btnagregar: TButton
      Top = 388
      TabOrder = 7
      ExplicitTop = 388
    end
    inherited btnquitar: TButton
      Top = 388
      TabOrder = 9
      ExplicitTop = 388
    end
    inherited btnmodificar: TButton
      Top = 388
      TabOrder = 8
      ExplicitTop = 388
    end
    inherited GroupBox1: TGroupBox
      Left = 232
      Top = 393
      Height = 16
      TabOrder = 10
      Visible = False
      ExplicitLeft = 232
      ExplicitTop = 393
      ExplicitHeight = 16
    end
    inherited puntoventa_id: TSqlComboBox
      TabOrder = 15
    end
    inherited tipodocu_id: TSqlComboBox
      TabOrder = 16
    end
    inherited sucursal_id: TSqlComboBox
      TabOrder = 14
    end
    inherited documentoventa_observacion: TGTBMemo
      Top = 438
      Width = 405
      Height = 68
      TabOrder = 11
      ExplicitTop = 438
      ExplicitWidth = 405
      ExplicitHeight = 68
    end
    object documentoventa_solicitudcliente: TGTBMemo
      Left = 4
      Top = 158
      Width = 405
      Height = 99
      TabOrder = 4
      Tag2 = 0
    end
    object documentoventa_trabajorealizado: TGTBMemo
      Left = 432
      Top = 158
      Width = 408
      Height = 99
      TabOrder = 5
      Tag2 = 0
    end
    object btnimprimir: TButton
      Left = 410
      Top = 481
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 19
      OnClick = btnimprimirClick
    end
  end
  inherited ZQuery2: TZQuery
    Left = 736
    Top = 408
  end
  inherited ZQDocumentoventadetalles: TZQuery
    Left = 464
    Top = 336
  end
  inherited DTSDocumentoventadetalle: TDataSource
    Left = 616
    Top = 472
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 632
    Top = 408
  end
  inherited ZQNotacredito: TZQuery
    Left = 808
    Top = 416
  end
  inherited ZQExecSql: TZQuery
    Left = 288
    Top = 360
  end
end
