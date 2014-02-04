inherited listasucursales: Tlistasucursales
  Caption = 'Sucursales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Height = 262
    ExplicitHeight = 262
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Height = 241
      ExplicitHeight = 241
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Height = 241
      Columns = <
        item
          Expanded = False
          FieldName = 'sucursal_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursal_nombre'
          Title.Caption = 'Nombre'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursal_domicilio'
          Title.Caption = 'Domicilio'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursal_telefono'
          Title.Caption = 'Telefono'
          Width = 130
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Top = 241
      ExplicitTop = 241
      FullHeight = 0
      object fil_sucursal_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 250
        Height = 21
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        FieldName = 'sucursal_nombre'
        Caption = 'Nombre'
      end
      object fil_sucursal_domicilio: TGTBEdit
        Left = 335
        Top = 0
        Width = 280
        Height = 21
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
        FieldName = 'sucursal_domicilio'
        Caption = 'Domicilio'
      end
      object fil_sucursal_telefono: TGTBEdit
        Left = 615
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
        FieldName = 'sucursal_telefono'
        Caption = 'Telefono'
      end
    end
  end
  inherited panelabm: TAdvPanel
    Top = 281
    Height = 175
    ExplicitTop = 281
    ExplicitHeight = 175
    FullHeight = 0
    object Label11: TLabel [0]
      Left = 543
      Top = 33
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa'
    end
    object Label2: TLabel [1]
      Left = 38
      Top = 57
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object Label5: TLabel [2]
      Left = 43
      Top = 33
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label1: TLabel [3]
      Left = 47
      Top = 9
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label3: TLabel [4]
      Left = 38
      Top = 81
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object Label4: TLabel [5]
      Left = 453
      Top = 57
      Width = 133
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Liquidacion Sucursales'
    end
    object Label6: TLabel [6]
      Left = 448
      Top = 81
      Width = 138
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Liquidacion Vendedores'
    end
    object Label8: TLabel [7]
      Left = 48
      Top = 105
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    object Label7: TLabel [8]
      Left = 462
      Top = 105
      Width = 124
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Documento a liquidar'
    end
    inherited btnguardar: TButton
      Left = 819
      Top = 30
      TabOrder = 8
      OnClick = btnguardarClick
      ExplicitLeft = 819
      ExplicitTop = 30
    end
    inherited btncancelar: TButton
      Left = 819
      Top = 61
      TabOrder = 9
      ExplicitLeft = 819
      ExplicitTop = 61
    end
    object empresa_id: TSqlComboBox
      Left = 590
      Top = 30
      Width = 203
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from empresas'
        'order by empresa_nombre')
      ConfTabla = 'empresas'
      Confcampo_codigo = 'empresa_id'
      Confcampo_nomb = 'empresa_nombre'
      Tag2 = 0
    end
    object sucursal_id: TGTBEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Tag2 = 0
    end
    object sucursal_nombre: TGTBEdit
      Left = 86
      Top = 30
      Width = 203
      Height = 21
      TabOrder = 1
      Tag2 = 0
    end
    object sucursal_domicilio: TGTBEdit
      Left = 86
      Top = 54
      Width = 347
      Height = 21
      TabOrder = 2
      Tag2 = 0
    end
    object sucursal_telefono: TGTBEdit
      Left = 86
      Top = 78
      Width = 203
      Height = 21
      TabOrder = 3
      Tag2 = 0
    end
    object sucursal_tipoliquidsucursal: TComboBox
      Left = 592
      Top = 54
      Width = 201
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Precio Final'
        'Neto')
    end
    object sucursal_tipoliquidvendedor: TComboBox
      Left = 592
      Top = 78
      Width = 201
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        'Precio Final'
        'Neto')
    end
    object cliente_id: TSqlComboBox
      Left = 86
      Top = 102
      Width = 317
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 10
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from clientes'
        'order by cliente_nombre')
      Confcampo_codigo = 'cliente_id'
      Confcampo_nomb = 'cliente_nombre'
      Tag2 = 0
    end
    object sucursal_tipodocumentoliquidar: TComboBox
      Left = 592
      Top = 102
      Width = 201
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'Facturas de Venta'
      Items.Strings = (
        'Facturas de Venta'
        'Recibos')
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 262
    ExplicitTop = 262
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from sucursales'
      'order by sucursal_nombre')
  end
  inherited ZQuery2: TZQuery
    Left = 616
    Top = 144
  end
end
