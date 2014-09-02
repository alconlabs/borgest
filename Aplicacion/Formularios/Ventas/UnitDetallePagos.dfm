inherited DetallePagos: TDetallePagos
  Caption = 'DetallePagos'
  ClientHeight = 419
  ClientWidth = 631
  ExplicitWidth = 647
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 631
    Height = 419
    StatusBar.BevelInner = True
    ExplicitWidth = 631
    ExplicitHeight = 419
    FullHeight = 0
    object Label18: TLabel [0]
      Left = 9
      Top = 12
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero Detalle Pago'
    end
    object Label2: TLabel [1]
      Left = 474
      Top = 12
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label13: TLabel [2]
      Left = 9
      Top = 60
      Width = 30
      Height = 13
      Caption = 'Pagos'
    end
    object Label1: TLabel [3]
      Left = 12
      Top = 299
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label11: TLabel [4]
      Left = 69
      Top = 38
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    inherited btncancelar: TButton
      Left = 548
      Top = 366
      Caption = 'Salir'
      TabOrder = 7
      ExplicitLeft = 548
      ExplicitTop = 366
    end
    inherited btnguardar: TButton
      Left = 11
      Top = 366
      Caption = 'Imprimir'
      TabOrder = 6
      ExplicitLeft = 11
      ExplicitTop = 366
    end
    object documentoventa_nrodetallepago: TEdit
      Left = 116
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object documentoventa_fecha: TDateTimePicker
      Left = 510
      Top = 8
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 1
    end
    object DBGrid2: TDBGrid
      Left = 9
      Top = 79
      Width = 607
      Height = 210
      DataSource = DTSPagos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Nro. Recibo'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_id'
          Title.Caption = 'Codigo'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 258
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 106
          Visible = True
        end>
    end
    object btnbuscar: TButton
      Left = 323
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 3
      OnClick = btnbuscarClick
    end
    object documentoventa_observacion: TGTBMemo
      Left = 12
      Top = 318
      Width = 604
      Height = 43
      TabStop = False
      TabOrder = 5
      Tag2 = 0
    end
    object sucursal_id: TSqlComboBox
      Left = 116
      Top = 35
      Width = 202
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      ConfTabla = 'sucursales'
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
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
        'nte_id')
    Params = <>
    Left = 328
    Top = 160
    ParamData = <>
  end
  inherited ZQExecSQL: TZQuery
    Left = 544
    Top = 104
  end
  object DTSPagos: TDataSource
    DataSet = ZQSelect
    Left = 100
    Top = 100
  end
end
