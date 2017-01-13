use Mix.Config

config :enphex,
  api_key: System.get_env("ENPHASE_API_KEY"),
  user_id: System.get_env("ENPHASE_USER_ID")
