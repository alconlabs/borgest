inherited listatiposdocumentos: Tlistatiposdocumentos
  Caption = 'Tipos de documentos'
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
          FieldName = 'tipodocu_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_nombre'
          Title.Caption = 'Nombre'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_letra'
          Title.Caption = 'Letra'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_tipo'
          Title.Caption = 'Tipo'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto.Venta'
          Width = 70
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_tipodocu_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 400
        Height = 21
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
      end
      object fil_tipodocu_letra: TGTBEdit
        Left = 485
        Top = 0
        Width = 40
        Height = 21
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
      end
      object fil_tipodocu_tipo: TGTBEdit
        Left = 525
        Top = 0
        Width = 80
        Height = 21
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
      end
      object fil_puntoventa_numero: TGTBEdit
        Left = 605
        Top = 0
        Width = 70
        Height = 21
        Align = alLeft
        TabOrder = 5
        Tag2 = 0
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from tiposdocumento'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'order by tipodocu_nombre, tipodocu_letra, tipodocu_debcred')
  end
end
