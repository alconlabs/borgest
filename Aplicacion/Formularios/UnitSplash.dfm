inherited splash: Tsplash
  Caption = 'splash'
  ExplicitWidth = 557
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
  end
  object ZQLog: TZQuery
    Connection = Princ.BaseRemota
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
end
