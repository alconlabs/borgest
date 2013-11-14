inherited ListaConfigListas: TListaConfigListas
  Caption = 'Configurar Columnas de Listas'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btneliminar: TButton
        Visible = False
      end
      inherited btnnuevo: TButton
        Visible = False
      end
      inherited btnver: TButton
        Visible = True
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'configcolumna_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'configcolumna_nombre'
          Title.Caption = 'Nombre'
          Width = 400
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_configcolumna_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 400
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'configcolumna_nombre'
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from configcolumnas')
  end
end
