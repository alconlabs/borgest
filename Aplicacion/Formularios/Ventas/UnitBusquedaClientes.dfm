inherited busquedaclientes: Tbusquedaclientes
  Caption = 'Busqueda de clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited DBGrid1: TDBGrid
      TabOrder = 2
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'cliente_id'
          Title.Caption = 'Codigo'
          Width = 47
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
      TabOrder = 0
      FullHeight = 0
      inherited btnfiltrar: TButton
        TabOrder = 5
      end
      inherited fil_id: TGTBEdit
        Width = 62
        TabOrder = 6
        OnEnter = fil_idEnter
        OnExit = fil_idExit
        Caption = 'Codigo'
        ExplicitWidth = 62
      end
      object fil_cliente_nombre: TGTBEdit
        Left = 62
        Top = 0
        Width = 179
        Height = 22
        Align = alLeft
        TabOrder = 0
        OnEnter = fil_idEnter
        OnExit = fil_idExit
        OnKeyPress = fil_cliente_nombreKeyPress
        Tag2 = 0
        Caption = 'Nombre'
        ExplicitHeight = 21
      end
      object fil_cliente_documentonro: TGTBEdit
        Left = 241
        Top = 0
        Width = 111
        Height = 22
        Align = alLeft
        TabOrder = 1
        OnEnter = fil_idEnter
        OnExit = fil_idExit
        Tag2 = 0
        Caption = 'Documento'
        ExplicitHeight = 21
      end
      object fil_cliente_domicilio: TGTBEdit
        Left = 352
        Top = 0
        Width = 210
        Height = 22
        Align = alLeft
        TabOrder = 2
        OnEnter = fil_idEnter
        OnExit = fil_idExit
        Tag2 = 0
        Caption = 'Domicilio'
        ExplicitHeight = 21
      end
      object fil_cliente_telefono: TGTBEdit
        Left = 562
        Top = 0
        Width = 111
        Height = 22
        Align = alLeft
        TabOrder = 3
        OnEnter = fil_idEnter
        OnExit = fil_idExit
        Tag2 = 0
        Caption = 'Telefono'
        ExplicitHeight = 21
      end
      object fil_cliente_mail: TGTBEdit
        Left = 673
        Top = 0
        Width = 187
        Height = 22
        Align = alLeft
        TabOrder = 4
        OnEnter = fil_idEnter
        OnExit = fil_idExit
        Tag2 = 0
        Caption = 'E-mail'
        ExplicitHeight = 21
      end
    end
    inherited AdvPanel1: TAdvPanel
      TabOrder = 1
      FullHeight = 0
      object lblinfo: TLabel [0]
        Left = 16
        Top = 10
        Width = 27
        Height = 13
        Caption = 'lblinfo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from clientes')
  end
end
