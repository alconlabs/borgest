inherited ConfigListas: TConfigListas
  Caption = 'Configurar Listas'
  ClientHeight = 337
  ClientWidth = 454
  OnShow = FormShow
  ExplicitWidth = 470
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 454
    Height = 337
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 9
      Top = 10
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 258
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ancho de ventana'
    end
    inherited btncancelar: TButton
      Left = 368
      Top = 286
      TabOrder = 4
      ExplicitLeft = 368
      ExplicitTop = 286
    end
    inherited btnguardar: TButton
      Left = 283
      Top = 286
      TabOrder = 3
      OnClick = btnguardarClick
      ExplicitLeft = 283
      ExplicitTop = 286
    end
    object DBGrid1: TDBGrid
      Left = 55
      Top = 34
      Width = 388
      Height = 215
      DataSource = DTSconfigcolumnadetalles
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'configcolumnadeta_titulo'
          Title.Caption = 'Columna'
          Width = 212
          Visible = True
        end
        item
          DropDownRows = 2
          Expanded = False
          FieldName = 'estado'
          PickList.Strings = (
            'Visible'
            'Oculta')
          Title.Caption = 'Estado'
          Width = 124
          Visible = True
        end>
    end
    object configcolumna_nombre: TEdit
      Left = 55
      Top = 7
      Width = 388
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object configcolumna_anchoventana: TEdit
      Left = 100
      Top = 255
      Width = 74
      Height = 21
      TabOrder = 2
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from configcolumnas'
      'where configcolumna_id=:configcolumna_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_id'
        ParamType = ptUnknown
      end>
    Left = 400
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 144
    Top = 152
  end
  object DTSconfigcolumnadetalles: TDataSource
    DataSet = ZQconfigcolumnadetalles
    Left = 344
    Top = 136
  end
  object ZQconfigcolumnadetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select *, if(configcolumnadeta_visible=-1,"Visible","Oculta") as' +
        ' estado'
      'from configcolumnadetalles'
      'where configcolumna_id=:configcolumna_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_id'
        ParamType = ptUnknown
      end>
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 200
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_id'
        ParamType = ptUnknown
      end>
    object ZQconfigcolumnadetallesconfigcolumnadeta_id: TIntegerField
      FieldName = 'configcolumnadeta_id'
    end
    object ZQconfigcolumnadetallesconfigcolumnadeta_campo: TStringField
      FieldName = 'configcolumnadeta_campo'
      Size = 100
    end
    object ZQconfigcolumnadetallesconfigcolumnadeta_visible: TIntegerField
      FieldName = 'configcolumnadeta_visible'
    end
    object ZQconfigcolumnadetallesconfigcolumnadeta_titulo: TStringField
      FieldName = 'configcolumnadeta_titulo'
      Size = 45
    end
    object ZQconfigcolumnadetallesconfigcolumna_id: TIntegerField
      FieldName = 'configcolumna_id'
    end
    object ZQconfigcolumnadetallesestado: TStringField
      FieldName = 'estado'
      Size = 7
    end
  end
end
