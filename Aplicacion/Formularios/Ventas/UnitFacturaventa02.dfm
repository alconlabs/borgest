inherited facturaventa02: Tfacturaventa02
  Caption = 'Venta'
  ClientHeight = 657
  ClientWidth = 997
  Position = poScreenCenter
  ExplicitWidth = 1013
  ExplicitHeight = 695
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 997
    Height = 657
    Color = 14858940
    ColorTo = 12017495
    Styler = nil
    ExplicitWidth = 1366
    ExplicitHeight = 746
    FullHeight = 0
    inherited Label2: TLabel
      Left = 671
      Top = 15
      ExplicitLeft = 671
      ExplicitTop = 15
    end
    inherited Label3: TLabel
      Left = 480
      Top = 759
      Width = 53
      Caption = 'F2 - Cliente'
      Visible = False
      ExplicitLeft = 480
      ExplicitTop = 759
      ExplicitWidth = 53
    end
    inherited Label4: TLabel
      Left = 15
      Top = 39
      Width = 67
      Caption = 'F3 - Vendedor'
      ExplicitLeft = 15
      ExplicitTop = 39
      ExplicitWidth = 67
    end
    inherited Label8: TLabel
      Left = 538
      Top = 831
      Visible = False
      ExplicitLeft = 538
      ExplicitTop = 831
    end
    inherited Label15: TLabel
      Left = 45
      Top = 15
      Height = 18
      ExplicitLeft = 45
      ExplicitTop = 15
      ExplicitHeight = 18
    end
    inherited Label1: TLabel
      Left = 36
      Top = 831
      Visible = False
      ExplicitLeft = 36
      ExplicitTop = 831
    end
    inherited cliente_domicilio: TLabel
      Left = 84
      Top = 831
      Visible = False
      ExplicitLeft = 84
      ExplicitTop = 831
    end
    inherited Label11: TLabel
      Left = 29
      Top = 855
      Visible = False
      ExplicitLeft = 29
      ExplicitTop = 855
    end
    inherited cliente_documentonro: TLabel
      Left = 84
      Top = 855
      Visible = False
      ExplicitLeft = 84
      ExplicitTop = 855
    end
    inherited Label12: TLabel
      Left = 556
      Top = 855
      Visible = False
      ExplicitLeft = 556
      ExplicitTop = 855
    end
    inherited Label13: TLabel
      Left = 443
      Top = 852
      Visible = False
      ExplicitLeft = 443
      ExplicitTop = 852
    end
    inherited labelsucursal: TLabel
      Left = 25
      Top = 887
      Visible = False
      ExplicitLeft = 25
      ExplicitTop = 887
    end
    inherited Label16: TLabel
      Left = 558
      Top = 911
      Visible = False
      ExplicitLeft = 558
      ExplicitTop = 911
    end
    inherited cliente_ultimaventa: TLabel
      Left = 347
      Top = 831
      Visible = False
      ExplicitLeft = 347
      ExplicitTop = 831
    end
    object Label14: TLabel [14]
      Left = 16
      Top = 145
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = 'F4 - Codigo de Barras'
    end
    object Label18: TLabel [15]
      Left = 17
      Top = 362
      Width = 92
      Height = 13
      Caption = 'F5 - Medio de pago'
    end
    object Label19: TLabel [16]
      Left = 115
      Top = 362
      Width = 56
      Height = 13
      Caption = 'Descripcion'
    end
    object Label20: TLabel [17]
      Left = 374
      Top = 362
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object lbltarjeta: TLabel [18]
      Left = 115
      Top = 362
      Width = 33
      Height = 13
      Caption = 'Tarjeta'
      Visible = False
    end
    object Label24: TLabel [19]
      Left = 730
      Top = 361
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Subtotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited documentoventa_numero: TEdit
      Left = 88
      Top = 12
      TabStop = False
      TabOrder = 24
      ExplicitLeft = 88
      ExplicitTop = 12
    end
    inherited documentoventa_fecha: TDateTimePicker
      Left = 707
      Top = 12
      TabOrder = 25
      TabStop = False
      ExplicitLeft = 707
      ExplicitTop = 12
    end
    inherited cliente_id: TSqlComboBox
      Left = 539
      Top = 756
      TabOrder = 16
      Visible = False
      ExplicitLeft = 539
      ExplicitTop = 756
    end
    inherited personal_id: TSqlComboBox
      Left = 87
      Top = 36
      TabOrder = 18
      ExplicitLeft = 87
      ExplicitTop = 36
    end
    inherited btncancelar: TButton
      Left = 707
      Top = 602
      Width = 94
      Caption = 'Esc - Cancelar'
      TabOrder = 15
      ExplicitLeft = 707
      ExplicitTop = 602
      ExplicitWidth = 94
    end
    inherited btnguardar: TButton
      Left = 626
      Top = 602
      Caption = 'F9 - Guardar'
      TabOrder = 14
      ExplicitLeft = 626
      ExplicitTop = 602
    end
    inherited documentoventa_condicionventa: TComboBox
      Left = 637
      Top = 828
      TabOrder = 19
      Visible = False
      ExplicitLeft = 637
      ExplicitTop = 828
    end
    inherited DBGrid1: TDBGrid
      Left = 17
      Top = 194
      Width = 968
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_id'
          ReadOnly = True
          Title.Caption = 'Codigo'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          ReadOnly = True
          Title.Caption = 'Producto'
          Width = 426
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_cantidad'
          Title.Caption = 'Cant.'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_precio'
          Title.Caption = 'Precio'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_total'
          ReadOnly = True
          Title.Caption = 'Total'
          Width = 109
          Visible = True
        end>
    end
    inherited btnagregar: TButton
      Left = 141
      Top = 163
      TabOrder = 2
      TabStop = False
      ExplicitLeft = 141
      ExplicitTop = 163
    end
    inherited btnquitar: TButton
      Left = 287
      Top = 163
      TabOrder = 4
      TabStop = False
      ExplicitLeft = 287
      ExplicitTop = 163
    end
    inherited btnmodificar: TButton
      Left = 214
      Top = 163
      TabOrder = 3
      TabStop = False
      ExplicitLeft = 214
      ExplicitTop = 163
    end
    inherited GroupBox1: TGroupBox
      Left = 625
      Top = 475
      Width = 360
      Height = 121
      TabOrder = 12
      TabStop = True
      ExplicitLeft = 625
      ExplicitTop = 475
      ExplicitWidth = 360
      ExplicitHeight = 121
      inherited Label5: TLabel
        Top = 249
        Visible = False
        ExplicitTop = 249
      end
      inherited Label6: TLabel
        Top = 273
        Visible = False
        ExplicitTop = 273
      end
      inherited Label7: TLabel
        Top = 249
        Visible = False
        ExplicitTop = 249
      end
      inherited Label9: TLabel
        Top = 273
        Visible = False
        ExplicitTop = 273
      end
      inherited Label10: TLabel
        Left = 159
        Top = 81
        ExplicitLeft = 159
        ExplicitTop = 81
      end
      inherited Label99: TLabel
        Left = 200
        Top = 41
        Width = 62
        Caption = 'F6 - Recargo'
        ExplicitLeft = 200
        ExplicitTop = 41
        ExplicitWidth = 62
      end
      inherited Label30: TLabel
        Left = 197
        Width = 73
        Caption = 'F7 - Descuento'
        ExplicitLeft = 197
        ExplicitWidth = 73
      end
      inherited documentoventa_neto21: TMoneyEdit
        Top = 246
        Visible = False
        ExplicitTop = 246
      end
      inherited documentoventa_iva21: TMoneyEdit
        Top = 270
        Visible = False
        ExplicitTop = 270
      end
      inherited documentoventa_neto105: TMoneyEdit
        Top = 246
        Visible = False
        ExplicitTop = 246
      end
      inherited documentoventa_iva105: TMoneyEdit
        Top = 270
        Visible = False
        ExplicitTop = 270
      end
      inherited documentoventa_total: TMoneyEdit
        Left = 212
        Top = 78
        ExplicitLeft = 212
        ExplicitTop = 78
      end
      inherited documentoventa_recargo: TMoneyEdit
        Left = 276
        Top = 38
        ExplicitLeft = 276
        ExplicitTop = 38
      end
      inherited documentoventa_descuento: TMoneyEdit
        Left = 276
        ExplicitLeft = 276
      end
    end
    inherited puntoventa_id: TSqlComboBox
      Left = 72
      Top = 908
      TabOrder = 22
      Visible = False
      ExplicitLeft = 72
      ExplicitTop = 908
    end
    inherited tipodocu_id: TSqlComboBox
      Left = 130
      Top = 908
      TabOrder = 23
      Visible = False
      ExplicitLeft = 130
      ExplicitTop = 908
    end
    inherited documentoventa_listaprecio: TComboBox
      Left = 637
      Top = 852
      TabOrder = 20
      Visible = False
      ExplicitLeft = 637
      ExplicitTop = 852
    end
    inherited DBGrid2: TDBGrid
      Left = 17
      Top = 410
      Width = 602
      Height = 186
      TabOrder = 11
      Columns = <
        item
          Expanded = False
          FieldName = 'tipopago_nombre'
          Title.Caption = 'Tipo'
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_nombre'
          Title.Caption = 'Descripcion'
          Width = 279
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentopago_importe'
          Title.Caption = 'Importe'
          Width = 103
          Visible = True
        end>
    end
    inherited btnagregarpago: TButton
      Left = 477
      Top = 379
      Width = 142
      Caption = 'Agregar Pago'
      TabOrder = 10
      Visible = False
      ExplicitLeft = 477
      ExplicitTop = 379
      ExplicitWidth = 142
    end
    inherited btnquitarpago: TButton
      Left = 414
      Top = 602
      Width = 108
      Caption = 'F8 - Quitar Pago'
      TabOrder = 13
      ExplicitLeft = 414
      ExplicitTop = 602
      ExplicitWidth = 108
    end
    inherited sucursal_id: TSqlComboBox
      Left = 72
      Top = 884
      TabOrder = 21
      Visible = False
      ExplicitLeft = 72
      ExplicitTop = 884
    end
    inherited btnherramientas: TAdvGlowButton
      Left = 794
      Top = 884
      TabOrder = 27
      Visible = False
      ExplicitLeft = 794
      ExplicitTop = 884
    end
    inherited btnimprimirventa: TButton
      Left = 889
      Top = 912
      TabOrder = 28
      Visible = False
      ExplicitLeft = 889
      ExplicitTop = 912
    end
    inherited btnagregarcliente: TButton
      Left = 862
      Top = 756
      TabOrder = 17
      Visible = False
      ExplicitLeft = 862
      ExplicitTop = 756
    end
    inherited documentoventa_fechavenc: TDateTimePicker
      Left = 625
      Top = 908
      TabOrder = 26
      Visible = False
      ExplicitLeft = 625
      ExplicitTop = 908
    end
    inherited btnobservaciones: TButton
      Left = 889
      Top = 882
      TabOrder = 29
      Visible = False
      ExplicitLeft = 889
      ExplicitTop = 882
    end
    inherited VENTASEMITIRREMITOCTACTE: TCheckBox
      Left = 436
      Top = 910
      TabOrder = 30
      Visible = False
      ExplicitLeft = 436
      ExplicitTop = 910
    end
    object producto_id: TEditCodi
      Left = 16
      Top = 164
      Width = 121
      Height = 21
      Flat = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 1
      Visible = True
      Version = '1.3.0.1'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      abm = False
      ConfCampoCodigo = 'producto_id'
      ConfCampoCodigo1 = 'producto_codigo'
      ConfCampoCodigo2 = 'producto_codigobarras'
      ConfCampoTexto = 'producto_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from productos'
        
          'left join politicasdeprecios on productos.politicaprecio_id=poli' +
          'ticasdeprecios.politicaprecio_id'
        'where producto_tipo="PRODUCTO"'
        'order by producto_nombre')
      AfterSearch = producto_idAfterSearch
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'producto_codigo'
    end
    object documentopago_nombre: TEdit
      Left = 115
      Top = 381
      Width = 251
      Height = 21
      TabOrder = 8
      OnEnter = documentopago_nombreEnter
    end
    object documentopago_importe: TMoneyEdit
      Left = 374
      Top = 381
      Width = 97
      Height = 21
      CalculatorLook.ButtonWidth = 24
      CalculatorLook.ButtonHeight = 24
      CalculatorLook.ButtonColor = clSilver
      CalculatorLook.Color = clWhite
      CalculatorLook.Flat = False
      CalculatorLook.Font.Charset = DEFAULT_CHARSET
      CalculatorLook.Font.Color = clWindowText
      CalculatorLook.Font.Height = -11
      CalculatorLook.Font.Name = 'Tahoma'
      CalculatorLook.Font.Style = []
      TabOrder = 9
      Version = '1.1.0.1'
      OnKeyDown = documentopago_importeKeyDown
    end
    object tipopago_id: TEditCodi
      Left = 16
      Top = 381
      Width = 93
      Height = 21
      Flat = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 6
      Visible = True
      OnKeyDown = tipopago_idKeyDown
      Version = '1.3.0.1'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      abm = False
      ConfCampoCodigo = 'tipopago_id'
      ConfCampoTexto = 'tipopago_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from tipospago'
        'order by tipopago_id')
      ConfTexto = documentopago_nombre
      AfterSearch = tipopago_idAfterSearch
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'tipopago_id'
    end
    object tarjeta_id: TEditCodi
      Left = 115
      Top = 381
      Width = 50
      Height = 21
      Flat = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 7
      Visible = False
      OnKeyDown = tipopago_idKeyDown
      Version = '1.3.0.1'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      abm = False
      ConfCampoCodigo = 'tarjeta_id'
      ConfCampoTexto = 'tarjeta_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from tarjetas')
      ConfTexto = documentopago_nombre
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'tarjeta_id'
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 62
      Width = 948
      Height = 77
      Caption = 'Cliente'
      ParentBackground = False
      TabOrder = 0
      object Label17: TLabel
        Left = 15
        Top = 20
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nombre'
      end
      object Label21: TLabel
        Left = 10
        Top = 44
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Domicilio'
      end
      object Label23: TLabel
        Left = 512
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'E-mail'
      end
      object Label22: TLabel
        Left = 521
        Top = 20
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'DNI'
      end
      object cliente_nombre: TEdit
        Left = 58
        Top = 17
        Width = 429
        Height = 21
        TabOrder = 0
      end
      object cliente_domicilio1: TEdit
        Left = 58
        Top = 41
        Width = 429
        Height = 21
        TabOrder = 1
      end
      object cliente_documentonro1: TEdit
        Left = 546
        Top = 17
        Width = 206
        Height = 21
        TabOrder = 2
      end
      object cliente_mail1: TEdit
        Left = 546
        Top = 41
        Width = 382
        Height = 21
        TabOrder = 3
      end
    end
    object documentoventa_subtotal: TMoneyEdit
      Left = 794
      Top = 358
      Width = 117
      Height = 24
      CalculatorLook.ButtonWidth = 24
      CalculatorLook.ButtonHeight = 24
      CalculatorLook.ButtonColor = clSilver
      CalculatorLook.Color = clWhite
      CalculatorLook.Flat = False
      CalculatorLook.Font.Charset = DEFAULT_CHARSET
      CalculatorLook.Font.Color = clWindowText
      CalculatorLook.Font.Height = -11
      CalculatorLook.Font.Name = 'Tahoma'
      CalculatorLook.Font.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 31
      Version = '1.1.0.1'
    end
  end
  inherited ZQuery2: TZQuery
    Left = 592
    Top = 360
  end
  inherited ZQDocumentoventadetalles: TZQuery
    BeforePost = ZQDocumentoventadetallesBeforePost
    AfterPost = ZQDocumentoventadetallesAfterPost
    Left = 176
    Top = 352
    object ZQDocumentoventadetallesdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQDocumentoventadetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQDocumentoventadetallesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
      Required = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe2: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe3: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe4: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe5: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_importe6: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_listaprecio: TIntegerField
      FieldName = 'documentoventadetalle_listaprecio'
    end
    object ZQDocumentoventadetallesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
  inherited DTSDocumentoventadetalle: TDataSource
    Left = 408
    Top = 312
  end
  inherited ZQRecibo: TZQuery
    Left = 744
    Top = 392
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 472
    Top = 408
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 320
    Top = 416
  end
  inherited DTSPagos: TDataSource
    Left = 680
    Top = 360
  end
  inherited ZQpagotarjeta: TZQuery
    Top = 376
  end
  inherited ZQNotacredito: TZQuery
    Top = 408
  end
  inherited ZQExecSql: TZQuery
    Top = 400
  end
  inherited AdvPopupMenu1: TAdvPopupMenu
    Left = 960
    Top = 392
  end
  inherited ZQRemito: TZQuery
    Left = 496
    Top = 368
  end
  inherited ZQRemitoDetalles: TZQuery
    Left = 312
    Top = 376
  end
  object ZQProducto: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles'
      'where documentoventa_id=-1')
    Params = <>
    Left = 896
    Top = 384
  end
end
