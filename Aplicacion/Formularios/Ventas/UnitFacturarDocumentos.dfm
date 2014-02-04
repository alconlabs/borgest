inherited FacturarDocumentos: TFacturarDocumentos
  Caption = 'Facturar Documentos'
  ClientHeight = 380
  ClientWidth = 787
  ExplicitWidth = 803
  ExplicitHeight = 418
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 787
    Height = 380
    ExplicitWidth = 787
    ExplicitHeight = 380
    FullHeight = 0
    inherited btncancelar: TButton
      Left = 618
      Top = 326
      Cancel = True
      ExplicitLeft = 618
      ExplicitTop = 326
    end
    inherited btnguardar: TButton
      Left = 699
      Top = 326
      Caption = 'Aceptar'
      ExplicitLeft = 699
      ExplicitTop = 326
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 787
      Height = 320
      DataSource = DSC
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
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
          Width = 368
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end>
    end
  end
  inherited ZQSelect: TZQuery
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      'where documentosventas.documentoventa_estado<>'#39'ANULADA'#39' and '
      'documentosventas.tipodocu_id=:tipodocu_id'
      'order by documentoventa_fecha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tipodocu_id'
        ParamType = ptUnknown
      end>
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipodocu_id'
        ParamType = ptUnknown
      end>
  end
  object DSC: TDataSource
    DataSet = ZQSelect
    OnDataChange = DSCDataChange
    Left = 304
    Top = 96
  end
  object ZQDocumentoventadetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
end
