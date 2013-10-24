inherited NotaPedidoComisiones: TNotaPedidoComisiones
  Caption = 'Borrador'
  ClientHeight = 539
  ClientWidth = 917
  ExplicitWidth = 933
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 917
    Height = 539
    ExplicitWidth = 917
    ExplicitHeight = 539
    FullHeight = 0
    inherited Label2: TLabel
      Left = 757
      ExplicitLeft = 757
    end
    inherited Label4: TLabel
      Left = 627
      ExplicitLeft = 627
    end
    inherited Label8: TLabel
      Left = 580
      ExplicitLeft = 580
    end
    inherited Label12: TLabel
      Left = 598
      ExplicitLeft = 598
    end
    inherited Label13: TLabel
      Left = 375
      Top = 307
      ExplicitLeft = 375
      ExplicitTop = 307
    end
    object lblsaldocomisiones: TLabel [12]
      Left = 239
      Top = 468
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited documentoventa_numero: TEdit
      Left = 455
      Enabled = False
      TabOrder = 16
      Visible = False
      OnChange = documentoventa_numeroChange
      ExplicitLeft = 455
    end
    inherited documentoventa_fecha: TDateTimePicker
      Left = 793
      TabOrder = 17
      ExplicitLeft = 793
    end
    inherited personal_id: TSqlComboBox
      Left = 679
      ExplicitLeft = 679
    end
    inherited btncancelar: TButton
      Left = 835
      Top = 473
      ExplicitLeft = 835
      ExplicitTop = 473
    end
    inherited btnguardar: TButton
      Left = 754
      Top = 473
      ExplicitLeft = 754
      ExplicitTop = 473
    end
    inherited documentoventa_condicionventa: TComboBox
      Left = 679
      ExplicitLeft = 679
    end
    inherited DBGrid1: TDBGrid
      Width = 901
      Columns = <
        item
          Expanded = False
          FieldName = 'documentoventadetalle_cantidad'
          Title.Caption = 'Cant.'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto_id'
          Title.Caption = 'Codigo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_descripcion'
          Title.Caption = 'Producto'
          Width = 349
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_precio'
          Title.Caption = 'Precio Vta.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_importe1'
          Title.Caption = 'Precio Fact.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'diferencia'
          Title.Caption = 'Diferencia'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_total'
          Title.Caption = 'Total Vta.'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documentoventadetalle_totalfact'
          Title.Caption = 'Total Fact.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'diferencia_total'
          Title.Caption = 'Total Dif.'
          Visible = True
        end>
    end
    inherited GroupBox1: TGroupBox
      Left = 679
      Top = 392
      Width = 226
      Height = 73
      ExplicitLeft = 679
      ExplicitTop = 392
      ExplicitWidth = 226
      ExplicitHeight = 73
      inherited Label5: TLabel
        Top = 129
        Enabled = False
        Visible = False
        ExplicitTop = 129
      end
      inherited Label6: TLabel
        Top = 153
        Enabled = False
        Visible = False
        ExplicitTop = 153
      end
      inherited Label7: TLabel
        Top = 129
        Enabled = False
        Visible = False
        ExplicitTop = 129
      end
      inherited Label9: TLabel
        Top = 153
        Enabled = False
        Visible = False
        ExplicitTop = 153
      end
      inherited Label10: TLabel
        Left = 8
        Top = 25
        ExplicitLeft = 8
        ExplicitTop = 25
      end
      inherited documentoventa_neto21: TMoneyEdit
        Top = 126
        Enabled = False
        Visible = False
        ExplicitTop = 126
      end
      inherited documentoventa_iva21: TMoneyEdit
        Top = 150
        Enabled = False
        Visible = False
        ExplicitTop = 150
      end
      inherited documentoventa_neto105: TMoneyEdit
        Top = 126
        Enabled = False
        Visible = False
        ExplicitTop = 126
      end
      inherited documentoventa_iva105: TMoneyEdit
        Top = 150
        Enabled = False
        Visible = False
        ExplicitTop = 150
      end
      inherited documentoventa_total: TMoneyEdit
        Left = 61
        Top = 22
        Width = 148
        ExplicitLeft = 61
        ExplicitTop = 22
        ExplicitWidth = 148
      end
    end
    inherited documentoventa_listaprecio: TComboBox
      Left = 679
      ExplicitLeft = 679
    end
    inherited documentoventa_observacion: TGTBMemo
      Left = 375
      Top = 323
      Width = 281
      Height = 142
      ExplicitLeft = 375
      ExplicitTop = 323
      ExplicitWidth = 281
      ExplicitHeight = 142
    end
    object DBGrid2: TDBGrid
      Left = 4
      Top = 323
      Width = 357
      Height = 142
      TabStop = False
      DataSource = DTSDocuVenDetComisionesVendedores
      TabOrder = 18
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'personal_nombre'
          ReadOnly = True
          Title.Caption = 'Vendedor'
          Width = 178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_importeunit'
          Title.Caption = 'Comision'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'docuvendetcomisionvendedor_total'
          ReadOnly = True
          Title.Caption = 'Total'
          Width = 70
          Visible = True
        end>
    end
    object btnimprimir: TButton
      Left = 4
      Top = 473
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 19
      OnClick = btnimprimirClick
    end
    object btnherramientas: TAdvGlowButton
      Left = 790
      Top = 4
      Width = 44
      Height = 29
      Caption = 'btnherramientas'
      Picture.Data = {
        FFD8FFE000104A46494600010100000100010000FFDB00430009060708070609
        0807080A0A090B0D160F0D0C0C0D1B14151016201D2222201D1F1F2428342C24
        2631271F1F2D3D2D3135373A3A3A232B3F443F384334393A37FFDB0043010A0A
        0A0D0C0D1A0F0F1A37251F253737373737373737373737373737373737373737
        373737373737373737373737373737373737373737373737373737373737FFC0
        0011080019001903012200021101031101FFC400190000020301000000000000
        000000000000000601040507FFC4002810000103020602020203000000000000
        0001020311042100051213314151610614228142A1E1FFC40016010101010000
        0000000000000000000000020104FFC4001D1100030002020300000000000000
        00000000010203110431124161FFDA000C03010002110311003F00EB59A56975
        C72869DC7187814C396095137D1AAFA491DC77FAC465758B0E32D29D71E69E04
        20BB1B8850049048B1100DFD77368CEA80A8B95685B2105003C8795A5040EE60
        C7EFD7118566B3759CD58CBD49430EBAA57D75224A9A00112A16E44C71E0E2B7
        2BB1CE3BB4DCAE87376BD46BDBA5A646E1D50EAA0C2044DCF03D79C5FC51CA76
        9A63EB251B6EA2EB4CCEA9FE53D83FE62F62004FF95D7572F30143494AF3AF7E
        3F5D01274A8C4EE13C58D84F0413E234322F8CB59750A8542F773078EB7AA472
        15D04CF43FBBCF3860C180A355E4CD17C86F12C72B4BDFD335AA7A853CDA5C4E
        8D954EE03623C27BBF60F1EEC71A58306199CFFFD9}
      TabOrder = 20
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Layout = blGlyphTop
      DropDownButton = True
      DropDownMenu = AdvPopupMenu1
    end
    object documentoventa_equipo1: TGTBEdit
      Left = 184
      Top = 36
      Width = 201
      Height = 21
      TabOrder = 15
      Tag2 = 0
      FieldName = 'documentoventa_equipo1'
    end
  end
  inherited ZQDocumentoventadetalles: TZQuery
    OnCalcFields = ZQDocumentoventadetallesCalcFields
    inherited ZQDocumentoventadetallesdocumentoventadetalle_importe1: TFloatField
      DisplayFormat = '0.00'
    end
    object ZQDocumentoventadetallesdiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'diferencia'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ZQDocumentoventadetallesdocumentoventadetalle_totalfact: TFloatField
      FieldKind = fkCalculated
      FieldName = 'documentoventadetalle_totalfact'
      Calculated = True
    end
    object ZQDocumentoventadetallesdiferencia_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'diferencia_total'
      Calculated = True
    end
  end
  inherited DTSDocumentoventadetalle: TDataSource
    OnDataChange = DTSDocumentoventadetalleDataChange
  end
  inherited ZQdocumentoventadocus: TZQuery
    Top = 64
  end
  object ZQPersonal: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from personal')
    Params = <>
    Left = 120
    Top = 352
  end
  object DTSDocuVenDetComisionesVendedores: TDataSource
    DataSet = ZQDocuVenDetComisionesVendedores
    Left = 200
    Top = 344
  end
  object ZQDocuVenDetComisionesVendedores: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    BeforePost = ZQDocuVenDetComisionesVendedoresBeforePost
    AfterPost = ZQDocuVenDetComisionesVendedoresAfterPost
    SQL.Strings = (
      'select docuvendetcomisionesvendedores.*, '
      'personal_nombre, documentoventa_id'
      'from docuvendetcomisionesvendedores'
      
        'inner join personal on docuvendetcomisionesvendedores.personal_i' +
        'd=personal.personal_id'
      
        'inner join documentoventadetalles on docuvendetcomisionesvendedo' +
        'res.documentoventadetalle_id=documentoventadetalles.documentoven' +
        'tadetalle_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    object ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_id: TIntegerField
      FieldName = 'docuvendetcomisionvendedor_id'
    end
    object ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_importeunit: TFloatField
      FieldName = 'docuvendetcomisionvendedor_importeunit'
      DisplayFormat = '0.00'
    end
    object ZQDocuVenDetComisionesVendedoresdocuvendetcomisionvendedor_total: TFloatField
      FieldName = 'docuvendetcomisionvendedor_total'
      DisplayFormat = '0.00'
    end
    object ZQDocuVenDetComisionesVendedoresdocumentoventadetalle_id: TIntegerField
      FieldName = 'documentoventadetalle_id'
    end
    object ZQDocuVenDetComisionesVendedorespersonal_id: TIntegerField
      FieldName = 'personal_id'
    end
    object ZQDocuVenDetComisionesVendedorespersonal_nombre: TStringField
      FieldName = 'personal_nombre'
      Size = 100
    end
    object ZQDocuVenDetComisionesVendedoresdocumentoventa_id: TIntegerField
      FieldName = 'documentoventa_id'
    end
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.0.0.0'
    Left = 440
    Top = 8
    object NotasdePedido1: TMenuItem
      Caption = 'Notas de Pedido'
      OnClick = NotasdePedido1Click
    end
  end
end
