inherited EstadoComisionesBorradores: TEstadoComisionesBorradores
  Caption = 'Detalle Comisiones Borradores'
  ClientHeight = 385
  ClientWidth = 740
  OnShow = FormShow
  ExplicitWidth = 756
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 740
    Height = 385
    ExplicitWidth = 740
    ExplicitHeight = 385
    FullHeight = 0
    object Label4: TLabel [0]
      Left = 11
      Top = 16
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    inherited btncancelar: TButton
      Left = 476
      Top = 334
      Visible = False
      ExplicitLeft = 476
      ExplicitTop = 334
    end
    inherited btnguardar: TButton
      Left = 454
      Top = 11
      Caption = 'Actualizar'
      OnClick = btnguardarClick
      ExplicitLeft = 454
      ExplicitTop = 11
    end
    object personal_id: TSqlComboBox
      Left = 62
      Top = 13
      Width = 386
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal'
        'order by personal_nombre')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object DBGrid1: TDBGrid
      Left = 11
      Top = 42
      Width = 718
      Height = 286
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
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero'
          Title.Caption = 'Numero'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'equipo'
          Title.Caption = 'Equipo'
          Width = 215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importe'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'acumulado'
          Title.Caption = 'Acumulado'
          Width = 102
          Visible = True
        end>
    end
    object btnimprimir: TButton
      Left = 11
      Top = 334
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 4
      OnClick = btnimprimirClick
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 248
    Top = 152
  end
  object DTSDetalles: TDataSource
    DataSet = MQDetalles
    Left = 368
    Top = 80
  end
  object MQDetalles: TMQuery
    Connection = Princ.ZBase
    SortedFields = 'fecha;orden;numero;detalle_id'
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as id,f as fecha,t as tipo,t as numero,d as importe,t a' +
        's tipodocu_nombre,i as orden,d as acumulado,i as detalle_id,t as' +
        ' equipo from temp ')
    Params = <>
    IndexFieldNames = 'fecha Asc;orden Asc;numero Asc;detalle_id Asc'
    ConfCampos.Strings = (
      'id,i'
      'fecha,f'
      'tipo,t'
      'numero,t'
      'importe,d'
      'tipodocu_nombre,t'
      'orden,i'
      'acumulado,d'
      'detalle_id,i'
      'equipo,t')
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
    object MQDetallesorden: TIntegerField
      FieldName = 'orden'
    end
    object MQDetallesacumulado: TFloatField
      FieldName = 'acumulado'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQDetallesdetalle_id: TIntegerField
      FieldName = 'detalle_id'
    end
    object MQDetallesequipo: TStringField
      FieldName = 'equipo'
      Size = 255
    end
  end
end
