object calculoprecioproductos: Tcalculoprecioproductos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Calculo de precio en producto'
  ClientHeight = 244
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 244
    Align = alClient
    BevelOuter = bvNone
    Color = 15524577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    Caption.Color = 15722471
    Caption.ColorTo = 11176072
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = 11769496
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    ExplicitWidth = 709
    ExplicitHeight = 272
    FullHeight = 0
    object btncancelar: TButton
      Left = 502
      Top = 191
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object btnguardar: TButton
      Left = 421
      Top = 191
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 5
      OnClick = btnguardarClick
    end
    object btnagregar: TButton
      Left = 0
      Top = 167
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 1
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 81
      Top = 167
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 2
      OnClick = btnquitarClick
    end
    object btnsubir: TButton
      Left = 583
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Subir'
      TabOrder = 3
      OnClick = btnsubirClick
    end
    object btnbajar: TButton
      Left = 583
      Top = 34
      Width = 75
      Height = 25
      Caption = 'Bajar'
      TabOrder = 4
      OnClick = btnbajarClick
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 10
      Width = 572
      Height = 151
      DataSource = DTSCalculopreciodeta
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'calculopreciodetaprod_orden'
          Title.Caption = 'Nro.'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calculopreciodetaprod_descripcion'
          Title.Caption = 'Descripcion'
          Width = 269
          Visible = True
        end
        item
          DropDownRows = 2
          Expanded = False
          FieldName = 'calculopreciodetaprod_tipo'
          PickList.Strings = (
            'Porcentaje'
            'Valor Fijo')
          Title.Caption = 'Tipo'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calculopreciodetaprod_valor'
          Title.Caption = 'Valor'
          Width = 98
          Visible = True
        end>
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from calculoprecios'
      'where calculoprecio_id=:calculoprecio_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
    Left = 408
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
  end
  object ZQCalculopreciodetaprod: TZQuery
    Connection = Princ.ZBase
    SortedFields = 'calculopreciodetaprod_orden'
    CachedUpdates = True
    BeforeInsert = ZQCalculopreciodetaprodBeforeInsert
    BeforePost = ZQCalculopreciodetaprodBeforePost
    SQL.Strings = (
      'select * from calculopreciodetaprod')
    Params = <>
    IndexFieldNames = 'calculopreciodetaprod_orden Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 168
    Top = 88
    object ZQCalculopreciodetaprodcalculopreciodetaprod_id: TIntegerField
      FieldName = 'calculopreciodetaprod_id'
      Required = True
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_descripcion: TStringField
      FieldName = 'calculopreciodetaprod_descripcion'
      Size = 45
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_orden: TIntegerField
      FieldName = 'calculopreciodetaprod_orden'
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_tipo: TStringField
      FieldName = 'calculopreciodetaprod_tipo'
      Size = 15
    end
    object ZQCalculopreciodetaprodcalculopreciodetaprod_valor: TFloatField
      FieldName = 'calculopreciodetaprod_valor'
    end
    object ZQCalculopreciodetaprodproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
  end
  object DTSCalculopreciodeta: TDataSource
    DataSet = ZQCalculopreciodetaprod
    Left = 296
    Top = 96
  end
  object ZQProductos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productos'
      'where calculoprecio_id=:calculoprecio_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
    Left = 512
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
  end
end
