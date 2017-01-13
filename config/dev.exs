use Mix.Config

config :enphex,
  api_key: System.get_env("ENPHASE_API_KEY"),
  user_id: System.get_env("ENPHASE_USER_ID"),
  app_id: System.get_env("ENPHASE_APP_ID"),
  redirect_url: System.get_env("ENPHASE_REDIRECT_URL")
