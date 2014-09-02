inherited ConsultaStockCurvas: TConsultaStockCurvas
  Caption = 'Consulta Stock'
  ClientHeight = 221
  ClientWidth = 399
  ExplicitWidth = 415
  ExplicitHeight = 259
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 399
    Height = 221
    ExplicitWidth = 399
    ExplicitHeight = 221
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 31
      Top = 66
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seccion'
    end
    object Label21: TLabel [1]
      Left = 40
      Top = 90
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marca'
    end
    object Label2: TLabel [2]
      Left = 41
      Top = 114
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rubro'
    end
    object Label3: TLabel [3]
      Left = 36
      Top = 18
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label4: TLabel [4]
      Left = 40
      Top = 42
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label5: TLabel [5]
      Left = 44
      Top = 138
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local'
    end
    inherited btncancelar: TButton
      Left = 15
      Top = 226
      TabOrder = 6
      Visible = False
      ExplicitLeft = 15
      ExplicitTop = 226
    end
    inherited btnguardar: TButton
      Left = 275
      Top = 170
      Caption = 'Consultar'
      TabOrder = 5
      ExplicitLeft = 275
      ExplicitTop = 170
    end
    object seccion_id: TSqlComboBox
      Left = 79
      Top = 63
      Width = 271
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from secciones'
        'order by seccion_nombre')
      ConfTabla = 'secciones'
      Confcampo_codigo = 'seccion_id'
      Confcampo_nomb = 'seccion_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object marca_id: TSqlComboBox
      Left = 79
      Top = 87
      Width = 271
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from marcas'
        'order by marca_nombre')
      ConfTabla = 'marcas'
      Confcampo_codigo = 'marca_id'
      Confcampo_nomb = 'marca_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object rubro_id: TSqlComboBox
      Left = 79
      Top = 111
      Width = 271
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from rubros'
        'order by rubro_nombre')
      ConfTabla = 'rubros'
      Confcampo_codigo = 'rubro_id'
      Confcampo_nomb = 'rubro_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object fil_producto_nombre: TEdit
      Left = 79
      Top = 15
      Width = 271
      Height = 21
      TabOrder = 0
    end
    object fil_producto_codigobarras: TEdit
      Left = 79
      Top = 39
      Width = 271
      Height = 21
      TabOrder = 1
    end
    object deposito_id: TSqlComboBox
      Left = 79
      Top = 135
      Width = 271
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 7
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from depositos'
        'order by deposito_id')
      ConfTabla = 'depositos'
      Confcampo_codigo = 'deposito_id'
      Confcampo_nomb = 'deposito_nombre'
      Tag2 = 0
      ConfTodos = True
    end
  end
  inherited ZQSelect: TZQuery
    Left = 336
    Top = 216
  end
  inherited ZQExecSQL: TZQuery
    Left = 344
    Top = 64
  end
  object ZQProductos: TZQuery
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
    Left = 176
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
end
