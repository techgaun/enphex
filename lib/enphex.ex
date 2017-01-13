defmodule Enphex do
  @moduledoc """
  Enphex is an Elixir wrapper for [Enphase API](https://developer.enphase.com/docs)

  All the API calls defined here follow the [API documentation](https://developer.enphase.com/docs)
  Please refer to the documentation.

  You can pass a map of URL parameters as the `params` value.

  Currently, `Enphex` requires you to specify `user_id` in your configuration as the authentication flow
  is not implemented on `Enphex` yet. However, to use as API, this implementation is more than enough.
  """
  @type system_id :: pos_integer | binary
  @type params :: map | keyword

  use Enphex.Api
  alias Enphex.Parser

  @doc """
  Returns a time series of energy produced on the system over its lifetime.
  """
  @spec energy_lifetime(system_id, params) :: Parser.response
  def energy_lifetime(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/energy_lifetime", params)
  end

  @doc """
  Returns a listing of all active Envoys currently deployed on the system.
  """
  @spec envoys(system_id, params) :: Parser.response
  def envoys(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/envoys", params)
  end

  @doc """
  Returns a list of systems for which the user can make API requests.

  Pagination and limit must be handled by user right now through the params.
  """
  @spec systems(params) :: Parser.response
  def systems(params \\ %{}) do
    do_get("systems", params)
  end

  @doc """
  Returns a listing of active devices on the given system.
  A device is considered active if it has not been retired in Enlighten.
  “Active” does not imply that the device is currently reporting, producing, or measuring energy.
  """
  @spec inventory(system_id, params) :: Parser.response
  def inventory(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/inventory", params)
  end

  @doc """
  Returns the energy production of the system for the month starting on the given date.
  The start date must be at least one month ago.
  """
  @spec monthly_production(system_id, params) :: Parser.response
  def monthly_production(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/monthly_production", params)
  end

  @doc """
  Returns performance statistics as measured by the revenue-grade meters installed on the specified system.
  """
  @spec rgm_stats(system_id, params) :: Parser.response
  def rgm_stats(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/rgm_stats", params)
  end

  @doc """
  Returns performance statistics for the specified system as reported by microinverters installed on the system.
  """
  @spec stats(system_id, params) :: Parser.response
  def stats(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/stats", params)
  end

  @doc """
  Returns summary information for the specified system.
  """
  @spec summary(system_id, params) :: Parser.response
  def summary(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/summary", params)
  end
end
