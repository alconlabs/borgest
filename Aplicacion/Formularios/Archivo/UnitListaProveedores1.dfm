inherited ListaProveedores1: TListaProveedores1
  Caption = 'Proveedores'
  ClientWidth = 1003
  ExplicitWidth = 1019
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1003
    ExplicitWidth = 1003
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 900
      ExplicitLeft = 900
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Width = 900
      Columns = <
        item
          Expanded = False
          FieldName = 'proveedor_id'
          Title.Caption = 'Codigo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_nombre'
          Title.Caption = 'Nombre'
          Width = 179
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_documentonro'
          Title.Caption = 'Documento'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_domicilio'
          Title.Caption = 'Domicilio'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_telefono'
          Title.Caption = 'Telefono'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor_mail'
          Title.Caption = 'E-mail'
          Width = 187
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1003
      ExplicitWidth = 1003
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 900
        ExplicitLeft = 900
      end
      object fil_proveedor_nombre: TEdit
        Left = 85
        Top = 0
        Width = 179
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_proveedor_documentonro: TEdit
        Left = 264
        Top = 0
        Width = 111
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_proveedor_domicilio: TEdit
        Left = 375
        Top = 0
        Width = 210
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_proveedor_telefono: TEdit
        Left = 585
        Top = 0
        Width = 111
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_proveedor_mail: TEdit
        Left = 696
        Top = 0
        Width = 187
        Height = 21
        Align = alLeft
        TabOrder = 6
      end
    end
  end
  inherited panelabm: TAdvPanel
    Width = 1003
    ExplicitWidth = 1003
    FullHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Width = 1003
    ExplicitWidth = 1003
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from proveedores'
      'order by proveedor_nombre')
  end
end
