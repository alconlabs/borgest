inherited ListaOrdenesServicios: TListaOrdenesServicios
  Caption = 'Ordenes de Servicio'
  ClientWidth = 1035
  ExplicitWidth = 1051
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1035
    ExplicitWidth = 1035
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      Left = 932
      ExplicitLeft = 932
      FullHeight = 0
      inherited btnanular: TButton
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 932
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 360
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clientevehiculo_marca'
          Title.Caption = 'Marca'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clientevehiculo_modelo'
          Title.Caption = 'Modelo/A'#241'o'
          Width = 150
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      Width = 1035
      ExplicitWidth = 1035
      FullHeight = 0
      inherited btnfiltrar: TButton
        Left = 932
        ExplicitLeft = 932
      end
      inherited fil_id: TGTBEdit
        Width = 92
        ExplicitWidth = 92
      end
      object fil_puntoventa_numero: TEdit
        Left = 92
        Top = 0
        Width = 46
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_documentoventa_numero: TEdit
        Left = 138
        Top = 0
        Width = 90
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_cliente_nombre: TEdit
        Left = 228
        Top = 0
        Width = 360
        Height = 21
        Align = alLeft
        TabOrder = 4
      end
      object fil_clientevehiculo_marca: TEdit
        Left = 588
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_clientevehiculo_modelo: TEdit
        Left = 718
        Top = 0
        Width = 150
        Height = 21
        Align = alLeft
        TabOrder = 6
      end
    end
  end
  inherited panelabm: TAdvPanel
    Width = 1035
    ExplicitWidth = 1035
    FullHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Width = 1035
    ExplicitWidth = 1035
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join clientevehiculo on clientes.cliente_id=clientevehicul' +
        'o.cliente_id'
      'order by documentoventa_fecha, documentoventa_id')
  end
end
