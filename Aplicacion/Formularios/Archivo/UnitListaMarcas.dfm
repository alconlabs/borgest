inherited ListaMarcas: TListaMarcas
  Caption = 'Marcas'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnnuevo: TButton
        ExplicitLeft = 0
        ExplicitTop = 0
      end
      inherited btnver: TButton
        ExplicitTop = 205
      end
      inherited btnclonar: TButton
        ExplicitTop = 164
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'marca_id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'marca_nombre'
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from marcas'
      'order by marca_nombre')
  end
end
