inherited ListaPoliticasdePrecios: TListaPoliticasdePrecios
  Caption = 'Politicas de Precios'
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
      inherited btnanular: TButton
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 900
      Columns = <
        item
          Expanded = False
          FieldName = 'politicaprecio_id'
          Title.Caption = 'Codigo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'politicaprecio_nombre'
          Title.Caption = 'Nombre'
          Width = 480
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'politicaprecio_politica1'
          Title.Caption = 'Politica 1'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'politicaprecio_politica2'
          Title.Caption = 'Politica 2'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'politicaprecio_politica3'
          Title.Caption = 'Politica 3'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'politicaprecio_politica4'
          Title.Caption = 'Politica 4'
          Width = 80
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
      object fil_politicaprecio_nombre: TEdit
        Left = 85
        Top = 0
        Width = 480
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_politicaprecio_politica1: TEdit
        Left = 565
        Top = 0
        Width = 80
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_politicaprecio_politica2: TEdit
        Left = 645
        Top = 0
        Width = 80
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_politicaprecio_politica3: TEdit
        Left = 725
        Top = 0
        Width = 80
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_politicaprecio_politica4: TEdit
        Left = 805
        Top = 0
        Width = 80
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
    ExplicitTop = 317
    ExplicitWidth = 1003
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from politicasdeprecios'
      'order by politicaprecio_nombre')
  end
end
