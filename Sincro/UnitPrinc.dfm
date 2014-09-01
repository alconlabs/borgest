object Princ: TPrinc
  Left = 0
  Top = 0
  Caption = 'Princ'
  ClientHeight = 329
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Exportar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 264
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Sincronizar Stock'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ZBase: TZConnection
    Protocol = 'mysql-5'
    HostName = 'localhost'
    Port = 3306
    Database = 'dbborgest'
    User = 'root'
    Password = 'root'
    Connected = True
    BeforeConnect = ZBaseBeforeConnect
    AfterConnect = ZBaseAfterConnect
    Left = 152
    Top = 40
  end
  object ini1: Tini
    IniFilename = 'c:\program files\codegear\rad studio\5.0\bin\config.ini'
    Left = 288
    Top = 60
  end
  object Encriptador1: TEncriptador
    MetodoEncriptado = 1
    Left = 288
    Top = 184
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 360000
    OnTimer = Timer1Timer
    Left = 48
    Top = 64
  end
  object BaseRemota: TZConnection
    Protocol = 'mysql-5'
    HostName = 'localhost'
    Port = 3306
    Database = 'dbborgest'
    User = 'root'
    Password = 'root'
    Left = 152
    Top = 112
  end
  object ZQBuscar: TZQuery
    Connection = ZBase
    Params = <>
    Left = 504
    Top = 96
  end
  object Permisos1: TPermisos
    abm = 0
    ConfSqlConnection = ZBase
    ConfIni = ini1
    Left = 288
    Top = 128
  end
  object UtilidadesDB1: TUtilidadesDB
    ConfBaseOrigen = ZBase
    ConfBaseDestino = BaseRemota
    ConfBaseLocal = ZBase
    ConfTipoDestino = 'DB'
    ConfEjecutarScript = False
    Left = 216
    Top = 128
  end
  object ZQProductoDeposito: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from configcolumnas'
      
        'inner join configcolumnadetalles on configcolumnas.configcolumna' +
        '_id=configcolumnadetalles.configcolumna_id'
      'where configcolumnas.configcolumna_grilla=:configcolumna_grilla')
    Params = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
    Left = 480
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
  end
  object ZQExcecSQLSinc: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 238
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQRemoteSelect: TZQuery
    Connection = BaseRemota
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQRemoteExcecSql: TZQuery
    Connection = BaseRemota
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 376
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQRemoteSelectDetalles: TZQuery
    Connection = BaseRemota
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 408
    Top = 54
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQMovimientosDepositos: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from configcolumnas'
      
        'inner join configcolumnadetalles on configcolumnas.configcolumna' +
        '_id=configcolumnadetalles.configcolumna_id'
      'where configcolumnas.configcolumna_grilla=:configcolumna_grilla')
    Params = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
  end
  object ZQMovimDepoDetalles: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from configcolumnas'
      
        'inner join configcolumnadetalles on configcolumnas.configcolumna' +
        '_id=configcolumnadetalles.configcolumna_id'
      'where configcolumnas.configcolumna_grilla=:configcolumna_grilla')
    Params = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
  end
  object ZQCodigo: TZQuery
    Connection = ZBase
    Params = <>
    Left = 576
    Top = 168
  end
  object ZQActualizarStock: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'update articulos set articulo_stock=articulo_stock+:cantidad'
      'where articulo_id=:articulo_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'articulo_id'
        ParamType = ptUnknown
      end>
    Left = 104
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'articulo_id'
        ParamType = ptUnknown
      end>
  end
  object ZSQLMonitor1: TZSQLMonitor
    MaxTraceCount = 100
    Left = 216
    Top = 240
  end
end
