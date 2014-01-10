inherited AjusteStock: TAjusteStock
  Caption = 'Ajuste de Stock'
  ClientHeight = 405
  ClientWidth = 722
  OnShow = FormShow
  ExplicitWidth = 738
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 722
    Height = 405
    FullHeight = 0
    object Label15: TLabel [0]
      Left = 25
      Top = 15
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label2: TLabel [1]
      Left = 573
      Top = 15
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label4: TLabel [2]
      Left = 21
      Top = 39
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label13: TLabel [3]
      Left = 12
      Top = 251
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btncancelar: TButton
      Left = 620
      Top = 342
      TabOrder = 9
      ExplicitLeft = 620
      ExplicitTop = 342
    end
    inherited btnguardar: TButton
      Left = 539
      Top = 342
      TabOrder = 8
      OnClick = btnguardarClick
      ExplicitLeft = 539
      ExplicitTop = 342
    end
    object ajustestock_id: TEdit
      Left = 72
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object ajustestock_fecha: TDateTimePicker
      Left = 609
      Top = 12
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 1
    end
    object personal_id: TSqlComboBox
      Left = 73
      Top = 36
      Width = 296
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object DBGrid1: TDBGrid
      Left = 12
      Top = 61
      Width = 693
      Height = 153
      TabStop = False
      DataSource = DTSajustestockdetalles
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ajustestockdetalle_cantidad'
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
          FieldName = 'producto_nombre'
          Title.Caption = 'Producto'
          Width = 523
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 12
      Top = 220
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 4
      OnClick = btnagregarClick
    end
    object btnmodificar: TButton
      Left = 85
      Top = 220
      Width = 75
      Height = 25
      Caption = 'Modificar'
      TabOrder = 5
      OnClick = btnmodificarClick
    end
    object btnquitar: TButton
      Left = 159
      Top = 220
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 6
      OnClick = btnquitarClick
    end
    object ajustestock_observaciones: TGTBMemo
      Left = 12
      Top = 270
      Width = 521
      Height = 98
      TabStop = False
      TabOrder = 7
      Tag2 = 0
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from ajustestock'
      'where ajustestock_id=:ajustestock_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ajustestock_id'
        ParamType = ptUnknown
      end>
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ajustestock_id'
        ParamType = ptUnknown
      end>
  end
  object ZQajustestockdetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from ajustestockdetalles'
      
        'inner join productos on ajustestockdetalles.producto_id=producto' +
        's.producto_id'
      'where ajustestock_id=:ajustestock_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ajustestock_id'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ajustestock_id'
        ParamType = ptUnknown
      end>
    object ZQajustestockdetallesajustestockdetalle_id: TIntegerField
      FieldName = 'ajustestockdetalle_id'
    end
    object ZQajustestockdetallesajustestockdetalle_cantidad: TFloatField
      FieldName = 'ajustestockdetalle_cantidad'
    end
    object ZQajustestockdetallesajustestock_id: TIntegerField
      FieldName = 'ajustestock_id'
    end
    object ZQajustestockdetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQajustestockdetallesproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
    end
    object ZQajustestockdetallesproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQajustestockdetallesproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQajustestockdetallesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQajustestockdetallesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQajustestockdetallesproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object ZQajustestockdetallesproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object ZQajustestockdetallesproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQajustestockdetallesproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object ZQajustestockdetallestipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object ZQajustestockdetallesrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object ZQajustestockdetallesproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object ZQajustestockdetallesproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object ZQajustestockdetallesproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object ZQajustestockdetallescalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object ZQajustestockdetallespoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object ZQajustestockdetallesproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQajustestockdetallesproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQajustestockdetallesproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQajustestockdetallesproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQajustestockdetallesproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQajustestockdetallesproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQajustestockdetallesproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQajustestockdetallesproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object ZQajustestockdetallesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
  object DTSajustestockdetalles: TDataSource
    DataSet = ZQajustestockdetalles
    Left = 416
    Top = 168
  end
  object ZQajustestockdetallesAnterior: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from ajustestockdetalles'
      
        'inner join productos on ajustestockdetalles.producto_id=producto' +
        's.producto_id'
      'where ajustestock_id=:ajustestock_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ajustestock_id'
        ParamType = ptUnknown
      end>
    Left = 160
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ajustestock_id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ajustestockdetalle_id'
    end
    object FloatField1: TFloatField
      FieldName = 'ajustestockdetalle_cantidad'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ajustestock_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'producto_id'
    end
    object IntegerField4: TIntegerField
      FieldName = 'producto_id_1'
    end
    object StringField1: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object StringField2: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object StringField3: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object StringField4: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object FloatField2: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object FloatField3: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object StringField5: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object FloatField4: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object IntegerField5: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'rubro_id'
    end
    object FloatField5: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object FloatField6: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object FloatField7: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object IntegerField7: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object IntegerField8: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object FloatField8: TFloatField
      FieldName = 'producto_neto1'
    end
    object FloatField9: TFloatField
      FieldName = 'producto_neto2'
    end
    object FloatField10: TFloatField
      FieldName = 'producto_neto3'
    end
    object FloatField11: TFloatField
      FieldName = 'producto_neto4'
    end
    object IntegerField9: TIntegerField
      FieldName = 'proveedor_id'
    end
    object DateField1: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object StringField6: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object IntegerField10: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object StringField7: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
end
