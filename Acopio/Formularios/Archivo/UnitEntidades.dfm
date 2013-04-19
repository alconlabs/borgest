object Entidades: TEntidades
  Left = 0
  Top = 0
  Caption = 'Entidades'
  ClientHeight = 366
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 660
    Height = 311
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = '    Datos Principales    '
      ImageIndex = 1
      object Label1: TLabel
        Left = 84
        Top = 102
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'Calle'
      end
      object Label11: TLabel
        Left = 226
        Top = 145
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Localidad'
      end
      object Label2: TLabel
        Left = 38
        Top = 249
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observaciones'
      end
      object Label21: TLabel
        Left = 78
        Top = 122
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Puerta'
      end
      object Label22: TLabel
        Left = 88
        Top = 144
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Piso'
      end
      object Label24: TLabel
        Left = 215
        Top = 167
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cod. Postal'
      end
      object Label25: TLabel
        Left = 30
        Top = 200
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Domicilio'
      end
      object Label3: TLabel
        Left = 59
        Top = 14
        Width = 48
        Height = 16
        Alignment = taRightJustify
        Caption = 'Entidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 47
        Top = 43
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Raz'#243'n Social'
      end
      object Label5: TLabel
        Left = 78
        Top = 168
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Depto'
      end
      object Label6: TLabel
        Left = 26
        Top = 65
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nombre Fantas'#237'a'
      end
      object Label9: TLabel
        Left = 227
        Top = 123
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Provincia'
      end
      object entidad_precodi: TDBAdvEdit
        Left = 116
        Top = 6
        Width = 74
        Height = 26
        AutoThousandSeparator = False
        EditType = etNumeric
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = 15365376
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0'
        Visible = True
        Version = '2.7.0.5'
      end
      object entidad_id: TDBAdvEdit
        Left = 190
        Top = 6
        Width = 130
        Height = 26
        AutoThousandSeparator = False
        EditType = etNumeric
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = 15365376
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '0'
        Visible = True
        Version = '2.7.0.5'
      end
      object entidad_nombfantasia: TEdit
        Left = 116
        Top = 62
        Width = 529
        Height = 21
        TabOrder = 3
      end
      object entidad_piso: TEdit
        Left = 116
        Top = 141
        Width = 82
        Height = 21
        TabOrder = 6
      end
      object entidad_depto: TEdit
        Left = 116
        Top = 163
        Width = 82
        Height = 21
        TabOrder = 7
      end
      object localidad_codpostal: TEdit
        Left = 275
        Top = 164
        Width = 77
        Height = 21
        TabOrder = 10
      end
      object entidad_observaciones: TEdit
        Left = 115
        Top = 246
        Width = 529
        Height = 21
        TabOrder = 12
      end
      object Panel1: TPanel
        Left = 116
        Top = 199
        Width = 160
        Height = 43
        TabOrder = 11
        object Label43: TLabel
          Left = 36
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Urbano'
        end
        object Label45: TLabel
          Left = 36
          Top = 23
          Width = 25
          Height = 13
          Caption = 'Rural'
        end
        object entidad_domiurbano: TRadioButton
          Left = 16
          Top = 3
          Width = 15
          Height = 17
          TabOrder = 0
        end
        object entidad_domirural: TRadioButton
          Left = 17
          Top = 22
          Width = 13
          Height = 17
          TabOrder = 1
        end
      end
      object entidad_razonsocial: TEdit
        Left = 116
        Top = 40
        Width = 529
        Height = 21
        TabOrder = 2
      end
      object entidad_calle: TEdit
        Left = 116
        Top = 97
        Width = 529
        Height = 21
        TabOrder = 4
      end
      object entidad_puerta: TDBAdvEdit
        Left = 116
        Top = 119
        Width = 82
        Height = 21
        AutoThousandSeparator = False
        EditType = etNumeric
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Enabled = True
        TabOrder = 5
        Text = '0'
        Visible = True
        Version = '2.7.0.5'
      end
      object provincia_id: TSqlComboBox
        Left = 276
        Top = 119
        Width = 368
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
        OnExit = provincia_idExit
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from provincias'
          'order by provincia_nombre')
        Confcampo_codigo = 'provincia_id'
        Confcampo_nomb = 'provincia_nombre'
        Tag2 = 0
      end
      object localidad_id: TSqlComboBox
        Left = 276
        Top = 141
        Width = 368
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 9
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from localidades'
          'order by localidad_nombre')
        Confcampo_codigo = 'localidad_id'
        Confcampo_nomb = 'localidad_nombre'
        Tag2 = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = '   Inscripciones    '
      ImageIndex = 1
      object Label17: TLabel
        Left = 295
        Top = 308
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Precio Compra'
      end
      object Label12: TLabel
        Left = 283
        Top = 332
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Calculo de Precio'
      end
      object Label13: TLabel
        Left = 278
        Top = 356
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Precio Venta Base'
      end
      object Label14: TLabel
        Left = 284
        Top = 380
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Politica de Precio'
      end
      object Label15: TLabel
        Left = 370
        Top = 400
        Width = 32
        Height = 13
        Caption = 'Neto 1'
      end
      object Label16: TLabel
        Left = 506
        Top = 400
        Width = 32
        Height = 13
        Caption = 'Neto 2'
      end
      object Label18: TLabel
        Left = 642
        Top = 400
        Width = 32
        Height = 13
        Caption = 'Neto 3'
      end
      object Label19: TLabel
        Left = 546
        Top = 327
        Width = 32
        Height = 13
        Caption = 'Neto 4'
      end
      object Label23: TLabel
        Left = 239
        Top = 19
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nro Documento'
      end
      object Label28: TLabel
        Left = 276
        Top = 42
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo IVA'
      end
      object Label29: TLabel
        Left = 20
        Top = 44
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'Inicio de Actividad'
      end
      object Label31: TLabel
        Left = 475
        Top = 20
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'IIBB'
      end
      object Label32: TLabel
        Left = 63
        Top = 170
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'MINAGRI'
      end
      object Label33: TLabel
        Left = 8
        Top = 193
        Width = 99
        Height = 13
        Alignment = taRightJustify
        Caption = 'Direcci'#243'n Transporte'
      end
      object Label34: TLabel
        Left = 14
        Top = 241
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = 'Registro Acopiador '
      end
      object Label35: TLabel
        Left = 22
        Top = 217
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Registro Balanzas'
      end
      object Label38: TLabel
        Left = 53
        Top = 255
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Exportador'
      end
      object Label7: TLabel
        Left = 30
        Top = 18
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Documento'
      end
      object rubro_id: TSqlComboBox
        Left = 409
        Top = 428
        Width = 206
        Height = 21
        ItemHeight = 13
        TabOrder = 13
        Confbase = Princ.ZBase
        Confsql.Strings = (
          'select * from rubros'
          'order by rubro_nombre')
        ConfTabla = 'rubros'
        Confcampo_codigo = 'rubro_id'
        Confcampo_nomb = 'rubro_nombre'
        Tag2 = 0
        ConfNuevo = True
      end
      object entidad_tipoiva: TComboBox
        Left = 322
        Top = 39
        Width = 132
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        Text = 'INSCRIPTO'
        Items.Strings = (
          'INSCRIPTO'
          'EXENTO')
      end
      object entidad_inicioactividad: TDateTimePicker
        Left = 114
        Top = 39
        Width = 97
        Height = 21
        Date = 40384.000000000000000000
        Time = 40384.000000000000000000
        TabOrder = 3
      end
      object entidad_regiacopiador: TEdit
        Left = 114
        Top = 236
        Width = 102
        Height = 21
        TabOrder = 12
      end
      object entidad_regibalanza: TEdit
        Left = 114
        Top = 213
        Width = 102
        Height = 21
        TabOrder = 11
      end
      object entidad_iibb: TEdit
        Left = 501
        Top = 16
        Width = 132
        Height = 21
        TabOrder = 2
      end
      object entidad_minagri: TEdit
        Left = 114
        Top = 167
        Width = 102
        Height = 21
        TabOrder = 9
      end
      object entidad_diretransporte: TEdit
        Left = 114
        Top = 190
        Width = 102
        Height = 21
        TabOrder = 10
      end
      object retieneIIBB: TGroupBox
        Left = 114
        Top = 72
        Width = 97
        Height = 77
        Caption = 'Retiene IIBB'
        TabOrder = 5
        object Label46: TLabel
          Left = 32
          Top = 21
          Width = 10
          Height = 13
          Caption = 'SI'
        end
        object Label47: TLabel
          Left = 31
          Top = 40
          Width = 15
          Height = 13
          Caption = 'NO'
        end
        object entidad_retieneiibbsi: TRadioButton
          Left = 11
          Top = 20
          Width = 12
          Height = 15
          TabOrder = 0
        end
        object entidad_retieneiibbno: TRadioButton
          Left = 11
          Top = 39
          Width = 12
          Height = 15
          TabOrder = 1
        end
      end
      object retencionAFIP: TGroupBox
        Left = 217
        Top = 71
        Width = 133
        Height = 77
        Caption = 'Ag. Retenci'#243'n AFIP'
        TabOrder = 6
        object Label48: TLabel
          Left = 63
          Top = 40
          Width = 15
          Height = 13
          Caption = 'NO'
        end
        object Label49: TLabel
          Left = 64
          Top = 21
          Width = 10
          Height = 13
          Caption = 'SI'
        end
        object entidad_agretencionsi: TRadioButton
          Left = 43
          Top = 20
          Width = 12
          Height = 15
          TabOrder = 0
        end
        object entidad_agretencionno: TRadioButton
          Left = 43
          Top = 39
          Width = 12
          Height = 15
          TabOrder = 1
        end
      end
      object multilateral: TGroupBox
        Left = 357
        Top = 72
        Width = 135
        Height = 77
        Caption = 'Conv. Multilateral'
        TabOrder = 7
        object Label50: TLabel
          Left = 63
          Top = 40
          Width = 15
          Height = 13
          Caption = 'NO'
        end
        object Label51: TLabel
          Left = 64
          Top = 21
          Width = 10
          Height = 13
          Caption = 'SI'
        end
        object entidad_convmultisi: TRadioButton
          Left = 43
          Top = 20
          Width = 12
          Height = 15
          TabOrder = 0
        end
        object entidad_convmultino: TRadioButton
          Left = 43
          Top = 39
          Width = 12
          Height = 15
          TabOrder = 1
        end
      end
      object exportador: TGroupBox
        Left = 501
        Top = 72
        Width = 131
        Height = 77
        Caption = 'Exportador'
        TabOrder = 8
        object Label52: TLabel
          Left = 63
          Top = 40
          Width = 15
          Height = 13
          Caption = 'NO'
        end
        object Label53: TLabel
          Left = 64
          Top = 21
          Width = 10
          Height = 13
          Caption = 'SI'
        end
        object entidad_exportadorsi: TRadioButton
          Left = 43
          Top = 20
          Width = 12
          Height = 15
          TabOrder = 0
        end
        object entidad_exportadorno: TRadioButton
          Left = 43
          Top = 39
          Width = 12
          Height = 15
          TabOrder = 1
        end
      end
      object regproductores: TGroupBox
        Left = 498
        Top = 167
        Width = 134
        Height = 90
        Caption = 'Insc. Reg. Productores'
        TabOrder = 15
        object Label54: TLabel
          Left = 55
          Top = 48
          Width = 15
          Height = 13
          Caption = 'NO'
        end
        object Label56: TLabel
          Left = 56
          Top = 29
          Width = 10
          Height = 13
          Caption = 'SI'
        end
        object entidad_inscregproductosi: TRadioButton
          Left = 35
          Top = 28
          Width = 12
          Height = 15
          TabOrder = 0
        end
        object entidad_inscregproductono: TRadioButton
          Left = 35
          Top = 47
          Width = 12
          Height = 15
          TabOrder = 1
        end
      end
      object carnet: TGroupBox
        Left = 221
        Top = 167
        Width = 271
        Height = 90
        Caption = 'Datos de Carnet de Manejo'
        TabOrder = 14
        object Label36: TLabel
          Left = 5
          Top = 26
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro.'
        end
        object Label37: TLabel
          Left = 141
          Top = 22
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vence'
        end
        object Label39: TLabel
          Left = 4
          Top = 46
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Expedido por'
        end
        object entidad_nrocarnetmanejo: TEdit
          Left = 30
          Top = 20
          Width = 104
          Height = 21
          TabOrder = 0
        end
        object entidad_vencecarnet: TDateTimePicker
          Left = 174
          Top = 18
          Width = 83
          Height = 21
          Date = 40384.000000000000000000
          Time = 40384.000000000000000000
          TabOrder = 1
        end
        object entidad_expedidocarnet: TEdit
          Left = 7
          Top = 60
          Width = 260
          Height = 21
          TabOrder = 2
        end
      end
      object entidad_nrodocumento: TEdit
        Left = 322
        Top = 16
        Width = 132
        Height = 21
        TabOrder = 1
      end
      object entidad_tipodocumento: TComboBox
        Left = 114
        Top = 15
        Width = 97
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'DNI'
        Items.Strings = (
          'DNI'
          'CI'
          'LE'
          'CUIT'
          'CUIL')
      end
    end
    object TabSheet3: TTabSheet
      Caption = '   Datos Comerciales   '
      ImageIndex = 2
      object Label42: TLabel
        Left = 4
        Top = 13
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Contactos'
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 30
        Width = 643
        Height = 223
        TabStop = False
        DataSource = DSCgrilla
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'entcontacto_nombre'
            Title.Caption = 'Nombre y Apellido'
            Width = 157
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'entcontacto_puesto'
            Title.Caption = 'Puesto'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'entcontacto_celular'
            Title.Caption = 'Nro de Celular'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'entcontacto_email'
            Title.Caption = 'Email'
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'entcontacto_observaciones'
            Title.Caption = 'Observaciones'
            Width = 177
            Visible = True
          end>
      end
      object btnagregar: TButton
        Left = 1
        Top = 254
        Width = 70
        Height = 24
        Caption = 'Agregar'
        Enabled = False
        TabOrder = 1
        OnClick = btnagregarClick
      end
      object btnmodificar: TButton
        Left = 70
        Top = 254
        Width = 70
        Height = 24
        Caption = 'Modificar'
        Enabled = False
        TabOrder = 2
      end
      object btnquitar: TButton
        Left = 139
        Top = 254
        Width = 70
        Height = 24
        Caption = 'Quitar'
        Enabled = False
        TabOrder = 3
        OnClick = btnquitarClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Datos Bancarios'
      ImageIndex = 3
      object DBGrid2: TDBGrid
        Left = 3
        Top = 16
        Width = 669
        Height = 230
        TabStop = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Caption = 'Nombre Banco'
            Width = 187
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Sucursal'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Nro Cuenta'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Nro CBU'
            Width = 134
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 1
        Top = 254
        Width = 70
        Height = 24
        Caption = 'Agregar'
        Enabled = False
        TabOrder = 1
        OnClick = btnagregarClick
      end
      object Button2: TButton
        Left = 70
        Top = 254
        Width = 70
        Height = 24
        Caption = 'Modificar'
        Enabled = False
        TabOrder = 2
      end
      object Button3: TButton
        Left = 139
        Top = 254
        Width = 70
        Height = 24
        Caption = 'Quitar'
        Enabled = False
        TabOrder = 3
        OnClick = btnquitarClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = '   Roles   '
      ImageIndex = 4
      object DBGrid3: TDBGrid
        Left = 3
        Top = 14
        Width = 668
        Height = 246
        TabStop = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Caption = 'Roles'
            Width = 187
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Ganancia'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Descripci'#243'n'
            Width = 124
            Visible = True
          end>
      end
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 348
    Width = 660
    Height = 18
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
    StatusBar.BorderColor = clNone
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label27: TLabel
      Left = 6
      Top = 3
      Width = 92
      Height = 11
      Alignment = taRightJustify
      Caption = 'F9 - Guardar Todo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object btnguardar: TButton
    Left = 229
    Top = 315
    Width = 99
    Height = 27
    Caption = 'Guardar'
    TabOrder = 2
    OnClick = btnguardarClick
  end
  object btncancelar: TButton
    Left = 328
    Top = 315
    Width = 99
    Height = 27
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btncancelarClick
  end
  object ZQentidad: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQentidadAfterOpen
    SQL.Strings = (
      'select * from entidades'
      'where entidad_id=:entidad_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'entidad_id'
        ParamType = ptUnknown
      end>
    Left = 328
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'entidad_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from clientes'
      'where cliente_id=:cliente_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        ParamType = ptUnknown
      end>
  end
  object ZQEntidadContactos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from entidadcontactos'
      'where 1=2')
    Params = <>
    Left = 400
    Top = 216
  end
  object DSCgrilla: TDataSource
    DataSet = EntidadContactos.ZQEntidadContactos
    Left = 520
    Top = 192
  end
end
