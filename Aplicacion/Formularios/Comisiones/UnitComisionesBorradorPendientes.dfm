object ComisionesBorradorPendientes: TComisionesBorradorPendientes
  Left = 0
  Top = 0
  Caption = 'Documentos Pendientes'
  ClientHeight = 365
  ClientWidth = 876
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
    Width = 876
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
      Left = 756
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
      Width = 876
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
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_numero'
          Title.Caption = 'Numero'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventa_equipo1'
          Title.Caption = 'Equipo'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_nombre'
          Title.Caption = 'Cliente'
          Width = 206
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_total'
          Title.Caption = 'Importe'
          Width = 82
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_pagado'
          Title.Caption = 'Pagado'
          Width = 81
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_saldo'
          Title.Caption = 'Saldo'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'liquidacionborradordetalle_importe'
          Title.Caption = 'A Pagar'
          Width = 90
          Visible = True
        end>
    end
    object btnaceptar: TButton
      Left = 713
      Top = 318
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 1
    end
    object btncancelar: TButton
      Left = 787
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
      
        'select *, 0.00 as liquidacionborradordetalle_importe from docume' +
        'ntosventas'
      
        'inner join documentoventadetalles on documentosventas.documentov' +
        'enta_id=documentoventadetalles.documentoventa_id'
      
        'inner join docuvendetcomisionesvendedores on documentoventadetal' +
        'les.documentoventadetalle_id=docuvendetcomisionesvendedores.docu' +
        'mentoventadetalle_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id')
    Params = <>
    Left = 240
    Top = 168
    object ZQDocumentosVentasPendientesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
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
    end
    object ZQDocumentosVentasPendientesdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQDocumentosVentasPendientescliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object ZQDocumentosVentasPendientespersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQDocumentosVentasPendientestipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
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
    object ZQDocumentosVentasPendientesdocumentoventa_recargo: TFloatField
      FieldName = 'documentoventa_recargo'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_descuento: TFloatField
      FieldName = 'documentoventa_descuento'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQDocumentosVentasPendientesproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQDocumentosVentasPendientesdocumentoventa_id_1: TIntegerField
      FieldName = 'documentoventa_id_1'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_importe1: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_importe2: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_importe3: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_importe4: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_importe5: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_importe6: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_listaprecio: TIntegerField
      FieldName = 'documentoventadetalle_listaprecio'
    end
    object ZQDocumentosVentasPendientesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
    object ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_id: TIntegerField
      FieldName = 'docuvendetcomisionvendedor_id'
    end
    object ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_importeunit: TFloatField
      FieldName = 'docuvendetcomisionvendedor_importeunit'
    end
    object ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_total: TFloatField
      FieldName = 'docuvendetcomisionvendedor_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocumentoventadetalle_id_1: TIntegerField
      FieldName = 'documentoventadetalle_id_1'
    end
    object ZQDocumentosVentasPendientespersonal_id_1: TIntegerField
      FieldName = 'personal_id_1'
    end
    object ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_saldo: TFloatField
      FieldName = 'docuvendetcomisionvendedor_saldo'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_pagado: TFloatField
      FieldName = 'docuvendetcomisionvendedor_pagado'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentosVentasPendientesdocuvendetcomisionvendedor_estado: TStringField
      FieldName = 'docuvendetcomisionvendedor_estado'
      Size = 45
    end
    object ZQDocumentosVentasPendientestipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
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
    end
    object ZQDocumentosVentasPendientestipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQDocumentosVentasPendientestipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQDocumentosVentasPendientestipodocufiscal_id: TIntegerField
      FieldName = 'tipodocufiscal_id'
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
    object ZQDocumentosVentasPendientesliquidacionborradordetalle_importe: TFloatField
      FieldName = 'liquidacionborradordetalle_importe'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentosVentasPendientescliente_id_1: TIntegerField
      FieldName = 'cliente_id_1'
      Required = True
    end
    object ZQDocumentosVentasPendientescliente_nombre: TStringField
      FieldName = 'cliente_nombre'
      Size = 100
    end
    object ZQDocumentosVentasPendientescliente_domicilio: TStringField
      FieldName = 'cliente_domicilio'
      Size = 150
    end
    object ZQDocumentosVentasPendientescliente_documentonro: TStringField
      FieldName = 'cliente_documentonro'
      Size = 45
    end
    object ZQDocumentosVentasPendientescliente_documentotipo: TStringField
      FieldName = 'cliente_documentotipo'
      Size = 45
    end
    object ZQDocumentosVentasPendientescliente_telefono: TStringField
      FieldName = 'cliente_telefono'
      Size = 45
    end
    object ZQDocumentosVentasPendientescliente_celular: TStringField
      FieldName = 'cliente_celular'
      Size = 45
    end
    object ZQDocumentosVentasPendientescliente_mail: TStringField
      FieldName = 'cliente_mail'
      Size = 45
    end
    object ZQDocumentosVentasPendientescondicioniva_id: TIntegerField
      FieldName = 'condicioniva_id'
      Required = True
    end
    object ZQDocumentosVentasPendientescliente_listaprecio: TIntegerField
      FieldName = 'cliente_listaprecio'
    end
    object ZQDocumentosVentasPendientescliente_condicionventa: TStringField
      FieldName = 'cliente_condicionventa'
      Size = 45
    end
    object ZQDocumentosVentasPendienteslocalidad_id: TIntegerField
      FieldName = 'localidad_id'
      Required = True
    end
    object ZQDocumentosVentasPendientescliente_observaciones: TStringField
      FieldName = 'cliente_observaciones'
      Size = 255
    end
    object ZQDocumentosVentasPendientespersonal_id_2: TIntegerField
      FieldName = 'personal_id_2'
      Required = True
    end
    object ZQDocumentosVentasPendientescliente_diasvenc: TIntegerField
      FieldName = 'cliente_diasvenc'
    end
  end
  object DTSDocumentosVentasPendientes: TDataSource
    DataSet = ZQDocumentosVentasPendientes
    OnDataChange = DTSDocumentosVentasPendientesDataChange
    Left = 416
    Top = 168
  end
end
