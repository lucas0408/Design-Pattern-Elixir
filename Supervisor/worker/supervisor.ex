defmodule DesignPattern.Supervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    children = [
      {Registry, keys: :unique, name: DesignPattern.Registry}, # uso de Registry para registrar workers por nome
      Supervisor.child_spec({DesignPattern.Worker, "Task A"}, id: :task_a, restart: :permanent),
      Supervisor.child_spec({DesignPattern.Worker, "Task B"}, id: :task_b, restart: :permanent)
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end