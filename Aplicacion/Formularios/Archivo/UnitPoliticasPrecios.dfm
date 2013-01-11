object politicasprecios: Tpoliticasprecios
  Left = 0
  Top = 0
  Caption = 'Politica de Precio'
  ClientHeight = 281
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 281
    Align = alClient
    BevelOuter = bvNone
    Color = 15524577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    Caption.Color = 15722471
    Caption.ColorTo = 11176072
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = 11769496
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label3: TLabel
      Left = 59
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label1: TLabel
      Left = 55
      Top = 36
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label6: TLabel
      Left = 32
      Top = 61
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Porcentaje 1'
    end
    object Label9: TLabel
      Left = 32
      Top = 85
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Porcentaje 2'
    end
    object Label10: TLabel
      Left = 32
      Top = 109
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Porcentaje 3'
    end
    object Label11: TLabel
      Left = 32
      Top = 133
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Porcentaje 4'
    end
    object Label2: TLabel
      Left = 21
      Top = 157
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    object btncancelar: TButton
      Left = 452
      Top = 250
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 371
      Top = 250
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 7
      OnClick = btnguardarClick
    end
    object politicaprecio_id: TEdit
      Left = 98
      Top = 9
      Width = 103
      Height = 21
      TabOrder = 0
    end
    object politicaprecio_nombre: TEdit
      Left = 98
      Top = 33
      Width = 429
      Height = 21
      TabOrder = 1
    end
    object politicaprecio_politica2: TNumEdit
      Left = 98
      Top = 82
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 3
      Text = '0'
    end
    object politicaprecio_politica3: TNumEdit
      Left = 98
      Top = 106
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 4
      Text = '0'
    end
    object politicaprecio_politica4: TNumEdit
      Left = 98
      Top = 130
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 5
      Text = '0'
    end
    object politicaprecio_politica1: TNumEdit
      Left = 98
      Top = 58
      Width = 121
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 2
      Text = '0'
    end
    object politicaprecio_obse: TMemo
      Left = 98
      Top = 155
      Width = 429
      Height = 89
      TabOrder = 6
    end
  end
  object ZQpoliticasdeprecio: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQpoliticasdeprecioAfterOpen
    SQL.Strings = (
      'select * from politicasdeprecios'
      'where politicaprecio_id=:politicaprecio_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'politicaprecio_id'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'politicaprecio_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from politicasdeprecios'
      'where politicaprecio_id=:politicaprecio_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'politicaprecio_id'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'politicaprecio_id'
        ParamType = ptUnknown
      end>
  end
  object ZQProductos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productos'
      'where politicaprecio_id=:politicaprecio_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'politicaprecio_id'
        ParamType = ptUnknown
      end>
    Left = 416
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'politicaprecio_id'
        ParamType = ptUnknown
      end>
  end
end
