## Example

```
defmodule TestDomain do
  use Ash.Domain

  resources do
    resource DeleteMe
    resource DeleteMeImpl
  end
end

defmodule DeleteMe do
  use Ash.Resource, extensions: [AshPolymorphicDomainExpansion.Extension], domain: TestDomain

  resource do
    require_primary_key?(false)
  end

  domain_expansion do
    field :poly_field

    callback :lewis do
      argument :name, :string
    end

    callback :kira, :string do
      argument :name, :string
    end
  end

  actions do
    action :test, :string do
    end
  end
end

defmodule DeleteMeImpl do
  use Ash.Resource, domain: TestDomain

  actions do
    action :lewis do
      argument :name, :string

      run fn input, context ->
        IO.puts("Run child")
      end
    end
  end
end
```

and then run:

```
iex(1)> Ash.ActionInput.for_action(DeleteMe, :lewis, %{resource: %DeleteMe{poly_field: DeleteMeImpl}}) |> Ash.run_action
Run child
:ok
```