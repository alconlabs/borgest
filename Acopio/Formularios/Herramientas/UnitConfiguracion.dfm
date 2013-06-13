object configuracion: Tconfiguracion
  Left = 0
  Top = 0
  Caption = 'Configuraciones'
  ClientHeight = 343
  ClientWidth = 589
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 343
    Align = alClient
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
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object btnactualizar: TButton
      Left = 405
      Top = 311
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = btnactualizarClick
    end
    object btnimprimir: TButton
      Left = 486
      Top = 311
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 587
      Height = 305
      ActivePage = TabSheet4
      Align = alTop
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'General'
        object Label14: TLabel
          Left = 44
          Top = 10
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sucursal por defecto'
        end
        object SUCURSALDEFECTO: TSqlComboBox
          Left = 148
          Top = 7
          Width = 317
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Confbase = Princ.ZBase
          Confsql.Strings = (
            'select * from sucursales'
            'order by sucursal_nombre')
          Confcampo_codigo = 'sucursal_id'
          Confcampo_nomb = 'sucursal_nombre'
          Tag2 = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Compras'
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Caption = 'Ventas'
        ImageIndex = 2
      end
      object TabSheet4: TTabSheet
        Caption = 'Actualizaciones'
        ImageIndex = 3
        object lblVERSIONEXE: TLabel
          Left = 469
          Top = 24
          Width = 59
          Height = 13
          Caption = 'Version EXE'
        end
        object VERSIONDB: TLabel
          Left = 469
          Top = 67
          Width = 53
          Height = 13
          Caption = 'Version DB'
        end
        object btnactualizararchivos: TButton
          Left = 3
          Top = 19
          Width = 163
          Height = 25
          Caption = 'Actualizar Archivos desde Web'
          TabOrder = 0
          OnClick = btnactualizararchivosClick
        end
        object LINKARCHIVOS: TEdit
          Left = 172
          Top = 21
          Width = 293
          Height = 21
          TabOrder = 1
        end
        object btnactualizardb: TButton
          Left = 3
          Top = 62
          Width = 163
          Height = 25
          Caption = 'Actualizar DB desde Web'
          TabOrder = 2
          OnClick = btnactualizardbClick
        end
        object LINKSCRIPTDB: TEdit
          Left = 172
          Top = 64
          Width = 293
          Height = 21
          TabOrder = 3
        end
        object btnactualizardbfile: TButton
          Left = 3
          Top = 94
          Width = 163
          Height = 25
          Caption = 'Actualizar DB desde archivo'
          TabOrder = 4
          OnClick = btnactualizardbfileClick
        end
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = Princ.ZBase
    Params = <>
    Left = 512
    Top = 176
  end
  object ZQConfig: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from config')
    Params = <>
    Left = 448
    Top = 176
  end
end
