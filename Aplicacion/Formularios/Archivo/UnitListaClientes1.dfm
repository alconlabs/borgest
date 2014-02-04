inherited ListaClientes1: TListaClientes1
  Caption = 'Clientes'
  ClientWidth = 1010
  ExplicitWidth = 1026
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1010
    ExplicitWidth = 1010
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 907
      ExplicitLeft = 907
      FullHeight = 0
    end
    inherited DBGrid1: TDBGrid
      Width = 907
      Columns = <
        item
          Expanded = False
          FieldName = 'cliente_id'
          Title.Caption = 'Codigo'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Nombre'
          Width = 179
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_documentonro'
          Title.Caption = 'Documento'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_domicilio'
          Title.Caption = 'Domicilio'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_telefono'
          Title.Caption = 'Telefono'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_mail'
          Title.Caption = 'E-mail'
          Width = 187
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1010
      ExplicitWidth = 1010
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 907
        ExplicitLeft = 907
      end
      object fil_cliente_nombre: TEdit
        Left = 85
        Top = 0
        Width = 179
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_cliente_documentonro: TEdit
        Left = 264
        Top = 0
        Width = 111
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_cliente_domicilio: TEdit
        Left = 375
        Top = 0
        Width = 210
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_cliente_telefono: TEdit
        Left = 585
        Top = 0
        Width = 111
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_cliente_mail: TEdit
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
    Width = 1010
    ExplicitWidth = 1010
    FullHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Width = 1010
    ExplicitWidth = 1010
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from clientes'
      'order by cliente_nombre')
  end
end
