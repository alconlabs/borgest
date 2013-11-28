inherited LIstaFacturasDeCompras: TLIstaFacturasDeCompras
  Caption = 'Facturas de Compras'
  ClientWidth = 1035
  ExplicitWidth = 1051
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1035
    ExplicitWidth = 1035
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 932
      ExplicitLeft = 932
      FullHeight = 0
      inherited btnanular: TButton
        Visible = True
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 932
      Columns = <
        item
          Expanded = False
          FieldName = 'documentocompra_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompra_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Proveedor'
          Width = 430
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompra_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentocompra_estado'
          Title.Caption = 'Estado'
          Width = 130
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1035
      ExplicitWidth = 1035
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 932
        ExplicitLeft = 932
        ExplicitTop = 0
      end
      object fil_documentocompra_numero: TEdit
        Left = 85
        Top = 0
        Width = 90
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_proveedor_nombre: TEdit
        Left = 175
        Top = 0
        Width = 430
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_documentocompra_total: TEdit
        Left = 605
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_documentocompra_estado: TEdit
        Left = 735
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
    end
  end
  inherited panelabm: TAdvPanel
    Width = 1035
    ExplicitWidth = 1035
    FullHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Width = 1035
    ExplicitWidth = 1035
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from documentoscompras'
      
        'inner join tiposdocumento on documentoscompras.tipodocu_id=tipos' +
        'documento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join proveedores on documentoscompras.proveedor_id=proveed' +
        'ores.proveedor_id'
      'order by documentocompra_fecha, documentocompra_numero')
  end
end
