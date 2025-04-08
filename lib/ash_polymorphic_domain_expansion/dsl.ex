defmodule AshPolymorphicDomainExpansion.Dsl do
  # TODO Hajto: Replace with Ash argument DSL
  @argument_entity %Spark.Dsl.Entity{
    name: :callback_argument,
    target: AshPolymorphicDomainExpansion.Argument,
    args: [:name, :type],
    schema: [
      # TODO Hajto: Replace atom with Spark type
      name: [type: :atom],
      type: [type: :atom]
    ]
  }
  @callback_entity %Spark.Dsl.Entity{
    name: :callback,
    target: AshPolymorphicDomainExpansion.Callback,
    args: [:name, :returns],
    schema: [
      returns: [
        type: :atom
      ],
      name: [
        type: :atom
      ]
    ],
    entities: [args: [@argument_entity]]
  }
  @domain_expansion %Spark.Dsl.Section{
    name: :domain_expansion,
    entities: [@callback_entity]
  }
  @sections [@domain_expansion]
  use Spark.Dsl.Extension, sections: @sections
end
