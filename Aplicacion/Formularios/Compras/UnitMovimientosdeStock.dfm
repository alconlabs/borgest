inherited MovimientosdeStock: TMovimientosdeStock
  Caption = 'Movimientos de Stock'
  ClientHeight = 445
  ClientWidth = 713
  ExplicitWidth = 729
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 713
    Height = 445
    StatusBar.BevelInner = True
    ExplicitWidth = 1055
    ExplicitHeight = 483
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 31
      Top = 15
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Producto'
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 47
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comprobantes'
    end
    inherited btncancelar: TButton
      Left = 900
      Top = 270
      TabOrder = 5
      ExplicitLeft = 900
      ExplicitTop = 270
    end
    inherited btnguardar: TButton
      Left = 819
      Top = 270
      TabOrder = 4
      ExplicitLeft = 819
      ExplicitTop = 270
    end
    object producto_id: TEditCodi
      Left = 80
      Top = 12
      Width = 121
      Height = 21
      Flat = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 0
      Visible = True
      OnKeyPress = producto_idKeyPress
      Version = '1.3.0.1'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      OnClickBtn = producto_idClickBtn
      abm = False
      ConfCampoCodigo = 'producto_id'
      ConfCampoCodigo1 = 'producto_codigo'
      ConfCampoCodigo2 = 'producto_codigobarras'
      ConfCampoTexto = 'producto_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from productos'
        
          'left join politicasdeprecios on productos.politicaprecio_id=poli' +
          'ticasdeprecios.politicaprecio_id'
        'where producto_tipo="PRODUCTO"'
        'order by producto_nombre')
      ConfTexto = producto_nombre
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'producto_codigo'
    end
    object producto_nombre: TEdit
      Left = 205
      Top = 12
      Width = 417
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 80
      Top = 39
      Width = 623
      Height = 376
      DataSource = DTSDocumentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'tipodocu_nombreabrev'
          Title.Caption = 'Documento'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_tipo'
          Title.Caption = 'Tipo'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_fecha'
          Title.Caption = 'Fecha'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_numero'
          Title.Caption = 'Numero'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_nombre'
          Title.Caption = 'Entidad'
          Width = 274
          Visible = True
        end>
    end
    object btnactualizar: TButton
      Left = 628
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 2
      OnClick = btnactualizarClick
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 272
    Top = 120
  end
  object DTSDocumentos: TDataSource
    DataSet = MQDocumentos
    Left = 352
    Top = 224
  end
  object MQDocumentos: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'documento_fecha; documento_numero'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as documento_id,t as tipodocu_nombre,t as tipodocu_tipo' +
        ',t as tipodocu_letra,i as tipodocu_stock,t as tipodocu_nombreabr' +
        'ev,t as puntoventa_numero,i as documento_numero,f as documento_f' +
        'echa,t as entidad_nombre from temp ')
    Params = <>
    IndexFieldNames = 'documento_fecha Asc; documento_numero Asc'
    ConfCampos.Strings = (
      'documento_id,i'
      'tipodocu_nombre,t'
      'tipodocu_tipo,t'
      'tipodocu_letra,t'
      'tipodocu_stock,i'
      'tipodocu_nombreabrev,t'
      'puntoventa_numero,t'
      'documento_numero,i'
      'documento_fecha,f'
      'entidad_nombre,t')
    Left = 480
    Top = 240
  end
end
