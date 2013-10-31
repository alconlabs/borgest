inherited ListaLiquidacionesBorradores: TListaLiquidacionesBorradores
  Caption = 'Liquidaciones Borradores'
  ExplicitWidth = 950
  ExplicitHeight = 494
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
          FieldName = 'liquidacionborrador_id'
          Title.Caption = 'Numero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'liquidacionborrador_fecha'
          Title.Caption = 'Fecha'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_nombre'
          Title.Caption = 'Vendedor'
          Width = 420
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'liquidacionborrador_total'
          Title.Caption = 'Total'
          Width = 118
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      inherited btnfiltrar: TButton
        ExplicitLeft = 831
        ExplicitTop = 0
      end
      object fil_liquidacionborrador_fecha: TGTBEdit
        Left = 85
        Top = 0
        Width = 85
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'liquidacionborrador_fecha'
      end
      object fil_personal_nombre: TGTBEdit
        Left = 170
        Top = 0
        Width = 423
        Height = 21
        Align = alLeft
        TabOrder = 3
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'personal_nombre'
      end
      object fil_liquidacionborrador_total: TGTBEdit
        Left = 593
        Top = 0
        Width = 120
        Height = 21
        Align = alLeft
        TabOrder = 4
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'liquidacionborrador_total'
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from liquidacionesborradores'
      
        'inner join personal on liquidacionesborradores.personal_id=perso' +
        'nal.personal_id')
  end
end
