defmodule Enphex.Parser do
  @moduledoc """
  Parser to parse all the responses from Enphase API endpoints
  """
  require Logger

  @type status_code :: integer
  @type response :: {:ok, [struct]} | {:ok, struct} | :ok | {:error, map, status_code} | {:error, map} | any

  @doc """
  Parses the response from auth0 api calls
  """
  @spec parse(tuple) :: response
  def parse(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}} when status in [200, 201] ->
        {:ok, Poison.decode!(body)}

      {:ok, %HTTPoison.Response{body: _, headers: _, status_code: 204}} ->
        :ok

      {:ok, %HTTPoison.Response{body: body}, status_code: 409} ->
        %{"period" => period, "period_start" => ps, "period_end" => pe, "limit" => limit} = Poison.decode!(body)
        Logger.debug "period_start: #{period_start}, limit in period: #{limit}"
        {:wait, period, period_end}

      {:ok, %HTTPoison.Response{body: body}, status_code: status} when status in [400, 401, 403, 404, 429] ->
        {:error, Poison.decode!(body)}

      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}} ->
        {:error, body, status}

      {:error, %HTTPoison.Error{id: _, reason: reason}} ->
        {:error, %{reason: reason}}
      _ ->
        response
    end
  end
end
