inherited MovimientosDepositos: TMovimientosDepositos
  Caption = 'Movimiento entre depositos - Enviar Productos'
  ClientHeight = 415
  ClientWidth = 848
  ExplicitWidth = 864
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 848
    Height = 415
    ExplicitWidth = 848
    ExplicitHeight = 415
    FullHeight = 0
    object Labelsucursal: TLabel [0]
      Left = 18
      Top = 10
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Deposito Origen'
    end
    object Label2: TLabel [1]
      Left = 693
      Top = 10
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label13: TLabel [2]
      Left = 4
      Top = 243
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label1: TLabel [3]
      Left = 13
      Top = 34
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Deposito Destino'
    end
    inherited btncancelar: TButton
      Left = 756
      Top = 334
      ExplicitLeft = 756
      ExplicitTop = 334
    end
    inherited btnguardar: TButton
      Left = 675
      Top = 334
      ExplicitLeft = 675
      ExplicitTop = 334
    end
    object deposito_idorigen: TSqlComboBox
      Left = 100
      Top = 7
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from depositos'
        'order by deposito_nombre')
      Confcampo_codigo = 'deposito_id'
      Confcampo_nomb = 'deposito_nombre'
      Tag2 = 0
    end
    object movimientodeposito_fecha: TDateTimePicker
      Left = 729
      Top = 7
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 58
      Width = 836
      Height = 153
      TabStop = False
      DataSource = DTSmovimdepodetalles
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Producto'
          Width = 523
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'movimdepodetalle_cantidadenviar'
          Title.Caption = 'Cant.'
          Width = 87
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 4
      Top = 212
      Width = 75
      Height = 25
      Caption = 'Agregar'
      Enabled = False
      TabOrder = 5
    end
    object btnmodificar: TButton
      Left = 77
      Top = 212
      Width = 75
      Height = 25
      Caption = 'Modificar'
      Enabled = False
      TabOrder = 6
    end
    object btnquitar: TButton
      Left = 151
      Top = 212
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 7
      OnClick = btnquitarClick
    end
    object movimientodeposito_observaciones: TGTBMemo
      Left = 4
      Top = 262
      Width = 521
      Height = 98
      TabStop = False
      TabOrder = 8
      Tag2 = 0
    end
    object deposito_iddestino: TSqlComboBox
      Left = 100
      Top = 31
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 9
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from depositos'
        'order by deposito_nombre')
      Confcampo_codigo = 'deposito_id'
      Confcampo_nomb = 'deposito_nombre'
      Tag2 = 0
    end
    object Button1: TButton
      Left = 697
      Top = 212
      Width = 138
      Height = 25
      Caption = 'Productos en Stock'
      TabOrder = 10
      OnClick = Button1Click
    end
    object btnimprimir: TButton
      Left = 4
      Top = 366
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 11
      OnClick = btnimprimirClick
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from movimientosdepositos'
      'where movimientodeposito_id=:movimientodeposito_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 664
    Top = 192
  end
  object ZQmovimdepodetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from movimdepodetalles'
      
        'inner join productos on movimdepodetalles.producto_id=productos.' +
        'producto_id'
      'where movimientodeposito_id=:movimientodeposito_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    Left = 680
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    object ZQmovimdepodetallesmovimdepodetalle_id: TIntegerField
      FieldName = 'movimdepodetalle_id'
    end
    object ZQmovimdepodetallesmovimdepodetalle_cantidadenviar: TFloatField
      FieldName = 'movimdepodetalle_cantidadenviar'
    end
    object ZQmovimdepodetallesmovimdepodetalle_cantidadrecibir: TFloatField
      FieldName = 'movimdepodetalle_cantidadrecibir'
    end
    object ZQmovimdepodetallesmovimdepodetalle_estado: TStringField
      FieldName = 'movimdepodetalle_estado'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQmovimdepodetallesmovimientodeposito_id: TIntegerField
      FieldName = 'movimientodeposito_id'
    end
    object ZQmovimdepodetallesproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
    end
    object ZQmovimdepodetallesproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQmovimdepodetallesproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQmovimdepodetallesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object ZQmovimdepodetallesproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object ZQmovimdepodetallesproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object ZQmovimdepodetallestipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object ZQmovimdepodetallesrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object ZQmovimdepodetallesproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object ZQmovimdepodetallesproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object ZQmovimdepodetallesproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object ZQmovimdepodetallescalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object ZQmovimdepodetallespoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object ZQmovimdepodetallesproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQmovimdepodetallesproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQmovimdepodetallesproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQmovimdepodetallesproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQmovimdepodetallesproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQmovimdepodetallesproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQmovimdepodetallesproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object ZQmovimdepodetallesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
  object DTSmovimdepodetalles: TDataSource
    DataSet = ZQmovimdepodetalles
    Left = 480
    Top = 192
  end
  object ZQmovimdepodetallesAnterior: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from movimdepodetalles'
      
        'inner join productos on movimdepodetalles.producto_id=productos.' +
        'producto_id'
      'where movimientodeposito_id=:movimientodeposito_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    Left = 512
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'movimdepodetalle_id'
    end
    object FloatField1: TFloatField
      FieldName = 'movimdepodetalle_cantidadenviar'
    end
    object FloatField2: TFloatField
      FieldName = 'movimdepodetalle_cantidadrecibir'
    end
    object StringField1: TStringField
      FieldName = 'movimdepodetalle_estado'
      Size = 45
    end
    object IntegerField2: TIntegerField
      FieldName = 'producto_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'movimientodeposito_id'
    end
    object IntegerField4: TIntegerField
      FieldName = 'producto_id_1'
    end
    object StringField2: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object StringField3: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object StringField4: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object StringField5: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object FloatField3: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object FloatField4: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object StringField6: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object FloatField5: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object IntegerField5: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'rubro_id'
    end
    object FloatField6: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object FloatField7: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object FloatField8: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object IntegerField7: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object IntegerField8: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object FloatField9: TFloatField
      FieldName = 'producto_neto1'
    end
    object FloatField10: TFloatField
      FieldName = 'producto_neto2'
    end
    object FloatField11: TFloatField
      FieldName = 'producto_neto3'
    end
    object FloatField12: TFloatField
      FieldName = 'producto_neto4'
    end
    object IntegerField9: TIntegerField
      FieldName = 'proveedor_id'
    end
    object DateField1: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object StringField7: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object IntegerField10: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object StringField8: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
end
