inherited MostrarExcel: TMostrarExcel
  Caption = 'Archivo Excel'
  ClientHeight = 508
  ClientWidth = 828
  OnShow = FormShow
  ExplicitWidth = 844
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 828
    Height = 508
    ExplicitWidth = 828
    ExplicitHeight = 508
    FullHeight = 0
    object lblfila: TLabel [0]
      Left = 8
      Top = 462
      Width = 23
      Height = 13
      Caption = 'lblfila'
    end
    inherited btncancelar: TButton
      Left = 748
      Top = 462
      Caption = 'Salir'
      ExplicitLeft = 748
      ExplicitTop = 462
    end
    inherited btnguardar: TButton
      Left = 667
      Top = 462
      Visible = False
      ExplicitLeft = 667
      ExplicitTop = 462
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 828
      Height = 456
      Align = alTop
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    DataSet = Princ.ADODataSet1
    OnDataChange = DataSource1DataChange
    Left = 304
    Top = 104
  end
end
