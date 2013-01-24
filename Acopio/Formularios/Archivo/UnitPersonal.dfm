inherited personal: Tpersonal
  Caption = 'Vendedores'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnanular: TButton
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'personal_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_nombre'
          Title.Caption = 'Nombre'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_domicilio'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_telefono'
          Title.Caption = 'Telefono'
          Width = 150
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      inherited btnfiltrar: TButton
        TabOrder = 4
      end
      object fil_personal_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 250
        Height = 21
        Align = alLeft
        TabOrder = 1
        Tag2 = 0
      end
      object fil_personal_domicilio: TGTBEdit
        Left = 335
        Top = 0
        Width = 250
        Height = 21
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
      end
      object fil_personal_telefono: TGTBEdit
        Left = 585
        Top = 0
        Width = 150
        Height = 21
        Align = alLeft
        TabOrder = 3
        Tag2 = 0
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 15
      Top = 9
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label5: TLabel [1]
      Left = 11
      Top = 33
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 57
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 81
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object Label4: TLabel [4]
      Left = 368
      Top = 33
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Celular'
    end
    object Label6: TLabel [5]
      Left = 372
      Top = 57
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail'
    end
    inherited btnguardar: TButton
      TabOrder = 6
      OnClick = btnguardarClick
    end
    inherited btncancelar: TButton
      TabOrder = 7
    end
    object personal_id: TGTBEdit
      Left = 54
      Top = 6
      Width = 75
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Tag2 = 0
    end
    object personal_nombre: TGTBEdit
      Left = 54
      Top = 30
      Width = 259
      Height = 21
      TabOrder = 1
      Tag2 = 0
    end
    object personal_domicilio: TGTBEdit
      Left = 54
      Top = 54
      Width = 259
      Height = 21
      TabOrder = 2
      Tag2 = 0
    end
    object personal_telefono: TGTBEdit
      Left = 54
      Top = 78
      Width = 203
      Height = 21
      TabOrder = 3
      Tag2 = 0
    end
    object personal_celular: TGTBEdit
      Left = 406
      Top = 30
      Width = 203
      Height = 21
      TabOrder = 4
      Tag2 = 0
    end
    object personal_mail: TGTBEdit
      Left = 406
      Top = 54
      Width = 299
      Height = 21
      TabOrder = 5
      Tag2 = 0
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from personal'
      'order by personal_nombre')
  end
  inherited ZQuery2: TZQuery
    Left = 488
    Top = 168
  end
end
