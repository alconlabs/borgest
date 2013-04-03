inherited NotapedidoDetalle: TNotapedidoDetalle
  Caption = 'Detalle'
  ClientHeight = 254
  ClientWidth = 679
  ExplicitWidth = 695
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 679
    Height = 254
    ExplicitWidth = 679
    ExplicitHeight = 254
    FullHeight = 0
    inherited Label3: TLabel
      Left = 15
      Top = 11
      ExplicitLeft = 15
      ExplicitTop = 11
    end
    inherited Label6: TLabel
      Left = 16
      Top = 34
      ExplicitLeft = 16
      ExplicitTop = 34
    end
    inherited Label1: TLabel
      Left = 7
      Top = 70
      Width = 51
      Caption = 'Precio Fac'
      ExplicitLeft = 7
      ExplicitTop = 70
      ExplicitWidth = 51
    end
    inherited Label2: TLabel
      Left = 450
      Top = 118
      ExplicitLeft = 450
      ExplicitTop = 118
    end
    inherited producdepo_stockminimo: TLabel
      Left = 356
      Top = 38
      ExplicitLeft = 356
      ExplicitTop = 38
    end
    inherited producdepo_stockactual: TLabel
      Left = 580
      Top = 38
      ExplicitLeft = 580
      ExplicitTop = 38
    end
    inherited producto_fechaactualizacionprecio: TLabel
      Left = 197
      Top = 38
      ExplicitLeft = 197
      ExplicitTop = 38
    end
    object Label4: TLabel [7]
      Left = 35
      Top = 94
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Flete'
    end
    object Label5: TLabel [8]
      Left = 2
      Top = 118
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe Fac'
    end
    object Label7: TLabel [9]
      Left = 220
      Top = 70
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio Esp.'
    end
    object Label8: TLabel [10]
      Left = 229
      Top = 94
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio Pl.'
    end
    object Label9: TLabel [11]
      Left = 215
      Top = 118
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe Esp.'
    end
    object Label10: TLabel [12]
      Left = 435
      Top = 70
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Subtotal'
    end
    inherited Button1: TButton
      Left = 592
      Top = 158
      TabOrder = 12
      ExplicitLeft = 592
      ExplicitTop = 158
    end
    inherited btnaceptar: TButton
      Left = 511
      Top = 158
      TabOrder = 11
      ExplicitLeft = 511
      ExplicitTop = 158
    end
    inherited ventadetalle_preciounitario: TDBAdvEdit
      Left = 72
      Top = 67
      ExplicitLeft = 72
      ExplicitTop = 67
    end
    inherited ventadetalle_total: TDBAdvEdit
      Left = 488
      Top = 115
      TabOrder = 10
      ExplicitLeft = 488
      ExplicitTop = 115
    end
    inherited producto_id: TEditCodi
      Left = 72
      Top = 8
      TabOrder = 0
      ExplicitLeft = 72
      ExplicitTop = 8
    end
    inherited producto_nombre: TEdit
      Left = 197
      Top = 8
      TabOrder = 1
      ExplicitLeft = 197
      ExplicitTop = 8
    end
    inherited btnherramientas: TAdvGlowButton
      Left = 626
      TabOrder = 13
      ExplicitLeft = 626
    end
    inherited GroupBoxPrecios: TGroupBox
      Top = 189
      Width = 679
      TabOrder = 14
      ExplicitTop = 189
      ExplicitWidth = 679
    end
    inherited ventadetalle_preciounitoriginal: TDBAdvEdit
      TabOrder = 15
    end
    inherited ventadeta_cantidad: TMoneyEdit
      Left = 72
      Top = 31
      TabOrder = 2
      ExplicitLeft = 72
      ExplicitTop = 31
    end
    object documentoventadetalle_importe3: TDBAdvEdit
      Left = 72
      Top = 91
      Width = 121
      Height = 21
      EditType = etFloat
      Precision = 2
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 6
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
    object documentoventadetalle_importe5: TDBAdvEdit
      Left = 72
      Top = 115
      Width = 121
      Height = 21
      EditType = etFloat
      Precision = 2
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 8
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
    object documentoventadetalle_importe1: TDBAdvEdit
      Left = 288
      Top = 67
      Width = 121
      Height = 21
      EditType = etFloat
      Precision = 2
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 4
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
    object documentoventadetalle_importe4: TDBAdvEdit
      Left = 288
      Top = 91
      Width = 121
      Height = 21
      EditType = etFloat
      Precision = 2
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 7
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
    object documentoventadetalle_importe6: TDBAdvEdit
      Left = 288
      Top = 115
      Width = 121
      Height = 21
      EditType = etFloat
      Precision = 2
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 9
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
    object documentoventadetalle_importe2: TDBAdvEdit
      Left = 488
      Top = 67
      Width = 121
      Height = 21
      EditType = etFloat
      Precision = 2
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 5
      Text = '0,00'
      Visible = True
      OnExit = ventadetalle_preciounitarioExit
      Version = '2.7.0.5'
    end
  end
  inherited ZQDocumentoventadetalles: TZQuery
    Left = 80
    Top = 152
  end
  inherited AdvPopupMenu1: TAdvPopupMenu
    Left = 296
    Top = 208
  end
end
