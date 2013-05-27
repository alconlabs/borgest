inherited listaControlEntidad: TlistaControlEntidad
  Caption = 'Lista de Control de Entidad'
  ClientHeight = 336
  ClientWidth = 772
  ExplicitWidth = 788
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelbotonera: TAdvPanel
    Width = 772
    Height = 59
    ExplicitWidth = 772
    ExplicitHeight = 59
    FullHeight = 0
    inherited btnnuevo: TAdvGlowButton
      Width = 58
      Height = 53
      ExplicitWidth = 58
      ExplicitHeight = 53
    end
    inherited btneditar: TAdvGlowButton
      Left = 63
      Width = 58
      Height = 53
      ExplicitLeft = 63
      ExplicitWidth = 58
      ExplicitHeight = 53
    end
    inherited btneliminar: TAdvGlowButton
      Left = 181
      Width = 58
      Height = 53
      ExplicitLeft = 181
      ExplicitWidth = 58
      ExplicitHeight = 53
    end
    inherited btnanular: TAdvGlowButton
      Left = 122
      Width = 58
      Height = 53
      ExplicitLeft = 122
      ExplicitWidth = 58
      ExplicitHeight = 53
    end
    inherited btnsalir: TAdvGlowButton
      Left = 710
      Top = 2
      Width = 57
      Height = 53
      ExplicitLeft = 710
      ExplicitTop = 2
      ExplicitWidth = 57
      ExplicitHeight = 53
    end
  end
  inherited fil_id: TEdit
    Left = 2
    Top = 310
    Height = 24
    Font.Height = -13
    ExplicitLeft = 2
    ExplicitTop = 310
    ExplicitHeight = 24
  end
  inherited AdvPanel1: TAdvPanel
    Top = 59
    Width = 772
    Height = 248
    ExplicitTop = 59
    ExplicitWidth = 772
    ExplicitHeight = 248
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      Width = 770
      Height = 246
      Columns = <
        item
          Expanded = False
          FieldName = 'entidad_razonsocial'
          Title.Caption = 'Entidad'
          Width = 157
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rol_nombre'
          Title.Caption = 'Roles'
          Width = 172
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidadrol_descripcion'
          Title.Caption = 'Descripci'#243'n'
          Width = 337
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Ganancia'
          Visible = False
        end>
    end
  end
  object aplicar: TAdvGlowButton [3]
    Left = 567
    Top = 310
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
    TabOrder = 3
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
      'select * from entidadrol'
      
        'inner join entidades on entidadrol.entidad_id=entidades.entidad_' +
        'id'
      'inner join roles on entidadrol.rol_id=roles.rol_id'
      'order by entidad_razonsocial')
    Left = 560
    Top = 128
  end
end
