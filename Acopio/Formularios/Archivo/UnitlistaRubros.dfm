inherited listaRubros: TlistaRubros
  Caption = 'Lista de Rubros'
  ClientHeight = 449
  ClientWidth = 494
  ExplicitWidth = 510
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelbotonera: TAdvPanel
    Width = 494
    Height = 57
    ExplicitWidth = 494
    ExplicitHeight = 57
    FullHeight = 0
    inherited btnnuevo: TAdvGlowButton
      Width = 56
      Height = 50
      ExplicitWidth = 56
      ExplicitHeight = 50
    end
    inherited btneditar: TAdvGlowButton
      Left = 62
      Width = 56
      Height = 50
      ExplicitLeft = 62
      ExplicitWidth = 56
      ExplicitHeight = 50
    end
    inherited btneliminar: TAdvGlowButton
      Left = 178
      Width = 56
      Height = 50
      ExplicitLeft = 178
      ExplicitWidth = 56
      ExplicitHeight = 50
    end
    inherited btnanular: TAdvGlowButton
      Left = 120
      Width = 56
      Height = 50
      ExplicitLeft = 120
      ExplicitWidth = 56
      ExplicitHeight = 50
    end
    inherited btnsalir: TAdvGlowButton
      Left = 433
      Top = 2
      Width = 56
      Height = 50
      ExplicitLeft = 433
      ExplicitTop = 2
      ExplicitWidth = 56
      ExplicitHeight = 50
    end
  end
  inherited fil_id: TEdit
    Left = 5
    Top = 396
    Height = 24
    Font.Height = -13
    ExplicitLeft = 5
    ExplicitTop = 396
    ExplicitHeight = 24
  end
  inherited AdvPanel1: TAdvPanel
    Top = 57
    Width = 494
    Height = 338
    ExplicitTop = 57
    ExplicitWidth = 494
    ExplicitHeight = 338
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      Width = 492
      Height = 336
      Columns = <
        item
          Expanded = False
          FieldName = 'rubro_codi'
          Title.Alignment = taCenter
          Title.Caption = 'C'#242'digo'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rubro_nombre'
          Title.Alignment = taCenter
          Title.Caption = 'Descripci'#242'n'
          Width = 356
          Visible = True
        end>
    end
  end
  object fil_rubro_nombre: TEdit [3]
    Left = 118
    Top = 396
    Width = 361
    Height = 24
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnChange = fil_idChange
  end
  object aplicar: TAdvGlowButton [4]
    Left = 269
    Top = 421
    Width = 205
    Height = 21
    Cursor = crHandPoint
    Caption = 'Aplicar Filtros'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    FocusType = ftHot
    ParentFont = False
    TabOrder = 4
    OnClick = aplicarClick
    Appearance.BorderColor = 9598070
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 15586496
    Appearance.ColorTo = 15128792
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 15586496
    Appearance.ColorMirrorTo = 13152947
    Appearance.ColorMirrorHot = 5888767
    Appearance.ColorMirrorHotTo = 10807807
    Appearance.ColorMirrorDown = 946929
    Appearance.ColorMirrorDownTo = 5021693
    Appearance.ColorMirrorChecked = 10480637
    Appearance.ColorMirrorCheckedTo = 5682430
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
    Appearance.GradientHot = ggVertical
    Appearance.GradientMirrorHot = ggVertical
    Appearance.GradientDown = ggVertical
    Appearance.GradientMirrorDown = ggVertical
    Appearance.GradientChecked = ggVertical
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from rubros'
      'order by rubro_codi')
    Left = 296
    Top = 224
  end
  inherited DSCgrilla: TDataSource
    Left = 208
    Top = 248
  end
  inherited ZQuery2: TZQuery
    Left = 288
    Top = 152
  end
  inherited CustomizeGrid1: TCustomizeGrid
    Left = 160
    Top = 152
  end
end
