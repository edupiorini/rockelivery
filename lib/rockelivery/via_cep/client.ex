defmodule Rockelivery.ViaCep.Client do
  @moduledoc """
  A Client for obtaining CEP information through www.viacep.com.br API
  """
  use Tesla

  alias Rockelivery.Error
  alias Rockelivery.ViaCep.Behaviour

  @behaviour Behaviour

  @base_url "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  @typedoc """
  A String containing a valid CEP number  e.g 00000-000
  """
  @type cep :: String.t()

  @spec get_cep_info(cep) :: {:ok, map()} | {:error, Error.t()}

  @doc """
  Returns CEP information given a valid `cep` number.

  ## Testing
    By default, it receives a base_url path for ViaCep API,
    but when testing a `url` must be given for localhost simulation

    e.g http://localhost:portnumber

  """
  def get_cep_info(url \\ @base_url, cep) do
    "#{url}#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: %{"erro" => true}}}) do
    {:error, Error.build(:not_found, "CEP not found")}
  end

  defp handle_get({:ok, %Tesla.Env{status: 400, body: _body}}) do
    {:error, Error.build(:bad_request, "Invalid CEP")}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end
end
