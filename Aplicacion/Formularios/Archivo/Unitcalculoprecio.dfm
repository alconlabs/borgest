object calculoprecio: Tcalculoprecio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Calculo de precio'
  ClientHeight = 272
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 272
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
    FullHeight = 0
    object Label3: TLabel
      Left = 9
      Top = 34
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object Label15: TLabel
      Left = 13
      Top = 10
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo'
    end
    object btncancelar: TButton
      Left = 550
      Top = 239
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = btncancelarClick
    end
    object btnguardar: TButton
      Left = 469
      Top = 239
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 7
      OnClick = btnguardarClick
    end
    object btnagregar: TButton
      Left = 53
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 3
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 129
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 4
      OnClick = btnquitarClick
    end
    object calculoprecio_id: TEdit
      Left = 55
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object calculoprecio_nombre: TEdit
      Left = 55
      Top = 31
      Width = 386
      Height = 21
      TabOrder = 1
    end
    object btnsubir: TButton
      Left = 631
      Top = 58
      Width = 75
      Height = 25
      Caption = 'Subir'
      TabOrder = 5
      OnClick = btnsubirClick
    end
    object btnbajar: TButton
      Left = 631
      Top = 82
      Width = 75
      Height = 25
      Caption = 'Bajar'
      TabOrder = 6
      OnClick = btnbajarClick
    end
    object DBGrid1: TDBGrid
      Left = 53
      Top = 58
      Width = 572
      Height = 151
      DataSource = DTSCalculopreciodeta
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'calculopreciodeta_orden'
          Title.Caption = 'Nro.'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calculopreciodeta_descr'
          Title.Caption = 'Descripcion'
          Width = 269
          Visible = True
        end
        item
          DropDownRows = 2
          Expanded = False
          FieldName = 'calculopreciodeta_tipo'
          PickList.Strings = (
            'Porcentaje'
            'Valor Fijo')
          Title.Caption = 'Tipo'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calculopreciodeta_valor'
          Title.Caption = 'Valor'
          Width = 98
          Visible = True
        end>
    end
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQuery2AfterOpen
    SQL.Strings = (
      'select * from calculoprecios'
      'where calculoprecio_id=:calculoprecio_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
  end
  object ZQCalculopreciodeta: TZQuery
    Connection = Princ.ZBase
    SortedFields = 'calculopreciodeta_orden'
    CachedUpdates = True
    BeforePost = ZQCalculopreciodetaBeforePost
    SQL.Strings = (
      'select * from calculopreciodeta')
    Params = <>
    IndexFieldNames = 'calculopreciodeta_orden Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 192
    Top = 120
    object ZQCalculopreciodetacalculopreciodeta_id: TIntegerField
      FieldName = 'calculopreciodeta_id'
      Required = True
    end
    object ZQCalculopreciodetacalculopreciodeta_descr: TStringField
      FieldName = 'calculopreciodeta_descr'
      Size = 45
    end
    object ZQCalculopreciodetacalculopreciodeta_orden: TIntegerField
      FieldName = 'calculopreciodeta_orden'
    end
    object ZQCalculopreciodetacalculopreciodeta_tipo: TStringField
      FieldName = 'calculopreciodeta_tipo'
      Size = 15
    end
    object ZQCalculopreciodetacalculopreciodeta_valor: TFloatField
      FieldName = 'calculopreciodeta_valor'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQCalculopreciodetacalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
      Required = True
    end
  end
  object DTSCalculopreciodeta: TDataSource
    DataSet = ZQCalculopreciodeta
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
    Left = 632
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
  end
end
