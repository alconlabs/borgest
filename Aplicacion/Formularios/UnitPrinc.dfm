object Princ: TPrinc
  Left = 0
  Top = 0
  Caption = 'Borgest - Sistema de Gestion Comercial'
  ClientHeight = 591
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MenuPrincipal: TAdvToolBarPager
    Left = 0
    Top = 0
    Width = 1362
    Height = 100
    ActivePage = AdvPageComisiones
    Caption.Visible = False
    Caption.Height = 0
    CaptionButtons = []
    TabGroups = <>
    TabSettings.EndMargin = 0
    ToolBarStyler = AdvToolBarOfficeStyler1
    PageLeftMargin = 0
    PageRightMargin = 0
    TabOrder = 0
    OnChange = MenuPrincipalChange
    object AdvPageArchivo: TAdvPage
      Left = 4
      Top = 26
      Width = 1354
      Height = 69
      Caption = 'Archivo'
      object AdvToolBarGeneral: TAdvToolBar
        Left = 3
        Top = 3
        Width = 406
        Height = 63
        AllowFloating = True
        Caption = 'General'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnpersonal: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Vendedores'
          TabOrder = 0
          Visible = False
          OnClick = btnpersonalClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnproductos: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Productos'
          TabOrder = 1
          OnClick = btnproductosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btncalculoprecios: TAdvGlowButton
          Left = 102
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Calculo Precios'
          TabOrder = 2
          Visible = False
          OnClick = btncalculopreciosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnclientes: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Clientes'
          TabOrder = 3
          OnClick = btnclientesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnpoliticaprecio: TAdvGlowButton
          Left = 102
          Top = 65
          Width = 114
          Height = 41
          Caption = 'Politicas de Precios'
          TabOrder = 4
          Visible = False
          OnClick = btnpoliticaprecioClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnservicios: TAdvGlowButton
          Left = 102
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Servicios'
          TabOrder = 5
          Visible = False
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnconceptosdebcred: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Conceptos Deb/Cred'
          TabOrder = 6
          OnClick = btnconceptosdebcredClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btntarjetas: TAdvGlowButton
          Left = 302
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Tarjetas de Credito'
          TabOrder = 7
          OnClick = btntarjetasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarProveedores: TAdvToolBar
        Left = 412
        Top = 3
        Width = 106
        Height = 63
        AllowFloating = True
        Caption = 'Proveedores'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnproveedores: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Proveedores'
          TabOrder = 0
          OnClick = btnproveedoresClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarLocalidades: TAdvToolBar
        Left = 521
        Top = 3
        Width = 206
        Height = 63
        AllowFloating = True
        Caption = 'Localidades'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnlocalidades: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Localidades'
          TabOrder = 0
          OnClick = btnlocalidadesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnprovincias: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Provincias'
          TabOrder = 1
          OnClick = btnprovinciasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarEmpresa: TAdvToolBar
        Left = 730
        Top = 3
        Width = 406
        Height = 63
        AllowFloating = True
        Caption = 'Empresa'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnempresa: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Empresa'
          TabOrder = 0
          OnClick = btnempresaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnsucursales: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Sucursales'
          TabOrder = 1
          OnClick = btnsucursalesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnpuntosdeventa: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Puntos de Venta'
          TabOrder = 2
          OnClick = btnpuntosdeventaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btntiposdocumentos: TAdvGlowButton
          Left = 302
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Tipos de Documentos'
          TabOrder = 3
          OnClick = btntiposdocumentosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarListados: TAdvToolBar
        Left = 1139
        Top = 3
        Width = 106
        Height = 63
        AllowFloating = True
        Caption = 'Listados'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnlistaprecios: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Lista de Precios'
          TabOrder = 0
          OnClick = btnlistapreciosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
    end
    object AdvPageCompras: TAdvPage
      Left = 4
      Top = 26
      Width = 1354
      Height = 69
      Caption = 'Compras'
      object AdvToolBarDocCompras: TAdvToolBar
        Left = 3
        Top = 3
        Width = 406
        Height = 63
        AllowFloating = True
        Caption = 'Documentos'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnfacturascompras: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Facturas de Compra'
          TabOrder = 0
          OnClick = btnfacturascomprasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnordenespago: TAdvGlowButton
          Left = 302
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Ordenes de pago'
          TabOrder = 1
          OnClick = btnordenespagoClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnnotasdecreditocompra: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Notas de Credito'
          TabOrder = 2
          OnClick = btnnotasdecreditocompraClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnnotasdedebitocompra: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Notas de Debito'
          TabOrder = 3
          OnClick = btnnotasdedebitocompraClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarCtasCtesCompras: TAdvToolBar
        Left = 412
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Cuenta Corriente'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object BtnDetalleCompras: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Detalle de Ctas.'
          TabOrder = 0
          OnClick = BtnDetalleComprasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnEstadoCompras: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Estado de Ctas.'
          TabOrder = 1
          OnClick = BtnEstadoComprasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnSaldosCompras: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Saldos'
          TabOrder = 2
          OnClick = BtnSaldosComprasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarInformesCompras: TAdvToolBar
        Left = 721
        Top = 3
        Width = 206
        Height = 63
        AllowFloating = True
        Caption = 'Informes'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object AdvGlowButton8: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Estado Caja'
          TabOrder = 0
          Visible = False
          OnClick = btnestadocajaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnlibroivacompras: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Libro IVA Compras'
          TabOrder = 1
          OnClick = btnlibroivacompras02Click
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btninformescompras: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Informes'
          TabOrder = 2
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Enabled = False
        end
      end
      object AdvToolBarStock: TAdvToolBar
        Left = 930
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Stock'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object AdvGlowButton3: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Estado Caja'
          TabOrder = 0
          Visible = False
          OnClick = btnestadocajaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnAjustesdeStock: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Ajustes de Stock'
          TabOrder = 1
          OnClick = BtnAjustesdeStockClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnConsultasStock: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Consultas de Stock'
          TabOrder = 2
          OnClick = BtnConsultasStockClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Enabled = False
        end
        object BtnMovimientosdeStock: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Movimientos de Stock'
          TabOrder = 3
          OnClick = BtnMovimientosdeStockClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
    end
    object AdvPageVentas: TAdvPage
      Left = 4
      Top = 26
      Width = 1354
      Height = 69
      Caption = 'Ventas'
      object AdvToolBarDocVentas: TAdvToolBar
        Left = 3
        Top = 3
        Width = 706
        Height = 63
        AllowFloating = True
        AutoOptionMenu = True
        Caption = 'Documentos'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        OptionMenu = AdvPopupMenu1
        ParentOptionPicture = True
        object btnfacturasventas: TAdvGlowButton
          Left = 302
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Facturas de Venta'
          TabOrder = 0
          Visible = False
          OnClick = btnfacturasventasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnrecibodeventa: TAdvGlowButton
          Left = 302
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Recibos de Venta'
          TabOrder = 1
          OnClick = btnrecibodeventaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnimpresorafiscal: TAdvGlowButton
          Left = 302
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Impresora Fiscal'
          TabOrder = 2
          Visible = False
          OnClick = btnimpresorafiscalClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnnotasdecredito: TAdvGlowButton
          Left = 302
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Notas de Credito'
          TabOrder = 3
          Visible = False
          OnClick = btnnotasdecreditoClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnventasrapidas: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Venta Rapida'
          TabOrder = 4
          OnClick = btnventasrapidasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btncontratacion: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Contratacion'
          TabOrder = 5
          Visible = False
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnnotapedido: TAdvGlowButton
          Left = 102
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Nota de Pedido'
          TabOrder = 6
          Visible = False
          OnClick = btnnotapedidoClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnconsultaequipos: TAdvGlowButton
          Left = 102
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Equipos'
          TabOrder = 7
          Visible = False
          OnClick = btnconsultaequiposClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnservice: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Servicios'
          TabOrder = 8
          Visible = False
          OnClick = btnserviceClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnordenservicio: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Orden de Servicio'
          TabOrder = 9
          OnClick = btnordenservicioClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnpresupuestos: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Presupuestos'
          TabOrder = 10
          OnClick = btnpresupuestosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnnotasdedebito: TAdvGlowButton
          Left = 502
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Notas de Debito'
          TabOrder = 11
          OnClick = btnnotasdedebitoClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnremitos: TAdvGlowButton
          Left = 602
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Remitos'
          TabOrder = 12
          OnClick = btnremitosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnRecibosPendientes: TAdvGlowButton
          Left = 402
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Aplicar Recibos Pendientes'
          TabOrder = 13
          OnClick = btnRecibosPendientesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarCtasCtesVentas: TAdvToolBar
        Left = 712
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Cuenta Corriente'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btndetallectasventas: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Detalle de Ctas.'
          TabOrder = 0
          OnClick = btndetallectasventasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object tbnestadoctasventas: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Estado de Ctas.'
          TabOrder = 1
          OnClick = tbnestadoctasventasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnsaldos: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Saldos'
          TabOrder = 2
          OnClick = btnsaldosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarCaja: TAdvToolBar
        Left = 1021
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Cajas'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btncaja: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Caja'
          TabOrder = 0
          OnClick = btncajaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnestadocaja: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Estado Caja'
          TabOrder = 1
          Visible = False
          OnClick = btnestadocajaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btncajabar: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Caja Bar'
          TabOrder = 2
          OnClick = btncajabarClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnCuponesTarjetas: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Cupones Tarjetas'
          TabOrder = 3
          OnClick = BtnCuponesTarjetasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarInformes: TAdvToolBar
        Left = 1330
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Informes'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btninformesventas: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Informes'
          TabOrder = 0
          OnClick = btninformesventasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object AdvGlowButton2: TAdvGlowButton
          Left = 2
          Top = 65
          Width = 100
          Height = 41
          Caption = 'Estado Caja'
          TabOrder = 1
          Visible = False
          OnClick = btnestadocajaClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btndetallepagos: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Detalle de Pagos'
          TabOrder = 2
          OnClick = btndetallepagosClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnlibroivaventas: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Libro IVA Ventas'
          TabOrder = 3
          OnClick = btnlibroivaventasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
    end
    object AdvPageComisiones: TAdvPage
      Left = 4
      Top = 26
      Width = 1354
      Height = 69
      Caption = 'Comisiones'
      object AdvToolBarComisionesVendedores: TAdvToolBar
        Left = 3
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Vendedores'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btncomisionesvendedores: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Comisiones de Vendedores'
          TabOrder = 0
          OnClick = btncomisionesvendedoresClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnliquidacionesvendedores: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Liquidaciones a Vendedores'
          TabOrder = 1
          OnClick = btnliquidacionesvendedoresClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnvendedoresdebcred: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Vendedores Deb/Cred'
          TabOrder = 2
          OnClick = btnvendedoresdebcredClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarComisionesSucursales: TAdvToolBar
        Left = 312
        Top = 3
        Width = 306
        Height = 63
        AllowFloating = True
        Caption = 'Sucursales'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btncomisionessucursales: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Comisiones de Sucursales'
          TabOrder = 0
          OnClick = btncomisionessucursalesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnliquidacionessucu: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Liquidaciones a Sucursales'
          TabOrder = 1
          OnClick = btnliquidacionessucuClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btndebcredsucursales: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Sucursales Deb/Cred'
          TabOrder = 2
          OnClick = btndebcredsucursalesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarNotasdepedido: TAdvToolBar
        Left = 621
        Top = 3
        Width = 406
        Height = 63
        AllowFloating = True
        Caption = 'Borradores'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnlistanotasdepedido: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Borradores'
          TabOrder = 0
          OnClick = btnlistanotasdepedidoClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnLiquidacionesBorradores: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Liquidaciones Borradores'
          TabOrder = 1
          OnClick = BtnLiquidacionesBorradoresClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnDetalleCuentasBorradores: TAdvGlowButton
          Left = 302
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Detalle de Cuentas'
          TabOrder = 2
          OnClick = BtnDetalleCuentasBorradoresClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnestadoctasborradores: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Estado de Cuentas'
          TabOrder = 3
          OnClick = btnestadoctasborradoresClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
    end
    object AdvPageHerramientas: TAdvPage
      Left = 4
      Top = 26
      Width = 1354
      Height = 69
      Caption = 'Herramientas'
      object AdvToolBarHerramientas: TAdvToolBar
        Left = 3
        Top = 3
        Width = 406
        Height = 63
        AllowFloating = True
        Caption = 'Herramientas'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnimportacion: TAdvGlowButton
          Left = 102
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Actualizar Productos'
          TabOrder = 0
          OnClick = btninformeventasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnconfiguracion: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Configuracion'
          TabOrder = 1
          OnClick = btnconfiguracionClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object BtnConfigurarListas: TAdvGlowButton
          Left = 202
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Configurar Listas'
          TabOrder = 2
          OnClick = BtnConfigurarListasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
        object btnimprimiretiquetas: TAdvGlowButton
          Left = 302
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Imprimir Etiquetas'
          TabOrder = 3
          OnClick = btnimprimiretiquetasClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
      object AdvToolBarSeguridad: TAdvToolBar
        Left = 412
        Top = 3
        Width = 106
        Height = 63
        AllowFloating = True
        Caption = 'Seguridad'
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowCaption = True
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        object btnperfiles: TAdvGlowButton
          Left = 2
          Top = 2
          Width = 100
          Height = 41
          Caption = 'Perfiles de Seguridad'
          TabOrder = 0
          OnClick = btnperfilesClick
          Appearance.BorderColor = 9598070
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15586496
          Appearance.ColorTo = 15128792
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 13152947
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
        end
      end
    end
  end
  object AdvGlowButton1: TAdvGlowButton
    Left = 256
    Top = 160
    Width = 110
    Height = 49
    Caption = 'Borgest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    Appearance.BorderColor = 9598070
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 15586496
    Appearance.ColorTo = 15128792
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 15586496
    Appearance.ColorMirrorTo = 13152947
    Appearance.ColorMirrorHot = 5888767
    Appearance.ColorMirrorHotTo = 10807807
    Appearance.ColorMirrorDown = 946929
    Appearance.ColorMirrorDownTo = 5021693
    Appearance.ColorMirrorChecked = 10480637
    Appearance.ColorMirrorCheckedTo = 5682430
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
    Appearance.GradientHot = ggVertical
    Appearance.GradientMirrorHot = ggVertical
    Appearance.GradientDown = ggVertical
    Appearance.GradientMirrorDown = ggVertical
    Appearance.GradientChecked = ggVertical
    Enabled = False
  end
  object AdvGlowButton4: TAdvGlowButton
    Left = 344
    Top = 231
    Width = 41
    Height = 50
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    Appearance.BorderColor = 9598070
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 15586496
    Appearance.ColorTo = 15128792
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 15586496
    Appearance.ColorMirrorTo = 13152947
    Appearance.ColorMirrorHot = 5888767
    Appearance.ColorMirrorHotTo = 10807807
    Appearance.ColorMirrorDown = 946929
    Appearance.ColorMirrorDownTo = 5021693
    Appearance.ColorMirrorChecked = 10480637
    Appearance.ColorMirrorCheckedTo = 5682430
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
    Appearance.GradientHot = ggVertical
    Appearance.GradientMirrorHot = ggVertical
    Appearance.GradientDown = ggVertical
    Appearance.GradientMirrorDown = ggVertical
    Appearance.GradientChecked = ggVertical
    Enabled = False
    Layout = blGlyphBottom
  end
  object AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    Style = bsOffice2003Silver
    BorderColor = 14668485
    BorderColorHot = 16249843
    ButtonAppearance.Color = 15524577
    ButtonAppearance.ColorTo = 11769496
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = 7293771
    ButtonAppearance.BorderHotColor = 7293771
    ButtonAppearance.BorderCheckedColor = 7293771
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = clHighlight
    CaptionAppearance.CaptionColorTo = clHighlight
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 13432063
    CaptionAppearance.CaptionColorHotTo = 9556223
    CaptionAppearance.CaptionTextColorHot = clBlack
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 15524577
    Color.ColorTo = 11769496
    Color.Direction = gdVertical
    Color.Steps = 16
    ColorHot.Color = 15128792
    ColorHot.ColorTo = 15128792
    ColorHot.Direction = gdVertical
    CompactGlowButtonAppearance.BorderColor = 9598070
    CompactGlowButtonAppearance.BorderColorHot = 10079963
    CompactGlowButtonAppearance.BorderColorDown = 4548219
    CompactGlowButtonAppearance.BorderColorChecked = 4548219
    CompactGlowButtonAppearance.Color = 15586496
    CompactGlowButtonAppearance.ColorTo = 15128792
    CompactGlowButtonAppearance.ColorChecked = 11918331
    CompactGlowButtonAppearance.ColorCheckedTo = 7915518
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 7778289
    CompactGlowButtonAppearance.ColorDownTo = 4296947
    CompactGlowButtonAppearance.ColorHot = 15465983
    CompactGlowButtonAppearance.ColorHotTo = 11332863
    CompactGlowButtonAppearance.ColorMirror = 15586496
    CompactGlowButtonAppearance.ColorMirrorTo = 13152947
    CompactGlowButtonAppearance.ColorMirrorHot = 5888767
    CompactGlowButtonAppearance.ColorMirrorHotTo = 10807807
    CompactGlowButtonAppearance.ColorMirrorDown = 946929
    CompactGlowButtonAppearance.ColorMirrorDownTo = 5021693
    CompactGlowButtonAppearance.ColorMirrorChecked = 10480637
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 15128792
    DockColor.ColorTo = 16249843
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 9598070
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 9598070
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15586496
    GlowButtonAppearance.ColorTo = 15128792
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15586496
    GlowButtonAppearance.ColorMirrorTo = 13152947
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12763842
    GroupAppearance.Color = 13152947
    GroupAppearance.ColorTo = 9598070
    GroupAppearance.ColorMirror = 9598070
    GroupAppearance.ColorMirrorTo = 9598070
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clWhite
    GroupAppearance.CaptionAppearance.CaptionColor = 15128792
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15128792
    GroupAppearance.CaptionAppearance.CaptionTextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColorHot = 13432063
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 9556223
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = clBlack
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 14086910
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.BorderColor = 9598070
    GroupAppearance.TabAppearance.BorderColorHot = 9598070
    GroupAppearance.TabAppearance.BorderColorSelected = 10534860
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10412027
    GroupAppearance.TabAppearance.ColorSelectedTo = 12249340
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 13432063
    GroupAppearance.TabAppearance.ColorHotTo = 13432063
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 13432063
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 9556223
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = clBlack
    GroupAppearance.TabAppearance.TextColorHot = clBlack
    GroupAppearance.TabAppearance.TextColorSelected = clBlack
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.ToolBarAppearance.BorderColor = 13423059
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 15530237
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16382457
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 16249843
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 15128792
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 9598070
    PageAppearance.Color = 16249843
    PageAppearance.ColorTo = 15128792
    PageAppearance.ColorMirror = 15128792
    PageAppearance.ColorMirrorTo = 15128792
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PagerCaption.BorderColor = 15128792
    PagerCaption.Color = 15128792
    PagerCaption.ColorTo = 15128792
    PagerCaption.ColorMirror = 15128792
    PagerCaption.ColorMirrorTo = 15128792
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    RightHandleColor = 13152947
    RightHandleColorTo = 9598070
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 9598070
    TabAppearance.BorderColorSelected = 9598070
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 9598070
    TabAppearance.ColorSelectedTo = 16249843
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 13432063
    TabAppearance.ColorHotTo = 13432063
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 13432063
    TabAppearance.ColorMirrorHotTo = 9556223
    TabAppearance.ColorMirrorSelected = 15128792
    TabAppearance.ColorMirrorSelectedTo = 16249843
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.BackGround.Color = 15128792
    TabAppearance.BackGround.ColorTo = 15128792
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 80
    Top = 128
  end
  object AdvMenuStyler1: TAdvMenuStyler
    Background.Position = bpCenter
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -12
    SelectedItem.Font.Name = 'Segoe UI'
    SelectedItem.Font.Style = []
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -12
    RootItem.Font.Name = 'Segoe UI'
    RootItem.Font.Style = []
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 56
    Top = 376
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.AutoHideChildren = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = clGray
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 15722471
    Settings.Caption.ColorTo = 11176072
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'MS Sans Serif'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clHighlight
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 15524577
    Settings.ColorTo = 11769496
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = clWindowText
    Settings.Font.Height = -11
    Settings.Font.Name = 'MS Sans Serif'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = clNone
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = clBlack
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 12560553
    Settings.StatusBar.ColorTo = 14602191
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2003Silver
    Left = 80
    Top = 192
  end
  object ZBase: TZConnection
    Protocol = 'mysql-5'
    HostName = 'localhost'
    Port = 3306
    Database = 'dbborgest'
    User = 'root'
    Password = 'root'
    Connected = True
    BeforeConnect = ZBaseBeforeConnect
    AfterConnect = ZBaseAfterConnect
    Left = 720
    Top = 128
  end
  object ZQBuscar: TZQuery
    Connection = ZBase
    Params = <>
    Left = 592
    Top = 448
  end
  object ZQCodigo: TZQuery
    Connection = ZBase
    Params = <>
    Left = 592
    Top = 376
  end
  object ZQActualizarStock: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'update articulos set articulo_stock=articulo_stock+:cantidad'
      'where articulo_id=:articulo_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'articulo_id'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'articulo_id'
        ParamType = ptUnknown
      end>
  end
  object ini1: Tini
    IniFilename = 'c:\program files\codegear\rad studio\5.0\bin\config.ini'
    Left = 520
    Top = 432
  end
  object ZQCalculopreciodeta: TZQuery
    Connection = ZBase
    SortedFields = 'calculopreciodeta_orden'
    CachedUpdates = True
    SQL.Strings = (
      'select * from calculopreciodeta '
      'where calculoprecio_id=:calculoprecio_id'
      'order by calculopreciodeta_orden')
    Params = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'calculopreciodeta_orden Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 592
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'calculoprecio_id'
        ParamType = ptUnknown
      end>
  end
  object ZQActualizarSaldoDocumentoVenta: TZQuery
    Connection = ZBase
    SQL.Strings = (
      
        'update documentosventas set documentoventa_estado=if(documentove' +
        'nta_saldo=:importe,"PAGADA",documentoventa_estado),'
      'documentoventa_saldo=documentoventa_saldo-:importe,'
      'documentoventa_pagado=documentoventa_pagado+:importe'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 197
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQRecibos: TZQuery
    Connection = ZBase
    SQL.Strings = (
      
        'update documentoventas set documentoventa_saldo=documentoventa_s' +
        'aldo-:importe,'
      'documentoventa_pagado=documentoventa_pagado+:importe'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 888
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQZQActualizarNumeroDocumento: TZQuery
    Connection = ZBase
    SQL.Strings = (
      
        'update documentosventas set documentoventa_estado=if(documentove' +
        'nta_saldo=:importe,"PAGADA",documentoventa_estado),'
      'documentoventa_saldo=documentoventa_saldo-:importe,'
      'documentoventa_pagado=documentoventa_pagado+:importe'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 888
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentosVentasPendientes: TZQuery
    Connection = ZBase
    SQL.Strings = (
      
        'update documentosventas set documentoventa_estado=if(documentove' +
        'nta_saldo=:importe,"PAGADA",documentoventa_estado),'
      'documentoventa_saldo=documentoventa_saldo-:importe,'
      'documentoventa_pagado=documentoventa_pagado+:importe'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentosventas: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentosventas '
      
        'inner join tiposdocumento on documentosventas.tipodocu_id=tiposd' +
        'ocumento.tipodocu_id '
      
        'inner join clientes on documentosventas.cliente_id=clientes.clie' +
        'nte_id'
      
        'inner join condicioniva on clientes.condicioniva_id=condicioniva' +
        '.condicioniva_id'
      
        'inner join puntodeventa on tiposdocumento.puntoventa_id=puntodev' +
        'enta.puntoventa_id'
      'where documentosventas.documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQdocumentoventadetalles: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentopagos: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentopagos'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 888
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQuery1: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQDocumentosventasABM: TZQuery
    Connection = ZBase
    SQL.Strings = (
      
        'update documentoventas set documentoventa_saldo=documentoventa_s' +
        'aldo-:importe,'
      'documentoventa_pagado=documentoventa_pagado+:importe'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 888
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Pablo\Documents\proyectos\Estetica\relevamiento\pacientes01.' +
      'xls;Mode=Share Deny None;Jet OLEDB:System database="";Jet OLEDB:' +
      'Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine' +
      ' Type=35;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Part' +
      'ial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:Ne' +
      'w Database Password="";Jet OLEDB:Create System Database=False;Je' +
      't OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39#39#39#39't Copy Locale on' +
      ' Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Je' +
      't OLEDB:SFP=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = ADOConnection1BeforeConnect
    Left = 208
    Top = 136
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CommandText = 'Table1$'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 200
    Top = 216
  end
  object OpenDialog1: TOpenDialog
    Left = 64
    Top = 296
  end
  object ZQProductosABM: TZQuery
    Connection = ZBase
    Params = <>
    Left = 888
    Top = 448
  end
  object VCLReport1: TVCLReport
    ConnectionName = 'conexion_prueba'
    AsyncExecution = False
    OnBeforePrint = VCLReport1BeforePrint
    Title = 'Untitled'
    Left = 256
    Top = 192
  end
  object ZQExcecSQL: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 198
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZSQLProcessor1: TZSQLProcessor
    Params = <>
    Connection = ZBase
    Delimiter = ';'
    Left = 592
    Top = 128
  end
  object ZQCalculopreciodetaprod: TZQuery
    Connection = ZBase
    SortedFields = 'calculopreciodetaprod_orden'
    CachedUpdates = True
    SQL.Strings = (
      'select * from calculopreciodetaprod '
      'where producto_id=:producto_id'
      'order by calculopreciodetaprod_orden')
    Params = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'calculopreciodetaprod_orden Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 888
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'producto_id'
        ParamType = ptUnknown
      end>
  end
  object BackupDB1: TBackupDB
    KVersionMySql = 0
    Kbase = ZBase
    Left = 496
    Top = 272
  end
  object ZQDocumentoventadocus: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableDirect = True
    Left = 200
    Top = 296
  end
  object ZQProductos: TZQuery
    Connection = ZBase
    BeforeOpen = ZQProductosBeforeOpen
    SQL.Strings = (
      'select * from productos'
      
        'inner join productodeposito on productos.producto_id=productodep' +
        'osito.producto_id'
      
        'where deposito_id=:deposito_id and productos.producto_id=:produc' +
        'to_id')
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
    Left = 888
    Top = 504
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
  object ZQMenu: TZQuery
    Connection = ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from menu')
    Params = <>
    Left = 464
    Top = 144
  end
  object ZSQLMonitor1: TZSQLMonitor
    MaxTraceCount = 100
    Left = 280
    Top = 352
  end
  object ZQdocumentocompradetalles: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentocompradetalles'
      
        'inner join productos on documentocompradetalles.producto_id=prod' +
        'uctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentocompra_id=:documentocompra_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
    Left = 1096
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentocompra_id'
        ParamType = ptUnknown
      end>
  end
  object RpClientDataset1: TRpClientDataset
    Aggregates = <>
    MasterSource = estadoctas.DSCPendientes
    PacketRecords = 0
    Params = <>
    Left = 184
    Top = 384
  end
  object AdvPopupMenu1: TAdvPopupMenu
    MenuStyler = AdvMenuStyler1
    Version = '2.0.0.0'
    Left = 264
    Top = 272
    object aver1: TMenuItem
      Caption = 'a ver'
    end
    object aver21: TMenuItem
      Caption = 'a ver2'
    end
    object aver31: TMenuItem
      Caption = 'aver3'
    end
    object aver41: TMenuItem
      Caption = 'aver4'
    end
  end
  object Encriptador1: TEncriptador
    MetodoEncriptado = 1
    Left = 512
    Top = 200
  end
  object GTBUtilidades1: TGTBUtilidades
    Left = 512
    Top = 368
  end
  object Permisos1: TPermisos
    abm = 0
    ConfSqlConnection = ZBase
    ConfIni = ini1
    Left = 400
    Top = 472
  end
  object ZQRecargoTarjetas: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select *, '
      
        'ROUND((:importe*tarjetacuotas.tarjetacuota_recargo/100),2) as im' +
        'porte, '
      
        'ROUND((:importe+(:importe*tarjetacuotas.tarjetacuota_recargo/100' +
        '))/:cuotas,2) as cuota_importe'
      'from tarjetas'
      
        'inner join tarjetacuotas on tarjetas.tarjeta_id=tarjetacuotas.ta' +
        'rjeta_id'
      'where tarjetas.tarjeta_id=:tarjeta_id and'
      'tarjetacuotas.tarjetacuota_desde<=:cuotas and'
      'tarjetacuotas.tarjetacuota_hasta>=:cuotas')
    Params = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cuotas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tarjeta_id'
        ParamType = ptUnknown
      end>
    Left = 1088
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'importe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cuotas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tarjeta_id'
        ParamType = ptUnknown
      end>
  end
  object ZQpagotarjeta: TZQuery
    Connection = ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select pagotarjeta.* from pagotarjeta'
      
        'inner join documentopagos on pagotarjeta.documentopago_id=docume' +
        'ntopagos.documentopago_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object ZQConfigcolumnas: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from configcolumnas'
      
        'inner join configcolumnadetalles on configcolumnas.configcolumna' +
        '_id=configcolumnadetalles.configcolumna_id'
      'where configcolumnas.configcolumna_grilla=:configcolumna_grilla')
    Params = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
    Left = 1192
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'configcolumna_grilla'
        ParamType = ptUnknown
      end>
  end
  object ZQProcedimientosAlmacenados: TZQuery
    Connection = ZBase
    Params = <>
    Left = 248
    Top = 472
  end
  object ZQOrdendePago: TZQuery
    Connection = ZBase
    Params = <>
    Left = 1096
    Top = 136
  end
  object ZQActualizarSaldoDocumentoCompra: TZQuery
    Connection = ZBase
    Params = <>
    Left = 1096
    Top = 221
  end
  object ZQDocumentocompradocus: TZQuery
    Connection = ZBase
    SQL.Strings = (
      'select * from documentoventadetalles'
      
        'inner join productos on documentoventadetalles.producto_id=produ' +
        'ctos.producto_id'
      'inner join tipoiva on productos.tipoiva_id=tipoiva.tipoiva_id'
      'where documentoventa_id=:documentoventa_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
    Left = 1096
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'documentoventa_id'
        ParamType = ptUnknown
      end>
  end
  object TablaTemporal1: TTablaTemporal
    Confbase = ZBase
    Left = 600
    Top = 520
  end
end
