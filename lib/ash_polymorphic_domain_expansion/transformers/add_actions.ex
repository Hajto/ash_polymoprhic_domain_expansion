defmodule AshPolymorphicDomainExpansion.Transformers.AddActions do
  use Spark.Dsl.Transformer

  @impl true
  def transform(dsl) do
    dsl
    |> Spark.Dsl.Transformer.get_entities([:domain_expansion])
    |> Enum.reduce(
      dsl,
      fn callback, dsl_acc ->
        Ash.Resource.Builder.add_action(dsl_acc, :action, callback.name,
          run: &__MODULE__.run_action/2,
          returns: callback.returns,
          arguments: callback.args ++[
            %Ash.Resource.Actions.Argument{
              allow_nil?: false,
              type: Ash.Type.Struct,
              name: :resource,
              sensitive?: false,
            }
          ]
          )
      end
    )
  end

  def run_action(%Ash.ActionInput{action: action} = input, _context) do
    resource_module = input.resource
    implementation_field_name = AshPolymorphicDomainExpansion.Info.domain_expansion_field!(resource_module)
    implementation = input.arguments.resource |> Map.from_struct() |> Map.fetch!(implementation_field_name)

    Ash.ActionInput.for_action(implementation, action.name, input.arguments  |> Map.drop([:resource]))
    |> Ash.run_action()
  end
end
