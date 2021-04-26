defmodule RockeliveryWeb.ItemsView do
  use RockeliveryWeb, :view

  alias Rockelivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created",
      # os campos vão ser repassados automaticamentes através do Jason.Encoder
      item: item
      # que adicionamos no nosso schema user
    }
  end
end
