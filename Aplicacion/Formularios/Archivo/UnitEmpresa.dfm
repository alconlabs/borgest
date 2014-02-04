inherited empresa: Tempresa
  Caption = 'Empresa'
  ClientHeight = 185
  ClientWidth = 500
  ExplicitWidth = 516
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 500
    Height = 185
    ExplicitWidth = 500
    ExplicitHeight = 185
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 18
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label1: TLabel [1]
      Left = 14
      Top = 36
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label17: TLabel [2]
      Left = 9
      Top = 60
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object Label19: TLabel [3]
      Left = 10
      Top = 84
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefono'
    end
    object Label2: TLabel [4]
      Left = 26
      Top = 108
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT'
    end
    inherited btncancelar: TButton
      Left = 412
      Top = 134
      TabOrder = 6
      ExplicitLeft = 412
      ExplicitTop = 134
    end
    inherited btnguardar: TButton
      Left = 331
      Top = 134
      TabOrder = 5
      ExplicitLeft = 331
      ExplicitTop = 134
    end
    object empresa_id: TEdit
      Left = 58
      Top = 9
      Width = 102
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object empresa_nombre: TEdit
      Left = 58
      Top = 33
      Width = 428
      Height = 21
      TabOrder = 1
    end
    object empresa_domicilio: TEdit
      Left = 58
      Top = 57
      Width = 428
      Height = 21
      TabOrder = 2
    end
    object empresa_cuit: TMaskEdit
      Left = 58
      Top = 105
      Width = 90
      Height = 21
      EditMask = '00\-00000000\-0;1;_'
      MaxLength = 13
      TabOrder = 4
      Text = '  -        - '
    end
    object empresa_telefono: TEdit
      Left = 58
      Top = 81
      Width = 261
      Height = 21
      TabOrder = 3
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from empresas')
    Params = <>
    Left = 352
    Top = 0
    ParamData = <>
  end
  inherited ZQExecSQL: TZQuery
    SQL.Strings = (
      'select * from empresa')
    Params = <>
    Left = 240
    Top = 0
    ParamData = <>
  end
end
