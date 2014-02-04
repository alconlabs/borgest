inherited MenuConfig: TMenuConfig
  Caption = 'Configurar Menu Principal'
  ClientHeight = 375
  ClientWidth = 446
  ExplicitWidth = 462
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 446
    Height = 375
    ExplicitWidth = 446
    ExplicitHeight = 375
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 7
      Top = 5
      Width = 70
      Height = 13
      Caption = 'Menu Principal'
    end
    object Label2: TLabel [1]
      Left = 355
      Top = 5
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    inherited btncancelar: TButton
      Left = 274
      Top = 326
      ExplicitLeft = 274
      ExplicitTop = 326
    end
    inherited btnguardar: TButton
      Left = 193
      Top = 326
      ExplicitLeft = 193
      ExplicitTop = 326
    end
    object menu: TTreeView
      Tag = 1
      Left = 7
      Top = 24
      Width = 342
      Height = 297
      Indent = 19
      TabOrder = 2
      OnChange = menuChange
      OnKeyDown = menuKeyDown
    end
    object permisos: TCheckListBox
      Left = 355
      Top = 24
      Width = 80
      Height = 44
      ItemHeight = 13
      Items.Strings = (
        'Visible'
        'Habilitado')
      TabOrder = 3
      OnClick = permisosClick
    end
    object Button1: TButton
      Left = 355
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 4
      Visible = False
      OnClick = Button1Click
    end
  end
  inherited ZQSelect: TZQuery
    SQL.Strings = (
      'select * from menu')
    Params = <>
    Left = 112
    Top = 176
    ParamData = <>
  end
  inherited ZQExecSQL: TZQuery
    Left = 264
    Top = 184
  end
end
