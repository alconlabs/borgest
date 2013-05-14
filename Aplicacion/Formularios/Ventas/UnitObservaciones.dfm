inherited observaciones: Tobservaciones
  Caption = 'Observaciones'
  ClientHeight = 274
  ClientWidth = 459
  ExplicitWidth = 475
  ExplicitHeight = 312
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 459
    Height = 274
    FullHeight = 0
    inherited btncancelar: TButton
      Left = 380
      Top = 222
      Cancel = True
      TabOrder = 2
      ExplicitLeft = 380
      ExplicitTop = 222
    end
    inherited btnguardar: TButton
      Left = 299
      Top = 222
      TabOrder = 1
      OnClick = btnguardarClick
      ExplicitLeft = 299
      ExplicitTop = 222
    end
    object documentoventa_observacion: TGTBMemo
      Left = 0
      Top = 0
      Width = 459
      Height = 216
      Align = alTop
      Lines.Strings = (
        'documentoventa_observacion')
      TabOrder = 0
      Tag2 = 0
    end
  end
  inherited ZQSelect: TZQuery
    Left = 96
    Top = 168
  end
  inherited ZQExecSQL: TZQuery
    Left = 280
    Top = 64
  end
end
