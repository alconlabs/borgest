inherited ImprimirFichasClientes: TImprimirFichasClientes
  Caption = 'Imprimir Fichas de Clientes'
  ClientHeight = 116
  ClientWidth = 535
  ExplicitWidth = 551
  ExplicitHeight = 154
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 535
    Height = 116
    ExplicitWidth = 535
    ExplicitHeight = 116
    FullHeight = 0
    object Label11: TLabel [0]
      Left = 36
      Top = 25
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object Label6: TLabel [1]
      Left = 34
      Top = 49
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    inherited btncancelar: TButton
      Left = 444
      Top = 46
      Caption = 'Salir'
      ExplicitLeft = 444
      ExplicitTop = 46
    end
    inherited btnguardar: TButton
      Left = 363
      Top = 46
      Caption = 'Imprimir'
      ExplicitLeft = 363
      ExplicitTop = 46
    end
    object provincia_id: TSqlComboBox
      Left = 86
      Top = 22
      Width = 203
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnSelect = provincia_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from provincias'
        'order by provincia_nombre')
      ConfTabla = 'provincias'
      Confcampo_codigo = 'provincia_id'
      Confcampo_nomb = 'provincia_nombre'
      Tag2 = 0
      ConfTodos = True
    end
    object localidad_id: TSqlComboBox
      Left = 86
      Top = 46
      Width = 203
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from localidades'
        'order by localidad_nombre')
      ConfTabla = 'localidades'
      Confcampo_codigo = 'localidad_id'
      Confcampo_nomb = 'localidad_nombre'
      Tag2 = 0
      ConfTodos = True
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 320
    Top = 8
  end
end
