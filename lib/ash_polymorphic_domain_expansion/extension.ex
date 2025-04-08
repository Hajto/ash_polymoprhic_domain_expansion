defmodule AshPolymorphicDomainExpansion.Extension do
  # TODO Hajto: Replace with Ash argument DSL
  @argument_entity %Spark.Dsl.Entity{
    name: :argument,
    describe: """
    Declares an argument on the action
    """,
    examples: [
      "argument :password_confirmation, :string"
    ],
    target: Ash.Resource.Actions.Argument,
    args: [:name, :type],
    transform: {Ash.Type, :set_type_transformation, []},
    schema: Ash.Resource.Actions.Argument.schema()
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
    entities: [@callback_entity],
    schema: [
      field: [type: :atom]
    ]
  }
  @sections [@domain_expansion]
  use Spark.Dsl.Extension,
    sections: @sections,
    transformers: [
      AshPolymorphicDomainExpansion.Transformers.AddFields,
      AshPolymorphicDomainExpansion.Transformers.AddActions
    ]
end
