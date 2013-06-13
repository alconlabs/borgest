inherited OrdendeCarga: TOrdendeCarga
  Caption = 'OrdendeCarga'
  ClientHeight = 521
  ClientWidth = 721
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 737
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 721
    Height = 521
    ExplicitWidth = 721
    ExplicitHeight = 521
    FullHeight = 0
    object Label2: TLabel [0]
      Left = 565
      Top = 39
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label15: TLabel [1]
      Left = 49
      Top = 90
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Labelsucursal: TLabel [2]
      Left = 45
      Top = 13
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sucursal'
    end
    object Label3: TLabel [3]
      Left = 50
      Top = 117
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Entidad'
    end
    object Label1: TLabel [4]
      Left = 44
      Top = 144
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio'
    end
    object cliente_domicilio: TLabel [5]
      Left = 92
      Top = 144
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label11: TLabel [6]
      Left = 37
      Top = 168
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT/DNI'
    end
    object cliente_documentonro: TLabel [7]
      Left = 92
      Top = 168
      Width = 49
      Height = 13
      Caption = 'CUIT/DNI'
    end
    object Label5: TLabel [8]
      Left = 7
      Top = 63
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Documento'
    end
    object Label16: TLabel [9]
      Left = 424
      Top = 543
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Vencimiento'
      Visible = False
    end
    object Label18: TLabel [10]
      Left = 15
      Top = 443
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label7: TLabel [11]
      Left = 430
      Top = 567
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha de Entrega'
      Visible = False
    end
    object Label8: TLabel [12]
      Left = 401
      Top = 632
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Precio'
    end
    object Label9: TLabel [13]
      Left = 152
      Top = 608
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda'
    end
    object Label10: TLabel [14]
      Left = 84
      Top = 661
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lugar de Entrega'
    end
    object Label13: TLabel [15]
      Left = 352
      Top = 600
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de Operacion'
      Visible = False
    end
    object Label14: TLabel [16]
      Left = 92
      Top = 632
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condicion de calidad'
    end
    object Label17: TLabel [17]
      Left = 12
      Top = 39
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Punto de Venta'
    end
    inherited btncancelar: TButton
      Left = 628
      Top = 486
      TabOrder = 9
      ExplicitLeft = 628
      ExplicitTop = 486
    end
    inherited btnguardar: TButton
      Left = 547
      Top = 486
      TabOrder = 8
      OnClick = btnguardarClick
      ExplicitLeft = 547
      ExplicitTop = 486
    end
    object documento_numero: TEdit
      Left = 92
      Top = 87
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object documento_fecha: TDateTimePicker
      Left = 601
      Top = 36
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 5
    end
    object puntoventa_id: TSqlComboBox
      Left = 92
      Top = 36
      Width = 54
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnSelect = puntoventa_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from puntodeventa')
      Confcampo_codigo = 'puntoventa_id'
      Confcampo_nomb = 'puntoventa_numero'
      Tag2 = 0
    end
    object tipodocu_id: TSqlComboBox
      Left = 92
      Top = 60
      Width = 181
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnSelect = tipodocu_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from tiposdocumento'
        'where tipodocu_nombre="Factura de Venta"')
      Confcampo_codigo = 'tipodocu_id'
      Confcampo_nomb = 'tipodocu_nombre'
      Tag2 = 0
    end
    object sucursal_id: TSqlComboBox
      Left = 92
      Top = 10
      Width = 316
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnSelect = sucursal_idSelect
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from sucursales'
        'order by sucursal_nombre')
      Confcampo_codigo = 'sucursal_id'
      Confcampo_nomb = 'sucursal_nombre'
      Tag2 = 0
    end
    object entidad_id: TSqlComboBox
      Left = 92
      Top = 114
      Width = 316
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from entidades'
        'order by entidad_razonsocial')
      Confcampo_codigo = 'entidad_id'
      Confcampo_nomb = 'entidad_razonsocial'
      Tag2 = 0
    end
    object documento_fechavenc: TDateTimePicker
      Left = 521
      Top = 540
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 10
      Visible = False
    end
    object documento_observaciones: TGTBMemo
      Left = 92
      Top = 440
      Width = 615
      Height = 41
      TabOrder = 7
      Tag2 = 0
    end
    object documento_fechacumplimiento: TDateTimePicker
      Left = 521
      Top = 564
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 11
      Visible = False
    end
    object documento_preciounitario: TMoneyEdit
      Left = 444
      Top = 629
      Width = 122
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
      TabOrder = 13
      Version = '1.1.0.1'
    end
    object documento_moneda: TGTBComboBox
      Left = 204
      Top = 605
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 15
      Items.Strings = (
        'Pesos'
        'Dolares'
        'Otro')
      Tag2 = 0
      valores.Strings = (
        'Pesos'
        'Dolares'
        'Otro')
    end
    object documento_lugarentrega: TGTBEdit
      Left = 172
      Top = 658
      Width = 316
      Height = 21
      TabOrder = 16
      Text = 'documento_lugarentrega'
      Tag2 = 0
    end
    object documento_tipooperacion: TGTBComboBox
      Left = 446
      Top = 597
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 12
      Visible = False
      Items.Strings = (
        'Primaria'
        'Secundaria')
      Tag2 = 0
      valores.Strings = (
        'Primaria'
        'Secundaria')
    end
    object documento_condicioncalidad: TGTBComboBox
      Left = 204
      Top = 629
      Width = 181
      Height = 21
      ItemHeight = 13
      TabOrder = 14
      Items.Strings = (
        'Condicional'
        'Conforme')
      Tag2 = 0
      valores.Strings = (
        'Condicional'
        'Conforme')
    end
    object PageControl1: TPageControl
      Left = 7
      Top = 187
      Width = 700
      Height = 247
      ActivePage = TabSheet1
      TabOrder = 6
      object TabSheet1: TTabSheet
        Caption = 'Carta de Porte / Remito'
        object Label6: TLabel
          Left = 110
          Top = 88
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Neto'
        end
        object Label12: TLabel
          Left = 387
          Top = 16
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Calidad'
        end
        object Label4: TLabel
          Left = 337
          Top = 40
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Especie/Variedad'
        end
        object Label19: TLabel
          Left = 6
          Top = 16
          Width = 135
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Carta de Porte / Remito'
        end
        object Label20: TLabel
          Left = 84
          Top = 40
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Kg. Brutos'
        end
        object Label21: TLabel
          Left = 111
          Top = 64
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tara'
        end
        object Label30: TLabel
          Left = 365
          Top = 64
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tarifa flete'
        end
        object documento_total: TMoneyEdit
          Left = 146
          Top = 85
          Width = 122
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
          TabOrder = 3
          Version = '1.1.0.1'
        end
        object documento_calidad: TSqlComboBox
          Left = 428
          Top = 13
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from calidades'
            'order by calidad_nombre')
          ConfTabla = 'calidades'
          Confcampo_codigo = 'calidad_id'
          Confcampo_nomb = 'calidad_nombre'
          Tag2 = 0
          ConfNuevo = True
        end
        object especie_id: TSqlComboBox
          Left = 428
          Top = 37
          Width = 195
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 5
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from especies'
            'order by especie_nombre')
          Confcampo_codigo = 'especie_id'
          Confcampo_nomb = 'especie_nombre'
          Tag2 = 0
        end
        object documento_numerocartaporte: TEdit
          Left = 147
          Top = 13
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object documento_kgbrutos: TMoneyEdit
          Left = 146
          Top = 37
          Width = 122
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
          TabOrder = 1
          Version = '1.1.0.1'
          OnExit = documento_kgbrutosExit
        end
        object documento_tara: TMoneyEdit
          Left = 146
          Top = 61
          Width = 122
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
          TabOrder = 2
          Version = '1.1.0.1'
          OnExit = documento_kgbrutosExit
        end
        object documento_cartaportetarifaflete: TMoneyEdit
          Left = 428
          Top = 61
          Width = 122
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
          TabOrder = 6
          Version = '1.1.0.1'
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Transportista'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label22: TLabel
          Left = 15
          Top = 48
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Transportista'
        end
        object Label25: TLabel
          Left = 47
          Top = 74
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Chofer'
        end
        object Label26: TLabel
          Left = 1
          Top = 24
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dador de Carga'
        end
        object Label27: TLabel
          Left = 47
          Top = 122
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Chasis'
        end
        object Label28: TLabel
          Left = 33
          Top = 146
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Acoplado'
        end
        object Label29: TLabel
          Left = 503
          Top = 122
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Anticipo'
        end
        object Label31: TLabel
          Left = 493
          Top = 56
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tarifa flete'
        end
        object Label32: TLabel
          Left = 53
          Top = 98
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'CUIT'
        end
        object entidadtransportista_id: TSqlComboBox
          Left = 82
          Top = 45
          Width = 316
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from entidades'
            'order by entidad_razonsocial')
          Confcampo_codigo = 'entidad_id'
          Confcampo_nomb = 'entidad_razonsocial'
          Tag2 = 0
        end
        object documento_chofer: TEdit
          Left = 84
          Top = 71
          Width = 313
          Height = 21
          TabOrder = 2
        end
        object entidaddadorcarga_id: TSqlComboBox
          Left = 82
          Top = 21
          Width = 316
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from entidades'
            'order by entidad_razonsocial')
          Confcampo_codigo = 'entidad_id'
          Confcampo_nomb = 'entidad_razonsocial'
          Tag2 = 0
        end
        object documento_transpchasis: TEdit
          Left = 84
          Top = 119
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object documento_transpacoplado: TEdit
          Left = 84
          Top = 143
          Width = 121
          Height = 21
          TabOrder = 5
        end
        object documento_transpanticipo: TMoneyEdit
          Left = 554
          Top = 119
          Width = 122
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
        end
        object documento_transptarifaflete: TMoneyEdit
          Left = 556
          Top = 53
          Width = 122
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
          TabOrder = 6
          Version = '1.1.0.1'
        end
        object documento_chofercuit: TEdit
          Left = 84
          Top = 95
          Width = 121
          Height = 21
          TabOrder = 3
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Origen'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label23: TLabel
          Left = 2
          Top = 0
          Width = 99
          Height = 13
          Alignment = taRightJustify
          Caption = 'Contratos de Compra'
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 19
          Width = 687
          Height = 105
          DataSource = DTSContratosCompras
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
              Title.Caption = 'Kgs. Contratados'
              Width = 97
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'documentodocu_importe'
              Title.Caption = 'Entrega actual'
              Width = 90
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'documentodocu_saldo'
              Title.Caption = 'Saldo'
              Width = 90
              Visible = True
            end>
        end
        object BtnAsignarContratosCompras: TButton
          Left = 2
          Top = 130
          Width = 127
          Height = 25
          Caption = 'Asignar Contratos'
          TabOrder = 0
          OnClick = BtnAsignarContratosComprasClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Destino'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label24: TLabel
          Left = 2
          Top = 0
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Contratos de Venta'
        end
        object DBGrid2: TDBGrid
          Left = 2
          Top = 19
          Width = 687
          Height = 105
          DataSource = DTSContratosVentas
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
              Width = 105
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'documentodocu_importe'
              Title.Caption = 'Entrega actual'
              Width = 90
              Visible = True
            end
            item
              ButtonStyle = cbsNone
              Expanded = False
              FieldName = 'documentodocu_saldo'
              Title.Caption = 'Saldo'
              Width = 90
              Visible = True
            end>
        end
        object BtnAsignarContratosVentas: TButton
          Left = 2
          Top = 130
          Width = 127
          Height = 25
          Caption = 'Asignar Contratos'
          TabOrder = 0
          OnClick = BtnAsignarContratosVentasClick
        end
      end
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from documentos'
      
        'inner join tiposdocumento on documentos.tipodocu_id=tiposdocumen' +
        'to.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documento_id=:documento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
  end
  object ZQContratosCompras: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select contratos.*, tiposdocumento.*, puntodeventa.*, documentos' +
        'docu.*'
      'from documentos contratos'
      
        'inner join tiposdocumento on contratos.tipodocu_id=tiposdocument' +
        'o.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join documentosdocu on contratos.documento_id=documentosdo' +
        'cu.documento_idpago'
      
        'inner join documentos ordencarga on documentosdocu.documento_id=' +
        'ordencarga.documento_id'
      'where tipodocu_nombre="Contrato de Compra"'
      'and ordencarga.documento_id=:documento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 184
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    object ZQContratosComprasdocumento_id: TIntegerField
      FieldName = 'documento_id'
      Required = True
    end
    object ZQContratosComprasdocumento_fecha: TDateField
      FieldName = 'documento_fecha'
    end
    object ZQContratosComprasdocumento_fechavenc: TDateField
      FieldName = 'documento_fechavenc'
    end
    object ZQContratosComprasdocumento_hora: TTimeField
      FieldName = 'documento_hora'
    end
    object ZQContratosComprasdocumento_numero: TIntegerField
      FieldName = 'documento_numero'
    end
    object ZQContratosComprasdocumento_total: TFloatField
      FieldName = 'documento_total'
    end
    object ZQContratosComprasdocumento_saldo: TFloatField
      FieldName = 'documento_saldo'
    end
    object ZQContratosComprasdocumento_pagado: TFloatField
      FieldName = 'documento_pagado'
    end
    object ZQContratosComprasdocumento_estado: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object ZQContratosComprasdocumento_neto21: TFloatField
      FieldName = 'documento_neto21'
    end
    object ZQContratosComprasdocumento_iva21: TFloatField
      FieldName = 'documento_iva21'
    end
    object ZQContratosComprasdocumento_neto105: TFloatField
      FieldName = 'documento_neto105'
    end
    object ZQContratosComprasdocumento_iva105: TFloatField
      FieldName = 'documento_iva105'
    end
    object ZQContratosComprasdocumento_neto27: TFloatField
      FieldName = 'documento_neto27'
    end
    object ZQContratosComprasdocumento_iva27: TFloatField
      FieldName = 'documento_iva27'
    end
    object ZQContratosComprasdocumento_observaciones: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object ZQContratosComprasdocumento_ivaret: TFloatField
      FieldName = 'documento_ivaret'
    end
    object ZQContratosComprasdocumento_ivaperc: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object ZQContratosComprasdocumento_dgrret: TFloatField
      FieldName = 'documento_dgrret'
    end
    object ZQContratosComprasdocumento_dgrperc: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object ZQContratosComprasdocumento_otrosimpuestos: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object ZQContratosComprasdocumento_calidad: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object ZQContratosComprasdocumento_documentacion: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object ZQContratosComprastipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQContratosComprasentidad_id: TIntegerField
      FieldName = 'entidad_id'
      Required = True
    end
    object ZQContratosComprasentidadtransportista_id: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object ZQContratosComprasespecie_id: TIntegerField
      FieldName = 'especie_id'
      Required = True
    end
    object ZQContratosComprasdocumento_fechacumplimiento: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object ZQContratosComprasdocumento_moneda: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object ZQContratosComprasdocumento_preciounitario: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object ZQContratosComprasdocumento_lugarentrega: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object ZQContratosComprasdocumento_tipooperacion: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object ZQContratosComprasdocumento_condicioncalidad: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object ZQContratosComprasdocumento_tipodestino: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object ZQContratosComprasdocumento_numerocartaporte: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object ZQContratosComprasdocumento_kgbrutos: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object ZQContratosComprasdocumento_tara: TFloatField
      FieldName = 'documento_tara'
    end
    object ZQContratosComprastipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object ZQContratosComprastipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQContratosComprastipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQContratosComprastipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQContratosComprastipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQContratosComprastipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQContratosComprastipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQContratosComprastipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQContratosComprastipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQContratosComprastipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQContratosComprastipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQContratosComprastipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQContratosComprastipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQContratosComprastipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQContratosComprastipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQContratosComprastipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQContratosComprastipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQContratosComprastipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQContratosComprastipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQContratosComprastipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQContratosCompraspuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQContratosComprastipodocu_tipoctacte: TStringField
      FieldName = 'tipodocu_tipoctacte'
      Size = 45
    end
    object ZQContratosCompraspuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
      Required = True
    end
    object ZQContratosCompraspuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQContratosCompraspuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQContratosCompraspuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQContratosCompraspuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQContratosComprassucursal_id: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object ZQContratosComprasdocumentodocu_id: TIntegerField
      FieldName = 'documentodocu_id'
      Required = True
    end
    object ZQContratosComprasdocumentodocu_importe: TFloatField
      FieldName = 'documentodocu_importe'
    end
    object ZQContratosComprasdocumentodocu_estado: TStringField
      FieldName = 'documentodocu_estado'
      Size = 45
    end
    object ZQContratosComprasdocumentodocu_pagado: TFloatField
      FieldName = 'documentodocu_pagado'
    end
    object ZQContratosComprasdocumentodocu_saldo: TFloatField
      FieldName = 'documentodocu_saldo'
    end
    object ZQContratosComprasdocumento_id_1: TIntegerField
      FieldName = 'documento_id_1'
      Required = True
    end
    object ZQContratosComprasdocumento_idpago: TIntegerField
      FieldName = 'documento_idpago'
    end
  end
  object DTSContratosCompras: TDataSource
    DataSet = ZQContratosCompras
    Left = 56
    Top = 416
  end
  object DTSContratosVentas: TDataSource
    DataSet = ZQContratosVentas
    Left = 600
    Top = 400
  end
  object ZQContratosVentas: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select contratos.*, tiposdocumento.*, puntodeventa.*, documentos' +
        'docu.*'
      'from documentos contratos'
      
        'inner join tiposdocumento on contratos.tipodocu_id=tiposdocument' +
        'o.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join documentosdocu on contratos.documento_id=documentosdo' +
        'cu.documento_idpago'
      
        'inner join documentos ordencarga on documentosdocu.documento_id=' +
        'ordencarga.documento_id'
      'where tipodocu_nombre="Contrato de Venta"'
      'and ordencarga.documento_id=:documento_id'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    object ZQContratosVentasdocumento_id: TIntegerField
      FieldName = 'documento_id'
      Required = True
    end
    object ZQContratosVentasdocumento_fecha: TDateField
      FieldName = 'documento_fecha'
    end
    object ZQContratosVentasdocumento_fechavenc: TDateField
      FieldName = 'documento_fechavenc'
    end
    object ZQContratosVentasdocumento_hora: TTimeField
      FieldName = 'documento_hora'
    end
    object ZQContratosVentasdocumento_numero: TIntegerField
      FieldName = 'documento_numero'
    end
    object ZQContratosVentasdocumento_total: TFloatField
      FieldName = 'documento_total'
    end
    object ZQContratosVentasdocumento_saldo: TFloatField
      FieldName = 'documento_saldo'
    end
    object ZQContratosVentasdocumento_pagado: TFloatField
      FieldName = 'documento_pagado'
    end
    object ZQContratosVentasdocumento_estado: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object ZQContratosVentasdocumento_neto21: TFloatField
      FieldName = 'documento_neto21'
    end
    object ZQContratosVentasdocumento_iva21: TFloatField
      FieldName = 'documento_iva21'
    end
    object ZQContratosVentasdocumento_neto105: TFloatField
      FieldName = 'documento_neto105'
    end
    object ZQContratosVentasdocumento_iva105: TFloatField
      FieldName = 'documento_iva105'
    end
    object ZQContratosVentasdocumento_neto27: TFloatField
      FieldName = 'documento_neto27'
    end
    object ZQContratosVentasdocumento_iva27: TFloatField
      FieldName = 'documento_iva27'
    end
    object ZQContratosVentasdocumento_observaciones: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object ZQContratosVentasdocumento_ivaret: TFloatField
      FieldName = 'documento_ivaret'
    end
    object ZQContratosVentasdocumento_ivaperc: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object ZQContratosVentasdocumento_dgrret: TFloatField
      FieldName = 'documento_dgrret'
    end
    object ZQContratosVentasdocumento_dgrperc: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object ZQContratosVentasdocumento_otrosimpuestos: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object ZQContratosVentasdocumento_calidad: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object ZQContratosVentasdocumento_documentacion: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object ZQContratosVentastipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object ZQContratosVentasentidad_id: TIntegerField
      FieldName = 'entidad_id'
      Required = True
    end
    object ZQContratosVentasentidadtransportista_id: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object ZQContratosVentasespecie_id: TIntegerField
      FieldName = 'especie_id'
      Required = True
    end
    object ZQContratosVentasdocumento_fechacumplimiento: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object ZQContratosVentasdocumento_moneda: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object ZQContratosVentasdocumento_preciounitario: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object ZQContratosVentasdocumento_lugarentrega: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object ZQContratosVentasdocumento_tipooperacion: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object ZQContratosVentasdocumento_condicioncalidad: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object ZQContratosVentasdocumento_tipodestino: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object ZQContratosVentasdocumento_numerocartaporte: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object ZQContratosVentasdocumento_kgbrutos: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object ZQContratosVentasdocumento_tara: TFloatField
      FieldName = 'documento_tara'
    end
    object ZQContratosVentastipodocu_id_1: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object ZQContratosVentastipodocu_nombre: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object ZQContratosVentastipodocu_tipo: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object ZQContratosVentastipodocu_caja: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object ZQContratosVentastipodocu_stock: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object ZQContratosVentastipodocu_iva: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object ZQContratosVentastipodocu_fiscal: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object ZQContratosVentastipodocu_ultimonumero: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object ZQContratosVentastipodocu_letra: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object ZQContratosVentastipodocu_debcred: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object ZQContratosVentastipodocu_preimpresos: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object ZQContratosVentastipodocu_impresora: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object ZQContratosVentastipodocu_copias: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object ZQContratosVentastipodocu_preview: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object ZQContratosVentastipodocu_prompt: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object ZQContratosVentastipodocu_ctacte: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object ZQContratosVentastipodocu_archivoimpresion: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object ZQContratosVentastipodocu_leyenda: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object ZQContratosVentastipodocu_nombreabrev: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object ZQContratosVentastipodocu_manual: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object ZQContratosVentaspuntoventa_id: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object ZQContratosVentastipodocu_tipoctacte: TStringField
      FieldName = 'tipodocu_tipoctacte'
      Size = 45
    end
    object ZQContratosVentaspuntoventa_id_1: TIntegerField
      FieldName = 'puntoventa_id_1'
      Required = True
    end
    object ZQContratosVentaspuntoventa_numero: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object ZQContratosVentaspuntoventa_descripcion: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object ZQContratosVentaspuntoventa_controladorfiscalmodelo: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object ZQContratosVentaspuntoventa_controladorfiscalpuerto: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object ZQContratosVentassucursal_id: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object ZQContratosVentasdocumentodocu_id: TIntegerField
      FieldName = 'documentodocu_id'
      Required = True
    end
    object ZQContratosVentasdocumentodocu_importe: TFloatField
      FieldName = 'documentodocu_importe'
    end
    object ZQContratosVentasdocumentodocu_estado: TStringField
      FieldName = 'documentodocu_estado'
      Size = 45
    end
    object ZQContratosVentasdocumentodocu_pagado: TFloatField
      FieldName = 'documentodocu_pagado'
    end
    object ZQContratosVentasdocumentodocu_saldo: TFloatField
      FieldName = 'documentodocu_saldo'
    end
    object ZQContratosVentasdocumento_id_1: TIntegerField
      FieldName = 'documento_id_1'
      Required = True
    end
    object ZQContratosVentasdocumento_idpago: TIntegerField
      FieldName = 'documento_idpago'
    end
  end
  object ZQContratosAnterior: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      
        'select contratos.*, tiposdocumento.*, puntodeventa.*, documentos' +
        'docu.*'
      'from documentos contratos'
      
        'inner join tiposdocumento on contratos.tipodocu_id=tiposdocument' +
        'o.tipodocu_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      
        'inner join documentosdocu on contratos.documento_id=documentosdo' +
        'cu.documento_idpago'
      
        'inner join documentos ordencarga on documentosdocu.documento_id=' +
        'ordencarga.documento_id'
      'where ordencarga.documento_id=:documento_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    Left = 296
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documento_id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'documento_id'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'documento_fecha'
    end
    object DateField2: TDateField
      FieldName = 'documento_fechavenc'
    end
    object TimeField1: TTimeField
      FieldName = 'documento_hora'
    end
    object IntegerField2: TIntegerField
      FieldName = 'documento_numero'
    end
    object FloatField1: TFloatField
      FieldName = 'documento_total'
    end
    object FloatField2: TFloatField
      FieldName = 'documento_saldo'
    end
    object FloatField3: TFloatField
      FieldName = 'documento_pagado'
    end
    object StringField1: TStringField
      FieldName = 'documento_estado'
      Size = 15
    end
    object FloatField4: TFloatField
      FieldName = 'documento_neto21'
    end
    object FloatField5: TFloatField
      FieldName = 'documento_iva21'
    end
    object FloatField6: TFloatField
      FieldName = 'documento_neto105'
    end
    object FloatField7: TFloatField
      FieldName = 'documento_iva105'
    end
    object FloatField8: TFloatField
      FieldName = 'documento_neto27'
    end
    object FloatField9: TFloatField
      FieldName = 'documento_iva27'
    end
    object StringField2: TStringField
      FieldName = 'documento_observaciones'
      Size = 255
    end
    object FloatField10: TFloatField
      FieldName = 'documento_ivaret'
    end
    object FloatField11: TFloatField
      FieldName = 'documento_ivaperc'
    end
    object FloatField12: TFloatField
      FieldName = 'documento_dgrret'
    end
    object FloatField13: TFloatField
      FieldName = 'documento_dgrperc'
    end
    object FloatField14: TFloatField
      FieldName = 'documento_otrosimpuestos'
    end
    object StringField3: TStringField
      FieldName = 'documento_calidad'
      Size = 45
    end
    object StringField4: TStringField
      FieldName = 'documento_documentacion'
      Size = 45
    end
    object IntegerField3: TIntegerField
      FieldName = 'tipodocu_id'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'entidad_id'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'entidadtransportista_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'especie_id'
      Required = True
    end
    object DateField3: TDateField
      FieldName = 'documento_fechacumplimiento'
    end
    object StringField5: TStringField
      FieldName = 'documento_moneda'
      Size = 45
    end
    object FloatField15: TFloatField
      FieldName = 'documento_preciounitario'
    end
    object StringField6: TStringField
      FieldName = 'documento_lugarentrega'
      Size = 100
    end
    object StringField7: TStringField
      FieldName = 'documento_tipooperacion'
      Size = 45
    end
    object StringField8: TStringField
      FieldName = 'documento_condicioncalidad'
      Size = 45
    end
    object StringField9: TStringField
      FieldName = 'documento_tipodestino'
      Size = 45
    end
    object IntegerField7: TIntegerField
      FieldName = 'documento_numerocartaporte'
    end
    object FloatField16: TFloatField
      FieldName = 'documento_kgbrutos'
    end
    object FloatField17: TFloatField
      FieldName = 'documento_tara'
    end
    object IntegerField8: TIntegerField
      FieldName = 'tipodocu_id_1'
      Required = True
    end
    object StringField10: TStringField
      FieldName = 'tipodocu_nombre'
      Size = 45
    end
    object StringField11: TStringField
      FieldName = 'tipodocu_tipo'
      Size = 45
    end
    object IntegerField9: TIntegerField
      FieldName = 'tipodocu_caja'
    end
    object IntegerField10: TIntegerField
      FieldName = 'tipodocu_stock'
    end
    object IntegerField11: TIntegerField
      FieldName = 'tipodocu_iva'
    end
    object IntegerField12: TIntegerField
      FieldName = 'tipodocu_fiscal'
    end
    object IntegerField13: TIntegerField
      FieldName = 'tipodocu_ultimonumero'
    end
    object StringField12: TStringField
      FieldName = 'tipodocu_letra'
      Size = 45
    end
    object StringField13: TStringField
      FieldName = 'tipodocu_debcred'
      Size = 45
    end
    object IntegerField14: TIntegerField
      FieldName = 'tipodocu_preimpresos'
    end
    object StringField14: TStringField
      FieldName = 'tipodocu_impresora'
      Size = 200
    end
    object IntegerField15: TIntegerField
      FieldName = 'tipodocu_copias'
    end
    object IntegerField16: TIntegerField
      FieldName = 'tipodocu_preview'
    end
    object IntegerField17: TIntegerField
      FieldName = 'tipodocu_prompt'
    end
    object IntegerField18: TIntegerField
      FieldName = 'tipodocu_ctacte'
    end
    object StringField15: TStringField
      FieldName = 'tipodocu_archivoimpresion'
      Size = 100
    end
    object StringField16: TStringField
      FieldName = 'tipodocu_leyenda'
      Size = 200
    end
    object StringField17: TStringField
      FieldName = 'tipodocu_nombreabrev'
      Size = 5
    end
    object IntegerField19: TIntegerField
      FieldName = 'tipodocu_manual'
    end
    object IntegerField20: TIntegerField
      FieldName = 'puntoventa_id'
      Required = True
    end
    object StringField18: TStringField
      FieldName = 'tipodocu_tipoctacte'
      Size = 45
    end
    object IntegerField21: TIntegerField
      FieldName = 'puntoventa_id_1'
      Required = True
    end
    object IntegerField22: TIntegerField
      FieldName = 'puntoventa_numero'
    end
    object StringField19: TStringField
      FieldName = 'puntoventa_descripcion'
      Size = 45
    end
    object IntegerField23: TIntegerField
      FieldName = 'puntoventa_controladorfiscalmodelo'
    end
    object IntegerField24: TIntegerField
      FieldName = 'puntoventa_controladorfiscalpuerto'
    end
    object IntegerField25: TIntegerField
      FieldName = 'sucursal_id'
      Required = True
    end
    object IntegerField26: TIntegerField
      FieldName = 'documentodocu_id'
      Required = True
    end
    object FloatField18: TFloatField
      FieldName = 'documentodocu_importe'
    end
    object StringField20: TStringField
      FieldName = 'documentodocu_estado'
      Size = 45
    end
    object FloatField19: TFloatField
      FieldName = 'documentodocu_pagado'
    end
    object FloatField20: TFloatField
      FieldName = 'documentodocu_saldo'
    end
    object IntegerField27: TIntegerField
      FieldName = 'documento_id_1'
      Required = True
    end
    object IntegerField28: TIntegerField
      FieldName = 'documento_idpago'
    end
  end
end
