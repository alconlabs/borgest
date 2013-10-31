inherited SaldosComisionesBorradores: TSaldosComisionesBorradores
  Caption = 'Saldos Comisiones Borradores'
  ClientHeight = 385
  ClientWidth = 574
  OnShow = FormShow
  ExplicitWidth = 590
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 574
    Height = 385
    ExplicitWidth = 574
    ExplicitHeight = 385
    FullHeight = 0
    object Label4: TLabel [0]
      Left = 19
      Top = 16
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    inherited btncancelar: TButton
      Left = 484
      Top = 326
      Visible = False
      ExplicitLeft = 484
      ExplicitTop = 326
    end
    inherited btnguardar: TButton
      Left = 462
      Top = 11
      Caption = 'Actualizar'
      OnClick = btnguardarClick
      ExplicitLeft = 462
      ExplicitTop = 11
    end
    object personal_id: TSqlComboBox
      Left = 70
      Top = 13
      Width = 386
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object DBGrid1: TDBGrid
      Left = 70
      Top = 42
      Width = 467
      Height = 241
      DataSource = DTSDetalles
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'fecha'
          Title.Caption = 'Fecha'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo'
          Title.Caption = 'Tipo'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero'
          Title.Caption = 'Numero'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end>
    end
  end
  object DTSDetalles: TDataSource
    DataSet = MQDetalles
    Left = 368
    Top = 80
  end
  object MQDetalles: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'id;fecha;numero'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as id,f as fecha,t as tipo,t as numero,d as importe,t a' +
        's tipodocu_nombre from temp ')
    Params = <>
    IndexFieldNames = 'id Asc;fecha Asc;numero Asc'
    ConfCampos.Strings = (
      'id,i'
      'fecha,f'
      'tipo,t'
      'numero,t'
      'importe,d'
      'tipodocu_nombre,t')
    Left = 408
    Top = 176
    object MQDetallesid: TIntegerField
      FieldName = 'id'
    end
    object MQDetallesfecha: TDateField
      FieldName = 'fecha'
    end
    object MQDetallestipo: TStringField
      FieldName = 'tipo'
      Size = 255
    end
    object MQDetallesimporte: TFloatField
      FieldName = 'importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQDetallestipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 255
    end
    object MQDetallesnumero: TStringField
      FieldName = 'numero'
      Size = 255
    end
  end
end
