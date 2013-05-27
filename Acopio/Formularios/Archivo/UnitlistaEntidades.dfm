inherited listaEntidades: TlistaEntidades
  Caption = 'Lista de Entidades'
  ClientHeight = 513
  ExplicitWidth = 932
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelbotonera: TAdvPanel
    FullHeight = 0
    inherited btneditar: TAdvGlowButton
      Left = 72
      ExplicitLeft = 72
    end
    inherited btneliminar: TAdvGlowButton
      Left = 208
      ExplicitLeft = 208
    end
    inherited btnanular: TAdvGlowButton
      Left = 140
      ExplicitLeft = 140
    end
  end
  inherited fil_id: TEdit
    Left = 9
    Top = 457
    Width = 68
    ExplicitLeft = 9
    ExplicitTop = 457
    ExplicitWidth = 68
  end
  inherited AdvPanel1: TAdvPanel
    Height = 392
    ExplicitHeight = 392
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      Height = 390
      Columns = <
        item
          Expanded = False
          FieldName = 'entidad_id'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_razonsocial'
          Title.Alignment = taCenter
          Title.Caption = 'Raz'#243'n Social'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_calle'
          Title.Alignment = taCenter
          Title.Caption = 'Calle'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_puerta'
          Title.Alignment = taCenter
          Title.Caption = 'Puerta'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_piso'
          Title.Alignment = taCenter
          Title.Caption = 'Piso'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'entidad_depto'
          Title.Alignment = taCenter
          Title.Caption = 'Depto'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'localidad_nombre'
          Title.Alignment = taCenter
          Title.Caption = 'Localidad'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'provincia_nombre'
          Title.Alignment = taCenter
          Title.Caption = 'Provincia'
          Width = 157
          Visible = True
        end>
    end
  end
  object aplicar: TAdvGlowButton [3]
    Left = 703
    Top = 484
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
  object fil_entidad_razonsocial: TEdit [4]
    Left = 75
    Top = 457
    Width = 283
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnChange = fil_idChange
  end
  object fil_entidad_calle: TEdit [5]
    Left = 355
    Top = 457
    Width = 108
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnChange = fil_idChange
  end
  object fil_entidad_puerta: TEdit [6]
    Left = 460
    Top = 457
    Width = 59
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnChange = fil_idChange
  end
  object fil_entidad_piso: TEdit [7]
    Left = 517
    Top = 457
    Width = 58
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnChange = fil_idChange
  end
  object fil_entidad_depto: TEdit [8]
    Left = 573
    Top = 457
    Width = 58
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnChange = fil_idChange
  end
  object fil_localidad_nombre: TEdit [9]
    Left = 629
    Top = 457
    Width = 132
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnChange = fil_idChange
  end
  object fil_provincia_nombre: TEdit [10]
    Left = 759
    Top = 457
    Width = 155
    Height = 27
    Color = 9915136
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnChange = fil_idChange
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from entidades'
      
        'inner join provincias on provincias.provincia_id=entidades.provi' +
        'ncia_id'
      
        'inner join localidades on localidades.provincia_id=provincias.pr' +
        'ovincia_id')
    Left = 528
  end
  inherited ZQuery2: TZQuery
    Left = 712
  end
  inherited CustomizeGrid1: TCustomizeGrid
    Left = 408
  end
end
