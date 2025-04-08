defmodule AshPolymorphicDomainExpansion.Transformers.AddFields do
  use Spark.Dsl.Transformer

  @impl true
  def transform(dsl) do
    field = Spark.Dsl.Transformer.get_option(dsl, [:domain_expansion], :field)

    Ash.Resource.Builder.add_attribute(dsl, field, :atom)
  end
end
