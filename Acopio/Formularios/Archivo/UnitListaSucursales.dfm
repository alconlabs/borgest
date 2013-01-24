inherited listasucursales: Tlistasucursales
  Caption = 'Sucursales'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnmodificar: TButton
        ExplicitLeft = 6
        ExplicitTop = 47
      end
      inherited btnanular: TButton
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
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
    FullHeight = 0
    object Label11: TLabel [0]
      Left = 495
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
    inherited btnguardar: TButton
      TabOrder = 5
      OnClick = btnguardarClick
    end
    inherited btncancelar: TButton
      TabOrder = 6
    end
    object empresa_id: TSqlComboBox
      Left = 542
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
