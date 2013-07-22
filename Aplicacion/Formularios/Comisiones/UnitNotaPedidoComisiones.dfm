inherited NotaPedidoComisiones: TNotaPedidoComisiones
  Caption = 'Nota de pedido - Comisiones'
  ClientHeight = 539
  ClientWidth = 917
  ExplicitWidth = 933
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 917
    Height = 539
    ExplicitWidth = 917
    ExplicitHeight = 539
    FullHeight = 0
    inherited Label2: TLabel
      Left = 757
      ExplicitLeft = 757
    end
    inherited Label4: TLabel
      Left = 627
      ExplicitLeft = 627
    end
    inherited Label8: TLabel
      Left = 580
      ExplicitLeft = 580
    end
    inherited Label12: TLabel
      Left = 598
      ExplicitLeft = 598
    end
    inherited Label13: TLabel
      Left = 375
      Top = 307
      ExplicitLeft = 375
      ExplicitTop = 307
    end
    object lblsaldocomisiones: TLabel [12]
      Left = 239
      Top = 468
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited documentoventa_fecha: TDateTimePicker
      Left = 793
      ExplicitLeft = 793
    end
    inherited personal_id: TSqlComboBox
      Left = 679
      ExplicitLeft = 679
    end
    inherited btncancelar: TButton
      Left = 835
      Top = 473
      ExplicitLeft = 835
      ExplicitTop = 473
    end
    inherited btnguardar: TButton
      Left = 754
      Top = 473
      ExplicitLeft = 754
      ExplicitTop = 473
    end
    inherited documentoventa_condicionventa: TComboBox
      Left = 679
      ExplicitLeft = 679
    end
    inherited DBGrid1: TDBGrid
      Width = 901
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
          Width = 427
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
          FieldName = 'documentoventadetalle_total'
          Title.Caption = 'Total'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_importe1'
          Title.Caption = 'Precio Esp.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'diferencia'
          Title.Caption = 'Diferencia'
          Visible = True
        end>
    end
    inherited GroupBox1: TGroupBox
      Left = 679
      Top = 392
      Width = 226
      Height = 73
      ExplicitLeft = 679
      ExplicitTop = 392
      ExplicitWidth = 226
      ExplicitHeight = 73
      inherited Label5: TLabel
        Top = 129
        Enabled = False
        Visible = False
        ExplicitTop = 129
      end
      inherited Label6: TLabel
        Top = 153
        Enabled = False
        Visible = False
        ExplicitTop = 153
      end
      inherited Label7: TLabel
        Top = 129
        Enabled = False
        Visible = False
        ExplicitTop = 129
      end
      inherited Label9: TLabel
        Top = 153
        Enabled = False
        Visible = False
        ExplicitTop = 153
      end
      inherited Label10: TLabel
        Left = 8
        Top = 25
        ExplicitLeft = 8
        ExplicitTop = 25
      end
      inherited documentoventa_neto21: TMoneyEdit
        Top = 126
        Enabled = False
        Visible = False
        ExplicitTop = 126
      end
      inherited documentoventa_iva21: TMoneyEdit
        Top = 150
        Enabled = False
        Visible = False
        ExplicitTop = 150
      end
      inherited documentoventa_neto105: TMoneyEdit
        Top = 126
        Enabled = False
        Visible = False
        ExplicitTop = 126
      end
      inherited documentoventa_iva105: TMoneyEdit
        Top = 150
        Enabled = False
        Visible = False
        ExplicitTop = 150
      end
      inherited documentoventa_total: TMoneyEdit
        Left = 61
        Top = 22
        Width = 148
        ExplicitLeft = 61
        ExplicitTop = 22
        ExplicitWidth = 148
      end
    end
    inherited documentoventa_listaprecio: TComboBox
      Left = 679
      ExplicitLeft = 679
    end
    inherited documentoventa_observacion: TGTBMemo
      Left = 375
      Top = 323
      Width = 281
      Height = 142
      ExplicitLeft = 375
      ExplicitTop = 323
      ExplicitWidth = 281
      ExplicitHeight = 142
    end
    object DBGrid2: TDBGrid
      Left = 4
      Top = 323
      Width = 357
      Height = 142
      TabStop = False
      DataSource = DTSDocuVenDetComisionesVendedores
      TabOrder = 17
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'personal_nombre'
          ReadOnly = True
          Title.Caption = 'Vendedor'
          Width = 178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_importeunit'
          Title.Caption = 'Comision'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_total'
          ReadOnly = True
          Title.Caption = 'Total'
          Width = 70
          Visible = True
        end>
    end
    object btnimprimir: TButton
      Left = 4
      Top = 473
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 18
      OnClick = btnimprimirClick
    end
  end
  inherited ZQDocumentoventadetalles: TZQuery
    OnCalcFields = ZQDocumentoventadetallesCalcFields
    object ZQDocumentoventadetallesdiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'diferencia'
      Calculated = True
    end
  end
  inherited DTSDocumentoventadetalle: TDataSource
    OnDataChange = DTSDocumentoventadetalleDataChange
  end
  object ZQPersonal: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from personal')
    Params = <>
    Left = 120
    Top = 352
  end
  object DTSDocuVenDetComisionesVendedores: TDataSource
    DataSet = ZQDocuVenDetComisionesVendedores
    Left = 200
    Top = 344
  end
  object ZQDocuVenDetComisionesVendedores: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQDocuVenDetComisionesVendedoresBeforePost
    AfterPost = ZQDocuVenDetComisionesVendedoresAfterPost
    SQL.Strings = (
      'select docuvendetcomisionesvendedores.*, '
      'personal_nombre, documentoventa_id'
      'from docuvendetcomisionesvendedores'
      
        'inner join personal on docuvendetcomisionesvendedores.personal_i' +
        'd=personal.personal_id'
      
        'inner join documentoventadetalles on docuvendetcomisionesvendedo' +
        'res.documentoventadetalle_id=documentoventadetalles.documentoven' +
        'tadetalle_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_id: TIntegerField
      FieldName = 'docuvendetcomisionvendedor_id'
    end
    object ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_importeunit: TFloatField
      FieldName = 'docuvendetcomisionvendedor_importeunit'
      DisplayFormat = '0.00'
    end
    object ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_total: TFloatField
      FieldName = 'docuvendetcomisionvendedor_total'
      DisplayFormat = '0.00'
    end
    object ZQDocuVenDetComisionesVendedoresdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
    end
    object ZQDocuVenDetComisionesVendedorespersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQDocuVenDetComisionesVendedorespersonal_nombre: TStringField
      FieldName = 'personal_nombre'
      Size = 100
    end
    object ZQDocuVenDetComisionesVendedoresdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
    end
  end
end
