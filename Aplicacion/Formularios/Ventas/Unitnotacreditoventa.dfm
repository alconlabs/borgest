inherited notacreditoventa: Tnotacreditoventa
  Caption = 'Nota de Credito'
  ExplicitWidth = 867
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited documentoventa_numero: TEdit
      TabOrder = 14
    end
    inherited documentoventa_fecha: TDateTimePicker
      TabOrder = 15
    end
    inherited btncancelar: TButton
      TabOrder = 10
    end
    inherited btnguardar: TButton
      TabOrder = 9
    end
    inherited btnagregar: TButton
      TabOrder = 16
    end
    inherited btnquitar: TButton
      TabOrder = 6
    end
    inherited btnmodificar: TButton
      TabOrder = 5
    end
    inherited GroupBox1: TGroupBox
      TabOrder = 7
    end
    inherited puntoventa_id: TSqlComboBox
      TabOrder = 12
    end
    inherited tipodocu_id: TSqlComboBox
      TabOrder = 13
    end
    inherited sucursal_id: TSqlComboBox
      TabOrder = 11
    end
    inherited documentoventa_observacion: TGTBMemo
      TabOrder = 8
    end
  end
end
