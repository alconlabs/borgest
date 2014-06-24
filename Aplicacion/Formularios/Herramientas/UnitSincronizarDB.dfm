inherited SincronizarDB: TSincronizarDB
  Caption = 'Sincronizar DB'
  ClientHeight = 531
  ClientWidth = 639
  ExplicitWidth = 655
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 639
    Height = 531
    ExplicitWidth = 639
    ExplicitHeight = 531
    FullHeight = 0
    object servidorlocal: TLabel [0]
      Left = 488
      Top = 32
      Width = 67
      Height = 13
      Caption = 'Servidor local:'
    end
    object servidorremoto: TLabel [1]
      Left = 488
      Top = 51
      Width = 77
      Height = 13
      Caption = 'Servidor remoto:'
    end
    object pclocal: TLabel [2]
      Left = 488
      Top = 67
      Width = 42
      Height = 13
      Caption = 'PC local:'
    end
    inherited btncancelar: TButton
      Left = 524
      Top = 478
      ExplicitLeft = 524
      ExplicitTop = 478
    end
    inherited btnguardar: TButton
      Left = 443
      Top = 478
      ExplicitLeft = 443
      ExplicitTop = 478
    end
    object btnsincronizar: TButton
      Left = 339
      Top = 478
      Width = 98
      Height = 25
      Caption = 'Sincronizar ahora'
      TabOrder = 2
      OnClick = btnsincronizarClick
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 473
      Height = 465
      ActivePage = TabSheet1
      TabOrder = 3
      object TabSheet1: TTabSheet
        Caption = 'Tablas'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object tablasinc_id: TSqlListView
          Left = 0
          Top = 0
          Width = 465
          Height = 401
          Align = alTop
          Columns = <>
          HoverTime = -1
          TabOrder = 0
          ViewStyle = vsReport
          AutoHint = False
          ClipboardEnable = False
          ColumnSize.Save = False
          ColumnSize.Stretch = False
          ColumnSize.Storage = stInifile
          FilterTimeOut = 500
          PrintSettings.FooterSize = 0
          PrintSettings.HeaderSize = 0
          PrintSettings.Time = ppNone
          PrintSettings.Date = ppNone
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.PageNr = ppNone
          PrintSettings.Title = ppNone
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'Tahoma'
          PrintSettings.Font.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'Tahoma'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'Tahoma'
          PrintSettings.FooterFont.Style = []
          PrintSettings.Borders = pbNoborder
          PrintSettings.BorderStyle = psSolid
          PrintSettings.Centered = False
          PrintSettings.RepeatHeaders = False
          PrintSettings.LeftSize = 0
          PrintSettings.RightSize = 0
          PrintSettings.ColumnSpacing = 0
          PrintSettings.RowSpacing = 0
          PrintSettings.Orientation = poPortrait
          PrintSettings.FixedWidth = 0
          PrintSettings.FixedHeight = 0
          PrintSettings.UseFixedHeight = False
          PrintSettings.UseFixedWidth = False
          PrintSettings.FitToPage = fpNever
          PrintSettings.PageNumSep = '/'
          HTMLHint = False
          HTMLSettings.Width = 100
          HeaderHotTrack = False
          HeaderDragDrop = False
          HeaderFlatStyle = False
          HeaderOwnerDraw = False
          HeaderHeight = 13
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          ProgressSettings.ColorFrom = clSilver
          ProgressSettings.FontColorFrom = clBlack
          ProgressSettings.ColorTo = clWhite
          ProgressSettings.FontColorTo = clGray
          SelectionRTFKeep = False
          ScrollHint = False
          SelectionColor = clHighlight
          SelectionTextColor = clHighlightText
          SizeWithForm = False
          SortDirection = sdAscending
          SortShow = False
          SortIndicator = siLeft
          StretchColumn = False
          SubImages = False
          SubItemEdit = False
          SubItemSelect = False
          VAlignment = vtaCenter
          ItemHeight = 13
          SaveHeader = False
          LoadHeader = False
          ReArrangeItems = False
          DetailView.Visible = False
          DetailView.Column = 0
          DetailView.Font.Charset = DEFAULT_CHARSET
          DetailView.Font.Color = clBlue
          DetailView.Font.Height = -11
          DetailView.Font.Name = 'Tahoma'
          DetailView.Font.Style = []
          DetailView.Height = 16
          DetailView.Indent = 0
          DetailView.SplitLine = False
          Version = '1.6.2.2'
          ConfSqlConnection = Princ.ZBase
          ConfField = tiTablasSincronizar
          ConfIni = Princ.ini1
          Tag2 = 0
          ConfTodosCheckeados = False
          ExplicitWidth = 464
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Programar Automatico'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 16
          Top = 136
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object Label2: TLabel
          Left = 16
          Top = 216
          Width = 88
          Height = 13
          Caption = 'Ejecutar desde PC'
        end
        object Label3: TLabel
          Left = 38
          Top = 184
          Width = 66
          Height = 13
          Caption = 'Ejecutar cada'
        end
        object Label4: TLabel
          Left = 190
          Top = 184
          Width = 36
          Height = 13
          Caption = 'minutos'
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 11
          Width = 337
          Height = 102
          Caption = 'Dias'
          TabOrder = 0
          object SINCLUNES: TCheckBox
            Left = 16
            Top = 24
            Width = 65
            Height = 17
            Caption = 'Lunes'
            TabOrder = 0
          end
          object SINCMARTES: TCheckBox
            Left = 128
            Top = 24
            Width = 65
            Height = 17
            Caption = 'Martes'
            TabOrder = 1
          end
          object SICMIERCOLES: TCheckBox
            Left = 232
            Top = 24
            Width = 73
            Height = 17
            Caption = 'Miercoles'
            TabOrder = 2
          end
          object SINCJUEVES: TCheckBox
            Left = 16
            Top = 64
            Width = 65
            Height = 17
            Caption = 'Jueves'
            TabOrder = 3
          end
          object SINCVIERNES: TCheckBox
            Left = 128
            Top = 64
            Width = 65
            Height = 17
            Caption = 'Viernes'
            TabOrder = 4
          end
          object SICSABADO: TCheckBox
            Left = 231
            Top = 64
            Width = 74
            Height = 17
            Caption = 'Sabado'
            TabOrder = 5
          end
        end
        object SINCHORA: TDateTimePicker
          Left = 57
          Top = 132
          Width = 96
          Height = 21
          Date = 41668.000000000000000000
          Time = 41668.000000000000000000
          Kind = dtkTime
          TabOrder = 1
        end
        object PCSINCRONIZADORA: TEdit
          Left = 118
          Top = 213
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object SINCMINUTOS: TEdit
          Left = 118
          Top = 181
          Width = 59
          Height = 21
          TabOrder = 3
        end
        object SINCSTOCK: TCheckBox
          Left = 22
          Top = 158
          Width = 110
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Sincronizar Stock'
          TabOrder = 4
        end
      end
    end
  end
  inherited ZQSelect: TZQuery
    SQL.Strings = (
      'select * from tablassincronizar'
      'where tablasinc_tipooperacion=:tablasinc_tipooperacion'
      'and tablasinc_sincronizar=-1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tablasinc_tipooperacion'
        ParamType = ptUnknown
      end>
    Left = 536
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tablasinc_tipooperacion'
        ParamType = ptUnknown
      end>
  end
  inherited ZQExecSQL: TZQuery
    Left = 536
    Top = 248
  end
  object tiTablasSincronizar: TTitles
    cam_codi = 'tablasinc_id'
    cam_text = 'tablasinc_nombre'
    Titulos.Strings = (
      'Id'
      'Tabla'
      'Ultima Sinc.')
    Campos.Strings = (
      'tablasinc_id'
      'tablasinc_nombre'
      'tablasinc_ultimasinc')
    Memo.Strings = (
      'select * from tablassincronizar'
      'where tablasinc_tipooperacion="EXPORTAR"'
      'order by tablasinc_nombre')
    Left = 536
    Top = 384
  end
  object ZQConfig: TZQuery
    Connection = Princ.ZBase
    SQL.Strings = (
      'select * from config')
    Params = <>
    Left = 536
    Top = 184
  end
end
