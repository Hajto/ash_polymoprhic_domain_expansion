# Used by "mix format"
spark_locals_without_parens = [
  allow_nil?: 1,
  argument: 2,
  argument: 3,
  callback: 2,
  callback: 3,
  constraints: 1,
  default: 1,
  description: 1,
  field: 1,
  public?: 1,
  sensitive?: 1
]

[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  plugins: [Spark.Formatter],
  locals_without_parens: spark_locals_without_parens,
  export: [
    locals_without_parens: spark_locals_without_parens
  ],
  import: [:ash]
]
