inherited listatiposdocumentos: Tlistatiposdocumentos
  Caption = 'Tipos de documentos'
  ExplicitWidth = 950
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btneliminar: TButton
        ExplicitLeft = 1
        ExplicitTop = 83
        ExplicitWidth = 101
      end
      inherited btnmodificar: TButton
        ExplicitLeft = 1
        ExplicitTop = 42
        ExplicitWidth = 101
      end
      inherited btnnuevo: TButton
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 101
      end
      inherited btnanular: TButton
        Visible = False
        ExplicitLeft = 1
        ExplicitTop = 124
        ExplicitWidth = 101
      end
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
      inherited btnfiltrar: TButton
        ExplicitLeft = 828
        ExplicitTop = 1
        ExplicitHeight = 19
      end
      inherited fil_id: TGTBEdit
        ExplicitLeft = 1
        ExplicitTop = 1
      end
      object fil_tipodocu_nombre: TGTBEdit
        Left = 86
        Top = 1
        Width = 400
        Height = 19
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        ExplicitHeight = 21
      end
      object fil_tipodocu_letra: TGTBEdit
        Left = 486
        Top = 1
        Width = 40
        Height = 19
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
        ExplicitHeight = 21
      end
      object fil_tipodocu_tipo: TGTBEdit
        Left = 526
        Top = 1
        Width = 80
        Height = 19
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
        ExplicitHeight = 21
      end
      object fil_puntoventa_numero: TGTBEdit
        Left = 606
        Top = 1
        Width = 70
        Height = 19
        Align = alLeft
        TabOrder = 5
        Tag2 = 0
        ExplicitHeight = 21
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
