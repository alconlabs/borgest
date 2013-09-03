inherited NotaPedido: TNotaPedido
  Caption = 'Nota de Pedido'
  ExplicitWidth = 867
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    object Label14: TLabel [12]
      Left = 212
      Top = 327
      Width = 72
      Height = 13
      Caption = 'Forma de Pago'
    end
    object Label16: TLabel [13]
      Left = 420
      Top = 345
      Width = 42
      Height = 13
      Caption = 'Equipo 1'
    end
    object Label17: TLabel [14]
      Left = 420
      Top = 369
      Width = 42
      Height = 13
      Caption = 'Equipo 2'
    end
    inherited documentoventa_numero: TEdit
      TabOrder = 17
    end
    inherited documentoventa_fecha: TDateTimePicker
      TabOrder = 18
    end
    inherited btncancelar: TButton
      TabOrder = 13
    end
    inherited btnguardar: TButton
      TabOrder = 12
    end
    inherited DBGrid1: TDBGrid
      TabOrder = 20
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventadetalle_cantidad'
          Title.Caption = 'Cant.'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          Title.Caption = 'Producto'
          Width = 464
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_precio'
          Title.Caption = 'Precio'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_importe3'
          Title.Caption = 'Flete'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_total'
          Title.Caption = 'Total'
          Width = 66
          Visible = True
        end>
    end
    inherited btnagregar: TButton
      Left = 5
      ExplicitLeft = 5
    end
    inherited btnmodificar: TButton
      TabOrder = 4
    end
    inherited GroupBox1: TGroupBox
      Left = 626
      Top = 397
      Width = 214
      Height = 57
      Caption = ''
      ExplicitLeft = 626
      ExplicitTop = 397
      ExplicitWidth = 214
      ExplicitHeight = 57
      inherited Label5: TLabel
        Top = 73
        Visible = False
        ExplicitTop = 73
      end
      inherited Label6: TLabel
        Top = 97
        Visible = False
        ExplicitTop = 97
      end
      inherited Label7: TLabel
        Top = 73
        Visible = False
        ExplicitTop = 73
      end
      inherited Label9: TLabel
        Top = 97
        Visible = False
        ExplicitTop = 97
      end
      inherited Label10: TLabel
        Left = 15
        Top = 17
        ExplicitLeft = 15
        ExplicitTop = 17
      end
      inherited documentoventa_neto21: TMoneyEdit
        Top = 70
        Visible = False
        ExplicitTop = 70
      end
      inherited documentoventa_iva21: TMoneyEdit
        Top = 94
        Visible = False
        ExplicitTop = 94
      end
      inherited documentoventa_neto105: TMoneyEdit
        Top = 70
        Visible = False
        ExplicitTop = 70
      end
      inherited documentoventa_iva105: TMoneyEdit
        Top = 94
        Visible = False
        ExplicitTop = 94
      end
      inherited documentoventa_total: TMoneyEdit
        Left = 68
        Top = 14
        ExplicitLeft = 68
        ExplicitTop = 14
      end
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
    object documentoventa_formapago: TGTBMemo [31]
      Left = 212
      Top = 342
      Width = 189
      Height = 98
      TabOrder = 6
      Tag2 = 0
      FieldName = 'documentoventa_formapago'
    end
    object documentoventa_equipo1: TGTBEdit [32]
      Left = 472
      Top = 342
      Width = 121
      Height = 21
      TabOrder = 10
      Tag2 = 0
      FieldName = 'documentoventa_equipo1'
    end
    object documentoventa_equipo2: TGTBEdit [33]
      Left = 472
      Top = 366
      Width = 121
      Height = 21
      TabOrder = 11
      Tag2 = 0
      FieldName = 'documentoventa_equipo2'
    end
    object btnimprimir: TButton [34]
      Left = 10
      Top = 457
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 19
      OnClick = btnimprimirClick
    end
    inherited documentoventa_observacion: TGTBMemo
      Width = 189
      TabStop = True
      FieldName = 'documentoventa_observacion'
      ExplicitWidth = 189
    end
  end
  inherited ZQuery2: TZQuery
    Left = 400
    Top = 128
  end
  inherited DTSDocumentoventadetalle: TDataSource
    Left = 344
    Top = 224
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 480
    Top = 200
  end
  object ZQDebitos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 664
    Top = 320
  end
  object ZQCreditos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select *, '
      
        'sum(if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas' +
        '.documentoventa_saldo,documentosventas.documentoventa_saldo*-1))' +
        ' as saldo'
      'from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      'where documentoventa_estadO='#39'PENDIENTE'#39
      'and tiposdocumento.tipodocu_debcred<>"N/A"'
      'and 1=2'
      'group by clientes.cliente_id')
    Params = <>
    Left = 760
    Top = 320
  end
end
