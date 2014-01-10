inherited ListaAjustedeStock: TListaAjustedeStock
  Caption = 'Ajustes de stock'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnnuevo: TButton
        ExplicitLeft = 6
        ExplicitTop = -6
      end
      inherited btnanular: TButton
        Visible = True
      end
      inherited btnver: TButton
        Visible = True
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ajustestock_id'
          Title.Caption = 'Numero'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ajustestock_fecha'
          Title.Caption = 'Fecha'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'personal_nombre'
          Title.Caption = 'Usuario'
          Width = 530
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      inherited fil_id: TGTBEdit
        FieldName = 'ajustestock_id'
      end
      object fil_ajustestock_fecha: TGTBEdit
        Left = 85
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'ajustestock_fecha'
      end
      object fil_personal_nombre: TGTBEdit
        Left = 215
        Top = 0
        Width = 530
        Height = 21
        Align = alLeft
        TabOrder = 3
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'personal_nombre'
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from ajustestock'
      
        'inner join personal on ajustestock.personal_id=personal.personal' +
        '_id')
  end
end
