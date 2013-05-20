inherited listaconceptosdebcred: Tlistaconceptosdebcred
  Caption = 'Conceptos Debitos Creditos'
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
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_nombre'
          Title.Caption = 'Descripcion'
          Width = 552
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_producto_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 556
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
      end
    end
  end
  inherited panelabm: TAdvPanel
    ExplicitTop = 342
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from productos'
      'where producto_tipo="CONCEPTO"'
      'order by producto_nombre')
  end
  inherited ZQuery2: TZQuery
    Left = 464
    Top = 128
  end
end
