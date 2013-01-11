inherited EstadoCaja: TEstadoCaja
  Caption = 'Estado de Caja'
  ClientHeight = 483
  ClientWidth = 1027
  OnShow = FormShow
  ExplicitWidth = 1043
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 1027
    Height = 483
    StatusBar.BevelInner = True
    ExplicitWidth = 1027
    ExplicitHeight = 483
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 784
      Top = 403
      Width = 82
      Height = 16
      Caption = 'Saldo Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 18
      Top = 9
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    inherited btncancelar: TButton
      Left = 876
      Top = 436
      ExplicitLeft = 876
      ExplicitTop = 436
    end
    inherited btnguardar: TButton
      Left = 795
      Top = 436
      Visible = False
      ExplicitLeft = 795
      ExplicitTop = 436
    end
    object GroupBoxVentasContado: TGroupBox
      Left = 16
      Top = 231
      Width = 490
      Height = 193
      Caption = 'Ventas'
      Color = 15524577
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object Label5: TLabel
        Left = 304
        Top = 170
        Width = 79
        Height = 13
        Caption = 'SubTotal Ventas'
      end
      object DBGrid3: TDBGrid
        Left = 2
        Top = 15
        Width = 486
        Height = 147
        Align = alTop
        DataSource = DSCDocumentosventas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid3DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'documentoventa_numero'
            Title.Caption = 'Nro.'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'documentoventa_fecha'
            Title.Caption = 'Fecha'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente_nombre'
            Title.Caption = 'Cliente'
            Width = 294
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'documentopago_importe'
            Title.Caption = 'Importe'
            Width = 49
            Visible = True
          end>
      end
      object SubTotal_ventas: TAdvMoneyEdit
        Left = 392
        Top = 167
        Width = 89
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
        TabOrder = 1
        Text = '0,00'
        Visible = True
        Version = '1.1.0.2'
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
      end
    end
    object GroupBox1: TGroupBox
      Left = 512
      Top = 232
      Width = 490
      Height = 145
      Color = 15524577
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      Visible = False
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 32
      Width = 490
      Height = 193
      Caption = 'Ingresos'
      Color = 15524577
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object Label3: TLabel
        Left = 296
        Top = 170
        Width = 86
        Height = 13
        Caption = 'SubTotal Ingresos'
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 486
        Height = 147
        Align = alTop
        DataSource = DSCIngresos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cajaasiento_id'
            Title.Caption = 'Nro.'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_fecha'
            Title.Caption = 'Fecha'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'concepto_descripcion'
            Title.Caption = 'Descripcion'
            Width = 179
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_descripcion'
            Title.Caption = 'Concepto'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_importe'
            Title.Caption = 'Importe'
            Width = 49
            Visible = True
          end>
      end
      object Button2: TButton
        Left = 6
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Agregar'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 56
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Modificar'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 106
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Borrar'
        TabOrder = 3
        OnClick = Button4Click
      end
      object SubTotal_ingresos: TAdvMoneyEdit
        Left = 392
        Top = 168
        Width = 89
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
        TabOrder = 4
        Text = '0,00'
        Visible = True
        Version = '1.1.0.2'
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
      end
    end
    object GroupBox3: TGroupBox
      Left = 512
      Top = 33
      Width = 490
      Height = 193
      Caption = 'Egresos'
      Color = 15524577
      ParentBackground = False
      ParentColor = False
      TabOrder = 5
      object Label4: TLabel
        Left = 304
        Top = 170
        Width = 84
        Height = 13
        Caption = 'SubTotal Egresos'
      end
      object DBGrid2: TDBGrid
        Left = 2
        Top = 15
        Width = 486
        Height = 147
        Align = alTop
        DataSource = DSCEgresos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cajaasiento_id'
            Title.Caption = 'Nro.'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_fecha'
            Title.Caption = 'Fecha'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'concepto_descripcion'
            Title.Caption = 'Descripcion'
            Width = 179
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_descripcion'
            Title.Caption = 'Concepto'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajaasiento_importe'
            Title.Caption = 'Importe'
            Width = 49
            Visible = True
          end>
      end
      object Button7: TButton
        Left = 108
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Borrar'
        TabOrder = 1
        OnClick = Button7Click
      end
      object Button6: TButton
        Left = 58
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Modificar'
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button5: TButton
        Left = 8
        Top = 164
        Width = 51
        Height = 25
        Caption = 'Agregar'
        TabOrder = 3
        OnClick = Button5Click
      end
      object SubTotal_egresos: TAdvMoneyEdit
        Left = 393
        Top = 167
        Width = 89
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
        TabOrder = 4
        Text = '0,00'
        Visible = True
        Version = '1.1.0.2'
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
      end
    end
    object btnimprimir: TButton
      Left = 16
      Top = 436
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Enabled = False
      TabOrder = 6
    end
    object Button11: TButton
      Left = 512
      Top = 377
      Width = 51
      Height = 25
      Caption = 'Agregar'
      TabOrder = 7
      Visible = False
    end
    object Button12: TButton
      Left = 562
      Top = 377
      Width = 51
      Height = 25
      Caption = 'Modificar'
      TabOrder = 8
      Visible = False
    end
    object Button13: TButton
      Left = 612
      Top = 377
      Width = 51
      Height = 25
      Caption = 'Borrar'
      TabOrder = 9
      Visible = False
    end
    object caja_fecha: TDateTimePicker
      Left = 57
      Top = 6
      Width = 106
      Height = 21
      Date = 40384.000000000000000000
      Time = 40384.000000000000000000
      TabOrder = 10
    end
    object btnvercaja: TButton
      Left = 172
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ver Caja'
      TabOrder = 11
      OnClick = btnvercajaClick
    end
    object total_caja: TAdvMoneyEdit
      Left = 881
      Top = 400
      Width = 121
      Height = 24
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      Text = '0,00'
      Visible = True
      Version = '1.1.0.2'
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
    end
  end
  inherited ZQSelect: TZQuery
    Left = 536
    Top = 448
  end
  inherited ZQExecSQL: TZQuery
    Left = 744
    Top = 448
  end
  object ZQIngresos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cajaasientos'
      
        'inner join conceptos on cajaasientos.concepto_id=conceptos.conce' +
        'pto_id'
      'where cajaasiento_fecha=:cajaasiento_fecha and'
      'cajaasiento_tipo="INGRESO"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
  end
  object DSCIngresos: TDataSource
    DataSet = ZQIngresos
    Left = 256
    Top = 56
  end
  object ZQEgresos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cajaasientos'
      
        'inner join conceptos on cajaasientos.concepto_id=conceptos.conce' +
        'pto_id'
      'where cajaasiento_fecha=:cajaasiento_fecha and'
      'cajaasiento_tipo="EGRESO"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
    Left = 632
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cajaasiento_fecha'
        ParamType = ptUnknown
      end>
  end
  object DSCEgresos: TDataSource
    DataSet = ZQEgresos
    Left = 776
    Top = 72
  end
  object ZQDocumentosventas: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id'
      
        'inner join documentoventadocus on documentosventas.documentovent' +
        'a_id=documentoventadocus.documentoventa_idpago'
      
        'inner join documentosventas docu2 on docu2.documentoventa_id=doc' +
        'umentoventadocus.documentoventa_id'
      
        'inner join documentopagos on documentoventadocus.documentoventa_' +
        'id=documentopagos.documentoventa_id'
      'where docu2.documentoventa_fecha=:documentoventa_fecha')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_fecha'
        ParamType = ptUnknown
      end>
    Left = 112
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_fecha'
        ParamType = ptUnknown
      end>
  end
  object DSCDocumentosventas: TDataSource
    DataSet = ZQDocumentosventas
    Left = 256
    Top = 312
  end
end
