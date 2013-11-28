inherited ListaProductos1: TListaProductos1
  Caption = 'Productos'
  ClientWidth = 1045
  ExplicitWidth = 1061
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1045
    ExplicitWidth = 1045
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 942
      ExplicitLeft = 942
      FullHeight = 0
      inherited btnver: TButton
        Visible = True
        OnClick = btnverClick
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 942
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_codigo'
          Title.Caption = 'Codigo2'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Nombre'
          Width = 360
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_preciocosto'
          Title.Caption = 'P.Compra'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa1'
          Title.Caption = 'P.Venta'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa2'
          Title.Caption = 'P.Venta2'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa3'
          Title.Caption = 'P.Venta3'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_precioventa4'
          Title.Caption = 'P.Venta4'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producdepo_stockactual'
          Title.Caption = 'Stock'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_fechaactualizacionprecio'
          Title.Caption = 'Fecha Act.'
          Width = 73
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1045
      ExplicitWidth = 1045
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 942
        ExplicitLeft = 942
        ExplicitTop = 0
      end
      object fil_producto_nombre: TGTBEdit
        Left = 170
        Top = 0
        Width = 360
        Height = 21
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        FieldName = 'producto_nombre'
      end
      object fil_producto_preciocosto: TGTBEdit
        Left = 530
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
        FieldName = 'producto_preciocosto'
      end
      object fil_producto_precioventa1: TGTBEdit
        Left = 608
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
        FieldName = 'producto_precioventa1'
      end
      object fil_rubro_nombre: TGTBEdit
        Left = 962
        Top = 0
        Width = 100
        Height = 21
        Align = alLeft
        TabOrder = 5
        Tag2 = 0
        FieldName = 'rubro_nombre'
      end
      object fil_proveedor_nombre: TGTBEdit
        Left = 1062
        Top = 0
        Width = 140
        Height = 21
        Align = alLeft
        TabOrder = 6
        Tag2 = 0
        FieldName = 'proveedor_nombre'
      end
      object fil_producto_precioventa2: TGTBEdit
        Left = 686
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 7
        Tag2 = 0
        FieldName = 'producto_precioventa2'
      end
      object fil_producto_precioventa3: TGTBEdit
        Left = 764
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 8
        Tag2 = 0
        FieldName = 'producto_precioventa3'
      end
      object fil_producto_precioventa4: TGTBEdit
        Left = 842
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 9
        Tag2 = 0
        FieldName = 'producto_precioventa4'
      end
      object fil_producdepo_stockactual: TGTBEdit
        Left = 920
        Top = 0
        Width = 42
        Height = 21
        Align = alLeft
        TabOrder = 10
        Tag2 = 0
        FieldName = 'producdepo_stockactual'
      end
      object fil_producto_codigo: TGTBEdit
        Left = 85
        Top = 0
        Width = 85
        Height = 21
        Align = alLeft
        TabOrder = 11
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'producto_codigo'
      end
      object fil_producto_fechaactualizacionprecio: TGTBEdit
        Left = 1202
        Top = 0
        Width = 76
        Height = 21
        Align = alLeft
        TabOrder = 12
        Tag2 = 0
        FieldName = 'producto_fechaactualizacionprecio'
      end
    end
  end
  inherited panelabm: TAdvPanel
    Width = 1045
    ExplicitWidth = 1045
    FullHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Width = 1045
    ExplicitWidth = 1045
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      
        'inner join proveedores on productos.proveedor_id=proveedores.pro' +
        'veedor_id'
      
        'inner join productodeposito on productos.producto_id=productodep' +
        'osito.producto_id'
      'order by producto_nombre')
    Left = 256
    Top = 128
  end
end
