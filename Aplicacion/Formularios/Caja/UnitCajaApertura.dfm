inherited CajaApertura: TCajaApertura
  Caption = 'Abrir Nueva Caja'
  ClientHeight = 105
  ClientWidth = 328
  ExplicitWidth = 344
  ExplicitHeight = 143
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Width = 328
    Height = 105
    ExplicitWidth = 328
    ExplicitHeight = 105
    FullHeight = 0
    object Label4: TLabel [0]
      Left = 23
      Top = 18
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Responsable'
    end
    inherited btncancelar: TButton
      Left = 236
      Top = 54
      Cancel = True
      ModalResult = 2
      TabOrder = 2
      ExplicitLeft = 236
      ExplicitTop = 54
    end
    inherited btnguardar: TButton
      Left = 155
      Top = 54
      Caption = 'Aceptar'
      TabOrder = 1
      ExplicitLeft = 155
      ExplicitTop = 54
    end
    object personal_id: TSqlComboBox
      Left = 97
      Top = 15
      Width = 220
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Confbase = Princ.ZBase
      Confsql.Strings = (
        'select * from personal')
      Confcampo_codigo = 'personal_id'
      Confcampo_nomb = 'personal_nombre'
      Tag2 = 0
    end
  end
  inherited ZQSelect: TZQuery
    Left = 72
    Top = 40
  end
  inherited ZQExecSQL: TZQuery
    Left = 8
    Top = 40
  end
end
