inherited listapuntosdeventa: Tlistapuntosdeventa
  Caption = 'Sucursales'
  ExplicitWidth = 950
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      ExplicitLeft = 830
      ExplicitTop = 1
      ExplicitHeight = 335
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
        Visible = False
        ExplicitLeft = 1
        ExplicitTop = 124
        ExplicitWidth = 101
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'puntoventa_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Numero'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_descripcion'
          Title.Caption = 'Descripcion'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursal_nombre'
          Title.Caption = 'Sucursal'
          Width = 130
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      ExplicitLeft = 1
      ExplicitTop = 336
      ExplicitWidth = 932
      FullHeight = 0
      inherited btnfiltrar: TButton
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
        Width = 250
        Height = 19
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
        FieldName = 'sucursal_nombre'
        Caption = 'Nombre'
        ExplicitHeight = 21
      end
      object fil_puntoventa_descripcion: TGTBEdit
        Left = 336
        Top = 1
        Width = 280
        Height = 19
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
        FieldName = 'sucursal_domicilio'
        Caption = 'Domicilio'
        ExplicitHeight = 21
      end
      object fil_sucursal_nombre: TGTBEdit
        Left = 616
        Top = 1
        Width = 130
        Height = 19
        Align = alLeft
        TabOrder = 4
        Tag2 = 0
        FieldName = 'sucursal_nombre'
        Caption = 'Telefono'
        ExplicitHeight = 21
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
    object Label11: TLabel [0]
      Left = 39
      Top = 81
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label2: TLabel [1]
      Left = 24
      Top = 57
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descripcion'
    end
    object Label5: TLabel [2]
      Left = 43
      Top = 33
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
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
      Left = 372
      Top = 33
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Impresora Fiscal'
      Visible = False
    end
    object Label4: TLabel [5]
      Left = 417
      Top = 57
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Puerto'
      Visible = False
    end
    inherited btnguardar: TButton
      TabOrder = 6
      OnClick = btnguardarClick
    end
    inherited btncancelar: TButton
      TabOrder = 7
    end
    object sucursal_id: TSqlComboBox
      Left = 86
      Top = 78
      Width = 203
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      ConfTabla = 'sucursales'
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object puntoventa_id: TGTBEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Tag2 = 0
    end
    object puntoventa_numero: TGTBEdit
      Left = 86
      Top = 30
      Width = 121
      Height = 21
      TabOrder = 1
      Tag2 = 0
    end
    object puntoventa_descripcion: TGTBEdit
      Left = 86
      Top = 54
      Width = 203
      Height = 21
      TabOrder = 2
      Tag2 = 0
    end
    object puntoventa_controladorfiscalmodelo: TComboBox
      Left = 456
      Top = 30
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'MODELO_614'
      Visible = False
      Items.Strings = (
        'MODELO_614'
        'MODELO_615'
        'MODELO_PR4'
        'MODELO_950'
        'MODELO_951'
        'MODELO_262'
        'MODELO_PJ20'
        'MODELO_P320'
        'MODELO_715'
        'MODELO_PR5'
        'MODELO_272'
        'MODELO_PPL8'
        'MODELO_P321'
        'MODELO_P322'
        'MODELO_P425'
        'MODELO_P425_201'
        'MODELO_PPL8_201'
        'MODELO_P322_201'
        'MODELO_P330'
        'MODELO_P435'
        'MODELO_P330_201'
        'MODELO_PPL9'
        'MODELO_P330_202'
        'MODELO_P435_101'
        'MODELO_715_201'
        'MODELO_PR5_201'
        'MODELO_P435_102'
        'MODELO_PPL23'
        'MODELO_715_302'
        'MODELO_715_403'
        'MODELO_P330_203'
        'MODELO_P441'
        'MODELO_PPL23_10'
        'MODELO_P435_203'
        'MODELO_P1120')
    end
    object puntoventa_controladorfiscalpuerto: TComboBox
      Left = 456
      Top = 54
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = 'COM1'
      Visible = False
      Items.Strings = (
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'COM5'
        'COM6')
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from puntodeventa'
      
        'inner join sucursales on puntodeventa.sucursal_id=sucursales.suc' +
        'ursal_id'
      'order by puntoventa_numero')
  end
  inherited ZQuery2: TZQuery
    Left = 616
    Top = 144
  end
end
