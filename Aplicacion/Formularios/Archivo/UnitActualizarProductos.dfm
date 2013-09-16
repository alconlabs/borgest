object ActualizarProductos: TActualizarProductos
  Left = 0
  Top = 0
  Caption = 'ActualizarProductos'
  ClientHeight = 588
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 1035
    Height = 588
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
    object PgCtrlSettings: TPageControl
      Left = 0
      Top = 0
      Width = 1035
      Height = 570
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'Actualizar Productos'
        ImageIndex = 1
        object Label3: TLabel
          Left = 53
          Top = 12
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo1'
        end
        object Label4: TLabel
          Left = 221
          Top = 12
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo2'
        end
        object Label5: TLabel
          Left = 403
          Top = 12
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo de Barras'
        end
        object Label1: TLabel
          Left = 55
          Top = 36
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre'
        end
        object Label21: TLabel
          Left = 455
          Top = 36
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rubro'
        end
        object Label12: TLabel
          Left = 9
          Top = 84
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Calculo de Precio'
        end
        object Label14: TLabel
          Left = 402
          Top = 60
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Politica de Precio'
        end
        object Label8: TLabel
          Left = 443
          Top = 83
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo IVA'
        end
        object Label7: TLabel
          Left = 43
          Top = 60
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
        end
        object fil_producto_id: TEdit
          Left = 98
          Top = 9
          Width = 103
          Height = 21
          TabOrder = 0
        end
        object fil_producto_codigo: TEdit
          Left = 266
          Top = 9
          Width = 103
          Height = 21
          TabOrder = 1
        end
        object fil_producto_codigobarras: TEdit
          Left = 490
          Top = 9
          Width = 151
          Height = 21
          TabOrder = 2
        end
        object fil_producto_nombre: TEdit
          Left = 98
          Top = 33
          Width = 271
          Height = 21
          TabOrder = 3
        end
        object fil_rubro_id: TSqlComboBox
          Left = 490
          Top = 33
          Width = 151
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from rubros'
            'order by rubro_nombre')
          ConfTabla = 'rubros'
          Confcampo_codigo = 'rubro_id'
          Confcampo_nomb = 'rubro_nombre'
          Tag2 = 0
          ConfTodos = True
        end
        object fil_calculoprecio_id: TSqlComboBox
          Left = 98
          Top = 81
          Width = 151
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 5
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from calculoprecios'
            'order by calculoprecio_nombre')
          ConfTabla = 'calculoprecios'
          Confcampo_codigo = 'calculoprecio_id'
          Confcampo_nomb = 'calculoprecio_nombre'
          Tag2 = 0
          ConfTodos = True
        end
        object fil_politicaprecio_id: TSqlComboBox
          Left = 490
          Top = 57
          Width = 151
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from politicasdeprecios'
            'order by politicaprecio_nombre')
          ConfTabla = 'politicasdeprecios'
          Confcampo_codigo = 'politicaprecio_id'
          Confcampo_nomb = 'politicaprecio_nombre'
          Tag2 = 0
          ConfTodos = True
        end
        object fil_tipoiva_id: TSqlComboBox
          Left = 490
          Top = 80
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 8
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from tipoiva'
            'order by tipoiva_nombre')
          ConfTabla = 'tipoiva'
          Confcampo_codigo = 'tipoiva_id'
          Confcampo_nomb = 'tipoiva_nombre'
          Tag2 = 0
          ConfTodos = True
        end
        object fil_proveedor_id: TSqlComboBox
          Left = 98
          Top = 57
          Width = 271
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from proveedores'
            'order by proveedor_nombre')
          ConfTabla = 'proveedores'
          Confcampo_codigo = 'proveedor_id'
          Confcampo_nomb = 'proveedor_nombre'
          Tag2 = 0
          ConfTodos = True
        end
        object DBGrid5: TDBGrid
          Left = 3
          Top = 107
          Width = 1021
          Height = 241
          DataSource = DTSProductosAactualizar
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 10
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid5DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo1'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_codigo'
              Title.Caption = 'Codigo2'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_nombre'
              Title.Caption = 'Descripcion'
              Width = 274
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_preciocosto'
              Title.Caption = 'P.Compra'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_precioventa1'
              Title.Caption = 'P.Venta1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_precioventa2'
              Title.Caption = 'P.Venta2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_precioventa3'
              Title.Caption = 'P.Venta3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_precioventa4'
              Title.Caption = 'P.Venta4'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'producto_codigoreferencia'
              Title.Caption = 'Cod. Referencia'
              Width = 120
              Visible = True
            end>
        end
        object btnfiltrar: TButton
          Left = 690
          Top = 78
          Width = 90
          Height = 25
          Caption = 'Filtrar'
          TabOrder = 9
          OnClick = btnfiltrarClick
        end
        object GroupBox1: TGroupBox
          Left = 3
          Top = 378
          Width = 182
          Height = 119
          Caption = 'Precio Compra'
          TabOrder = 11
          object Label25: TLabel
            Left = 10
            Top = 18
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nuevo precio'
          end
          object Label27: TLabel
            Left = 156
            Top = 18
            Width = 14
            Height = 16
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 2
            Top = 50
            Width = 139
            Height = 13
            Caption = 'Aplicar sobre P.Compra'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 2
            Top = 66
            Width = 163
            Height = 13
            Caption = 'y calcular Precios de Venta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object porc_nuevopreciocompra: TDBAdvEdit
            Left = 80
            Top = 15
            Width = 73
            Height = 21
            EditType = etFloat
            Precision = 2
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Color = clWindow
            Enabled = True
            TabOrder = 0
            Text = '0,00'
            Visible = True
            Version = '2.7.0.5'
          end
          object btnAplcarPCompra: TButton
            Left = 7
            Top = 83
            Width = 91
            Height = 25
            Caption = 'Aplicar'
            TabOrder = 1
            OnClick = btnAplcarPCompraClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 191
          Top = 378
          Width = 182
          Height = 119
          Caption = 'Precio Venta'
          TabOrder = 12
          object Label30: TLabel
            Left = 10
            Top = 18
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nuevo precio'
          end
          object Label31: TLabel
            Left = 156
            Top = 18
            Width = 14
            Height = 16
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 2
            Top = 50
            Width = 180
            Height = 13
            Caption = 'Aplicar sobre precios de venta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object porc_nuevoprecioventa: TDBAdvEdit
            Left = 80
            Top = 15
            Width = 73
            Height = 21
            EditType = etFloat
            Precision = 2
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Color = clWindow
            Enabled = True
            TabOrder = 0
            Text = '0,00'
            Visible = True
            Version = '2.7.0.5'
          end
          object btnAplicarPVenta: TButton
            Left = 10
            Top = 83
            Width = 91
            Height = 25
            Caption = 'Aplicar'
            TabOrder = 1
            OnClick = btnAplicarPVentaClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 380
          Top = 378
          Width = 182
          Height = 119
          Caption = 'Calculo de precio'
          TabOrder = 13
          object Label35: TLabel
            Left = -1
            Top = 50
            Width = 108
            Height = 13
            Caption = 'Asignar y calcular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 2
            Top = 66
            Width = 122
            Height = 13
            Caption = 'los precios de venta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object btnAplicarCalculo: TButton
            Left = 3
            Top = 83
            Width = 91
            Height = 25
            Caption = 'Aplicar'
            TabOrder = 0
            OnClick = btnAplicarCalculoClick
          end
          object nuevo_calculoprecio_id: TSqlComboBox
            Left = 9
            Top = 15
            Width = 151
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from calculoprecios'
              'order by calculoprecio_nombre')
            ConfTabla = 'calculoprecios'
            Confcampo_codigo = 'calculoprecio_id'
            Confcampo_nomb = 'calculoprecio_nombre'
            Tag2 = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 568
          Top = 378
          Width = 182
          Height = 119
          Caption = 'Politica de Precio'
          TabOrder = 14
          object Label33: TLabel
            Left = -1
            Top = 50
            Width = 108
            Height = 13
            Caption = 'Asignar y calcular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 2
            Top = 66
            Width = 122
            Height = 13
            Caption = 'los precios de venta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object btnAplicarPolitica: TButton
            Left = 3
            Top = 83
            Width = 91
            Height = 25
            Caption = 'Aplicar'
            TabOrder = 0
            OnClick = btnAplicarPoliticaClick
          end
          object nuevo_politicaprecio_id: TSqlComboBox
            Left = 7
            Top = 17
            Width = 151
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from politicasdeprecios'
              'order by politicaprecio_nombre')
            ConfTabla = 'politicasdeprecios'
            Confcampo_codigo = 'politicaprecio_id'
            Confcampo_nomb = 'politicaprecio_nombre'
            Tag2 = 0
          end
        end
        object btnquitarAactualizar: TButton
          Left = 3
          Top = 351
          Width = 99
          Height = 25
          Caption = 'Quitar de la lista'
          TabOrder = 15
          OnClick = btnquitarAactualizarClick
        end
        object btnrecalculartodo: TButton
          Left = 3
          Top = 514
          Width = 238
          Height = 25
          Caption = 'Recalcular precios de TODOS los productos'
          TabOrder = 16
          OnClick = btnrecalculartodoClick
        end
        object bnteliminarproductos: TButton
          Left = 247
          Top = 514
          Width = 110
          Height = 25
          Caption = 'Eliminar Productos'
          TabOrder = 17
          OnClick = bnteliminarproductosClick
        end
        object GroupBox5: TGroupBox
          Left = 756
          Top = 378
          Width = 182
          Height = 119
          Caption = 'Rubro'
          TabOrder = 18
          object Label37: TLabel
            Left = 0
            Top = 50
            Width = 126
            Height = 13
            Caption = 'Asignar nuevo Rubro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object BtnAplicarRubro: TButton
            Left = 3
            Top = 83
            Width = 91
            Height = 25
            Caption = 'Aplicar'
            TabOrder = 0
            OnClick = BtnAplicarRubroClick
          end
          object nuevo_rubro_id: TSqlComboBox
            Left = 7
            Top = 17
            Width = 151
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Confbase = Princ.ZBase
            Confsql.Strings = (
              'select * from rubros'
              'order by rubro_nombre')
            ConfTabla = 'rubros'
            Confcampo_codigo = 'rubro_id'
            Confcampo_nomb = 'rubro_nombre'
            Tag2 = 0
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Actualizar desde Excel'
        ImageIndex = 1
        object Label2: TLabel
          Left = 40
          Top = 5
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Archivo'
        end
        object Label6: TLabel
          Left = 54
          Top = 29
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hoja'
        end
        object Label9: TLabel
          Left = 567
          Top = 53
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rubro'
        end
        object Label10: TLabel
          Left = 547
          Top = 5
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
        end
        object Label11: TLabel
          Left = 513
          Top = 29
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Calculo de Precio'
        end
        object Label13: TLabel
          Left = 514
          Top = 77
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Politica de Precio'
        end
        object Label15: TLabel
          Left = 555
          Top = 101
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo IVA'
        end
        object Label16: TLabel
          Left = 43
          Top = 53
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo'
        end
        object Label17: TLabel
          Left = 20
          Top = 101
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descripcion'
        end
        object Label18: TLabel
          Left = 7
          Top = 125
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Precio Compra'
        end
        object Label19: TLabel
          Left = 32
          Top = 173
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fila Inicio'
        end
        object Label20: TLabel
          Left = 241
          Top = 173
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fila Fin'
        end
        object Label22: TLabel
          Left = 47
          Top = 77
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prefijo'
        end
        object Label23: TLabel
          Left = 248
          Top = 77
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sufijo'
        end
        object Label24: TLabel
          Left = 174
          Top = 125
          Width = 100
          Height = 13
          Alignment = taRightJustify
          Caption = 'Codigo deReferencia'
        end
        object Label26: TLabel
          Left = 15
          Top = 149
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Stock Actual'
        end
        object btnexaminar: TButton
          Left = 353
          Top = 0
          Width = 27
          Height = 25
          Caption = '...'
          TabOrder = 1
          OnClick = btnexaminarClick
        end
        object archivo_excel: TEdit
          Left = 82
          Top = 2
          Width = 271
          Height = 21
          TabOrder = 0
        end
        object btnabrirarchivo: TButton
          Left = 602
          Top = 144
          Width = 151
          Height = 25
          Caption = 'Abrir archivo'
          TabOrder = 19
          OnClick = btnabrirarchivoClick
        end
        object Hojas: TComboBox
          Left = 82
          Top = 26
          Width = 271
          Height = 21
          ItemHeight = 13
          TabOrder = 3
        end
        object xls_rubro_id: TSqlComboBox
          Left = 602
          Top = 50
          Width = 151
          Height = 21
          ItemHeight = 13
          TabOrder = 16
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from rubros'
            'order by rubro_nombre')
          ConfTabla = 'rubros'
          Confcampo_codigo = 'rubro_id'
          Confcampo_nomb = 'rubro_nombre'
          Tag2 = 0
        end
        object xls_proveedor_id: TSqlComboBox
          Left = 602
          Top = 2
          Width = 271
          Height = 21
          ItemHeight = 13
          TabOrder = 14
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from proveedores'
            'order by proveedor_nombre')
          ConfTabla = 'proveedores'
          Confcampo_codigo = 'proveedor_id'
          Confcampo_nomb = 'proveedor_nombre'
          Tag2 = 0
        end
        object xls_calculoprecio_id: TSqlComboBox
          Left = 602
          Top = 26
          Width = 151
          Height = 21
          ItemHeight = 13
          TabOrder = 15
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from calculoprecios'
            'order by calculoprecio_nombre')
          ConfTabla = 'calculoprecios'
          Confcampo_codigo = 'calculoprecio_id'
          Confcampo_nomb = 'calculoprecio_nombre'
          Tag2 = 0
        end
        object xls_politicaprecio_id: TSqlComboBox
          Left = 602
          Top = 74
          Width = 151
          Height = 21
          ItemHeight = 13
          TabOrder = 17
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from politicasdeprecios'
            'order by politicaprecio_nombre')
          ConfTabla = 'politicasdeprecios'
          Confcampo_codigo = 'politicaprecio_id'
          Confcampo_nomb = 'politicaprecio_nombre'
          Tag2 = 0
        end
        object xls_tipoiva_id: TSqlComboBox
          Left = 602
          Top = 98
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 18
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from tipoiva'
            'order by tipoiva_nombre')
          ConfTabla = 'tipoiva'
          Confcampo_codigo = 'tipoiva_id'
          Confcampo_nomb = 'tipoiva_nombre'
          Tag2 = 0
        end
        object columna_codigo: TComboBox
          Left = 82
          Top = 50
          Width = 73
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'O'
            'P')
        end
        object columna_descripcion: TComboBox
          Left = 82
          Top = 98
          Width = 73
          Height = 21
          ItemHeight = 13
          TabOrder = 8
          Items.Strings = (
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'O'
            'P')
        end
        object columna_preciocompra: TComboBox
          Left = 82
          Top = 122
          Width = 73
          Height = 21
          ItemHeight = 13
          TabOrder = 9
          Items.Strings = (
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'O'
            'P')
        end
        object fila_inicio: TDBAdvEdit
          Left = 82
          Top = 170
          Width = 73
          Height = 21
          EditType = etNumeric
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 12
          Text = '0'
          Visible = True
          Version = '2.7.0.5'
        end
        object tipo_codigo: TComboBox
          Left = 209
          Top = 50
          Width = 144
          Height = 21
          ItemHeight = 13
          TabOrder = 5
          OnSelect = tipo_codigoSelect
          Items.Strings = (
            'Codigo1'
            'Codigo2'
            'Codigo de Barras')
        end
        object fila_fin: TDBAdvEdit
          Left = 280
          Top = 170
          Width = 73
          Height = 21
          EditType = etNumeric
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          Enabled = True
          TabOrder = 13
          Text = '0'
          Visible = True
          Version = '2.7.0.5'
        end
        object sufijo: TEdit
          Left = 280
          Top = 74
          Width = 73
          Height = 21
          TabOrder = 7
        end
        object prefijo: TEdit
          Left = 82
          Top = 74
          Width = 73
          Height = 21
          TabOrder = 6
        end
        object btnverarchivo: TButton
          Left = 386
          Top = 0
          Width = 90
          Height = 25
          Caption = 'Ver archivo'
          Enabled = False
          TabOrder = 2
          OnClick = btnverarchivoClick
        end
        object columna_codigoreferencia: TComboBox
          Left = 280
          Top = 122
          Width = 73
          Height = 21
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'O'
            'P')
        end
        object columna_stockactual: TComboBox
          Left = 82
          Top = 146
          Width = 73
          Height = 21
          ItemHeight = 13
          TabOrder = 11
          Items.Strings = (
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'O'
            'P')
        end
        object PanelGrillasExcel: TPanel
          Left = 0
          Top = 197
          Width = 1027
          Height = 345
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'PanelGrillasExcel'
          TabOrder = 20
          object PgCtrlGrids: TPageControl
            Left = 0
            Top = 0
            Width = 1027
            Height = 345
            ActivePage = TabSheet3
            Align = alClient
            TabOrder = 0
            object TabSheet3: TTabSheet
              Caption = 'Productos Nuevos'
              ImageIndex = 1
              object lblcantidadnuevos: TLabel
                Left = 7
                Top = 245
                Width = 99
                Height = 13
                Caption = 'Cantidad de registros'
              end
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 1019
                Height = 241
                Align = alTop
                DataSource = DTSNuevos
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'producto_id'
                    Title.Caption = 'Codigo1'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigo'
                    Title.Caption = 'Codigo2'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigobarras'
                    Title.Caption = 'Cod.Barras'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_nombre'
                    Title.Caption = 'Descripcion'
                    Width = 274
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_preciocosto'
                    Title.Caption = 'P.Compra'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa1'
                    Title.Caption = 'P.Venta1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa2'
                    Title.Caption = 'P.Venta2'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa3'
                    Title.Caption = 'P.Venta3'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa4'
                    Title.Caption = 'P.Venta4'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigoreferencia'
                    Title.Caption = 'Cod. Referencia'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producdepo_stockactual'
                    Title.Caption = 'Stock'
                    Width = 39
                    Visible = True
                  end>
              end
              object btnagregarnuevos: TButton
                Left = 848
                Top = 271
                Width = 147
                Height = 25
                Caption = 'Agregar Nuevos Productos'
                TabOrder = 1
                OnClick = btnagregarnuevosClick
              end
              object btnquitarnuevo: TButton
                Left = 8
                Top = 271
                Width = 99
                Height = 25
                Caption = 'Quitar de la lista'
                TabOrder = 2
                OnClick = btnquitarnuevoClick
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'A Incrementar'
              ImageIndex = 2
              object lblcantidadincrementar: TLabel
                Left = 7
                Top = 245
                Width = 99
                Height = 13
                Caption = 'Cantidad de registros'
              end
              object btnincrementarprecios: TButton
                Left = 848
                Top = 271
                Width = 99
                Height = 25
                Caption = 'Actualizar Precios'
                TabOrder = 0
                OnClick = btnincrementarpreciosClick
              end
              object DBGrid2: TDBGrid
                Left = 0
                Top = 0
                Width = 1019
                Height = 241
                Align = alTop
                DataSource = DTSIncrementar
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
                    FieldName = 'producto_id'
                    Title.Caption = 'Codigo1'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigo'
                    Title.Caption = 'Codigo2'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigobarras'
                    Title.Caption = 'Cod.Barras'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_nombre'
                    Title.Caption = 'Descripcion'
                    Width = 228
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_preciocostoprev'
                    Title.Caption = 'P.Compra'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_preciocosto'
                    Title.Caption = 'P.Compra Nuevo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'diferencia'
                    Title.Caption = 'Diferencia'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa1'
                    Title.Caption = 'P.Venta1'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa2'
                    Title.Caption = 'P.Venta2'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa3'
                    Title.Caption = 'P.Venta3'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa4'
                    Title.Caption = 'P.Venta4'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigoreferencia'
                    Title.Caption = 'Cod. Referencia'
                    Width = 140
                    Visible = True
                  end>
              end
              object btnquitarincrementar: TButton
                Left = 3
                Top = 271
                Width = 99
                Height = 25
                Caption = 'Quitar de la lista'
                TabOrder = 2
                OnClick = btnquitarincrementarClick
              end
              object btncodigosreferenciaincrementar: TButton
                Left = 664
                Top = 271
                Width = 171
                Height = 25
                Caption = 'Actualizar Codigos de Referencia'
                Enabled = False
                TabOrder = 3
              end
            end
            object TabSheet5: TTabSheet
              Caption = 'A Disminuir'
              ImageIndex = 3
              object lblcantidadisminuir: TLabel
                Left = 7
                Top = 245
                Width = 99
                Height = 13
                Caption = 'Cantidad de registros'
              end
              object btndisminuirprecios: TButton
                Left = 848
                Top = 271
                Width = 99
                Height = 25
                Caption = 'Actualizar Precios'
                TabOrder = 0
                OnClick = btndisminuirpreciosClick
              end
              object DBGrid3: TDBGrid
                Left = 0
                Top = 0
                Width = 1019
                Height = 241
                Align = alTop
                DataSource = DTSDisminuir
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
                    FieldName = 'producto_id'
                    Title.Caption = 'Codigo1'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigo'
                    Title.Caption = 'Codigo2'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigobarras'
                    Title.Caption = 'Cod.Barras'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_nombre'
                    Title.Caption = 'Descripcion'
                    Width = 228
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_preciocostoprev'
                    Title.Caption = 'P.Compra'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_preciocosto'
                    Title.Caption = 'P.Compra Nuevo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'diferencia'
                    Title.Caption = 'Diferencia'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa1'
                    Title.Caption = 'P.Venta1'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa2'
                    Title.Caption = 'P.Venta2'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa3'
                    Title.Caption = 'P.Venta3'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa4'
                    Title.Caption = 'P.Venta4'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigoreferencia'
                    Title.Caption = 'Cod. Referencia'
                    Width = 140
                    Visible = True
                  end>
              end
              object btnquitardisminuir: TButton
                Left = 3
                Top = 271
                Width = 99
                Height = 25
                Caption = 'Quitar de la lista'
                TabOrder = 2
                OnClick = btnquitardisminuirClick
              end
              object btncodigosreferenciadisminuir: TButton
                Left = 664
                Top = 271
                Width = 171
                Height = 25
                Caption = 'Actualizar Codigos de Referencia'
                Enabled = False
                TabOrder = 3
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Sin Cambios'
              ImageIndex = 3
              object lblcantidadsincambios: TLabel
                Left = 7
                Top = 245
                Width = 99
                Height = 13
                Caption = 'Cantidad de registros'
              end
              object DBGrid4: TDBGrid
                Left = 0
                Top = 0
                Width = 1019
                Height = 241
                Align = alTop
                DataSource = DTSSincambios
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'producto_id'
                    Title.Caption = 'Codigo1'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigo'
                    Title.Caption = 'Codigo2'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigobarras'
                    Title.Caption = 'Cod.Barras'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_nombre'
                    Title.Caption = 'Descripcion'
                    Width = 327
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_preciocosto'
                    Title.Caption = 'P.Compra'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa1'
                    Title.Caption = 'P.Venta1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa2'
                    Title.Caption = 'P.Venta2'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa3'
                    Title.Caption = 'P.Venta3'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_precioventa4'
                    Title.Caption = 'P.Venta4'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'producto_codigoreferencia'
                    Title.Caption = 'Cod. Referencia'
                    Width = 140
                    Visible = True
                  end>
              end
              object btncodigosreferenciasincambios: TButton
                Left = 664
                Top = 271
                Width = 171
                Height = 25
                Caption = 'Actualizar Codigos de Referencia'
                Enabled = False
                TabOrder = 1
              end
            end
          end
        end
      end
    end
  end
  object ZQproductos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productos'
      'where producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 952
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productos'
      'where producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 952
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object DTSExcel: TDataSource
    AutoEdit = False
    DataSet = Princ.ADODataSet1
    Left = 832
    Top = 64
  end
  object MQproductodeposito: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as deposito_id,t as deposito_nombre,i as producto_id,d ' +
        'as producdepo_puntorepos,d as producdepo_stockminimo,d as produc' +
        'depo_stockactual from temp ')
    Params = <>
    ConfCampos.Strings = (
      'deposito_id,i'
      'deposito_nombre,t'
      'producto_id,i'
      'producdepo_puntorepos,d'
      'producdepo_stockminimo,d'
      'producdepo_stockactual,d')
    Left = 952
    Top = 64
    object MQproductodepositodeposito_id: TIntegerField
      FieldName = 'deposito_id'
    end
    object MQproductodepositodeposito_nombre: TStringField
      FieldName = 'deposito_nombre'
      Size = 255
    end
    object MQproductodepositoproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object MQproductodepositoproducdepo_puntorepos: TFloatField
      FieldName = 'producdepo_puntorepos'
      DisplayFormat = '0.00'
    end
    object MQproductodepositoproducdepo_stockminimo: TFloatField
      FieldName = 'producdepo_stockminimo'
      DisplayFormat = '0.00'
    end
    object MQproductodepositoproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object ZQDepositos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from depositos')
    Params = <>
    Left = 952
    Top = 112
  end
  object ZQproductodeposito: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from productodeposito'
      'where deposito_id=:deposito_id and'
      'producto_id=:producto_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'deposito_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    Left = 952
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'deposito_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object MQNuevos: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as producto_id,t as producto_nombre,t as producto_codig' +
        'o,t as producto_codigobarras,d as producto_preciocosto,d as prod' +
        'ucto_precioventabase,d as producto_precioventa1,d as producto_pr' +
        'ecioventa2,d as producto_precioventa3,d as producto_precioventa4' +
        ',i as calculoprecio_id,i as politicaprecio_id,i as tipoiva_id,i ' +
        'as rubro_id,i as proveedor_id,d as producto_neto1,d as producto_' +
        'neto2,d as producto_neto3,d as producto_neto4,t as producto_esta' +
        'do,t as producto_observaciones,t as producto_codigoreferencia,d ' +
        'as producdepo_stockactual from temp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,i'
      'producto_nombre,t'
      'producto_codigo,t'
      'producto_codigobarras,t'
      'producto_preciocosto,d'
      'producto_precioventabase,d'
      'producto_precioventa1,d'
      'producto_precioventa2,d'
      'producto_precioventa3,d'
      'producto_precioventa4,d'
      'calculoprecio_id,i'
      'politicaprecio_id,i'
      'tipoiva_id,i'
      'rubro_id,i'
      'proveedor_id,i'
      'producto_neto1,d'
      'producto_neto2,d'
      'producto_neto3,d'
      'producto_neto4,d'
      'producto_estado,t'
      'producto_observaciones,t'
      'producto_codigoreferencia,t'
      'producdepo_stockactual,d')
    Left = 952
    Top = 448
    object MQNuevosproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object MQNuevosproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 255
    end
    object MQNuevosproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 255
    end
    object MQNuevosproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 255
    end
    object MQNuevosproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
      DisplayFormat = '0.00'
    end
    object MQNuevosproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
      DisplayFormat = '0.00'
    end
    object MQNuevosproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
      DisplayFormat = '0.00'
    end
    object MQNuevosproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
      DisplayFormat = '0.00'
    end
    object MQNuevosproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
      DisplayFormat = '0.00'
    end
    object MQNuevosproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
      DisplayFormat = '0.00'
    end
    object MQNuevoscalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object MQNuevospoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object MQNuevostipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object MQNuevosrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object MQNuevosproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object MQNuevosproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object MQNuevosproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object MQNuevosproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object MQNuevosproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object MQNuevosproducto_estado: TStringField
      FieldName = 'producto_estado'
      Size = 255
    end
    object MQNuevosproducto_observaciones: TStringField
      FieldName = 'producto_observaciones'
      Size = 255
    end
    object MQNuevosproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 255
    end
    object MQNuevosproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
    end
  end
  object DTSDisminuir: TDataSource
    DataSet = MQDisminuir
    Left = 832
    Top = 112
  end
  object MQIncrementar: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as producto_id,t as producto_nombre,t as producto_codig' +
        'o,t as producto_codigobarras,d as producto_preciocostoprev,d as ' +
        'producto_precioventa1prev,d as producto_precioventa2prev,d as pr' +
        'oducto_precioventa3prev,d as producto_precioventa4prev,d as prod' +
        'ucto_preciocosto,d as producto_precioventabase,d as producto_pre' +
        'cioventa1,d as producto_precioventa2,d as producto_precioventa3,' +
        'd as producto_precioventa4,i as calculoprecio_id,i as politicapr' +
        'ecio_id,i as tipoiva_id,i as rubro_id,i as proveedor_id,d as pro' +
        'ducto_neto1,d as producto_neto2,d as producto_neto3,d as product' +
        'o_neto4,d as diferencia,d as producdepo_stockactual,t as product' +
        'o_codigoreferencia from temp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,i'
      'producto_nombre,t'
      'producto_codigo,t'
      'producto_codigobarras,t'
      'producto_preciocostoprev,d'
      'producto_precioventa1prev,d'
      'producto_precioventa2prev,d'
      'producto_precioventa3prev,d'
      'producto_precioventa4prev,d'
      'producto_preciocosto,d'
      'producto_precioventabase,d'
      'producto_precioventa1,d'
      'producto_precioventa2,d'
      'producto_precioventa3,d'
      'producto_precioventa4,d'
      'calculoprecio_id,i'
      'politicaprecio_id,i'
      'tipoiva_id,i'
      'rubro_id,i'
      'proveedor_id,i'
      'producto_neto1,d'
      'producto_neto2,d'
      'producto_neto3,d'
      'producto_neto4,d'
      'diferencia,d'
      'producdepo_stockactual,d'
      'producto_codigoreferencia,t')
    Left = 952
    Top = 304
    object MQIncrementarproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object MQIncrementarproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 255
    end
    object MQIncrementarproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 255
    end
    object MQIncrementarproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 255
    end
    object MQIncrementarproducto_preciocostoprev: TFloatField
      FieldName = 'producto_preciocostoprev'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa1prev: TFloatField
      FieldName = 'producto_precioventa1prev'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa2prev: TFloatField
      FieldName = 'producto_precioventa2prev'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa3prev: TFloatField
      FieldName = 'producto_precioventa3prev'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa4prev: TFloatField
      FieldName = 'producto_precioventa4prev'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
      DisplayFormat = '0.00'
    end
    object MQIncrementarcalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object MQIncrementarpoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object MQIncrementartipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object MQIncrementarrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object MQIncrementarproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object MQIncrementarproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
      DisplayFormat = '0.00'
    end
    object MQIncrementarproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
      DisplayFormat = '0.00'
    end
    object MQIncrementardiferencia: TFloatField
      FieldName = 'diferencia'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object MQIncrementarproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
    end
    object MQIncrementarproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 255
    end
  end
  object MQDisminuir: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as producto_id,t as producto_nombre,t as producto_codig' +
        'o,t as producto_codigobarras,d as producto_preciocostoprev,d as ' +
        'producto_precioventa1prev,d as producto_precioventa2prev,d as pr' +
        'oducto_precioventa3prev,d as producto_precioventa4prev,d as prod' +
        'ucto_preciocosto,d as producto_precioventabase,d as producto_pre' +
        'cioventa1,d as producto_precioventa2,d as producto_precioventa3,' +
        'd as producto_precioventa4,i as calculoprecio_id,i as politicapr' +
        'ecio_id,i as tipoiva_id,i as rubro_id,i as proveedor_id,d as pro' +
        'ducto_neto1,d as producto_neto2,d as producto_neto3,d as product' +
        'o_neto4,d as diferencia,d as producdepo_stockactual,t as product' +
        'o_codigoreferencia from temp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,i'
      'producto_nombre,t'
      'producto_codigo,t'
      'producto_codigobarras,t'
      'producto_preciocostoprev,d'
      'producto_precioventa1prev,d'
      'producto_precioventa2prev,d'
      'producto_precioventa3prev,d'
      'producto_precioventa4prev,d'
      'producto_preciocosto,d'
      'producto_precioventabase,d'
      'producto_precioventa1,d'
      'producto_precioventa2,d'
      'producto_precioventa3,d'
      'producto_precioventa4,d'
      'calculoprecio_id,i'
      'politicaprecio_id,i'
      'tipoiva_id,i'
      'rubro_id,i'
      'proveedor_id,i'
      'producto_neto1,d'
      'producto_neto2,d'
      'producto_neto3,d'
      'producto_neto4,d'
      'diferencia,d'
      'producdepo_stockactual,d'
      'producto_codigoreferencia,t')
    Left = 952
    Top = 352
    object MQDisminuirproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object MQDisminuirproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 255
    end
    object MQDisminuirproducto_codigo: TStringField
      FieldName = 'producto_codigo'
      Size = 255
    end
    object MQDisminuirproducto_codigobarras: TStringField
      FieldName = 'producto_codigobarras'
      Size = 255
    end
    object MQDisminuirproducto_preciocostoprev: TFloatField
      FieldName = 'producto_preciocostoprev'
    end
    object MQDisminuirproducto_precioventa1prev: TFloatField
      FieldName = 'producto_precioventa1prev'
    end
    object MQDisminuirproducto_precioventa2prev: TFloatField
      FieldName = 'producto_precioventa2prev'
    end
    object MQDisminuirproducto_precioventa3prev: TFloatField
      FieldName = 'producto_precioventa3prev'
    end
    object MQDisminuirproducto_precioventa4prev: TFloatField
      FieldName = 'producto_precioventa4prev'
    end
    object MQDisminuirproducto_preciocosto: TFloatField
      FieldName = 'producto_preciocosto'
    end
    object MQDisminuirproducto_precioventabase: TFloatField
      FieldName = 'producto_precioventabase'
    end
    object MQDisminuirproducto_precioventa1: TFloatField
      FieldName = 'producto_precioventa1'
    end
    object MQDisminuirproducto_precioventa2: TFloatField
      FieldName = 'producto_precioventa2'
    end
    object MQDisminuirproducto_precioventa3: TFloatField
      FieldName = 'producto_precioventa3'
    end
    object MQDisminuirproducto_precioventa4: TFloatField
      FieldName = 'producto_precioventa4'
    end
    object MQDisminuircalculoprecio_id: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object MQDisminuirpoliticaprecio_id: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object MQDisminuirtipoiva_id: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object MQDisminuirrubro_id: TIntegerField
      FieldName = 'rubro_id'
    end
    object MQDisminuirproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object MQDisminuirproducto_neto1: TFloatField
      FieldName = 'producto_neto1'
    end
    object MQDisminuirproducto_neto2: TFloatField
      FieldName = 'producto_neto2'
    end
    object MQDisminuirproducto_neto3: TFloatField
      FieldName = 'producto_neto3'
    end
    object MQDisminuirproducto_neto4: TFloatField
      FieldName = 'producto_neto4'
    end
    object MQDisminuirdiferencia: TFloatField
      FieldName = 'diferencia'
    end
    object MQDisminuirproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
    end
    object MQDisminuirproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 255
    end
  end
  object DTSNuevos: TDataSource
    AutoEdit = False
    DataSet = MQNuevos
    Left = 832
    Top = 160
  end
  object DTSIncrementar: TDataSource
    AutoEdit = False
    DataSet = MQIncrementar
    Left = 832
    Top = 208
  end
  object MQSincambios: TMQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select i as producto_id,t as producto_nombre,t as producto_codig' +
        'o,t as producto_codigobarras,d as producto_preciocosto,d as prod' +
        'ucto_precioventabase,d as producto_precioventa1,d as producto_pr' +
        'ecioventa2,d as producto_precioventa3,d as producto_precioventa4' +
        ',i as calculoprecio_id,i as politicaprecio_id,i as tipoiva_id,i ' +
        'as rubro_id,i as proveedor_id,d as producto_neto1,d as producto_' +
        'neto2,d as producto_neto3,d as producto_neto4,d as producdepo_st' +
        'ockminimo,d as producdepo_stockactual,t as producto_codigorefere' +
        'ncia from temp ')
    Params = <>
    ConfCampos.Strings = (
      'producto_id,i'
      'producto_nombre,t'
      'producto_codigo,t'
      'producto_codigobarras,t'
      'producto_preciocosto,d'
      'producto_precioventabase,d'
      'producto_precioventa1,d'
      'producto_precioventa2,d'
      'producto_precioventa3,d'
      'producto_precioventa4,d'
      'calculoprecio_id,i'
      'politicaprecio_id,i'
      'tipoiva_id,i'
      'rubro_id,i'
      'proveedor_id,i'
      'producto_neto1,d'
      'producto_neto2,d'
      'producto_neto3,d'
      'producto_neto4,d'
      'producdepo_stockminimo,d'
      'producdepo_stockactual,d'
      'producto_codigoreferencia,t')
    Left = 952
    Top = 400
    object IntegerField1: TIntegerField
      FieldName = 'producto_id'
    end
    object StringField1: TStringField
      FieldName = 'producto_nombre'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'producto_codigo'
      Size = 255
    end
    object StringField3: TStringField
      FieldName = 'producto_codigobarras'
      Size = 255
    end
    object FloatField1: TFloatField
      FieldName = 'producto_preciocosto'
      DisplayFormat = '0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'producto_precioventabase'
      DisplayFormat = '0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'producto_precioventa1'
      DisplayFormat = '0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'producto_precioventa2'
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'producto_precioventa3'
      DisplayFormat = '0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'producto_precioventa4'
      DisplayFormat = '0.00'
    end
    object IntegerField2: TIntegerField
      FieldName = 'calculoprecio_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'politicaprecio_id'
    end
    object IntegerField4: TIntegerField
      FieldName = 'tipoiva_id'
    end
    object IntegerField5: TIntegerField
      FieldName = 'rubro_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'proveedor_id'
    end
    object FloatField7: TFloatField
      FieldName = 'producto_neto1'
    end
    object FloatField8: TFloatField
      FieldName = 'producto_neto2'
    end
    object FloatField9: TFloatField
      FieldName = 'producto_neto3'
    end
    object FloatField10: TFloatField
      FieldName = 'producto_neto4'
    end
    object MQSincambiosproducdepo_stockminimo: TFloatField
      FieldName = 'producdepo_stockminimo'
    end
    object MQSincambiosproducdepo_stockactual: TFloatField
      FieldName = 'producdepo_stockactual'
    end
    object MQSincambiosproducto_codigoreferencia: TStringField
      FieldName = 'producto_codigoreferencia'
      Size = 255
    end
  end
  object DTSSincambios: TDataSource
    AutoEdit = False
    DataSet = MQSincambios
    Left = 832
    Top = 256
  end
  object ZQProductosAactualizar: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from productos'
      'inner join rubros on productos.rubro_id=rubros.rubro_id'
      
        'inner join proveedores on productos.proveedor_id=proveedores.pro' +
        'veedor_id'
      
        'inner join politicasdeprecios on productos.politicaprecio_id=pol' +
        'iticasdeprecios.politicaprecio_id'
      
        'inner join calculoprecios on productos.calculoprecio_id=calculop' +
        'recios.calculoprecio_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id')
    Params = <>
    Left = 952
    Top = 504
  end
  object DTSProductosAactualizar: TDataSource
    AutoEdit = False
    DataSet = ZQProductosAactualizar
    Left = 832
    Top = 312
  end
end
