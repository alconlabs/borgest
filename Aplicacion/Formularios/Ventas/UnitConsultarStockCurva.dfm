inherited ConsultarStockCurvas: TConsultarStockCurvas
  Caption = 'Carga de Stock - Curvas'
  ClientHeight = 460
  ClientWidth = 1011
  ExplicitWidth = 1027
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1011
    Height = 460
    ExplicitWidth = 1011
    ExplicitHeight = 400
    FullHeight = 0
    object Label15: TLabel [0]
      Left = 40
      Top = 34
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label3: TLabel [1]
      Left = 33
      Top = 146
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label21: TLabel [2]
      Left = 40
      Top = 82
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marca'
    end
    object Label1: TLabel [3]
      Left = 31
      Top = 58
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seccion'
    end
    object Label2: TLabel [4]
      Left = 41
      Top = 106
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rubro'
    end
    object Label4: TLabel [5]
      Left = 7
      Top = 170
      Width = 61
      Height = 13
      Caption = 'Stock Actual'
    end
    object Label6: TLabel [6]
      Left = 7
      Top = 10
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo Barras'
    end
    inherited btncancelar: TButton
      Left = 918
      Top = 363
      Caption = 'Salir'
      TabOrder = 9
      ExplicitLeft = 918
      ExplicitTop = 363
    end
    inherited btnguardar: TButton
      Left = 399
      Top = 298
      Width = 98
      Caption = 'Guardar Cambios'
      TabOrder = 8
      Visible = False
      ExplicitLeft = 399
      ExplicitTop = 298
      ExplicitWidth = 98
    end
    object producto_codigoarticulo: TEdit
      Left = 79
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object producto_nombre: TEdit
      Left = 79
      Top = 143
      Width = 594
      Height = 21
      TabOrder = 6
      OnEnter = producto_nombreEnter
    end
    object marca_id: TSqlComboBox
      Left = 79
      Top = 79
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from marcas'
        'order by marca_nombre')
      ConfTabla = 'marcas'
      Confcampo_codigo = 'marca_id'
      Confcampo_nomb = 'marca_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object seccion_id: TSqlComboBox
      Left = 79
      Top = 55
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from secciones'
        'order by seccion_nombre')
      ConfTabla = 'secciones'
      Confcampo_codigo = 'seccion_id'
      Confcampo_nomb = 'seccion_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object rubro_id: TSqlComboBox
      Left = 79
      Top = 103
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from rubros'
        'order by rubro_nombre')
      ConfTabla = 'rubros'
      Confcampo_codigo = 'rubro_id'
      Confcampo_nomb = 'rubro_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object StringGridStock: TStringGrid
      Left = 7
      Top = 189
      Width = 986
      Height = 160
      ColCount = 2
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
      TabOrder = 7
      RowHeights = (
        24
        24)
    end
    object producto_codigobarras: TEdit
      Left = 79
      Top = 7
      Width = 225
      Height = 21
      TabOrder = 0
      OnExit = producto_codigobarrasExit
    end
    object btnbuscar: TButton
      Left = 302
      Top = 101
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      OnClick = btnbuscarClick
    end
  end
  inherited ZQSelect: TZQuery
    Left = 352
    Top = 32
  end
  inherited ZQExecSQL: TZQuery
    Left = 240
    Top = 232
  end
  object ZQProducto: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 664
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object ZQProductosTalles: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object MQProductosTalles: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select t as producto_id,t as producto_talle,t as producto_tallec' +
        'odigo,i as producto_talleorden,d as producto_precioventa1 from t' +
        'emp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,t'
      'producto_talle,t'
      'producto_tallecodigo,t'
      'producto_talleorden,i'
      'producto_precioventa1,d')
    Left = 280
    Top = 288
    object MQProductosTallesproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQProductosTallesproducto_talle: TStringField
      FieldName = 'producto_talle'
      Size = 255
    end
    object MQProductosTallesproducto_tallecodigo: TStringField
      FieldName = 'producto_tallecodigo'
      Size = 255
    end
    object MQProductosTallesproducto_talleorden: TIntegerField
      FieldName = 'producto_talleorden'
    end
    object MQProductosTallesproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
  end
  object DTSProductosTallesCodigos: TDataSource
    DataSet = MQProductosTalles
    Left = 392
    Top = 208
  end
  object ZQCurva: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from curvas'
      
        'inner join curvadetalles on curvas.curva_id=curvadetalles.curva_' +
        'id'
      'where seccion_id=:seccion_id and'
      'marca_id=:marca_id and'
      'rubro_id=:rubro_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'seccion_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'marca_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rubro_id'
        ParamType = ptUnknown
      end>
    Left = 584
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'seccion_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'marca_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rubro_id'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 136
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
      OnClick = Eliminar1Click
    end
  end
  object ZQProductoDeposito: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productodeposito')
    Params = <>
    Left = 672
    Top = 128
  end
  object ZQDepositos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from depositos'
      'order by deposito_id')
    Params = <>
    Left = 784
    Top = 128
  end
  object MQDepositosDestinos: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'deposito_id'
    CachedUpdates = True
    SQL.Strings = (
      'select i as deposito_id from temp ')
    Params = <>
    IndexFieldNames = 'deposito_id Asc'
    ConfCampos.Strings = (
      'deposito_id,i')
    Left = 504
    Top = 264
  end
  object ZQmovimdepodetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from movimdepodetalles'
      'where movimientodeposito_id=:movimientodeposito_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
  end
end
