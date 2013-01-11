object empresa: Tempresa
  Left = 0
  Top = 0
  Caption = 'Empresa'
  ClientHeight = 312
  ClientWidth = 541
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
    Width = 541
    Height = 312
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
    object Label17: TLabel
      Left = 58
      Top = 60
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object Label19: TLabel
      Left = 58
      Top = 132
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object Label21: TLabel
      Left = 33
      Top = 181
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condicion IVA'
    end
    object Label23: TLabel
      Left = 72
      Top = 206
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail'
    end
    object Label1: TLabel
      Left = 63
      Top = 36
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label3: TLabel
      Left = 67
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label6: TLabel
      Left = 54
      Top = 84
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    object provincia_nombre: TLabel
      Left = 326
      Top = 84
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    object Label7: TLabel
      Left = 82
      Top = 108
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuit'
    end
    object btncancelar: TButton
      Left = 460
      Top = 278
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 379
      Top = 278
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 7
      OnClick = btnguardarClick
    end
    object cliente_domicilio: TEdit
      Left = 106
      Top = 57
      Width = 429
      Height = 21
      TabOrder = 2
    end
    object cliente_telefono: TEdit
      Left = 106
      Top = 129
      Width = 261
      Height = 21
      TabOrder = 4
    end
    object cliente_mail: TEdit
      Left = 106
      Top = 203
      Width = 429
      Height = 21
      TabOrder = 6
    end
    object condicioniva_id: TSqlComboBox
      Left = 106
      Top = 178
      Width = 261
      Height = 21
      ItemHeight = 0
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from condicioniva'
        'order by condicioniva_nombre')
      ConfTabla = 'condicioniva'
      Confcampo_codigo = 'condicioniva_id'
      Confcampo_nomb = 'condicioniva_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object cliente_nombre: TEdit
      Left = 106
      Top = 33
      Width = 429
      Height = 21
      TabOrder = 1
    end
    object cliente_id: TEdit
      Left = 106
      Top = 9
      Width = 103
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object localidad_id: TSqlComboBox
      Left = 106
      Top = 81
      Width = 206
      Height = 21
      ItemHeight = 0
      TabOrder = 3
      OnSelect = localidad_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from localidades'
        'order by localidad_nombre')
      ConfTabla = 'localidades'
      Confcampo_codigo = 'localidad_id'
      Confcampo_nomb = 'localidad_nombre'
      Tag2 = 0
    end
    object MaskEdit1: TMaskEdit
      Left = 106
      Top = 105
      Width = 84
      Height = 21
      EditMask = '00\-00000000\-0;1;_'
      MaxLength = 13
      TabOrder = 9
      Text = '  -        - '
    end
  end
  object ZQclientes: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQclientesAfterOpen
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 448
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
end
