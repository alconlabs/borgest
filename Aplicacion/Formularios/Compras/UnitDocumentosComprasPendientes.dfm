object DocumentosComprasPendientes: TDocumentosComprasPendientes
  Left = 0
  Top = 0
  Caption = 'Documentos de Compras Pendientes'
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
      DataSource = DTSDocumentosComprasPendientes
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
          FieldName = 'documentocompra_fecha'
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
          FieldName = 'documentocompra_numero'
          Title.Caption = 'Numero'
          Width = 60
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentocompra_total'
          Title.Caption = 'Importe'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentocompra_pagado'
          Title.Caption = 'Pagado'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentocompra_saldo'
          Title.Caption = 'Saldo'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'documentocompradoc_importe'
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
  object ZQDocumentosComprasPendientes: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQDocumentosComprasPendientesBeforePost
    AfterPost = ZQDocumentosComprasPendientesAfterPost
    SQL.Strings = (
      'select *, 0.00 as documentocompradoc_importe,'
      
        'if(tiposdocumento.tipodocu_debcred="DEBITO",documentoscompras.do' +
        'cumentocompra_saldo,documentoscompras.documentocompra_saldo*(-1)' +
        ') as documentocomprasaldo '
      'from documentoscompras'
      
        'inner join tiposdocumento on documentoscompras.tipodocu_id=tipos' +
        'documento.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentocompra_estado='#39'PENDIENTE'#39)
    Params = <>
    Left = 240
    Top = 168
    object ZQDocumentosComprasPendientesdocumentocompra_id: TIntegerField
      FieldName = 'documentocompra_id'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_numero: TIntegerField
      FieldName = 'documentocompra_numero'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_fecha: TDateField
      FieldName = 'documentocompra_fecha'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_hora: TTimeField
      FieldName = 'documentocompra_hora'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_total: TFloatField
      FieldName = 'documentocompra_total'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_estado: TStringField
      FieldName = 'documentocompra_estado'
      Size = 45
    end
    object ZQDocumentosComprasPendientesdocumentocompra_pagado: TFloatField
      FieldName = 'documentocompra_pagado'
      DisplayFormat = '0.00'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_saldo: TFloatField
      FieldName = 'documentocompra_saldo'
      DisplayFormat = '0.00'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_observacion: TStringField
      FieldName = 'documentocompra_observacion'
      Size = 255
    end
    object ZQDocumentosComprasPendientesdocumentocompra_condicionventa: TIntegerField
      FieldName = 'documentocompra_condicionventa'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_fechavenc: TDateField
      FieldName = 'documentocompra_fechavenc'
    end
    object ZQDocumentosComprasPendientespersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQDocumentosComprasPendientesproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQDocumentosComprasPendientestipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_neto21: TFloatField
      FieldName = 'documentocompra_neto21'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_iva21: TFloatField
      FieldName = 'documentocompra_iva21'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_neto105: TFloatField
      FieldName = 'documentocompra_neto105'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_iva105: TFloatField
      FieldName = 'documentocompra_iva105'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_otrosimpuestos: TFloatField
      FieldName = 'documentocompra_otrosimpuestos'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_puntoventa: TIntegerField
      FieldName = 'documentocompra_puntoventa'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_neto27: TFloatField
      FieldName = 'documentocompra_neto27'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_iva27: TFloatField
      FieldName = 'documentocompra_iva27'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_nogravado: TFloatField
      FieldName = 'documentocompra_nogravado'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_tishhperc: TFloatField
      FieldName = 'documentocompra_tishhperc'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_ivaret: TFloatField
      FieldName = 'documentocompra_ivaret'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_ivaperc: TFloatField
      FieldName = 'documentocompra_ivaperc'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_dgrret: TFloatField
      FieldName = 'documentocompra_dgrret'
    end
    object ZQDocumentosComprasPendientesdocumentocompra_dgrperc: TFloatField
      FieldName = 'documentocompra_dgrperc'
    end
    object ZQDocumentosComprasPendientestipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
    end
    object ZQDocumentosComprasPendientestipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQDocumentosComprasPendientestipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQDocumentosComprasPendientestipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQDocumentosComprasPendientestipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQDocumentosComprasPendientestipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQDocumentosComprasPendientestipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQDocumentosComprasPendientestipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQDocumentosComprasPendientespuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
    end
    object ZQDocumentosComprasPendientestipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQDocumentosComprasPendientestipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQDocumentosComprasPendientestipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
    end
    object ZQDocumentosComprasPendientestipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQDocumentosComprasPendientestipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQDocumentosComprasPendientestipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQDocumentosComprasPendientestipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQDocumentosComprasPendientestipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQDocumentosComprasPendientestipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQDocumentosComprasPendientestipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQDocumentosComprasPendientestipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQDocumentosComprasPendientestipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQDocumentosComprasPendientestipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQDocumentosComprasPendientespuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
    end
    object ZQDocumentosComprasPendientespuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQDocumentosComprasPendientespuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQDocumentosComprasPendientessucursal_id: TIntegerField
      FieldName = 'sucursal_id'
    end
    object ZQDocumentosComprasPendientespuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQDocumentosComprasPendientespuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQDocumentosComprasPendientesdocumentocompradoc_importe: TFloatField
      FieldName = 'documentocompradoc_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentosComprasPendientesdocumentocomprasaldo: TFloatField
      FieldName = 'documentocomprasaldo'
      ReadOnly = True
    end
  end
  object DTSDocumentosComprasPendientes: TDataSource
    DataSet = ZQDocumentosComprasPendientes
    OnDataChange = DTSDocumentosComprasPendientesDataChange
    Left = 416
    Top = 168
  end
end
