inherited ListaFacturasVenta: TListaFacturasVenta
  Caption = 'Facturas de Venta'
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
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto.Vta.'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_numero'
          Title.Caption = 'Numero'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_razonsocial'
          Title.Caption = 'Entidad'
          Width = 356
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_total'
          Title.Caption = 'Importe'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento_estado'
          Title.Caption = 'Estado'
          Width = 105
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      inherited btnfiltrar: TButton
        TabOrder = 6
        ExplicitLeft = 828
        ExplicitTop = 1
        ExplicitHeight = 19
      end
      inherited fil_id: TGTBEdit
        ExplicitLeft = 1
        ExplicitTop = 1
      end
      object fil_puntoventa_numero: TGTBEdit
        Left = 86
        Top = 1
        Width = 49
        Height = 19
        Align = alLeft
        TabOrder = 1
        Tag2 = 0
        FieldName = 'fil_puntoventa_numero'
        ExplicitHeight = 21
      end
      object fil_documento_numero: TGTBEdit
        Left = 135
        Top = 1
        Width = 85
        Height = 19
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        FieldName = 'fil_documento_numero'
        ExplicitHeight = 21
      end
      object fil_entidad_razonsocial: TGTBEdit
        Left = 220
        Top = 1
        Width = 357
        Height = 19
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
        FieldName = 'entidad_razonsocial'
        ExplicitHeight = 21
      end
      object fil_documento_estado: TGTBEdit
        Left = 681
        Top = 1
        Width = 104
        Height = 19
        Align = alLeft
        TabOrder = 5
        Tag2 = 0
        FieldName = 'documento_estado'
        ExplicitHeight = 21
      end
      object fil_documento_total: TGTBEdit
        Left = 577
        Top = 1
        Width = 104
        Height = 19
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
        FieldName = 'documento_total'
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
