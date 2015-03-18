inherited facturaventa02: Tfacturaventa02
  Caption = 'Venta'
  ClientHeight = 680
  ClientWidth = 997
  Position = poScreenCenter
  ExplicitTop = -157
  ExplicitWidth = 1013
  ExplicitHeight = 718
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 997
    Height = 680
    Color = 14858940
    TabOrder = 1
    ColorTo = 12017495
    Styler = nil
    ExplicitWidth = 997
    ExplicitHeight = 680
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
      ExplicitLeft = 45
      ExplicitTop = 15
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
    object Label24: TLabel [18]
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
    object Label25: TLabel [19]
      Left = 154
      Top = 168
      Width = 35
      Height = 13
      Caption = 'Cambio'
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
      TabOrder = 17
      Visible = False
      ExplicitLeft = 539
      ExplicitTop = 756
    end
    inherited personal_id: TSqlComboBox
      Left = 154
      Top = 36
      TabStop = False
      OnChange = personal_idChange
      ExplicitLeft = 154
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
      TabOrder = 7
      OnEnter = DBGrid1Enter
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'producto_codigobarras'
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
      Left = 749
      Top = 163
      TabOrder = 4
      TabStop = False
      ExplicitLeft = 749
      ExplicitTop = 163
    end
    inherited btnquitar: TButton
      Left = 895
      Top = 163
      TabOrder = 6
      TabStop = False
      ExplicitLeft = 895
      ExplicitTop = 163
    end
    inherited btnmodificar: TButton
      Left = 822
      Top = 163
      TabOrder = 5
      TabStop = False
      ExplicitLeft = 822
      ExplicitTop = 163
    end
    inherited GroupBox1: TGroupBox
      Left = 625
      Top = 475
      Width = 360
      Height = 121
      TabOrder = 13
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
      Top = 379
      Width = 142
      Caption = 'Agregar Pago'
      TabOrder = 11
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
      TabOrder = 16
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
      TabOrder = 18
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
      TabOrder = 3
      Visible = True
      OnEnter = producto_idEnter
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
      TabOrder = 9
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
      TabOrder = 10
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
      TabOrder = 8
      Visible = True
      OnKeyDown = tipopago_idKeyDown
      OnKeyPress = tipopago_idKeyPress
      Version = '1.3.0.1'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      OnClickBtn = tipopago_idClickBtn
      abm = False
      ConfCampoCodigo = 'tipopago_id'
      ConfCampoTexto = 'tipopago_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from tipospago'
        'order by tipopago_id')
      ConfTexto = documentopago_nombre
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'tipopago_id'
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 62
      Width = 948
      Height = 77
      Caption = 'Cliente'
      ParentBackground = False
      TabOrder = 2
      OnEnter = GroupBox2Enter
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
    object vendedor_id: TEditCodi
      Left = 88
      Top = 36
      Width = 62
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
      ConfCampoCodigo = 'personal_id'
      ConfCampoTexto = 'personal_nombre'
      ConfSqlConnection = Princ.ZBase
      ConfSql.Strings = (
        'select * from personal'
        'order by personal_nombre')
      AfterSearch = vendedor_idAfterSearch
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'personal_id'
    end
    object CBDevolucion: TCheckBox
      Left = 154
      Top = 167
      Width = 72
      Height = 17
      Alignment = taLeftJustify
      TabOrder = 32
      OnClick = CBDevolucionClick
    end
    object BtnConsultaStock: TButton
      Left = 301
      Top = 163
      Width = 108
      Height = 25
      Caption = 'Consulta Stock'
      TabOrder = 33
      TabStop = False
      OnClick = BtnConsultaStockClick
    end
    object combotipopago_id: TSqlComboBox
      Left = 17
      Top = 381
      Width = 94
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 34
      TabStop = False
      Visible = False
      OnExit = combotipopago_idExit
      OnSelect = combotipopago_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        
          'select *,concat(tipopago_id,'#39' - '#39',tipopago_nombre) as nombre fro' +
          'm tipospago'
        'order by tipopago_id')
      Confcampo_codigo = 'tipopago_id'
      Confcampo_nomb = 'nombre'
      Tag2 = 0
    end
  end
  object PageControl1: TPageControl [1]
    Left = 72
    Top = 268
    Width = 981
    Height = 668
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Venta'
    end
    object TabSheet2: TTabSheet
      Caption = 'Envio'
      ImageIndex = 1
      object Label26: TLabel
        Left = 672
        Top = 15
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object Label27: TLabel
        Left = 13
        Top = 34
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Deposito Destino'
      end
      object Label28: TLabel
        Left = 16
        Top = 57
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Codigo de Barras'
      end
      object Label29: TLabel
        Left = 16
        Top = 267
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Label31: TLabel
        Left = 16
        Top = 379
        Width = 122
        Height = 13
        Caption = 'Ultimos Envios Realizados'
      end
      object movimientodeposito_fecha: TDateTimePicker
        Left = 707
        Top = 12
        Width = 106
        Height = 21
        Date = 40384.000000000000000000
        Time = 40384.000000000000000000
        TabOrder = 0
        TabStop = False
      end
      object deposito_iddestino: TSqlComboBox
        Left = 100
        Top = 31
        Width = 317
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from depositos'
          'order by deposito_nombre')
        Confcampo_codigo = 'deposito_id'
        Confcampo_nomb = 'deposito_nombre'
        Tag2 = 0
      end
      object MovProducto_id: TEditCodi
        Left = 16
        Top = 76
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
        TabOrder = 2
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
        AfterSearch = MovProducto_idAfterSearch
        ConfIni = Princ.ini1
        ConfLimpiar = True
        ConfSearchLimpio = True
        ConfCampoBusqueda1 = 'producto_codigo'
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 106
        Width = 957
        Height = 153
        TabStop = False
        DataSource = DTSmovimdepodetalles
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
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
            FieldName = 'producto_nombre'
            ReadOnly = True
            Title.Caption = 'Producto'
            Width = 426
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'movimdepodetalle_cantidadenviar'
            Title.Caption = 'Cant.'
            Width = 91
            Visible = True
          end>
      end
      object Button3: TButton
        Left = 749
        Top = 75
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 3
        TabStop = False
      end
      object Button4: TButton
        Left = 895
        Top = 75
        Width = 75
        Height = 25
        Caption = 'Quitar'
        TabOrder = 5
        TabStop = False
      end
      object Button5: TButton
        Left = 822
        Top = 75
        Width = 75
        Height = 25
        Caption = 'Modificar'
        TabOrder = 4
        TabStop = False
      end
      object movimientodeposito_observaciones: TGTBMemo
        Left = 16
        Top = 286
        Width = 954
        Height = 33
        TabStop = False
        TabOrder = 7
        Tag2 = 0
      end
      object btnguardarmov: TButton
        Left = 626
        Top = 322
        Width = 75
        Height = 25
        Caption = 'Guardar'
        TabOrder = 8
        OnClick = btnguardarmovClick
      end
      object btncancelarmov: TButton
        Left = 707
        Top = 322
        Width = 94
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 9
      end
      object DBGrid4: TDBGrid
        Left = 16
        Top = 398
        Width = 957
        Height = 196
        TabStop = False
        DataSource = DTSEnviosRealizados
        TabOrder = 10
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'movimientodeposito_fecha'
            ReadOnly = True
            Title.Caption = 'Fecha'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deposito_nombre'
            ReadOnly = True
            Title.Caption = 'Destino'
            Width = 168
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_codigobarras'
            Title.Caption = 'Codigo'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_nombre'
            Title.Caption = 'Producto'
            Width = 337
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'movimdepodetalle_cantidadenviar'
            Title.Caption = 'Cantidad'
            Visible = True
          end>
      end
    end
  end
  inherited ZQuery2: TZQuery
    Left = 592
    Top = 360
  end
  inherited ZQDocumentoventadetalles: TZQuery
    BeforePost = ZQDocumentoventadetallesBeforePost
    AfterPost = ZQDocumentoventadetallesAfterPost
    Left = 224
    Top = 272
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
    object ZQDocumentoventadetallesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQDocumentoventadetallesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
  end
  inherited DTSDocumentoventadetalle: TDataSource
    OnStateChange = DTSDocumentoventadetalleStateChange
    Left = 408
    Top = 272
  end
  inherited ZQRecibo: TZQuery
    Left = 744
    Top = 392
  end
  inherited ZQdocumentoventadocus: TZQuery
    Left = 448
    Top = 368
  end
  inherited ZQDocumentopagos: TZQuery
    Left = 280
    Top = 352
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
    Left = 376
    Top = 352
  end
  object ZQProducto: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select documentoventadetalles.*, productos.producto_codigo, prod' +
        'uctos.producto_codigobarras from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'where documentoventa_id=-1')
    Params = <>
    Left = 816
    Top = 464
  end
  object ZQProductoActualizar: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from productos'
      'where producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 672
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object ZQmovimdepodetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from movimdepodetalles'
      
        'inner join productos on movimdepodetalles.producto_id=productos.' +
        'producto_id'
      'where movimientodeposito_id=:movimientodeposito_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'movimientodeposito_id'
        ParamType = ptUnknown
      end>
    object ZQmovimdepodetallesmovimdepodetalle_id: TIntegerField
      FieldName = 'movimdepodetalle_id'
    end
    object ZQmovimdepodetallesmovimdepodetalle_cantidadenviar: TFloatField
      FieldName = 'movimdepodetalle_cantidadenviar'
    end
    object ZQmovimdepodetallesmovimdepodetalle_cantidadrecibir: TFloatField
      FieldName = 'movimdepodetalle_cantidadrecibir'
    end
    object ZQmovimdepodetallesmovimdepodetalle_estado: TStringField
      FieldName = 'movimdepodetalle_estado'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQmovimdepodetallesmovimientodeposito_id: TIntegerField
      FieldName = 'movimientodeposito_id'
    end
    object ZQmovimdepodetallesproducto_id_1: TIntegerField
      FieldName = 'producto_id_1'
    end
    object ZQmovimdepodetallesproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 150
    end
    object ZQmovimdepodetallesproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object ZQmovimdepodetallesproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object ZQmovimdepodetallesproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object ZQmovimdepodetallesproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object ZQmovimdepodetallestipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object ZQmovimdepodetallesrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object ZQmovimdepodetallesproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object ZQmovimdepodetallesproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object ZQmovimdepodetallesproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object ZQmovimdepodetallescalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object ZQmovimdepodetallespoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object ZQmovimdepodetallesproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object ZQmovimdepodetallesproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object ZQmovimdepodetallesproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object ZQmovimdepodetallesproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object ZQmovimdepodetallesproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object ZQmovimdepodetallesproducto_fechaactualizacionprecio: TDateField
      FieldName = 'producto_fechaactualizacionprecio'
    end
    object ZQmovimdepodetallesproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 45
    end
    object ZQmovimdepodetallesproducto_imprimir: TIntegerField
      FieldName = 'producto_imprimir'
    end
    object ZQmovimdepodetallesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
  end
  object DTSmovimdepodetalles: TDataSource
    DataSet = ZQmovimdepodetalles
    Left = 480
    Top = 192
  end
  object DTSEnviosRealizados: TDataSource
    DataSet = ZQEnviosRealizados
    Left = 264
    Top = 544
  end
  object ZQEnviosRealizados: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select movimientosdepositos.movimientodeposito_fecha, depositos.' +
        'deposito_nombre,'
      
        'productos.producto_codigobarras, productos.producto_nombre, movi' +
        'mdepodetalles.movimdepodetalle_cantidadenviar'
      'from movimientosdepositos'
      
        'inner join depositos on movimientosdepositos.deposito_iddestino=' +
        'depositos.deposito_id'
      
        'inner join movimdepodetalles on movimientosdepositos.movimientod' +
        'eposito_id=movimdepodetalles.movimientodeposito_id'
      
        'inner join productos on movimdepodetalles.producto_id=productos.' +
        'producto_id'
      'where movimientosdepositos.deposito_idorigen=1'
      'order by movimdepodetalles.movimdepodetalle_id desc')
    Params = <>
    Left = 544
    Top = 512
  end
end
