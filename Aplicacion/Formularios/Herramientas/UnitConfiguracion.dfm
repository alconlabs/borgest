object configuracion: Tconfiguracion
  Left = 0
  Top = 0
  Caption = 'Configuraciones'
  ClientHeight = 492
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 492
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
    object btnactualizar: TButton
      Left = 405
      Top = 439
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = btnactualizarClick
    end
    object btnimprimir: TButton
      Left = 486
      Top = 439
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 589
      Height = 425
      ActivePage = TabSheet3
      Align = alTop
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'General'
        object Label14: TLabel
          Left = 44
          Top = 10
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sucursal por defecto'
        end
        object Label7: TLabel
          Left = 6
          Top = 37
          Width = 136
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo Producto por defecto'
        end
        object SUCURSALDEFECTO: TSqlComboBox
          Left = 148
          Top = 7
          Width = 317
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from sucursales'
            'order by sucursal_nombre')
          Confcampo_codigo = 'sucursal_id'
          Confcampo_nomb = 'sucursal_nombre'
          Tag2 = 0
        end
        object CODIGOPRODUCTOPORDEFECTO: TGTBComboBox
          Left = 148
          Top = 34
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'Codigo'
          Items.Strings = (
            'Codigo'
            'Codigo2'
            'Codigo de Barras')
          Tag2 = 0
          valores.Strings = (
            '0'
            '1'
            '2')
        end
        object btnconfigurarmenu: TButton
          Left = 148
          Top = 62
          Width = 145
          Height = 25
          Caption = 'Configurar Menu principal'
          TabOrder = 2
          OnClick = btnconfigurarmenuClick
        end
        object GroupBox3: TGroupBox
          Left = 25
          Top = 104
          Width = 200
          Height = 129
          Caption = 'Titulos de Precios'
          TabOrder = 3
          object Label8: TLabel
            Left = 18
            Top = 20
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio1'
          end
          object Label9: TLabel
            Left = 18
            Top = 44
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio2'
          end
          object Label10: TLabel
            Left = 18
            Top = 68
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio3'
          end
          object Label11: TLabel
            Left = 18
            Top = 92
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio4'
          end
          object NOMBREPRECIO1: TEdit
            Left = 60
            Top = 17
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object NOMBREPRECIO2: TEdit
            Left = 60
            Top = 41
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object NOMBREPRECIO3: TEdit
            Left = 60
            Top = 65
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object NOMBREPRECIO4: TEdit
            Left = 60
            Top = 89
            Width = 121
            Height = 21
            TabOrder = 3
          end
        end
        object CLIENTEVEHICULO: TCheckBox
          Left = 329
          Top = 104
          Width = 160
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Habilitar vehiculo en clientes'
          TabOrder = 4
        end
        object LOGDB: TCheckBox
          Left = 384
          Top = 120
          Width = 105
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Habilitar Log DB'
          TabOrder = 5
        end
        object PRODUCTOSTOCKINICIAL: TCheckBox
          Left = 360
          Top = 136
          Width = 129
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Habilitar Stock inicial'
          TabOrder = 6
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Compras'
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Caption = 'Ventas'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 28
        object Label1: TLabel
          Left = 49
          Top = 44
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Puerto'
        end
        object Label3: TLabel
          Left = 4
          Top = 20
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Impresora Fiscal'
        end
        object Label6: TLabel
          Left = 16
          Top = 240
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'Modificar Descripcion'
        end
        object FISCALMODELO: TComboBox
          Left = 88
          Top = 17
          Width = 153
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'MODELO_614'
          Items.Strings = (
            'MODELO_614'
            'MODELO_615'
            'MODELO_PR4'
            'MODELO_950'
            'MODELO_951'
            'MODELO_262'
            'MODELO_PJ20'
            'MODELO_P320'
            'MODELO_715'
            'MODELO_PR5'
            'MODELO_272'
            'MODELO_PPL8'
            'MODELO_P321'
            'MODELO_P322'
            'MODELO_P425'
            'MODELO_P425_201'
            'MODELO_PPL8_201'
            'MODELO_P322_201'
            'MODELO_P330'
            'MODELO_P435'
            'MODELO_P330_201'
            'MODELO_PPL9'
            'MODELO_P330_202'
            'MODELO_P435_101'
            'MODELO_715_201'
            'MODELO_PR5_201'
            'MODELO_P435_102'
            'MODELO_PPL23'
            'MODELO_715_302'
            'MODELO_715_403'
            'MODELO_P330_203'
            'MODELO_P441'
            'MODELO_PPL23_10'
            'MODELO_P435_203'
            'MODELO_P1120')
        end
        object FISCALPUERTO: TComboBox
          Left = 88
          Top = 41
          Width = 89
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'COM1'
          Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6')
        end
        object VENTASCTDOPARCIALES: TCheckBox
          Left = 296
          Top = 19
          Width = 226
          Height = 17
          Caption = 'Permitir Pagos parciales en Ventas de Ctdo.'
          TabOrder = 2
        end
        object VENTASCTACTEPARCIALES: TCheckBox
          Left = 296
          Top = 35
          Width = 282
          Height = 17
          Caption = 'Permitir Pagos parciales en Ventas de Cta. Cte.'
          TabOrder = 3
        end
        object VENTASCTDOVENTANACTACTE: TCheckBox
          Left = 296
          Top = 51
          Width = 282
          Height = 17
          Caption = 'Mostrar Movimientos de Ctdo en ventana de Cta. Cte.'
          TabOrder = 4
        end
        object GroupBox1: TGroupBox
          Left = 9
          Top = 72
          Width = 467
          Height = 161
          Caption = 'Ventas Rapidas'
          TabOrder = 5
          object Label15: TLabel
            Left = 10
            Top = 58
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Doc'
          end
          object Label2: TLabel
            Left = 22
            Top = 85
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object Label4: TLabel
            Left = 8
            Top = 113
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Vendedor'
          end
          object Label5: TLabel
            Left = 13
            Top = 32
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sucursal'
          end
          object VENTARAPIDAPUNTOVENTAID: TSqlComboBox
            Left = 60
            Top = 55
            Width = 52
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnSelect = VENTARAPIDAPUNTOVENTAIDSelect
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from puntodeventa')
            Confcampo_codigo = 'puntoventa_id'
            Confcampo_nomb = 'puntoventa_numero'
            Tag2 = 0
          end
          object VENTARAPIDATIPODOCUID: TSqlComboBox
            Left = 118
            Top = 55
            Width = 52
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from tiposdocumento'
              'where tipodocu_nombre="Factura de Venta"')
            Confcampo_codigo = 'tipodocu_id'
            Confcampo_nomb = 'tipodocu_letra'
            Tag2 = 0
          end
          object VENTARAPIDACLIENTEID: TSqlComboBox
            Left = 60
            Top = 82
            Width = 317
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 3
            OnSelect = VENTARAPIDACLIENTEIDSelect
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from clientes'
              'order by cliente_nombre')
            Confcampo_codigo = 'cliente_id'
            Confcampo_nomb = 'cliente_nombre'
            Tag2 = 0
          end
          object VENTARAPIDAPERSONALID: TSqlComboBox
            Left = 60
            Top = 110
            Width = 220
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from personal')
            Confcampo_codigo = 'personal_id'
            Confcampo_nomb = 'personal_nombre'
            Tag2 = 0
          end
          object VENTARAPIDASUCURSALID: TSqlComboBox
            Left = 60
            Top = 29
            Width = 317
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnSelect = VENTARAPIDASUCURSALIDSelect
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from sucursales'
              'order by sucursal_nombre')
            Confcampo_codigo = 'sucursal_id'
            Confcampo_nomb = 'sucursal_nombre'
            Tag2 = 0
          end
        end
        object PRODUCTOMODIFICARDESCR: TEditCodi
          Left = 128
          Top = 237
          Width = 89
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
          Version = '1.3.0.1'
          ButtonStyle = bsButton
          ButtonWidth = 16
          Etched = False
          abm = False
          ConfCampoCodigo = 'producto_id'
          ConfCampoTexto = 'producto_nombre'
          ConfSqlConnection = Princ.ZBase
          ConfSql.Strings = (
            'select * from productos'
            'order by producto_nombre')
          ConfTexto = producto_nombre
          ConfIni = Princ.ini1
          ConfLimpiar = True
          ConfSearchLimpio = True
          ConfCampoBusqueda1 = 'producto_id'
        end
        object producto_nombre: TEdit
          Left = 223
          Top = 237
          Width = 334
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 7
        end
        object GroupBox2: TGroupBox
          Left = 9
          Top = 274
          Width = 258
          Height = 113
          Caption = 'Busqueda de Productos'
          TabOrder = 8
          object Label12: TLabel
            Left = 12
            Top = 56
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 2'
          end
          object Label13: TLabel
            Left = 12
            Top = 80
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 3'
          end
          object Label17: TLabel
            Left = 12
            Top = 32
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 1'
          end
          object CODIGOPRODUCTOBUSQUEDA1: TGTBComboBox
            Left = 63
            Top = 29
            Width = 162
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'Codigo 1'
            Items.Strings = (
              'Codigo 1'
              'Codigo 2'
              'Codigo de Barras')
            Tag2 = 0
            valores.Strings = (
              'producto_id'
              'producto_codigo'
              'producto_codigobarras')
          end
          object CODIGOPRODUCTOBUSQUEDA2: TGTBComboBox
            Left = 63
            Top = 53
            Width = 162
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Items.Strings = (
              ''
              'Codigo 1'
              'Codigo 2'
              'Codigo de Barras')
            Tag2 = 0
            valores.Strings = (
              ''
              'producto_id'
              'producto_codigo'
              'producto_codigobarras')
          end
          object CODIGOPRODUCTOBUSQUEDA3: TGTBComboBox
            Left = 63
            Top = 77
            Width = 162
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Items.Strings = (
              ''
              'Codigo 1'
              'Codigo 2'
              'Codigo de Barras')
            Tag2 = 0
            valores.Strings = (
              ''
              'producto_id'
              'producto_codigo'
              'producto_codigobarras')
          end
        end
        object VENTASNCNDCONCEPTOS: TCheckBox
          Left = 296
          Top = 291
          Width = 169
          Height = 17
          Caption = 'Usar NC y ND con conceptos'
          TabOrder = 9
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Bar'
        ImageIndex = 4
        object GroupBox4: TGroupBox
          Left = 3
          Top = 16
          Width = 390
          Height = 89
          Caption = 'Documento Bar'
          TabOrder = 0
          object Label16: TLabel
            Left = 10
            Top = 26
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Doc'
          end
          object Label18: TLabel
            Left = 22
            Top = 53
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object BARPUNTOVENTAID: TSqlComboBox
            Left = 60
            Top = 23
            Width = 52
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnSelect = BARPUNTOVENTAIDSelect
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from puntodeventa')
            Confcampo_codigo = 'puntoventa_id'
            Confcampo_nomb = 'puntoventa_numero'
            Tag2 = 0
          end
          object BARTIPODOCUID: TSqlComboBox
            Left = 118
            Top = 23
            Width = 259
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Confbase = Princ.ZBase
            Confsql.Strings = (
              
                'select *, concat(tipodocu_nombre,'#39' - '#39',tipodocu_letra) as nombre' +
                ' from tiposdocumento'
              'where tipodocu_tipo='#39'VENTA'#39
              'order by nombre')
            Confcampo_codigo = 'tipodocu_id'
            Confcampo_nomb = 'nombre'
            Tag2 = 0
          end
          object BARCLIENTEID: TSqlComboBox
            Left = 60
            Top = 50
            Width = 317
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            OnSelect = VENTARAPIDACLIENTEIDSelect
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from clientes'
              'order by cliente_nombre')
            Confcampo_codigo = 'cliente_id'
            Confcampo_nomb = 'cliente_nombre'
            Tag2 = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 3
          Top = 112
          Width = 390
          Height = 65
          Caption = 'Facturar Documento Bar'
          TabOrder = 1
          object Label19: TLabel
            Left = 10
            Top = 26
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Doc'
          end
          object BARFACTURAPUNTOVENTAID: TSqlComboBox
            Left = 60
            Top = 23
            Width = 52
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnSelect = BARFACTURAPUNTOVENTAIDSelect
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from puntodeventa')
            Confcampo_codigo = 'puntoventa_id'
            Confcampo_nomb = 'puntoventa_numero'
            Tag2 = 0
          end
          object BARFACTURATIPODOCUID: TSqlComboBox
            Left = 118
            Top = 23
            Width = 259
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Confbase = Princ.ZBase
            Confsql.Strings = (
              
                'select *, concat(tipodocu_nombre,'#39' - '#39',tipodocu_letra) as nombre' +
                ' from tiposdocumento'
              'where tipodocu_nombre='#39'Factura de Venta'#39
              'order by nombre')
            Confcampo_codigo = 'tipodocu_id'
            Confcampo_nomb = 'nombre'
            Tag2 = 0
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Cajas'
        ImageIndex = 5
        object Label21: TLabel
          Left = 10
          Top = 33
          Width = 105
          Height = 13
          Alignment = taRightJustify
          Caption = 'Concepto Saldo inicial'
        end
        object CAJASALDOINICIALCONCEPTOID: TSqlComboBox
          Left = 121
          Top = 30
          Width = 240
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from conceptos'
            'order by concepto_descripcion')
          ConfTabla = 'conceptos'
          Confcampo_codigo = 'concepto_id'
          Confcampo_nomb = 'concepto_descripcion'
          Tag2 = 0
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Actualizaciones'
        ImageIndex = 5
        object lblVERSIONEXE: TLabel
          Left = 469
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Version EXE'
        end
        object VERSIONDB: TLabel
          Left = 469
          Top = 67
          Width = 53
          Height = 13
          Caption = 'Version DB'
        end
        object btnactualizararchivos: TButton
          Left = 3
          Top = 19
          Width = 163
          Height = 25
          Caption = 'Actualizar Archivos desde Web'
          TabOrder = 0
          OnClick = btnactualizararchivosClick
        end
        object LINKARCHIVOS: TEdit
          Left = 172
          Top = 21
          Width = 293
          Height = 21
          TabOrder = 1
        end
        object btnactualizardb: TButton
          Left = 3
          Top = 62
          Width = 163
          Height = 25
          Caption = 'Actualizar DB desde Web'
          TabOrder = 2
          OnClick = btnactualizardbClick
        end
        object LINKSCRIPTDB: TEdit
          Left = 172
          Top = 64
          Width = 293
          Height = 21
          TabOrder = 3
        end
        object btnactualizardbfile: TButton
          Left = 3
          Top = 94
          Width = 163
          Height = 25
          Caption = 'Actualizar DB desde archivo'
          TabOrder = 4
          OnClick = btnactualizardbfileClick
        end
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 512
    Top = 176
  end
  object ZQConfig: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from config')
    Params = <>
    Left = 520
    Top = 248
  end
end
