inherited ListaTarjetasdeCredito: TListaTarjetasdeCredito
  Caption = 'Tarjetas de Credito'
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
          FieldName = 'tarjeta_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tarjeta_nombre'
          Title.Caption = 'Nombre'
          Width = 500
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_tarjeta_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 500
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'tarjeta_nombre'
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from tarjetas'
      'order by tarjeta_nombre')
  end
end
