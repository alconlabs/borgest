inherited presupuesto: Tpresupuesto
  Caption = 'Presupuesto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventadetalle_cantidad'
          Title.Caption = 'Cant.'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          Title.Caption = 'Producto'
          Width = 445
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_precio'
          Title.Caption = 'Precio'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_importe2'
          Title.Caption = 'Precio2'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_total'
          Title.Caption = 'Total'
          Width = 66
          Visible = True
        end>
    end
  end
  inherited ZQDocumentoventadetalles: TZQuery
    inherited ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField
      DisplayFormat = '0.00'
    end
    object ZQDocumentoventadetallesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQDocumentoventadetallesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
  end
end
