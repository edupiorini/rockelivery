defmodule Rockelivery.Orders.ReportRunner do
  use GenServer

  require Logger

  alias Rockelivery.Orders.Report

  @time 1000 * 60

  # Client
  def start_link(_initial_stack) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server
  @impl true
  def init(state) do
    Logger.info("Report Runner started!")

    schedule_report_generation()
    {:ok, state}
  end

  @impl true
  # Recebe qualquer tipo de mensagem
  def handle_info(:generate, state) do
    Logger.info("Generating Report...")

    Report.create()
    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation() do
    Process.send_after(self(), :generate, @time)
  end
end
