defmodule RockeliveryWeb.OrdersView do
  use RockeliveryWeb, :view

  alias Rockelivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created",
      # os campos vão ser repassados automaticamentes através do Jason.Encoder
      order: order
      # que adicionamos no nosso schema user
    }
  end
end
