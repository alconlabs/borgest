inherited listaespeciesvariedades: Tlistaespeciesvariedades
  Caption = 'Especies/Variedades'
  ExplicitWidth = 950
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
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
        ExplicitLeft = 1
        ExplicitTop = 124
        ExplicitWidth = 101
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'especie_id'
          Title.Caption = 'Codigo'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'especie_nombre'
          Title.Caption = 'Nombre'
          Width = 658
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
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
      object fil_especie_nombre: TGTBEdit
        Left = 86
        Top = 1
        Width = 659
        Height = 19
        Align = alLeft
        TabOrder = 2
        Tag2 = 0
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
      Left = 43
      Top = 33
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    inherited btnguardar: TButton
      OnClick = btnguardarClick
    end
    object especie_id: TGTBEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
      Tag2 = 0
    end
    object especie_nombre: TGTBEdit
      Left = 86
      Top = 30
      Width = 203
      Height = 21
      TabOrder = 3
      Tag2 = 0
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from especies'
      'order by especie_nombre')
  end
end
