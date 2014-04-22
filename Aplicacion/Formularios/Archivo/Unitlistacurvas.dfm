inherited listacurvas: Tlistacurvas
  Caption = 'Curvas'
  ExplicitWidth = 320
  ExplicitHeight = 240
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
          FieldName = 'curva_id'
          Title.Caption = 'Codigo'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'curva_descripcion'
          Title.Caption = 'Descripcion'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'marca_nombre'
          Title.Caption = 'Marca'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'seccion_nombre'
          Title.Caption = 'Seccion'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rubro_nombre'
          Title.Caption = 'Rubro'
          Width = 170
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_curva_descripcion: TGTBEdit
        Left = 85
        Top = 0
        Width = 170
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'curva_descripcion'
      end
      object fil_marca_nombre: TGTBEdit
        Left = 255
        Top = 0
        Width = 170
        Height = 21
        Align = alLeft
        TabOrder = 3
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'marca_nombre'
      end
      object fil_seccion_nombre: TGTBEdit
        Left = 425
        Top = 0
        Width = 170
        Height = 21
        Align = alLeft
        TabOrder = 4
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'seccion_nombre'
      end
      object fil_rubro_nombre: TGTBEdit
        Left = 595
        Top = 0
        Width = 170
        Height = 21
        Align = alLeft
        TabOrder = 5
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'rubro_nombre'
        ExplicitLeft = 721
        ExplicitTop = -6
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from curvas'
      'inner join marcas on curvas.marca_id=marcas.marca_id'
      'inner join secciones on curvas.seccion_id=secciones.seccion_id'
      'inner join rubros on curvas.rubro_id=rubros.rubro_id'
      'order by curva_descripcion')
  end
end
