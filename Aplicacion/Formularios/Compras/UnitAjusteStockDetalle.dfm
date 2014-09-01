inherited AjusteStockDetalle: TAjusteStockDetalle
  Caption = 'Detalle'
  ClientHeight = 124
  ExplicitHeight = 162
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Height = 124
    ExplicitHeight = 223
    FullHeight = 0
    inherited Label3: TLabel
      Left = 31
      Top = 15
      ExplicitLeft = 31
      ExplicitTop = 15
    end
    inherited Label6: TLabel
      Left = 32
      Top = 42
      ExplicitLeft = 32
      ExplicitTop = 42
    end
    inherited Label1: TLabel
      Top = 234
      Visible = False
      ExplicitTop = 234
    end
    inherited Label2: TLabel
      Top = 266
      Visible = False
      ExplicitTop = 266
    end
    inherited producdepo_stockminimo: TLabel
      Left = 468
      Top = 42
      ExplicitLeft = 468
      ExplicitTop = 42
    end
    inherited producdepo_stockactual: TLabel
      Left = 596
      Top = 42
      ExplicitLeft = 596
      ExplicitTop = 42
    end
    inherited producto_fechaactualizacionprecio: TLabel
      Top = 234
      Visible = False
      ExplicitTop = 234
    end
    inherited producdepo_stockinicial: TLabel
      Left = 332
      Top = 42
      ExplicitLeft = 332
      ExplicitTop = 42
    end
    inherited btncancelar: TButton
      Left = 608
      Top = 74
      ExplicitLeft = 608
      ExplicitTop = 74
    end
    inherited btnaceptar: TButton
      Left = 527
      Top = 74
      ExplicitLeft = 527
      ExplicitTop = 74
    end
    inherited ventadetalle_preciounitario: TDBAdvEdit
      Top = 231
      Visible = False
      ExplicitTop = 231
    end
    inherited ventadetalle_total: TDBAdvEdit
      Top = 263
      Visible = False
      ExplicitTop = 263
    end
    inherited producto_id: TEditCodi
      Left = 88
      Top = 12
      TabOrder = 0
      ExplicitLeft = 88
      ExplicitTop = 12
    end
    inherited producto_nombre: TEdit
      Left = 213
      Top = 12
      TabOrder = 1
      ExplicitLeft = 213
      ExplicitTop = 12
    end
    inherited GroupBoxPrecios: TGroupBox
      Top = 59
      Visible = False
      ExplicitTop = 152
    end
    inherited ventadetalle_preciounitoriginal: TDBAdvEdit
      Top = 263
      ExplicitTop = 263
    end
    inherited ventadeta_cantidad: TMoneyEdit
      Left = 88
      Top = 39
      TabOrder = 2
      ExplicitLeft = 88
      ExplicitTop = 39
    end
  end
  inherited ZQDocumentoventadetalles: TZQuery
    Top = 160
  end
  inherited AdvPopupMenu1: TAdvPopupMenu
    Left = 472
    Top = 168
  end
end
