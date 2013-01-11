inherited ABMbase2: TABMbase2
  Caption = 'ABMbase2'
  ClientWidth = 986
  ExplicitWidth = 1002
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 986
    FullHeight = 0
    object DBGrid1: TDBGrid
      Left = 24
      Top = 16
      Width = 929
      Height = 241
      DataSource = DTSSelect
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          PickList.Strings = (
            'cliente1'
            'cliente2'
            'cliente3'
            'cliente4'
            'cliente5')
          Title.Caption = 'xcliente'
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_nombre'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Width = 221
          Visible = True
        end>
    end
  end
  inherited ZQSelect: TZQuery
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join personal on documentosventas.personal_id=personal.per' +
        'sonal_id'
      
        'inner join documentoventadetalles on documentosventas.documentov' +
        'enta_id=documentoventadetalles.documentoventa_id'
      'where documentosventas.documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 648
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object ZQSelectdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
    end
    object ZQSelectdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object ZQSelectdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object ZQSelectdocumentoventa_hora: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object ZQSelectdocumentoventa_neto21: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object ZQSelectdocumentoventa_iva21: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object ZQSelectdocumentoventa_neto105: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object ZQSelectdocumentoventa_iva105: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object ZQSelectdocumentoventa_netonogravado: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object ZQSelectdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
    end
    object ZQSelectdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQSelectdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
    end
    object ZQSelectdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
    end
    object ZQSelectdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQSelectcliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object ZQSelectpersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQSelecttipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQSelectdocumentoventa_condicionventa: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object ZQSelectdocumentoventa_fechavenc: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object ZQSelectdocumentoventa_listaprecio: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object ZQSelecttipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object ZQSelecttipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQSelecttipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQSelecttipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQSelecttipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQSelecttipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQSelecttipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQSelecttipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQSelectpuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object ZQSelecttipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQSelecttipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQSelecttipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
    end
    object ZQSelecttipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQSelecttipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQSelecttipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQSelecttipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQSelecttipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQSelectpuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object ZQSelectpuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQSelectpuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQSelectsucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQSelectcliente_id_1: TIntegerField
      FieldName = 'cliente_id_1'
    end
    object ZQSelectcliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 100
    end
    object ZQSelectcliente_domicilio: TStringField
      FieldName = 'cliente_domicilio'
      Size = 150
    end
    object ZQSelectcliente_documentonro: TStringField
      FieldName = 'cliente_documentonro'
      Size = 45
    end
    object ZQSelectcliente_documentotipo: TStringField
      FieldName = 'cliente_documentotipo'
      Size = 45
    end
    object ZQSelectcliente_telefono: TStringField
      FieldName = 'cliente_telefono'
      Size = 45
    end
    object ZQSelectcliente_celular: TStringField
      FieldName = 'cliente_celular'
      Size = 45
    end
    object ZQSelectcliente_mail: TStringField
      FieldName = 'cliente_mail'
      Size = 45
    end
    object ZQSelectcondicioniva_id: TIntegerField
      FieldName = 'condicioniva_id'
    end
    object ZQSelectcliente_listaprecio: TIntegerField
      FieldName = 'cliente_listaprecio'
    end
    object ZQSelectcliente_condicionventa: TStringField
      FieldName = 'cliente_condicionventa'
      Size = 45
    end
    object ZQSelectlocalidad_id: TIntegerField
      FieldName = 'localidad_id'
    end
    object ZQSelectcliente_observaciones: TStringField
      FieldName = 'cliente_observaciones'
      Size = 255
    end
    object ZQSelectpersonal_id_1: TIntegerField
      FieldName = 'personal_id_1'
    end
    object ZQSelectpersonal_nombre: TStringField
      FieldName = 'personal_nombre'
      Size = 100
    end
    object ZQSelectpersonal_domicilio: TStringField
      FieldName = 'personal_domicilio'
      Size = 150
    end
    object ZQSelectpersonal_telefono: TStringField
      FieldName = 'personal_telefono'
      Size = 45
    end
    object ZQSelectpersonal_celular: TStringField
      FieldName = 'personal_celular'
      Size = 45
    end
    object ZQSelectpersonal_mail: TStringField
      FieldName = 'personal_mail'
      Size = 45
    end
    object ZQSelectdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
    end
    object ZQSelectdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQSelectdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object ZQSelectdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object ZQSelectdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
    end
    object ZQSelectdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQSelectdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQSelectdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQSelectdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQSelectdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQSelectdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQSelectdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQSelectproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQSelectdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQSelectdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQSelectdocumentoventa_id_1: TIntegerField
      FieldName = 'documentoventa_id_1'
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 384
    Top = 136
  end
  object DTSSelect: TDataSource
    DataSet = ZQSelect
    Left = 512
    Top = 120
  end
end
