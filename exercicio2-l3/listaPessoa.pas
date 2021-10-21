unit listaPessoa;

interface
  uses Classes,  Dialogs, Pessoa;

  Type
    TListaPessoa = class

    private
      FListaPessoa : TList;

    public
      constructor Create;
      procedure Adicionar(pPessoa : TPessoa);
      procedure Remover(Index     : Integer);
      function Count: Integer;






    end;
implementation

{ TListaPessoa }

procedure TListaPessoa.Adicionar(pPessoa: TPessoa);
  begin
    FListaPessoa.Add(pPessoa);
  end;

function TListaPessoa.Count: Integer;
  begin
    Result := FListaPessoa.Count;
  end;

constructor TListaPessoa.Create;
  begin
    inherited Create;
    FListaPessoa := TList.Create;
  end;

procedure TListaPessoa.Remover(Index: Integer);
  begin
    if Index < Count then
       FListaPessoa.Delete(Index)
    else
       ShowMessage('Item não encontrado!');

  end;

end.
