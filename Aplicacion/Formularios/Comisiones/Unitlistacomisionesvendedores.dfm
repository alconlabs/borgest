inherited listacomisionesvendedores: Tlistacomisionesvendedores
  Caption = 'LIquidaciones a Vendedores'
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
          FieldName = 'liquidacionvendedor_id'
          Title.Caption = 'Numero'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'liquidacionvendedor_fecha'
          Title.Caption = 'Fecha'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_nombre'
          Title.Caption = 'Vendedor'
          Width = 396
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'liquidacionvendedor_total'
          Title.Caption = 'Importe'
          Width = 102
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_liquidacionvendedor_fecha: TEdit
        Left = 85
        Top = 0
        Width = 85
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_personal_nombre: TEdit
        Left = 170
        Top = 0
        Width = 400
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_liquidacionvendedor_total: TEdit
        Left = 570
        Top = 0
        Width = 100
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from liquidacionesvendedores'
      
        'inner join personal on liquidacionesvendedores.personal_id=perso' +
        'nal.personal_id'
      'order by liquidacionvendedor_fecha')
  end
end
