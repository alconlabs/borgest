inherited ListaPerfiles: TListaPerfiles
  Caption = 'Perfiles de Seguridad'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnclonar: TButton
        OnClick = btnclonarClick
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'perfil_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'perfil_nombre'
          Title.Caption = 'Nombre'
          Width = 428
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_perfil_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 428
        Height = 21
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        FieldName = 'perfil_nombre'
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from perfiles'
      'order by perfil_nombre')
  end
end
