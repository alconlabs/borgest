inherited ConsultaStock: TConsultaStock
  Caption = 'Consulta de Stock'
  ClientHeight = 469
  ClientWidth = 982
  ExplicitWidth = 998
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 982
    Height = 469
    ExplicitWidth = 982
    ExplicitHeight = 469
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 32
      Top = 14
      Width = 75
      Height = 13
      Caption = 'Pto. Reposicion'
      OnClick = Label1Click
    end
    object Label2: TLabel [1]
      Left = 160
      Top = 14
      Width = 64
      Height = 13
      Caption = 'Stock Minimo'
      OnClick = Label2Click
    end
    object Label3: TLabel [2]
      Left = 288
      Top = 14
      Width = 44
      Height = 13
      Caption = 'En Stock'
      OnClick = Label3Click
    end
    inherited btncancelar: TButton
      Left = 588
      Top = 414
      ExplicitLeft = 588
      ExplicitTop = 414
    end
    inherited btnguardar: TButton
      Left = 894
      Top = 415
      Caption = 'Imprimir'
      ExplicitLeft = 894
      ExplicitTop = 415
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 40
      Width = 953
      Height = 369
      DataSource = DSCProductos
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo1'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_codigo'
          Title.Caption = 'Codigo2'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Nombre'
          Width = 494
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producdepo_stockactual'
          Title.Caption = 'Stock'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producdepo_puntorepos'
          Title.Caption = 'Pto.Rep.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producdepo_stockminimo'
          Title.Caption = 'Minimo'
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 366
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object producdepo_stockactual: TCheckBox
      Left = 272
      Top = 13
      Width = 17
      Height = 17
      TabOrder = 4
    end
    object producdepo_stockminimo: TCheckBox
      Left = 144
      Top = 13
      Width = 17
      Height = 17
      TabOrder = 5
    end
    object producdepo_puntorepos: TCheckBox
      Left = 16
      Top = 13
      Width = 17
      Height = 17
      TabOrder = 6
    end
  end
  inherited ZQSelect: TZQuery
    SQL.Strings = (
      'select * from productos'
      
        'inner join productodeposito on productos.producto_id=productodep' +
        'osito.producto_id')
    Params = <>
    Left = 856
    Top = 328
    ParamData = <>
    object ZQSelectproducto_id: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object ZQSelectproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQSelectproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQSelectproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQSelectproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQSelectproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object ZQSelectproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object ZQSelectproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQSelectproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object ZQSelecttipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
      Required = True
    end
    object ZQSelectrubro_id: TIntegerField
      FieldName = 'rubro_id'
      Required = True
    end
    object ZQSelectproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object ZQSelectproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object ZQSelectproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object ZQSelectcalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
      Required = True
    end
    object ZQSelectpoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
      Required = True
    end
    object ZQSelectproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQSelectproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQSelectproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQSelectproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQSelectproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
      Required = True
    end
    object ZQSelectproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQSelectproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQSelectproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object ZQSelectproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
    object ZQSelectproducdepo_id: TIntegerField
      FieldName = 'producdepo_id'
      Required = True
    end
    object ZQSelectproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
      DisplayFormat = '0.00'
    end
    object ZQSelectproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
      Required = True
    end
    object ZQSelectdeposito_id: TIntegerField
      FieldName = 'deposito_id'
      Required = True
    end
    object ZQSelectproducdepo_stockminimo: TFloatField
      FieldName = 'producdepo_stockminimo'
      DisplayFormat = '0.00'
    end
    object ZQSelectproducdepo_puntorepos: TFloatField
      FieldName = 'producdepo_puntorepos'
      DisplayFormat = '0.00'
    end
    object ZQSelectproducdepo_stockinicial: TFloatField
      FieldName = 'producdepo_stockinicial'
    end
  end
  inherited ZQExecSQL: TZQuery
    SQL.Strings = (
      'select * from productos')
    Params = <>
    Left = 712
    Top = 280
    ParamData = <>
  end
  object DSCProductos: TDataSource
    DataSet = ZQSelect
    Left = 560
    Top = 336
  end
end
