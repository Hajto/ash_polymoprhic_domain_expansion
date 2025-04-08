defmodule AshPolymorphicDomainExpansion.Info do
  use Spark.InfoGenerator,
    extension: AshPolymorphicDomainExpansion.Extension,
    sections: [:domain_expansion]
end
