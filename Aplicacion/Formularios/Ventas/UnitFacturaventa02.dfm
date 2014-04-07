inherited facturaventa02: Tfacturaventa02
  Caption = 'Venta'
  ClientHeight = 609
  ClientWidth = 998
  Position = poScreenCenter
  ExplicitWidth = 1014
  ExplicitHeight = 647
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 998
    Height = 609
    ExplicitWidth = 998
    ExplicitHeight = 609
    FullHeight = 0
    inherited Label2: TLabel
      Left = 589
      Top = 703
      Visible = False
      ExplicitLeft = 589
      ExplicitTop = 703
    end
    inherited Label3: TLabel
      Left = 16
      Top = 15
      Width = 53
      Caption = 'F2 - Cliente'
      ExplicitLeft = 16
      ExplicitTop = 15
      ExplicitWidth = 53
    end
    inherited Label4: TLabel
      Left = 524
      Top = 15
      Width = 67
      Caption = 'F3 - Vendedor'
      ExplicitLeft = 524
      ExplicitTop = 15
      ExplicitWidth = 67
    end
    inherited Label8: TLabel
      Left = 538
      Top = 647
      Visible = False
      ExplicitLeft = 538
      ExplicitTop = 647
    end
    inherited Label15: TLabel
      Left = 29
      Top = 727
      Visible = False
      ExplicitLeft = 29
      ExplicitTop = 727
    end
    inherited Label1: TLabel
      Left = 36
      Top = 647
      Visible = False
      ExplicitLeft = 36
      ExplicitTop = 647
    end
    inherited cliente_domicilio: TLabel
      Left = 84
      Top = 647
      Visible = False
      ExplicitLeft = 84
      ExplicitTop = 647
    end
    inherited Label11: TLabel
      Left = 29
      Top = 671
      Visible = False
      ExplicitLeft = 29
      ExplicitTop = 671
    end
    inherited cliente_documentonro: TLabel
      Left = 84
      Top = 671
      Visible = False
      ExplicitLeft = 84
      ExplicitTop = 671
    end
    inherited Label12: TLabel
      Left = 556
      Top = 671
      Visible = False
      ExplicitLeft = 556
      ExplicitTop = 671
    end
    inherited Label13: TLabel
      Left = 443
      Top = 668
      Visible = False
      ExplicitLeft = 443
      ExplicitTop = 668
    end
    inherited labelsucursal: TLabel
      Left = 25
      Top = 703
      Visible = False
      ExplicitLeft = 25
      ExplicitTop = 703
    end
    inherited Label16: TLabel
      Left = 558
      Top = 727
      Visible = False
      ExplicitLeft = 558
      ExplicitTop = 727
    end
    inherited cliente_ultimaventa: TLabel
      Left = 347
      Top = 647
      Visible = False
      ExplicitLeft = 347
      ExplicitTop = 647
    end
    object Label14: TLabel [14]
      Left = 16
      Top = 49
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = 'F4 - Codigo de Barras'
    end
    object Label18: TLabel [15]
      Left = 17
      Top = 258
      Width = 92
      Height = 13
      Caption = 'F5 - Medio de pago'
    end
    object Label19: TLabel [16]
      Left = 115
      Top = 258
      Width = 56
      Height = 13
      Caption = 'Descripcion'
    end
    object Label20: TLabel [17]
      Left = 374
      Top = 258
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object lbltarjeta: TLabel [18]
      Left = 17
      Top = 306
      Width = 33
      Height = 13
      Caption = 'Tarjeta'
      Visible = False
    end
    object lblcuotas: TLabel [19]
      Left = 374
      Top = 306
      Width = 33
      Height = 13
      Caption = 'Cuotas'
      Visible = False
    end
    inherited documentoventa_numero: TEdit
      Left = 188
      Top = 724
      TabOrder = 25
      Visible = False
      ExplicitLeft = 188
      ExplicitTop = 724
    end
    inherited documentoventa_fecha: TDateTimePicker
      Left = 625
      Top = 700
      TabOrder = 26
      Visible = False
      ExplicitLeft = 625
      ExplicitTop = 700
    end
    inherited cliente_id: TSqlComboBox
      Left = 75
      Top = 12
      TabOrder = 17
      ExplicitLeft = 75
      ExplicitTop = 12
    end
    inherited personal_id: TSqlComboBox
      Left = 596
      Top = 12
      TabOrder = 19
      ExplicitLeft = 596
      ExplicitTop = 12
    end
    inherited btncancelar: TButton
      Left = 707
      Top = 498
      Width = 94
      Caption = 'Esc - Cancelar'
      TabOrder = 16
      ExplicitLeft = 707
      ExplicitTop = 498
      ExplicitWidth = 94
    end
    inherited btnguardar: TButton
      Left = 626
      Top = 498
      Caption = 'F9 - Guardar'
      TabOrder = 15
      ExplicitLeft = 626
      ExplicitTop = 498
    end
    inherited documentoventa_condicionventa: TComboBox
      Left = 637
      Top = 644
      TabOrder = 20
      Visible = False
      ExplicitLeft = 637
      ExplicitTop = 644
    end
    inherited DBGrid1: TDBGrid
      Left = 17
      Top = 98
      Width = 968
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      Top = 67
      TabOrder = 1
      TabStop = False
      ExplicitLeft = 141
      ExplicitTop = 67
    end
    inherited btnquitar: TButton
      Left = 287
      Top = 67
      TabOrder = 3
      TabStop = False
      ExplicitLeft = 287
      ExplicitTop = 67
    end
    inherited btnmodificar: TButton
      Left = 214
      Top = 67
      TabOrder = 2
      TabStop = False
      ExplicitLeft = 214
      ExplicitTop = 67
    end
    inherited GroupBox1: TGroupBox
      Left = 625
      Top = 345
      Width = 360
      Height = 85
      TabOrder = 14
      ExplicitLeft = 625
      ExplicitTop = 345
      ExplicitWidth = 360
      ExplicitHeight = 85
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
        Top = 49
        ExplicitLeft = 159
        ExplicitTop = 49
      end
      inherited Label99: TLabel
        Left = 8
        Width = 62
        Caption = 'F6 - Recargo'
        ExplicitLeft = 8
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
        Top = 46
        ExplicitLeft = 212
        ExplicitTop = 46
      end
      inherited documentoventa_recargo: TMoneyEdit
        Left = 84
        ExplicitLeft = 84
      end
      inherited documentoventa_descuento: TMoneyEdit
        Left = 276
        ExplicitLeft = 276
      end
    end
    inherited puntoventa_id: TSqlComboBox
      Left = 72
      Top = 724
      TabOrder = 23
      Visible = False
      ExplicitLeft = 72
      ExplicitTop = 724
    end
    inherited tipodocu_id: TSqlComboBox
      Left = 130
      Top = 724
      TabOrder = 24
      Visible = False
      ExplicitLeft = 130
      ExplicitTop = 724
    end
    inherited documentoventa_listaprecio: TComboBox
      Left = 637
      Top = 668
      TabOrder = 21
      Visible = False
      ExplicitLeft = 637
      ExplicitTop = 668
    end
    inherited DBGrid2: TDBGrid
      Left = 17
      Top = 345
      Width = 602
      TabOrder = 12
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
      Top = 275
      Width = 142
      Caption = 'Agregar Pago'
      TabOrder = 11
      Visible = False
      ExplicitLeft = 477
      ExplicitTop = 275
      ExplicitWidth = 142
    end
    inherited btnquitarpago: TButton
      Left = 414
      Top = 498
      Width = 108
      Caption = 'F8 - Quitar Pago'
      TabOrder = 13
      ExplicitLeft = 414
      ExplicitTop = 498
      ExplicitWidth = 108
    end
    inherited sucursal_id: TSqlComboBox
      Left = 72
      Top = 700
      TabOrder = 22
      Visible = False
      ExplicitLeft = 72
      ExplicitTop = 700
    end
    inherited btnherramientas: TAdvGlowButton
      Left = 794
      Top = 700
      TabOrder = 28
      Visible = False
      ExplicitLeft = 794
      ExplicitTop = 700
    end
    inherited btnimprimirventa: TButton
      Left = 889
      Top = 728
      TabOrder = 29
      Visible = False
      ExplicitLeft = 889
      ExplicitTop = 728
    end
    inherited btnagregarcliente: TButton
      Left = 398
      Top = 12
      TabOrder = 18
      ExplicitLeft = 398
      ExplicitTop = 12
    end
    inherited documentoventa_fechavenc: TDateTimePicker
      Left = 625
      Top = 724
      TabOrder = 27
      Visible = False
      ExplicitLeft = 625
      ExplicitTop = 724
    end
    inherited btnobservaciones: TButton
      Left = 889
      Top = 698
      TabOrder = 30
      Visible = False
      ExplicitLeft = 889
      ExplicitTop = 698
    end
    inherited VENTASEMITIRREMITOCTACTE: TCheckBox
      Left = 436
      Top = 726
      TabOrder = 31
      Visible = False
      ExplicitLeft = 436
      ExplicitTop = 726
    end
    object producto_id: TEditCodi
      Left = 16
      Top = 68
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
      TabOrder = 0
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
      Top = 277
      Width = 251
      Height = 21
      TabOrder = 6
      OnEnter = documentopago_nombreEnter
    end
    object documentopago_importe: TMoneyEdit
      Left = 374
      Top = 277
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
      TabOrder = 7
      Version = '1.1.0.1'
      OnKeyDown = documentopago_importeKeyDown
    end
    object tipopago_id: TEditCodi
      Left = 16
      Top = 277
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
      TabOrder = 5
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
      Left = 16
      Top = 320
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
      TabOrder = 8
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
      ConfTexto = tarjeta_nombre
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'tarjeta_id'
    end
    object tarjeta_nombre: TEdit
      Left = 115
      Top = 320
      Width = 251
      Height = 21
      TabOrder = 9
      Visible = False
      OnEnter = documentopago_nombreEnter
    end
    object pagotarjeta_cuotas: TMoneyEdit
      Left = 374
      Top = 320
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
      TabOrder = 10
      Visible = False
      Version = '1.1.0.1'
      OnKeyDown = pagotarjeta_cuotasKeyDown
    end
  end
  inherited ZQuery2: TZQuery
    Left = 592
    Top = 152
  end
  inherited ZQDocumentoventadetalles: TZQuery
    BeforePost = ZQDocumentoventadetallesBeforePost
    AfterPost = ZQDocumentoventadetallesAfterPost
    Left = 176
    Top = 144
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
    Top = 104
  end
  inherited ZQRecibo: TZQuery
    Left = 744
    Top = 184
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 472
    Top = 200
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 320
    Top = 208
  end
  inherited DTSPagos: TDataSource
    Left = 680
    Top = 152
  end
  inherited ZQpagotarjeta: TZQuery
    Top = 168
  end
  inherited AdvPopupMenu1: TAdvPopupMenu
    Left = 960
    Top = 392
  end
  inherited ZQRemito: TZQuery
    Left = 496
    Top = 160
  end
  inherited ZQRemitoDetalles: TZQuery
    Left = 312
    Top = 168
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
