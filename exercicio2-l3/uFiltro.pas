unit uFiltro;

interface
  uses Classes,  Dialogs;

function  filtro(prListaPessoas: TList; prSexo, prEstadoCivil: String) : string;

implementation

function  filtro(prListaPessoas: TList; prSexo, prEstadoCivil: String) : string;
  begin
    if (prSexo <> '') and (prEstadoCivil <> '') then
      Result := 'Teste ' + prSexo + ' ' + prEstadoCivil;

    Result := 'Teste';

  end;


{ TFiltro }

end.
