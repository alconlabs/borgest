inherited DetallePagos: TDetallePagos
  Caption = 'DetallePagos'
  ClientHeight = 419
  ClientWidth = 631
  OnCreate = FormCreate
  ExplicitWidth = 647
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 631
    Height = 419
    StatusBar.BevelInner = True
    ExplicitWidth = 1026
    ExplicitHeight = 742
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
      Top = 44
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
    inherited btncancelar: TButton
      Left = 548
      Top = 366
      Caption = 'Salir'
      ExplicitLeft = 548
      ExplicitTop = 366
    end
    inherited btnguardar: TButton
      Left = 11
      Top = 366
      Caption = 'Imprimir'
      OnClick = btnguardarClick
      ExplicitLeft = 11
      ExplicitTop = 366
    end
    object documentoventa_nrodetallepago: TEdit
      Left = 116
      Top = 9
      Width = 121
      Height = 21
      TabStop = False
      TabOrder = 2
    end
    object documentoventa_fecha: TDateTimePicker
      Left = 510
      Top = 8
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 3
    end
    object DBGrid2: TDBGrid
      Left = 9
      Top = 63
      Width = 607
      Height = 226
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
          FieldName = 'documentopago_id'
          Title.Caption = 'Nro.'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipopago_nombre'
          Title.Caption = 'Descripcion'
          Width = 438
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_importe'
          Title.Caption = 'Importe'
          Width = 87
          Visible = True
        end>
    end
    object btnbuscar: TButton
      Left = 243
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      OnClick = btnbuscarClick
    end
    object documentoventa_observacion: TGTBMemo
      Left = 12
      Top = 318
      Width = 604
      Height = 43
      TabStop = False
      TabOrder = 6
      Tag2 = 0
    end
  end
  inherited ZQSelect: TZQuery
    SQL.Strings = (
      'select documentopagos.*, tipopago_nombre from documentopagos'
      
        'inner join tipospago on documentopagos.tipopago_id=tipospago.tip' +
        'opago_id'
      
        'inner join documentosventas on documentopagos.documentoventa_id=' +
        'documentosventas.documentoventa_id'
      
        'where documentosventas.documentoventa_nrodetallepago=:documentov' +
        'enta_nrodetallepago')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_nrodetallepago'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_nrodetallepago'
        ParamType = ptUnknown
      end>
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
