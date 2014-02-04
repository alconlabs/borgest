inherited BusquedaConceptosDebCred: TBusquedaConceptosDebCred
  Caption = 'BusquedaConceptosDebCred'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      TabOrder = 2
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Concepto'
          Width = 699
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      TabOrder = 0
      FullHeight = 0
      inherited fil_id: TGTBEdit
        TabOrder = 2
      end
      object fil_producto_nombre: TGTBEdit
        Left = 72
        Top = 0
        Width = 705
        Height = 22
        Align = alLeft
        TabOrder = 0
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        ExplicitHeight = 21
      end
    end
    inherited AdvPanel1: TAdvPanel
      TabOrder = 1
      FullHeight = 0
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from productos'
      'order by producto_nombre')
  end
end
