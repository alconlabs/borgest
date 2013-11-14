inherited ImprimirEtiquetas: TImprimirEtiquetas
  Caption = 'Imprimir Etiquetas'
  ClientHeight = 375
  ClientWidth = 630
  OnShow = FormShow
  ExplicitWidth = 646
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 630
    Height = 375
    ExplicitTop = -8
    ExplicitWidth = 630
    ExplicitHeight = 391
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 15
      Top = 7
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Producto'
    end
    object Label6: TLabel [1]
      Left = 16
      Top = 31
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object Label1: TLabel [2]
      Left = 428
      Top = 296
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total de etiquetas'
    end
    inherited btncancelar: TButton
      Left = 153
      Top = 295
      Enabled = False
      Visible = False
      ExplicitLeft = 153
      ExplicitTop = 295
    end
    inherited btnguardar: TButton
      Left = 539
      Top = 322
      Caption = 'Imprimir'
      OnClick = btnguardarClick
      ExplicitLeft = 539
      ExplicitTop = 322
    end
    object producto_id: TEditCodi
      Left = 72
      Top = 4
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
      OnClickBtn = producto_idClickBtn
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
      ConfTexto = producto_nombre
      ConfIni = Princ.ini1
      ConfLimpiar = True
      ConfSearchLimpio = True
      ConfCampoBusqueda1 = 'producto_codigo'
    end
    object producto_nombre: TEdit
      Left = 197
      Top = 4
      Width = 417
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
    end
    object imprimiretiqueta_cantidad: TMoneyEdit
      Left = 72
      Top = 28
      Width = 121
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
      TabOrder = 4
      Version = '1.1.0.1'
    end
    object btnagregar: TButton
      Left = 227
      Top = 26
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 5
      OnClick = btnagregarClick
    end
    object DBGrid1: TDBGrid
      Left = 72
      Top = 52
      Width = 542
      Height = 237
      DataSource = DSCEtiquetas
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'imprimiretiqueta_codigo'
          Title.Caption = 'Codigo'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'imprimiretiqueta_descripcion'
          Title.Caption = 'Descripcion'
          Width = 335
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'imprimiretiqueta_cantidad'
          Title.Caption = 'Cantidad'
          Width = 47
          Visible = True
        end>
    end
    object total_etiquetas: TMoneyEdit
      Left = 520
      Top = 293
      Width = 89
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
    object btnquitar: TButton
      Left = 72
      Top = 291
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 8
      OnClick = btnquitarClick
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from imprimiretiquetas')
    Params = <>
    Left = 352
    Top = 144
    ParamData = <>
  end
  inherited ZQExecSQL: TZQuery
    Left = 520
    Top = 192
  end
  object DSCEtiquetas: TDataSource
    DataSet = ZQSelect
    Left = 488
    Top = 104
  end
end
