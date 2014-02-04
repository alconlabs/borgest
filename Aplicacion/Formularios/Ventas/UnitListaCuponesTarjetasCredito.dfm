inherited ListaCuponesTarjetasCredito: TListaCuponesTarjetasCredito
  Caption = 'Cupones de Tarjetas de Credito'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnver: TButton
        OnClick = btnverClick
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'cupontarjeta_id'
          Title.Caption = 'Codigo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tarjeta_nombre'
          Title.Caption = 'Tarjeta'
          Width = 268
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cupontarjeta_numero'
          Title.Caption = 'Cupones'
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cupontarjeta_importe'
          Title.Caption = 'Importe'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cupontarjeta_cuotas'
          Title.Caption = 'Cuotas'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cupontarjeta_fecha'
          Title.Caption = 'Fecha'
          Width = 121
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
      inherited fil_id: TGTBEdit
        FieldName = 'cupontarjeta_id'
      end
      object fil_tarjeta_nombre: TGTBEdit
        Left = 85
        Top = 0
        Width = 268
        Height = 21
        Align = alLeft
        TabOrder = 2
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'tarjeta_nombre'
      end
      object fil_cupontarjeta_importe: TGTBEdit
        Left = 465
        Top = 0
        Width = 112
        Height = 21
        Align = alLeft
        TabOrder = 3
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'cupontarjeta_importe'
      end
      object fil_cupontarjeta_cuotas: TGTBEdit
        Left = 577
        Top = 0
        Width = 112
        Height = 21
        Align = alLeft
        TabOrder = 4
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'cupontarjeta_cuotas'
      end
      object fil_cupontarjeta_numero: TGTBEdit
        Left = 353
        Top = 0
        Width = 112
        Height = 21
        Align = alLeft
        TabOrder = 5
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'cupontarjeta_numero'
      end
      object fil_cupontarjeta_fecha: TGTBEdit
        Left = 689
        Top = 0
        Width = 112
        Height = 21
        Align = alLeft
        TabOrder = 6
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
        FieldName = 'cupontarjeta_fecha'
      end
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from cuponestarjetas'
      
        'inner join tarjetas on cuponestarjetas.tarjeta_id=tarjetas.tarje' +
        'ta_id'
      'order by cupontarjeta_fecha desc')
  end
end
