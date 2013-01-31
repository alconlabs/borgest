object Articulos: TArticulos
  Left = 0
  Top = 0
  Caption = 'Art'#237'culos'
  ClientHeight = 276
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 565
    Height = 225
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = '    Datos Generales    '
      ImageIndex = 1
      object Label1: TLabel
        Left = 12
        Top = 61
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desc. Reducida'
      end
      object Label2: TLabel
        Left = 15
        Top = 153
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observaciones'
      end
      object Label3: TLabel
        Left = 43
        Top = 13
        Width = 43
        Height = 16
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 32
        Top = 39
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descripci'#243'n'
      end
      object Label6: TLabel
        Left = 16
        Top = 119
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidad Medida'
      end
      object Label10: TLabel
        Left = 362
        Top = 97
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo IVA'
      end
      object Label11: TLabel
        Left = 57
        Top = 97
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Rubro'
      end
      object Label5: TLabel
        Left = 471
        Top = 96
        Width = 11
        Height = 13
        Alignment = taRightJustify
        Caption = '%'
      end
      object articulo_codi: TDBAdvEdit
        Left = 95
        Top = 11
        Width = 106
        Height = 22
        AutoThousandSeparator = False
        EditType = etNumeric
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = 15365376
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0'
        Visible = True
        Version = '2.7.0.5'
      end
      object articulo_observaciones: TEdit
        Left = 96
        Top = 150
        Width = 457
        Height = 21
        TabOrder = 6
      end
      object articulo_desc: TEdit
        Left = 96
        Top = 35
        Width = 457
        Height = 21
        TabOrder = 1
      end
      object articulo_descreducida: TEdit
        Left = 96
        Top = 58
        Width = 457
        Height = 21
        TabOrder = 2
      end
      object articulo_unidad: TEdit
        Left = 97
        Top = 116
        Width = 250
        Height = 21
        TabOrder = 5
      end
      object rubro_codi: TSqlComboBox
        Left = 97
        Top = 93
        Width = 250
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from rubros'
          'order by rubro_nombre')
        Confcampo_codigo = 'rubro_codi'
        Confcampo_nomb = 'rubro_nombre'
        Tag2 = 0
      end
      object articulo_tipoiva: TComboBox
        Left = 409
        Top = 93
        Width = 57
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = '10.5'
        Items.Strings = (
          '10.5'
          '21'
          '27')
      end
    end
  end
  object btnguardar: TButton
    Left = 173
    Top = 227
    Width = 99
    Height = 27
    Caption = 'Guardar'
    TabOrder = 1
    OnClick = btnguardarClick
  end
  object btncancelar: TButton
    Left = 272
    Top = 227
    Width = 99
    Height = 27
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btncancelarClick
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 259
    Width = 565
    Height = 17
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from articulos'
      'where articulo_codi=:articulo_codi')
    Params = <
      item
        DataType = ftUnknown
        Name = 'articulo_codi'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'articulo_codi'
        ParamType = ptUnknown
      end>
  end
  object ZArticulos: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZArticulosAfterOpen
    SQL.Strings = (
      'select * from articulos'
      'where articulo_codi=:articulo_codi')
    Params = <
      item
        DataType = ftUnknown
        Name = 'articulo_codi'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'articulo_codi'
        ParamType = ptUnknown
      end>
  end
end
