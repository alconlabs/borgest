inherited listadocumentos: Tlistadocumentos
  Caption = 'Dcoumentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelgrilla: TAdvPanel
    FullHeight = 0
    inherited panelbotonera: TAdvPanel
      FullHeight = 0
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
      'select * from documentos'
      
        'inner join entidadeson documentos.entidad_id=entidades.entidad_i' +
        'd')
  end
end
