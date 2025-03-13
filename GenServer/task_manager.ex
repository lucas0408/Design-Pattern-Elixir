defmodule TaskManager do
  use GenServer

  # API Cliente
  
  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def add_task(title, description) do
    GenServer.cast(__MODULE__, {:add_task, title, description})
  end

  def complete_task(title) do
    GenServer.cast(__MODULE__, {:complete_task, title})
  end

  def get_tasks() do
    GenServer.call(__MODULE__, :get_tasks)
  end

  def get_task(title) do
    GenServer.call(__MODULE__, {:get_task, title})
  end

  # Callbacks do Servidor
  
  @impl true
  def init(_) do
    # Inicializando com um mapa vazio
    {:ok, %{}}
  end

  @impl true
  def handle_cast({:add_task, title, description}, tasks) do
    new_task = %{
      description: description,
      completed: false,
      created_at: DateTime.utc_now()
    }
    
    updated_tasks = Map.put(tasks, title, new_task)
    
    {:noreply, updated_tasks}
  end

  @impl true
  def handle_cast({:complete_task, title}, tasks) do
    case Map.fetch(tasks, title) do
      {:ok, task} ->
        updated_task = %{task | completed: true}
        updated_tasks = Map.put(tasks, title, updated_task)
        {:noreply, updated_tasks}
      
      :error ->
        # Tarefa não encontrada, mantém o estado inalterado
        {:noreply, tasks}
    end
  end

  @impl true
  def handle_call(:get_tasks, _from, tasks) do
    {:reply, tasks, tasks}
  end

  @impl true
  def handle_call({:get_task, title}, _from, tasks) do
    result = Map.get(tasks, title, :not_found)
    {:reply, result, tasks}
  end

  # Podemos implementar handle_info para lidar com mensagens inesperadas
  @impl true
  def handle_info(msg, state) do
    IO.puts("Recebida mensagem inesperada: #{inspect(msg)}")
    {:noreply, state}
  end

  # Cleanup quando o processo termina
  @impl true
  def terminate(reason, _state) do
    IO.puts("TaskManager está encerrando. Razão: #{inspect(reason)}")
    :ok
  end
end