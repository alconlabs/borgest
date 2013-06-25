object DocumentosPendientes: TDocumentosPendientes
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
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BevelInner = True
    StatusBar.BorderColor = clNone
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Text = 
      'F6 - Cargar Automaticamente                             F9 - Ace' +
      'ptar'
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
      Color = clBtnFace
      ParentColor = False
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 750
      Height = 270
      Align = alTop
      DataSource = DTSDocumentosPendientes
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
          FieldName = 'documento_fecha'
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
          FieldName = 'documento_numero'
          Title.Caption = 'Numero'
          Width = 60
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documento_total'
          Title.Caption = 'Kgs Contratados'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documento_pagado'
          Title.Caption = 'Entregados'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentosaldo'
          Title.Caption = 'Saldo Actual'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'documentodoc_importe'
          Title.Caption = 'Aplicacion actual'
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
  object ZQDocumentosPendientes: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQDocumentosPendientesBeforePost
    AfterPost = ZQDocumentosPendientesAfterPost
    SQL.Strings = (
      'select *, 0.00 as documentodoc_importe,'
      
        'if(tiposdocumento.tipodocu_debcred="DEBITO",documentos.documento' +
        '_saldo,documentos.documento_saldo*(-1)) as documentosaldo '
      'from documentos'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documento_estado='#39'PENDIENTE'#39' and'
      'tipodocu_nombre='#39'Contrato de Compra'#39)
    Params = <>
    Left = 240
    Top = 168
    object ZQDocumentosPendientesdocumento_id: TIntegerField
      FieldName = 'documento_id'
      Required = True
    end
    object ZQDocumentosPendientesdocumento_fecha: TDateField
      FieldName = 'documento_fecha'
    end
    object ZQDocumentosPendientesdocumento_fechavenc: TDateField
      FieldName = 'documento_fechavenc'
    end
    object ZQDocumentosPendientesdocumento_hora: TTimeField
      FieldName = 'documento_hora'
    end
    object ZQDocumentosPendientesdocumento_numero: TIntegerField
      FieldName = 'documento_numero'
    end
    object ZQDocumentosPendientesdocumento_total: TFloatField
      FieldName = 'documento_total'
    end
    object ZQDocumentosPendientesdocumento_saldo: TFloatField
      FieldName = 'documento_saldo'
    end
    object ZQDocumentosPendientesdocumento_pagado: TFloatField
      FieldName = 'documento_pagado'
    end
    object ZQDocumentosPendientesdocumento_estado: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object ZQDocumentosPendientesdocumento_neto21: TFloatField
      FieldName = 'documento_neto21'
    end
    object ZQDocumentosPendientesdocumento_iva21: TFloatField
      FieldName = 'documento_iva21'
    end
    object ZQDocumentosPendientesdocumento_neto105: TFloatField
      FieldName = 'documento_neto105'
    end
    object ZQDocumentosPendientesdocumento_iva105: TFloatField
      FieldName = 'documento_iva105'
    end
    object ZQDocumentosPendientesdocumento_neto27: TFloatField
      FieldName = 'documento_neto27'
    end
    object ZQDocumentosPendientesdocumento_iva27: TFloatField
      FieldName = 'documento_iva27'
    end
    object ZQDocumentosPendientesdocumento_observaciones: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object ZQDocumentosPendientesdocumento_ivaret: TFloatField
      FieldName = 'documento_ivaret'
    end
    object ZQDocumentosPendientesdocumento_ivaperc: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object ZQDocumentosPendientesdocumento_dgrret: TFloatField
      FieldName = 'documento_dgrret'
    end
    object ZQDocumentosPendientesdocumento_dgrperc: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object ZQDocumentosPendientesdocumento_otrosimpuestos: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object ZQDocumentosPendientesdocumento_calidad: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object ZQDocumentosPendientesdocumento_documentacion: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object ZQDocumentosPendientestipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQDocumentosPendientesentidad_id: TIntegerField
      FieldName = 'entidad_id'
      Required = True
    end
    object ZQDocumentosPendientesentidadtransportista_id: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object ZQDocumentosPendientesespecie_id: TIntegerField
      FieldName = 'especie_id'
      Required = True
    end
    object ZQDocumentosPendientesdocumento_fechacumplimiento: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object ZQDocumentosPendientesdocumento_moneda: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object ZQDocumentosPendientesdocumento_preciounitario: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object ZQDocumentosPendientesdocumento_lugarentrega: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object ZQDocumentosPendientesdocumento_tipooperacion: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object ZQDocumentosPendientesdocumento_condicioncalidad: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object ZQDocumentosPendientesdocumento_tipodestino: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object ZQDocumentosPendientesdocumento_numerocartaporte: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object ZQDocumentosPendientesdocumento_kgbrutos: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object ZQDocumentosPendientesdocumento_tara: TFloatField
      FieldName = 'documento_tara'
    end
    object ZQDocumentosPendientestipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object ZQDocumentosPendientestipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQDocumentosPendientestipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQDocumentosPendientestipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQDocumentosPendientestipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQDocumentosPendientestipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQDocumentosPendientestipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQDocumentosPendientestipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQDocumentosPendientestipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQDocumentosPendientestipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQDocumentosPendientestipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQDocumentosPendientestipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQDocumentosPendientestipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQDocumentosPendientestipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQDocumentosPendientestipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQDocumentosPendientestipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQDocumentosPendientestipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQDocumentosPendientestipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQDocumentosPendientestipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQDocumentosPendientestipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQDocumentosPendientespuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQDocumentosPendientestipodocu_tipoctacte: TStringField
      FieldName = 'tipodocu_tipoctacte'
      Size = 45
    end
    object ZQDocumentosPendientespuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
      Required = True
    end
    object ZQDocumentosPendientespuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQDocumentosPendientespuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQDocumentosPendientespuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQDocumentosPendientespuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQDocumentosPendientessucursal_id: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object ZQDocumentosPendientesdocumentodoc_importe: TFloatField
      FieldName = 'documentodoc_importe'
    end
    object ZQDocumentosPendientesdocumentosaldo: TFloatField
      FieldName = 'documentosaldo'
    end
  end
  object DTSDocumentosPendientes: TDataSource
    DataSet = ZQDocumentosPendientes
    OnDataChange = DTSDocumentosPendientesDataChange
    Left = 416
    Top = 168
  end
end
