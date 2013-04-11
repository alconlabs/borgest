inherited sucursalesdebcred: Tsucursalesdebcred
  Caption = 'Debitos y Creditos de Sucursales'
  ClientWidth = 963
  OnShow = FormShow
  ExplicitWidth = 979
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 963
    Height = 329
    ExplicitWidth = 963
    ExplicitHeight = 329
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 860
      Height = 308
      ExplicitLeft = 860
      ExplicitHeight = 308
      FullHeight = 0
      inherited btnanular: TButton
        Enabled = False
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 860
      Height = 308
      Columns = <
        item
          Expanded = False
          FieldName = 'sucursaldebcred_id'
          Title.Caption = 'Codigo'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursaldebcred_fecha'
          Title.Caption = 'Fecha'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursal_nombre'
          Title.Caption = 'Sucursal'
          Width = 436
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursaldebcred_importe'
          Title.Caption = 'Importe'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sucursaldebcred_tipo'
          Title.Caption = 'Tipo'
          Width = 117
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Top = 308
      Width = 963
      ExplicitTop = 308
      ExplicitWidth = 963
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 860
        ExplicitLeft = 860
      end
      object fil_sucursaldebcred_fecha: TEdit
        Left = 85
        Top = 0
        Width = 100
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_sucursal_nombre: TEdit
        Left = 185
        Top = 0
        Width = 440
        Height = 21
        Align = alLeft
        TabOrder = 3
        ExplicitLeft = 179
        ExplicitTop = 2
      end
      object fil_sucursaldebcred_importe: TEdit
        Left = 625
        Top = 0
        Width = 80
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_sucursaldebcred_tipo: TEdit
        Left = 705
        Top = 0
        Width = 120
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
    end
  end
  inherited panelabm: TAdvPanel
    Top = 329
    Width = 963
    Height = 127
    ExplicitTop = 329
    ExplicitWidth = 963
    ExplicitHeight = 127
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 18
      Top = 35
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label8: TLabel [1]
      Left = 475
      Top = 35
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo'
    end
    object Label2: TLabel [2]
      Left = 466
      Top = 11
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label15: TLabel [3]
      Left = 8
      Top = 59
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descripcion'
    end
    object Label10: TLabel [4]
      Left = 461
      Top = 59
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    object Label3: TLabel [5]
      Left = 31
      Top = 91
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estado'
    end
    object sucursaldebcred_estado: TLabel [6]
      Left = 70
      Top = 91
      Width = 126
      Height = 13
      Caption = 'Estado del debito o credito'
    end
    object Label4: TLabel [7]
      Left = 44
      Top = 11
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro.'
    end
    inherited btnguardar: TButton
      OnClick = btnguardarClick
    end
    object sucursaldebcred_tipo: TComboBox
      Left = 502
      Top = 32
      Width = 106
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'D'#233'bito'
      Items.Strings = (
        'Debito'
        'Credito')
    end
    object sucursaldebcred_fecha: TDateTimePicker
      Left = 502
      Top = 8
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 3
    end
    object sucursaldebcred_descripcion: TEdit
      Left = 70
      Top = 56
      Width = 299
      Height = 21
      TabOrder = 4
    end
    object sucursaldebcred_importe: TMoneyEdit
      Left = 502
      Top = 56
      Width = 106
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
      TabOrder = 5
      Version = '1.1.0.1'
    end
    object sucursal_id: TSqlComboBox
      Left = 70
      Top = 32
      Width = 299
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object sucursaldebcred_id: TEdit
      Left = 70
      Top = 8
      Width = 126
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from sucursalesdebcred'
      
        'inner join sucursales on sucursalesdebcred.sucursal_id=sucursale' +
        's.sucursal_id'
      'order by sucursaldebcred_fecha, sucursal_nombre')
  end
  inherited ZQuery2: TZQuery
    Left = 544
    Top = 224
  end
end
