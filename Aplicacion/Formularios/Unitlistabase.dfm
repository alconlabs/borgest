object listabase: Tlistabase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  ClientHeight = 456
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 934
    Height = 317
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
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object panelbotonera: TAdvPanel
      Left = 831
      Top = 0
      Width = 103
      Height = 296
      Align = alRight
      BevelOuter = bvNone
      Color = 15524577
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
      Styler = Princ.AdvPanelStyler1
      FullHeight = 0
      object btneliminar: TButton
        Left = 0
        Top = 82
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = btneliminarClick
      end
      object btnmodificar: TButton
        Left = 0
        Top = 41
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Modificar'
        TabOrder = 1
        OnClick = btnmodificarClick
      end
      object btnnuevo: TButton
        Left = 0
        Top = 0
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Crear Nuevo'
        TabOrder = 0
        OnClick = btnnuevoClick
      end
      object btnanular: TButton
        Left = 0
        Top = 123
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Anular'
        TabOrder = 3
        Visible = False
        OnClick = btnanularClick
      end
      object btnver: TButton
        Left = 0
        Top = 205
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Ver'
        TabOrder = 4
        Visible = False
      end
      object btnclonar: TButton
        Left = 0
        Top = 164
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Clonar'
        TabOrder = 5
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 246
        Width = 103
        Height = 41
        Align = alTop
        Caption = 'Crea Nuevo   '
        Enabled = False
        TabOrder = 6
        Visible = False
        WordWrap = True
        Glyph.Data = {
          B6090000424DB60900000000000036040000280000002A000000200000000100
          08000000000080050000000000000000000000010000000000001D4202001F42
          05002047000021490000234E040025520100295B0400325D1500345221003062
          0000326500003368000031680500346D00003771000035700100367405003A7C
          02003C7A0000415C3100437D1A004C683C005F645E006B6F69006D7E65007175
          7000408300004084000040840100428701004385050042830E00428801004389
          0300438B0300438A020042880500448B0500448D0500458F0600458E0800468E
          08004E8F11004E8F1D004590080047900A0047910B0046920B0047900E004893
          0E0048910C0048940D0048950E004A951100499710004B971400499810004B98
          14004B9A13004C9A17004C9D16004C9B18004E9E1A005092150052961900559A
          1E0055893000569A2400589D23005E9E32004BA016004DA11A004FA21D004DA5
          19004FA71E004AA914004BAF16004EAA1B004DAD19004FAC1E004CB517004CB6
          17004DB21A004FB11E004DB51A004FB51E004CBB18004EBA1A004EB81C004CBC
          18004DBD1A004DBF19004FBE1D0050B91F0050BD1F0050A3210051A6220054A7
          250051AB210051AE220052AB250057AF2A005BA12A0059A42A005CA128005FA5
          2D0058A92A005DA332005CA8310051B2220051B5220053B3250057B2290056B6
          280051B9220051BD220053BC250057BA29005CB33100629E360063A9330066AC
          39006AAB3E006AAF3F006A8160007491660069B141006FB24A006DB4480072AF
          4C007BA75B007FAC5E004DC119004FC21B004FC41A004EC619004FC01C004EC9
          1A004FCB1B0050C21E0050C61D0050C61B0051CA1D0050CC1B0050CE1B0051CD
          1D0051CF1C0052CD1E0052D01D0051C1200052C6200053C8200058C4290059CF
          270061D231006ACC40007FD55A00818F7C0086A871008AA67C0088BD66008AB5
          760087CA670084DA610094C9770097CE7C0094DF740098D57D00888987009091
          90009F9F9F008CA0840098B48500A2A2A200ADADAD00ABBBA400ADBEA600B1BE
          AA00B2B2B200BDBDBD00A6C18D00AAC59300ADC59D00AEC89900B3CB9F00B0DE
          9B00B3C0AD00B6CEA500B6C0B000B8C1B300BBC6B700BEC5BA00BDCEB400B6D7
          A100BBD1AA00BDD2B200BDE5AB00C0C6BD00C1CFBC00C0D2B600C5D3BF00C4DF
          B400C4E4B500C3EBB200C9E3BA00C9EBBB00CBF1BB00C2C2C200C5CCC200CDCD
          CD00CCD3CA00D2D2D200D9D9D900DBDBDB00DDDDDD00DFDFDF00D2E1C400D7E5
          CA00DAE8CF00DBE7D200DDE0DB00DDEAD300D2F2C500D7F2CB00E0ECD600E3EF
          DB00E2F5DA00E6F0DE00E1E1E100E7E7E700E4E4E400E8EBE700E9EFE600E9E9
          E900EBEBEB00EBEDE900EFEFEF00E8F2E200EBF3E500EFF3EE00EDF5E800EEF6
          EA00E9F8E300F3F3F300F1F1F100F5F5F500F6F6F600F9F9F900FAFAFA00FBFD
          FA00FCFCFB00FDFDFD00FCFCFC00FEFEFE00FFFFFF00FDFEFD00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          ECEAE5E4D6D4D4D4D5D7E6E9ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFE9D7D3CFB2ADA9191617A8AAAEB3D1D5E5ECFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC9D1301020302
          000818D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFE77C04090B0B0B0B0B0B0B0A0515D2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFBE070D0E0E0E0E0E0E0E0E0E0E0E0E06ABFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFAF0C1212121212
          121212121212121212120F7DFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFC6101A1A1A1A1B1B1C1E1B1B1B1B1A1A1A1A1A119FFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFEF141D202020202020B4D82A2020202020
          20201D1D11C8FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF9E21222222
          222225B5FFFFD93F22222222222222232142FFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFEF1F252525262629B7FFFFFFFFDA40262626262525252524C0FF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFB6292928282732B8FFFFFFFFFFFF
          DD412C2C29282829292982FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF832D
          2D2D2E35BBFFFFFFFFFFFFFFFFE0442F2F2F2D2D2D2D2BFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFF7731313337C2FFFFFFFFFFFFFFFFFFFFE16834333333
          313130E8FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF43353636ACFFFFFFFFFF
          EBD0FFFFFFFFFFE369383635353535DBFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFF6639393A45C5FFFFFFEB8167BDFFFFFFFFFFED783A3A393737E0FFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFF7A3D3C3C466BBFFFE77F4B4B6ABCFFFFFFFF
          FFEE793C3B3B3BF0FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFA03E47474949
          6CB1804C4C4C4C65BAFFFFFFFFFFF07B3E3E66FFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFC148484A4D4D4E5252505051515070B1FFFFFFFFFFBB4848A0FF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFF1614A4F4F535254575656595956
          5671B0FFFFFFC76A5F5FC9FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFA4
          6263535558575A5B848484845B5A75AFFFC36562607EFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFF0766D555D5C8885868787878786858875A1716D63
          64CCFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFCA6F725E8B858D89
          89898989898D8B8B5E726E6FA5FFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFB973958B8C898A8F8A8F8F8A8E8C8B957372A2FFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFC498968E8A91909090908F918E96
          9574A7FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFE2
          9C8E93929292949292918E979BCDFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDFA69A949494949499A3CBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2DECEDE
          E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 831
      Height = 296
      Align = alClient
      DataSource = DSCgrilla
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
    end
    object panelfiltros: TAdvPanel
      Left = 0
      Top = 296
      Width = 934
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      Color = 15524577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      Styler = Princ.AdvPanelStyler1
      FullHeight = 0
      object btnfiltrar: TButton
        Left = 831
        Top = 0
        Width = 103
        Height = 21
        Align = alRight
        Caption = 'Filtrar'
        TabOrder = 1
        OnClick = btnfiltrarClick
      end
      object fil_id: TGTBEdit
        Left = 0
        Top = 0
        Width = 85
        Height = 21
        Align = alLeft
        TabOrder = 0
        OnKeyPress = fil_idKeyPress
        Tag2 = 0
      end
    end
  end
  object panelabm: TAdvPanel
    Left = 0
    Top = 336
    Width = 934
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    Color = 15524577
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Visible = False
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
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object btnguardar: TButton
      Left = 755
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
    end
    object btncancelar: TButton
      Left = 755
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btncancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 317
    Width = 934
    Height = 19
    Panels = <
      item
        Text = '0 Registros'
        Width = 110
      end
      item
        Text = 'tipo de busqueda'
        Width = 50
      end>
  end
  object ZQGrilla: TZQuery
    Connection = Princ.ZBase
    AfterOpen = ZQGrillaAfterOpen
    Params = <>
    Left = 160
    Top = 120
  end
  object DSCgrilla: TDataSource
    DataSet = ZQGrilla
    Left = 336
    Top = 128
  end
  object ZQuery2: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 560
    Top = 360
  end
end
