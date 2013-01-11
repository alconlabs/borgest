object impresorafiscalcola: Timpresorafiscalcola
  Left = 0
  Top = 0
  Caption = 'Documentos para imprimir en Controlador Fiscal'
  ClientHeight = 445
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object impresorafiscal: TAdvPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 445
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
    object Label15: TLabel
      Left = 298
      Top = 418
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pumto de Venta'
    end
    object btnimprimir: TButton
      Left = 550
      Top = 413
      Width = 115
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = btnimprimirClick
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 680
      Height = 407
      Align = alTop
      DataSource = DSCDocumentosventas
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Venta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_nombre'
          Title.Caption = 'Documento'
          Width = 176
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_letra'
          Title.Caption = 'Tipo'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 267
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 100
          Visible = True
        end>
    end
    object btnreportez: TButton
      Left = 429
      Top = 413
      Width = 115
      Height = 25
      Caption = 'Reporte Z'
      TabOrder = 2
      OnClick = btnreportezClick
    end
    object btncancelar: TButton
      Left = 11
      Top = 413
      Width = 115
      Height = 25
      Caption = 'Cancelar Todo'
      TabOrder = 3
    end
    object btnactualizar: TButton
      Left = 131
      Top = 413
      Width = 115
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 4
      OnClick = btnactualizarClick
    end
    object puntoventa_id: TSqlComboBox
      Left = 377
      Top = 415
      Width = 52
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select puntodeventa.* from tiposdocumento'
        
          'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
          'enta.puntoventa_id'
        'where tipodocu_fiscal=-1'
        'group by puntodeventa.puntoventa_id'
        'order by puntoventa_numero')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
  end
  object DSCDocumentosventas: TDataSource
    DataSet = ZQDocumentosventas
    Left = 328
    Top = 256
  end
  object ZQDocumentosventas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join personal on documentosventas.personal_id=personal.per' +
        'sonal_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventa_numero=0 and'
      'tipodocu_fiscal=-1'
      'order by documentosventas.documentoventa_numero')
    Params = <>
    Left = 464
    Top = 256
  end
end
