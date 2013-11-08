inherited TarjetaCredito: TTarjetaCredito
  Caption = 'Tarjeta de Credito'
  ClientHeight = 378
  ClientWidth = 495
  OnShow = FormShow
  ExplicitWidth = 511
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 495
    Height = 378
    ExplicitWidth = 495
    ExplicitHeight = 378
    FullHeight = 0
    object Label15: TLabel [0]
      Left = 45
      Top = 7
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label3: TLabel [1]
      Left = 41
      Top = 34
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 256
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    inherited btncancelar: TButton
      Left = 396
      Top = 318
      TabOrder = 7
      ExplicitLeft = 396
      ExplicitTop = 318
    end
    inherited btnguardar: TButton
      Left = 315
      Top = 318
      TabOrder = 6
      OnClick = btnguardarClick
      ExplicitLeft = 315
      ExplicitTop = 318
    end
    object tarjeta_id: TEdit
      Left = 84
      Top = 4
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object tarjeta_nombre: TEdit
      Left = 87
      Top = 31
      Width = 386
      Height = 21
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 85
      Top = 58
      Width = 388
      Height = 151
      DataSource = DTStarjetacuotas
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'tarjetacuota_desde'
          Title.Caption = 'Cuota desde'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tarjetacuota_hasta'
          Title.Caption = 'Hasta'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tarjetacuota_recargo'
          Title.Caption = 'Recargo'
          Width = 78
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 85
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 3
    end
    object btnquitar: TButton
      Left = 161
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 4
    end
    object tarjeta_observaciones: TMemo
      Left = 85
      Top = 254
      Width = 228
      Height = 89
      TabOrder = 5
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from tarjetas'
      'where tarjeta_id=:tarjeta_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tarjeta_id'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tarjeta_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 424
    Top = 80
  end
  object ZQtarjetacuotas: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from tarjetacuotas'
      'where tarjeta_id=:tarjeta_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tarjeta_id'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 344
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tarjeta_id'
        ParamType = ptUnknown
      end>
    object ZQtarjetacuotastarjetacuota_id: TIntegerField
      FieldName = 'tarjetacuota_id'
    end
    object ZQtarjetacuotastarjetacuota_desde: TIntegerField
      FieldName = 'tarjetacuota_desde'
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object ZQtarjetacuotastarjetacuota_hasta: TIntegerField
      FieldName = 'tarjetacuota_hasta'
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object ZQtarjetacuotastarjetacuota_recargo: TFloatField
      FieldName = 'tarjetacuota_recargo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQtarjetacuotastarjeta_id: TIntegerField
      FieldName = 'tarjeta_id'
    end
  end
  object DTStarjetacuotas: TDataSource
    DataSet = ZQtarjetacuotas
    Left = 440
    Top = 216
  end
end
