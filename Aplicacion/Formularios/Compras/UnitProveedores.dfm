object proveedores: Tproveedores
  Left = 0
  Top = 0
  Caption = 'Proveedores'
  ClientHeight = 310
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
  object Label6: TLabel
    Left = 56
    Top = 84
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Localidad'
  end
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 310
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
    object Label2: TLabel
      Left = 68
      Top = 157
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Celular'
    end
    object Label3: TLabel
      Left = 67
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label5: TLabel
      Left = 7
      Top = 230
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condicion de Venta'
    end
    object provincia_nombre: TLabel
      Left = 326
      Top = 84
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    object Label4: TLabel
      Left = 54
      Top = 84
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    object Label7: TLabel
      Left = 27
      Top = 254
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Proveedor'
    end
    object btncancelar: TButton
      Left = 460
      Top = 278
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 13
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 379
      Top = 278
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 12
      OnClick = btnguardarClick
    end
    object proveedor_domicilio: TEdit
      Left = 106
      Top = 57
      Width = 429
      Height = 21
      TabOrder = 2
    end
    object proveedor_telefono: TEdit
      Left = 106
      Top = 129
      Width = 261
      Height = 21
      TabOrder = 6
    end
    object proveedor_mail: TEdit
      Left = 106
      Top = 203
      Width = 429
      Height = 21
      TabOrder = 9
    end
    object condicioniva_id: TSqlComboBox
      Left = 106
      Top = 178
      Width = 261
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from condicioniva'
        'order by condicioniva_nombre')
      ConfTabla = 'condicioniva'
      Confcampo_codigo = 'condicioniva_id'
      Confcampo_nomb = 'condicioniva_nombre'
      Tag2 = 0
    end
    object proveedor_nombre: TEdit
      Left = 106
      Top = 33
      Width = 429
      Height = 21
      TabOrder = 1
    end
    object proveedor_documentotipo: TComboBox
      Left = 40
      Top = 105
      Width = 60
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'DNI'
      Items.Strings = (
        'DNI'
        'CUIT'
        'Otro')
    end
    object proveedor_documentonro: TEdit
      Left = 106
      Top = 105
      Width = 429
      Height = 21
      TabOrder = 5
    end
    object proveedor_celular: TEdit
      Left = 106
      Top = 153
      Width = 261
      Height = 21
      TabOrder = 7
    end
    object proveedor_id: TEdit
      Left = 106
      Top = 9
      Width = 103
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object proveedor_condicionventa: TComboBox
      Left = 106
      Top = 227
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 10
      Text = 'Contado'
      Items.Strings = (
        'Contado'
        'Cuenta Corriente')
    end
    object localidad_id: TSqlComboBox
      Left = 106
      Top = 81
      Width = 206
      Height = 21
      ItemHeight = 13
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
    object proveedor_tipo: TComboBox
      Left = 106
      Top = 251
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = 'Productos'
      Items.Strings = (
        'Productos'
        'Servicios')
    end
  end
  object ZQproveedores: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQproveedoresAfterOpen
    SQL.Strings = (
      'select * from proveedores'
      'where proveedor_id=:proveedor_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'proveedor_id'
        ParamType = ptUnknown
      end>
    Left = 448
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'proveedor_id'
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
