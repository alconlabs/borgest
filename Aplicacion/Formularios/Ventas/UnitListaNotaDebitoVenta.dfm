inherited listanotadebitoventa: Tlistanotadebitoventa
  Caption = 'Notas de Debito de Venta'
  ClientWidth = 1057
  ExplicitWidth = 1073
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1057
    ExplicitWidth = 1057
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 954
      ExplicitLeft = 954
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Width = 954
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 71
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
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 426
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_estado'
          Title.Caption = 'Estado'
          Width = 128
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1057
      ExplicitWidth = 1057
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 954
        ExplicitLeft = 954
      end
      object fil_puntoventa_numero: TEdit
        Left = 85
        Top = 0
        Width = 46
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_documentoventa_numero: TEdit
        Left = 131
        Top = 0
        Width = 90
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_cliente_nombre: TEdit
        Left = 221
        Top = 0
        Width = 430
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_documentoventa_total: TEdit
        Left = 651
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_documentoventa_estado: TEdit
        Left = 781
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 6
      end
    end
  end
  inherited panelabm: TAdvPanel
    Width = 1057
    ExplicitWidth = 1057
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
      'order by documentoventa_fecha, documentoventa_id'
      '')
  end
end
