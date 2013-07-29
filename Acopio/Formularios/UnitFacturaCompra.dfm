inherited FacturaCompra: TFacturaCompra
  Caption = 'Factura de Compra'
  ClientHeight = 385
  ClientWidth = 885
  ExplicitWidth = 901
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 885
    Height = 385
    ExplicitWidth = 885
    ExplicitHeight = 385
    FullHeight = 0
    inherited Label2: TLabel
      Left = 689
      ExplicitLeft = 689
    end
    inherited Label16: TLabel
      Left = 628
      ExplicitLeft = 628
    end
    inherited Label18: TLabel
      Top = 251
      ExplicitTop = 251
    end
    object Label24: TLabel [13]
      Left = 147
      Top = 85
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Caption = '-'
    end
    inherited btncancelar: TButton
      Top = 350
      TabOrder = 11
      ExplicitTop = 350
    end
    inherited btnguardar: TButton
      Top = 350
      TabOrder = 10
      ExplicitTop = 350
    end
    inherited documento_numero: TEdit
      Left = 156
      Width = 145
      TabOrder = 4
      ExplicitLeft = 156
      ExplicitWidth = 145
    end
    inherited documento_fecha: TDateTimePicker
      Left = 725
      TabOrder = 6
      ExplicitLeft = 725
    end
    inherited entidad_id: TSqlComboBox
      TabOrder = 5
    end
    inherited documento_fechavenc: TDateTimePicker
      Left = 725
      TabOrder = 7
      ExplicitLeft = 725
    end
    inherited documento_observaciones: TGTBMemo
      Top = 251
      Height = 126
      TabOrder = 9
      ExplicitTop = 251
      ExplicitHeight = 126
    end
    inherited GroupBox1: TGroupBox
      Left = 37
      Top = 131
      ExplicitLeft = 37
      ExplicitTop = 131
      inherited documento_neto21: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_iva21: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_neto105: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_iva105: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_otrosimpuestos: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_neto27: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_iva27: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_nogravado: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_ivaret: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_ivaperc: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_dgrret: TMoneyEdit
        OnExit = documento_neto21Exit
      end
      inherited documento_dgrperc: TMoneyEdit
        OnExit = documento_neto21Exit
      end
    end
    object documento_puntoventa: TEdit
      Left = 92
      Top = 82
      Width = 50
      Height = 21
      TabOrder = 3
    end
  end
  inherited ZQSelect: TZQuery
    Left = 496
    Top = 88
  end
  inherited ZQDocumentos: TZQuery
    Left = 160
    Top = 344
  end
  inherited ZQDocumentosdocuImputacion: TZQuery
    Left = 264
    Top = 368
  end
  inherited ZQDocumentosdocuRelacion: TZQuery
    Left = 416
    Top = 352
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 56
    Top = 256
  end
end
