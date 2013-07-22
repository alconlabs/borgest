inherited ListaCalculosPrecios1: TListaCalculosPrecios1
  Caption = 'Calculos de Precios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'calculoprecio_id'
          Title.Caption = 'Codigo'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calculoprecio_nombre'
          Title.Caption = 'Nombre'
          Width = 600
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_calculoprecio_nombre: TEdit
        Left = 85
        Top = 0
        Width = 600
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from calculoprecios'
      'order by calculoprecio_nombre')
  end
end
