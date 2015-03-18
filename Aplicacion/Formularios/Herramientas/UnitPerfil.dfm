inherited Perfil: TPerfil
  Caption = 'Perfil'
  ClientHeight = 447
  ClientWidth = 520
  ExplicitWidth = 536
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 520
    Height = 447
    ExplicitWidth = 520
    ExplicitHeight = 447
    FullHeight = 0
    inherited btncancelar: TButton
      Left = 428
      Top = 398
      TabOrder = 2
      ExplicitLeft = 428
      ExplicitTop = 398
    end
    inherited btnguardar: TButton
      Left = 347
      Top = 398
      TabOrder = 1
      ExplicitLeft = 347
      ExplicitTop = 398
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 520
      Height = 394
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        object Label3: TLabel
          Left = 19
          Top = 12
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo'
        end
        object Label1: TLabel
          Left = 15
          Top = 36
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre'
        end
        object Label2: TLabel
          Left = 58
          Top = 61
          Width = 70
          Height = 13
          Caption = 'Menu Principal'
        end
        object Label4: TLabel
          Left = 406
          Top = 61
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object perfil_id: TEdit
          Left = 58
          Top = 9
          Width = 103
          Height = 21
          TabOrder = 0
        end
        object perfil_nombre: TEdit
          Left = 58
          Top = 33
          Width = 441
          Height = 21
          TabOrder = 1
        end
        object menu: TTreeView
          Tag = 1
          Left = 58
          Top = 80
          Width = 342
          Height = 278
          Indent = 19
          TabOrder = 2
          OnChange = menuChange
        end
        object permisos: TCheckListBox
          Left = 406
          Top = 80
          Width = 93
          Height = 113
          TabStop = False
          ItemHeight = 13
          Items.Strings = (
            'Habilitado'
            'Crear Nuevo'
            'Modificar'
            'Eliminar'
            'Anular'
            'Imprimir'
            'Ver'
            'Clonar')
          TabOrder = 3
          OnClick = permisosClick
        end
      end
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    CachedUpdates = True
    SQL.Strings = (
      'select * from menu'
      'left join menuperfil on menu.menu_id=menuperfil.menu_id'
      'where menu_enabled=-1 and perfil_id=:perfil_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'perfil_id'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'perfil_id'
        ParamType = ptUnknown
      end>
  end
  object ZQPerfiles: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from perfiles'
      'where perfil_id=:perfil_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'perfil_id'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'perfil_id'
        ParamType = ptUnknown
      end>
  end
end
