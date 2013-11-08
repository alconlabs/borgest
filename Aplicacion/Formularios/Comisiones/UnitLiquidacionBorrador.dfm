inherited LiquidacionBorrador: TLiquidacionBorrador
  Caption = 'LiquidacionBorrador'
  ClientHeight = 353
  ClientWidth = 730
  OnShow = FormShow
  ExplicitWidth = 746
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 730
    Height = 353
    ExplicitWidth = 730
    ExplicitHeight = 353
    FullHeight = 0
    object Label1: TLabel [0]
      Left = 17
      Top = 12
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Numero'
    end
    object Label2: TLabel [1]
      Left = 570
      Top = 12
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Label4: TLabel [2]
      Left = 8
      Top = 36
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor'
    end
    object Label10: TLabel [3]
      Left = 511
      Top = 217
      Width = 47
      Height = 24
      Alignment = taRightJustify
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [4]
      Left = 8
      Top = 249
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    object Label5: TLabel [5]
      Left = 221
      Top = 12
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Equipo'
    end
    inherited btncancelar: TButton
      Left = 628
      Top = 270
      TabOrder = 10
      ExplicitLeft = 628
      ExplicitTop = 270
    end
    inherited btnguardar: TButton
      Left = 547
      Top = 270
      TabOrder = 9
      OnClick = btnguardarClick
      ExplicitLeft = 547
      ExplicitTop = 270
    end
    object liquidacionborrador_id: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object liquidacionborrador_fecha: TDateTimePicker
      Left = 606
      Top = 9
      Width = 106
      Height = 21
      Date = 40384.167574155090000000
      Time = 40384.167574155090000000
      TabOrder = 2
    end
    object personal_id: TSqlComboBox
      Left = 60
      Top = 33
      Width = 354
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal'
        'order by personal_nombre')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 62
      Width = 705
      Height = 150
      DataSource = DTSliquidacionborradordetalles
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_fecha'
          Title.Caption = 'Fecha'
          Width = 80
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'documentoventa_equipo1'
          Title.Caption = 'Numero'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_total'
          Title.Caption = 'Importe'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'liquidacionborradordetalle_pagado'
          Title.Caption = 'Pagado'
          Width = 120
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'liquidacionborradordetalle_saldo'
          Title.Caption = 'Saldo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'liquidacionborradordetalle_importe'
          Title.Caption = 'Cobrado'
          Width = 120
          Visible = True
        end>
    end
    object btnagregar: TButton
      Left = 8
      Top = 218
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 5
      OnClick = btnagregarClick
    end
    object btnquitar: TButton
      Left = 81
      Top = 218
      Width = 75
      Height = 25
      Caption = 'Quitar'
      TabOrder = 6
    end
    object liquidacionborrador_total: TMoneyEdit
      Left = 564
      Top = 214
      Width = 134
      Height = 32
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Version = '1.1.0.1'
    end
    object liquidacionborrador_observaciones: TMemo
      Left = 8
      Top = 264
      Width = 385
      Height = 65
      TabOrder = 7
    end
    object liquidacionborrador_equipo: TEdit
      Left = 260
      Top = 9
      Width = 153
      Height = 21
      TabOrder = 1
    end
  end
  inherited ZQSelect: TZQuery
    AfterOpen = ZQSelectAfterOpen
    SQL.Strings = (
      'select * from liquidacionesborradores'
      'where liquidacionborrador_id=:liquidacionborrador_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionborrador_id'
        ParamType = ptUnknown
      end>
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionborrador_id'
        ParamType = ptUnknown
      end>
  end
  object ZQliquidacionborradordetalles: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from liquidacionborradordetalles'
      
        'inner join docuvendetcomisionesvendedores on liquidacionborrador' +
        'detalles.docuvendetcomisionvendedor_id=docuvendetcomisionesvende' +
        'dores.docuvendetcomisionvendedor_id'
      
        'inner join documentoventadetalles on docuvendetcomisionesvendedo' +
        'res.documentoventadetalle_id=documentoventadetalles.documentoven' +
        'tadetalle_id'
      
        'inner join documentosventas on documentoventadetalles.documentov' +
        'enta_id=documentosventas.documentoventa_id'
      
        'where liquidacionborradordetalles.liquidacionborrador_id=:liquid' +
        'acionborrador_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionborrador_id'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionborrador_id'
        ParamType = ptUnknown
      end>
    object ZQliquidacionborradordetallesliquidacionborradordetalle_id: TIntegerField
      FieldName = 'liquidacionborradordetalle_id'
    end
    object ZQliquidacionborradordetallesliquidacionborradordetalle_importe: TFloatField
      FieldName = 'liquidacionborradordetalle_importe'
    end
    object ZQliquidacionborradordetallesliquidacionborradordetalle_pagado: TFloatField
      FieldName = 'liquidacionborradordetalle_pagado'
    end
    object ZQliquidacionborradordetallesliquidacionborradordetalle_saldo: TFloatField
      FieldName = 'liquidacionborradordetalle_saldo'
    end
    object ZQliquidacionborradordetallesliquidacionborrador_id: TIntegerField
      FieldName = 'liquidacionborrador_id'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_id: TIntegerField
      FieldName = 'docuvendetcomisionvendedor_id'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_id_1: TIntegerField
      FieldName = 'docuvendetcomisionvendedor_id_1'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_importeunit: TFloatField
      FieldName = 'docuvendetcomisionvendedor_importeunit'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_total: TFloatField
      FieldName = 'docuvendetcomisionvendedor_total'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
    end
    object ZQliquidacionborradordetallespersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_saldo: TFloatField
      FieldName = 'docuvendetcomisionvendedor_saldo'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_pagado: TFloatField
      FieldName = 'docuvendetcomisionvendedor_pagado'
    end
    object ZQliquidacionborradordetallesdocuvendetcomisionvendedor_estado: TStringField
      FieldName = 'docuvendetcomisionvendedor_estado'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_id_1: TIntegerField
      FieldName = 'documentoventadetalle_id_1'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_descripcion: TStringField
      FieldName = 'documentoventadetalle_descripcion'
      Size = 150
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_cantidad: TFloatField
      FieldName = 'documentoventadetalle_cantidad'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_precio: TFloatField
      FieldName = 'documentoventadetalle_precio'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_total: TFloatField
      FieldName = 'documentoventadetalle_total'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_neto21: TFloatField
      FieldName = 'documentoventadetalle_neto21'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_iva21: TFloatField
      FieldName = 'documentoventadetalle_iva21'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_neto105: TFloatField
      FieldName = 'documentoventadetalle_neto105'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_iva105: TFloatField
      FieldName = 'documentoventadetalle_iva105'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_nogravado: TFloatField
      FieldName = 'documentoventadetalle_nogravado'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_estado: TStringField
      FieldName = 'documentoventadetalle_estado'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_observacion: TStringField
      FieldName = 'documentoventadetalle_observacion'
      Size = 255
    end
    object ZQliquidacionborradordetallesproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_idorig: TIntegerField
      FieldName = 'documentoventadetalle_idorig'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_cantidadpendiente: TFloatField
      FieldName = 'documentoventadetalle_cantidadpendiente'
    end
    object ZQliquidacionborradordetallesdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_importe1: TFloatField
      FieldName = 'documentoventadetalle_importe1'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_importe2: TFloatField
      FieldName = 'documentoventadetalle_importe2'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_importe3: TFloatField
      FieldName = 'documentoventadetalle_importe3'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_importe4: TFloatField
      FieldName = 'documentoventadetalle_importe4'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_importe5: TFloatField
      FieldName = 'documentoventadetalle_importe5'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_importe6: TFloatField
      FieldName = 'documentoventadetalle_importe6'
    end
    object ZQliquidacionborradordetallesdocumentoventadetalle_listaprecio: TIntegerField
      FieldName = 'documentoventadetalle_listaprecio'
    end
    object ZQliquidacionborradordetallesproducto_tipo: TStringField
      FieldName = 'producto_tipo'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventa_id_1: TIntegerField
      FieldName = 'documentoventa_id_1'
    end
    object ZQliquidacionborradordetallesdocumentoventa_numero: TIntegerField
      FieldName = 'documentoventa_numero'
    end
    object ZQliquidacionborradordetallesdocumentoventa_fecha: TDateField
      FieldName = 'documentoventa_fecha'
    end
    object ZQliquidacionborradordetallesdocumentoventa_hora: TTimeField
      FieldName = 'documentoventa_hora'
    end
    object ZQliquidacionborradordetallesdocumentoventa_neto21: TFloatField
      FieldName = 'documentoventa_neto21'
    end
    object ZQliquidacionborradordetallesdocumentoventa_iva21: TFloatField
      FieldName = 'documentoventa_iva21'
    end
    object ZQliquidacionborradordetallesdocumentoventa_neto105: TFloatField
      FieldName = 'documentoventa_neto105'
    end
    object ZQliquidacionborradordetallesdocumentoventa_iva105: TFloatField
      FieldName = 'documentoventa_iva105'
    end
    object ZQliquidacionborradordetallesdocumentoventa_netonogravado: TFloatField
      FieldName = 'documentoventa_netonogravado'
    end
    object ZQliquidacionborradordetallesdocumentoventa_total: TFloatField
      FieldName = 'documentoventa_total'
    end
    object ZQliquidacionborradordetallesdocumentoventa_estado: TStringField
      FieldName = 'documentoventa_estado'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventa_pagado: TFloatField
      FieldName = 'documentoventa_pagado'
    end
    object ZQliquidacionborradordetallesdocumentoventa_saldo: TFloatField
      FieldName = 'documentoventa_saldo'
    end
    object ZQliquidacionborradordetallesdocumentoventa_observacion: TStringField
      FieldName = 'documentoventa_observacion'
      Size = 255
    end
    object ZQliquidacionborradordetallescliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object ZQliquidacionborradordetallespersonal_id_1: TIntegerField
      FieldName = 'personal_id_1'
    end
    object ZQliquidacionborradordetallestipodocu_id: TIntegerField
      FieldName = 'tipodocu_id'
    end
    object ZQliquidacionborradordetallesdocumentoventa_condicionventa: TIntegerField
      FieldName = 'documentoventa_condicionventa'
    end
    object ZQliquidacionborradordetallesdocumentoventa_fechavenc: TDateField
      FieldName = 'documentoventa_fechavenc'
    end
    object ZQliquidacionborradordetallesdocumentoventa_listaprecio: TIntegerField
      FieldName = 'documentoventa_listaprecio'
    end
    object ZQliquidacionborradordetallesdocumentoventa_equipo1: TStringField
      FieldName = 'documentoventa_equipo1'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventa_equipo2: TStringField
      FieldName = 'documentoventa_equipo2'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventa_formapago: TStringField
      FieldName = 'documentoventa_formapago'
      Size = 255
    end
    object ZQliquidacionborradordetallesdocumentoventa_nrodetallepago: TStringField
      FieldName = 'documentoventa_nrodetallepago'
      Size = 45
    end
    object ZQliquidacionborradordetallesdocumentoventa_solicitudcliente: TStringField
      FieldName = 'documentoventa_solicitudcliente'
      Size = 255
    end
    object ZQliquidacionborradordetallesdocumentoventa_trabajorealizado: TStringField
      FieldName = 'documentoventa_trabajorealizado'
      Size = 255
    end
    object ZQliquidacionborradordetallescaja_id: TIntegerField
      FieldName = 'caja_id'
    end
    object ZQliquidacionborradordetallesdocumentoventa_recargo: TFloatField
      FieldName = 'documentoventa_recargo'
    end
    object ZQliquidacionborradordetallesdocumentoventa_descuento: TFloatField
      FieldName = 'documentoventa_descuento'
    end
    object ZQliquidacionborradordetallesliquidacionborradordetalle_estado: TStringField
      FieldName = 'liquidacionborradordetalle_estado'
      Size = 45
    end
  end
  object DTSliquidacionborradordetalles: TDataSource
    DataSet = ZQliquidacionborradordetalles
    Left = 400
    Top = 152
  end
  object ZQliquidacionborradordetallesanterior: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from liquidacionborradordetalles'
      
        'inner join docuvendetcomisionesvendedores on liquidacionborrador' +
        'detalles.docuvendetcomisionvendedor_id=docuvendetcomisionesvende' +
        'dores.docuvendetcomisionvendedor_id'
      
        'inner join documentoventadetalles on docuvendetcomisionesvendedo' +
        'res.documentoventadetalle_id=documentoventadetalles.documentoven' +
        'tadetalle_id'
      
        'inner join documentosventas on documentoventadetalles.documentov' +
        'enta_id=documentosventas.documentoventa_id'
      
        'where liquidacionborradordetalles.liquidacionborrador_id=:liquid' +
        'acionborrador_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'liquidacionborrador_id'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'liquidacionborrador_id'
        ParamType = ptUnknown
      end>
  end
end
