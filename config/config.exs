import Config
config :spark, formatter: [remove_parens?: true]
import_config "#{config_env()}.exs"
