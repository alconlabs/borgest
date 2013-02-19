inherited CajaAsientoEgreso: TCajaAsientoEgreso
  Caption = 'Egreso de Caja'
  ClientHeight = 131
  ExplicitHeight = 169
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    Height = 131
    ExplicitHeight = 131
    FullHeight = 0
    inherited Label2: TLabel
      Top = 10
      ExplicitTop = 10
    end
    inherited Label15: TLabel
      Left = 422
      Top = 58
      Visible = False
      ExplicitLeft = 422
      ExplicitTop = 58
    end
    inherited Label10: TLabel
      Top = 82
      ExplicitTop = 82
    end
    inherited Label1: TLabel
      Top = 34
      ExplicitTop = 34
    end
    inherited Label21: TLabel
      Top = 58
      ExplicitTop = 58
    end
    inherited Label3: TLabel
      Visible = False
    end
    inherited btncancelar: TButton
      Top = 78
      ExplicitTop = 78
    end
    inherited btnguardar: TButton
      Top = 78
      ExplicitTop = 78
    end
    inherited cajaasiento_fecha: TDateTimePicker
      Top = 7
      ExplicitTop = 7
    end
    inherited cajaasiento_id: TEdit
      Left = 489
      Top = 55
      Width = 40
      Visible = False
      ExplicitLeft = 489
      ExplicitTop = 55
      ExplicitWidth = 40
    end
    inherited cajaasiento_importe: TMoneyEdit
      Top = 79
      ExplicitTop = 79
    end
    inherited cajaasiento_descripcion: TEdit
      Top = 31
      ExplicitTop = 31
    end
    inherited concepto_id: TSqlComboBox
      Top = 55
      ExplicitTop = 55
    end
    inherited cajaasiento_tipo: TComboBox
      ItemIndex = 1
      Text = 'EGRESO'
      Visible = False
    end
  end
  inherited ZQExecSQL: TZQuery
    Left = 344
    Top = 96
  end
end
