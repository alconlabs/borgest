inherited CajaBar: TCajaBar
  Caption = 'Caja Bar'
  ClientHeight = 517
  ClientWidth = 999
  OnShow = FormShow
  ExplicitWidth = 1015
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 999
    Height = 517
    StatusBar.BevelInner = True
    StatusBar.Text = 
      'F3 - Abrir mesa               F4 - Agregar Detalle              ' +
      ' F5 - Actualizar               F6 - Cerrar Mesa               F7' +
      ' - Facturar'
    ExplicitWidth = 999
    ExplicitHeight = 517
    FullHeight = 0
    object Label2: TLabel [0]
      Left = 838
      Top = 448
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Saldo Caja'
    end
    object caja_estado: TLabel [1]
      Left = 774
      Top = 448
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Saldo Caja'
    end
    object caja_saldofinal: TDBAdvEdit [2]
      Left = 895
      Top = 445
      Width = 87
      Height = 21
      TabStop = False
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
    object btncerrarcaja: TButton [3]
      Left = 907
      Top = 469
      Width = 75
      Height = 25
      Caption = 'Cerrar Caja'
      TabOrder = 1
      OnClick = btncerrarcajaClick
    end
    object PageControl1: TPageControl [4]
      Left = 0
      Top = 0
      Width = 999
      Height = 441
      ActivePage = TabVentas
      Align = alTop
      TabOrder = 2
      object TabVentas: TTabSheet
        Caption = 'Ventas'
        object Label3: TLabel
          Left = 415
          Top = 10
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Producto'
        end
        object Label1: TLabel
          Left = 6
          Top = 10
          Width = 57
          Height = 13
          Caption = 'Mozo/Mesa'
        end
        object btnfacturar: TButton
          Left = 312
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Facturar'
          TabOrder = 0
          OnClick = btnfacturarClick
        end
        object btncerrarmesa: TButton
          Left = 231
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Cerrar Mesa'
          TabOrder = 1
          OnClick = btncerrarmesaClick
        end
        object btnagregardetalle: TButton
          Left = 882
          Top = 5
          Width = 92
          Height = 25
          Caption = 'Agregar Detalle'
          TabOrder = 2
          OnClick = btnagregardetalleClick
        end
        object ventadetalle_preciounitario: TDBAdvEdit
          Left = 831
          Top = 7
          Width = 45
          Height = 21
          TabStop = False
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
          TabOrder = 3
          Text = '0,00'
          Visible = True
          Version = '2.7.0.5'
        end
        object producto_nombre: TEdit
          Left = 532
          Top = 7
          Width = 293
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 4
        end
        object producto_id: TEditCodi
          Left = 464
          Top = 7
          Width = 66
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
          OnKeyDown = producto_idKeyDown
          OnKeyPress = producto_idKeyPress
          Version = '1.3.0.1'
          ButtonStyle = bsButton
          ButtonWidth = 16
          Etched = False
          OnClickBtn = producto_idClickBtn
          abm = False
          ConfCampoCodigo = 'producto_id'
          ConfCampoTexto = 'producto_nombre'
          ConfSqlConnection = Princ.ZBase
          ConfSql.Strings = (
            'select * from productos'
            'order by producto_nombre')
          ConfTexto = producto_nombre
          AfterSearch = producto_idAfterSearch
          ConfIni = Princ.ini1
          ConfLimpiar = True
          ConfSearchLimpio = True
          ConfCampoBusqueda1 = 'producto_id'
        end
        object btnabrirmesa: TButton
          Left = 151
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Abrir Mesa'
          TabOrder = 6
          OnClick = btnabrirmesaClick
        end
        object mozomesa: TEdit
          Left = 69
          Top = 7
          Width = 76
          Height = 21
          TabOrder = 7
          OnKeyDown = mozomesaKeyDown
        end
        object TDBGrid
          Left = 453
          Top = 36
          Width = 525
          Height = 201
          DataSource = DSCDocumentoventadetalles
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'producto_id'
              Title.Caption = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_descripcion'
              Title.Caption = 'Descripcion'
              Width = 351
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventadetalle_total'
              Title.Caption = 'Importe'
              Visible = True
            end>
        end
        object DBGrid1: TDBGrid
          Left = 6
          Top = 34
          Width = 441
          Height = 328
          DataSource = DCSDocumentosventas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'documentoventa_observacion'
              Title.Caption = 'Mozo/Mesa'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_hora'
              Title.Caption = 'Hora'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'personal_nombre'
              Title.Caption = 'Mozo'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_estado'
              Title.Caption = 'Estado'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'documentoventa_total'
              Title.Caption = 'Total'
              Visible = True
            end>
        end
        object btnpasarmesa: TButton
          Left = 6
          Top = 365
          Width = 155
          Height = 25
          Caption = 'Pasar Mesa'
          TabOrder = 10
          OnClick = btnpasarmesaClick
        end
      end
      object TabIngrEgr: TTabSheet
        Caption = 'Ingresos/Egresos'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 490
          Height = 193
          Caption = 'Ingresos'
          Color = 15524577
          ParentBackground = False
          ParentColor = False
          TabOrder = 0
          object Label4: TLabel
            Left = 296
            Top = 170
            Width = 86
            Height = 13
            Caption = 'SubTotal Ingresos'
          end
          object DBGrid2: TDBGrid
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
          end
          object Button4: TButton
            Left = 106
            Top = 164
            Width = 51
            Height = 25
            Caption = 'Borrar'
            TabOrder = 3
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
          Left = 490
          Top = 0
          Width = 490
          Height = 193
          Caption = 'Egresos'
          Color = 15524577
          ParentBackground = False
          ParentColor = False
          TabOrder = 1
          object Label5: TLabel
            Left = 304
            Top = 170
            Width = 84
            Height = 13
            Caption = 'SubTotal Egresos'
          end
          object DBGrid3: TDBGrid
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
          end
          object Button6: TButton
            Left = 58
            Top = 164
            Width = 51
            Height = 25
            Caption = 'Modificar'
            TabOrder = 2
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
      end
    end
    inherited btncancelar: TButton
      Left = 620
      Top = 466
      TabOrder = 3
      Visible = False
      ExplicitLeft = 620
      ExplicitTop = 466
    end
    inherited btnguardar: TButton
      Left = 539
      Top = 466
      TabOrder = 4
      Visible = False
      ExplicitLeft = 539
      ExplicitTop = 466
    end
    object btnactualizar: TButton
      Left = 419
      Top = 469
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 5
      OnClick = btnactualizarClick
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from cajas'
      'where caja_id=:caja_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'caja_id'
        ParamType = ptUnknown
      end>
    Left = 784
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caja_id'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 488
    Top = 344
  end
  object ZQDocumentosventas: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQDocumentosventasAfterOpen
    SQL.Strings = (
      'select * from documentosventas'
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join personal on documentosventas.personal_id=personal.per' +
        'sonal_id'
      'where documentosventas.tipodocu_id=:tipodocu_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tipodocu_id'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipodocu_id'
        ParamType = ptUnknown
      end>
  end
  object DCSDocumentosventas: TDataSource
    DataSet = ZQDocumentosventas
    OnDataChange = DCSDocumentosventasDataChange
    Left = 152
    Top = 320
  end
  object ZQDocumentoventadetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentoventadetalles'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object DSCDocumentoventadetalles: TDataSource
    DataSet = ZQDocumentoventadetalles
    Left = 880
    Top = 328
  end
  object ZQDocumentoventa: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from documentosventas'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 400
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentopagos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from documentopagos'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 568
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQIngresos: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from cajaasientos'
      
        'inner join conceptos on cajaasientos.concepto_id=conceptos.conce' +
        'pto_id'
      'where caja_id=:caja_id and'
      'cajaasiento_tipo="INGRESO"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'caja_id'
        ParamType = ptUnknown
      end>
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caja_id'
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
      'where caja_id=:caja_id and'
      'cajaasiento_tipo="EGRESO"')
    Params = <
      item
        DataType = ftUnknown
        Name = 'caja_id'
        ParamType = ptUnknown
      end>
    Left = 632
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'caja_id'
        ParamType = ptUnknown
      end>
  end
  object DSCEgresos: TDataSource
    DataSet = ZQEgresos
    Left = 752
    Top = 152
  end
end
