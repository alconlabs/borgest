inherited NotaCreditoVenta: TNotaCreditoVenta
  Caption = 'Nota de Credito de Venta'
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
    inherited btncancelar: TButton
      Top = 350
      ExplicitTop = 350
    end
    inherited btnguardar: TButton
      Top = 350
      ExplicitTop = 350
    end
    inherited documento_fecha: TDateTimePicker
      Left = 725
      ExplicitLeft = 725
    end
    inherited documento_fechavenc: TDateTimePicker
      Left = 725
      ExplicitLeft = 725
    end
    inherited documento_observaciones: TGTBMemo
      Top = 251
      Height = 126
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
  end
  inherited ZQSelect: TZQuery
    Left = 336
    Top = 32
  end
  inherited ZQDocumentos: TZQuery
    Left = 160
    Top = 360
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
    Left = 48
    Top = 368
  end
end
