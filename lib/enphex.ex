defmodule Enphex do
  @moduledoc """
  Enphex is an Elixir wrapper for [Enphase API](https://developer.enphase.com/docs)
  """
  use Enphex.Api

  def energy_lifetime(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/energy_lifetime", params)
  end

  def envoys(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/envoys", params)
  end

  def systems(params \\ %{}) do
    do_get("systems", params)
  end

  def inventory(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/inventory")
  end

  def monthly_production(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/monthly_production", params)
  end

  def rgm_stats(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/rgm_stats", params)
  end

  def stats(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/stats", params)
  end

  def summary(system_id, params \\ %{}) do
    do_get("systems/#{system_id}/summary", params)
  end
end
