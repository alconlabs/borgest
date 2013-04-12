object DocumentosVentasPendientes: TDocumentosVentasPendientes
  Left = 0
  Top = 0
  Caption = 'Documentos Pendientes'
  ClientHeight = 365
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 365
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
    StatusBar.BevelInner = True
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Text = 
      'F6 - Cargar Automaticamente                             F9 - Ace' +
      'ptar'
    StatusBar.Color = 12560553
    StatusBar.ColorTo = 14602191
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object lblpagado: TLabel
      Left = 636
      Top = 276
      Width = 63
      Height = 13
      Caption = 'Total pagado'
    end
    object lblapagar: TLabel
      Left = 9
      Top = 276
      Width = 55
      Height = 13
      Caption = 'A pagar:     '
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 752
      Height = 270
      Align = alTop
      DataSource = DTSDocumentosVentasPendientes
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnEditButtonClick = DBGrid1EditButtonClick
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipodocu_nombre'
          Title.Caption = 'Documento'
          Width = 155
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'puntoventa_numero'
          Title.Caption = 'Pto. Vta.'
          Width = 46
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 60
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_total'
          Title.Caption = 'Importe'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_pagado'
          Title.Caption = 'Pagado'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventasaldo'
          Title.Caption = 'Saldo'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'documentoventadoc_importe'
          Title.Caption = 'A Pagar'
          Width = 90
          Visible = True
        end>
    end
    object btnaceptar: TButton
      Left = 593
      Top = 318
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 1
    end
    object btncancelar: TButton
      Left = 667
      Top = 318
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object btnimputardocumentos: TButton
      Left = 9
      Top = 318
      Width = 136
      Height = 25
      Caption = 'Cargar Automaticamente'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object ZQDocumentosVentasPendientes: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQDocumentosVentasPendientesBeforePost
    AfterPost = ZQDocumentosVentasPendientesAfterPost
    SQL.Strings = (
      'select *, 0.00 as documentoventadoc_importe,'
      
        'if(tiposdocumento.tipodocu_debcred="DEBITO",documentosventas.doc' +
        'umentoventa_saldo,documentosventas.documentoventa_saldo*(-1)) as' +
        ' documentoventasaldo '
      'from documentosventas'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentoventa_estado='#39'PENDIENTE'#39)
    Params = <>
    Left = 240
    Top = 168
    object ZQDocumentosVentasPendientesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object ZQDocumentosVentasPendientesdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_hora: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_neto21: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_iva21: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_neto105: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_iva105: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_netonogravado: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
      DisplayFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
      DisplayFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
      DisplayFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQDocumentosVentasPendientescliente_id: TIntegerField
      FieldName = 'cliente_id'
      Required = True
    end
    object ZQDocumentosVentasPendientespersonal_id: TIntegerField
      FieldName = 'personal_id'
      Required = True
    end
    object ZQDocumentosVentasPendientestipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQDocumentosVentasPendientesdocumentoventa_condicionventa: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_fechavenc: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_listaprecio: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object ZQDocumentosVentasPendientestipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object ZQDocumentosVentasPendientestipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQDocumentosVentasPendientestipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQDocumentosVentasPendientestipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQDocumentosVentasPendientestipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQDocumentosVentasPendientestipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQDocumentosVentasPendientestipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQDocumentosVentasPendientestipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQDocumentosVentasPendientespuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQDocumentosVentasPendientestipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQDocumentosVentasPendientespuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
      Required = True
    end
    object ZQDocumentosVentasPendientespuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQDocumentosVentasPendientespuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQDocumentosVentasPendientessucursal_id: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object ZQDocumentosVentasPendientestipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventadoc_importe: TFloatField
      FieldName = 'documentoventadoc_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_equipo1: TStringField
      FieldName = 'documentoventa_equipo1'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventa_equipo2: TStringField
      FieldName = 'documentoventa_equipo2'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventa_formapago: TStringField
      FieldName = 'documentoventa_formapago'
      Size = 255
    end
    object ZQDocumentosVentasPendientesdocumentoventa_nrodetallepago: TStringField
      FieldName = 'documentoventa_nrodetallepago'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventa_solicitudcliente: TStringField
      FieldName = 'documentoventa_solicitudcliente'
      Size = 255
    end
    object ZQDocumentosVentasPendientesdocumentoventa_trabajorealizado: TStringField
      FieldName = 'documentoventa_trabajorealizado'
      Size = 255
    end
    object ZQDocumentosVentasPendientescaja_id: TIntegerField
      FieldName = 'caja_id'
    end
    object ZQDocumentosVentasPendientestipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
      Required = True
    end
    object ZQDocumentosVentasPendientestipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQDocumentosVentasPendientestipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQDocumentosVentasPendientestipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQDocumentosVentasPendientestipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQDocumentosVentasPendientestipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQDocumentosVentasPendientestipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQDocumentosVentasPendientestipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQDocumentosVentasPendientestipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQDocumentosVentasPendientestipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQDocumentosVentasPendientestipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQDocumentosVentasPendientespuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQDocumentosVentasPendientespuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQDocumentosVentasPendientesdocumentoventasaldo: TFloatField
      FieldName = 'documentoventasaldo'
      ReadOnly = True
    end
  end
  object DTSDocumentosVentasPendientes: TDataSource
    DataSet = ZQDocumentosVentasPendientes
    OnDataChange = DTSDocumentosVentasPendientesDataChange
    Left = 416
    Top = 168
  end
end
