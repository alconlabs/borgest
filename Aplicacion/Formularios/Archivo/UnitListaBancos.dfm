inherited ListaBancos: TListaBancos
  Caption = 'Bancos'
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
          FieldName = 'banco_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'banco_nombre'
          Title.Caption = 'Banco'
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'provincia_nombre'
          Title.Caption = 'Provincia'
          Width = -1
          Visible = False
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      object fil_banco_nombre: TEdit
        Left = 85
        Top = 0
        Width = 390
        Height = 21
        Align = alLeft
        TabOrder = 2
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
      Left = 34
      Top = 33
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    inherited btnguardar: TButton
      TabOrder = 1
      OnClick = btnguardarClick
    end
    inherited btncancelar: TButton
      TabOrder = 2
    end
    object banco_id: TEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
    end
    object banco_nombre: TEdit
      Left = 86
      Top = 30
      Width = 634
      Height = 21
      TabOrder = 0
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from bancos')
  end
end
