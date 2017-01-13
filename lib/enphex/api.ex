defmodule Enphex.Api do
  @moduledoc """
  The main API module supposed to be used by individual authentication and management API modules
  """

  defmacro __using__(_opts) do
    quote do
      alias Enphex.Parser
      import Enphex.Utils

      def build_url(path, params) do
        params =
          params
          |> Map.put(:key, api_key)
          |> Map.put(:user_id, user_id)
        "#{base_url}#{path}?#{URI.encode_query(params)}"
      end

      def do_get(path, params) when is_map(params) do
        do_request(:get, path, params, "")
      end

      def do_get(path, params) when is_list(params) do
        do_get(path, Enum.into(params, %{}))
      end

      def auth do
        auth_url
        |> HTTPoison.get(req_header, http_opts)
        |> Parser.parse
      end

      defp do_request(method, path, params \\ %{}, req_body \\ "") do
        uri = build_url(path, params)
        method
        |> HTTPoison.request(uri, req_body, req_header, http_opts)
        |> Parser.parse
      end
    end
  end
end
