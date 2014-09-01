inherited ListaMovimientosDepositos: TListaMovimientosDepositos
  Caption = 'Movimientos entre Depositos'
  ExplicitWidth = 950
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
      inherited btnnuevo: TButton
        ExplicitLeft = 0
        ExplicitTop = 0
      end
      inherited btnver: TButton
        ExplicitTop = 205
      end
      inherited btnclonar: TButton
        ExplicitTop = 164
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'movimientodeposito_id'
          Title.Caption = 'Numero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'movimientodeposito_fecha'
          Title.Caption = 'Fecha'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deposito_nombre'
          Title.Caption = 'Destino'
          Width = 517
          Visible = True
        end>
    end
    inherited panelfiltros: TAdvPanel
      FullHeight = 0
    end
  end
  inherited panelabm: TAdvPanel
    FullHeight = 0
  end
  inherited ZQGrilla: TZQuery
    SQL.Strings = (
      'select * from movimientosdepositos'
      
        'inner join depositos on movimientosdepositos.deposito_iddestino=' +
        'depositos.deposito_id'
      'order by movimientodeposito_id desc')
  end
end
