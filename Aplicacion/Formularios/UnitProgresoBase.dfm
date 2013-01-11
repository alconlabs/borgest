inherited ProgresoBase: TProgresoBase
  Caption = 'Progreso'
  ClientHeight = 86
  OnCreate = FormCreate
  ExplicitWidth = 557
  ExplicitHeight = 124
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Height = 86
    ExplicitHeight = 86
    FullHeight = 0
    object XiProgressBar1: TXiProgressBar [0]
      Left = 16
      Top = 32
      Width = 505
      Height = 16
      ColorBorder = 22144
      BackColorFace = 13036799
      BackColorGrad = clWhite
      ForeColorFace = 10215167
      ForeColorGrad = 31671
      ColorScheme = csDesert
      Max = 100
      Min = 0
      Position = 0
      Step = 10
      Orientation = pbHorizontal
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 12
      Width = 94
      Height = 13
      Caption = 'Detalle del progreso'
    end
    inherited btncancelar: TButton
      Left = 388
      Top = 54
      Visible = False
      ExplicitLeft = 388
      ExplicitTop = 54
    end
    inherited btnguardar: TButton
      Left = 307
      Top = 54
      Visible = False
      ExplicitLeft = 307
      ExplicitTop = 54
    end
  end
  inherited ZQSelect: TZQuery
    Left = 208
    Top = 64
  end
  inherited ZQExecSQL: TZQuery
    Left = 104
    Top = 56
  end
end
