defmodule Enphex.Utils do
  @moduledoc """
  Collection module of various utils needed for Enphex
  """

  def base_url, do: "https://api.enphaseenergy.com/api/v2/"
  def api_key, do: Application.get_env(:enphex, :api_key)
  def user_id, do: Application.get_env(:enphex, :user_id)
  def app_id, do: Application.get_env(:enphex, :app_id)
  def redirect_url, do: Application.get_env(:enphex, :redirect_url)
  def auth_url, do: "https://enlighten.enphaseenergy.com/app_user_auth/new?app_id=#{app_id()}&redirect=#{redirect_url()}"
  def http_opts, do: Application.get_env(:enphex, :http_opts) || []
  def ua, do: Application.get_env(:enphex, :user_agent) || "Enphex <https://github.com/techgaun/enphex>"
  def req_header, do: [{"User-Agent", ua()},
                       {"Accept", "application/json"}]
end
