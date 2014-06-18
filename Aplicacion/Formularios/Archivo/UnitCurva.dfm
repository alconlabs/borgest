inherited Curva: TCurva
  Caption = 'Curva'
  ClientHeight = 364
  ClientWidth = 452
  ExplicitWidth = 468
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 452
    Height = 364
    ExplicitWidth = 452
    ExplicitHeight = 364
    FullHeight = 0
    object Label15: TLabel [0]
      Left = 16
      Top = 10
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object Label3: TLabel [1]
      Left = 9
      Top = 34
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label21: TLabel [2]
      Left = 16
      Top = 58
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marca'
    end
    object Label1: TLabel [3]
      Left = 7
      Top = 82
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Seccion'
    end
    object Label2: TLabel [4]
      Left = 17
      Top = 106
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rubro'
    end
    inherited btncancelar: TButton
      Left = 366
      Top = 312
      TabOrder = 7
      ExplicitLeft = 366
      ExplicitTop = 312
    end
    inherited btnguardar: TButton
      Left = 285
      Top = 312
      TabOrder = 6
      ExplicitLeft = 285
      ExplicitTop = 312
    end
    object curva_id: TEdit
      Left = 55
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object curva_descripcion: TEdit
      Left = 55
      Top = 31
      Width = 386
      Height = 21
      TabOrder = 1
    end
    object marca_id: TSqlComboBox
      Left = 55
      Top = 55
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from marcas'
        'order by marca_nombre')
      ConfTabla = 'marcas'
      Confcampo_codigo = 'marca_id'
      Confcampo_nomb = 'marca_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object seccion_id: TSqlComboBox
      Left = 55
      Top = 79
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from secciones'
        'order by seccion_nombre')
      ConfTabla = 'secciones'
      Confcampo_codigo = 'seccion_id'
      Confcampo_nomb = 'seccion_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object rubro_id: TSqlComboBox
      Left = 55
      Top = 103
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from rubros'
        'order by rubro_nombre')
      ConfTabla = 'rubros'
      Confcampo_codigo = 'rubro_id'
      Confcampo_nomb = 'rubro_nombre'
      Tag2 = 0
      ConfNuevo = True
    end
    object DBGrid1: TDBGrid
      Left = 55
      Top = 130
      Width = 206
      Height = 207
      DataSource = DTSCurvadetalles
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'curvadetalle_talle'
          Title.Caption = 'Talles'
          Width = 103
          Visible = True
        end>
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from curvas'
      'where curva_id=:curva_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'curva_id'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'curva_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 304
    Top = 136
  end
  object DTSCurvadetalles: TDataSource
    DataSet = ZQCurvadetalles
    Left = 296
    Top = 192
  end
  object ZQCurvadetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from curvadetalles')
    Params = <>
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 352
    Top = 240
    object ZQCurvadetallescurvadetalle_id: TIntegerField
      FieldName = 'curvadetalle_id'
    end
    object ZQCurvadetallescurvadetalle_talle: TStringField
      Alignment = taRightJustify
      FieldName = 'curvadetalle_talle'
      Size = 10
    end
    object ZQCurvadetallescurva_id: TIntegerField
      FieldName = 'curva_id'
    end
  end
end
