inherited listaordendecarga: Tlistaordendecarga
  Caption = 'Contratos de Compra'
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
        ExplicitLeft = 1
        ExplicitTop = 124
        ExplicitWidth = 101
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'documento_fecha'
          Title.Caption = 'Fecha'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_numero'
          Title.Caption = 'Numero'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_razonsocial'
          Title.Caption = 'Entidad'
          Width = 445
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_estado'
          Title.Caption = 'Estado'
          Width = 133
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
        Width = 82
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 82
      end
      object fil_puntoventa_numero: TGTBEdit
        Left = 83
        Top = 1
        Width = 49
        Height = 19
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        FieldName = 'fil_puntoventa_numero'
        ExplicitHeight = 21
      end
      object fil_documento_numero: TGTBEdit
        Left = 132
        Top = 1
        Width = 85
        Height = 19
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
        FieldName = 'fil_documento_numero'
        ExplicitHeight = 21
      end
      object fil_entidad_razonsocial: TGTBEdit
        Left = 217
        Top = 1
        Width = 443
        Height = 19
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
        FieldName = 'fil_entidad_razonsocial'
        ExplicitHeight = 21
      end
      object fil_documento_estado: TGTBEdit
        Left = 660
        Top = 1
        Width = 136
        Height = 19
        Align = alLeft
        TabOrder = 5
        Tag2 = 0
        FieldName = 'documento_estado'
        ExplicitHeight = 21
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from documentos'
      
        'inner join entidades on documentos.entidad_id=entidades.entidad_' +
        'id'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id')
  end
end
