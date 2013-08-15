inherited ListaProductos1: TListaProductos1
  Caption = 'Productos'
  ClientWidth = 1043
  ExplicitWidth = 1059
  ExplicitHeight = 494
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
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
          Width = 140
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
        Width = 360
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_producto_preciocosto: TEdit
        Left = 445
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 3
        ExplicitLeft = 465
      end
      object fil_producto_precioventa1: TEdit
        Left = 523
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_rubro_nombre: TEdit
        Left = 679
        Top = 0
        Width = 100
        Height = 21
        Align = alLeft
        TabOrder = 5
        ExplicitLeft = 601
      end
      object fil_proveedor_nombre: TEdit
        Left = 779
        Top = 0
        Width = 140
        Height = 21
        Align = alLeft
        TabOrder = 6
        ExplicitLeft = 711
      end
      object fil_producto_precioventa2: TEdit
        Left = 601
        Top = 0
        Width = 78
        Height = 21
        Align = alLeft
        TabOrder = 7
        ExplicitLeft = 627
        ExplicitTop = -6
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
