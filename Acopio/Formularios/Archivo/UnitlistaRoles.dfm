inherited listaRoles: TlistaRoles
  Caption = 'Lista de Roles'
  ClientHeight = 359
  ClientWidth = 479
  ExplicitWidth = 495
  ExplicitHeight = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelbotonera: TAdvPanel
    Width = 479
    Height = 51
    ExplicitWidth = 479
    ExplicitHeight = 51
    FullHeight = 0
    inherited btnnuevo: TAdvGlowButton
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btneditar: TAdvGlowButton
      Left = 59
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 59
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btneliminar: TAdvGlowButton
      Left = 169
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 169
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btnanular: TAdvGlowButton
      Left = 114
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 114
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
    inherited btnsalir: TAdvGlowButton
      Left = 421
      Top = 2
      Width = 54
      Height = 47
      Font.Height = -11
      ExplicitLeft = 421
      ExplicitTop = 2
      ExplicitWidth = 54
      ExplicitHeight = 47
    end
  end
  inherited fil_id: TEdit
    Left = 2
    Top = 333
    Height = 24
    Font.Height = -13
    ExplicitLeft = 2
    ExplicitTop = 333
    ExplicitHeight = 24
  end
  inherited AdvPanel1: TAdvPanel
    Top = 51
    Width = 479
    Height = 280
    ExplicitWidth = 485
    ExplicitHeight = 280
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      Width = 477
      Height = 278
      Columns = <
        item
          Expanded = False
          Title.Caption = 'C'#243'digo'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Roles'
          Width = 345
          Visible = True
        end>
    end
  end
  inherited ZQGrilla: TZQuery
    Left = 224
    Top = 128
  end
  inherited DSCgrilla: TDataSource
    Left = 256
    Top = 128
  end
  inherited ZQuery2: TZQuery
    Left = 288
    Top = 128
  end
  inherited CustomizeGrid1: TCustomizeGrid
    Left = 160
    Top = 128
  end
end
