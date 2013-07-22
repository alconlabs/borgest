inherited ListaProductos1: TListaProductos1
  Caption = 'Productos'
  ClientWidth = 1043
  ExplicitWidth = 1059
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1043
    ExplicitWidth = 1043
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 940
      ExplicitLeft = 940
      FullHeight = 0
      inherited btnanular: TButton
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 940
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
          FieldName = 'producto_nombre'
          Title.Caption = 'Nombre'
          Width = 380
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
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
          Width = 160
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1043
      ExplicitWidth = 1043
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 940
        ExplicitLeft = 940
      end
      object fil_producto_nombre: TEdit
        Left = 85
        Top = 0
        Width = 380
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_producto_preciocosto: TEdit
        Left = 465
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_producto_precioventa1: TEdit
        Left = 543
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_rubro_nombre: TEdit
        Left = 621
        Top = 0
        Width = 110
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_proveedor_nombre: TEdit
        Left = 731
        Top = 0
        Width = 160
        Height = 21
        Align = alLeft
        TabOrder = 6
      end
    end
  end
  inherited panelabm: TAdvPanel
    Width = 1043
    ExplicitWidth = 1043
    FullHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Width = 1043
    ExplicitWidth = 1043
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      
        'inner join proveedores on productos.proveedor_id=proveedores.pro' +
        'veedor_id'
      'order by producto_nombre')
  end
end
