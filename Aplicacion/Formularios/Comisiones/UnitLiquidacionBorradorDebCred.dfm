inherited LiquidacionBorradorDebCred: TLiquidacionBorradorDebCred
  Caption = 'Debito/Credito'
  ClientHeight = 105
  ClientWidth = 509
  OnShow = FormShow
  ExplicitWidth = 525
  ExplicitHeight = 143
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 509
    Height = 105
    ExplicitWidth = 509
    ExplicitHeight = 105
    FullHeight = 0
    object Label3: TLabel [0]
      Left = 18
      Top = 7
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descripcion'
    end
    object Label1: TLabel [1]
      Left = 39
      Top = 34
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    inherited btncancelar: TButton
      Left = 422
      Top = 54
      Cancel = True
      ModalResult = 2
      TabOrder = 3
      ExplicitLeft = 422
      ExplicitTop = 54
    end
    inherited btnguardar: TButton
      Left = 341
      Top = 54
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btnguardarClick
      ExplicitLeft = 341
      ExplicitTop = 54
    end
    object liquidacionborradordebcred_importe: TMoneyEdit
      Left = 78
      Top = 31
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
      TabOrder = 1
      Version = '1.1.0.1'
    end
    object liquidacionborradordebcred_descripcion: TEdit
      Left = 78
      Top = 4
      Width = 419
      Height = 21
      TabOrder = 0
    end
  end
  inherited ZQSelect: TZQuery
    Left = 376
    Top = 16
  end
  inherited ZQExecSQL: TZQuery
    Left = 256
  end
end
