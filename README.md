# Enphex

[![Hex version](https://img.shields.io/hexpm/v/enphex.svg "Hex version")](https://hex.pm/packages/enphex) ![Hex downloads](https://img.shields.io/hexpm/dt/enphex.svg "Hex downloads")

> An elixir wrapper for enphase api

## Installation

Specify the package as dependency in `mix.exs`

```elixir
{:enphex, "~> 0.1"}
```

and specify in the list of applications:

```eixir
def applications do
  [applications: [:enphex]]
end
```

## Configuration

```elixir
config :enphex,
  api_key: System.get_env("ENPHASE_API_KEY"),
  user_id: System.get_env("ENPHASE_USER_ID")
```

## Usage

Most of the endpoints accept a system id and optional map of url parameters.
Please refer to `Enphex` documentation for more details

```elixir
Enphex.energy_lifetime(1232, %{production: "all"})
```

## Author

- [techgaun](https://github.com/techgaun)
