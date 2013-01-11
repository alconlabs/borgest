object cobradores: Tcobradores
  Left = 0
  Top = 0
  Caption = 'Vendedores'
  ClientHeight = 444
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 934
    Height = 335
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
    object panelbotonera: TAdvPanel
      Left = 831
      Top = 0
      Width = 103
      Height = 295
      Align = alRight
      BevelOuter = bvNone
      Color = 15524577
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
      Styler = Princ.AdvPanelStyler1
      ExplicitHeight = 217
      FullHeight = 0
      object Button2: TButton
        Left = 0
        Top = 82
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 0
        Top = 41
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Modificar'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 0
        Top = 0
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Crear Nuevo'
        TabOrder = 0
        OnClick = Button4Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 831
      Height = 295
      Align = alClient
      DataSource = DSCgrilla
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cobrador_id'
          Title.Caption = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cobrador_nombre'
          Title.Caption = 'Nombre'
          Width = 295
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cobrador_domicilio'
          Title.Caption = 'Domicilio'
          Width = 292
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cobrador_telefono'
          Title.Caption = 'Telefono'
          Width = 128
          Visible = True
        end>
    end
    object panelfiltros: TAdvPanel
      Left = 0
      Top = 295
      Width = 934
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      Color = 15524577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      Styler = Princ.AdvPanelStyler1
      ExplicitTop = 217
      FullHeight = 0
      object Button5: TButton
        Left = 831
        Top = 0
        Width = 103
        Height = 21
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 4
        OnClick = Button5Click
      end
      object fil_cobrador_domicilio: TEdit
        Left = 380
        Top = 0
        Width = 300
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_cobrador_id: TEdit
        Left = 0
        Top = 0
        Width = 85
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
      object fil_cobrador_nombre: TEdit
        Left = 85
        Top = 0
        Width = 295
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
      object fil_cobrador_telefono: TEdit
        Left = 680
        Top = 0
        Width = 150
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
    end
  end
  object panelabm: TAdvPanel
    Left = 0
    Top = 335
    Width = 934
    Height = 109
    Align = alBottom
    BevelOuter = bvNone
    Color = 15524577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Visible = False
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
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label1: TLabel
      Left = 47
      Top = 9
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 259
      Top = 9
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label3: TLabel
      Left = 38
      Top = 57
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object Label5: TLabel
      Left = 38
      Top = 33
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object Label4: TLabel
      Left = 48
      Top = 81
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Celular'
    end
    object Label6: TLabel
      Left = 468
      Top = 57
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail'
    end
    object Label10: TLabel
      Left = 477
      Top = 81
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'DNI'
    end
    object cobrador_id: TEdit
      Left = 86
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cobrador_nombre: TEdit
      Left = 302
      Top = 6
      Width = 418
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 755
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 7
      OnClick = Button1Click
    end
    object Button6: TButton
      Left = 755
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = Button6Click
    end
    object cobrador_domicilio: TEdit
      Left = 86
      Top = 30
      Width = 634
      Height = 21
      TabOrder = 2
    end
    object cobrador_telefono: TEdit
      Left = 86
      Top = 54
      Width = 218
      Height = 21
      TabOrder = 3
    end
    object cobrador_celular: TEdit
      Left = 86
      Top = 78
      Width = 218
      Height = 21
      TabOrder = 4
    end
    object cobrador_mail: TEdit
      Left = 502
      Top = 54
      Width = 218
      Height = 21
      TabOrder = 5
    end
    object cobrador_dni: TEdit
      Left = 502
      Top = 78
      Width = 218
      Height = 21
      TabOrder = 6
    end
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cobradores'
      'order by cobrador_nombre')
    Params = <>
    Left = 216
    Top = 112
  end
  object DSCgrilla: TDataSource
    DataSet = ZQGrilla
    Left = 336
    Top = 128
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 160
    Top = 112
  end
end
