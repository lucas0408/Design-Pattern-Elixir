defmodule DesignPattern.Worker do
  use GenServer

  # Inicia o processo
  def start_link(task_name) do
    GenServer.start_link(__MODULE__, task_name, name: via_tuple(task_name))
  end

  defp via_tuple(task_name), do: {:via, Registry, {MyApp.Registry, task_name}}

  @impl true
  def init(task_name) do
    Process.send_after(self(), :work, 1000) # Simula um trabalho recorrente
    {:ok, task_name}
  end

  @impl true
  def handle_info(:work, state) do
    IO.puts("Processando tarefa: #{state}")
    
    if :rand.uniform(5) == 1, do: raise "Erro aleatório!" # Simula falha ocasional

    Process.send_after(self(), :work, 3000) # Agendar próxima execução
    {:noreply, state}
  end
end