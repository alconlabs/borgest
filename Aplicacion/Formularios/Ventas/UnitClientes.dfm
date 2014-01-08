object clientes: Tclientes
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 518
  ClientWidth = 568
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 568
    Height = 518
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
    StatusBar.BevelInner = True
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
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 568
      Height = 456
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Datos Personales'
        object Label7: TLabel
          Left = 29
          Top = 327
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observaciones'
        end
        object provincia_nombre: TLabel
          Left = 326
          Top = 84
          Width = 44
          Height = 13
          Caption = 'Provincia'
        end
        object Label6: TLabel
          Left = 54
          Top = 84
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Localidad'
        end
        object Label4: TLabel
          Left = 25
          Top = 229
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lista de Precios'
        end
        object Label3: TLabel
          Left = 67
          Top = 12
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo'
        end
        object Label2: TLabel
          Left = 68
          Top = 181
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Celular'
        end
        object Label1: TLabel
          Left = 63
          Top = 36
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre'
        end
        object Label23: TLabel
          Left = 72
          Top = 205
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'E-mail'
        end
        object Label21: TLabel
          Left = 33
          Top = 108
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Condicion IVA'
        end
        object Label19: TLabel
          Left = 58
          Top = 157
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telefono'
        end
        object Label17: TLabel
          Left = 58
          Top = 60
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Domicilio'
        end
        object Label5: TLabel
          Left = 7
          Top = 254
          Width = 93
          Height = 13
          Alignment = taRightJustify
          Caption = 'Condicion de Venta'
        end
        object Label14: TLabel
          Left = 54
          Top = 303
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vendedor'
        end
        object Label15: TLabel
          Left = 4
          Top = 278
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dias Venc. Facturas'
        end
        object cliente_observaciones: TMemo
          Left = 106
          Top = 324
          Width = 429
          Height = 70
          TabOrder = 15
        end
        object cliente_documentotipo: TGTBComboBox
          Left = 33
          Top = 129
          Width = 67
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = 'DNI'
          OnChange = cliente_documentotipoSelect
          OnSelect = cliente_documentotipoSelect
          Items.Strings = (
            'DNI'
            'CUIT'
            'Otro')
          Tag2 = 0
          valores.Strings = (
            'DNI'
            'CUIT'
            'Otro')
        end
        object cliente_cuit: TMaskEdit
          Left = 343
          Top = 129
          Width = 90
          Height = 21
          EditMask = '00\-00000000\-0;1;_'
          MaxLength = 13
          TabOrder = 7
          Text = '  -        - '
          Visible = False
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
        object cliente_listaprecio: TComboBox
          Left = 106
          Top = 226
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 11
          Text = 'Precio 1'
          Items.Strings = (
            'Precio 1'
            'Precio 2'
            'Precio 3'
            'Precio 4')
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
        object cliente_celular: TEdit
          Left = 106
          Top = 178
          Width = 261
          Height = 21
          TabOrder = 9
        end
        object cliente_documentonro: TEdit
          Left = 106
          Top = 130
          Width = 206
          Height = 21
          TabOrder = 6
        end
        object cliente_nombre: TEdit
          Left = 106
          Top = 33
          Width = 429
          Height = 21
          TabOrder = 1
        end
        object condicioniva_id: TSqlComboBox
          Left = 106
          Top = 105
          Width = 261
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          OnExit = condicioniva_idExit
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from condicioniva'
            'order by condicioniva_nombre')
          ConfTabla = 'condicioniva'
          Confcampo_codigo = 'condicioniva_id'
          Confcampo_nomb = 'condicioniva_nombre'
          Tag2 = 0
        end
        object cliente_mail: TEdit
          Left = 106
          Top = 202
          Width = 429
          Height = 21
          TabOrder = 10
        end
        object cliente_telefono: TEdit
          Left = 106
          Top = 154
          Width = 261
          Height = 21
          TabOrder = 8
        end
        object cliente_domicilio: TEdit
          Left = 106
          Top = 57
          Width = 429
          Height = 21
          TabOrder = 2
        end
        object cliente_condicionventa: TComboBox
          Left = 106
          Top = 251
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 12
          Text = 'Contado'
          Items.Strings = (
            'Contado'
            'Cuenta Corriente')
        end
        object personal_id: TSqlComboBox
          Left = 106
          Top = 300
          Width = 220
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 14
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from personal')
          Confcampo_codigo = 'personal_id'
          Confcampo_nomb = 'personal_nombre'
          Tag2 = 0
        end
        object cliente_diasvenc: TMoneyEdit
          Left = 106
          Top = 275
          Width = 70
          Height = 21
          CalculatorLook.ButtonWidth = 24
          CalculatorLook.ButtonHeight = 24
          CalculatorLook.ButtonColor = clSilver
          CalculatorLook.Color = clWhite
          CalculatorLook.Flat = False
          CalculatorLook.Font.Charset = DEFAULT_CHARSET
          CalculatorLook.Font.Color = clWindowText
          CalculatorLook.Font.Height = -11
          CalculatorLook.Font.Name = 'Tahoma'
          CalculatorLook.Font.Style = []
          TabOrder = 13
          Version = '1.1.0.1'
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Veh'#237'culo'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label8: TLabel
          Left = 24
          Top = 12
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha de Venta'
        end
        object Label9: TLabel
          Left = 36
          Top = 60
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Modelo y a'#241'o'
        end
        object Label10: TLabel
          Left = 46
          Top = 84
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Chasis'
        end
        object Label11: TLabel
          Left = 53
          Top = 108
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro Motor'
        end
        object Label12: TLabel
          Left = 29
          Top = 134
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observaciones'
        end
        object Label13: TLabel
          Left = 70
          Top = 36
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Marca'
        end
        object clientevehiculo_modelo: TEdit
          Left = 106
          Top = 57
          Width = 429
          Height = 21
          TabOrder = 2
        end
        object clientevehiculo_nrochasis: TEdit
          Left = 106
          Top = 81
          Width = 429
          Height = 21
          TabOrder = 3
        end
        object clientevehiculo_nromotor: TEdit
          Left = 106
          Top = 105
          Width = 429
          Height = 21
          TabOrder = 4
        end
        object clientevehiculo_observaciones: TMemo
          Left = 106
          Top = 131
          Width = 429
          Height = 70
          TabOrder = 5
        end
        object clientevehiculo_fechaventa: TDateTimePicker
          Left = 106
          Top = 9
          Width = 106
          Height = 21
          Date = 40384.000000000000000000
          Time = 40384.000000000000000000
          TabOrder = 0
        end
        object clientevehiculo_marca: TEdit
          Left = 106
          Top = 33
          Width = 429
          Height = 21
          TabOrder = 1
        end
      end
    end
    object btncancelar: TButton
      Left = 460
      Top = 462
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 379
      Top = 463
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = btnguardarClick
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
    Left = 352
    Top = 104
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
    Left = 328
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object ZQClienteVehiculo: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQClienteVehiculoAfterOpen
    SQL.Strings = (
      'select * from clientevehiculo'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 432
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
end
