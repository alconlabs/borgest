inherited ConsultaEquipos: TConsultaEquipos
  Caption = 'Consulta de Equipos'
  ClientHeight = 515
  ClientWidth = 841
  ExplicitWidth = 857
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 841
    Height = 515
    StatusBar.BevelInner = True
    ExplicitWidth = 841
    ExplicitHeight = 515
    FullHeight = 0
    object Label2: TLabel [0]
      Left = 8
      Top = 416
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object labelsucursal: TLabel [1]
      Left = 8
      Top = 10
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    inherited btncancelar: TButton
      Left = 756
      Top = 462
      TabOrder = 4
      ExplicitLeft = 756
      ExplicitTop = 462
    end
    inherited btnguardar: TButton
      Left = 675
      Top = 462
      TabOrder = 3
      OnClick = btnguardarClick
      ExplicitLeft = 675
      ExplicitTop = 462
    end
    object equipo_tipo: TGTBComboBox
      Left = 8
      Top = 37
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = 'Equipo 1'
      Items.Strings = (
        'Equipo 1'
        'Equipo 2')
      Tag2 = 0
      valores.Strings = (
        'documentoventa_equipo1'
        'documentoventa_equipo2')
    end
    object documentoventa_equipo: TGTBEdit
      Left = 111
      Top = 37
      Width = 130
      Height = 21
      TabOrder = 0
      Tag2 = 0
    end
    object btnactualizar: TButton
      Left = 247
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 1
      OnClick = btnactualizarClick
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 63
      Width = 817
      Height = 342
      ActivePage = TabSheet1
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Notas de Pedido'
        object Label1: TLabel
          Left = 3
          Top = 189
          Width = 38
          Height = 13
          Caption = 'Detalles'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 809
          Height = 157
          Align = alTop
          DataSource = DSCDocumentosventas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
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
        object DBGrid2: TDBGrid
          Left = 0
          Top = 156
          Width = 809
          Height = 158
          TabStop = False
          Align = alBottom
          DataSource = DSCDocumentoventadetalles
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              Title.Caption = 'Cant.'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Producto'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              Title.Caption = 'Precio'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_importe3'
              Title.Caption = 'Flete'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_total'
              Title.Caption = 'Total'
              Width = 109
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Productos'
        ImageIndex = 1
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 809
          Height = 314
          TabStop = False
          Align = alClient
          DataSource = DSCProductos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'documentoventadetalle_cantidad'
              Title.Caption = 'Cant.'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Producto'
              Width = 394
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_precio'
              Title.Caption = 'Precio'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_importe3'
              Title.Caption = 'Flete'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_total'
              Title.Caption = 'Total'
              Width = 109
              Visible = True
            end>
        end
      end
    end
    object equipo_observaciones: TMemo
      Left = 85
      Top = 416
      Width = 316
      Height = 71
      TabOrder = 6
    end
    object btnimprimir: TButton
      Left = 427
      Top = 462
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 7
      OnClick = btnimprimirClick
    end
    object sucursal_id: TSqlComboBox
      Left = 55
      Top = 7
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
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
      'order by documentoventa_fecha, documentoventa_id')
    Params = <>
    Left = 584
    Top = 32
    ParamData = <>
  end
  inherited ZQExecSQL: TZQuery
    Left = 664
    Top = 248
  end
  object ZQDocumentosventas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      'order by documentoventa_fecha, documentoventa_id')
    Params = <>
    Left = 528
    Top = 128
  end
  object DSCDocumentosventas: TDataSource
    DataSet = ZQDocumentosventas
    OnDataChange = DSCDocumentosventasDataChange
    Left = 336
    Top = 128
  end
  object ZQDocumentoventadetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles')
    Params = <>
    Left = 592
    Top = 336
    object ZQDocumentoventadetallesdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQDocumentoventadetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQDocumentoventadetallesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe3: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe4: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe5: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe6: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
  end
  object DSCDocumentoventadetalles: TDataSource
    DataSet = ZQDocumentoventadetalles
    Left = 368
    Top = 328
  end
  object DSCProductos: TDataSource
    DataSet = ZQProductos
    Left = 152
    Top = 216
  end
  object ZQProductos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles')
    Params = <>
    Left = 272
    Top = 232
    object IntegerField1: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object FloatField1: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'documentoventadetalle_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object FloatField5: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object FloatField6: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object FloatField7: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object FloatField8: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object StringField2: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object StringField3: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object IntegerField2: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object FloatField9: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object IntegerField4: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object FloatField10: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object FloatField11: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object FloatField12: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object FloatField13: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object FloatField14: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object FloatField15: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
  end
end
