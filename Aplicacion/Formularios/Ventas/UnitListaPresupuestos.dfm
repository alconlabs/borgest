inherited ListaPresupuestos: TListaPresupuestos
  Caption = 'Presupuestos'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnanular: TButton
        Visible = True
      end
      inherited btnver: TButton
        Visible = True
        OnClick = btnverClick
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 430
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 130
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      inherited fil_id: TGTBEdit
        Width = 95
        ExplicitWidth = 95
      end
      object fil_puntoventa_numero: TEdit
        Left = 95
        Top = 0
        Width = 46
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_documentoventa_numero: TEdit
        Left = 141
        Top = 0
        Width = 90
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_cliente_nombre: TEdit
        Left = 231
        Top = 0
        Width = 430
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_documentoventa_total: TEdit
        Left = 661
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      'order by documentoventa_fecha, documentoventa_id')
  end
end
