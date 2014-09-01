inherited CargaStockLector: TCargaStockLector
  Caption = 'Carga de Stock - Lector'
  ClientHeight = 540
  ClientWidth = 790
  ExplicitWidth = 806
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 790
    Height = 540
    ExplicitWidth = 790
    ExplicitHeight = 540
    FullHeight = 0
    object Label15: TLabel [0]
      Left = 40
      Top = 42
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label3: TLabel [1]
      Left = 33
      Top = 138
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label21: TLabel [2]
      Left = 40
      Top = 90
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marca'
    end
    object Label1: TLabel [3]
      Left = 31
      Top = 66
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seccion'
    end
    object Label2: TLabel [4]
      Left = 41
      Top = 114
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rubro'
    end
    object lblNombrePrecio1: TLabel [5]
      Left = 40
      Top = 162
      Width = 30
      Height = 13
      Caption = 'Precio'
    end
    object Label6: TLabel [6]
      Left = 7
      Top = 18
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo Barras'
    end
    inherited btncancelar: TButton
      Left = 229
      Top = 162
      Caption = 'Salir'
      TabOrder = 11
      Visible = False
      ExplicitLeft = 229
      ExplicitTop = 162
    end
    inherited btnguardar: TButton
      Left = 535
      Top = 183
      Width = 98
      Caption = 'Guardar Cambios'
      Enabled = False
      TabOrder = 8
      ExplicitLeft = 535
      ExplicitTop = 183
      ExplicitWidth = 98
    end
    object producto_codigoarticulo: TEdit
      Left = 79
      Top = 39
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object producto_nombre: TEdit
      Left = 79
      Top = 135
      Width = 359
      Height = 21
      TabOrder = 5
      OnEnter = producto_nombreEnter
    end
    object marca_id: TSqlComboBox
      Left = 79
      Top = 87
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnExit = seccion_idExit
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
      Top = 63
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnExit = seccion_idExit
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
      Top = 111
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnExit = seccion_idExit
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
    object producto_precioventa1: TDBAdvEdit
      Left = 79
      Top = 159
      Width = 121
      Height = 21
      AutoThousandSeparator = False
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
      OnExit = producto_precioventa1Exit
      Version = '2.7.0.5'
    end
    object DBGrid2: TDBGrid
      Left = 463
      Top = 15
      Width = 323
      Height = 162
      DataSource = DTSProductosTallesCodigos
      PopupMenu = PopupMenu1
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_tallecodigo'
          Title.Caption = 'Codigo'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_talle'
          Title.Caption = 'Talle'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa1'
          Title.Caption = 'Precio'
          Width = 90
          Visible = True
        end>
    end
    object producto_codigobarras: TEdit
      Left = 79
      Top = 15
      Width = 225
      Height = 21
      TabOrder = 0
      OnExit = producto_codigobarrasExit
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 214
      Width = 790
      Height = 308
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 10
      object TabSheet1: TTabSheet
        Caption = 'Agregar Stock'
        OnHide = TabSheet1Hide
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 246
          Align = alTop
          DataSource = DTSProductosStock
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'producto_codigobarras'
              Title.Caption = 'Codigo Barras'
              Width = 188
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_nombre'
              Title.Caption = 'Nombre'
              Width = 414
              Visible = True
            end>
        end
        object BtnAgregarStock: TButton
          Left = 0
          Top = 252
          Width = 98
          Height = 25
          Caption = 'Agregar Stock'
          TabOrder = 1
          OnClick = BtnAgregarStockClick
        end
        object Button1: TButton
          Left = 536
          Top = 252
          Width = 98
          Height = 25
          Caption = 'Limpiar Lista'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Nuevos'
        ImageIndex = 1
        OnHide = TabSheet2Hide
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 246
          Align = alTop
          DataSource = DTSProductosNuevos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid3DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'producto_codigobarras'
              Title.Caption = 'Codigo Barras'
              Width = 188
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_nombre'
              Title.Caption = 'Nombre'
              Width = 259
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_estadostock'
              Title.Caption = 'Stock'
              Width = 148
              Visible = True
            end>
        end
        object BtnAgregarStockNuevos: TButton
          Left = 0
          Top = 252
          Width = 98
          Height = 25
          Caption = 'Agregar Stock'
          TabOrder = 1
          OnClick = BtnAgregarStockNuevosClick
        end
        object Button2: TButton
          Left = 536
          Top = 252
          Width = 98
          Height = 25
          Caption = 'Limpiar Lista'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
    object btnlimpiar: TButton
      Left = 535
      Top = 207
      Width = 98
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 9
      OnClick = btnlimpiarClick
    end
  end
  inherited ZQSelect: TZQuery
    Left = 480
    Top = 120
  end
  inherited ZQExecSQL: TZQuery
    Top = 368
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
    Left = 480
    Top = 304
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
    Left = 320
    Top = 304
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
    Left = 312
    Top = 392
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
    Left = 376
    Top = 88
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
    Left = 480
    Top = 240
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
    Left = 408
    Top = 32
    object Eliminar1: TMenuItem
      Caption = 'Quitar de la lista'
      OnClick = Eliminar1Click
    end
  end
  object ZQProductoDeposito: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productodeposito')
    Params = <>
    Left = 568
    Top = 304
  end
  object ZQDepositos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from depositos'
      'order by deposito_id')
    Params = <>
    Left = 336
    Top = 192
  end
  object MQProductosStock: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select t as producto_id,t as producto_codigobarras,t as producto' +
        '_nombre from temp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,t'
      'producto_codigobarras,t'
      'producto_nombre,t')
    Left = 88
    Top = 392
    object MQProductosStockproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQProductosStockproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 255
    end
    object MQProductosStockproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 255
    end
  end
  object MQProductosNuevos: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select t as producto_id,t as producto_codigobarras,t as producto' +
        '_nombre,t as producto_estadostock from temp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,t'
      'producto_codigobarras,t'
      'producto_nombre,t'
      'producto_estadostock,t')
    Left = 88
    Top = 320
    object MQProductosNuevosproducto_id: TStringField
      FieldName = 'producto_id'
      Size = 255
    end
    object MQProductosNuevosproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 255
    end
    object MQProductosNuevosproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 255
    end
    object MQProductosNuevosproducto_estadostock: TStringField
      FieldName = 'producto_estadostock'
      Size = 255
    end
  end
  object DTSProductosStock: TDataSource
    DataSet = MQProductosStock
    Left = 584
    Top = 72
  end
  object DTSProductosNuevos: TDataSource
    DataSet = MQProductosNuevos
    Left = 192
    Top = 376
  end
end
