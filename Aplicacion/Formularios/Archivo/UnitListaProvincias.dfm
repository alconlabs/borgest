inherited ListaProvincias: TListaProvincias
  Caption = 'Provincias'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'provincia_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'provincia_nombre'
          Title.Caption = 'Provincia'
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pais_nombre'
          Title.Caption = 'Pais'
          Width = 325
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_provincia_nombre: TEdit
        Left = 85
        Top = 0
        Width = 390
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_pais_nombre: TEdit
        Left = 475
        Top = 0
        Width = 325
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 47
      Top = 9
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label5: TLabel [1]
      Left = 36
      Top = 33
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object Label11: TLabel [2]
      Left = 60
      Top = 57
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pais'
    end
    inherited btnguardar: TButton
      TabOrder = 2
      OnClick = btnguardarClick
    end
    inherited btncancelar: TButton
      TabOrder = 3
    end
    object provincia_id: TEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 4
    end
    object provincia_nombre: TEdit
      Left = 86
      Top = 30
      Width = 634
      Height = 21
      TabOrder = 0
    end
    object pais_id: TSqlComboBox
      Left = 86
      Top = 54
      Width = 203
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from paises'
        'order by pais_nombre')
      ConfTabla = 'paises'
      Confcampo_codigo = 'pais_id'
      Confcampo_nomb = 'pais_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
  end
  inherited StatusBar1: TStatusBar
    ExplicitTop = 317
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from provincias'
      'inner join paises on provincias.pais_id=paises.pais_id'
      'order by provincia_nombre')
  end
end
