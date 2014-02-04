inherited CargaDetallePagos: TCargaDetallePagos
  Caption = 'CargaDetallePagos'
  ExplicitWidth = 557
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    StatusBar.Text = 'Crtl + (Nro pesta'#241'a)'
    FullHeight = 0
    inherited btncancelar: TButton
      Left = 340
      Top = 102
      ExplicitLeft = 340
      ExplicitTop = 102
    end
    inherited btnguardar: TButton
      Left = 259
      Top = 102
      ExplicitLeft = 259
      ExplicitTop = 102
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 541
      Height = 294
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = '1 - Efectivo'
        OnShow = TabSheet1Show
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 38
          Top = 25
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descripcion'
        end
        object Label5: TLabel
          Left = 12
          Top = 49
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a Cobrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 54
          Top = 73
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cobrado'
        end
        object Label3: TLabel
          Left = 59
          Top = 97
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cambio'
        end
        object efectivo_nombre: TEdit
          Left = 100
          Top = 22
          Width = 381
          Height = 21
          TabOrder = 0
          Text = 'Efectivo'
        end
        object efectivo_importe: TMoneyEdit
          Left = 100
          Top = 46
          Width = 109
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
          OnExit = efectivo_importeExit
        end
        object cobrado: TMoneyEdit
          Left = 100
          Top = 70
          Width = 109
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
        end
        object cambio: TMoneyEdit
          Left = 100
          Top = 94
          Width = 109
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
        object btnefectivo: TButton
          Left = 315
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Guardar'
          TabOrder = 4
          OnClick = btnefectivoClick
        end
        object btncancelarefectivo: TButton
          Left = 396
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 5
          OnClick = btncancelarClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = '2 - Tarjetas'
        ImageIndex = 1
        OnShow = TabSheet2Show
        object Label9: TLabel
          Left = 69
          Top = 15
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tarjeta'
        end
        object Label10: TLabel
          Left = 7
          Top = 49
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe a Cobrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 69
          Top = 73
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cuotas'
        end
        object tarjeta_porcinteres: TLabel
          Left = 60
          Top = 97
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = '% interes'
        end
        object Label13: TLabel
          Left = 21
          Top = 121
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Cobrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 311
          Top = 97
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cupon'
        end
        object Label15: TLabel
          Left = 284
          Top = 121
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Autorizacion'
        end
        object Label16: TLabel
          Left = 73
          Top = 153
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Titular'
        end
        object Label17: TLabel
          Left = 83
          Top = 177
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = 'DNI'
        end
        object Label18: TLabel
          Left = 60
          Top = 201
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telefono'
        end
        object Label19: TLabel
          Left = 261
          Top = 49
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe de Cuota'
        end
        object btntarjeta: TButton
          Left = 315
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Guardar'
          TabOrder = 11
          OnClick = btntarjetaClick
        end
        object btncancelartarjeta: TButton
          Left = 396
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 12
          OnClick = btncancelarClick
        end
        object tarjeta_id: TSqlComboBox
          Left = 108
          Top = 12
          Width = 317
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnSelect = tarjeta_idSelect
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from tarjetas'
            'order by tarjeta_nombre')
          Confcampo_codigo = 'tarjeta_id'
          Confcampo_nomb = 'tarjeta_nombre'
          Tag2 = 0
        end
        object tarjeta_acobrar: TMoneyEdit
          Left = 108
          Top = 46
          Width = 109
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
          OnExit = tarjeta_idSelect
        end
        object tarjeta_cuotas: TMoneyEdit
          Left = 108
          Top = 70
          Width = 109
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
          OnExit = tarjeta_idSelect
        end
        object tarjeta_importeinteres: TMoneyEdit
          Left = 108
          Top = 94
          Width = 109
          Height = 21
          TabStop = False
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
        object tarjeta_cobrado: TMoneyEdit
          Left = 108
          Top = 118
          Width = 109
          Height = 21
          TabStop = False
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
          ReadOnly = True
          TabOrder = 4
          Version = '1.1.0.1'
        end
        object tarjeta_cupon: TEdit
          Left = 348
          Top = 94
          Width = 117
          Height = 21
          TabOrder = 6
        end
        object tarjeta_autorizacion: TEdit
          Left = 348
          Top = 118
          Width = 117
          Height = 21
          TabOrder = 7
        end
        object tarjeta_titular: TEdit
          Left = 108
          Top = 150
          Width = 381
          Height = 21
          TabOrder = 8
        end
        object tarjeta_dni: TEdit
          Left = 108
          Top = 174
          Width = 141
          Height = 21
          TabOrder = 9
        end
        object tarjeta_telefono: TEdit
          Left = 108
          Top = 198
          Width = 141
          Height = 21
          TabOrder = 10
        end
        object tarjeta_importecuota: TMoneyEdit
          Left = 348
          Top = 46
          Width = 109
          Height = 21
          TabStop = False
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
          ReadOnly = True
          TabOrder = 5
          Version = '1.1.0.1'
        end
        object btnabmtarjetas: TButton
          Left = 429
          Top = 12
          Width = 21
          Height = 21
          Caption = '...'
          TabOrder = 13
          TabStop = False
          OnClick = btnabmtarjetasClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = '3 - Cheque'
        ImageIndex = 2
        OnShow = TabSheet3Show
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label4: TLabel
          Left = 38
          Top = 25
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descripcion'
        end
        object Label6: TLabel
          Left = 12
          Top = 49
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a Cobrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cheque_nombre: TEdit
          Left = 100
          Top = 22
          Width = 381
          Height = 21
          TabOrder = 0
        end
        object cheque_importe: TMoneyEdit
          Left = 100
          Top = 46
          Width = 109
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
        end
        object btncancelarcheques: TButton
          Left = 396
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btncancelarClick
        end
        object btncheque: TButton
          Left = 315
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Guardar'
          TabOrder = 2
          OnClick = btnchequeClick
        end
      end
      object TabSheet4: TTabSheet
        Caption = '4 - Deposito'
        ImageIndex = 3
        OnShow = TabSheet4Show
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label7: TLabel
          Left = 38
          Top = 25
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descripcion'
        end
        object Label8: TLabel
          Left = 12
          Top = 49
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a Cobrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object deposito_nombre: TEdit
          Left = 100
          Top = 22
          Width = 381
          Height = 21
          TabOrder = 0
        end
        object deposito_importe: TMoneyEdit
          Left = 100
          Top = 46
          Width = 109
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
        end
        object btncancelardeposito: TButton
          Left = 396
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btncancelarClick
        end
        object btndeposito: TButton
          Left = 315
          Top = 222
          Width = 75
          Height = 25
          Caption = 'Guardar'
          TabOrder = 2
          OnClick = btndepositoClick
        end
      end
    end
  end
end
