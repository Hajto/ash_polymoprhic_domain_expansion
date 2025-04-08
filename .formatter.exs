# Used by "mix format"
spark_locals_without_parens = [
  callback: 3,
  callback: 4,
  callback_argument: 2,
  callback_argument: 3
]

[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  plugins: [Spark.Formatter],
  parens_without_locals: spark_locals_without_parens,
  export: [
    parens_without_locals: spark_locals_without_parens
  ]
]
