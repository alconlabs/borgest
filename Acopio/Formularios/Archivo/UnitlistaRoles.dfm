inherited listaRoles: TlistaRoles
  Caption = 'Lista de Roles'
  ClientHeight = 385
  ClientWidth = 479
  OnActivate = FormActivate
  ExplicitWidth = 495
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelbotonera: TAdvPanel
    Width = 479
    Height = 51
    ExplicitWidth = 479
    ExplicitHeight = 51
    FullHeight = 0
    inherited btnnuevo: TAdvGlowButton
      Left = 3
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 3
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btneditar: TAdvGlowButton
      Left = 59
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 59
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btneliminar: TAdvGlowButton
      Left = 171
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 171
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btnanular: TAdvGlowButton
      Left = 115
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 115
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btnsalir: TAdvGlowButton
      Left = 421
      Top = 2
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 421
      ExplicitTop = 2
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
  end
  inherited fil_id: TEdit
    Left = 2
    Top = 333
    Height = 24
    Font.Height = -13
    ExplicitLeft = 2
    ExplicitTop = 333
    ExplicitHeight = 24
  end
  inherited AdvPanel1: TAdvPanel
    Top = 51
    Width = 479
    Height = 280
    ExplicitTop = 51
    ExplicitWidth = 479
    ExplicitHeight = 280
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      Width = 477
      Height = 278
      Columns = <
        item
          Expanded = False
          FieldName = 'rol_id'
          Title.Caption = 'C'#243'digo'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rol_nombre'
          Title.Caption = 'Roles'
          Width = 345
          Visible = True
        end>
    end
  end
  object fil_rol_nombre: TEdit [3]
    Left = 112
    Top = 333
    Width = 359
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
    Left = 266
    Top = 358
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
      'SELECT * FROM ROLES '
      'order by rol_id')
    Left = 168
  end
  inherited DSCgrilla: TDataSource
    Left = 240
  end
  inherited ZQuery2: TZQuery
    Left = 360
    Top = 160
  end
  inherited CustomizeGrid1: TCustomizeGrid
    Left = 112
    Top = 144
  end
end
