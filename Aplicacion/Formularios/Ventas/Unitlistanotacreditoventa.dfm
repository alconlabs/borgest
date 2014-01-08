object listanotacreditoventa: Tlistanotacreditoventa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Notas de Credito de Venta'
  ClientHeight = 450
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 1035
    Height = 450
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
    object panelbotonera: TAdvPanel
      Left = 932
      Top = 0
      Width = 103
      Height = 411
      Align = alRight
      BevelOuter = bvNone
      Color = 15524577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      Styler = Princ.AdvPanelStyler1
      FullHeight = 0
      object Button2: TButton
        Left = 0
        Top = 82
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 0
        Top = 41
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Modificar'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 0
        Top = 0
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Crear Nuevo'
        TabOrder = 0
        OnClick = Button4Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 932
      Height = 411
      Align = alClient
      DataSource = DSC
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 430
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_estado'
          Title.Caption = 'Estado'
          Width = 130
          Visible = True
        end>
    end
    object panelfiltros: TAdvPanel
      Left = 0
      Top = 411
      Width = 1035
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      Color = 15524577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      Styler = Princ.AdvPanelStyler1
      FullHeight = 0
      object Button5: TButton
        Left = 932
        Top = 0
        Width = 103
        Height = 21
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 4
        OnClick = Button5Click
      end
      object fil_documentoventa_numero: TEdit
        Left = 138
        Top = 0
        Width = 90
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
      object fil_documentoventa_fecha: TEdit
        Left = 0
        Top = 0
        Width = 92
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
      object fil_puntoventa_numero: TEdit
        Left = 92
        Top = 0
        Width = 46
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
      object fil_cliente_nombre: TEdit
        Left = 228
        Top = 0
        Width = 430
        Height = 21
        Align = alLeft
        TabOrder = 3
      end
      object fil_documentoventa_estado: TEdit
        Left = 788
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 5
      end
      object fil_documentoventa_total: TEdit
        Left = 658
        Top = 0
        Width = 130
        Height = 21
        Align = alLeft
        TabOrder = 6
      end
    end
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      'order by documentoventa_fecha, documentoventa_id')
    Params = <>
    Left = 216
    Top = 112
  end
  object DSC: TDataSource
    DataSet = ZQGrilla
    Left = 336
    Top = 128
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 160
    Top = 112
  end
  object CustomizeGrid1: TCustomizeGrid
    Active = True
    Grid = DBGrid1
    AlternateRows.Active = True
    AlternateRows.Color1 = clCream
    AlternateRows.Color2 = clWhite
    AlternateRows.Style = asStandard
    DataStyles.TextMemos = False
    DataStyles.CheckBox = False
    SortOptions.ChangeCursorOnTitle = False
    Left = 496
    Top = 176
  end
end
