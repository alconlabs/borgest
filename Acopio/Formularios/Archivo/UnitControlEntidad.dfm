object ControlEntidad: TControlEntidad
  Left = 0
  Top = 0
  Caption = 'Control de Entidad'
  ClientHeight = 214
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 603
    Height = 169
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = '    Datos Principales    '
      ImageIndex = 1
      object Label6: TLabel
        Left = 55
        Top = 60
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descripci'#243'n'
      end
      object Label26: TLabel
        Left = 73
        Top = 14
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Entidad'
      end
      object Label2: TLabel
        Left = 83
        Top = 37
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Roles'
      end
      object entidadrol_descripcion: TEdit
        Left = 115
        Top = 57
        Width = 470
        Height = 21
        TabOrder = 2
      end
      object entidad_id: TSqlComboBox
        Left = 115
        Top = 11
        Width = 231
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from entidades'
          'order by entidad_razonsocial')
        Confcampo_codigo = 'entidad_id'
        Confcampo_nomb = 'entidad_razonsocial'
        Tag2 = 0
      end
      object rol_id: TSqlComboBox
        Left = 115
        Top = 34
        Width = 231
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from roles'
          'order by rol_nombre')
        Confcampo_codigo = 'rol_id'
        Confcampo_nomb = 'rol_nombre'
        Tag2 = 0
      end
      object entidadrol_contrganancias: TCheckBox
        Left = 115
        Top = 84
        Width = 134
        Height = 17
        Caption = 'Contribuye Ganancias'
        TabOrder = 3
      end
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 197
    Width = 603
    Height = 17
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label27: TLabel
      Left = 6
      Top = 3
      Width = 92
      Height = 11
      Alignment = taRightJustify
      Caption = 'F9 - Guardar Todo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object btnguardar: TButton
    Left = 216
    Top = 170
    Width = 99
    Height = 25
    Caption = 'Guardar'
    TabOrder = 2
    OnClick = btnguardarClick
  end
  object btncancelar: TButton
    Left = 321
    Top = 170
    Width = 99
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
  end
  object ZQSelect: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from entidadrol'
      'where entidadrol_id=:entidadrol_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'entidadrol_id'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'entidadrol_id'
        ParamType = ptUnknown
      end>
  end
  object ZQExecSql: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from roles'
      'where rol_codi=:rol_codi')
    Params = <
      item
        DataType = ftUnknown
        Name = 'rol_codi'
        ParamType = ptUnknown
      end>
    Left = 520
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rol_codi'
        ParamType = ptUnknown
      end>
  end
end
